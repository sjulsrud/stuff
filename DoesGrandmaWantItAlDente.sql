CREATE PROCEDURE dbo.DoesGrandmaWantItAlDente (
@AlDente BIT
)
AS
SET NOCOUNT ON;
BEGIN

IF @AlDente = 1
  BEGIN
    SELECT 'Yeah she does!'
  END
ELSE
  BEGIN
    SELECT 'Well, she does.'
  END
  
END