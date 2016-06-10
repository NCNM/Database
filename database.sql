CREATE DATABASE	PMS; 

USE PMS;

CREATE TABLE OFFICER
(
ID VARCHAR(10),
Lastname NVARCHAR(20),
Midname NVARCHAR(20),
Firstname NVARCHAR(20),
Gender NVARCHAR(6),
DOB DATE,
Addr NVARCHAR(50),
Phone VARCHAR(11),
Department NVARCHAR(30),
CONSTRAINT PKey_OFFICER
PRIMARY KEY (ID)
);

CREATE TABLE INMATE
(
ID VARCHAR(10),
Photo NVARCHAR(512),
Lastname NVARCHAR(20),
Midname NVARCHAR(20),
Firstname NVARCHAR(20),
Gender NVARCHAR(6),
DOB DATE,
Hair NVARCHAR(10),
Eyes NVARCHAR(10),
Eth NVARCHAR(10),
Addr NVARCHAR(50),
Reason NVARCHAR(50),
Custody NVARCHAR(50),
Availability NVARCHAR(5),
BookIn DATETIME,
BookOut DATETIME,
CONSTRAINT PKey_INMATE
PRIMARY KEY (ID)
);

CREATE TABLE RE_LATIVE
(
ID VARCHAR(10),
Lastname NVARCHAR(20),
Midname NVARCHAR(20),
Firstname NVARCHAR(20),
Gender NVARCHAR(6),
DOB DATE,
Addr NVARCHAR(50),
Phone VARCHAR(11),
InmateID VARCHAR(10),
Visit bool,
CONSTRAINT PKey_RELATIVE
PRIMARY KEY (ID,InmateID)
);

CREATE TABLE EN_TRY
(
ID VARCHAR(10),
InmateID VARCHAR(10),
ENTRY_Date DATE,
Remarks NVARCHAR(100),
CONSTRAINT PKey_ENTRY
PRIMARY KEY (ID,InmateID)
);

CREATE TABLE RE_LEASE
(
ID VARCHAR(10),
InmateID VARCHAR(10),
RELEASE_Date DATE,
Remarks NVARCHAR(100),
CONSTRAINT PKey_RELEASE
PRIMARY KEY (ID,InmateID)
);

CREATE TABLE MEDCHECKS
(
ID VARCHAR(10),
InmateID VARCHAR(10),
MEDCHECKS_Date DATE,
Urgency NVARCHAR(100),
Condi NVARCHAR(100),
Remarks NVARCHAR(100),
CONSTRAINT PKey_MC
PRIMARY KEY (ID,InmateID)
);


CREATE TABLE DUTY
(
OfficerID VARCHAR(10),
DUTY_WeekDay DATE,
DUTY_Time time,
Remarks NVARCHAR(100),
CONSTRAINT PKey_DUTY
PRIMARY KEY (OfficerID)
);


CREATE TABLE REHABILITATION
(
OfficerID VARCHAR(10),
InmateID VARCHAR(10),
R_level NVARCHAR(20),
Ludate DATE,
Talents NVARCHAR(30),
Recommendation NVARCHAR(30),
Reward NVARCHAR(30),
Remarks NVARCHAR(30),
CONSTRAINT PKey_RH
PRIMARY KEY (OfficerID,InmateID)
);


CREATE TABLE REPORT
(
ID VARCHAR(10),
OfficerID VARCHAR(10),
AccessLevel NVARCHAR(30),
RP_Date DATE,
Content NVARCHAR(30),
CONSTRAINT PKey_RP
PRIMARY KEY (OfficerID,ID)
);

CREATE TABLE ACCOUNT
(
ID VARCHAR(10) PRIMARY KEY,
PASS VARCHAR(20)
);

ALTER TABLE  RE_LATIVE ADD
CONSTRAINT FK_INM_RLT
FOREIGN KEY (InmateID)
REFERENCES INMATE(ID)
ON DELETE CASCADE;

ALTER TABLE  EN_TRY ADD
CONSTRAINT FK_INM_ENT
FOREIGN KEY (InmateID)
REFERENCES INMATE(ID)
ON DELETE CASCADE;

ALTER TABLE  RE_LEASE ADD
CONSTRAINT FK_INM_RLS
FOREIGN KEY (InmateID)
REFERENCES  INMATE(ID)
ON DELETE CASCADE;

ALTER TABLE   MEDCHECKS ADD
CONSTRAINT FK_INM_MC
FOREIGN KEY (InmateID)
REFERENCES INMATE( ID)
ON DELETE CASCADE;

ALTER TABLE  REHABILITATION ADD
CONSTRAINT FK_INM_RHB
FOREIGN KEY (InmateID)
REFERENCES  INMATE( ID)
ON DELETE CASCADE;

ALTER TABLE  DUTY ADD
CONSTRAINT FK_OFF_DUTY
FOREIGN KEY (OfficerID)
REFERENCES  OFFICER(ID)
ON DELETE CASCADE;

ALTER TABLE  REHABILITATION  ADD
CONSTRAINT FK_OFF_RHB
FOREIGN KEY (OfficerID)
REFERENCES OFFICER(ID)
ON DELETE CASCADE;

