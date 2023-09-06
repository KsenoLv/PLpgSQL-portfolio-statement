SELECT 
	COUNT(*) AS Total_trades, 
	SUM(pl) AS total_net_profit,
	SUM(max_dd_money) AS Total_dd_money,
	SUM(max_dd_percentage) AS Total_dd_percentage,
	ROUND((COUNT(*) FILTER (WHERE pl >= 0) * 100.0 / COUNT(*)), 2) AS percentage_profitable,
	ROUND(SUM(CASE WHEN pl >= 0 THEN pl ELSE 0 END) / ABS(SUM(CASE WHEN pl < 0 THEN pl ELSE 0 END)), 2) AS profit_factor,
	COUNT(CASE WHEN pl < 0 THEN 1 ELSE NULL END) AS total_losing_trades,
	COUNT(CASE WHEN pl > 0 THEN 1 ELSE NULL END) AS total_winning_trades,
	COUNT(CASE WHEN pl = 0 THEN 1 ELSE NULL END) AS total_zero_trades,
	ROUND(AVG(pl), 2) AS average_trade_net_profit,
	MAX(pl) AS largest_winning_trade,
	MIN(pl) AS largest_losing_trade,
	SUM(position_value) AS Total_pos_value
FROM bi.calculate_separate_profit_loss_bi('2023-08-14', '2023-08-17', 500, 10, ARRAY['AENZ', 'ALC', 'ALE', 'A']);
