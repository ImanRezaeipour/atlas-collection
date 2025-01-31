﻿if ((select count(*) from ta_report where Report_Name=N'داشبورد')<>1)
	insert into TA_Report values(N'داشبورد',1612,NULL,0,NULL,110)

--set quoted_identifier on

declare @ReportFile_Name nvarchar(max)
declare @Report_Name nvarchar(max)
declare @ReportFile_File nvarchar(max)
declare @Report_RootName nvarchar(max)=N'داشبورد'
-------------------------------------------------------------------------------------------------------------
set @ReportFile_Name=N'R4343A670'
set @Report_Name=N'نمودار کارکرد پرسنل'
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
    <DataSources isList="true" count="3">
      <DataSource1 Ref="3" type="Stimulsoft.Report.Dictionary.StiSqlSource" isKey="true">
        <Alias>DataSource1</Alias>
        <Columns isList="true" count="8">
          <value>prs_id,System.Decimal</value>
          <value>prs_name,System.String</value>
          <value>hozor,System.Decimal</value>
          <value>gheybat,System.Decimal</value>
          <value>mamoriat,System.Decimal</value>
          <value>ezafekar,System.Decimal</value>
          <value>number,System.String</value>
          <value>row,System.Decimal</value>
        </Columns>
        <CommandTimeout>30</CommandTimeout>
        <Dictionary isRef="1" />
        <Name>DataSource1</Name>
        <NameInSource>Connection</NameInSource>
        <Parameters isList="true" count="2">
          <value>_x0040_ToDate,,4,0</value>
          <value>_x0040_Order,,16,0</value>
        </Parameters>
        <SqlCommand>select aaa.prs_id, a.prs_name,
	ISNULL(a.prs_time,0) as hozor,
	ISNULL(b.prs_time,0) as gheybat,
	ISNULL(c.prs_time,0) as mamoriat,
	ISNULL(d.prs_time,0) as ezafekar
	,ROW_NUMBER() OVER(ORDER BY aaa.prs_id) AS ''number''
	,cast((ROW_NUMBER() OVER(ORDER BY aaa.prs_id)/30)+1 as int) AS ''row''
	from TA_Person aaa
join

(select
	cast(ROUND(scv.ScndCnpValue_Value/60 ,0) as decimal) as prs_time,
p.Prs_FirstName+'' ''+p.prs_lastname as prs_name,p.Prs_ID 
from TA_SecondaryConceptValue scv
left join TA_Person p on p.Prs_ID=scv.ScndCnpValue_PersonId
where ScndCnpValue_SecondaryConceptId in(105)
and scv.ScndCnpValue_PersonId in({ReportHelper.Instance().ModifiedIds()})
and (@ToDate between scv.ScndCnpValue_FromDate and scv.ScndCnpValue_ToDate) 
--order by scv.ScndCnpValue_Value desc
) a on a.Prs_ID=aaa.Prs_ID

left join
(
select

	cast(ROUND(scv.ScndCnpValue_Value/60 ,0) as decimal) as prs_time,
p.Prs_FirstName+'' ''+p.prs_lastname as prs_name,p.Prs_ID 
from TA_SecondaryConceptValue scv
left join TA_Person p on p.Prs_ID=scv.ScndCnpValue_PersonId
where ScndCnpValue_SecondaryConceptId in(68)
and scv.ScndCnpValue_PersonId in({ReportHelper.Instance().ModifiedIds()})
and (@ToDate between scv.ScndCnpValue_FromDate and scv.ScndCnpValue_ToDate) 
--order by scv.ScndCnpValue_Value desc
) b on b.Prs_ID=aaa.Prs_ID

left join
(
select

	cast(ROUND(scv.ScndCnpValue_Value/60 ,0) as decimal) as prs_time,
p.Prs_FirstName+'' ''+p.prs_lastname as prs_name,p.Prs_ID 
from TA_SecondaryConceptValue scv
left join TA_Person p on p.Prs_ID=scv.ScndCnpValue_PersonId
where ScndCnpValue_SecondaryConceptId in(78)
and scv.ScndCnpValue_PersonId in({ReportHelper.Instance().ModifiedIds()})
and (@ToDate between scv.ScndCnpValue_FromDate and scv.ScndCnpValue_ToDate) 
--order by scv.ScndCnpValue_Value desc
) c on c.Prs_ID=aaa.Prs_ID

