/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     7/2/2023 8:28:08 PM                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_CO_CO_SINH_VIE') then
    alter table CO
       delete foreign key FK_CO_CO_SINH_VIE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CO_CO2__OI_TUON') then
    alter table CO
       delete foreign key FK_CO_CO2__OI_TUON
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CT__ANG__CT__ANG_K_PHIEU__A') then
    alter table CT__ANG_KY
       delete foreign key FK_CT__ANG__CT__ANG_K_PHIEU__A
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CT__ANG__CT__ANG_K_MON_HOC') then
    alter table CT__ANG_KY
       delete foreign key FK_CT__ANG__CT__ANG_K_MON_HOC
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CT__AO_T_CT__AO_TA_NGANH') then
    alter table CT__AO_TAO
       delete foreign key FK_CT__AO_T_CT__AO_TA_NGANH
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CT__AO_T_CT__AO_TA_MON_HOC') then
    alter table CT__AO_TAO
       delete foreign key FK_CT__AO_T_CT__AO_TA_MON_HOC
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_GOM_GOM_NGANH') then
    alter table GOM
       delete foreign key FK_GOM_GOM_NGANH
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_GOM_GOM2_KHOA') then
    alter table GOM
       delete foreign key FK_GOM_GOM2_KHOA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_KHOA_QUAN_LY_SINH_VIE') then
    alter table KHOA
       delete foreign key FK_KHOA_QUAN_LY_SINH_VIE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_NGANH_THUOC_SINH_VIE') then
    alter table NGANH
       delete foreign key FK_NGANH_THUOC_SINH_VIE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PHIEU__A__ANG_KY_SINH_VIE') then
    alter table PHIEU__ANG_KY
       delete foreign key FK_PHIEU__A__ANG_KY_SINH_VIE
end if;

drop index if exists CO.CO_FK;

drop index if exists CO.CO2_FK;

drop index if exists CO.CO_PK;

drop table if exists CO;

drop index if exists CT__ANG_KY.CT__ANG_KY_FK;

drop index if exists CT__ANG_KY.CT__ANG_KY2_FK;

drop index if exists CT__ANG_KY.CT__ANG_KY_PK;

drop table if exists CT__ANG_KY;

drop index if exists CT__AO_TAO.CT__AO_TAO_FK;

drop index if exists CT__AO_TAO.CT__AO_TAO2_FK;

drop index if exists CT__AO_TAO.CT__AO_TAO_PK;

drop table if exists CT__AO_TAO;

drop index if exists GOM.GOM_FK;

drop index if exists GOM.GOM2_FK;

drop index if exists GOM.GOM_PK;

drop table if exists GOM;

drop index if exists KHOA.QUAN_LY_FK;

drop index if exists KHOA.KHOA_PK;

drop table if exists KHOA;

drop index if exists MON_HOC.MON_HOC_PK;

drop table if exists MON_HOC;

drop index if exists NGANH.THUOC_FK;

drop index if exists NGANH.NGANH_PK;

drop table if exists NGANH;

drop index if exists PHIEU__ANG_KY._ANG_KY_FK;

drop index if exists PHIEU__ANG_KY.PHIEU__ANG_KY_PK;

drop table if exists PHIEU__ANG_KY;

drop table if exists QUY__INH_HE_THONG;

drop index if exists SINH_VIEN.SINH_VIEN_PK;

drop table if exists SINH_VIEN;

drop index if exists _OI_TUONG._OI_TUONG_PK;

drop table if exists _OI_TUONG;

/*==============================================================*/
/* Table: CO                                                    */
/*==============================================================*/
create table CO 
(
   MADOITUONG           varchar(50)                    not null,
   MSSV                 varchar(50)                    not null,
   constraint PK_CO primary key (MADOITUONG, MSSV)
);

/*==============================================================*/
/* Index: CO_PK                                                 */
/*==============================================================*/
create unique index CO_PK on CO (
MADOITUONG ASC,
MSSV ASC
);

/*==============================================================*/
/* Index: CO2_FK                                                */
/*==============================================================*/
create index CO2_FK on CO (
MADOITUONG ASC
);

/*==============================================================*/
/* Index: CO_FK                                                 */
/*==============================================================*/
create index CO_FK on CO (
MSSV ASC
);

/*==============================================================*/
/* Table: CT__ANG_KY                                            */
/*==============================================================*/
create table CT__ANG_KY 
(
   MAMON                varchar(50)                    not null,
   MAPHIEUDANGKY        varchar(50)                    not null,
   constraint PK_CT__ANG_KY primary key (MAMON, MAPHIEUDANGKY)
);

