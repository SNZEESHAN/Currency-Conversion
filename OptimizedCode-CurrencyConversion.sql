Select JoinedTable.SalesPerson_ID, JoinedTable.SalesPerson_Name, JoinedTable.Product,JoinedTable.Order_Number,
JoinedTable.SalesInRegionalCurrencies, Fx_Table.CurrencyCode, Fx_Table.One_USD, Fx_Table.In_USD
into TestTable
From JoinedTable, Fx_Table
Where JoinedTable.CurrencyID = Fx_Table.CurrencyID

Alter Table TestTable
Add USDtoEUR money,
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
	USDtoEUR = (select One_USD from ReportingCurrencies where ReportingCurrencyCode='EUR') *RegionalToUSD,
	USDtoGBP = (select One_USD from ReportingCurrencies where ReportingCurrencyCode='GBP')*RegionalToUSD, 
	USDtoAUD = (select One_USD from ReportingCurrencies where ReportingCurrencyCode='AUD')*RegionalToUSD,
	USDtoCAD = (select One_USD from ReportingCurrencies where ReportingCurrencyCode='CAD')*RegionalToUSD, 
	USDtoJPY = (select One_USD from ReportingCurrencies where ReportingCurrencyCode='JPY')*RegionalToUSD, 
	USDtoCHF = (select One_USD from ReportingCurrencies where ReportingCurrencyCode='CHF')*RegionalToUSD, 
	USDtoCNY = (select One_USD from ReportingCurrencies where ReportingCurrencyCode='CNY')*RegionalToUSD, 
	USDtoHKD = (select One_USD from ReportingCurrencies where ReportingCurrencyCode='HKD')*RegionalToUSD