left join
(
select

	cast(ROUND(scv.ScndCnpValue_Value/60 ,0) as decimal) as prs_time,
p.Prs_FirstName+'' ''+p.prs_lastname as prs_name,p.Prs_ID 
from TA_SecondaryConceptValue scv
left join TA_Person p on p.Prs_ID=scv.ScndCnpValue_PersonId
where ScndCnpValue_SecondaryConceptId in(7)
and scv.ScndCnpValue_PersonId in({ReportHelper.Instance().ModifiedIds()})
and (@ToDate between scv.ScndCnpValue_FromDate and scv.ScndCnpValue_ToDate) 
--order by scv.ScndCnpValue_Value desc
) d on d.Prs_ID=aaa.Prs_ID
</SqlCommand>
      </DataSource1>
      <time Ref="4" type="Stimulsoft.Report.Dictionary.StiSqlSource" isKey="true">
        <Alias>time</Alias>
        <Columns isList="true" count="1">
          <value>prs_date,System.String</value>
        </Columns>
        <CommandTimeout>30</CommandTimeout>
        <Dictionary isRef="1" />
        <Name>time</Name>
        <NameInSource>Connection</NameInSource>
        <Parameters isList="true" count="2">
          <value>_x0040_ToDate,,4,0</value>
          <value>_x0040_Order,,16,0</value>
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
	) as prs_date</SqlCommand>
      </time>
      <nameOrg Ref="5" type="Stimulsoft.Report.Dictionary.StiSqlSource" isKey="true">
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
  <Pages isList="true" count="2">
    <Page1 Ref="6" type="Page" isKey="true">
      <Border>None;Black;2;Solid;False;4;Black</Border>
      <Brush>Transparent</Brush>
      <Components isList="true" count="3">
        <phbMain Ref="7" type="PageHeaderBand" isKey="true">
          <Brush>Transparent</Brush>
          <ClientRectangle>0,0.2,10.91,0.63</ClientRectangle>
          <Components isList="true" count="7">
            <txtOrgDefName Ref="8" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>2.99,0,4.17,0.57</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,18,Bold</Font>
              <Guid>8afadfed0f43404c80e784f7172bf2a4</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtOrgDefName</Name>
              <Page isRef="6" />
              <Parent isRef="7" />
              <Text>{nameOrg.OrgDef_Name}
