USE [master]
ALTER DATABASE [AW_Project01_OLTP_DB] 
  SET SINGLE_USER WITH ROLLBACK IMMEDIATE

RESTORE DATABASE [AW_Project01_OLTP_DB] 
  FROM DISK = N'C:\_BISolutions\_BIConceptsProject\AW_Project01_OLTP_DB.bak' 
WITH 
  MOVE N'AW_Project01_OLTP_DB' TO N'C:\_BISolutions\_BIConceptsProject\AW_Project01_OLTP_DB.mdf'
, MOVE N'AW_Project01_OLTP_DB_log' TO N'C:\_BISolutions\_BIConceptsProject\AW_Project01_OLTP_DB_log.ldf'
, REPLACE

ALTER DATABASE [AW_Project01_OLTP_DB] 
  SET MULTI_USER
GO


