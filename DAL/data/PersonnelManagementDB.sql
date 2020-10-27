--使用系统数据库
use master
go

--判断数据库 PersonnelManagementDB 是否存在
if exists(select * from sys.databases where name='PersonnelManagementDB')
	drop database PersonnelManagementDB
go

--创建 PersonnelManagementDB 数据库
create database PersonnelManagementDB
go

--使用 PersonnelManagementDB 数据库
use PersonnelManagementDB
go

--判断 用户表(UserInfo) 是否存在
if exists(select * from sys.tables where name='UserInfo')
	drop table UserInfo
go

--创建 用户表(UserInfo)
create table UserInfo
(
	UserID int primary key identity(1,1),--编号
	DepartmentID  int ,--部门编号
	RoleID int ,--角色编号（1.总经理 2.人事经理 3.人事助理 4.部门经理 5.员工）
	UserNumber varchar(50) ,--用户编号
	LoginName varchar(50) ,--登录名
	LoginPwd varchar(50) ,--密码
	UserName varchar(50) ,--真实姓名
	UserAge int ,--年龄
	UserSex tinyint ,--性别（1.男 2.女）
	UserTel varchar(11) ,--电话
	UserAddress varchar(100) ,--家庭住址
	UserIphone varchar(11) ,--手机
	UserRemarks varchar(200) ,--备注
	UserStatr int ,--是否可用（0.不可登录 1.可登录）
	EntryTime Datetime ,--最后登录时间
	DimissionTime Datetime ,--入职时间
	BasePay money ,--薪资
)
go

insert into UserInfo(DepartmentID,RoleID,UserNumber,LoginName,LoginPwd,UserName,
UserAge,UserSex,UserTel,UserAddress,UserStatr,EntryTime,DimissionTime,BasePay) 
values(4,4,2019031401,'admin6','svse','黄健',21,1,'13034472025','湖北黄石',1,'2019-01-01','2018-01-01',10000)
insert into UserInfo(DepartmentID,RoleID,UserNumber,LoginName,LoginPwd,UserName,
UserAge,UserSex,UserTel,UserAddress,UserStatr,EntryTime,DimissionTime,BasePay) 
values(6,2,2019031408,'admin7','svse','董涛',21,1,'13034472025','湖北黄冈',1,'2019-01-01','2018-01-01',10000)
insert into UserInfo(DepartmentID,RoleID,UserNumber,LoginName,LoginPwd,UserName,
UserAge,UserSex,UserTel,UserAddress,UserStatr,EntryTime,DimissionTime,BasePay) 
values(4,5,2019031410,'admin11','svse','童新',21,1,'13034472025','湖北荆门',1,'2019-01-01','2018-01-01',5000)
insert into UserInfo(DepartmentID,RoleID,UserNumber,LoginName,LoginPwd,UserName,
UserAge,UserSex,UserTel,UserAddress,UserStatr,EntryTime,DimissionTime,BasePay) 
values(3,4,2019031411,'admin12','svse','严义龙',21,1,'13034472025','湖北孝感',1,'2019-01-01','2018-01-01',5000)
insert into UserInfo(DepartmentID,RoleID,UserNumber,LoginName,LoginPwd,UserName,
UserAge,UserSex,UserTel,UserAddress,UserStatr,EntryTime,DimissionTime,BasePay) 
values(5,3,2019031412,'admin13','svse','苏抗',21,1,'13034472025','湖北宜昌',1,'2019-01-01','2018-01-01',5000)

insert into UserInfo(DepartmentID,RoleID,UserNumber,LoginName,LoginPwd,UserName,
UserAge,UserSex,UserTel,UserAddress,UserStatr,EntryTime,DimissionTime,BasePay) 
values(3,4,2019031413,'admin14','svse','乐俊',21,1,'13034472025','湖北武汉',1,'2019-01-01','2018-01-01',5000)
insert into UserInfo(DepartmentID,RoleID,UserNumber,LoginName,LoginPwd,UserName,
UserAge,UserSex,UserTel,UserAddress,UserStatr,EntryTime,DimissionTime,BasePay) 
values(3,4,2019031414,'admin15','svse','吴琼',21,0,'13034472025','湖北武汉',1,'2019-01-01','2018-01-01',5000)
insert into UserInfo(DepartmentID,RoleID,UserNumber,LoginName,LoginPwd,UserName,
UserAge,UserSex,UserTel,UserAddress,UserStatr,EntryTime,DimissionTime,BasePay) 
values(6,5,2019031415,'admin16','svse','王玉',21,0,'13034472025','湖北黄冈',1,'2019-01-01','2018-01-01',10000)
insert into UserInfo(DepartmentID,RoleID,UserNumber,LoginName,LoginPwd,UserName,
UserAge,UserSex,UserTel,UserAddress,UserStatr,EntryTime,DimissionTime,BasePay) 
values(6,1,2019031416,'admin17','svse','吴迪',21,1,'13034472025','湖北仙桃',1,'2019-01-01','2018-01-01',10000)
go

