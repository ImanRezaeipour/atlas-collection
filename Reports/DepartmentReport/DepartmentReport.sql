﻿--set quoted_identifier on

declare @ReportFile_Name nvarchar(max)
declare @Report_Name nvarchar(max)
declare @ReportFile_File nvarchar(max)
declare @Report_RootName nvarchar(max)=N'درخواستها'
-------------------------------------------------------------------------------------------------------------
set @ReportFile_Name=N'R4343A450'
set @Report_Name=N'بخش ها'
set @ReportFile_File=N'<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<StiSerializer version="1.02" type="Net" application="StiReport">
  <Dictionary Ref="1" type="Dictionary" isKey="true">
    <BusinessObjects isList="true" count="0" />
    <Databases isList="true" count="1">
      <Connection Ref="2" type="Stimulsoft.Report.Dictionary.StiSqlDatabase" isKey="true">
        <Alias>Connection</Alias>
        <ConnectionString>User ID=sa;Integrated Security=False;Password=123;Data Source=iman-pc;Initial Catalog=falatSlow</ConnectionString>
        <Name>Connection</Name>
      </Connection>
    </Databases>
    <DataSources isList="true" count="2">
      <TA_Department Ref="3" type="Stimulsoft.Report.Dictionary.StiSqlSource" isKey="true">
        <Alias>TA_Department</Alias>
        <Columns isList="true" count="8">
          <value>dep_ID,System.Decimal</value>
          <value>dep_Name,System.String</value>
          <value>dep_CustomCode,System.String</value>
          <value>dep_ParentID,System.Decimal</value>
          <value>dep_ParentPath,System.String</value>
          <value>dep_ChildPath,System.String</value>
          <value>Prs_DepartmentId,System.Decimal</value>
          <value>id,System.Int32</value>
        </Columns>
        <CommandTimeout>30</CommandTimeout>
        <Dictionary isRef="1" />
        <Name>TA_Department</Name>
        <NameInSource>Connection</NameInSource>
        <Parameters isList="true" count="0" />
        <SqlCommand>select * from TA_Department d
left join (select Prs_DepartmentId,COUNT(Prs_ID) id from TA_Person group by Prs_DepartmentId) p on p.Prs_DepartmentId=d.dep_ID
order by d.dep_CustomCode</SqlCommand>
      </TA_Department>
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
          <ClientRectangle>0,0.2,7.72,0.71</ClientRectangle>
          <Components isList="true" count="5">
            <txtOrgDefName Ref="7" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>2.12,0,3.79,0.65</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,24,Bold,Point,False,0</Font>
              <Guid>9e1b69f5018b440d9dff48dc40062171</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtOrgDefName</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>{nameOrg.OrgDef_Name}