گزارش نمودار کارکرد پرسنل</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=True, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
            </txtOrgDefName>
            <txteportDate Ref="9" type="Text" isKey="true">
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
              <Guid>c6a40f8ce68d4e55892773d673962ee3</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txteportDate</Name>
              <Page isRef="6" />
              <Parent isRef="7" />
              <Text>: تاریخ تهیه گزارش</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </txteportDate>
            <txtReporter Ref="10" type="Text" isKey="true">
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
              <Guid>a166b62a79d044b8b19a05a2c1fe197b</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtReporter</Name>
              <Page isRef="6" />
              <Parent isRef="7" />
              <Text>: تهیه کننده</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </txtReporter>
            <txtShamsiGetNow Ref="11" type="Text" isKey="true">
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
              <Guid>91ba14badadb4b5b84987882e7b84175</Guid>
              <Margins>0,0,0,0</Margins>
              <Name>txtShamsiGetNow</Name>
              <Page isRef="6" />
              <Parent isRef="7" />
              <Text>{ReportHelper.Instance().ShamsiGetNow()}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </txtShamsiGetNow>
            <txtUserName Ref="12" type="Text" isKey="true">
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
              <Guid>53b1c9bf34f443a7b67e0c755b658772</Guid>
              <Margins>0,0,0,0</Margins>
              <Name>txtUserName</Name>
              <Page isRef="6" />
              <Parent isRef="7" />
              <Text>{ReportHelper.Instance().UserName}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </txtUserName>
            <Text1 Ref="13" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>10.4,0.1,0.42,0.24</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>3c6fda1c35384140a3f6ca47ae065a56</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text1</Name>
              <Page isRef="6" />
              <Parent isRef="7" />
              <Text>: تاریخ</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </Text1>
            <Text2 Ref="14" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>9.4,0.1,0.94,0.24</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>49aba28406b34a0aaa3039f1ae93bb2d</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text2</Name>
              <Page isRef="6" />
              <Parent isRef="7" />
              <Text>{time.prs_date}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </Text2>
          </Components>
          <Conditions isList="true" count="0" />
          <Guid>8b85525ba0204079a3517964ea94dc91</Guid>
          <Name>phbMain</Name>
          <Page isRef="6" />
          <Parent isRef="6" />
        </phbMain>
        <DSA Ref="15" type="HeaderBand" isKey="true">
          <Brush>Transparent</Brush>
          <ClientRectangle>0,1.23,10.91,0.3</ClientRectangle>
          <Components isList="true" count="5">
            <hdEzafekar Ref="16" type="Text" isKey="true">
              <Border>Top, Left, Bottom;Black;1;Solid;False;4;Black</Border>
              <Brush>LightGray</Brush>
              <ClientRectangle>0,0,2.3,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>hdEzafekar</Name>
              <Page isRef="6" />
              <Parent isRef="15" />
              <Text>اضافه کار</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </hdEzafekar>
            <hdMamoriat Ref="17" type="Text" isKey="true">
              <Border>Top, Bottom;Black;1;Solid;False;4;Black</Border>
              <Brush>LightGray</Brush>
              <ClientRectangle>2.3,0,2.3,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>hdMamoriat</Name>
              <Page isRef="6" />
              <Parent isRef="15" />
              <Text>ماموریت</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </hdMamoriat>
            <hdGheybat Ref="18" type="Text" isKey="true">
              <Border>Top, Bottom;Black;1;Solid;False;4;Black</Border>
              <Brush>LightGray</Brush>
              <ClientRectangle>4.6,0,2.3,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>hdGheybat</Name>
              <Page isRef="6" />
              <Parent isRef="15" />
              <Text>غیبت</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </hdGheybat>
            <hdHozor Ref="19" type="Text" isKey="true">
              <Border>Top, Bottom;Black;1;Solid;False;4;Black</Border>
              <Brush>LightGray</Brush>
              <ClientRectangle>6.9,0,2.3,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>hdHozor</Name>
              <Page isRef="6" />
              <Parent isRef="15" />
              <Text>حضور</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </hdHozor>
            <hdName Ref="20" type="Text" isKey="true">
              <Border>Top, Right, Bottom;Black;1;Solid;False;4;Black</Border>
              <Brush>LightGray</Brush>
              <ClientRectangle>9.2,0,1.7,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>hdName</Name>
              <Page isRef="6" />
              <Parent isRef="15" />
              <Text>نام و نام خانوادگی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </hdName>
          </Components>
          <Conditions isList="true" count="0" />
          <Name>DSA</Name>
          <Page isRef="6" />
          <Parent isRef="6" />
        </DSA>
        <DDS Ref="21" type="DataBand" isKey="true">
          <Brush>Transparent</Brush>
          <BusinessObjectGuid isNull="true" />
          <ClientRectangle>0,1.93,10.91,0.3</ClientRectangle>
          <Components isList="true" count="5">
            <ddEzafekar Ref="22" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>0,0,2.3,0.3</ClientRectangle>
              <Conditions isList="true" count="1">
                <value>DataBar,DataSource1.ezafekar,Gradient,[0:0:192],Gray,True,[192:192:255],White,RighToLeft,Auto,0,Auto,100</value>
              </Conditions>
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>ddEzafekar</Name>
              <Page isRef="6" />
              <Parent isRef="21" />
              <Text>{DataSource1.ezafekar}</Text>
              <TextBrush>White</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </ddEzafekar>
            <ddMamoriat Ref="23" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>2.3,0,2.3,0.3</ClientRectangle>
              <Conditions isList="true" count="1">
                <value>DataBar,DataSource1.mamoriat,Gradient,[0:192:192],Gray,True,[192:255:255],White,RighToLeft,Auto,0,Auto,100</value>
              </Conditions>
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>ddMamoriat</Name>
              <Page isRef="6" />
              <Parent isRef="21" />
              <Text>{DataSource1.mamoriat}</Text>
              <TextBrush>White</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </ddMamoriat>
            <ddGheybat Ref="24" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>4.6,0,2.3,0.3</ClientRectangle>
              <Conditions isList="true" count="1">
                <value>DataBar,DataSource1.gheybat,Gradient,[192:0:0],Gray,True,[255:192:192],White,RighToLeft,Auto,0,Auto,100</value>
              </Conditions>
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>ddGheybat</Name>
              <Page isRef="6" />
              <Parent isRef="21" />
              <Text>{DataSource1.gheybat}</Text>
              <TextBrush>White</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </ddGheybat>
            <ddHozor Ref="25" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>6.9,0,2.3,0.3</ClientRectangle>
              <Conditions isList="true" count="1">
                <value>DataBar,DataSource1.hozor,Gradient,[0:192:0],Gray,True,[192:255:192],White,RighToLeft,Auto,0,Auto,100</value>
              </Conditions>
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>ddHozor</Name>
              <Page isRef="6" />
              <Parent isRef="21" />
              <Text>{DataSource1.hozor}</Text>
              <TextBrush>White</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </ddHozor>
            <ddName Ref="26" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>9.2,0,1.7,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>ddName</Name>
              <Page isRef="6" />
              <Parent isRef="21" />
              <Text>{DataSource1.prs_name}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </ddName>
          </Components>
          <Conditions isList="true" count="0" />
          <DataRelationName isNull="true" />
          <DataSourceName>DataSource1</DataSourceName>
          <Filters isList="true" count="0" />
          <Name>DDS</Name>
          <Page isRef="6" />
          <Parent isRef="6" />
          <Sort isList="true" count="2">
            <value>ASC</value>
            <value>hozor</value>
          </Sort>
        </DDS>
      </Components>
      <Conditions isList="true" count="0" />
      <Guid>9e9f9cb5ca0b410ca53438a742e8661f</Guid>
      <Margins>0.39,0.39,0.39,0.39</Margins>
      <Name>Page1</Name>
      <Orientation>Landscape</Orientation>
      <PageHeight>8.27</PageHeight>
      <PageWidth>11.69</PageWidth>
      <PaperSize>A4</PaperSize>
      <Report isRef="0" />
      <Watermark Ref="27" type="Stimulsoft.Report.Components.StiWatermark" isKey="true">
        <Font>Arial,100</Font>
        <TextBrush>[50:0:0:0]</TextBrush>
      </Watermark>
    </Page1>
    <Form1 Ref="28" type="Stimulsoft.Report.Dialogs.StiForm" isKey="true">
      <BackColor>Control</BackColor>
      <Components isList="true" count="8">
        <ButtonControl1 Ref="29" type="Stimulsoft.Report.Dialogs.StiButtonControl" isKey="true">
          <ClickEvent>if(!chkHozor.Checked &amp;&amp; !chkGheybat.Checked &amp;&amp; !chkMamoriat.Checked &amp;&amp; !chkEzafekar.Checked)
	chkHozor.Checked=true;


