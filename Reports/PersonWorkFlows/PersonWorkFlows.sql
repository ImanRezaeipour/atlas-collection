﻿--set quoted_identifier on

declare @ReportFile_Name nvarchar(max)
declare @Report_Name nvarchar(max)
declare @ReportFile_File nvarchar(max)
declare @Report_RootName nvarchar(max)=N'درخواستها'
-------------------------------------------------------------------------------------------------------------
set @ReportFile_Name=N'R4343A430'
set @Report_Name=N'گزارش جریان کاری پرسنل'
set @ReportFile_File=N'<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<StiSerializer version="1.02" type="Net" application="StiReport">
  <Dictionary Ref="1" type="Dictionary" isKey="true">
    <BusinessObjects isList="true" count="0" />
    <Databases isList="true" count="1">
      <Connection Ref="2" type="Stimulsoft.Report.Dictionary.StiSqlDatabase" isKey="true">
        <Alias>Connection</Alias>
        <ConnectionString>Password=salta12345;Persist Security Info=True;Data Source=APPSRV\SQL2008R2;Integrated Security=False;Initial Catalog=GhadirGTS;User ID=atlas</ConnectionString>
        <Name>Connection</Name>
      </Connection>
    </Databases>
    <DataSources isList="true" count="2">
      <DataSource1 Ref="3" type="Stimulsoft.Report.Dictionary.StiSqlSource" isKey="true">
        <Alias>DataSource1</Alias>
        <Columns isList="true" count="6">
          <value>ManagerLevel,System.String</value>
          <value>ManagerName,System.String</value>
          <value>FlowName,System.String</value>
          <value>Prs_Barcode,System.String</value>
          <value>userFirstName,System.String</value>
          <value>userLastName,System.String</value>
        </Columns>
        <CommandTimeout>10000</CommandTimeout>
        <Dictionary isRef="1" />
        <Name>DataSource1</Name>
        <NameInSource>Connection</NameInSource>
        <Parameters isList="true" count="0" />
        <SqlCommand>--declare @depId numeric(18,0), {ReportHelper.Instance().ModifiedIds()} numeric(18,0)
--set {ReportHelper.Instance().ModifiedIds()} = 32687
--select @depId=prs_DepartmentId from ta_person where prs_id={ReportHelper.Instance().ModifiedIds()}

select  allmngFlow.mngrFlow_ID ManagerFlowID,allmngFlow.mngrFlow_ManagerID ManagerID
,allmngFlow.mngrFlow_FlowID FlowID
,ff.Flow_FlowName FlowName
,mngPrs.Prs_FirstName+'' ''+mngPrs.Prs_LastName ManagerName,allmngFlow.mngrFlow_Level ManagerLevel,prsid,userPrs.Prs_FirstName as userFirstName,userPrs.Prs_LastName as userLastName,
userPrs.Prs_Barcode

