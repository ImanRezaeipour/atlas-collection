﻿--set quoted_identifier on

declare @ReportFile_Name nvarchar(max)
declare @Report_Name nvarchar(max)
declare @ReportFile_File nvarchar(max)
declare @Report_RootName nvarchar(max)=N'درخواستها'
-------------------------------------------------------------------------------------------------------------
set @ReportFile_Name=N'R4343A660'
set @Report_Name=N'اپراتورهای جریان کاری'
set @ReportFile_File=N'<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<StiSerializer version="1.02" type="Net" application="StiReport">
  <Dictionary Ref="1" type="Dictionary" isKey="true">
    <BusinessObjects isList="true" count="0" />
    <Databases isList="true" count="1">
      <Connection Ref="2" type="Stimulsoft.Report.Dictionary.StiSqlDatabase" isKey="true">
        <Alias>Connection</Alias>
        <ConnectionString>Password=123;Data Source=payervand-pc;Initial Catalog=falatSlow;User ID=farhad;Integrated Security=False</ConnectionString>
        <Name>Connection</Name>
      </Connection>
    </Databases>
    <DataSources isList="true" count="2">
      <DataSource1 Ref="3" type="Stimulsoft.Report.Dictionary.StiSqlSource" isKey="true">
        <Alias>DataSource1</Alias>
        <Columns isList="true" count="6">
          <value>personName,System.String</value>
          <value>personBarcode,System.String</value>
          <value>activeFlow,System.String</value>
          <value>accessGroupName,System.String</value>
          <value>flowName,System.String</value>
          <value>flowId,System.String</value>
        </Columns>
        <CommandTimeout>30</CommandTimeout>
        <Dictionary isRef="1" />
        <Name>DataSource1</Name>
        <NameInSource>Connection</NameInSource>
        <Parameters isList="true" count="0" />
        <SqlCommand>
select Flow.Flow_ID flowId
,Flow_FlowName flowName
,PrecardAccessGroup.accessGrp_Name accessGroupName
,Flow_ActiveFlow activeFlow
,Person.Prs_Barcode personBarcode
,Person.Prs_FirstName+'' ''+Person.Prs_LastName personName
from TA_Operator Operator
join TA_Flow Flow on Operator.opr_FlowId=Flow.Flow_ID
join TA_Person Person on Operator.opr_PersonId=Person.Prs_ID
join TA_PrecardAccessGroup PrecardAccessGroup on Flow.Flow_AccessGroupID=PrecardAccessGroup.accessGrp_ID</SqlCommand>
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
    <pgeReport Ref="5" type="Page" isKey="true">
      <Border>None;Black;2;Solid;False;4;Black</Border>
      <Brush>Transparent</Brush>
      <Components isList="true" count="4">
        <phbMain Ref="6" type="PageHeaderBand" isKey="true">
          <Brush>Transparent</Brush>
          <ClientRectangle>0,0.2,10.91,0.63</ClientRectangle>
          <Components isList="true" count="5">
            <txtOrgDefName Ref="7" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>2.79,0,4.17,0.57</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,18,Bold</Font>
              <Guid>bc839b4783f548ae9429848c34f020bb</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtOrgDefName</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>{nameOrg.OrgDef_Name}
