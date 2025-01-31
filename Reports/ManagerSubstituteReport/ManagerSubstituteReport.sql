﻿--set quoted_identifier on

declare @ReportFile_Name nvarchar(max)
declare @Report_Name nvarchar(max)
declare @ReportFile_File nvarchar(max)
declare @Report_RootName nvarchar(max)=N'درخواستها'
-------------------------------------------------------------------------------------------------------------
set @ReportFile_Name=N'R4343A440'
set @Report_Name=N'مدیریت - جانشین'
set @ReportFile_File=N'<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<StiSerializer version="1.02" type="Net" application="StiReport">
  <Dictionary Ref="1" type="Dictionary" isKey="true">
    <BusinessObjects isList="true" count="0" />
    <Databases isList="true" count="1">
      <Connection Ref="2" type="Stimulsoft.Report.Dictionary.StiSqlDatabase" isKey="true">
        <Alias>Connection</Alias>
        <ConnectionString>Password=123;Persist Security Info=True;Data Source=payervand-pc;Integrated Security=False;Initial Catalog=falatslow;User ID=farhad</ConnectionString>
        <Name>Connection</Name>
      </Connection>
    </Databases>
    <DataSources isList="true" count="7">
      <Modir Ref="3" type="Stimulsoft.Report.Dictionary.StiSqlSource" isKey="true">
        <Alias>Modir</Alias>
        <Columns isList="true" count="14">
          <value>MasterMng_ID,System.Decimal</value>
          <value>MasterMng_Active,System.Boolean</value>
          <value>ManagerPersonID,System.Decimal</value>
          <value>ManagerBarcode,System.String</value>
          <value>ManagerName,System.String</value>
          <value>mngrFlow_Active,System.Boolean</value>
          <value>mngrFlow_Level,System.Int32</value>
          <value>Flow_FlowName,System.String</value>
          <value>Flow_ActiveFlow,System.Boolean</value>
          <value>Flow_MainFlow,System.Boolean</value>
          <value>accessGrp_Name,System.String</value>
          <value>MasterMng_PersonID,System.Decimal</value>
          <value>PrsName,System.String</value>
          <value>PrsBarcode,System.String</value>
        </Columns>
        <CommandTimeout>30</CommandTimeout>
        <Dictionary isRef="1" />
        <Name>Modir</Name>
        <NameInSource>Connection</NameInSource>
        <Parameters isList="true" count="0" />
        <SqlCommand>select p.Prs_FirstName+'' ''+p.Prs_LastName as PrsName,p.Prs_Barcode as PrsBarcode,MasterMng_PersonID,MasterMng_ID,MasterMng_Active,isnull(prs1.Prs_ID,0)+isnull(prs2.Prs_ID,0) as ManagerPersonID,isnull(prs1.Prs_Barcode,'''')+isnull(prs2.Prs_Barcode,'''') as ManagerBarcode,isnull(prs1.Prs_FirstName,'''')+isnull(prs2.Prs_FirstName,'''')+'' ''+isnull(prs1.Prs_LastName,'''')+isnull(prs2.Prs_LastName,'''') as ManagerName 
	,mngrFlow_Active,mngrFlow_Level,Flow_FlowName,Flow_ActiveFlow,Flow_MainFlow,accessGrp_Name
	from TA_Manager
	left outer join TA_OrganizationUnit on organ_ID=MasterMng_OrganizationUnitID
left outer join TA_Person prs2 on prs2.Prs_ID=organ_PersonID
left outer join TA_Person prs1 on prs1.Prs_ID=MasterMng_PersonID
join TA_ManagerFlow on mngrFlow_ManagerID=MasterMng_ID
join TA_Flow on Flow_ID=mngrFlow_FlowID
join TA_PrecardAccessGroup on Flow_AccessGroupID=accessGrp_ID
join TA_Person p on p.Prs_ID=MasterMng_PersonID
where mngrFlow_Active=1 and p.Prs_ID in({ReportHelper.Instance().ModifiedIds()})
order by ManagerName,Flow_ID</SqlCommand>
      </Modir>
      <Janeshin Ref="4" type="Stimulsoft.Report.Dictionary.StiSqlSource" isKey="true">
        <Alias>Janeshin</Alias>
        <Columns isList="true" count="11">
          <value>MasterMng_ID,System.Decimal</value>
          <value>MasterMng_Active,System.Boolean</value>
          <value>ManagerPersonID,System.Decimal</value>
          <value>ManagerBarcode,System.String</value>
          <value>ManagerName,System.String</value>
          <value>SubstitutePersonId,System.Decimal</value>
          <value>SubstituteBarcode,System.String</value>
          <value>SubstituteName,System.String</value>
          <value>FromDatem,System.String</value>
          <value>ToDatem,System.String</value>
          <value>org,System.String</value>
        </Columns>
        <CommandTimeout>30</CommandTimeout>
        <Dictionary isRef="1" />
        <Name>Janeshin</Name>
        <NameInSource>Connection</NameInSource>
        <Parameters isList="true" count="0" />
        <SqlCommand>select MasterMng_ID,MasterMng_Active,isnull(prs1.Prs_ID,0)+isnull(prs2.Prs_ID,0) as ManagerPersonID,isnull(prs1.Prs_Barcode,'')+isnull(prs2.Prs_Barcode,'') as ManagerBarcode,
	isnull(prs1.Prs_FirstName,'''')+isnull(prs2.Prs_FirstName,'''')+'' ''+isnull(prs1.Prs_LastName,'''')+isnull(prs2.Prs_LastName,'''') as ManagerName,
	prs3.Prs_ID as SubstitutePersonId,prs3.Prs_Barcode as SubstituteBarcode ,prs3.Prs_FirstName+'' ''+prs3.Prs_LastName as SubstituteName
	,dbo.GTS_ASM_MiladiToShamsi(Convert(varchar(10),sub_FromDate,101)) FromDatem,dbo.GTS_ASM_MiladiToShamsi(Convert(varchar(10),sub_ToDate,101)) ToDatem,org.organ_Name as org
from TA_Substitute
join TA_Manager on MasterMng_ID=sub_ManagerId
left outer join TA_OrganizationUnit org on organ_ID=MasterMng_OrganizationUnitID
left outer join TA_Person prs2 on prs2.Prs_ID=organ_PersonID
left outer join TA_Person prs1 on prs1.Prs_ID=MasterMng_PersonID
join TA_Person prs3 on prs3.Prs_ID=sub_PersonId
where sub_PersonId in({ReportHelper.Instance().ModifiedIds()})</SqlCommand>
      </Janeshin>
      <Janeshinan Ref="5" type="Stimulsoft.Report.Dictionary.StiSqlSource" isKey="true">
        <Alias>Janeshinan</Alias>
        <Columns isList="true" count="10">
          <value>MasterMng_ID,System.Decimal</value>
          <value>MasterMng_Active,System.Boolean</value>
          <value>ManagerPersonID,System.Decimal</value>
          <value>ManagerBarcode,System.String</value>
          <value>ManagerName,System.String</value>
          <value>SubstitutePersonId,System.Decimal</value>
          <value>SubstituteBarcode,System.String</value>
          <value>SubstituteName,System.String</value>
          <value>FromDatem,System.String</value>
          <value>ToDatem,System.String</value>
        </Columns>
        <CommandTimeout>30</CommandTimeout>
        <Dictionary isRef="1" />
        <Name>Janeshinan</Name>
        <NameInSource>Connection</NameInSource>
        <Parameters isList="true" count="0" />
        <SqlCommand>select MasterMng_ID,MasterMng_Active,isnull(prs1.Prs_ID,0)+isnull(prs2.Prs_ID,0) as ManagerPersonID,isnull(prs1.Prs_Barcode,'''')+isnull(prs2.Prs_Barcode,'''') as ManagerBarcode,isnull(prs1.Prs_FirstName,'''')+isnull(prs2.Prs_FirstName,'''')+'' ''+isnull(prs1.Prs_LastName,'''')+isnull(prs2.Prs_LastName,'''') as ManagerName,prs3.Prs_ID as SubstitutePersonId,prs3.Prs_Barcode as SubstituteBarcode ,prs3.Prs_FirstName+'' ''+prs3.Prs_LastName as SubstituteName 
	,dbo.GTS_ASM_MiladiToShamsi(Convert(varchar(10),sub_FromDate,101)) FromDatem,dbo.GTS_ASM_MiladiToShamsi(Convert(varchar(10),sub_ToDate,101)) ToDatem
from TA_Substitute
join TA_Manager on MasterMng_ID=sub_ManagerId
left outer join TA_OrganizationUnit on organ_ID=MasterMng_OrganizationUnitID
left outer join TA_Person prs2 on prs2.Prs_ID=organ_PersonID
left outer join TA_Person prs1 on prs1.Prs_ID=MasterMng_PersonID
join TA_Person prs3 on prs3.Prs_ID=sub_PersonId
where MasterMng_PersonID in({ReportHelper.Instance().ModifiedIds()})</SqlCommand>
      </Janeshinan>
      <Modiran Ref="6" type="Stimulsoft.Report.Dictionary.StiSqlSource" isKey="true">
        <Alias>Modiran</Alias>
        <Columns isList="true" count="6">
          <value>ManagerFlowID,System.Decimal</value>
          <value>ManagerID,System.Decimal</value>
          <value>FlowID,System.Decimal</value>
          <value>ManagerName,System.String</value>
          <value>ManagerLevel,System.Int32</value>
          <value>organName,System.String</value>
        </Columns>
        <CommandTimeout>30</CommandTimeout>
        <Dictionary isRef="1" />
        <Name>Modiran</Name>
        <NameInSource>Connection</NameInSource>
        <Parameters isList="true" count="0" />
        <SqlCommand>select mngrFlow_ID ManagerFlowID,allmngFlow.mngrFlow_ManagerID ManagerID,allmngFlow.mngrFlow_FlowID FlowID,
isnull(outManager.organPrsFirstName,'''')+isnull(outManager.prsFirstName,'''') + '' '' + isnull(outManager.organPrsLastName,'''')+isnull(outManager.prsLastName,'''')
 as  ManagerName,
allmngFlow.mngrFlow_Level ManagerLevel,organName
FROM
(select MngFlow.mngrFlow_ID as ManagerFlowID, MngFlow.mngrFlow_ManagerID as ManagerID,mngrFlow_FlowID as FlowId,  isnull(manager.organPrsFirstName,'''')+isnull(manager.prsFirstName,'''') + '' '' + isnull(manager.organPrsLastName,'''')+isnull(manager.prsLastName,'''') as ManagerName from 
(select  managerFlow.mngrFlow_ID, managerFlow.mngrFlow_FlowID, managerFlow.mngrFlow_ManagerID	                        
	from TA_Flow flow		                            
		                            inner join TA_ManagerFlow managerFlow 
		                            on flow.Flow_ID = managerFlow.mngrFlow_FlowID and flow_MainFlow=1
		                            where managerFlow.mngrFlow_Level = 1 and managerFlow.mngrFlow_Active = 1 and flow.Flow_ActiveFlow = 1) MngFlow
		                            inner join
(select underManagment.underMng_FlowID from TA_UnderManagment underManagment 
		                            where underManagment.underMng_PersonID in ({ReportHelper.Instance().ModifiedIds()}) and underManagment.underMng_Contains = 1 and underManagment.underMng_PersonID is not null
		                            union
select underMng_FlowID from
(select underManagment.underMng_FlowID, underManagment.underMng_DepartmentID from TA_UnderManagment underManagment
								                            inner join TA_Person person
								                            on  person.prs_IsDeleted=0 AND person.Prs_DepartmentId =  underManagment.underMng_DepartmentID 
								                            inner join TA_Request request
								                            on person.Prs_ID = request.request_PersonID
where underManagment.underMng_DepartmentID in (select Prs_DepartmentId from TA_Person where Prs_ID in ({ReportHelper.Instance().ModifiedIds()})) and underManagment.underMng_PersonID is null and underManagment.underMng_Contains = 1 
								                            and person.Prs_ID not in
(select underManagment.underMng_PersonID from TA_UnderManagment underManagment        
													                                where underManagment.underMng_Contains = 0 and underManagment.underMng_PersonID is not null))UnderMng
		                            union
select UnderMngDep.underMng_FlowID from
(select underManagment.underMng_FlowID, underManagment.underMng_DepartmentID from TA_UnderManagment underManagment
											inner join TA_Department department
											on department.dep_ID =  underManagment.underMng_DepartmentID 
											where underManagment.underMng_PersonID is null and underManagment.underMng_Contains = 1 and underManagment.underMng_ContainInnerChilds = 1) UnderMngDep
											inner join TA_Person person 
											on  person.prs_IsDeleted=0 AND person.Prs_DepartmentId in
(select department.dep_ID from TA_Department department																		 
																		where department.dep_ParentPath LIKE ''%,'' + convert(nvarchar(max), UnderMngDep.underMng_DepartmentID) + '',%'')
																	   or
																		person.Prs_DepartmentId = UnderMngDep.underMng_DepartmentID
										   inner join TA_Request request
										   on request.request_PersonID = person.Prs_ID
										   where person.Prs_ID not in
(select underManagment.underMng_DepartmentID from TA_UnderManagment underManagment
																    inner join TA_Person person
																    on  person.prs_IsDeleted=0 AND person.Prs_DepartmentId in
(select department.dep_ID FROM TA_Department department																				                                                         
																					  where department.dep_ParentPath LIKE ''%,'' + convert(nvarchar(max), underManagment.underMng_DepartmentID) + '',%''
																					  or
																					  person.Prs_DepartmentId = underManagment.underMng_DepartmentID)
																	where underManagment.underMng_PersonID is null and underManagment.underMng_Contains = 0 and underManagment.underMng_ContainInnerChilds = 1)																						  																				                   
										                       and person.Prs_ID not in											    
(select person.Prs_ID from TA_UnderManagment underManagment 
																                      inner join TA_Person person
																                      on  person.prs_IsDeleted=0 AND person.Prs_DepartmentId = underManagment.underMng_DepartmentID 										  										                                               										                         																   
																                      where underManagment.underMng_PersonID is null and underManagment.underMng_Contains = 0 and underManagment.underMng_ContainInnerChilds = 0 and Prs_PrsDtlID not in ({ReportHelper.Instance().ModifiedIds()}))																					    
and person.Prs_DepartmentId in (select Prs_DepartmentId from TA_Person where Prs_ID in ({ReportHelper.Instance().ModifiedIds()}))) UndMng	                               
		                    on MngFlow.mngrFlow_FlowID = UndMng.underMng_FlowID                          
                            
join (select mng.MasterMng_ID,prs1.Prs_ID prsID,prs1.Prs_FirstName prsFirstName,prs1.Prs_LastName prsLastName,prs2.Prs_ID organPrsID,prs2.Prs_FirstName organPrsFirstName,prs2.Prs_LastName organPrsLastName
								from TA_Manager mng
								left outer join TA_Person prs1 on prs1.prs_IsDeleted=0 AND  mng.MasterMng_PersonID = prs1.Prs_ID
								left outer join TA_OrganizationUnit organ on organ_ID=mng.MasterMng_OrganizationUnitID
								left outer join TA_Person prs2 on prs2.prs_IsDeleted=0 AND  organ.organ_PersonID = prs2.Prs_ID
                            ) manager
                            on MngFlow.mngrFlow_ManagerID = manager.MasterMng_ID
                            where UndMng.underMng_FlowID not in 
(select distinct underManagment.underMng_FlowID from TA_UnderManagment underManagment	
							                                    where underManagment.underMng_Contains = 0 and underManagment.underMng_PersonID is not null and underManagment.underMng_PersonID in ({ReportHelper.Instance().ModifiedIds()})))as mngflow
join TA_ManagerFlow as allmngFlow on mngflow.FlowId=allmngFlow.mngrFlow_FlowID and allmngFlow.mngrFlow_Active=1
join (select mng.MasterMng_ID,prs1.Prs_ID prsID,prs1.Prs_FirstName prsFirstName,prs1.Prs_LastName prsLastName,prs2.Prs_ID organPrsID,prs2.Prs_FirstName organPrsFirstName,prs2.Prs_LastName organPrsLastName,organ_Name organName
								from TA_Manager mng
								left outer join TA_Person prs1 on prs1.prs_IsDeleted=0 AND  mng.MasterMng_PersonID = prs1.Prs_ID
								left outer join TA_OrganizationUnit organ on organ_ID=mng.MasterMng_OrganizationUnitID
								left outer join TA_Person prs2 on prs2.prs_IsDeleted=0 AND  organ.organ_PersonID = prs2.Prs_ID
                            ) outManager
on allmngFlow.mngrFlow_ManagerID = outManager.MasterMng_ID
order by allmngFlow.mngrFlow_Level</SqlCommand>
      </Modiran>
      <nameOrg Ref="7" type="Stimulsoft.Report.Dictionary.StiSqlSource" isKey="true">
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
      <user Ref="8" type="Stimulsoft.Report.Dictionary.StiSqlSource" isKey="true">
        <Alias>user</Alias>
        <Columns isList="true" count="3">
          <value>iPrs_ID,System.Decimal</value>
          <value>iPrs_Barcode,System.String</value>
          <value>iPrsName,System.String</value>
        </Columns>
        <CommandTimeout>30</CommandTimeout>
        <Dictionary isRef="1" />
        <Name>user</Name>
        <NameInSource>Connection</NameInSource>
        <Parameters isList="true" count="0" />
        <SqlCommand>select Prs_ID as iPrs_ID, Prs_Barcode as iPrs_Barcode,Prs_FirstName+'' ''+Prs_LastName as iPrsName from TA_Person
	where Prs_ID in( {ReportHelper.Instance().ModifiedIds()})</SqlCommand>
      </user>
      <Operator Ref="9" type="Stimulsoft.Report.Dictionary.StiSqlSource" isKey="true">
        <Alias>Operator</Alias>
        <Columns isList="true" count="6">
          <value>flowId,System.Decimal</value>
          <value>flowName,System.String</value>
          <value>accessGroupName,System.String</value>
          <value>activeFlow,System.Boolean</value>
          <value>personBarcode,System.String</value>
          <value>personName,System.String</value>
        </Columns>
        <CommandTimeout>30</CommandTimeout>
        <Dictionary isRef="1" />
        <Name>Operator</Name>
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
join TA_PrecardAccessGroup PrecardAccessGroup on Flow.Flow_AccessGroupID=PrecardAccessGroup.accessGrp_ID
where Operator.opr_PersonId in({ReportHelper.Instance().ModifiedIds()})</SqlCommand>
      </Operator>
    </DataSources>
    <Relations isList="true" count="0" />
    <Report isRef="0" />
    <Variables isList="true" count="0" />
  </Dictionary>
  <EngineVersion>EngineV2</EngineVersion>
  <GlobalizationStrings isList="true" count="0" />
  <MetaTags isList="true" count="0" />
  <Pages isList="true" count="1">
    <Page1 Ref="10" type="Page" isKey="true">
      <Border>None;Black;2;Solid;False;4;Black</Border>
      <Brush>Transparent</Brush>
      <Components isList="true" count="16">
        <PageHeaderBand2 Ref="11" type="PageHeaderBand" isKey="true">
          <Brush>Transparent</Brush>
          <ClientRectangle>0,0.2,7.72,0.9</ClientRectangle>
          <Components isList="true" count="9">
            <Text2 Ref="12" type="Text" isKey="true">
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
              <Page isRef="10" />
              <Parent isRef="11" />
              <Text>: تاریخ تهیه گزارش</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </Text2>
            <Text4 Ref="13" type="Text" isKey="true">
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
              <Page isRef="10" />
              <Parent isRef="11" />
              <Text>: تهیه کننده</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </Text4>
            <Text3 Ref="14" type="Text" isKey="true">
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
              <Page isRef="10" />
              <Parent isRef="11" />
              <Text>{ReportHelper.Instance().ShamsiGetNow()}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </Text3>
            <Text5 Ref="15" type="Text" isKey="true">
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
              <Page isRef="10" />
              <Parent isRef="11" />
              <Text>{ReportHelper.Instance().UserName}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </Text5>
            <Text7 Ref="16" type="Text" isKey="true">
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
              <Page isRef="10" />
              <Parent isRef="11" />
              <Text>گزارش مدیر - جانشین خانم/آقای</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </Text7>
            <Text9 Ref="17" type="Text" isKey="true">
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
              <Page isRef="10" />
              <Parent isRef="11" />
              <Text>{user.iPrsName}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>DataColumn</Type>
              <VertAlignment>Center</VertAlignment>
            </Text9>
            <Text15 Ref="18" type="Text" isKey="true">
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
              <Page isRef="10" />
              <Parent isRef="11" />
              <Text>: شماره پرسنلی</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </Text15>
            <Text16 Ref="19" type="Text" isKey="true">
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
              <Page isRef="10" />
              <Parent isRef="11" />
              <Text>{user.iPrs_Barcode}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>DataColumn</Type>
              <VertAlignment>Center</VertAlignment>
            </Text16>
            <txtOrgDefName Ref="20" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>2.2,0.1,3.37,0.67</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,18,Bold,Point,False,0</Font>
              <Guid>2e6075674b4547cab03dbbdc651afd4a</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtOrgDefName</Name>
              <Page isRef="10" />
              <Parent isRef="11" />
              <Text>{nameOrg.OrgDef_Name}
گزارش مدیر - جانشین</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=True, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
            </txtOrgDefName>
          </Components>
          <Conditions isList="true" count="0" />
          <Guid>1a4ff3db3888488db768d6680522d33c</Guid>
          <Name>PageHeaderBand2</Name>
          <Page isRef="10" />
          <Parent isRef="10" />
        </PageHeaderBand2>
        <HeaderBand1 Ref="21" type="HeaderBand" isKey="true">
          <Brush>EmptyBrush</Brush>
          <ClientRectangle>0,1.5,7.72,0.4</ClientRectangle>
          <Components isList="true" count="1">
            <Text1 Ref="22" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>0,0.1,7.7,0.4</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,14.25,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text1</Name>
              <Page isRef="10" />
              <Parent isRef="21" />
              <Text>جریان های کاری که فرد مدیر آنهاست</Text>
              <TextBrush>Black</TextBrush>
              <Type>Expression</Type>
            </Text1>
          </Components>
          <Conditions isList="true" count="0" />
          <Name>HeaderBand1</Name>
          <Page isRef="10" />
          <Parent isRef="10" />
        </HeaderBand1>
        <HeaderModir Ref="23" type="HeaderBand" isKey="true">
          <Brush>[191:191:191]</Brush>
          <ClientRectangle>0,2.3,7.72,0.3</ClientRectangle>
          <Components isList="true" count="5">
            <HeaderModir_Flow_FlowName Ref="24" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>4.4,0,3.3,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderModir_Flow_FlowName</Name>
              <Page isRef="10" />
              <Parent isRef="23" />
              <Text>نام جریان</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderModir_Flow_FlowName>
            <HeaderModir_accessGrp_Name Ref="25" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>2.4,0,2,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderModir_accessGrp_Name</Name>
              <Page isRef="10" />
              <Parent isRef="23" />
              <Text>سطح دسترسی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderModir_accessGrp_Name>
            <HeaderModir_mngrFlow_Level Ref="26" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>0.8,0,0.8,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderModir_mngrFlow_Level</Name>
              <Page isRef="10" />
              <Parent isRef="23" />
              <Text>درجه</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderModir_mngrFlow_Level>
            <HeaderModir_Flow_MainFlow Ref="27" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>0,0,0.8,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderModir_Flow_MainFlow</Name>
              <Page isRef="10" />
              <Parent isRef="23" />
              <Text>جریان اصلی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderModir_Flow_MainFlow>
            <HeaderModir_Flow_ActiveFlow Ref="28" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>1.6,0,0.8,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderModir_Flow_ActiveFlow</Name>
              <Page isRef="10" />
              <Parent isRef="23" />
              <Text>فعال</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderModir_Flow_ActiveFlow>
          </Components>
          <ComponentStyle>Style1</ComponentStyle>
          <Conditions isList="true" count="0" />
          <Name>HeaderModir</Name>
          <Page isRef="10" />
          <Parent isRef="10" />
        </HeaderModir>
        <DataModir Ref="29" type="DataBand" isKey="true">
          <Brush>Transparent</Brush>
          <BusinessObjectGuid isNull="true" />
          <ClientRectangle>0,3,7.72,0.3</ClientRectangle>
          <Components isList="true" count="5">
            <DataModir_Flow_FlowName Ref="30" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>4.4,0,3.3,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataModir_Flow_FlowName</Name>
              <Page isRef="10" />
              <Parent isRef="29" />
              <Text>{Modir.Flow_FlowName}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </DataModir_Flow_FlowName>
            <DataModir_accessGrp_Name Ref="31" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>2.4,0,2,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataModir_accessGrp_Name</Name>
              <Page isRef="10" />
              <Parent isRef="29" />
              <Text>{Modir.accessGrp_Name}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </DataModir_accessGrp_Name>
            <DataModir_mngrFlow_Level Ref="32" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>0.8,0,0.8,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataModir_mngrFlow_Level</Name>
              <Page isRef="10" />
              <Parent isRef="29" />
              <Text>{Modir.mngrFlow_Level}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </DataModir_mngrFlow_Level>
            <DataModir_Flow_ActiveFlow Ref="33" type="CheckBox" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <Checked>{Modir.Flow_ActiveFlow}</Checked>
              <ClientRectangle>1.6,0,0.8,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <ContourColor>Black</ContourColor>
              <Name>DataModir_Flow_ActiveFlow</Name>
              <Page isRef="10" />
              <Parent isRef="29" />
              <TextBrush>Black</TextBrush>
            </DataModir_Flow_ActiveFlow>
            <DataModir_Flow_MainFlow Ref="34" type="CheckBox" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <Checked>{Modir.Flow_MainFlow}</Checked>
              <ClientRectangle>0,0,0.8,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <ContourColor>Black</ContourColor>
              <Name>DataModir_Flow_MainFlow</Name>
              <Page isRef="10" />
              <Parent isRef="29" />
              <TextBrush>Black</TextBrush>
            </DataModir_Flow_MainFlow>
          </Components>
          <Conditions isList="true" count="0" />
          <DataSourceName>Modir</DataSourceName>
          <EvenStyle>Even</EvenStyle>
          <Filters isList="true" count="0" />
          <Name>DataModir</Name>
          <Page isRef="10" />
          <Parent isRef="10" />
          <Sort isList="true" count="0" />
        </DataModir>
        <HeaderBand2 Ref="35" type="HeaderBand" isKey="true">
          <Brush>EmptyBrush</Brush>
          <ClientRectangle>0,3.7,7.72,0.4</ClientRectangle>
          <Components isList="true" count="1">
            <Text6 Ref="36" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>0,0.1,7.7,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,14.25,Bold,Point,False,0</Font>
              <Guid>0fc4eff595d44718bc3b4a2357c7b264</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text6</Name>
              <Page isRef="10" />
              <Parent isRef="35" />
              <Text>لیست مدیران شخص</Text>
              <TextBrush>Black</TextBrush>
              <Type>Expression</Type>
            </Text6>
          </Components>
          <Conditions isList="true" count="0" />
          <Guid>10d5937817e647109daf85aa22d6e431</Guid>
          <Name>HeaderBand2</Name>
          <Page isRef="10" />
          <Parent isRef="10" />
        </HeaderBand2>
        <HeaderModiran Ref="37" type="HeaderBand" isKey="true">
          <Brush>[191:191:191]</Brush>
          <ClientRectangle>0,4.5,7.72,0.3</ClientRectangle>
          <Components isList="true" count="3">
            <HeaderModiran_ManagerLevel Ref="38" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>0,0,0.8,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderModiran_ManagerLevel</Name>
              <Page isRef="10" />
              <Parent isRef="37" />
              <Text>سطح مدیر</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderModiran_ManagerLevel>
            <HeaderModiran_ManagerName Ref="39" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>0.8,0,3.6,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderModiran_ManagerName</Name>
              <Page isRef="10" />
              <Parent isRef="37" />
              <Text>نام مدیر</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderModiran_ManagerName>
            <Text11 Ref="40" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>4.4,0,3.3,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <Guid>15292fb52ea5442fb907b2eda909e594</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text11</Name>
              <Page isRef="10" />
              <Parent isRef="37" />
              <Text>پست سازمانی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </Text11>
          </Components>
          <ComponentStyle>Style1</ComponentStyle>
          <Conditions isList="true" count="0" />
          <Name>HeaderModiran</Name>
          <Page isRef="10" />
          <Parent isRef="10" />
        </HeaderModiran>
        <DataModiran Ref="41" type="DataBand" isKey="true">
          <Brush>Transparent</Brush>
          <BusinessObjectGuid isNull="true" />
          <ClientRectangle>0,5.2,7.72,0.3</ClientRectangle>
          <Components isList="true" count="3">
            <DataModiran_ManagerLevel Ref="42" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>0,0,0.8,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataModiran_ManagerLevel</Name>
              <Page isRef="10" />
              <Parent isRef="41" />
              <Text>{Modiran.ManagerLevel}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </DataModiran_ManagerLevel>
            <DataModiran_ManagerName Ref="43" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>0.8,0,3.6,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataModiran_ManagerName</Name>
              <Page isRef="10" />
              <Parent isRef="41" />
              <Text>{Modiran.ManagerName}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </DataModiran_ManagerName>
            <Text12 Ref="44" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>4.4,0,3.3,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <Guid>5428a0ed424e4761b6f1f42003c916e3</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text12</Name>
              <Page isRef="10" />
              <Parent isRef="41" />
              <Text>{Modiran.organName}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>DataColumn</Type>
              <VertAlignment>Center</VertAlignment>
            </Text12>
          </Components>
          <Conditions isList="true" count="0" />
          <DataSourceName>Modiran</DataSourceName>
          <EvenStyle>Even</EvenStyle>
          <Filters isList="true" count="0" />
          <Name>DataModiran</Name>
          <Page isRef="10" />
          <Parent isRef="10" />
          <Sort isList="true" count="0" />
        </DataModiran>
        <HeaderBand3 Ref="45" type="HeaderBand" isKey="true">
          <Brush>EmptyBrush</Brush>
          <ClientRectangle>0,5.9,7.72,0.4</ClientRectangle>
          <Components isList="true" count="1">
            <Text8 Ref="46" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>0,0.1,7.7,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,14.25,Bold,Point,False,0</Font>
              <Guid>7e6a12c6f5664fcea14197ae6ccd1681</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text8</Name>
              <Page isRef="10" />
              <Parent isRef="45" />
              <Text>شخص جانشین این افراد است</Text>
              <TextBrush>Black</TextBrush>
              <Type>Expression</Type>
            </Text8>
          </Components>
          <Conditions isList="true" count="0" />
          <Guid>2b1ca94ea7e9410eb91b4affa10e45b8</Guid>
          <Name>HeaderBand3</Name>
          <Page isRef="10" />
          <Parent isRef="10" />
        </HeaderBand3>
        <HeaderJaneshin Ref="47" type="HeaderBand" isKey="true">
          <Brush>[191:191:191]</Brush>
          <ClientRectangle>0,6.7,7.72,0.3</ClientRectangle>
          <Components isList="true" count="6">
            <HeaderJaneshin_ToDatem Ref="48" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>0,0,1.3,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderJaneshin_ToDatem</Name>
              <Page isRef="10" />
              <Parent isRef="47" />
              <Text>تا تاریخ</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderJaneshin_ToDatem>
            <HeaderJaneshin_FromDatem Ref="49" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>1.3,0,1.3,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderJaneshin_FromDatem</Name>
              <Page isRef="10" />
              <Parent isRef="47" />
              <Text>از تاریخ</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderJaneshin_FromDatem>
            <HeaderJaneshin_MasterMng_Active Ref="50" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>2.6,0,0.5,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderJaneshin_MasterMng_Active</Name>
              <Page isRef="10" />
              <Parent isRef="47" />
              <Text>فعال</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderJaneshin_MasterMng_Active>
            <HeaderJaneshin_ManagerName Ref="51" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>3.1,0,1.7,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderJaneshin_ManagerName</Name>
              <Page isRef="10" />
              <Parent isRef="47" />
              <Text>نام مدیر</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderJaneshin_ManagerName>
            <HeaderJaneshin_ManagerBarcode Ref="52" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>4.8,0,1.2,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderJaneshin_ManagerBarcode</Name>
              <Page isRef="10" />
              <Parent isRef="47" />
              <Text>کد پرسنلی مدیر</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderJaneshin_ManagerBarcode>
            <Text13 Ref="53" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>6,0,1.7,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <Guid>396e40a09ad74116a6f423b07d653c8f</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text13</Name>
              <Page isRef="10" />
              <Parent isRef="47" />
              <Text>پست سازمانی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </Text13>
          </Components>
          <ComponentStyle>Style1</ComponentStyle>
          <Conditions isList="true" count="0" />
          <Name>HeaderJaneshin</Name>
          <Page isRef="10" />
          <Parent isRef="10" />
        </HeaderJaneshin>
        <DataJaneshin Ref="54" type="DataBand" isKey="true">
          <Brush>Transparent</Brush>
          <BusinessObjectGuid isNull="true" />
          <ClientRectangle>0,7.4,7.72,0.3</ClientRectangle>
          <Components isList="true" count="6">
            <DataJaneshin_ManagerBarcode Ref="55" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>4.8,0,1.2,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataJaneshin_ManagerBarcode</Name>
              <Page isRef="10" />
              <Parent isRef="54" />
              <Text>{Janeshin.ManagerBarcode}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </DataJaneshin_ManagerBarcode>
            <DataJaneshin_MasterMng_Active Ref="56" type="CheckBox" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <Checked>{Janeshin.MasterMng_Active}</Checked>
              <ClientRectangle>2.6,0,0.5,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <ContourColor>Black</ContourColor>
              <Name>DataJaneshin_MasterMng_Active</Name>
              <Page isRef="10" />
              <Parent isRef="54" />
              <TextBrush>Black</TextBrush>
            </DataJaneshin_MasterMng_Active>
            <DataJaneshin_FromDatem Ref="57" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>1.3,0,1.3,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataJaneshin_FromDatem</Name>
              <Page isRef="10" />
              <Parent isRef="54" />
              <Text>{Janeshin.FromDatem}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </DataJaneshin_FromDatem>
            <DataJaneshin_ToDatem Ref="58" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>0,0,1.3,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataJaneshin_ToDatem</Name>
              <Page isRef="10" />
              <Parent isRef="54" />
              <Text>{Janeshin.ToDatem}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </DataJaneshin_ToDatem>
            <DataJaneshin_ManagerName Ref="59" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>3.1,0,1.7,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataJaneshin_ManagerName</Name>
              <Page isRef="10" />
              <Parent isRef="54" />
              <Text>{Janeshin.ManagerName}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </DataJaneshin_ManagerName>
            <Text14 Ref="60" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>6,0,1.7,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <Guid>3b290536aa044f379be09f5c62c86ffb</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text14</Name>
              <Page isRef="10" />
              <Parent isRef="54" />
              <Text>{Janeshin.org}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>DataColumn</Type>
              <VertAlignment>Center</VertAlignment>
            </Text14>
          </Components>
          <Conditions isList="true" count="0" />
          <DataSourceName>Janeshin</DataSourceName>
          <EvenStyle>Even</EvenStyle>
          <Filters isList="true" count="0" />
          <Name>DataJaneshin</Name>
          <Page isRef="10" />
          <Parent isRef="10" />
          <Sort isList="true" count="0" />
        </DataJaneshin>
        <HeaderBand4 Ref="61" type="HeaderBand" isKey="true">
          <Brush>EmptyBrush</Brush>
          <ClientRectangle>0,8.1,7.72,0.4</ClientRectangle>
          <Components isList="true" count="1">
            <Text10 Ref="62" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>0,0.1,7.7,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,14.25,Bold,Point,False,0</Font>
              <Guid>9c8d43276b0047c7bcbd4624d67d73db</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text10</Name>
              <Page isRef="10" />
              <Parent isRef="61" />
              <Text>جانشینان این شخص</Text>
              <TextBrush>Black</TextBrush>
              <Type>Expression</Type>
            </Text10>
          </Components>
          <Conditions isList="true" count="0" />
          <Guid>cfae0cf6c5914d63853f9d2a5a809848</Guid>
          <Name>HeaderBand4</Name>
          <Page isRef="10" />
          <Parent isRef="10" />
        </HeaderBand4>
        <HeaderJaneshinan Ref="63" type="HeaderBand" isKey="true">
          <Brush>[191:191:191]</Brush>
          <ClientRectangle>0,8.9,7.72,0.3</ClientRectangle>
          <Components isList="true" count="4">
            <HeaderJaneshinan_ToDatem Ref="64" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>0,0,2,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderJaneshinan_ToDatem</Name>
              <Page isRef="10" />
              <Parent isRef="63" />
              <Text>تا تاریخ</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderJaneshinan_ToDatem>
            <HeaderJaneshinan_FromDatem Ref="65" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>2,0,1.9,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderJaneshinan_FromDatem</Name>
              <Page isRef="10" />
              <Parent isRef="63" />
              <Text>از تاریخ</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderJaneshinan_FromDatem>
            <HeaderJaneshinan_SubstituteBarcode Ref="66" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>5.8,0,1.9,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderJaneshinan_SubstituteBarcode</Name>
              <Page isRef="10" />
              <Parent isRef="63" />
              <Text>کد پرسنلی جانشین</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderJaneshinan_SubstituteBarcode>
            <HeaderJaneshinan_SubstituteName Ref="67" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>3.9,0,1.9,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderJaneshinan_SubstituteName</Name>
              <Page isRef="10" />
              <Parent isRef="63" />
              <Text>نام جانشین</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderJaneshinan_SubstituteName>
          </Components>
          <ComponentStyle>Style1</ComponentStyle>
          <Conditions isList="true" count="0" />
          <Name>HeaderJaneshinan</Name>
          <Page isRef="10" />
          <Parent isRef="10" />
        </HeaderJaneshinan>
        <DataJaneshinan Ref="68" type="DataBand" isKey="true">
          <Brush>Transparent</Brush>
          <BusinessObjectGuid isNull="true" />
          <ClientRectangle>0,9.6,7.72,0.3</ClientRectangle>
          <Components isList="true" count="4">
            <DataJaneshinan_SubstituteBarcode Ref="69" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>5.8,0,1.9,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataJaneshinan_SubstituteBarcode</Name>
              <Page isRef="10" />
              <Parent isRef="68" />
              <Text>{Janeshinan.SubstituteBarcode}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </DataJaneshinan_SubstituteBarcode>
            <DataJaneshinan_SubstituteName Ref="70" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>3.9,0,1.9,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataJaneshinan_SubstituteName</Name>
              <Page isRef="10" />
              <Parent isRef="68" />
              <Text>{Janeshinan.SubstituteName}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </DataJaneshinan_SubstituteName>
            <DataJaneshinan_FromDatem Ref="71" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>2,0,1.9,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataJaneshinan_FromDatem</Name>
              <Page isRef="10" />
              <Parent isRef="68" />
              <Text>{Janeshinan.FromDatem}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </DataJaneshinan_FromDatem>
            <DataJaneshinan_ToDatem Ref="72" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>0,0,2,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataJaneshinan_ToDatem</Name>
              <Page isRef="10" />
              <Parent isRef="68" />
              <Text>{Janeshinan.ToDatem}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </DataJaneshinan_ToDatem>
          </Components>
          <Conditions isList="true" count="0" />
          <DataSourceName>Janeshinan</DataSourceName>
          <EvenStyle>Even</EvenStyle>
          <Filters isList="true" count="0" />
          <Name>DataJaneshinan</Name>
          <Page isRef="10" />
          <Parent isRef="10" />
          <Sort isList="true" count="0" />
        </DataJaneshinan>
        <HeaderBand5 Ref="73" type="HeaderBand" isKey="true">
          <Brush>EmptyBrush</Brush>
          <ClientRectangle>0,10.3,7.72,0.4</ClientRectangle>
          <Components isList="true" count="1">
            <Text17 Ref="74" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>0,0.1,7.7,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,14.25,Bold,Point,False,0</Font>
              <Guid>a39a8c10cb06426f81663aa7379b205c</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>Text17</Name>
              <Page isRef="10" />
              <Parent isRef="73" />
              <Text>شخص اپراتور این جریان های کاری است</Text>
              <TextBrush>Black</TextBrush>
              <Type>Expression</Type>
            </Text17>
          </Components>
          <Conditions isList="true" count="0" />
          <Guid>ba717c5fb3204e108a9d1d4e12ca28a7</Guid>
          <Name>HeaderBand5</Name>
          <Page isRef="10" />
          <Parent isRef="10" />
        </HeaderBand5>
        <HeaderOperator Ref="75" type="HeaderBand" isKey="true">
          <Brush>[191:191:191]</Brush>
          <ClientRectangle>0,11.1,7.72,0.3</ClientRectangle>
          <Components isList="true" count="3">
            <HeaderOperator_accessGroupName Ref="76" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>1.2,0,3,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderOperator_accessGroupName</Name>
              <Page isRef="10" />
              <Parent isRef="75" />
              <Text>نام گروه دسترسی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderOperator_accessGroupName>
            <HeaderOperator_activeFlow Ref="77" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>0,0,1.2,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderOperator_activeFlow</Name>
              <Page isRef="10" />
              <Parent isRef="75" />
              <Text>فعال</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderOperator_activeFlow>
            <HeaderOperator_flowName Ref="78" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <ClientRectangle>4.2,0,3.5,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Bold,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>HeaderOperator_flowName</Name>
              <Page isRef="10" />
              <Parent isRef="75" />
              <Text>نام جریان کاری</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </HeaderOperator_flowName>
          </Components>
          <ComponentStyle>Style1</ComponentStyle>
          <Conditions isList="true" count="0" />
          <Name>HeaderOperator</Name>
          <Page isRef="10" />
          <Parent isRef="10" />
        </HeaderOperator>
        <DataOperator Ref="79" type="DataBand" isKey="true">
          <Brush>Transparent</Brush>
          <BusinessObjectGuid isNull="true" />
          <ClientRectangle>0,11.8,7.72,0.3</ClientRectangle>
          <Components isList="true" count="3">
            <DataOperator_accessGroupName Ref="80" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>1.2,0,3,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataOperator_accessGroupName</Name>
              <Page isRef="10" />
              <Parent isRef="79" />
              <Text>{Operator.accessGroupName}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </DataOperator_accessGroupName>
            <DataOperator_activeFlow Ref="81" type="CheckBox" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <Checked>{Operator.activeFlow}</Checked>
              <ClientRectangle>0,0,1.2,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <ContourColor>Black</ContourColor>
              <Name>DataOperator_activeFlow</Name>
              <Page isRef="10" />
              <Parent isRef="79" />
              <TextBrush>Black</TextBrush>
            </DataOperator_activeFlow>
            <DataOperator_flowName Ref="82" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>4.2,0,3.5,0.3</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,12,Regular,Point,False,0</Font>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>DataOperator_flowName</Name>
              <Page isRef="10" />
              <Parent isRef="79" />
              <Text>{Operator.flowName}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </DataOperator_flowName>
          </Components>
          <Conditions isList="true" count="0" />
          <DataSourceName>Operator</DataSourceName>
          <Filters isList="true" count="0" />
          <Name>DataOperator</Name>
          <Page isRef="10" />
          <Parent isRef="10" />
          <Sort isList="true" count="0" />
        </DataOperator>
      </Components>
      <Conditions isList="true" count="0" />
      <Guid>e8e7a72724b54ce99c1821ab43d00cc9</Guid>
      <Margins>0.39,0.39,0.39,0.39</Margins>
      <Name>Page1</Name>
      <PageHeight>13</PageHeight>
      <PageWidth>8.5</PageWidth>
      <PaperSize>Letter</PaperSize>
      <Report isRef="0" />
      <Watermark Ref="83" type="Stimulsoft.Report.Components.StiWatermark" isKey="true">
        <Font>Arial,100</Font>
        <TextBrush>[50:0:0:0]</TextBrush>
      </Watermark>
    </Page1>
  </Pages>
  <PrinterSettings Ref="84" type="Stimulsoft.Report.Print.StiPrinterSettings" isKey="true" />
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
  <ReportChanged>5/15/2013 4:50:24 PM</ReportChanged>
  <ReportCreated>2/4/2013 5:14:48 PM</ReportCreated>
  <ReportFile>E:\ManagerSubstituteReport\ManagerSubstituteReport2.mrt</ReportFile>
  <ReportGuid>6e454477d5b243109edb09c3948d2dc5</ReportGuid>
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
    <Master Ref="85" type="Stimulsoft.Report.StiStyle" isKey="true">
      <Brush>[247:181:128]</Brush>
      <Conditions isList="true" count="0" />
      <Description />
      <Font>Tahoma,14.25,Regular,Point,False,0</Font>
      <Name>Master</Name>
      <TextBrush>Black</TextBrush>
    </Master>
    <Even Ref="86" type="Stimulsoft.Report.StiStyle" isKey="true">
      <Brush>[250:206:170]</Brush>
      <Conditions isList="true" count="0" />
      <Description />
      <Font>Tahoma,14.25,Regular,Point,False,0</Font>
      <Name>Even</Name>
      <TextBrush>Black</TextBrush>
    </Even>
    <Style1 Ref="87" type="Stimulsoft.Report.StiStyle" isKey="true">
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
            (SELECT RptUIParameter_ID FROM TA_ReportUIParameter WHERE RptUIParameter_ActionId like N'PersonDateRange')
           ,'@value'
           ,(SELECT ReportFile_ID FROM TA_ReportFile WHERE ReportFile_Name = @ReportFile_Name)
           )

