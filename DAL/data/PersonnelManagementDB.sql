--ʹ��ϵͳ���ݿ�
use master
go

--�ж����ݿ� PersonnelManagementDB �Ƿ����
if exists(select * from sys.databases where name='PersonnelManagementDB')
	drop database PersonnelManagementDB
go

--���� PersonnelManagementDB ���ݿ�
create database PersonnelManagementDB
go

--ʹ�� PersonnelManagementDB ���ݿ�
use PersonnelManagementDB
go

--�ж� �û���(UserInfo) �Ƿ����
if exists(select * from sys.tables where name='UserInfo')
	drop table UserInfo
go

--���� �û���(UserInfo)
create table UserInfo
(
	UserID int primary key identity(1,1),--���
	DepartmentID  int ,--���ű��
	RoleID int ,--��ɫ��ţ�1.�ܾ��� 2.���¾��� 3.�������� 4.���ž��� 5.Ա����
	UserNumber varchar(50) ,--�û����
	LoginName varchar(50) ,--��¼��
	LoginPwd varchar(50) ,--����
	UserName varchar(50) ,--��ʵ����
	UserAge int ,--����
	UserSex tinyint ,--�Ա�1.�� 2.Ů��
	UserTel varchar(11) ,--�绰
	UserAddress varchar(100) ,--��ͥסַ
	UserIphone varchar(11) ,--�ֻ�
	UserRemarks varchar(200) ,--��ע
	UserStatr int ,--�Ƿ���ã�0.���ɵ�¼ 1.�ɵ�¼��
	EntryTime Datetime ,--����¼ʱ��
	DimissionTime Datetime ,--��ְʱ��
	BasePay money ,--н��
)
go

insert into UserInfo(DepartmentID,RoleID,UserNumber,LoginName,LoginPwd,UserName,
UserAge,UserSex,UserTel,UserAddress,UserStatr,EntryTime,DimissionTime,BasePay) 
values(4,4,2019031401,'admin6','svse','�ƽ�',21,1,'13034472025','������ʯ',1,'2019-01-01','2018-01-01',10000)
insert into UserInfo(DepartmentID,RoleID,UserNumber,LoginName,LoginPwd,UserName,
UserAge,UserSex,UserTel,UserAddress,UserStatr,EntryTime,DimissionTime,BasePay) 
values(6,2,2019031408,'admin7','svse','����',21,1,'13034472025','�����Ƹ�',1,'2019-01-01','2018-01-01',10000)
insert into UserInfo(DepartmentID,RoleID,UserNumber,LoginName,LoginPwd,UserName,
UserAge,UserSex,UserTel,UserAddress,UserStatr,EntryTime,DimissionTime,BasePay) 
values(4,5,2019031410,'admin11','svse','ͯ��',21,1,'13034472025','��������',1,'2019-01-01','2018-01-01',5000)
insert into UserInfo(DepartmentID,RoleID,UserNumber,LoginName,LoginPwd,UserName,
UserAge,UserSex,UserTel,UserAddress,UserStatr,EntryTime,DimissionTime,BasePay) 
values(3,4,2019031411,'admin12','svse','������',21,1,'13034472025','����Т��',1,'2019-01-01','2018-01-01',5000)
insert into UserInfo(DepartmentID,RoleID,UserNumber,LoginName,LoginPwd,UserName,
UserAge,UserSex,UserTel,UserAddress,UserStatr,EntryTime,DimissionTime,BasePay) 
values(5,3,2019031412,'admin13','svse','�տ�',21,1,'13034472025','�����˲�',1,'2019-01-01','2018-01-01',5000)

