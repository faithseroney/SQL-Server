select * from Duplicate

---We need to delete all duplicate rows
--create a CTE that used Partition By to divide the query into partitions

WITH DuplicateCTE AS
(
	Select *, ROW_NUMBER () over (Partition by ID Order by ID) as RowNumber
	From Duplicate
)

Delete from DuplicateCTE where RowNumber > 1