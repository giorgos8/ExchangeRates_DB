CREATE TABLE [dbo].[CALENDAR] (
    [Date]          DATE      NOT NULL,
    [Day]           CHAR (10) NOT NULL,
    [DayOfWeek]     TINYINT   NOT NULL,
    [DayOfMonth]    TINYINT   NOT NULL,
    [DayOfYear]     SMALLINT  NOT NULL,
    [PreviousDay]   DATE      NOT NULL,
    [NextDay]       DATE      NOT NULL,
    [WeekOfYear]    TINYINT   NOT NULL,
    [Month]         CHAR (10) NOT NULL,
    [MonthOfYear]   TINYINT   NOT NULL,
    [QuarterOfYear] TINYINT   NOT NULL,
    [Year]          INT       NOT NULL,
    [IsWeekend]     BIT       NOT NULL,
    CONSTRAINT [PK_CalendarDate] PRIMARY KEY CLUSTERED ([Date] ASC)
);

