﻿
CREATE FUNCTION [dbo].[SFN_GET_NEXT_AA]
(
	
)
RETURNS INT AS  
BEGIN 
	DECLARE @RET_RUN_ID int

	SELECT @RET_RUN_ID = (SELECT ISNULL(MAX([trc_run_id]), 0) + 1 FROM [dbo].[traces])

	RETURN @RET_RUN_ID
END