/*==============================================================*/
/* Index: CT__ANG_KY_PK                                         */
/*==============================================================*/
create unique index CT__ANG_KY_PK on CT__ANG_KY (
MAMON ASC,
MAPHIEUDANGKY ASC
);

/*==============================================================*/
/* Index: CT__ANG_KY2_FK                                        */
/*==============================================================*/
create index CT__ANG_KY2_FK on CT__ANG_KY (
MAMON ASC
);

/*==============================================================*/
/* Index: CT__ANG_KY_FK                                         */
/*==============================================================*/
create index CT__ANG_KY_FK on CT__ANG_KY (
MAPHIEUDANGKY ASC
);

/*==============================================================*/
/* Table: CT__AO_TAO                                            */
/*==============================================================*/
create table CT__AO_TAO 
(
   MAMON                varchar(50)                    not null,
   MANGANH              varchar(50)                    not null,
   NAM                  char(10)                       null,
   constraint PK_CT__AO_TAO primary key (MAMON, MANGANH)
);

/*==============================================================*/
/* Index: CT__AO_TAO_PK                                         */
/*==============================================================*/
create unique index CT__AO_TAO_PK on CT__AO_TAO (
MAMON ASC,
MANGANH ASC
);

/*==============================================================*/
/* Index: CT__AO_TAO2_FK                                        */
/*==============================================================*/
create index CT__AO_TAO2_FK on CT__AO_TAO (
MAMON ASC
);

/*==============================================================*/
/* Index: CT__AO_TAO_FK                                         */
/*==============================================================*/
create index CT__AO_TAO_FK on CT__AO_TAO (
MANGANH ASC
);

/*==============================================================*/
/* Table: GOM                                                   */
/*==============================================================*/
create table GOM 
(
   MAKHOA               varchar(50)                    not null,
   MANGANH              varchar(50)                    not null,
   constraint PK_GOM primary key (MAKHOA, MANGANH)
);

/*==============================================================*/
/* Index: GOM_PK                                                */
/*==============================================================*/
create unique index GOM_PK on GOM (
MAKHOA ASC,
MANGANH ASC
);

/*==============================================================*/
/* Index: GOM2_FK                                               */
/*==============================================================*/
create index GOM2_FK on GOM (
MAKHOA ASC
);

/*==============================================================*/
/* Index: GOM_FK                                                */
/*==============================================================*/
create index GOM_FK on GOM (
MANGANH ASC
);

/*==============================================================*/
/* Table: KHOA                                                  */
/*==============================================================*/
create table KHOA 
(
   MAKHOA               varchar(50)                    not null,
   MSSV                 varchar(50)                    not null,
   TENKHOA              varchar(50)                    null,
   constraint PK_KHOA primary key (MAKHOA)
);

/*==============================================================*/
/* Index: KHOA_PK                                               */
/*==============================================================*/
create unique index KHOA_PK on KHOA (
MAKHOA ASC
);

/*==============================================================*/
/* Index: QUAN_LY_FK                                            */
/*==============================================================*/
create index QUAN_LY_FK on KHOA (
MSSV ASC
);

/*==============================================================*/
/* Table: MON_HOC                                               */
/*==============================================================*/
create table MON_HOC 
(
   MAMON                varchar(50)                    not null,
   TENMON               varchar(50)                    null,
   SOTINCHILT           integer                        null,
   SOTINCHITH           integer                        null,
   LOAIMON              varchar(50)                    null,
   CACMONTIENQUYET      varchar(50)                    null,
   constraint PK_MON_HOC primary key (MAMON)
);

/*==============================================================*/
/* Index: MON_HOC_PK                                            */
/*==============================================================*/
create unique index MON_HOC_PK on MON_HOC (
MAMON ASC
);

/*==============================================================*/
/* Table: NGANH                                                 */
/*==============================================================*/
create table NGANH 
(
   MANGANH              varchar(50)                    not null,
   MSSV                 varchar(50)                    not null,
   TENNGANH             varchar(50)                    null,
   constraint PK_NGANH primary key (MANGANH)
);

/*==============================================================*/
/* Index: NGANH_PK                                              */
/*==============================================================*/
create unique index NGANH_PK on NGANH (
MANGANH ASC
);

/*==============================================================*/
/* Index: THUOC_FK                                              */
/*==============================================================*/
create index THUOC_FK on NGANH (
MSSV ASC
);

