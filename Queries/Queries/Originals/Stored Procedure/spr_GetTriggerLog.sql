create PROCEDURE [dbo].[spr_GetTriggerLog]  
	
AS
BEGIN
	
	SET NOCOUNT ON;
IF ERROR_NUMBER() <> 0 AND @@TRANCOUNT > 0
        ROLLBACK TRAN


     INSERT INTO TA_TriggerLog 
    (
        TrgLog_TriggerName,TrgLog_ErrorNumber, TrgLog_Message ,TrgLog_LineNumber
    )
    VALUES
    (
    ERROR_PROCEDURE(),
      ERROR_NUMBER(),ERROR_MESSAGE(),ERROR_LINE()
       
    )

END
