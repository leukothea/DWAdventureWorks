USE [master] 
GO 

IF EXISTS (SELECT name FROM sys.databases WHERE name = N'DW-AdventureWorks-CWarren')
  BEGIN
  -- Close connections to the DW-AdventureWorks-CWarren database    
  
  ALTER DATABASE [DW-AdventureWorks-CWarren] SET SINGLE_USER WITH ROLLBACK IMMEDIATE    
  DROP DATABASE [DW-AdventureWorks-CWarren]
  
  END

GO 

/******
If there's a process hanging the DB in "single user mode," find it with this command: 
Select request_session_id From sys.dm_tran_locks Where resource_database_id=DB_ID('DW-AdventureWorks-CWarren');

and kill it in order to continue working, like this: 

KILL 55;

Then, you can reset the database to multi-user: 

ALTER DATABASE [DW-AdventureWorks-CWarren] SET MULTI_USER

And finally, you can then create the database afresh. 
******/

CREATE DATABASE [DW-AdventureWorks-CWarren] ON PRIMARY ( 
NAME = N'DW-AdventureWorks-CWarren' 
, FILENAME = N'C:\_BISolutions\_BIConceptsProject\DW-AdventureWorks-CWarren.mdf' 
, SIZE = 10MB 
, MAXSIZE = 1GB 
, FILEGROWTH = 10MB 
) LOG ON
( NAME = N'DW-AdventureWorks-CWarren_log' 
, FILENAME = N'C:\_BISolutions\_BIConceptsProject\DW-AdventureWorks-CWarren_log.ldf' 
, SIZE = 1MB 
, MAXSIZE = 1GB 
, FILEGROWTH = 10MB
) 
GO 
EXEC [DW-AdventureWorks-CWarren].dbo.sp_changedbowner @loginame = N'SA', @map = false 
GO 
ALTER DATABASE [DW-AdventureWorks-CWarren] SET RECOVERY BULK_LOGGED 
GO


