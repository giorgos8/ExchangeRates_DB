CREATE TABLE [dbo].[TRACES] (
    [trc_run_id]     BIGINT         NOT NULL,
    [trc_step_id]    INT            NOT NULL,
    [trc_step_desc]  NVARCHAR (500) NULL,
    [trc_info]       NVARCHAR (500) NULL,
    [trc_input_date] DATETIME2 (7)  CONSTRAINT [df_tbl_traces_trc__trc_input_date] DEFAULT (sysdatetime()) NULL,
    [trc_user]       NVARCHAR (100) CONSTRAINT [df_tbl_traces_trc__trc_user] DEFAULT (suser_sname()) NULL,
    CONSTRAINT [pk_tbl_traces__runid_stepid] PRIMARY KEY CLUSTERED ([trc_run_id] ASC, [trc_step_id] ASC)
);