--判断 部门表(Department) 是否存在
if exists(select * from sys.tables where name='Department')
	drop table Department
go

--创建 部门表(Department)
create table Department
(
	DepartmentID int primary key identity(1,1),--部门编号
	DepartmentName varchar(50) ,--部门名称
	DepartmentRemarks varchar(500) ,--备注
)
go

insert into Department (DepartmentName) values('财务部')
insert into Department (DepartmentName) values('行政部')
insert into Department (DepartmentName) values('研发部')

insert into Department (DepartmentName) values('销售部')
insert into Department (DepartmentName) values('公关部')
insert into Department (DepartmentName) values('人事部')
go

--判断 角色表(Role) 是否存在
if exists(select * from sys.tables where name='Role')
	drop table Role
go

--创建 角色表(Role)
create table Role
(
	RoleID int primary key identity(1,1),--角色编号
	RoleName varchar(50) ,--角色名称
	RoleNumber varchar(200) ,--角色权限百分比
)
go

insert into Role values('总经理',100)
insert into Role values('人事经理',90)
insert into Role values('人事助理',80)
insert into Role values('部门经理',70)
insert into Role values('普通员工',60)
go

--判断 业绩评定表(Assessment) 是否存在
if exists(select * from sys.tables where name='Assessment')
	drop table Assessment
go

--创建 业绩评定表(Assessment)
create table Assessment
(
	AssessmentID int primary key identity(1,1),--业绩评定
	PerformanceTime Datetime ,--考评日期
	UserID int ,--评定人
	WorkSummary varchar(max) ,--总结
	UpperGoal varchar(max) , --完成度
	CompletionDegree float ,--互评分数
	ExaminationItems varchar(100) ,--下阶段目标
	NextStageObjectives varchar(100) ,--上阶段目标
	PerformanceScore float ,--最终评分
	comments varchar(max) ,--主管评论
	perstate int ,--审核状态
	
	--用户编号外键（级联式）
	foreign key (UserID) references UserInfo (UserID) on delete cascade
)
go

--判断 考勤信息表(AttendanceSheet) 是否存在
if exists(select * from sys.tables where name='AttendanceSheet')
	drop table AttendanceSheet
go

--创建 考勤信息表(AttendanceSheet)
create table AttendanceSheet
(
	AttendanceID int primary key identity(1,1),--考勤编号
	AttendanceStartTime Datetime ,--考勤时间 
	AttendanceType int ,--考勤状态
	UserID int ,--用户编号
	ClockTime Datetime ,--第一次打卡
	ClockOutTime Datetime ,--第二次打卡
	Workinghours int ,--工作小时
	remake varchar(200) ,--备注
	Late int ,--迟到次数
	Absenteeism int ,--考勤次数

	--用户编号外键（级联式）
	foreign key (UserID) references UserInfo (UserID) on delete cascade
)
go

--判断 字典表(CategoryItems) 是否存在
if exists(select * from sys.tables where name='CategoryItems')
	drop table CategoryItems
go

--创建 字典表(CategoryItems)
create table CategoryItems
(
	CID int primary key identity(1,1),--编号
	C_Category varchar(20) ,--表名
	CI_ID int ,--ID
	CI_Name varchar(20) ,--字典名称      
)
go

insert into CategoryItems values('LeaveStart',1,'同意')
insert into CategoryItems values('LeaveStart',2,'驳回')
insert into CategoryItems values('LeaveStart',3,'审批中')

insert into CategoryItems values('UserStart',1,'在职')
insert into CategoryItems values('UserStart',2,'请假')
insert into CategoryItems values('UserStart',3,'出差')
insert into CategoryItems values('UserStart',4,'离职')

insert into CategoryItems values('Attendance',1,'在职')
insert into CategoryItems values('Attendance',2,'迟到')
insert into CategoryItems values('Attendance',3,'早退')
insert into CategoryItems values('Attendance',4,'缺勤')
insert into CategoryItems values('Attendance',5,'请假')
insert into CategoryItems values('Attendance',6,'迟到/早退')
insert into CategoryItems values('Attendance',7,'未打卡')

insert into CategoryItems values('ApprovalType',1,'加班')
insert into CategoryItems values('ApprovalType',2,'请假')
insert into CategoryItems values('ApprovalType',3,'加薪')

insert into CategoryItems values('NoticeState',1,'重要')
insert into CategoryItems values('NoticeState',2,'一般')
insert into CategoryItems values('NoticeState',3,'紧急')

insert into CategoryItems values('performance',1,'已评')
insert into CategoryItems values('performance',2,'未评')

--判断 请假表(Leave) 是否存在
if exists(select * from sys.tables where name='Leave')
	drop table Leave
go

--创建 请假表(Leave)
create table Leave
(
	LeaveID int primary key identity(1,1),--请假编号         
	UserID int ,--用户编号
	LeaveState int ,--审批状态           
	LeaveTime Datetime ,--请假时间
	LeaveStartTime Datetime ,--请假起始时间
	LeaveEndTime Datetime ,--结束时间
	LeaveHalfDay varchar(20) ,--时间段（上午 或 下午）
	LeaveDays int ,--请假天数
	LeaveReason varchar(250) ,--请假原因
	ApproverID int ,--审批人编号
	ApprovalTime Datetime ,--审批时间
	ApproverReason varchar(250) ,--审批备注

	--用户编号外键（级联式）
	foreign key (UserID) references UserInfo (UserID) on delete cascade
)
go

