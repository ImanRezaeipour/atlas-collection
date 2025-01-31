﻿--set quoted_identifier on

declare @ReportFile_Name nvarchar(max)
declare @Report_Name nvarchar(max)
declare @ReportFile_File nvarchar(max)
declare @Report_RootName nvarchar(max)=N'درخواستها'
-------------------------------------------------------------------------------------------------------------
set @ReportFile_Name=N'R4343A460'
set @Report_Name=N'گزارش قوانین'
set @ReportFile_File=N'<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<StiSerializer version="1.02" type="Net" application="StiReport">
  <Dictionary Ref="1" type="Dictionary" isKey="true">
    <BusinessObjects isList="true" count="0" />
    <Databases isList="true" count="1">
      <Connection Ref="2" type="Stimulsoft.Report.Dictionary.StiSqlDatabase" isKey="true">
        <Alias>Connection</Alias>
        <ConnectionString>Initial Catalog=GhadirGTS;Integrated Security=False;Password=salta12345;User ID=atlas;Data Source=APPSRV\SQL2008R2</ConnectionString>
        <Name>Connection</Name>
      </Connection>
    </Databases>
    <DataSources isList="true" count="2">
      <DataSource1 Ref="3" type="Stimulsoft.Report.Dictionary.StiSqlSource" isKey="true">
        <Alias>DataSource1</Alias>
        <Columns isList="true" count="36">
          <value>RuleCat_ID,System.Decimal</value>
          <value>RuleCat_Name,System.String</value>
          <value>RuleCat_Discription,System.String</value>
          <value>RuleCat_IsRoot,System.Boolean</value>
          <value>RuleCat_CustomCode,System.String</value>
          <value>PrsRulCatAsg_ID,System.Decimal</value>
          <value>PrsRulCatAsg_PersonId,System.Decimal</value>
          <value>PrsRulCatAsg_RuleCategoryId,System.Decimal</value>
          <value>PrsRulCatAsg_FromDate,System.String</value>
          <value>PrsRulCatAsg_ToDate,System.String</value>
          <value>PrsRulCatAsg_IssuanceDate,System.DateTime</value>
          <value>Rule_ID,System.Decimal</value>
          <value>Rule_IdentifierCode,System.Decimal</value>
          <value>Rule_Script,System.String</value>
          <value>Rule_Name,System.String</value>
          <value>Rule__CustomCode,System.String</value>
          <value>Rule_RuleTmpId,System.Decimal</value>
          <value>Rule_IsPeriodic,System.Int32</value>
          <value>Rule_RuleCategoryId,System.Decimal</value>
          <value>Rule_RuleTypeId,System.Decimal</value>
          <value>Rule_Order,System.Int16</value>
          <value>Rule_IsForcible,System.Boolean</value>
          <value>AsgRuleParam_ID,System.Decimal</value>
          <value>AsgRuleParam_FromDate,System.DateTime</value>
          <value>AsgRuleParam_ToDate,System.DateTime</value>
          <value>AsgRuleParam_RuleId,System.Decimal</value>
          <value>RuleParam_ID,System.Decimal</value>
          <value>RuleParam_AsgRuleParamId,System.Decimal</value>
          <value>RuleParam_Name,System.String</value>
          <value>RuleParam_Value,System.String</value>
          <value>RuleParam_Type,System.Int16</value>
          <value>RuleParam_Title,System.String</value>
          <value>prs_id,System.Decimal</value>
          <value>prs_barcode,System.String</value>
          <value>prs_name,System.String</value>
          <value>toTime,System.String</value>
        </Columns>
        <CommandTimeout>30</CommandTimeout>
        <Dictionary isRef="1" />
        <Name>DataSource1</Name>
        <NameInSource>Connection</NameInSource>
        <Parameters isList="true" count="2">
          <value>toDate,,4,0</value>
          <value>fromDate,,4,0</value>
        </Parameters>
        <SqlCommand>