if(cmbType.SelectedIndex==0 &amp;&amp; chkHozor.Checked==true)
{
	if(cmbDir.SelectedIndex==0)
		DDS.Sort=new string[2]{"ASC","hozor"};
	if(cmbDir.SelectedIndex==1)
		DDS.Sort=new string[2]{"DESC","hozor"};
}
if(cmbType.SelectedIndex==1 &amp;&amp; chkGheybat.Checked==true)
{	
	if(cmbDir.SelectedIndex==0)
		DDS.Sort=new string[2]{"ASC","gheybat"};
	if(cmbDir.SelectedIndex==1)
		DDS.Sort=new string[2]{"DESC","gheybat"};
}
if(cmbType.SelectedIndex==2 &amp;&amp; chkMamoriat.Checked==true)
{
	if(cmbDir.SelectedIndex==0)
		DDS.Sort=new string[2]{"ASC","mamoriat"};
	if(cmbDir.SelectedIndex==1)
		DDS.Sort=new string[2]{"DESC","mamoriat"};
}
if(cmbType.SelectedIndex==3 &amp;&amp; chkEzafekar.Checked==true)
{	
	if(cmbDir.SelectedIndex==0)
		DDS.Sort=new string[2]{"ASC","ezafekar"};
	if(cmbDir.SelectedIndex==1)
		DDS.Sort=new string[2]{"DESC","ezafekar"};
}


hdHozor.Enabled=chkHozor.Checked;
ddHozor.Enabled=chkHozor.Checked;

hdGheybat.Enabled=chkGheybat.Checked;
ddGheybat.Enabled=chkGheybat.Checked;

hdMamoriat.Enabled=chkMamoriat.Checked;
ddMamoriat.Enabled=chkMamoriat.Checked;

hdEzafekar.Enabled=chkEzafekar.Checked;
ddEzafekar.Enabled=chkEzafekar.Checked;


double width = 0;
int count=-1;
double left=0;

foreach (StiComponent comp in DSA.Components)
{
if (comp.Enabled)
count ++;    
}

foreach (StiComponent comp in DSA.Components)
{
if (comp.Enabled)
{
comp.Left=left;
comp.Width = (2.3*4)/count;
left +=comp.Width;
}
}
hdName.Width=1.7;


