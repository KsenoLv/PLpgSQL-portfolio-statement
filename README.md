# PostgreSQL's bi.calculate_separate_profit_loss

📈 **Analyzing Your Stock Trades Made Easy!** 📉

## Introduction
Welcome to PostgreSQL's bi.calculate_separate_profit_loss repository! In this space, we simplify the process of understanding how well your stock trades are performing using the powerful PostgreSQL database system.

**Article:** [[Detailed information regarding SingleTrade.sql](https://psql.pro/analyzing-stock-trades-single/)]
<br>
**Article:** [[Detailed information regarding TotalPortfolio.sql](https://psql.pro/analyzing-stock-tradestotal/)]

## What Does the Function Do?
This PostgreSQL function is your financial sidekick, helping you analyze your stock trades effortlessly:

1. **Customizable Settings:** Tell the function when you bought and sold stocks and how much you started with.

2. **Multiple Stocks:** Analyze one or more stocks with ease.

## What Do You Get?
The function provides you with a table filled with essential trade information, such as buy and sell dates, stock symbols, prices, profits or losses, percentages, and more.

## How It Works
It's as easy as 1-2-3:

1. Input Checks: Ensures your input makes sense, avoiding unrealistic scenarios.

2. Data Fetching: Grabs data from a database table.

3. Calculations: Computes vital metrics like profit and loss based on your specified dates.

## Unlock Trading Insights
Discover key metrics to navigate your trading strategy:

1. **Total Trades:** Gauge your trading activity.

2. **Total Profits:** Find out your overall financial gains or losses.

3. **Losses:** Understand your losses in both dollars and percentages.

4. **Profitable Trades:** Determine if you're winning more than losing.

5. **Profit Factor:** Assess the effectiveness of your strategy.

6. **Winning vs. Losing Trades:** Count your victories and losses.

7. **Break-Even Trades:** Identify trades that neither gain nor lose.

8. **Average Trade Results:** Get an idea of your average gains or losses.

9. **Biggest Wins and Losses:** Highlight your strengths and areas for improvement.

10. **Portfolio Size:** See the size of your investment.

11. **Max High and Min Low:** Discover the highest and lowest points your stocks reached during trading.

12. **Max Drawdown (Money and Percentage):** Learn about the biggest dip in your investment value, both in dollars and as a percentage.

Customize your analysis by setting dates, choosing which stocks to include, and manually entering deposit, position values, and tickers. This approach empowers you to make smarter decisions about your trading strategy. Remember, knowledge is your best asset in trading!

## Important Note
To use this function, ensure that your data table structure matches the one described above (Date, Symbols, Open, High, Low, Close). If your columns have different names, you may need to adjust the script accordingly.

| Date       | Symbols | Open  | High  | Low   | Close | ... |
|------------|--------|-------|-------|-------|-------|-----|
| 2023-09-01 | AAPL   | 150.0 | 155.0 | 149.5 | 154.2 | ... |
| 2023-09-02 | GOOG   | 2700.0| 2750.0| 2685.0| 2735.0| ... |
| ...        | ...    | ...   | ...   | ...   | ...   | ... |

## Get Started
Ready to uncover your trading performance? Dive into your data and start analyzing. Happy trading!

## Contact Information

I am in Latvia, Riga.<br>
Phone: +371 29720407<br>
Email: ksenofontov.mihail@gmail.com<br>
Telegram: https://t.me/psqlpro<br>
WhatsApp: https://wa.me/+37129720407<br>
Web: www.psql.pro