select *,dbo.GTS_ASM_MiladiToShamsi(cast(cast(@toDate as date) as nvarchar(10))) as toTime from TA_RuleCategory rc
right join (select * from TA_PersonRuleCategoryAssignment
	where PrsRulCatAsg_PersonId in({ReportHelper.Instance().ModifiedIds()}) and (@toDate between PrsRulCatAsg_FromDate and PrsRulCatAsg_ToDate)) as prca 
on rc.RuleCat_ID=prca.PrsRulCatAsg_RuleCategoryId
left join (select * from TA_Rule) as r on rc.RuleCat_ID=r.Rule_RuleCategoryId
left join (select * from ta_assignruleparameter) as arp on arp.AsgRuleParam_RuleId=r.Rule_ID
left join (select * from ta_ruleparameter) as rp on rp.RuleParam_AsgRuleParamId=arp.AsgRuleParam_ID
join (select prs_id,prs_barcode,prs_firstname+'' ''+prs_lastname as prs_name from ta_person) as p on p.prs_id=prca.PrsRulCatAsg_PersonId</SqlCommand>
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
      <Components isList="true" count="4">
        <ReportTitleBand1 Ref="6" type="ReportTitleBand" isKey="true">
          <Brush>Transparent</Brush>
          <ClientRectangle>0,0.2,7.49,1</ClientRectangle>
          <Components isList="true" count="9">
            <Text20 Ref="7" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>5.5,0.1,1.9,0.2</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>28e686c84c2b4af0af2b77c0e424cd17</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text20</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>گزارش قوانین خانم/آقای</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </Text20>
            <Text21 Ref="8" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>5.9,0.4,1.5,0.2</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>35915e037d3e4fc29b2d9fe566647aba</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text21</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>{DataSource1.prs_name}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>DataColumn</Type>
              <VertAlignment>Center</VertAlignment>
            </Text21>
            <Text22 Ref="9" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>6.5,0.7,0.9,0.2</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>2d1918212bed4fb7b3f6b8bc6038821b</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text22</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>: شماره پرسنلی</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </Text22>
            <Text23 Ref="10" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>5.5,0.7,0.9,0.2</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>3e8c51596af4483f825d03ca19102ee6</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text23</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>{DataSource1.prs_barcode}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>DataColumn</Type>
              <VertAlignment>Center</VertAlignment>
            </Text23>
            <txtOrgDefName Ref="11" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>2.2,0.1,3.17,0.77</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,18,Bold,Point,False,0</Font>
              <Guid>d138e31830de4c768242644cc3c68a9b</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtOrgDefName</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>{nameOrg.OrgDef_Name}