FROM
(select MngFlow.mngrFlow_ID as ManagerFlowID, MngFlow.mngrFlow_ManagerID as ManagerID,mngrFlow_FlowID as FlowId,prsid, person.Prs_FirstName + '' '' + person.Prs_LastName as ManagerName from 
(select  managerFlow.mngrFlow_ID, managerFlow.mngrFlow_FlowID, managerFlow.mngrFlow_ManagerID	                        
	from TA_Flow flow		                            
		                            inner join TA_ManagerFlow managerFlow 
		                            on flow.Flow_ID = managerFlow.mngrFlow_FlowID and flow_MainFlow=1
		                            where managerFlow.mngrFlow_Level = 1 and managerFlow.mngrFlow_Active = 1 and flow.Flow_ActiveFlow = 1) MngFlow
		                            inner join
(select underManagment.underMng_FlowID,underMng_PersonID as prsID from TA_UnderManagment underManagment 
		                            where underManagment.underMng_PersonID in ({ReportHelper.Instance().ModifiedIds()}) and underManagment.underMng_Contains = 1 and underManagment.underMng_PersonID is not null
		                            union
select underMng_FlowID,prsID from
(select underManagment.underMng_FlowID, underManagment.underMng_DepartmentID,person.Prs_ID as prsID from TA_UnderManagment underManagment
								                            inner join TA_Person person
								                            on person.Prs_DepartmentId =  underManagment.underMng_DepartmentID 
								                            inner join TA_Request request
								                            on person.Prs_ID = request.request_PersonID
where underManagment.underMng_DepartmentID in ( select prs_DepartmentId from ta_person where prs_id in({ReportHelper.Instance().ModifiedIds()})) and underManagment.underMng_PersonID is null and underManagment.underMng_Contains = 1 
								                            and person.Prs_ID not in
(select underManagment.underMng_PersonID from TA_UnderManagment underManagment        
													                                where underManagment.underMng_Contains = 0 and underManagment.underMng_PersonID is not null))UnderMng
		                            union
select UnderMngDep.underMng_FlowID,person.prs_ID as prsID from
(select underManagment.underMng_FlowID, underManagment.underMng_DepartmentID from TA_UnderManagment underManagment
											inner join TA_Department department
											on department.dep_ID =  underManagment.underMng_DepartmentID 
											where underManagment.underMng_PersonID is null and underManagment.underMng_Contains = 1 and underManagment.underMng_ContainInnerChilds = 1) UnderMngDep
											inner join TA_Person person 
											on person.Prs_DepartmentId in
(select department.dep_ID from TA_Department department																		 
																		where department.dep_ParentPath LIKE ''%,'' + convert(nvarchar(max), UnderMngDep.underMng_DepartmentID) + '',%'')
																	   or
																		person.Prs_DepartmentId = UnderMngDep.underMng_DepartmentID
										   inner join TA_Request request
										   on request.request_PersonID = person.Prs_ID
										   where person.Prs_ID not in
(select underManagment.underMng_DepartmentID from TA_UnderManagment underManagment
																    inner join TA_Person person
																    on person.Prs_DepartmentId in
(select department.dep_ID FROM TA_Department department																				                                                         
																					  where department.dep_ParentPath LIKE ''%,'' + convert(nvarchar(max), underManagment.underMng_DepartmentID) + '',%''
																					  or
																					  person.Prs_DepartmentId = underManagment.underMng_DepartmentID)
																	where underManagment.underMng_PersonID is null and underManagment.underMng_Contains = 0 and underManagment.underMng_ContainInnerChilds = 1)																						  																				                   
										                       and person.Prs_ID not in											    
(select person.Prs_ID from TA_UnderManagment underManagment 
																                      inner join TA_Person person
																                      on person.Prs_DepartmentId = underManagment.underMng_DepartmentID 										  										                                               										                         																   
																                      where underManagment.underMng_PersonID is null and underManagment.underMng_Contains = 0 and underManagment.underMng_ContainInnerChilds = 0 and Prs_PrsDtlID not in ({ReportHelper.Instance().ModifiedIds()}))																					    
and person.Prs_DepartmentId in ( select prs_DepartmentId from ta_person where prs_id in({ReportHelper.Instance().ModifiedIds()}))) UndMng	                               
		                    on MngFlow.mngrFlow_FlowID = UndMng.underMng_FlowID
                            inner join TA_Manager manager
                            on MngFlow.mngrFlow_ManagerID = manager.MasterMng_ID
                            inner join TA_Person person
                            on manager.MasterMng_PersonID = person.Prs_ID
                            where UndMng.underMng_FlowID not in 
(select distinct underManagment.underMng_FlowID from TA_UnderManagment underManagment	
							                                    where underManagment.underMng_Contains = 0 and underManagment.underMng_PersonID is not null and underManagment.underMng_PersonID in ({ReportHelper.Instance().ModifiedIds()})))as mngflow
join TA_ManagerFlow as allmngFlow on mngflow.FlowId=allmngFlow.mngrFlow_FlowID and allmngFlow.mngrFlow_Active=1
join TA_Manager on MasterMng_ID=allmngFlow.mngrFlow_ManagerID
join TA_Person mngPrs on Prs_ID=MasterMng_PersonID
join TA_Flow ff on ff.Flow_Id=allmngFlow.mngrFlow_FlowID
join ta_person userPrs on userPrs.prs_id =prsid
where (prsid in ({ReportHelper.Instance().ModifiedIds()}))
order by allmngFlow.mngrFlow_FlowID,allmngFlow.mngrFlow_Level

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

