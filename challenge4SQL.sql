select a.[BusinessEntityID], a.[PersonType], a.[MiddleName]
	, [FullName] = a.[FirstName] + ' ' + case when a.[MiddleName] is null then '' else a.[MiddleName] + ' ' end + a.[LastName]
	, b.[AddressLine1] as [Address], b.[City], b.[PostalCode]
	, c.[Name] as [State], d.[Name] as [Country]
	, [JobTittel] = isnull(e.JobTitle,'None')
	, [JobCategory] = case
			when e.JobTitle like '%Manager%' or e.JobTitle like '%President%' or e.JobTitle like '%Executive%' then 'Management'
			when e.JobTitle like '%Engineer%' then 'Engeineering'
			when e.JobTitle like '%Production%' then 'Production'
			when e.JobTitle like '%Marketing%' then 'Marketing'
			when e.JobTitle is null then 'NA'
			when e.JobTitle in ('Recruiter', 'Benefits Specialist', 'Human Resources Administrative Assistant') then 'Human Resources'
			else 'Other'
			end
from [Person].[Person] as a inner join [Person].[BusinessEntityAddress] as br on br.BusinessEntityID = a.BusinessEntityID
inner join [Person].[Address] b on b.AddressID = br.AddressID
inner join [Person].[StateProvince] c on c.StateProvinceID = b.StateProvinceID
inner join [Person].[CountryRegion] d on d.CountryRegionCode = c.CountryRegionCode
left join [HumanResources].[Employee] e on e.BusinessEntityID = a.BusinessEntityID

where a.[PersonType] = 'SP' or (left(b.[PostalCode],1) = '9' and len(b.[PostalCode])=5 and d.[Name]='United States' )