/*==============================================================*/
/* Table: PHIEU__ANG_KY                                         */
/*==============================================================*/
create table PHIEU__ANG_KY 
(
   MAPHIEUDANGKY        varchar(50)                    not null,
   MSSV                 varchar(50)                    not null,
   DATHU                varchar(50)                    null,
   NGAYDANGKY           date                           null,
   HOCKY                char(10)                       null,
   NIENKHOA             varchar(50)                    null,
   constraint PK_PHIEU__ANG_KY primary key (MAPHIEUDANGKY)
);

/*==============================================================*/
/* Index: PHIEU__ANG_KY_PK                                      */
/*==============================================================*/
create unique index PHIEU__ANG_KY_PK on PHIEU__ANG_KY (
MAPHIEUDANGKY ASC
);

/*==============================================================*/
/* Index: _ANG_KY_FK                                            */
/*==============================================================*/
create index _ANG_KY_FK on PHIEU__ANG_KY (
MSSV ASC
);

/*==============================================================*/
/* Table: QUY__INH_HE_THONG                                     */
/*==============================================================*/
create table QUY__INH_HE_THONG 
(
   SOTIEN               integer                        null,
   NGAYAPDUNG           date                           null,
   LOAIMONHOC           varchar(50)                    null
);

/*==============================================================*/
/* Table: SINH_VIEN                                             */
/*==============================================================*/
create table SINH_VIEN 
(
   MSSV                 varchar(50)                    not null,
   HOTEN                varchar(50)                    null,
   NGAYSINH             date                           null,
   GIOITINH             varchar(50)                    null,
   QUEQUAN              varchar(50)                    null,
   constraint PK_SINH_VIEN primary key (MSSV)
);

/*==============================================================*/
/* Index: SINH_VIEN_PK                                          */
/*==============================================================*/
create unique index SINH_VIEN_PK on SINH_VIEN (
MSSV ASC
);

/*==============================================================*/
/* Table: _OI_TUONG                                             */
/*==============================================================*/
create table _OI_TUONG 
(
   MADOITUONG           varchar(50)                    not null,
   TENDOITUONG          varchar(50)                    null,
   TYLEGIAM             varchar(50)                    null,
   HOCPHI               integer                        null,
   constraint PK__OI_TUONG primary key (MADOITUONG)
);

/*==============================================================*/
/* Index: _OI_TUONG_PK                                          */
/*==============================================================*/
create unique index _OI_TUONG_PK on _OI_TUONG (
MADOITUONG ASC
);

alter table CO
   add constraint FK_CO_CO_SINH_VIE foreign key (MSSV)
      references SINH_VIEN (MSSV)
      on update restrict
      on delete restrict;

alter table CO
   add constraint FK_CO_CO2__OI_TUON foreign key (MADOITUONG)
      references _OI_TUONG (MADOITUONG)
      on update restrict
      on delete restrict;

alter table CT__ANG_KY
   add constraint FK_CT__ANG__CT__ANG_K_PHIEU__A foreign key (MAPHIEUDANGKY)
      references PHIEU__ANG_KY (MAPHIEUDANGKY)
      on update restrict
      on delete restrict;

alter table CT__ANG_KY
   add constraint FK_CT__ANG__CT__ANG_K_MON_HOC foreign key (MAMON)
      references MON_HOC (MAMON)
      on update restrict
      on delete restrict;

alter table CT__AO_TAO
   add constraint FK_CT__AO_T_CT__AO_TA_NGANH foreign key (MANGANH)
      references NGANH (MANGANH)
      on update restrict
      on delete restrict;

alter table CT__AO_TAO
   add constraint FK_CT__AO_T_CT__AO_TA_MON_HOC foreign key (MAMON)
      references MON_HOC (MAMON)
      on update restrict
      on delete restrict;

alter table GOM
   add constraint FK_GOM_GOM_NGANH foreign key (MANGANH)
      references NGANH (MANGANH)
      on update restrict
      on delete restrict;

alter table GOM
   add constraint FK_GOM_GOM2_KHOA foreign key (MAKHOA)
      references KHOA (MAKHOA)
      on update restrict
      on delete restrict;

alter table KHOA
   add constraint FK_KHOA_QUAN_LY_SINH_VIE foreign key (MSSV)
      references SINH_VIEN (MSSV)
      on update restrict
      on delete restrict;

alter table NGANH
   add constraint FK_NGANH_THUOC_SINH_VIE foreign key (MSSV)
      references SINH_VIEN (MSSV)
      on update restrict
      on delete restrict;

alter table PHIEU__ANG_KY
   add constraint FK_PHIEU__A__ANG_KY_SINH_VIE foreign key (MSSV)
      references SINH_VIEN (MSSV)
      on update restrict
      on delete restrict;

