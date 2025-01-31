﻿--set quoted_identifier on

declare @ReportFile_Name nvarchar(max)
declare @Report_Name nvarchar(max)
declare @ReportFile_File nvarchar(max)
declare @Report_RootName nvarchar(max)=N'درخواستها'
-------------------------------------------------------------------------------------------------------------
set @ReportFile_Name=N'R4343A630'
set @Report_Name=N'اضافه کار پرسنل (مقایسه)'
set @ReportFile_File=N'<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<StiSerializer version="1.02" type="Net" application="StiReport">
  <Dictionary Ref="1" type="Dictionary" isKey="true">
    <BusinessObjects isList="true" count="0" />
    <Databases isList="true" count="1">
      <Connection Ref="2" type="Stimulsoft.Report.Dictionary.StiSqlDatabase" isKey="true">
        <Alias>Connection</Alias>
        <ConnectionString>Integrated Security=False;Data Source=localhost;Initial Catalog=GhadirGTS;Password=123;User ID=sa</ConnectionString>
        <Name>Connection</Name>
      </Connection>
    </Databases>
    <DataSources isList="true" count="2">
      <DataSource1 Ref="3" type="Stimulsoft.Report.Dictionary.StiSqlSource" isKey="true">
        <Alias>DataSource1</Alias>
        <Columns isList="true" count="4">
          <value>prs_time,System.String</value>
          <value>prs_name,System.String</value>
          <value>prs_code,System.String</value>
          <value>prs_date,System.String</value>
        </Columns>
        <CommandTimeout>30</CommandTimeout>
        <Dictionary isRef="1" />
        <Name>DataSource1</Name>
        <NameInSource>Connection</NameInSource>
        <Parameters isList="true" count="3">
          <value>ToDate,,4,0</value>
          <value>Order,,16,0</value>
          <value>Value,,8,0</value>
        </Parameters>
        <SqlCommand>declare @TDate nvarchar(10)= SUBSTRING(cast( cast(@ToDate as date) as nvarchar(max)),1,10)
select
(
	case SUBSTRING(dbo.GTS_ASM_MiladiToShamsi(@TDate),6,2)
when 1 then ''فروردین ''+SUBSTRING(dbo.GTS_ASM_MiladiToShamsi(@TDate),1,4)
when 2 then ''اردیبهشت ''+SUBSTRING(dbo.GTS_ASM_MiladiToShamsi(@TDate),1,4)
when 3 then ''خرداد ''+SUBSTRING(dbo.GTS_ASM_MiladiToShamsi(@TDate),1,4)
when 4 then ''تیر ''+SUBSTRING(dbo.GTS_ASM_MiladiToShamsi(@TDate),1,4)
when 5 then ''مرداد ''+SUBSTRING(dbo.GTS_ASM_MiladiToShamsi(@TDate),1,4)
when 6 then ''شهریور ''+SUBSTRING(dbo.GTS_ASM_MiladiToShamsi(@TDate),1,4)
when 7 then ''مهر ''+SUBSTRING(dbo.GTS_ASM_MiladiToShamsi(@TDate),1,4)
when 8 then ''آبان ''+SUBSTRING(dbo.GTS_ASM_MiladiToShamsi(@TDate),1,4)
when 9 then ''آذر ''+SUBSTRING(dbo.GTS_ASM_MiladiToShamsi(@TDate),1,4)
when 10 then ''دی ''+SUBSTRING(dbo.GTS_ASM_MiladiToShamsi(@TDate),1,4)
when 11 then ''بهمن ''+SUBSTRING(dbo.GTS_ASM_MiladiToShamsi(@TDate),1,4)
when 12 then ''اسفند ''+SUBSTRING(dbo.GTS_ASM_MiladiToShamsi(@TDate),1,4)
end
	) as prs_date,
	
	
cast(cast( (scv.ScndCnpValue_Value / 60) as decimal) as nvarchar(max))+'':''+cast( (scv.ScndCnpValue_Value % 60) as nvarchar(max)) as prs_time,
p.Prs_FirstName+'' ''+p.prs_lastname as prs_name,
p.Prs_Barcode as prs_code
from TA_SecondaryConceptValue scv
left join TA_Person p on p.Prs_ID=scv.ScndCnpValue_PersonId

