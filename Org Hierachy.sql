

---Declare a variable @ID
DECLARE @ID INT
SET @ID = 7;		---Pass the EmployeeID

--Create a CTE
With EmployeeCTE AS
(
	SELECT EmployeeID, Name, ManagerID
	From manager	
	Where EmployeeID = @ID

	UNION ALL
	SELECT manager.EmployeeID, manager.Name, manager.ManagerID
	From manager
	Join EmployeeCTE
	on manager.EmployeeID = EmployeeCTE.ManagerID
)

---Select from the CTE
Select E1.Name, ISNULL(E2.Name, 'No Boss') as ManagerName
from EmployeeCTE E1
Left Join EmployeeCTE E2
on E1.ManagerID = E2.EmployeeID
