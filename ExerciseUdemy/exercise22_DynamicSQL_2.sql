alter procedure dbo.NameSearch(@NameToSearch nvarchar(50), @SearchPattern nvarchar(50), @MatchType int)
as
begin
	declare @FieldNameToSearch nvarchar(max), @FieldMatchToSearch nvarchar(max)
	declare @strSQL nvarchar(max)
	
	if @NameToSearch is null 
		begin
			if @MatchType = 1
				begin
					set @FieldMatchToSearch = '= ''' + lower(@SearchPattern) + ''''
				end
			else if @MatchType = 2
				begin
					set @FieldMatchToSearch = 'LIKE ''%' + lower(@SearchPattern) + ''''
				end
			else if @MatchType = 3
				begin
					set @FieldMatchToSearch = 'LIKE ''' + lower(@SearchPattern) + '%'''
				end
			else if @MatchType = 4
				begin
					set @FieldMatchToSearch = 'LIKE ''%' + lower(@SearchPattern) + '%'''
				end

			set @FieldNameToSearch = 'lower(FirstName) ' + @FieldMatchToSearch + ' or lower(LastName) ' + @FieldMatchToSearch + ' or lower(MiddleName) ' + @FieldMatchToSearch
		end
	else
		begin
			if @MatchType = 1
				begin
					set @FieldMatchToSearch = '= ''' + lower(@SearchPattern) + ''''
				end
			else if @MatchType = 2
				begin
					set @FieldMatchToSearch = 'LIKE ''%' + lower(@SearchPattern) + ''''
				end
			else if @MatchType = 3
				begin
					set @FieldMatchToSearch = 'LIKE ''' + lower(@SearchPattern) + '%'''
				end
			else if @MatchType = 4
				begin
					set @FieldMatchToSearch = 'LIKE ''%' + lower(@SearchPattern) + '%'''
				end

			set @FieldNameToSearch = 'lower(' + @NameToSearch + 'Name) ' + @FieldMatchToSearch
		end

	set @strSQL = 'SELECT * FROM [Person].[Person] WHERE ' + @FieldNameToSearch
	exec(@strSQL)
end
go

exec dbo.NameSearch null, 'dam', 1