where ScndCnpValue_SecondaryConceptId = 7
and scv.ScndCnpValue_Value &gt;= @Value
and scv.ScndCnpValue_PersonId in({ReportHelper.Instance().ModifiedIds()})
and (@ToDate between scv.ScndCnpValue_FromDate and scv.ScndCnpValue_ToDate) 
order by scv.ScndCnpValue_Value desc
</SqlCommand>
      </DataSource1>
      <nameOrg Ref="4" type="Stimulsoft.Report.Dictionary.StiSqlSource" isKey="true">
        <Alias>nameOrg</Alias>
        <Columns isList="true" count="1">
          <value>OrgDef_Name,System.String</value>
        </Columns>
        <CommandTimeout>30</CommandTimeout>
        <Dictionary isRef="1" />
        <Name>nameOrg</Name>
        <NameInSource>Connection</NameInSource>
        <Parameters isList="true" count="0" />
        <SqlCommand>select  OrgDef_Name from TA_DataAccessOrgan

join  TA_OrganDefine on DataAccessOrgan_OrgDefID=OrgDef_ID

where DataAccessOrgan_UserID={ReportHelper.Instance().UserId}</SqlCommand>
      </nameOrg>
    </DataSources>
    <Relations isList="true" count="0" />
    <Report isRef="0" />
    <Variables isList="true" count="0" />
  </Dictionary>
  <EngineVersion>EngineV2</EngineVersion>
  <GlobalizationStrings isList="true" count="0" />
  <MetaTags isList="true" count="0" />
  <Pages isList="true" count="1">
    <Page1 Ref="5" type="Page" isKey="true">
      <Border>None;Black;2;Solid;False;4;Black</Border>
      <Brush>Transparent</Brush>
      <Components isList="true" count="3">
        <phbMain Ref="6" type="PageHeaderBand" isKey="true">
          <Brush>Transparent</Brush>
          <ClientRectangle>0,0.2,7.72,0.63</ClientRectangle>
          <Components isList="true" count="7">
            <txtOrgDefName Ref="7" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>2.19,0,3.37,0.57</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,18,Bold</Font>
              <Guid>a016da2d0e504b028af46db810b99772</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtOrgDefName</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>{nameOrg.OrgDef_Name}