join  TA_OrganDefine on DataAccessOrgan_ID=OrgDef_ID

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
        <PageHeaderBand2 Ref="6" type="PageHeaderBand" isKey="true">
          <Brush>Transparent</Brush>
          <ClientRectangle>0,0.2,7.72,1.1</ClientRectangle>
          <Components isList="true" count="9">
            <Text2 Ref="7" type="Text" isKey="true">
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
              <Guid>0dc898ce4fa043bb8c3df1e221f46e06</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <MinSize>1,0</MinSize>
              <Name>Text2</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>: تاریخ تهیه گزارش</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </Text2>
            <Text4 Ref="8" type="Text" isKey="true">
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
              <Guid>052a43603d9648f8ac64bb3677907ec5</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text4</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>: تهیه کننده</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </Text4>
            <Text3 Ref="9" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>0.1,0.1,1.14,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>ef50c627df2449c4ac7acdba36291f10</Guid>
              <Margins>0,0,0,0</Margins>
              <Name>Text3</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>{Persian(ReportHelper.Instance().ShamsiGetNow())}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </Text3>
            <Text5 Ref="10" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>0.1,0.4,1.18,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>bb6aee2f3f1a492d9102f0feaa8ca40b</Guid>
              <Margins>0,0,0,0</Margins>
              <Name>Text5</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>{ReportHelper.Instance().UserName}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </Text5>
            <Text1 Ref="11" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>2.6,0,3.07,0.8</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,18,Bold</Font>
              <Guid>e9431b652f43406c925712d49584caa9</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text1</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>{nameOrg.OrgDef_Name}