insert into UserInfo(DepartmentID,RoleID,UserNumber,LoginName,LoginPwd,UserName,
UserAge,UserSex,UserTel,UserAddress,UserStatr,EntryTime,DimissionTime,BasePay) 
values(3,4,2019031413,'admin14','svse','�ֿ�',21,1,'13034472025','�����人',1,'2019-01-01','2018-01-01',5000)
insert into UserInfo(DepartmentID,RoleID,UserNumber,LoginName,LoginPwd,UserName,
UserAge,UserSex,UserTel,UserAddress,UserStatr,EntryTime,DimissionTime,BasePay) 
values(3,4,2019031414,'admin15','svse','����',21,0,'13034472025','�����人',1,'2019-01-01','2018-01-01',5000)
insert into UserInfo(DepartmentID,RoleID,UserNumber,LoginName,LoginPwd,UserName,
UserAge,UserSex,UserTel,UserAddress,UserStatr,EntryTime,DimissionTime,BasePay) 
values(6,5,2019031415,'admin16','svse','����',21,0,'13034472025','�����Ƹ�',1,'2019-01-01','2018-01-01',10000)
insert into UserInfo(DepartmentID,RoleID,UserNumber,LoginName,LoginPwd,UserName,
UserAge,UserSex,UserTel,UserAddress,UserStatr,EntryTime,DimissionTime,BasePay) 
values(6,1,2019031416,'admin17','svse','���',21,1,'13034472025','��������',1,'2019-01-01','2018-01-01',10000)
go

--�ж� ���ű�(Department) �Ƿ����
if exists(select * from sys.tables where name='Department')
	drop table Department
go

--���� ���ű�(Department)
create table Department
(
	DepartmentID int primary key identity(1,1),--���ű��
	DepartmentName varchar(50) ,--��������
	DepartmentRemarks varchar(500) ,--��ע
)
go

insert into Department (DepartmentName) values('����')
insert into Department (DepartmentName) values('������')
insert into Department (DepartmentName) values('�з���')

insert into Department (DepartmentName) values('���۲�')
insert into Department (DepartmentName) values('���ز�')
insert into Department (DepartmentName) values('���²�')
go

--�ж� ��ɫ��(Role) �Ƿ����
if exists(select * from sys.tables where name='Role')
	drop table Role
go

--���� ��ɫ��(Role)
create table Role
(
	RoleID int primary key identity(1,1),--��ɫ���
	RoleName varchar(50) ,--��ɫ����
	RoleNumber varchar(200) ,--��ɫȨ�ްٷֱ�
)
go

insert into Role values('�ܾ���',100)
insert into Role values('���¾���',90)
insert into Role values('��������',80)
insert into Role values('���ž���',70)
insert into Role values('��ͨԱ��',60)
go

--�ж� ҵ��������(Assessment) �Ƿ����
if exists(select * from sys.tables where name='Assessment')
	drop table Assessment
go

--���� ҵ��������(Assessment)
create table Assessment
(
	AssessmentID int primary key identity(1,1),--ҵ������
	PerformanceTime Datetime ,--��������
	UserID int ,--������
	WorkSummary varchar(max) ,--�ܽ�
	UpperGoal varchar(max) , --��ɶ�
	CompletionDegree float ,--��������
	ExaminationItems varchar(100) ,--�½׶�Ŀ��
	NextStageObjectives varchar(100) ,--�Ͻ׶�Ŀ��
	PerformanceScore float ,--��������
	comments varchar(max) ,--��������
	perstate int ,--���״̬
	
	--�û�������������ʽ��
	foreign key (UserID) references UserInfo (UserID) on delete cascade
)
go

--�ж� ������Ϣ��(AttendanceSheet) �Ƿ����
if exists(select * from sys.tables where name='AttendanceSheet')
	drop table AttendanceSheet
go

--���� ������Ϣ��(AttendanceSheet)
create table AttendanceSheet
(
	AttendanceID int primary key identity(1,1),--���ڱ��
	AttendanceStartTime Datetime ,--����ʱ�� 
	AttendanceType int ,--����״̬
	UserID int ,--�û����
	ClockTime Datetime ,--��һ�δ�
	ClockOutTime Datetime ,--�ڶ��δ�
	Workinghours int ,--����Сʱ
	remake varchar(200) ,--��ע
	Late int ,--�ٵ�����
	Absenteeism int ,--���ڴ���

	--�û�������������ʽ��
	foreign key (UserID) references UserInfo (UserID) on delete cascade
)
go