گزارش اضافه کار پرسنل</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=True, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
            </txtOrgDefName>
            <txteportDate Ref="8" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>1.04,0,1.02,0.24</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>cdc7e6ad29574f5291cd9a614eac9495</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txteportDate</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>: تاریخ تهیه گزارش</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </txteportDate>
            <txtReporter Ref="9" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>1.28,0.24,0.79,0.24</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>00bb6150a7274e549c55e1ca9e604c60</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtReporter</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>: تهیه کننده</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </txtReporter>
            <txtShamsiGetNow Ref="10" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>0.1,0,0.94,0.24</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>ad76e2d68bf541c0839169f862d23ca1</Guid>
              <Margins>0,0,0,0</Margins>
              <Name>txtShamsiGetNow</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>{ReportHelper.Instance().ShamsiGetNow()}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </txtShamsiGetNow>
            <txtUserName Ref="11" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>0.1,0.24,1.18,0.24</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>2481423800374b009aa89d8ee895938f</Guid>
              <Margins>0,0,0,0</Margins>
              <Name>txtUserName</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>{ReportHelper.Instance().UserName}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </txtUserName>
            <Text1 Ref="12" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>7.2,0.1,0.42,0.24</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>1d010568ce1b47af8009b73995d68b3c</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text1</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>: تاریخ</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </Text1>
            <Text2 Ref="13" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>6.2,0.1,0.94,0.24</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>dfa27ae090ec4b2a922202ca23e27e22</Guid>
              <Margins>0,0,0,0</Margins>
              <Name>Text2</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>{DataSource1.prs_date}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </Text2>
          </Components>
          <Conditions isList="true" count="0" />
          <Guid>c5acf9b618cc40ea8d3c81665e1b564e</Guid>
          <Name>phbMain</Name>
          <Page isRef="5" />
          <Parent isRef="5" />
        </phbMain>
        <HeaderDataSource1 Ref="14" type="HeaderBand" isKey="true">
          <Brush>[191:191:191]</Brush>
          <ClientRectangle>0,1.23,7.72,0.3</ClientRectangle>
          <Components isList="true" count="3">
            <HeaderDataSource1_prs_time Ref="15" type="Text" isKey="true">
              <Border>Top, Left, Bottom;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <ClientRectangle>0,0,2.6,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderDataSource1_prs_time</Name>
              <Page isRef="5" />
              <Parent isRef="14" />
              <Text>اضافه کاری</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderDataSource1_prs_time>
            <HeaderDataSource1_prs_name Ref="16" type="Text" isKey="true">
              <Border>Top, Bottom;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <ClientRectangle>2.6,0,2.6,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderDataSource1_prs_name</Name>
              <Page isRef="5" />
              <Parent isRef="14" />
              <Text>نام و نام خانوادگی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderDataSource1_prs_name>
            <HeaderDataSource1_prs_code Ref="17" type="Text" isKey="true">
              <Border>Top, Right, Bottom;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <ClientRectangle>5.2,0,2.5,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderDataSource1_prs_code</Name>
              <Page isRef="5" />
              <Parent isRef="14" />
              <Text>شماره پرسنلی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderDataSource1_prs_code>
          </Components>
          <ComponentStyle>title</ComponentStyle>
          <Conditions isList="true" count="0" />
          <Name>HeaderDataSource1</Name>
          <Page isRef="5" />
          <Parent isRef="5" />
        </HeaderDataSource1>
        <DataDataSource1 Ref="18" type="DataBand" isKey="true">
          <Brush>Transparent</Brush>
          <BusinessObjectGuid isNull="true" />
          <ClientRectangle>0,1.93,7.72,0.3</ClientRectangle>
          <Components isList="true" count="3">
            <DataDataSource1_prs_time Ref="19" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>0,0,2.6,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataDataSource1_prs_time</Name>
              <Page isRef="5" />
              <Parent isRef="18" />
              <Text>{Persian(DataSource1.prs_time)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </DataDataSource1_prs_time>
            <DataDataSource1_prs_name Ref="20" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>2.6,0,2.6,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataDataSource1_prs_name</Name>
              <Page isRef="5" />
              <Parent isRef="18" />
              <Text>{DataSource1.prs_name}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </DataDataSource1_prs_name>
            <DataDataSource1_prs_code Ref="21" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>5.2,0,2.5,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataDataSource1_prs_code</Name>
              <Page isRef="5" />
              <Parent isRef="18" />
              <Text>{Persian(DataSource1.prs_code)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </DataDataSource1_prs_code>
          </Components>
          <Conditions isList="true" count="0" />
          <DataSourceName>DataSource1</DataSourceName>
          <EvenStyle>even</EvenStyle>
          <Filters isList="true" count="0" />
          <Name>DataDataSource1</Name>
          <OddStyle>odd</OddStyle>
          <Page isRef="5" />
          <Parent isRef="5" />
          <Sort isList="true" count="0" />
        </DataDataSource1>
      </Components>
      <Conditions isList="true" count="0" />
      <Guid>96e2120375d14ce584d25c4206064c3d</Guid>
      <Margins>0.39,0.39,0.39,0.39</Margins>
      <Name>Page1</Name>
      <PageHeight>11</PageHeight>
      <PageWidth>8.5</PageWidth>
      <PaperSize>Letter</PaperSize>
      <Report isRef="0" />
      <Watermark Ref="22" type="Stimulsoft.Report.Components.StiWatermark" isKey="true">
        <Font>Arial,100</Font>
        <TextBrush>[50:0:0:0]</TextBrush>
      </Watermark>
    </Page1>
  </Pages>
  <PrinterSettings Ref="23" type="Stimulsoft.Report.Print.StiPrinterSettings" isKey="true" />
  <ReferencedAssemblies isList="true" count="8">
    <value>System.Dll</value>
    <value>System.Drawing.Dll</value>
    <value>System.Windows.Forms.Dll</value>
    <value>System.Data.Dll</value>
    <value>System.Xml.Dll</value>
    <value>Stimulsoft.Controls.Dll</value>
    <value>Stimulsoft.Base.Dll</value>
    <value>Stimulsoft.Report.Dll</value>
  </ReferencedAssemblies>
  <ReportAlias>Report</ReportAlias>
  <ReportChanged>4/15/2013 12:39:09 PM</ReportChanged>
  <ReportCreated>4/15/2013 11:35:41 AM</ReportCreated>
  <ReportFile>D:\EzafekariReport.mrt</ReportFile>
  <ReportGuid>f343cdb5ccc94f52ad6c929a144972a2</ReportGuid>
  <ReportName>Report</ReportName>
  <ReportUnit>Inches</ReportUnit>
  <ReportVersion>2011.3.1200</ReportVersion>
  <Script>using System;
using System.Drawing;
using System.Windows.Forms;
using System.Data;
using Stimulsoft.Controls;
using Stimulsoft.Base.Drawing;
using Stimulsoft.Report;
using Stimulsoft.Report.Dialogs;
using Stimulsoft.Report.Components;

namespace Reports
{
    public class Report : Stimulsoft.Report.StiReport
    {
        public Report()        {
            this.InitializeComponent();
        }

        #region StiReport Designer generated code - do not modify
        #endregion StiReport Designer generated code - do not modify
    }
}
</Script>
  <ScriptLanguage>CSharp</ScriptLanguage>
  <Styles isList="true" count="3">
    <even Ref="24" type="Stimulsoft.Report.StiStyle" isKey="true">
      <Brush>AntiqueWhite</Brush>
      <Conditions isList="true" count="0" />
      <Description />
      <Font>Arial,12,Regular,Point,False,0</Font>
      <HorAlignment>Right</HorAlignment>
      <Name>even</Name>
      <TextBrush>Black</TextBrush>
      <VertAlignment>Center</VertAlignment>
    </even>
    <odd Ref="25" type="Stimulsoft.Report.StiStyle" isKey="true">
      <Brush>Transparent</Brush>
      <Conditions isList="true" count="0" />
      <Description />
      <Font>Arial,12,Regular,Point,False,0</Font>
      <HorAlignment>Right</HorAlignment>
      <Name>odd</Name>
      <TextBrush>Black</TextBrush>
      <VertAlignment>Center</VertAlignment>
    </odd>
    <title Ref="26" type="Stimulsoft.Report.StiStyle" isKey="true">
      <Brush>[191:191:191]</Brush>
      <Conditions isList="true" count="0" />
      <Description />
      <Font>Arial,12,Bold,Point,False,0</Font>
      <HorAlignment>Center</HorAlignment>
      <Name>title</Name>
      <TextBrush>Black</TextBrush>
      <VertAlignment>Center</VertAlignment>
    </title>
  </Styles>
</StiSerializer>'
-------------------------------------------------------------------------------------------------------------
DELETE FROM TA_ReportParameter WHERE ReportParameter_RptFileId = (SELECT ReportFile_ID FROM TA_ReportFile WHERE ReportFile_Name = @ReportFile_Name)
DELETE FROM TA_Report WHERE Report_Name = @Report_Name
DELETE FROM TA_ReportFile WHERE ReportFile_Name = @ReportFile_Name
-------------------------------------------------------------------------------------------------------------
INSERT INTO [TA_ReportFile]([ReportFile_Name],[ReportFile_File],[ReportFile_Description])
VALUES(@ReportFile_Name,@ReportFile_File,@Report_Name)
-------------------------------------------------------------------------------------------------------------
INSERT INTO [TA_Report]
           (
            [Report_Name]
           ,[Report_ParentId]
           --,[Report_Path]
           ,[Report_ReportFileId]
           ,[Report_IsReport]
           ,[Report_ParentPath]
           ,[Report_Order]
           )
     VALUES
           (
            @Report_Name
           ,(SELECT Report_ID FROM TA_Report WHERE Report_Name = @Report_RootName)
           --,','+cast((SELECT Report_ID FROM TA_Report WHERE Report_Name = @Report_RootName) as nvarchar(max))+','
           ,(SELECT ReportFile_ID FROM TA_ReportFile WHERE ReportFile_Name = @ReportFile_Name)
           ,1
           ,','+cast((SELECT Report_ID FROM TA_Report WHERE Report_Name = @Report_RootName) as nvarchar(max))+','
           ,(SELECT MAX(Report_Order)+1 FROM TA_Report)
           )
--------------------------------------------------------------------------------------------------------------
INSERT INTO [TA_ReportParameter]
           (
            [ReportParameter_RptUIParamId]
           ,[ReportParameter_Name]
           ,[ReportParameter_RptFileId]
           )
     VALUES
           (
            (SELECT RptUIParameter_ID FROM TA_ReportUIParameter WHERE RptUIParameter_ActionId like N'PersonDateRangeValue')
           ,'@Order'
           ,(SELECT ReportFile_ID FROM TA_ReportFile WHERE ReportFile_Name = @ReportFile_Name)
           )
           
           INSERT INTO [TA_ReportParameter]
           (
            [ReportParameter_RptUIParamId]
           ,[ReportParameter_Name]
           ,[ReportParameter_RptFileId]
           )
     VALUES
           (
            (SELECT RptUIParameter_ID FROM TA_ReportUIParameter WHERE RptUIParameter_ActionId like N'PersonDateRangeValue')
           ,'@ToDate'
           ,(SELECT ReportFile_ID FROM TA_ReportFile WHERE ReportFile_Name = @ReportFile_Name)
           )
           
                      INSERT INTO [TA_ReportParameter]
           (
            [ReportParameter_RptUIParamId]
           ,[ReportParameter_Name]
           ,[ReportParameter_RptFileId]
           )
     VALUES
           (
            (SELECT RptUIParameter_ID FROM TA_ReportUIParameter WHERE RptUIParameter_ActionId like N'PersonDateRangeValue')
           ,'@Value'
           ,(SELECT ReportFile_ID FROM TA_ReportFile WHERE ReportFile_Name = @ReportFile_Name)
           )
           
