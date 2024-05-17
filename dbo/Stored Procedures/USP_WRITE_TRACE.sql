

CREATE PROCEDURE [dbo].[USP_WRITE_TRACE] 
	  @INPUTMESSAGE VARCHAR(1000) = 'EMPTY'
	, @INFO         VARCHAR(500)
	, @RUNID		BIGINT
AS
DECLARE @INPUTSTRING VARCHAR(1000)

BEGIN TRY 

	DECLARE @STEPID BIGINT = (ISNULL((SELECT MAX(trc_step_id) FROM [dbo].[traces] WHERE trc_run_ID = @RUNID),0) + 1)

	INSERT INTO [dbo].[traces] (
		 trc_run_id
		,trc_step_id
		,trc_step_desc
		,trc_info
		,trc_input_date
		,trc_user
	)
	VALUES (
		 @RUNID
		,@STEPID
		,@INPUTMESSAGE
		,@INFO
		,DEFAULT
		,DEFAULT
	)
	RETURN 0
	END TRY

BEGIN CATCH

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorProcedure VARCHAR(200)
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
    DECLARE @ErrorLine INT;
    SELECT @ErrorMessage = ISNULL(ERROR_MESSAGE(),' '),
           @ErrorSeverity = ERROR_SEVERITY(),
           @ErrorState = ERROR_STATE(),
		   @ErrorProcedure = ISNULL(ERROR_PROCEDURE(),' '),
		   @ErrorLine = ISNULL(ERROR_LINE(),0)
    SELECT @ErrorMessage = @ErrorMessage + '  IN PROCEDURE: ' + @ErrorProcedure/*-CONCATENATE ERROR MESSAGES*/
	SELECT @ErrorMessage = @ErrorMessage + ' IN LINE: ' + CAST(@ErrorLine as nvarchar(20))
    RAISERROR (@ErrorMessage , /* Message text.*/
               @ErrorSeverity, /* Severity.*/
               @ErrorState /* State.*/
               );
    RETURN 1

END CATCH