--�ж� �ֵ��(CategoryItems) �Ƿ����
if exists(select * from sys.tables where name='CategoryItems')
	drop table CategoryItems
go

--���� �ֵ��(CategoryItems)
create table CategoryItems
(
	CID int primary key identity(1,1),--���
	C_Category varchar(20) ,--����
	CI_ID int ,--ID
	CI_Name varchar(20) ,--�ֵ�����      
)
go

insert into CategoryItems values('LeaveStart',1,'ͬ��')
insert into CategoryItems values('LeaveStart',2,'����')
insert into CategoryItems values('LeaveStart',3,'������')

insert into CategoryItems values('UserStart',1,'��ְ')
insert into CategoryItems values('UserStart',2,'���')
insert into CategoryItems values('UserStart',3,'����')
insert into CategoryItems values('UserStart',4,'��ְ')

insert into CategoryItems values('Attendance',1,'��ְ')
insert into CategoryItems values('Attendance',2,'�ٵ�')
insert into CategoryItems values('Attendance',3,'����')
insert into CategoryItems values('Attendance',4,'ȱ��')
insert into CategoryItems values('Attendance',5,'���')
insert into CategoryItems values('Attendance',6,'�ٵ�/����')
insert into CategoryItems values('Attendance',7,'δ��')

insert into CategoryItems values('ApprovalType',1,'�Ӱ�')
insert into CategoryItems values('ApprovalType',2,'���')
insert into CategoryItems values('ApprovalType',3,'��н')

insert into CategoryItems values('NoticeState',1,'��Ҫ')
insert into CategoryItems values('NoticeState',2,'һ��')
insert into CategoryItems values('NoticeState',3,'����')

insert into CategoryItems values('performance',1,'����')
insert into CategoryItems values('performance',2,'δ��')

--�ж� ��ٱ�(Leave) �Ƿ����
if exists(select * from sys.tables where name='Leave')
	drop table Leave
go

--���� ��ٱ�(Leave)
create table Leave
(
	LeaveID int primary key identity(1,1),--��ٱ��         
	UserID int ,--�û����
	LeaveState int ,--����״̬           
	LeaveTime Datetime ,--���ʱ��
	LeaveStartTime Datetime ,--�����ʼʱ��
	LeaveEndTime Datetime ,--����ʱ��
	LeaveHalfDay varchar(20) ,--ʱ��Σ����� �� ���磩
	LeaveDays int ,--�������
	LeaveReason varchar(250) ,--���ԭ��
	ApproverID int ,--�����˱��
	ApprovalTime Datetime ,--����ʱ��
	ApproverReason varchar(250) ,--������ע

	--�û�������������ʽ��
	foreign key (UserID) references UserInfo (UserID) on delete cascade
)
go

--�ж� �����(Notice)
if exists(select * from sys.tables where name='Notice')
	drop table Notice
go

-- ���� �����(Notice)
create table Notice
(
	NoticeID int primary key identity(1,1),--������
	NoticeType int ,--��������
	NoticeTitle varchar(250) ,--�������
	NoticeContent varchar(500) ,--��������
	UserID int ,--������
	NoticeStateTime Datetime ,--֪ͨ��ʼʱ��       
	NoticeEndTime Datetime ,--����ʱ��
	NoticeState int ,--֪ͨ����״̬���ο��ֵ��

	--�û�������������ʽ��
	foreign key (UserID) references UserInfo (UserID) on delete cascade
)
go

--�ж� �Ӱ������(Overtime) �Ƿ����
if exists(select * from sys.tables where name='Overtime')
	drop table Overtime

--���� �Ӱ������(Overtime)
create table Overtime
(
	OvertimeID int primary key identity(1,1),--�Ӱ���       
	OvertimeStateTime Datetime ,--�Ӱ���ʼʱ��
	OvertimeEndTime Datetime ,--�Ӱ����ʱ��
	OvertimeDuration int ,--����״̬
	UserID int ,--�û����  
	ApplyTime Datetime ,--����ʱ��		
	OvertimeState int ,--��������
	ApproverReason	varchar(50) ,--��������

	--�û�������������ʽ��
	foreign key (UserID) references UserInfo (UserID) on delete cascade
)
go

