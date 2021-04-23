Select*from JoinedTable
Select * from Fx_Table

Select*from TestTable
Select*from ReportingCurrencies

 


Select JoinedTable.SalesPerson_ID, JoinedTable.SalesPerson_Name, JoinedTable.Product,JoinedTable.Order_Number,
JoinedTable.SalesInRegionalCurrencies, Fx_Table.CurrencyCode, Fx_Table.One_USD, Fx_Table.In_USD
into TestTable
From JoinedTable, Fx_Table
Where JoinedTable.CurrencyID = Fx_Table.CurrencyID

Alter Table TestTable
Add RegionalToUSD money,
	USDtoEUR money,
	USDtoGBP money,
	USDtoAUD money,
	USDtoCAD money, 
	USDtoJPY money, 
	USDtoCHF money, 
	USDtoCNY money, 
	USDtoHKD money
		
Update TestTable
Set RegionalToUSD = SalesInRegionalCurrencies/One_USD

Update TestTable
Set
	USDtoEUR = 0.829957*RegionalToUSD,
	USDtoGBP = 0.716089*RegionalToUSD, 
	USDtoAUD = 1.284185*RegionalToUSD,
	USDtoCAD = 1.251392*RegionalToUSD, 
	USDtoJPY = 108.283732*RegionalToUSD, 
	USDtoCHF = 0.915094*RegionalToUSD, 
	USDtoCNY = 6.49779*RegionalToUSD, 
	USDtoHKD = 7.764031*RegionalToUSD