گزارش قوانین پرسنل</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=True, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
            </txtOrgDefName>
            <Text9 Ref="12" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;DimGray</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>0.9,0.1,1.2,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>e4009e8f256845aea57a8b377ba5d4b0</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <MinSize>1,0</MinSize>
              <Name>Text9</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>: تاریخ تهیه گزارش</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </Text9>
            <Text19 Ref="13" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>0.9,0.4,1.2,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>5e27f8022ce146fab90731b360c114a4</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text19</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>: تهیه کننده</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </Text19>
            <Text24 Ref="14" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>0.1,0.1,1.1,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>b39835f6a9484c0c806aaa2230406083</Guid>
              <Margins>0,0,0,0</Margins>
              <Name>Text24</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>{ReportHelper.Instance().ShamsiGetNow()}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </Text24>
            <Text25 Ref="15" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>0.1,0.4,1.2,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>ea8fc91318c94009a380591333c3b478</Guid>
              <Margins>0,0,0,0</Margins>
              <Name>Text25</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>{ReportHelper.Instance().UserName}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </Text25>
          </Components>
          <Conditions isList="true" count="0" />
          <Name>ReportTitleBand1</Name>
          <Page isRef="5" />
          <Parent isRef="5" />
        </ReportTitleBand1>
        <ReportTitleBand2 Ref="16" type="ReportTitleBand" isKey="true">
          <Border>All;Black;1;Solid;False;4;Black</Border>
          <Brush>[191:191:191]</Brush>
          <ClientRectangle>0,1.6,7.49,0.5</ClientRectangle>
          <Components isList="true" count="6">
            <Text17 Ref="17" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>6.7,0,0.8,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text17</Name>
              <Page isRef="5" />
              <Parent isRef="16" />
              <Text>کد دسته قانون</Text>
              <TextBrush>Black</TextBrush>
              <VertAlignment>Center</VertAlignment>
            </Text17>
            <Text16 Ref="18" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>5.7,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text16</Name>
              <Page isRef="5" />
              <Parent isRef="16" />
              <Text>{DataSource1.RuleCat_CustomCode}</Text>
              <TextBrush>Black</TextBrush>
              <VertAlignment>Center</VertAlignment>
            </Text16>
            <Text15 Ref="19" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>4.8,0,0.8,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text15</Name>
              <Page isRef="5" />
              <Parent isRef="16" />
              <Text>دسته قانون</Text>
              <TextBrush>Black</TextBrush>
              <VertAlignment>Center</VertAlignment>
            </Text15>
            <Text14 Ref="20" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>1.4,0,3.4,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text14</Name>
              <Page isRef="5" />
              <Parent isRef="16" />
              <Text>{DataSource1.RuleCat_Name}</Text>
              <TextBrush>Black</TextBrush>
              <VertAlignment>Center</VertAlignment>
            </Text14>
            <Text18 Ref="21" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>0.9,0,0.4,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <Guid>a3478eec5e2b4b5d9e0825abc5b85f7d</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text18</Name>
              <Page isRef="5" />
              <Parent isRef="16" />
              <Text>تاریخ</Text>
              <TextBrush>Black</TextBrush>
              <VertAlignment>Center</VertAlignment>
            </Text18>
            <Text4 Ref="22" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>0,0,0.9,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <Guid>0585a3171e36439f8c5f982b037f064b</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text4</Name>
              <Page isRef="5" />
              <Parent isRef="16" />
              <Text>{Persian(DataSource1.toTime)}</Text>
              <TextBrush>Black</TextBrush>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </Text4>
          </Components>
          <Conditions isList="true" count="0" />
          <Name>ReportTitleBand2</Name>
          <Page isRef="5" />
          <Parent isRef="5" />
        </ReportTitleBand2>
        <GroupHeaderBand1 Ref="23" type="GroupHeaderBand" isKey="true">
          <Border>All;Black;1;Solid;False;4;Black</Border>
          <Brush>[250:206:170]</Brush>
          <ClientRectangle>0,2.5,7.49,0.3</ClientRectangle>
          <Components isList="true" count="4">
            <Text2 Ref="24" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>5.7,0,0.5,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text2</Name>
              <Page isRef="5" />
              <Parent isRef="23" />
              <Text>نام قانون</Text>
              <TextBrush>Black</TextBrush>
              <VertAlignment>Center</VertAlignment>
            </Text2>
            <Text1 Ref="25" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>0,0,5.6,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text1</Name>
              <Page isRef="5" />
              <Parent isRef="23" />
              <Text>{DataSource1.Rule_Name}</Text>
              <TextBrush>Black</TextBrush>
              <VertAlignment>Center</VertAlignment>
            </Text1>
            <Text3 Ref="26" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>6.3,0,0.7,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text3</Name>
              <Page isRef="5" />
              <Parent isRef="23" />
              <Text>{DataSource1.Rule__CustomCode}</Text>
              <TextBrush>Black</TextBrush>
              <VertAlignment>Center</VertAlignment>
            </Text3>
            <Text10 Ref="27" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>7,0,0.4,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <Guid>5b754ad5287d41a3b3932e4f85958852</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text10</Name>
              <Page isRef="5" />
              <Parent isRef="23" />
              <Text>کد</Text>
              <TextBrush>Black</TextBrush>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </Text10>
          </Components>
          <Condition>{DataSource1.Rule_ID}</Condition>
          <Conditions isList="true" count="0" />
          <Name>GroupHeaderBand1</Name>
          <Page isRef="5" />
          <Parent isRef="5" />
        </GroupHeaderBand1>
        <DataBand1 Ref="28" type="DataBand" isKey="true">
          <Brush>Transparent</Brush>
          <BusinessObjectGuid isNull="true" />
          <ClientRectangle>0,3.2,7.49,0.3</ClientRectangle>
          <Components isList="true" count="4">
            <Text6 Ref="29" type="Text" isKey="true">
              <Border>Top, Right, Bottom;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <ClientRectangle>6.3,0,0.7,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text6</Name>
              <Page isRef="5" />
              <Parent isRef="28" />
              <Text>پارامتر</Text>
              <TextBrush>Black</TextBrush>
              <VertAlignment>Center</VertAlignment>
            </Text6>
            <Text5 Ref="30" type="Text" isKey="true">
              <Border>Top, Left, Bottom;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <ClientRectangle>1.3,0,5,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text5</Name>
              <Page isRef="5" />
              <Parent isRef="28" />
              <Text>{IIF(DataSource1.RuleParam_Title=="","----------------------",DataSource1.RuleParam_Title)}</Text>
              <TextBrush>Black</TextBrush>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </Text5>
            <Text8 Ref="31" type="Text" isKey="true">
              <Border>Top, Right, Bottom;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <ClientRectangle>0.9,0,0.4,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text8</Name>
              <Page isRef="5" />
              <Parent isRef="28" />
              <Text>مقدار</Text>
              <TextBrush>Black</TextBrush>
              <VertAlignment>Center</VertAlignment>
            </Text8>
            <Text7 Ref="32" type="Text" isKey="true">
              <Border>Top, Left, Bottom;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <ClientRectangle>0.1,0,0.8,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text7</Name>
              <Page isRef="5" />
              <Parent isRef="28" />
              <Text>{Persian(DataSource1.RuleParam_Value)}</Text>
              <TextBrush>Black</TextBrush>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </Text7>
          </Components>
          <Conditions isList="true" count="0" />
          <DataRelationName isNull="true" />
          <DataSourceName>DataSource1</DataSourceName>
          <Filters isList="true" count="0" />
          <Name>DataBand1</Name>
          <Page isRef="5" />
          <Parent isRef="5" />
          <Sort isList="true" count="0" />
        </DataBand1>
      </Components>
      <Conditions isList="true" count="0" />
      <Guid>5a7688d18b0842a89e7a68c0f65f30d6</Guid>
      <Margins>0.39,0.39,0.39,0.39</Margins>
      <Name>Page1</Name>
      <PageHeight>11.69</PageHeight>
      <PageWidth>8.27</PageWidth>
      <PaperSize>A4</PaperSize>
      <Report isRef="0" />
      <Watermark Ref="33" type="Stimulsoft.Report.Components.StiWatermark" isKey="true">
        <Font>Arial,100</Font>
        <TextBrush>[50:0:0:0]</TextBrush>
      </Watermark>
    </Page1>
  </Pages>
  <PrinterSettings Ref="34" type="Stimulsoft.Report.Print.StiPrinterSettings" isKey="true" />
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
  <ReportChanged>4/10/2013 2:36:50 PM</ReportChanged>
  <ReportCreated>3/18/2013 1:15:19 AM</ReportCreated>
  <ReportFile>\\SALAVATI1\Farhad Public\Naghibi\Report\GroupReport\GroupReport.mrt</ReportFile>
  <ReportGuid>b76345be65964b4b8143f8debc289655</ReportGuid>
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
  <Styles isList="true" count="0" />
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
            (SELECT RptUIParameter_ID FROM TA_ReportUIParameter WHERE RptUIParameter_ActionId like N'ToDate_Implicit_StartOfYear_EndOfYear')
           ,'@toDate'
           ,(SELECT ReportFile_ID FROM TA_ReportFile WHERE ReportFile_Name = @ReportFile_Name)
           )