--�ж� ����������(PayRise) �Ƿ����
if exists(select * from sys.tables where name='PayRise')
	drop table PayRise
go

--���� ����������(PayRise)
create table PayRise
(
	PayRiseID int primary key identity(1,1),--�����������        
	UserID int ,--�û����
	PayRiseMoney money ,--��������		
	Reason varchar(max) ,--ԭ��
	ApplicationTime Datetime ,--����ʱ��
	ApprovalContent varchar(500) ,--��׼����
	ApprovalState  int ,--��׼״̬
	ApprovalTime Datetime ,--��׼ʱ��

	--�û�������������ʽ��
	foreign key (UserID) references UserInfo (UserID) on delete cascade
)
go

--�ж� ���ʱ�(Salary) �Ƿ����
if exists(select * from sys.tables where name='Salary')
	drop table Salary
go

--�������ʱ�(Salary)
create table Salary
(
	id int primary key identity(1,1),--���ʱ��
	UserID int,--�û����
	BasicSalary money ,--��������
	AttendanceBonus money ,--���ڽ���
	Fine money ,--����
	SalaryTime datetime ,--������ʱ��
	SalarySum money ,--�����
	
	--�û�������������ʽ��
	foreign key (UserID) references UserInfo (UserID) on delete cascade
)

--�ж� ���ʵ���(PaySlip) �Ƿ����
if exists(select * from sys.tables where name='PaySlip')
	drop table PaySlip
go

--���� ���ʵ���(PaySlip)
create table PaySlip
(
	PaySlipID int primary key identity(1,1),--���ʱ��
	UserID int ,--�û����
	Prize money ,--ȫ�ڽ���
	LeaveMoney money ,--��ٿ�Ǯ
	OvertimeMoney money ,--�Ӱཱ��
	LateMoney money ,--�ٵ�
	AdvanceMoney money ,--����
	Absence money,--ȱ��
	Fine money,--����
	Sa_Bonus money,--ҵ������
	Sa_Time datetime,--���ʽ���ʱ��
	Sa_TotalSalary money,--�ϼƹ���
)
go

--�ж� ��־��(SystemLog) �Ƿ����
if exists(select * from sys.tables where name='SystemLog')
	drop table SystemLog
go

--������־��(SystemLog)
create table SystemLog
(
	LogID int primary key identity(1,1),--��¼���
	UserID int ,--�û����
	LogTime datetime ,--��¼ʱ��
	LogOperation varchar(500) ,--��������
	
	--�û�������������ʽ��
	foreign key (UserID) references UserInfo (UserID) on delete cascade
)
go

select * from Assessment
select * from AttendanceSheet
select * from CategoryItems
select * from Department
select * from Leave
select * from Notice
select * from Overtime
select * from PayRise
select * from PaySlip
select * from Role
select * from Salary
select * from SystemLog
select * from UserInfo

--select LoginName,LoginPwd from UserInfo where LoginName=@LoginName and LoginPwd=@LoginPwd
--select DepartmentID,DepartmentName from Department
--delete Department where DepartmentID =1
--exec('delete Department where DepartmentID in (' +@DepartmentID+ ')')
--select DepartmentName from Department where DepartmentName='������'
--insert into Department(DepartmentName,DepartmentRemarks) values('���ڲ�','')
--select UserID,UserName,DepartmentName,UserSex,UserAge,UserTel,DimissionTime,BasePay from UserInfo u,Department d where u.DepartmentID=d.DepartmentID
--select UserName,DepartmentName,UserAge,UserSex,UserTel,UserAddress,EntryTime,BasePay,UserRemarks from UserInfo u,Department d where u.DepartmentID=d.DepartmentID and RoleID=1 and UserID=9 and LoginName='admin17'
--update UserInfo set UserName='�κ���',UserAge=19,UserSex=1,UserTel='12121212122',UserAddress='����¦��',UserRemarks='�������������ýӾ�ϲ��' where RoleID=1 and UserID=9 and LoginName='admin17'


