CREATE DATABASE BulletinBoard;
GO

USE BulletinBoard;

CREATE TABLE Events (
  Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  Title NVARCHAR(50),
  Detail NVARCHAR(200),
  [Date] DATETIMEOFFSET,
  CreatedAt DATETIMEOFFSET NOT NULL, 
  UpdatedAt DATETIMEOFFSET NOT NULL
);

INSERT INTO Events (Title, Detail, [Date], CreatedAt, UpdatedAt) VALUES
(N'Docker for Beginners', N'Introduction to Docker using Node.js', '2017-11-21', GETDATE(), GETDATE()),
(N'Advanced Orchestration', N'Deep dive into Docker Swarm', '2017-12-25', GETDATE(), GETDATE()),
(N'Docker on Windows', N'From 101 to production', '2018-01-01', GETDATE(), GETDATE());
GO
SELECT * FROM BulletinBoard.dbo.Events;


-- Enable remote connections
EXEC sp_configure 'remote access', 1;
RECONFIGURE;

-- Allow remote connections to the default SQL Server instance
EXEC sp_configure 'remote access', 1;
RECONFIGURE;

-- Enable the SQL Server Browser service to allow named instances to be resolved
EXEC xp_instance_regwrite 'HKEY_LOCAL_MACHINE', 'Software\Microsoft\MSSQLServer\MSSQLServer', 'AllowRemoteConnections', REG_DWORD, 1;

GO
