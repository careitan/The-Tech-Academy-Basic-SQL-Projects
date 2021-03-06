/****** Script for SelectTopNRows command from SSMS  ******/
CREATE PROC [dbo].uspPhoneList
	@FName nvarchar(50) = '%'
	,@LName nvarchar(50) = '%'
AS
BEGIN
	SELECT TOP 100
		P.FirstName [First Name]
		,ISNULL(P.MiddleName,'') [Middle]
		,P.LastName [Last Name]
		,PP.PhoneNumber [Phone]
	FROM   Person.Person P INNER JOIN
				 Person.PersonPhone PP ON P.BusinessEntityID = PP.BusinessEntityID
	WHERE FirstName LIKE @FName AND LastName LIKE @LName;
END