--判断 公告表(Notice)
if exists(select * from sys.tables where name='Notice')
	drop table Notice
go

-- 创建 公告表(Notice)
create table Notice
(
	NoticeID int primary key identity(1,1),--公告编号
	NoticeType int ,--公告类型
	NoticeTitle varchar(250) ,--公告标题
	NoticeContent varchar(500) ,--公告内容
	UserID int ,--发布人
	NoticeStateTime Datetime ,--通知起始时间       
	NoticeEndTime Datetime ,--结束时间
	NoticeState int ,--通知紧急状态（参考字典表）

	--用户编号外键（级联式）
	foreign key (UserID) references UserInfo (UserID) on delete cascade
)
go

--判断 加班申请表(Overtime) 是否存在
if exists(select * from sys.tables where name='Overtime')
	drop table Overtime

--创建 加班申请表(Overtime)
create table Overtime
(
	OvertimeID int primary key identity(1,1),--加班编号       
	OvertimeStateTime Datetime ,--加班起始时间
	OvertimeEndTime Datetime ,--加班结束时间
	OvertimeDuration int ,--申请状态
	UserID int ,--用户编号  
	ApplyTime Datetime ,--审批时间		
	OvertimeState int ,--审批进度
	ApproverReason	varchar(50) ,--审批内容

	--用户编号外键（级联式）
	foreign key (UserID) references UserInfo (UserID) on delete cascade
)
go

--判断 工资增长表(PayRise) 是否存在
if exists(select * from sys.tables where name='PayRise')
	drop table PayRise
go

--创建 工资增长表(PayRise)
create table PayRise
(
	PayRiseID int primary key identity(1,1),--工资增长编号        
	UserID int ,--用户编号
	PayRiseMoney money ,--工资收入		
	Reason varchar(max) ,--原因
	ApplicationTime Datetime ,--申请时间
	ApprovalContent varchar(500) ,--批准内容
	ApprovalState  int ,--批准状态
	ApprovalTime Datetime ,--批准时间

	--用户编号外键（级联式）
	foreign key (UserID) references UserInfo (UserID) on delete cascade
)
go

--判断 工资表(Salary) 是否存在
if exists(select * from sys.tables where name='Salary')
	drop table Salary
go

--创建工资表(Salary)
create table Salary
(
	id int primary key identity(1,1),--工资编号
	UserID int,--用户编号
	BasicSalary money ,--基本工资
	AttendanceBonus money ,--考勤奖金
	Fine money ,--罚款
	SalaryTime datetime ,--发工资时间
	SalarySum money ,--最后工资
	
	--用户编号外键（级联式）
	foreign key (UserID) references UserInfo (UserID) on delete cascade
)

--判断 工资单表(PaySlip) 是否存在
if exists(select * from sys.tables where name='PaySlip')
	drop table PaySlip
go

--创建 工资单表(PaySlip)
create table PaySlip
(
	PaySlipID int primary key identity(1,1),--工资编号
	UserID int ,--用户编号
	Prize money ,--全勤奖金
	LeaveMoney money ,--请假扣钱
	OvertimeMoney money ,--加班奖金
	LateMoney money ,--迟到
	AdvanceMoney money ,--早退
	Absence money,--缺勤
	Fine money,--罚款
	Sa_Bonus money,--业绩奖金
	Sa_Time datetime,--工资结算时间
	Sa_TotalSalary money,--合计工资
)
go

--判断 日志表(SystemLog) 是否存在
if exists(select * from sys.tables where name='SystemLog')
	drop table SystemLog
go

--创建日志表(SystemLog)
create table SystemLog
(
	LogID int primary key identity(1,1),--登录编号
	UserID int ,--用户编号
	LogTime datetime ,--登录时间
	LogOperation varchar(500) ,--操作内容
	
	--用户编号外键（级联式）
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
--select DepartmentName from Department where DepartmentName='行政部'
--insert into Department(DepartmentName,DepartmentRemarks) values('后勤部','')
--select UserID,UserName,DepartmentName,UserSex,UserAge,UserTel,DimissionTime,BasePay from UserInfo u,Department d where u.DepartmentID=d.DepartmentID
--select UserName,DepartmentName,UserAge,UserSex,UserTel,UserAddress,EntryTime,BasePay,UserRemarks from UserInfo u,Department d where u.DepartmentID=d.DepartmentID and RoleID=1 and UserID=9 and LoginName='admin17'
--update UserInfo set UserName='廖洪四',UserAge=19,UserSex=1,UserTel='12121212122',UserAddress='湖南娄底',UserRemarks='从来无所求，所得接惊喜！' where RoleID=1 and UserID=9 and LoginName='admin17'