ALTER TABLE REPORT  ADD
CONSTRAINT FK_OFF_RP
FOREIGN KEY (OfficerID)	
REFERENCES OFFICER(ID)
ON DELETE CASCADE;

INSERT `OFFICER` (`ID`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Addr`, `Phone`, `Department`) VALUES (N'DI001', N'Hồ', N'Dương Nhật', N'Duy', N'Nam', CAST(N'1996-10-02' AS Date), N'Tây Ninh', N'099999999', N'Cấp dưỡng');
INSERT `OFFICER` (`ID`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Addr`, `Phone`, `Department`) VALUES (N'ER003', N'Phạm', N'Minh Quang', N'Duy', N'Nam', CAST(N'1996-8-02' AS Date), N'Lâm Đồng', N'099999997', N'Nhận/phóng thích tù nhân');
INSERT `OFFICER` (`ID`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Addr`, `Phone`, `Department`) VALUES (N'HC002', N'Nguyễn', N'Thanh', N'Danh', N'Nam', CAST(N'1995-6-02' AS Date), N'Vĩnh Long', N'099999998', N'Y tế');
INSERT `OFFICER` (`ID`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Addr`, `Phone`, `Department`) VALUES (N'MA005', N'Đặng', N'Nhật ', N'Duy', N'Nam', CAST(N'1992-12-8' AS Date), N'Bình Định', N'099999995', N'Quản lý');
INSERT `OFFICER` (`ID`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Addr`, `Phone`, `Department`) VALUES (N'RH004', N'Lê', N'', N'Dân', N'nam', CAST(N'1996-10-02 ' AS Date), N'TP HCM', N'099999996', N'Cải tạo/quản giáo');
INSERT `DUTY` (`OfficerID`, `DUTY_WeekDay`, `DUTY_Time`, `Remarks`) VALUES (N'DI001', CAST(N'2016-10-02' AS Date), CAST(N'10:00:00' AS Time), N'BT');
INSERT `DUTY` (`OfficerID`, `DUTY_WeekDay`, `DUTY_Time`, `Remarks`) VALUES (N'ER003', CAST(N'2016-10-03' AS Date), CAST(N'10:00:00' AS Time), N'BT');
INSERT `DUTY` (`OfficerID`, `DUTY_WeekDay`, `DUTY_Time`, `Remarks`) VALUES (N'HC002', CAST(N'2016-10-02' AS Date), CAST(N'10:00:00' AS Time), N'BT');
INSERT `DUTY` (`OfficerID`, `DUTY_WeekDay`, `DUTY_Time`, `Remarks`) VALUES (N'MA005', CAST(N'2016-10-05' AS Date), CAST(N'10:00:00' AS Time), N'BT');
INSERT `DUTY` (`OfficerID`, `DUTY_WeekDay`, `DUTY_Time`, `Remarks`) VALUES (N'RH004', CAST(N'2016-10-04' AS Date), CAST(N'10:00:00' AS Time), N'BT');
INSERT `INMATE` (`ID`, `Photo`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Hair`, `Eyes`, `Eth`, `Addr`, `Reason`, `Custody`, `Availability`, `BookIn`, `BookOut`) VALUES (N'IM001', NULL, N'Nguyễn', N'Tuấn', N'Anh', N'Nam', CAST(N'1986-10-02' AS Date), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT `INMATE` (`ID`, `Photo`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Hair`, `Eyes`, `Eth`, `Addr`, `Reason`, `Custody`, `Availability`, `BookIn`, `BookOut`) VALUES (N'IM002', NULL, N'Lê', N'Thị', N'Hoa', N'Nữ', CAST(N'1990-8-9' AS Date), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT `INMATE` (`ID`, `Photo`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Hair`, `Eyes`, `Eth`, `Addr`, `Reason`, `Custody`, `Availability`, `BookIn`, `BookOut`) VALUES (N'IM003', NULL, N'Võ', N'Văn', N'Tuấn', N'Nam', CAST(N'1979-5-6' AS Date), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT `INMATE` (`ID`, `Photo`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Hair`, `Eyes`, `Eth`, `Addr`, `Reason`, `Custody`, `Availability`, `BookIn`, `BookOut`) VALUES (N'IM004', NULL, N'Trần', N'Văn', N'Phú', N'Nam', CAST(N'1991-3-4' AS Date), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT `REHABILITATION` (`OfficerID`, `InmateID`, `R_level`, `Ludate`, `Talents`, `Recommendation`, `Reward`, `Remarks`) VALUES (N'MA005', N'IM002', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT `REHABILITATION` (`OfficerID`, `InmateID`, `R_level`, `Ludate`, `Talents`, `Recommendation`, `Reward`, `Remarks`) VALUES (N'RH004', N'IM001', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT `REPORT` (`ID`, `OfficerID`, `AccessLevel`, `RP_Date`, `Content`) VALUES (N'RP001', N'DI001', N'1', CAST(N'2016-10-02' AS Date), N'BÁO CÁO 1');
INSERT `REPORT` (`ID`, `OfficerID`, `AccessLevel`, `RP_Date`, `Content`) VALUES (N'RP003', N'ER003', N'3', CAST(N'2016-10-03' AS Date), N'BÁO CÁO 3');
INSERT `REPORT` (`ID`, `OfficerID`, `AccessLevel`, `RP_Date`, `Content`) VALUES (N'RP002', N'HC002', N'2', CAST(N'2016-10-03' AS Date), N'BÁO CÁO 2');
INSERT `REPORT` (`ID`, `OfficerID`, `AccessLevel`, `RP_Date`, `Content`) VALUES (N'RP005', N'MA005', N'5', CAST(N'2016-10-05' AS Date), N'BÁO CÁO 5');
INSERT `REPORT` (`ID`, `OfficerID`, `AccessLevel`, `RP_Date`, `Content`) VALUES (N'RP004', N'RH004', N'4', CAST(N'2016-10-04' AS Date), N'BÁO CÁO 4');
INSERT `RE_LATIVE` (`ID`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Addr`, `Phone`, `InmateID`, `Visit`) VALUES (N'RE001', N'Lê', N'Văn', N'Bình', N'Nam', CAST(N'1986-11-5' AS Date), NULL, NULL, N'IM001', '1');
INSERT `RE_LATIVE` (`ID`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Addr`, `Phone`, `InmateID`, `Visit`) VALUES (N'RE002', N'Nguyễn', N'Thị', N'Hồng', N'Nữ', CAST(N'1975-8-3' AS Date), NULL, NULL, N'IM002', '1');
INSERT `RE_LATIVE` (`ID`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Addr`, `Phone`, `InmateID`, `Visit`) VALUES (N'RE003', N'Ngô', N'Việt', N'Khoa', N'Nam', CAST(N'1980-7-7' AS Date), NULL, NULL, N'IM003', '1');
INSERT `RE_LATIVE` (`ID`, `Lastname`, `Midname`, `Firstname`, `Gender`, `DOB`, `Addr`, `Phone`, `InmateID`, `Visit`) VALUES (N'RE004', N'Hồ', N'', N'Ân', N'Nam', CAST(N'1968-2-9' AS Date), NULL, NULL, N'IM004', '1');
INSERT `EN_TRY` (`ID`, `InmateID`, `ENTRY_Date`, `Remarks`) VALUES (N'ET001', N'IM001', CAST(N'2016-10-02' AS Date), N'BT');
INSERT `EN_TRY` (`ID`, `InmateID`, `ENTRY_Date`, `Remarks`) VALUES (N'ET002', N'IM003', CAST(N'2016-10-02' AS Date), N'BT');
INSERT `EN_TRY` (`ID`, `InmateID`, `ENTRY_Date`, `Remarks`) VALUES (N'ET003', N'IM004', CAST(N'2016-10-02' AS Date), N'BT');
INSERT `EN_TRY` (`ID`, `InmateID`, `ENTRY_Date`, `Remarks`) VALUES (N'ET004', N'IM004', CAST(N'2016-11-02' AS Date), N'BT');
INSERT `EN_TRY` (`ID`, `InmateID`, `ENTRY_Date`, `Remarks`) VALUES (N'ET005', N'IM002', CAST(N'2016-10-02' AS Date), N'BT');
INSERT `RE_LEASE` (`ID`, `InmateID`, `RELEASE_Date`, `Remarks`) VALUES (N'RL001', N'IM001', CAST(N'2018-10-02' AS Date), N'');
INSERT `RE_LEASE` (`ID`, `InmateID`, `RELEASE_Date`, `Remarks`) VALUES (N'RL002', N'IM003', CAST(N'2020-10-02' AS Date), N'');
INSERT `RE_LEASE` (`ID`, `InmateID`, `RELEASE_Date`, `Remarks`) VALUES (N'RL004', N'IM004', CAST(N'2020-10-06' AS Date), N'');
INSERT `MEDCHECKS` (`ID`, `InmateID`, `MEDCHECKS_Date`, `Urgency`, `Condi`, `Remarks`) VALUES (N'MC001', N'IM001', CAST(N'2016-10-02' AS Date), NULL, NULL, NULL);
INSERT `MEDCHECKS` (`ID`, `InmateID`, `MEDCHECKS_Date`, `Urgency`, `Condi`, `Remarks`) VALUES (N'MC002', N'IM004', NULL, NULL, NULL, NULL);
INSERT `MEDCHECKS` (`ID`, `InmateID`, `MEDCHECKS_Date`, `Urgency`, `Condi`, `Remarks`) VALUES (N'MC003', N'IM003', NULL, NULL, NULL, NULL);

INSERT `ACCOUNT` (`ID`, `PASS`) VALUES ('DI001', 'DI001');
INSERT `ACCOUNT` (`ID`, `PASS`) VALUES ('ER003', 'ER003');
INSERT `ACCOUNT` (`ID`, `PASS`) VALUES ('HC002', 'HC002');
INSERT `ACCOUNT` (`ID`, `PASS`) VALUES ('MA005', 'MA005');
INSERT `ACCOUNT` (`ID`, `PASS`) VALUES ('RH004', 'RH004');


