use Subescribers
;
Go

/* Create a table that contains the data used to customize report output*/

create table OrderInfo
(
	SubscriptionID int not null,
	OrderNumber nvarchar(20) not null,
	FileType bit null,
	ReportFormat nvarchar(20) not null
)
;
Go