گزارش بخش ها</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=True, Trimming=None, WordWrap=False, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </txtOrgDefName>
            <txteportDate Ref="8" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>0.94,0,1.02,0.24</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>01a1f9538bda487a8f48b7811e789188</Guid>
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
              <ClientRectangle>1.18,0.24,0.79,0.24</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>82d8f8140d954cb097e2b5bf7895708c</Guid>
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
              <ClientRectangle>0,0,0.94,0.24</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>bd940be760544db98cc9ae3000e01609</Guid>
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
              <ClientRectangle>0,0.24,1.18,0.24</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>b44e2a4d0bc54fc0aa6ac39049ff45c3</Guid>
              <Margins>0,0,0,0</Margins>
              <Name>txtUserName</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>{ReportHelper.Instance().UserName}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </txtUserName>
          </Components>
          <Conditions isList="true" count="0" />
          <Guid>164f1a261f244a8d9e4381fde10b3c00</Guid>
          <Name>phbMain</Name>
          <Page isRef="5" />
          <Parent isRef="5" />
        </phbMain>
        <HeaderBand1 Ref="12" type="HeaderBand" isKey="true">
          <Brush>Gainsboro</Brush>
          <ClientRectangle>0,1.31,7.72,0.3</ClientRectangle>
          <Components isList="true" count="3">
            <Text2 Ref="13" type="Text" isKey="true">
              <Brush>Gainsboro</Brush>
              <ClientRectangle>4.7,0,2,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text2</Name>
              <Page isRef="5" />
              <Parent isRef="12" />
              <Text>نام بخش</Text>
              <TextBrush>Black</TextBrush>
              <VertAlignment>Center</VertAlignment>
            </Text2>
            <Text4 Ref="14" type="Text" isKey="true">
              <Brush>Gainsboro</Brush>
              <ClientRectangle>6.7,0,1,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text4</Name>
              <Page isRef="5" />
              <Parent isRef="12" />
              <Text>کد بخش</Text>
              <TextBrush>Black</TextBrush>
              <VertAlignment>Center</VertAlignment>
            </Text4>
            <Text6 Ref="15" type="Text" isKey="true">
              <Brush>Gainsboro</Brush>
              <ClientRectangle>3.7,0,1,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text6</Name>
              <Page isRef="5" />
              <Parent isRef="12" />
              <Text>تعداد پرسنل</Text>
              <TextBrush>Black</TextBrush>
              <VertAlignment>Center</VertAlignment>
            </Text6>
          </Components>
          <Conditions isList="true" count="0" />
          <Name>HeaderBand1</Name>
          <Page isRef="5" />
          <Parent isRef="5" />
        </HeaderBand1>
        <HierarchicalBand1 Ref="16" type="Stimulsoft.Report.Components.StiHierarchicalBand" isKey="true">
          <Brush>Transparent</Brush>
          <BusinessObjectGuid isNull="true" />
          <ClientRectangle>0,2.01,7.72,0.3</ClientRectangle>
          <Components isList="true" count="3">
            <Text3 Ref="17" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <ClientRectangle>6.7,0,1,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8.25,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text3</Name>
              <Page isRef="5" />
              <Parent isRef="16" />
              <Text>{TA_Department.dep_CustomCode}</Text>
              <TextBrush>Black</TextBrush>
              <VertAlignment>Center</VertAlignment>
            </Text3>
            <Text1 Ref="18" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <ClientRectangle>4.7,0,2,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8.25,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text1</Name>
              <Page isRef="5" />
              <Parent isRef="16" />
              <Text>{TA_Department.dep_Name}</Text>
              <TextBrush>Black</TextBrush>
              <VertAlignment>Center</VertAlignment>
            </Text1>
            <Text5 Ref="19" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <ClientRectangle>3.7,0,1,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8.25,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text5</Name>
              <Page isRef="5" />
              <Parent isRef="16" />
              <Text>{TA_Department.id}</Text>
              <TextBrush>Black</TextBrush>
              <VertAlignment>Center</VertAlignment>
            </Text5>
          </Components>
          <Conditions isList="true" count="0" />
          <DataRelationName isNull="true" />
          <DataSourceName>TA_Department</DataSourceName>
          <Filters isList="true" count="0" />
          <Indent>-20</Indent>
          <KeyDataColumn>dep_ID</KeyDataColumn>
          <MasterKeyDataColumn>dep_ParentID</MasterKeyDataColumn>
          <Name>HierarchicalBand1</Name>
          <Page isRef="5" />
          <Parent isRef="5" />
          <Sort isList="true" count="0" />
        </HierarchicalBand1>
      </Components>
      <Conditions isList="true" count="0" />
      <Guid>d0ae3a5fdfd44fcdb0368204340f91c7</Guid>
      <Margins>0.39,0.39,0.39,0.39</Margins>
      <Name>Page1</Name>
      <PageHeight>11</PageHeight>
      <PageWidth>8.5</PageWidth>
      <PaperSize>Letter</PaperSize>
      <Report isRef="0" />
      <Watermark Ref="20" type="Stimulsoft.Report.Components.StiWatermark" isKey="true">
        <Font>Arial,100</Font>
        <TextBrush>[50:0:0:0]</TextBrush>
      </Watermark>
    </Page1>
  </Pages>
  <PrinterSettings Ref="21" type="Stimulsoft.Report.Print.StiPrinterSettings" isKey="true" />
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
  <ReportChanged>3/16/2013 10:32:17 AM</ReportChanged>
  <ReportCreated>3/16/2013 9:41:29 AM</ReportCreated>
  <ReportFile>D:\DepartmentReport.mrt</ReportFile>
  <ReportGuid>b47c6e36e36d480a87226fe2a4c72201</ReportGuid>
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
  <Styles isList="true" count="1">
    <Style1 Ref="22" type="Stimulsoft.Report.StiStyle" isKey="true">
      <Brush>BlanchedAlmond</Brush>
      <Conditions isList="true" count="0" />
      <Description />
      <Font>Tahoma,8.25,Bold,Point,False,0</Font>
      <Name>Style1</Name>
      <TextBrush>Black</TextBrush>
    </Style1>
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

