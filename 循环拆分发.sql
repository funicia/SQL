DECLARE @STR1	VARCHAR(MAX),
		@FPOS	INT 	--�׷ָ��λ��
		--@NPOS	INT		--�ڶ����ָ��λ��

--,0004,0005,0006,0007,0008,0009
SET @STR1=',0000,0001,0003,0004,0005,0006,0007,0008,0009,111'
SELECT @STR2=SUBSTRING(@STR1,2,LEN(@STR1)),@FPOS=1
SELECT LEN(@STR2),@STR211

DECLARE @TMP_RULE TABLE (InnerCode int,RuleCode bigint)

WHILE LEN(@STR2)>0 AND @FPOS <> 0
BEGIN 
 
	SELECT @FPOS=PATINDEX('%,%',@STR2) 
	 
	IF @FPOS=0
		INSERT INTO @TMP_RULE(RuleCode)
		SELECT CONVERT(bigint,'1020003'+@STR2)
	ELSE 
		INSERT INTO @TMP_RULE(RuleCode)
		SELECT CONVERT(bigint,'1020003'+SUBSTRING(@STR2,1,@FPOS-1))
	SELECT @STR2 = SUBSTRING(@STR2,@FPOS+1,LEN(@STR2)) 
END

SELECT  * FROM @TMP_RULE