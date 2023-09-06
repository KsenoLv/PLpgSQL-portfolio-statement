CREATE OR REPLACE FUNCTION bi.calculate_separate_profit_loss_bi(
    buy_date_param DATE,
    sell_date_param DATE,
	deposit NUMERIC DEFAULT 10000,
	shares INT DEFAULT 10,
    symbols_param TEXT[] DEFAULT NULL
)
RETURNS TABLE (
    buy_date DATE,
    sell_date DATE,
    symbols VARCHAR(4),
    open NUMERIC,
    close NUMERIC,
	Max_low NUMERIC,
	Max_high NUMERIC,
    pl NUMERIC,
	roi NUMERIC,
	deposit_param NUMERIC,
    position_value NUMERIC,
	max_dd_money NUMERIC,
	max_dd_percentage NUMERIC
)
AS $$
BEGIN

    -- Validate the 'shares' parameter within the allowed range (10 to 100)
    IF shares < 1 OR shares > 100 THEN
        RAISE EXCEPTION 'Number of shares must be between 1 and 100';
    END IF;
    -- Validate the 'deposit' parameter within the allowed range (100 to 10000)
    IF deposit < 100 OR deposit > 10000 THEN
        RAISE EXCEPTION 'Deposit must be between 100 and 10000';
    END IF;

    RETURN QUERY
    SELECT
        buy.date AS buy_date,
        sell.date AS sell_date,
        buy.symbols AS symbols,
        buy.open AS open,
        sell.close AS close,
		(SELECT MIN(dd.low) FROM bi.pg_table dd WHERE dd.symbols = buy.symbols AND dd.date BETWEEN buy.date AND sell.date) AS Max_low,
		(SELECT MAX(dd.high) FROM bi.pg_table dd WHERE dd.symbols = buy.symbols AND dd.date BETWEEN buy.date AND sell.date) AS Max_high,
        (sell.close - buy.open) * shares AS pl,
		ROUND((((sell.close - buy.open) / buy.open) * deposit), 2) AS roi,
        deposit AS deposit_param,
        (buy.open * shares) AS position_value_2,
		(MAX(buy.open - (SELECT MIN(dd.low) FROM bi.pg_table dd WHERE dd.symbols = buy.symbols AND dd.date BETWEEN buy.date AND sell.date))) * shares AS max_drawdown_money,
		ROUND(((((MAX(buy.open - (SELECT MIN(dd.low) FROM bi.pg_table dd WHERE dd.symbols = buy.symbols AND dd.date BETWEEN buy.date AND sell.date))) * shares) / deposit) * 100), 2) AS max_drawdown_percentage
    FROM
        bi.pg_table AS buy
    JOIN
        bi.pg_table AS sell ON buy.symbols = sell.symbols
    WHERE
        buy.date = buy_date_param AND sell.date = sell_date_param
		AND (symbols_param IS NULL OR (symbols_param @> ARRAY['ALL_T'] OR buy.symbols = ANY(symbols_param)))
    GROUP BY
        buy.date, sell.date, buy.symbols, buy.open, sell.close, buy.low, buy.high, deposit, buy.open, shares
    ORDER BY
        buy.symbols;
END;
$$ LANGUAGE plpgsql;