گزارش جریان های کاری پرسنل</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
            </Text1>
            <Text7 Ref="12" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>5.7,0.1,1.9,0.2</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>6ff571d39ba24dba9b10dc8b0920e296</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text7</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>: گزارش جریان های کاری خانم/آقای</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </Text7>
            <Text9 Ref="13" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>6.1,0.4,1.5,0.2</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>a3b0ce765f414ffbadffe9e7e1999eba</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text9</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>{DataSource1.userFirstName + " " + DataSource1.userLastName}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </Text9>
            <Text15 Ref="14" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>6.7,0.7,0.9,0.2</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>8a3506a962534006848d1cbe11fff2c7</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text15</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>: شماره پرسنلی</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </Text15>
            <Text16 Ref="15" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>5.7,0.7,0.9,0.2</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>45c181dd3849431eb8151df42e7d4f72</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text16</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>{DataSource1.Prs_Barcode}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>DataColumn</Type>
              <VertAlignment>Center</VertAlignment>
            </Text16>
          </Components>
          <Conditions isList="true" count="0" />
          <Guid>1a4ff3db3888488db768d6680522d33c</Guid>
          <Name>PageHeaderBand2</Name>
          <Page isRef="5" />
          <Parent isRef="5" />
        </PageHeaderBand2>
        <GroupHeaderBand1 Ref="16" type="GroupHeaderBand" isKey="true">
          <Brush>Transparent</Brush>
          <ClientRectangle>0,1.7,7.72,0</ClientRectangle>
          <Components isList="true" count="0" />
          <Condition>{DataSource1.Prs_Barcode}</Condition>
          <Conditions isList="true" count="0" />
          <Name>GroupHeaderBand1</Name>
          <NewPageBefore>True</NewPageBefore>
          <Page isRef="5" />
          <Parent isRef="5" />
          <SortDirection>Descending</SortDirection>
        </GroupHeaderBand1>
        <HeaderDataSource1 Ref="17" type="HeaderBand" isKey="true">
          <Brush>[191:191:191]</Brush>
          <ClientRectangle>0,2.1,7.72,0.3</ClientRectangle>
          <Components isList="true" count="3">
            <HeaderDataSource1_ManagerLevel Ref="18" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <ClientRectangle>0,0,2.6,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderDataSource1_ManagerLevel</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>سطح مدیر</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </HeaderDataSource1_ManagerLevel>
            <HeaderDataSource1_ManagerName Ref="19" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <ClientRectangle>2.6,0,2.6,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderDataSource1_ManagerName</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>نام مدیر</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </HeaderDataSource1_ManagerName>
            <HeaderDataSource1_FlowName Ref="20" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <ClientRectangle>5.2,0,2.5,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderDataSource1_FlowName</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>نام جریان کاری</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </HeaderDataSource1_FlowName>
          </Components>
          <ComponentStyle>Style1</ComponentStyle>
          <Conditions isList="true" count="0" />
          <Name>HeaderDataSource1</Name>
          <Page isRef="5" />
          <Parent isRef="5" />
        </HeaderDataSource1>
        <DataDataSource1 Ref="21" type="DataBand" isKey="true">
          <Border>All;Black;1;Solid;False;4;Black</Border>
          <Brush>Transparent</Brush>
          <BusinessObjectGuid isNull="true" />
          <ClientRectangle>0,2.8,7.72,0.3</ClientRectangle>
          <Components isList="true" count="3">
            <DataDataSource1_ManagerLevel Ref="22" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>0,0,2.6,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,11.25,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataDataSource1_ManagerLevel</Name>
              <Page isRef="5" />
              <Parent isRef="21" />
              <Text>{DataSource1.ManagerLevel}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>DataColumn</Type>
              <VertAlignment>Center</VertAlignment>
            </DataDataSource1_ManagerLevel>
            <DataDataSource1_ManagerName Ref="23" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>2.6,0,2.6,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,11.25,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataDataSource1_ManagerName</Name>
              <Page isRef="5" />
              <Parent isRef="21" />
              <Text>{DataSource1.ManagerName}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>DataColumn</Type>
              <VertAlignment>Center</VertAlignment>
            </DataDataSource1_ManagerName>
            <DataDataSource1_FlowName Ref="24" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>5.2,0,2.5,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,11.25,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataDataSource1_FlowName</Name>
              <Page isRef="5" />
              <Parent isRef="21" />
              <Text>{DataSource1.FlowName}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </DataDataSource1_FlowName>
          </Components>
          <Conditions isList="true" count="0" />
          <DataSourceName>DataSource1</DataSourceName>
          <EvenStyle>Even</EvenStyle>
          <Filters isList="true" count="0" />
          <Name>DataDataSource1</Name>
          <Page isRef="5" />
          <Parent isRef="5" />
          <Sort isList="true" count="0" />
        </DataDataSource1>
      </Components>
      <Conditions isList="true" count="0" />
      <Guid>e8e7a72724b54ce99c1821ab43d00cc9</Guid>
      <Margins>0.39,0.39,0.39,0.39</Margins>
      <Name>Page1</Name>
      <PageHeight>11</PageHeight>
      <PageWidth>8.5</PageWidth>
      <PaperSize>Letter</PaperSize>
      <Report isRef="0" />
      <Watermark Ref="25" type="Stimulsoft.Report.Components.StiWatermark" isKey="true">
        <Font>Arial,100</Font>
        <TextBrush>[50:0:0:0]</TextBrush>
      </Watermark>
    </Page1>
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
  <ReportChanged>2/6/2013 10:29:10 AM</ReportChanged>
  <ReportCreated>2/4/2013 5:14:48 PM</ReportCreated>
  <ReportFile>D:\Ghadir Projects\Atlas\Report\PersonWorkFlows.mrt</ReportFile>
  <ReportGuid>0e6f32ec4e724b088062f3eb74f090a4</ReportGuid>
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
      <Brush>[247:181:128]</Brush>
      <Conditions isList="true" count="0" />
      <Description />
      <Font>Tahoma,14.25,Regular,Point,False,0</Font>
      <Name>Master</Name>
      <TextBrush>Black</TextBrush>
    </Master>
    <Even Ref="28" type="Stimulsoft.Report.StiStyle" isKey="true">
      <Brush>[250:206:170]</Brush>
      <Conditions isList="true" count="0" />
      <Description />
      <Font>Tahoma,14.25,Regular,Point,False,0</Font>
      <Name>Even</Name>
      <TextBrush>Black</TextBrush>
    </Even>
    <Style1 Ref="29" type="Stimulsoft.Report.StiStyle" isKey="true">
      <Brush>[191:191:191]</Brush>
      <Conditions isList="true" count="0" />
      <Description />
      <Font>Tahoma,14.25,Regular,Point,False,0</Font>
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
            (SELECT RptUIParameter_ID FROM TA_ReportUIParameter WHERE RptUIParameter_ActionId like N'PersonfromtoDateRange')
           ,'@fromDate'
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
            (SELECT RptUIParameter_ID FROM TA_ReportUIParameter WHERE RptUIParameter_ActionId like N'PersonfromtoDateRange')
           ,'@toDate'
           ,(SELECT ReportFile_ID FROM TA_ReportFile WHERE ReportFile_Name = @ReportFile_Name)
           )