گزارش اپراتورهای جریان کاری</Text>
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
              <ClientRectangle>0.94,0,1.02,0.24</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>8ad3687dc281485e8a36018c298e0806</Guid>
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
              <Guid>0172c1f23f264ae69a71e9b5e718905f</Guid>
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
              <Guid>1e54a5e25a1544d186fb3377454a0b4a</Guid>
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
              <Guid>ac0c1df30aa1470480c62bf57714cccb</Guid>
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
          <Guid>1b5274f9873d445e8011674e5440c57a</Guid>
          <Name>phbMain</Name>
          <Page isRef="5" />
          <Parent isRef="5" />
        </phbMain>
        <GroupHeaderBand2 Ref="12" type="GroupHeaderBand" isKey="true">
          <Border>Bottom;[193:152:89];1;Solid;False;4;Black</Border>
          <Brush>Transparent</Brush>
          <ClientRectangle>0,1.23,10.91,0.45</ClientRectangle>
          <Collapsed>{GroupLine!=1}</Collapsed>
          <Components isList="true" count="6">
            <Text4 Ref="13" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>5.1,0.07,1.07,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,12,Bold,Point,False,0</Font>
              <Guid>d53669eed38246cc9a8a1434b33e0b9e</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text4</Name>
              <Page isRef="5" />
              <Parent isRef="12" />
              <Text>دسترسی</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </Text4>
            <Text5 Ref="14" type="Text" isKey="true">
              <Border>None;[193:152:89];1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <ClientRectangle>2.2,0.07,2.79,0.3</ClientRectangle>
              <ComponentStyle>Header1</ComponentStyle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,12,Regular,Point,False,0</Font>
              <Guid>14953159110a473190e0361807ef10fb</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text5</Name>
              <Page isRef="5" />
              <Parent isRef="12" />
              <Text>{DataSource1.accessGroupName}</Text>
              <TextBrush>[193:152:89]</TextBrush>
              <Type>DataColumn</Type>
              <VertAlignment>Center</VertAlignment>
            </Text5>
            <Text6 Ref="15" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>0.7,0.07,1.07,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,12,Bold,Point,False,0</Font>
              <Guid>fb3620771c714eeab2887c20ca19ef38</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text6</Name>
              <Page isRef="5" />
              <Parent isRef="12" />
              <Text>فعال</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </Text6>
            <CheckBox1 Ref="16" type="CheckBox" isKey="true">
              <Brush>Transparent</Brush>
              <Checked>{DataSource1.activeFlow}</Checked>
              <ClientRectangle>0.2,0.07,0.4,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <ContourColor>Black</ContourColor>
              <Name>CheckBox1</Name>
              <Page isRef="5" />
              <Parent isRef="12" />
              <TextBrush>Black</TextBrush>
            </CheckBox1>
            <Text8 Ref="17" type="Text" isKey="true">
              <Border>None;[193:152:89];1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <ClientRectangle>6.59,0.07,2.89,0.3</ClientRectangle>
              <ComponentStyle>Header1</ComponentStyle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,12,Regular,Point,False,0</Font>
              <Guid>957177bda0ad4235a81a96a0d6663611</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text8</Name>
              <Page isRef="5" />
              <Parent isRef="12" />
              <Text>{DataSource1.flowName}</Text>
              <TextBrush>[193:152:89]</TextBrush>
              <Type>DataColumn</Type>
              <VertAlignment>Center</VertAlignment>
            </Text8>
            <Text3 Ref="18" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>9.6,0.07,1.07,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,12,Bold,Point,False,0</Font>
              <Guid>f0946047601d4f369a8f23b53ab9b745</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text3</Name>
              <Page isRef="5" />
              <Parent isRef="12" />
              <Text>جریان کاری</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </Text3>
          </Components>
          <Condition>{DataSource1.flowId}</Condition>
          <Conditions isList="true" count="0" />
          <Guid>b83519456f6044daa8f7b8918f9b6e6a</Guid>
          <Name>GroupHeaderBand2</Name>
          <Page isRef="5" />
          <Parent isRef="5" />
        </GroupHeaderBand2>
        <HeaderDataSource1 Ref="19" type="HeaderBand" isKey="true">
          <Brush>Tan</Brush>
          <ClientRectangle>0,2.08,10.91,0.3</ClientRectangle>
          <Components isList="true" count="2">
            <HeaderDataSource1_subName Ref="20" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <ClientRectangle>6.9,0,2,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,11.25,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderDataSource1_subName</Name>
              <Page isRef="5" />
              <Parent isRef="19" />
              <Text>نام اپراتور</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderDataSource1_subName>
            <HeaderDataSource1_subBarcode Ref="21" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <ClientRectangle>8.9,0,2,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,11.25,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderDataSource1_subBarcode</Name>
              <Page isRef="5" />
              <Parent isRef="19" />
              <Text>کد پرسنلی اپراتور</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderDataSource1_subBarcode>
          </Components>
          <ComponentStyle>Master</ComponentStyle>
          <Conditions isList="true" count="0" />
          <Name>HeaderDataSource1</Name>
          <Page isRef="5" />
          <Parent isRef="5" />
        </HeaderDataSource1>
        <DataDataSource1 Ref="22" type="DataBand" isKey="true">
          <Border>All;Black;1;Solid;False;4;Black</Border>
          <Brush>Transparent</Brush>
          <BusinessObjectGuid isNull="true" />
          <ClientRectangle>0,2.78,10.91,0.3</ClientRectangle>
          <Components isList="true" count="2">
            <DataDataSource1_subName Ref="23" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>6.9,0,2,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,11.25,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataDataSource1_subName</Name>
              <Page isRef="5" />
              <Parent isRef="22" />
              <Text>{DataSource1.personName}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>DataColumn</Type>
              <VertAlignment>Center</VertAlignment>
            </DataDataSource1_subName>
            <DataDataSource1_subBarcode Ref="24" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>8.9,0,2,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,11.25,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataDataSource1_subBarcode</Name>
              <Page isRef="5" />
              <Parent isRef="22" />
              <Text>{DataSource1.personBarcode}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>DataColumn</Type>
              <VertAlignment>Center</VertAlignment>
            </DataDataSource1_subBarcode>
          </Components>
          <Conditions isList="true" count="0" />
          <DataRelationName isNull="true" />
          <DataSourceName>DataSource1</DataSourceName>
          <EvenStyle>Even</EvenStyle>
          <Filters isList="true" count="0" />
          <Name>DataDataSource1</Name>
          <OddStyle>Odd</OddStyle>
          <Page isRef="5" />
          <Parent isRef="5" />
          <Sort isList="true" count="2">
            <value>ASC</value>
            <value>subBarcode</value>
          </Sort>
        </DataDataSource1>
      </Components>
      <Conditions isList="true" count="0" />
      <Guid>f43ecc198e944c158acac09c2aec975a</Guid>
      <Margins>0.39,0.39,0.39,0.39</Margins>
      <Name>pgeReport</Name>
      <Orientation>Landscape</Orientation>
      <PageHeight>8.27</PageHeight>
      <PageWidth>11.69</PageWidth>
      <PaperSize>A4</PaperSize>
      <Report isRef="0" />
      <Watermark Ref="25" type="Stimulsoft.Report.Components.StiWatermark" isKey="true">
        <Font>Microsoft Sans Serif,100</Font>
        <TextBrush>[50:0:0:0]</TextBrush>
      </Watermark>
    </pgeReport>
  </Pages>
  <PrinterSettings Ref="26" type="Stimulsoft.Report.Print.StiPrinterSettings" isKey="true" />
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
  <ReportChanged>4/10/2013 3:23:30 PM</ReportChanged>
  <ReportCreated>3/3/2013 12:51:27 PM</ReportCreated>
  <ReportFile>\\SALAVATI1\Farhad Public\Naghibi\Report\OperatorReport.mrt</ReportFile>
  <ReportGuid>5a4f048975794fb1acdc1f7dc86f56a8</ReportGuid>
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
    <Master Ref="27" type="Stimulsoft.Report.StiStyle" isKey="true">
      <Brush>Tan</Brush>
      <Conditions isList="true" count="0" />
      <Description />
      <Font>Microsoft Sans Serif,8</Font>
      <Name>Master</Name>
      <TextBrush>Black</TextBrush>
    </Master>
    <Even Ref="28" type="Stimulsoft.Report.StiStyle" isKey="true">
      <Brush>Moccasin</Brush>
      <Conditions isList="true" count="0" />
      <Description />
      <Font>Microsoft Sans Serif,8</Font>
      <Name>Even</Name>
      <TextBrush>Black</TextBrush>
    </Even>
    <Odd Ref="29" type="Stimulsoft.Report.StiStyle" isKey="true">
      <Brush>Transparent</Brush>
      <Conditions isList="true" count="0" />
      <Description />
      <Font>Microsoft Sans Serif,8</Font>
      <Name>Odd</Name>
      <TextBrush>Black</TextBrush>
    </Odd>
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
