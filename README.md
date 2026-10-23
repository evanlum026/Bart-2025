# Bart-2025
Using 9.1 million rows of 2025 hourly BART ridership data, I analyzed weekly demand patterns across all 50 stations and built a SQL anomaly detection pipeline that flags unusual ridership days. I then matched the flagged days to real world events such as parades, festivals and a track fire.

# Key Findings 
- **Ridership is concentrated midweek.** Tuesday through Thursday averages around 180,000 riders a day, while Mondays and Fridays average araound 148,000 - 152,000 riders, consistent with hybrid work schedules
- **Weekdays have two sharp commute peaks.** A large spike at 8 am hour and another at 5 pm hour
- **Weekends have far fewer riders.** Saturday and especially Sundays have the least amount of riders with weekend peaks in the late afternoon.

- Anomaly detection pipeline flagged stations closest to real events

| Date | Station | Exits vs. Normal | Event |
|---|---|---|---|
| Sat, Feb 15 | **MONT**, **POWL** | 13,500 vs. 5,512 and 18,987 vs. 9,336 | **SF Chinese New Year Parade** **Montgomery** (closest to the start at Market & 2nd) and **Powell** |
| Sun, May 25 | **24TH**, **16TH** | 9,897 vs. 3,026 and 8,276 vs. 3,144 | **Carnaval SF Grand Parade** in the Mission. **between 16th and 24th**
| Sun, Jun 29 | **CIVC** | 17,683 vs. 4,382 | **SF Pride Parade & Celebration** at **Civic Center** |