left=0;
foreach (StiComponent comp in DDS.Components)
{

if (comp.Enabled)
{
comp.Left=left;
comp.Width = (2.3*4)/count;
left +=comp.Width;
}
}
ddName.Width=1.7;</ClickEvent>
          <ClientRectangle>8,240,464,72</ClientRectangle>
          <Components isList="true" count="0" />
          <DialogResult>OK</DialogResult>
          <Font>Arial,12,Regular,Point,False,0</Font>
          <ForeColor>Black</ForeColor>
          <Guid>3bc3fc84a0b24e249976a0e48ee55040</Guid>
          <Location>8, 240</Location>
          <Name>ButtonControl1</Name>
          <Page isRef="28" />
          <Parent isRef="28" />
          <Size>464, 72</Size>
          <Text>نمایش گزارش</Text>
        </ButtonControl1>
        <chkMamoriat Ref="30" type="Stimulsoft.Report.Dialogs.StiCheckBoxControl" isKey="true">
          <BackColor>Control</BackColor>
          <Checked>True</Checked>
          <ClientRectangle>264,72,200,40</ClientRectangle>
          <Components isList="true" count="0" />
          <Font>Arial,12,Regular,Point,False,0</Font>
          <ForeColor>Black</ForeColor>
          <Guid>d879edb087cb483484e6a3aefcec4480</Guid>
          <Location>264, 72</Location>
          <Name>chkMamoriat</Name>
          <Page isRef="28" />
          <Parent isRef="28" />
          <RightToLeft>Yes</RightToLeft>
          <Size>200, 40</Size>
          <Text>ماموریت</Text>
        </chkMamoriat>
        <chkHozor Ref="31" type="Stimulsoft.Report.Dialogs.StiCheckBoxControl" isKey="true">
          <BackColor>Control</BackColor>
          <Checked>True</Checked>
          <ClientRectangle>264,16,200,40</ClientRectangle>
          <Components isList="true" count="0" />
          <Font>Arial,12,Regular,Point,False,0</Font>
          <ForeColor>Black</ForeColor>
          <Guid>377198d7375b4d48aa287937b0ce20d9</Guid>
          <Location>264, 16</Location>
          <Name>chkHozor</Name>
          <Page isRef="28" />
          <Parent isRef="28" />
          <RightToLeft>Yes</RightToLeft>
          <Size>200, 40</Size>
          <Text>حضور</Text>
        </chkHozor>
        <chkEzafekar Ref="32" type="Stimulsoft.Report.Dialogs.StiCheckBoxControl" isKey="true">
          <BackColor>Control</BackColor>
          <Checked>True</Checked>
          <ClientRectangle>16,72,200,40</ClientRectangle>
          <Components isList="true" count="0" />
          <Font>Arial,12,Regular,Point,False,0</Font>
          <ForeColor>Black</ForeColor>
          <Guid>e0deab668b284e0786599ee1ab3ae833</Guid>
          <Location>16, 72</Location>
          <Name>chkEzafekar</Name>
          <Page isRef="28" />
          <Parent isRef="28" />
          <RightToLeft>Yes</RightToLeft>
          <Size>200, 40</Size>
          <Text>اضافه کار</Text>
        </chkEzafekar>
        <chkGheybat Ref="33" type="Stimulsoft.Report.Dialogs.StiCheckBoxControl" isKey="true">
          <BackColor>Control</BackColor>
          <Checked>True</Checked>
          <ClientRectangle>16,16,200,40</ClientRectangle>
          <Components isList="true" count="0" />
          <Font>Arial,12,Regular,Point,False,0</Font>
          <ForeColor>Black</ForeColor>
          <Guid>c84228af46f4454388602ade58ff28e1</Guid>
          <Location>16, 16</Location>
          <Name>chkGheybat</Name>
          <Page isRef="28" />
          <Parent isRef="28" />
          <RightToLeft>Yes</RightToLeft>
          <Size>200, 40</Size>
          <Text>غیبت</Text>
        </chkGheybat>
        <cmbDir Ref="34" type="Stimulsoft.Report.Dialogs.StiComboBoxControl" isKey="true">
          <BackColor>Window</BackColor>
          <ClientRectangle>56,184,160,20</ClientRectangle>
          <Components isList="true" count="0" />
          <Font>Arial,12,Regular,Point,False,0</Font>
          <ForeColor>Black</ForeColor>
          <Guid>d556ce9d4d0c497e8f1ab62463ebd6ba</Guid>
          <Items isList="true" count="2">
            <value>صعودی</value>
            <value>نزولی</value>
          </Items>
          <Location>56, 184</Location>
          <Name>cmbDir</Name>
          <Page isRef="28" />
          <Parent isRef="28" />
          <RightToLeft>Yes</RightToLeft>
          <Size>160, 20</Size>
          <Text>Combo Box</Text>
        </cmbDir>
        <cmbType Ref="35" type="Stimulsoft.Report.Dialogs.StiComboBoxControl" isKey="true">
          <BackColor>Window</BackColor>
          <ClientRectangle>304,184,160,20</ClientRectangle>
          <Components isList="true" count="0" />
          <Font>Arial,12,Regular,Point,False,0</Font>
          <ForeColor>Black</ForeColor>
          <Guid>9921485e4393479a8c222fca2917f2db</Guid>
          <Items isList="true" count="4">
            <value>حضور</value>
            <value>غیبت</value>
            <value>ماموریت</value>
            <value>اضافه کار</value>
          </Items>
          <Location>304, 184</Location>
          <Name>cmbType</Name>
          <Page isRef="28" />
          <Parent isRef="28" />
          <RightToLeft>Yes</RightToLeft>
          <Size>160, 20</Size>
          <Text>Combo Box</Text>
        </cmbType>
        <LabelControl1 Ref="36" type="Stimulsoft.Report.Dialogs.StiLabelControl" isKey="true">
          <BackColor>Control</BackColor>
          <ClientRectangle>320,152,144,24</ClientRectangle>
          <Components isList="true" count="0" />
          <Font>Arial,12,Regular,Point,False,0</Font>
          <ForeColor>Black</ForeColor>
          <Guid>6b9124d9184841b68846fae68cffef4e</Guid>
          <Location>320, 152</Location>
          <Name>LabelControl1</Name>
          <Page isRef="28" />
          <Parent isRef="28" />
          <RightToLeft>Inherit</RightToLeft>
          <Size>144, 24</Size>
          <Text>مرتب سازی براساس</Text>
          <TextAlign>MiddleRight</TextAlign>
        </LabelControl1>
      </Components>
      <Font>Microsoft Sans Serif,8</Font>
      <Guid>64ae0f1264844db8b358d3b5bb251e4c</Guid>
      <Location>0, 0</Location>
      <Name>Form1</Name>
      <Report isRef="0" />
      <Size>488, 352</Size>
      <Text>فیلتر</Text>
    </Form1>
  </Pages>
  <PrinterSettings Ref="37" type="Stimulsoft.Report.Print.StiPrinterSettings" isKey="true" />
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
  <ReportChanged>4/29/2013 1:01:44 PM</ReportChanged>
  <ReportCreated>4/15/2013 11:04:05 AM</ReportCreated>
  <ReportFile>D:\Iman Report\NemodarKarkerdReport\NemodarKarkerdReport2.mrt</ReportFile>
  <ReportGuid>2fcd83de9b7d40d59f422728b948ed4e</ReportGuid>
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
  <Styles isList="true" count="2">
    <DataBand1Style Ref="38" type="Stimulsoft.Report.StiStyle" isKey="true">
      <Border>None;Transparent;1;Solid;False;4;Black</Border>
      <Brush>MistyRose</Brush>
      <Conditions isList="true" count="0" />
      <Description>Style based on formating of ''DataBand1'' component</Description>
      <Font>Arial,8</Font>
      <Name>DataBand1Style</Name>
      <TextBrush>Black</TextBrush>
    </DataBand1Style>
    <Style1 Ref="39" type="Stimulsoft.Report.StiStyle" isKey="true">
      <Brush>Khaki</Brush>
      <Conditions isList="true" count="0" />
      <Description />
      <Font>Arial,8</Font>
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
--------------------------------------------------------------------------------------------------------------
INSERT INTO [TA_ReportParameter]
           (
            [ReportParameter_RptUIParamId]
           ,[ReportParameter_Name]
           ,[ReportParameter_RptFileId]
           )
     VALUES
           (
            (SELECT RptUIParameter_ID FROM TA_ReportUIParameter WHERE RptUIParameter_ActionId like N'PersonDateRange')
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
            (SELECT RptUIParameter_ID FROM TA_ReportUIParameter WHERE RptUIParameter_ActionId like N'PersonDateRange')
           ,'@ToDate'
           ,(SELECT ReportFile_ID FROM TA_ReportFile WHERE ReportFile_Name = @ReportFile_Name)
           )
           
           
           
