﻿--set quoted_identifier on

declare @ReportFile_Name nvarchar(max)
declare @Report_Name nvarchar(max)
declare @ReportFile_File nvarchar(max)
declare @Report_RootName nvarchar(max)=N'درخواستها'
-------------------------------------------------------------------------------------------------------------
set @ReportFile_Name=N'R4343A900'
set @Report_Name=N'خلاصه کارکرد ماهیانه (بر حسب رنج)'
set @ReportFile_File=N'<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<StiSerializer version="1.02" type="Net" application="StiReport">
  <Dictionary Ref="1" type="Dictionary" isKey="true">
    <BusinessObjects isList="true" count="0" />
    <Databases isList="true" count="1">
      <Connection Ref="2" type="Stimulsoft.Report.Dictionary.StiSqlDatabase" isKey="true">
        <Alias>Connection</Alias>
        <ConnectionString>Password=123;Persist Security Info=True;Data Source=192.168.10.33\farhadsqlserver;Integrated Security=False;Initial Catalog=GTSOrginInstance;User ID=farhad</ConnectionString>
        <Name>Connection</Name>
      </Connection>
    </Databases>
    <DataSources isList="true" count="2">
      <MonthlyReport_MonthlyValue Ref="3" type="Stimulsoft.Report.Dictionary.StiSqlSource" isKey="true">
        <Alias>MonthlyReport_MonthlyValue</Alias>
        <Columns isList="true" count="36">
          <value>gridFields_ReserveField9,System.Decimal</value>
          <value>gridFields_ReserveField8,System.Decimal</value>
          <value>gridFields_ReserveField7,System.Decimal</value>
          <value>gridFields_ReserveField6,System.Decimal</value>
          <value>gridFields_ReserveField5,System.Decimal</value>
          <value>gridFields_ReserveField4,System.Decimal</value>
          <value>gridFields_ReserveField3,System.Decimal</value>
          <value>gridFields_ReserveField2,System.Decimal</value>
          <value>gridFields_ReserveField1,System.Decimal</value>
          <value>gridFields_DailyWithPayLeave,System.Decimal</value>
          <value>gridFields_HourlyWithPayLeave,System.Decimal</value>
          <value>gridFields_DailyWithoutPayLeave,System.Decimal</value>
          <value>gridFields_PresenceDuration,System.Decimal</value>
          <value>gridFields_HourlyWithoutPayLeave,System.Decimal</value>
          <value>gridFields_DailyMeritoriouslyLeave,System.Decimal</value>
          <value>gridFields_HourlyMeritoriouslyLeave,System.Decimal</value>
          <value>gridFields_DailySickLeave,System.Decimal</value>
          <value>gridFields_HourlySickLeave,System.Decimal</value>
          <value>gridFields_HostelryMission,System.Decimal</value>
          <value>gridFields_DailyMission,System.Decimal</value>
          <value>gridFields_HourlyMission,System.Decimal</value>
          <value>gridFields_DailyAbsence,System.Decimal</value>
          <value>gridFields_HourlyUnallowableAbsence,System.Decimal</value>
          <value>gridFields_HourlyAllowableAbsence,System.Decimal</value>
          <value>gridFields_ImpureOperation,System.Decimal</value>
          <value>gridFields_AllowableOverTime,System.Decimal</value>
          <value>gridFields_UnallowableOverTime,System.Decimal</value>
          <value>gridFields_NecessaryOperation,System.Decimal</value>
          <value>gridFields_HourlyPureOperation,System.Decimal</value>
          <value>gridFields_DailyPureOperation,System.Decimal</value>
          <value>ScndCnpValue_PersonId,System.Decimal</value>
          <value>Prs_FirstName,System.String</value>
          <value>Prs_LastName,System.String</value>
          <value>ScndCnpValue_PeriodicFromDate,System.DateTime</value>
          <value>ScndCnpValue_PeriodicToDate,System.DateTime</value>
          <value>Prs_BarCode,System.String</value>
        </Columns>
        <CommandTimeout>10000</CommandTimeout>
        <Dictionary isRef="1" />
        <Name>MonthlyReport_MonthlyValue</Name>
        <NameInSource>Connection</NameInSource>
        <Parameters isList="true" count="2">
          <value>fromDate,,4,0</value>
          <value>toDate,,4,0</value>
        </Parameters>
        <SqlCommand>
select d.ScndCnpValue_PersonId
	,(select prs_barcode from ta_person where prs_id=d.ScndCnpValue_PersonId) as Prs_BarCode
,(select prs_firstname from ta_person where prs_id=d.ScndCnpValue_PersonId) as Prs_FirstName
,(select prs_lastname from ta_person where prs_id=d.ScndCnpValue_PersonId) as Prs_LastName
,@fromDate as ScndCnpValue_PeriodicFromDate
,@toDate as ScndCnpValue_PeriodicToDate
	,sum([gridFields_ReserveField9]) as [gridFields_ReserveField9]
	,sum([gridFields_ReserveField8]) as [gridFields_ReserveField8]
	,sum([gridFields_ReserveField7]) as [gridFields_ReserveField7]
	,sum([gridFields_ReserveField6]) as [gridFields_ReserveField6]
	,sum([gridFields_ReserveField5]) as [gridFields_ReserveField5]
	,sum([gridFields_ReserveField4]) as [gridFields_ReserveField4]
	,sum([gridFields_ReserveField3]) as [gridFields_ReserveField3]
	,sum([gridFields_ReserveField2]) as [gridFields_ReserveField2]
	,sum([gridFields_ReserveField1]) as [gridFields_ReserveField1]
	,sum([gridFields_DailyWithPayLeave]) as [gridFields_DailyWithPayLeave]
	,sum([gridFields_HourlyWithPayLeave]) as [gridFields_HourlyWithPayLeave]
	,sum([gridFields_DailyWithoutPayLeave]) as [gridFields_DailyWithoutPayLeave]
	,sum([gridFields_PresenceDuration]) as [gridFields_PresenceDuration]
	,sum([gridFields_HourlyWithoutPayLeave]) as [gridFields_HourlyWithoutPayLeave]
	,sum([gridFields_DailyMeritoriouslyLeave]) as [gridFields_DailyMeritoriouslyLeave]
	,sum([gridFields_HourlyMeritoriouslyLeave]) as [gridFields_HourlyMeritoriouslyLeave]
	,sum([gridFields_DailySickLeave]) as [gridFields_DailySickLeave]
	,sum([gridFields_HourlySickLeave]) as [gridFields_HourlySickLeave]
	,sum([gridFields_HostelryMission]) as [gridFields_HostelryMission]
	,sum([gridFields_DailyMission]) as [gridFields_DailyMission]
	,sum([gridFields_HourlyMission]) as [gridFields_HourlyMission]
	,sum([gridFields_DailyAbsence]) as [gridFields_DailyAbsence]
	,sum([gridFields_HourlyUnallowableAbsence]) as [gridFields_HourlyUnallowableAbsence]
	,sum([gridFields_HourlyAllowableAbsence]) as [gridFields_HourlyAllowableAbsence]
	,sum([gridFields_ImpureOperation]) as [gridFields_ImpureOperation]
	,sum([gridFields_AllowableOverTime]) as [gridFields_AllowableOverTime]
	,sum([gridFields_UnallowableOverTime]) as [gridFields_UnallowableOverTime]
	,sum([gridFields_NecessaryOperation]) as [gridFields_NecessaryOperation]
	,sum([gridFields_HourlyPureOperation]) as [gridFields_HourlyPureOperation]
	,sum([gridFields_DailyPureOperation]) as [gridFields_DailyPureOperation]
from(
SELECT 
	[gridFields_ReserveField10]
	,[gridFields_ReserveField9]
	,[gridFields_ReserveField8]
	,[gridFields_ReserveField7]
	,[gridFields_ReserveField6]
	,[gridFields_ReserveField5]
	,[gridFields_ReserveField4]
	,[gridFields_ReserveField3]
	,[gridFields_ReserveField2]
	,[gridFields_ReserveField1]
	,[gridFields_DailyWithPayLeave]
	,[gridFields_HourlyWithPayLeave]
	,[gridFields_DailyWithoutPayLeave]
	,[gridFields_PresenceDuration]
	,[gridFields_HourlyWithoutPayLeave]
	,[gridFields_DailyMeritoriouslyLeave]
	,[gridFields_HourlyMeritoriouslyLeave]
	,[gridFields_DailySickLeave]
	,[gridFields_HourlySickLeave]
	,[gridFields_HostelryMission]
	,[gridFields_DailyMission]
	,[gridFields_HourlyMission]
	,[gridFields_DailyAbsence]
	,[gridFields_HourlyUnallowableAbsence]
	,[gridFields_HourlyAllowableAbsence]
	,[gridFields_ImpureOperation], [gridFields_AllowableOverTime], [gridFields_UnallowableOverTime]
	,[gridFields_NecessaryOperation], [gridFields_HourlyPureOperation], [gridFields_DailyPureOperation]
	,ThirdExit, ThirdEntrance
	,SecondExit, SecondEntrance
	,FirstExit, FirstEntrance 
	,[Date] 
	,dbo.GTS_ASM_MiladiToShamsi(CONVERT(nvarchar(10), [Date], 111)) AS ShamsiDate
	,ScndCnpValue_PersonId
	,dbo.GTS_ASM_MiladiToShamsi(CONVERT(nvarchar(10), @fromDate, 111)) AS frDT
	,dbo.GTS_ASM_MiladiToShamsi(CONVERT(nvarchar(10), @toDate, 111)) AS toDT
,(select prs_barcode from ta_person where prs_id=ScndCnpValue_PersonId) as prsBarcode
,(select prs_firstName+'' ''+prs_lastname from ta_person where prs_id=ScndCnpValue_PersonId) as prsName
	FROM (							        
SELECT Entrance.FirstEntrance, [Exit].FirstExit, 
	Entrance.SecondEntrance, [Exit].SecondExit,
	Entrance.ThirdEntrance, [Exit].ThirdExit,
	Entrance.ProceedTraffic_FromDate,
	Entrance.ProceedTraffic_PersonId	   	
FROM (SELECT ISNULL(SUM([1]), -1000) [FirstEntrance], 
			 ISNULL(SUM([2]), -1000) [SecondEntrance], 
			 ISNULL(SUM([3]), -1000) [ThirdEntrance], 
			 ProceedTraffic_FromDate, ProceedTraffic_PersonId
FROM (SELECT RANK() OVER (PARTITION BY ProceedTraffic_PersonId, ProceedTraffic_FromDate ORDER BY ProceedTrafficPair_From) Rk, *
			FROM TA_ProceedTraffic PrcTrf
			INNER JOIN TA_ProceedTrafficPair PrcTrfPair
			ON PrcTrf.ProceedTraffic_ID = PrcTrfPair.ProceedTrafficPair_ProceedTrafficId
WHERE PrcTrf.ProceedTraffic_PersonId IN ({ReportHelper.Instance().ModifiedIds()})
		   ) AS PrcTrf
	  PIVOT
		(SUM(ProceedTrafficPair_From)	  
		 FOR RK
			IN([1], [2], [3])
		) as pvt
	  GROUP BY ProceedTraffic_PersonId, ProceedTraffic_FromDate
	 ) Entrance
INNER JOIN (SELECT ISNULL(SUM([1]), -1000) [FirstExit], 
				   ISNULL(SUM([2]), -1000) [SecondExit], 
				   ISNULL(SUM([3]), -1000) [ThirdExit], 
				   ProceedTraffic_FromDate, ProceedTraffic_PersonId
FROM (SELECT RANK() OVER (PARTITION BY ProceedTraffic_PersonId, ProceedTraffic_FromDate ORDER BY ProceedTrafficPair_From) Rk, *
				  FROM TA_ProceedTraffic PrcTrf
				  INNER JOIN TA_ProceedTrafficPair PrcTrfPair
				  ON PrcTrf.ProceedTraffic_ID = PrcTrfPair.ProceedTrafficPair_ProceedTrafficId
WHERE PrcTrf.ProceedTraffic_PersonId IN ({ReportHelper.Instance().ModifiedIds()})	
				 ) AS PrcTrf
			PIVOT
				(SUM(ProceedTrafficPair_To)	  
				 FOR RK
					IN([1], [2], [3])
				) as pvt
			GROUP BY ProceedTraffic_PersonId, ProceedTraffic_FromDate
		   ) [Exit]
ON Entrance.ProceedTraffic_FromDate = [Exit].ProceedTraffic_FromDate
	AND
   Entrance.ProceedTraffic_PersonId = [Exit].ProceedTraffic_PersonId
	) PrcTraffic
RIGHT JOIN 
(
SELECT ScndCnpValue_PersonId
	,ScndCnpValue_FromDate [Date]
	  ,ISNULL(SUM([gridFields_NecessaryOperation]), 0) [gridFields_NecessaryOperation]
      ,ISNULL(SUM([gridFields_HourlyPureOperation]), 0) [gridFields_HourlyPureOperation]
      ,ISNULL(SUM([gridFields_DailyPureOperation]), 0) [gridFields_DailyPureOperation]
      ,ISNULL(SUM([gridFields_ImpureOperation]), 0) [gridFields_ImpureOperation]
      ,ISNULL(SUM([gridFields_AllowableOverTime]), 0) [gridFields_AllowableOverTime]
      ,ISNULL(SUM([gridFields_UnallowableOverTime]), 0) [gridFields_UnallowableOverTime]
      ,ISNULL(SUM([gridFields_HourlyAllowableAbsence]), 0) [gridFields_HourlyAllowableAbsence]
      ,ISNULL(SUM([gridFields_HourlyUnallowableAbsence]), 0) [gridFields_HourlyUnallowableAbsence]
      ,ISNULL(SUM([gridFields_DailyAbsence]), 0) [gridFields_DailyAbsence]
      ,ISNULL(SUM([gridFields_HourlyMission]), 0) [gridFields_HourlyMission]
      ,ISNULL(SUM([gridFields_DailyMission]), 0) [gridFields_DailyMission]
      ,ISNULL(SUM([gridFields_HostelryMission]), 0) [gridFields_HostelryMission]
      ,ISNULL(SUM([gridFields_HourlySickLeave]), 0) [gridFields_HourlySickLeave]
      ,ISNULL(SUM([gridFields_DailySickLeave]), 0) [gridFields_DailySickLeave]
      ,ISNULL(SUM([gridFields_HourlyMeritoriouslyLeave]), 0) [gridFields_HourlyMeritoriouslyLeave]
      ,ISNULL(SUM([gridFields_DailyMeritoriouslyLeave]), 0) [gridFields_DailyMeritoriouslyLeave]
      ,ISNULL(SUM([gridFields_HourlyWithoutPayLeave]), 0) [gridFields_HourlyWithoutPayLeave]
      ,ISNULL(SUM([gridFields_PresenceDuration]), 0) [gridFields_PresenceDuration]
      ,ISNULL(SUM([gridFields_DailyWithoutPayLeave]), 0) [gridFields_DailyWithoutPayLeave]
      ,ISNULL(SUM([gridFields_HourlyWithPayLeave]), 0) [gridFields_HourlyWithPayLeave]
      ,ISNULL(SUM([gridFields_DailyWithPayLeave]), 0) [gridFields_DailyWithPayLeave]
      ,ISNULL(SUM([gridFields_ReserveField1]), 0) [gridFields_ReserveField1]
      ,ISNULL(SUM([gridFields_ReserveField2]), 0) [gridFields_ReserveField2]
      ,ISNULL(SUM([gridFields_ReserveField3]), 0) [gridFields_ReserveField3]
      ,ISNULL(SUM([gridFields_ReserveField4]), 0) [gridFields_ReserveField4]
      ,ISNULL(SUM([gridFields_ReserveField5]), 0) [gridFields_ReserveField5]
      ,ISNULL(SUM([gridFields_ReserveField6]), 0) [gridFields_ReserveField6]
      ,ISNULL(SUM([gridFields_ReserveField7]), 0) [gridFields_ReserveField7]
      ,ISNULL(SUM([gridFields_ReserveField8]), 0) [gridFields_ReserveField8]
      ,ISNULL(SUM([gridFields_ReserveField9]), 0) [gridFields_ReserveField9]
      ,ISNULL(SUM([gridFields_ReserveField10]), 0) [gridFields_ReserveField10]
FROM (SELECT [No],
	ScndCnpValues.ScndCnpValue_ID,
	CnpTmp.ConceptTmp_FnName,
	CnpTmp.ConceptTmp_EngName,
	CnpTmp.ConceptTmp_KeyColumnName,
	PeriodicCnpValue.ScndCnpValue_PeriodicFromDate,
	PeriodicCnpValue.ScndCnpValue_PeriodicToDate,
	PeriodicCnpValue.ScndCnpValue_PersonId,
	ScndCnpValues.ScndCnpValue_FromDate,
	ScndCnpValues.ScndCnpValue_ToDate,
	ScndCnpValues.ScndCnpValue_Value
	FROM (SELECT [No],
	PrdCnpTmpDetail_DtlCnpTmpId AS ScndCnpValue_DailyScndCnpId,
	PeriodicCnp_KeyColumnName   AS ScndCnpValue_KeyColumnName,     
	PeriodicCnp_FromDate		   AS ScndCnpValue_PeriodicFromDate,	   
	PeriodicCnp_ToDate		   AS ScndCnpValue_PeriodicToDate,
	PeriodicCnp_CnpTmpId		   AS ScndCnpValue_PeriodicScndCnpId, 
	PeriodicCnp_PersonId		   AS ScndCnpValue_PersonId
	FROM dbo.TA_PeriodicCnpTmpDetail 
INNER JOIN(SELECT PrsRangeAsg.[No],
	CalcDateRange_ID					 AS PeriodicCnp_ID,
	PrsRangeAsg.PrsRangeAsg_PersonId	 AS PeriodicCnp_PersonId, 
	CalcDateRange_ConceptTmpId		 AS PeriodicCnp_CnpTmpId, 
	Concept.ConceptTmp_FnName 		 AS PeriodicCnp_KeyColumnName, 
	--dbo.TA_ASM_CalculateFromDateRange(@toDate, CalcDateRange_Order, CalcDateRange_FromMonth, CalcDateRange_FromDay, CalcDateRange_ToMonth, CalcDateRange_ToDay, CalcRangeGroup_UsedCalendar)
	@fromDate
																 AS PeriodicCnp_FromDate,
	--dbo.TA_ASM_CalculateToDateRange(@toDate, CalcDateRange_Order, CalcDateRange_FromMonth, CalcDateRange_FromDay, CalcDateRange_ToMonth, CalcDateRange_ToDay, CalcRangeGroup_UsedCalendar)
																 @toDate
																 AS PeriodicCnp_ToDate
FROM (SELECT * 
	FROM dbo.TA_CalculationDateRange 
	WHERE CalcDateRange_Order = 1
						    ) AS CalcDateRng
INNER JOIN (SELECT * 
	FROM dbo.TA_ConceptTemplate 
	WHERE ConceptTmp_IsPeriodic = 1
								  ) AS Concept
						ON CalcDateRange_ConceptTmpId = Concept.ConceptTmp_ID		  
INNER JOIN (SELECT *
	FROM (SELECT ROW_NUMBER() OVER (PARTITION BY PrsRangeAsg_PersonId ORDER BY PrsRangeAsg_FromDate DESC) AS [No], 
    										 PrsRangeAsg_PersonId, PrsRangeAsg_CalcRangeGrpId
										  FROM TA_PersonRangeAssignment								 
										  WHERE PrsRangeAsg_FromDate &lt;= @toDate
												  AND 
PrsRangeAsg_PersonId IN ({ReportHelper.Instance().ModifiedIds()})
										 ) AS [Range]
									WHERE [Range].[No] = 1
								   ) AS PrsRangeAsg
						ON CalcDateRange_CalcRangeGrpId = PrsRangeAsg.PrsRangeAsg_CalcRangeGrpId
						INNER JOIN TA_CalculationRangeGroup
						ON CalcDateRange_CalcRangeGrpId = CalcRangeGroup_ID
						WHERE ConceptTmp_KeyColumnName IS NOT NULL
								AND
							  Len(ConceptTmp_KeyColumnName) &lt;&gt; 0              
		              ) AS PeriodicCnp		
	        ON PrdCnpTmpDetail_PrdCnpTmpId = PeriodicCnp.PeriodicCnp_CnpTmpId
		   ) AS PeriodicCnpValue     
	 INNER JOIN TA_ConceptTemplate CnpTmp
	 ON CnpTmp.ConceptTmp_ID = PeriodicCnpValue.ScndCnpValue_DailyScndCnpId
	 CROSS APPLY dbo.TA_GetScndCnpValues(PeriodicCnpValue.ScndCnpValue_PersonId,
										 PeriodicCnpValue.ScndCnpValue_DailyScndCnpId,
										 PeriodicCnpValue.ScndCnpValue_PeriodicFromDate,
										 PeriodicCnpValue.ScndCnpValue_PeriodicToDate) AS  ScndCnpValues 							        
	) AS [Source]		
PIVOT
(
	SUM(ScndCnpValue_Value)
	FOR ConceptTmp_KeyColumnName
		IN ([gridFields_NecessaryOperation]
			  ,[gridFields_HourlyPureOperation]
			  ,[gridFields_DailyPureOperation]
			  ,[gridFields_ImpureOperation]
			  ,[gridFields_AllowableOverTime]
			  ,[gridFields_UnallowableOverTime]
			  ,[gridFields_HourlyAllowableAbsence]
			  ,[gridFields_HourlyUnallowableAbsence]
			  ,[gridFields_DailyAbsence]
			  ,[gridFields_HourlyMission]
			  ,[gridFields_DailyMission]
			  ,[gridFields_HostelryMission]
			  ,[gridFields_HourlySickLeave]
			  ,[gridFields_DailySickLeave]
			  ,[gridFields_HourlyMeritoriouslyLeave]
			  ,[gridFields_DailyMeritoriouslyLeave]
			  ,[gridFields_HourlyWithoutPayLeave]
			  ,[gridFields_PresenceDuration]
			  ,[gridFields_DailyWithoutPayLeave]
			  ,[gridFields_HourlyWithPayLeave]
			  ,[gridFields_DailyWithPayLeave]
			  ,[gridFields_ReserveField1]
			  ,[gridFields_ReserveField2]
			  ,[gridFields_ReserveField3]
			  ,[gridFields_ReserveField4]
			  ,[gridFields_ReserveField5]
			  ,[gridFields_ReserveField6]
			  ,[gridFields_ReserveField7]
			  ,[gridFields_ReserveField8]
			  ,[gridFields_ReserveField9]
			  ,[gridFields_ReserveField10])
) AS Result			
GROUP BY ScndCnpValue_PersonId, ScndCnpValue_FromDate 
) ScndCnpValue
ON PrcTraffic.ProceedTraffic_FromDate = ScndCnpValue.Date
	AND	
   PrcTraffic.ProceedTraffic_PersonId = ScndCnpValue.ScndCnpValue_PersonId
--ORDER BY ShamsiDate
) as d
group by d.ScndCnpValue_PersonId</SqlCommand>
      </MonthlyReport_MonthlyValue>
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
    <pgeReport Ref="5" type="Page" isKey="true">
      <Border>None;Black;2;Solid;False;4;Black</Border>
      <Brush>Transparent</Brush>
      <Components isList="true" count="4">
        <phbMain Ref="6" type="PageHeaderBand" isKey="true">
          <Brush>Transparent</Brush>
          <ClientRectangle>0,0.4,28.7,2</ClientRectangle>
          <Components isList="true" count="9">
            <txtOrgDefName Ref="7" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>6.2,0,12.2,1.8</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,24,Bold</Font>
              <Guid>c1e7b68399f34ef1b8f89fde7da3521a</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtOrgDefName</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>{nameOrg.OrgDef_Name}
خلاصه گزارش کارکرد ماهیانه</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
            </txtOrgDefName>
            <txtFromDate Ref="8" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>26.8,1.2,1.4,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>5276b924f8bf455c990b7b8e41372eaa</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtFromDate</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>: از تاریخ 
</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </txtFromDate>
            <txtPeriodicFromDate Ref="9" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>24.4,1.2,2.4,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>5676fa21050a4dd8bdbc653202cbebe2</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtPeriodicFromDate</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>{ReportHelper.Instance().MiladiToShamsi(MonthlyReport_MonthlyValue.ScndCnpValue_PeriodicFromDate)}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </txtPeriodicFromDate>
            <txtToDate Ref="10" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>22,1.2,1.4,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>2e1fe8291046465381b77faa69a0ba25</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtToDate</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>: تا تاریخ</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </txtToDate>
            <txtPeriodicToDate Ref="11" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>19.8,1.2,2.2,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>8b230f6d452043f3a2e72a075bace763</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtPeriodicToDate</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>{ReportHelper.Instance().MiladiToShamsi(MonthlyReport_MonthlyValue.ScndCnpValue_PeriodicToDate)}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </txtPeriodicToDate>
            <txtReportDate Ref="12" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>2.4,0,2.6,0.6</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>50c930666be5494f83c1073efeadae1a</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtReportDate</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>: تاریخ تهیه گزارش</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </txtReportDate>
            <txtReporter Ref="13" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>3,0.6,2,0.6</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>257c3e8fba274d6f8a4ebe0812202ca6</Guid>
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
            <txtShamsiGetNow Ref="14" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>0,0,2.4,0.6</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>43e19e8e13fc493b9b95f87511f84432</Guid>
              <Margins>0,0,0,0</Margins>
              <Name>txtShamsiGetNow</Name>
              <Page isRef="5" />
              <Parent isRef="6" />
              <Text>{ReportHelper.Instance().ShamsiGetNow()}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </txtShamsiGetNow>
            <txtUserName Ref="15" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>0,0.6,3,0.6</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>7aa38193d7564f29b84eaf088295b252</Guid>
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
          <Name>phbMain</Name>
          <Page isRef="5" />
          <Parent isRef="5" />
        </phbMain>
        <pfbMain Ref="16" type="PageFooterBand" isKey="true">
          <Brush>Transparent</Brush>
          <ClientRectangle>0,19.4,28.7,0.6</ClientRectangle>
          <Components isList="true" count="0" />
          <Conditions isList="true" count="0" />
          <Name>pfbMain</Name>
          <Page isRef="5" />
          <Parent isRef="5" />
        </pfbMain>
        <hdrMain Ref="17" type="HeaderBand" isKey="true">
          <Border>AdvBlack;1;Solid;Black;1;Solid;Black;1;Solid;Black;1;Solid;False;4;Black</Border>
          <Brush>Gainsboro</Brush>
          <ClientRectangle>0,3.2,28.7,1</ClientRectangle>
          <Components isList="true" count="22">
            <htDailyWithoutPayLeave Ref="18" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>0,0,1.2,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>48a29fa1ba1a479d84cac1a972ec0042</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htDailyWithoutPayLeave</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>م بی حقوق روزانه</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htDailyWithoutPayLeave>
            <htPresenceDuration Ref="19" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>18.5,0,1,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>ddee542b83a54c5ebe9f147506aa14b9</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htPresenceDuration</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>حضور کاری</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htPresenceDuration>
            <htHourlyWithoutPayLeave Ref="20" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>1.2,0,1,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>2890348892914c02a997980569f065e2</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htHourlyWithoutPayLeave</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>مرخصی بی حقوق ساعتی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htHourlyWithoutPayLeave>
            <htDailyMeritoriouslyLeave Ref="21" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>2.2,0,1,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>c2dcacb4ec0a4bec9e6261426042c908</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htDailyMeritoriouslyLeave</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>مرخصی استحقاقی روزانه</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htDailyMeritoriouslyLeave>
            <htHourlyMeritoriouslyLeave Ref="22" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>3.2,0,1.2,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>3a4a712f81b74ae6857566a132afca0c</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htHourlyMeritoriouslyLeave</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>مرخصی استحقاقی ساعتی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htHourlyMeritoriouslyLeave>
            <htDailySickLeave Ref="23" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>4.4,0,1,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>6975f70778114680a216e80ecf866c51</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htDailySickLeave</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>مرخصی استعلاجی روزانه</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htDailySickLeave>
            <htHourlySickLeave Ref="24" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>5.4,0,1.2,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>18aaa45d127647b3ae75dd7e3020d147</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htHourlySickLeave</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>مرخصی استعلاجی ساعتی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htHourlySickLeave>
            <htHostelryMission Ref="25" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>6.6,0,1,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>f0375774a9fc4e2eb7236eb6b85ae282</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htHostelryMission</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>ماموریت شبانه روزی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htHostelryMission>
            <htDailyMission Ref="26" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>7.6,0,1,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>eea07d3effaf4e7ebe27156c3d39c943</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htDailyMission</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>ماموریت روزانه</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htDailyMission>
            <htHourlyMission Ref="27" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>8.6,0,1.2,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>12b0adf22b1a4bc0a9754390ad1e53bb</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htHourlyMission</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>ماموریت ساعتی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htHourlyMission>
            <htDailyAbsence Ref="28" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>9.8,0,1,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>bd8eaf738f394402b996a694fed5d5bd</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htDailyAbsence</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>غیبت غیرمجاز روزانه</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htDailyAbsence>
            <htHourlyUnallowableAbsence Ref="29" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>10.8,0,1.2,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>0040d651e7cc4b9db15ff102ca08fa78</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htHourlyUnallowableAbsence</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>غیبت غیر مجاز ساعتی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htHourlyUnallowableAbsence>
            <htHourlyAllowableAbsence Ref="30" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>12,0,1.2,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>0ffa421ae008417d9c16176c5b658c35</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htHourlyAllowableAbsence</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>غیبت مجاز ساعتی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htHourlyAllowableAbsence>
            <htImpureOperation Ref="31" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>15.3,0,1,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>3b884945e9cb437e8a65073c2d2f884c</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htImpureOperation</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>کارکرد ناخالص ساعتی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htImpureOperation>
            <htAllowableOverTime Ref="32" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>14.3,0,1,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>5c83ac8735474eb39720788d9fba28d7</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htAllowableOverTime</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>اضافه کار مجاز</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htAllowableOverTime>
            <htUnallowableOverTime Ref="33" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>13.2,0,1.1,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>d87534b076bc431ca3edd750f72b4f9f</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htUnallowableOverTime</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>اضافه کار غیرمجاز</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htUnallowableOverTime>
            <htHourlyPureOperation Ref="34" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>17.1,0,1.4,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>a42aaad179bf4d0894f2694ed9a2531f</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htHourlyPureOperation</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>کارکرد خالص ساعتی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htHourlyPureOperation>
            <htDailyPureOperation Ref="35" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>16.3,0,0.8,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>8d12f8d1a42b4e7e818e4889053e1ff1</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htDailyPureOperation</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>کارکرد خالص روزانه</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htDailyPureOperation>
            <htNecessaryOperation Ref="36" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>19.5,0,1.1,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>6d29f9cef96548f686b038b0e34e243f</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htNecessaryOperation</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>کارکرد لازم</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htNecessaryOperation>
            <htPrsBarCode Ref="37" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>24.2,0,3.1,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>a0ee2f5a9d0549d189da6b0526ae6689</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htPrsBarCode</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>شماره پرسنلی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </htPrsBarCode>
            <htName Ref="38" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>20.6,0,3.6,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>3890585234f0491ba538d918a78bcb25</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htName</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>نام و نام خانوادگی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </htName>
            <htLine Ref="39" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>27.2,0,1.5,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>380e41f009b64071bb027b1dbc015a85</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htLine</Name>
              <Page isRef="5" />
              <Parent isRef="17" />
              <Text>ردیف</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </htLine>
          </Components>
          <Conditions isList="true" count="0" />
          <Guid>4cc69102fe74471bb68b734711459a11</Guid>
          <Name>hdrMain</Name>
          <Page isRef="5" />
          <Parent isRef="5" />
          <ToolTip>erwr</ToolTip>
        </hdrMain>
        <dbMain Ref="40" type="DataBand" isKey="true">
          <Border>All;Black;1;Solid;False;4;Black</Border>
          <Brush>Transparent</Brush>
          <BusinessObjectGuid isNull="true" />
          <ClientRectangle>0,5,28.7,0.5</ClientRectangle>
          <ColumnDirection>DownThenAcross</ColumnDirection>
          <Components isList="true" count="22">
            <dtHourlyWithoutPayLeave Ref="41" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>1.2,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>b9823b582ebe465fbcdce3dfa12e27b8</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtHourlyWithoutPayLeave</Name>
              <Page isRef="5" />
              <Parent isRef="40" />
              <Text>{ReportHelper.Instance().IntTimeToTime(MonthlyReport_MonthlyValue.gridFields_HourlyWithoutPayLeave)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtHourlyWithoutPayLeave>
            <dtDailyMeritoriouslyLeave Ref="42" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>2.2,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>76ce9fdfa01140a2950335cb89a822df</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtDailyMeritoriouslyLeave</Name>
              <Page isRef="5" />
              <Parent isRef="40" />
              <Text>{ReportHelper.Instance().FixedDailyValue(MonthlyReport_MonthlyValue.gridFields_DailyMeritoriouslyLeave)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtDailyMeritoriouslyLeave>
            <dtHourlyMeritoriouslyLeave Ref="43" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>3.2,0,1.2,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>c39d5d672c4a4031beb753529b422463</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtHourlyMeritoriouslyLeave</Name>
              <Page isRef="5" />
              <Parent isRef="40" />
              <Text>{ReportHelper.Instance().IntTimeToTime(MonthlyReport_MonthlyValue.gridFields_HourlyMeritoriouslyLeave)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtHourlyMeritoriouslyLeave>
            <dtDailySickLeave Ref="44" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>4.4,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>f86e5df0518f45a890b51e271143f3df</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtDailySickLeave</Name>
              <Page isRef="5" />
              <Parent isRef="40" />
              <Text>{ReportHelper.Instance().FixedDailyValue(MonthlyReport_MonthlyValue.gridFields_DailySickLeave)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtDailySickLeave>
            <dtHourlySickLeave Ref="45" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>5.4,0,1.2,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>c5b30087efa4424bb7dfcae5c24680d1</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtHourlySickLeave</Name>
              <Page isRef="5" />
              <Parent isRef="40" />
              <Text>{ReportHelper.Instance().IntTimeToTime(MonthlyReport_MonthlyValue.gridFields_HourlySickLeave)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtHourlySickLeave>
            <dtHostelryMission Ref="46" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>6.6,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>aed7aa0204c1422bacbc49ee84a63bc4</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtHostelryMission</Name>
              <Page isRef="5" />
              <Parent isRef="40" />
              <Text>{ReportHelper.Instance().FixedDailyValue(MonthlyReport_MonthlyValue.gridFields_HostelryMission)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtHostelryMission>
            <dtDailyMission Ref="47" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>7.6,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>3120703d63494635a2ec7db76e7d692e</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtDailyMission</Name>
              <Page isRef="5" />
              <Parent isRef="40" />
              <Text>{ReportHelper.Instance().FixedDailyValue(MonthlyReport_MonthlyValue.gridFields_DailyMission)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtDailyMission>
            <dtHourlyMission Ref="48" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>8.6,0,1.2,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>045142ad75c14bb0b7c546a36889c99f</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtHourlyMission</Name>
              <Page isRef="5" />
              <Parent isRef="40" />
              <Text>{ReportHelper.Instance().IntTimeToTime(MonthlyReport_MonthlyValue.gridFields_HourlyMission)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtHourlyMission>
            <dtDailyAbsence Ref="49" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>9.8,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>2863659399f84353ac1b9f0f6845deb3</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtDailyAbsence</Name>
              <Page isRef="5" />
              <Parent isRef="40" />
              <Text>{ReportHelper.Instance().FixedDailyValue(MonthlyReport_MonthlyValue.gridFields_DailyAbsence)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtDailyAbsence>
            <dtHourlyUnallowableAbsence Ref="50" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>10.8,0,1.2,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>34a18fe7d03f4228a717aa51b4bf5f06</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtHourlyUnallowableAbsence</Name>
              <Page isRef="5" />
              <Parent isRef="40" />
              <Text>{ReportHelper.Instance().IntTimeToTime(MonthlyReport_MonthlyValue.gridFields_HourlyUnallowableAbsence)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtHourlyUnallowableAbsence>
            <dtHourlyAllowableAbsence Ref="51" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>12,0,1.2,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>7b48f3e03f714103bcfa67c4417cbdd1</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtHourlyAllowableAbsence</Name>
              <Page isRef="5" />
              <Parent isRef="40" />
              <Text>{ReportHelper.Instance().IntTimeToTime(MonthlyReport_MonthlyValue.gridFields_HourlyAllowableAbsence)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtHourlyAllowableAbsence>
            <dtImpureOperation Ref="52" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>15.3,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>57cc86b5598e40dc82197a27ed7000ef</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtImpureOperation</Name>
              <Page isRef="5" />
              <Parent isRef="40" />
              <Text>{ReportHelper.Instance().IntTimeToTime(MonthlyReport_MonthlyValue.gridFields_ImpureOperation)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtImpureOperation>
            <dtAllowableOverTime Ref="53" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>14.3,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>ee1d45f4103b4c368d082cb020ceab1b</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtAllowableOverTime</Name>
              <Page isRef="5" />
              <Parent isRef="40" />
              <Text>{ReportHelper.Instance().IntTimeToTime(MonthlyReport_MonthlyValue.gridFields_AllowableOverTime)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtAllowableOverTime>
            <dtUnallowableOverTime Ref="54" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>13.2,0,1.1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>6cf08f857af049bbb649727433390296</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtUnallowableOverTime</Name>
              <Page isRef="5" />
              <Parent isRef="40" />
              <Text>{ReportHelper.Instance().IntTimeToTime(MonthlyReport_MonthlyValue.gridFields_UnallowableOverTime)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtUnallowableOverTime>
            <dtNecessaryOperation Ref="55" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>19.5,0,1.1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>0f6a5c50dfbb440cbbe20209f96e1161</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtNecessaryOperation</Name>
              <Page isRef="5" />
              <Parent isRef="40" />
              <Text>{ReportHelper.Instance().IntTimeToTime(MonthlyReport_MonthlyValue.gridFields_NecessaryOperation)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtNecessaryOperation>
            <dtPresenceDuration Ref="56" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>18.5,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>2c262e1c176242cda221ed30ffbbb57a</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtPresenceDuration</Name>
              <Page isRef="5" />
              <Parent isRef="40" />
              <Text>{ReportHelper.Instance().IntTimeToTime(MonthlyReport_MonthlyValue.gridFields_PresenceDuration)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtPresenceDuration>
            <dtHourlyPureOperation Ref="57" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>17.1,0,1.4,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>035d600d66294707adc8a4453dcc7f58</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtHourlyPureOperation</Name>
              <Page isRef="5" />
              <Parent isRef="40" />
              <Text>{ReportHelper.Instance().IntTimeToTime(MonthlyReport_MonthlyValue.gridFields_HourlyPureOperation)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtHourlyPureOperation>
            <dtDailyPureOperation Ref="58" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>16.3,0,0.8,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>30d0dadc4e0845048bbf3d33e37288c2</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtDailyPureOperation</Name>
              <Page isRef="5" />
              <Parent isRef="40" />
              <Text>{ReportHelper.Instance().FixedDailyValue(MonthlyReport_MonthlyValue.gridFields_DailyPureOperation)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtDailyPureOperation>
            <dtName Ref="59" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>20.6,0,3.6,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8</Font>
              <Guid>8e43b5f4f7f546bc94f4536177192d86</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtName</Name>
              <Page isRef="5" />
              <Parent isRef="40" />
              <Text>{MonthlyReport_MonthlyValue.Prs_FirstName + " " + MonthlyReport_MonthlyValue.Prs_LastName} </Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </dtName>
            <dtPrsBarCode Ref="60" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>24.2,0,3.1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>a1abb304a7cc4a9fac7c72c8e84351db</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtPrsBarCode</Name>
              <Page isRef="5" />
              <Parent isRef="40" />
              <Text>{MonthlyReport_MonthlyValue.Prs_BarCode}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </dtPrsBarCode>
            <dtLine Ref="61" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>27.2,0,1.5,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8.25,Bold,Point,False,0</Font>
              <Guid>4998e836d11446589a3cbf83630a89da</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtLine</Name>
              <Page isRef="5" />
              <Parent isRef="40" />
              <Text>{Line}</Text>
              <TextBrush>[144:60:57]</TextBrush>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </dtLine>
            <dtDailyWithoutPayLeave Ref="62" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>0,0,1.2,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>c547426b63f44f34aa148d261e04cef6</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtDailyWithoutPayLeave</Name>
              <Page isRef="5" />
              <Parent isRef="40" />
              <Text>{ReportHelper.Instance().FixedDailyValue(MonthlyReport_MonthlyValue.gridFields_DailyWithoutPayLeave)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtDailyWithoutPayLeave>
          </Components>
          <Conditions isList="true" count="1">
            <value>_x007B_Line_x0025_2_x003D__x003D_0_x007D_,Red,PeachPuff,Arial_x002C_8,True,False,,,None</value>
          </Conditions>
          <DataRelationName isNull="true" />
          <DataSourceName>MonthlyReport_MonthlyValue</DataSourceName>
          <Filters isList="true" count="0" />
          <KeepChildTogether>True</KeepChildTogether>
          <KeepDetailsTogether>True</KeepDetailsTogether>
          <MinRowsInColumn>25</MinRowsInColumn>
          <Name>dbMain</Name>
          <Page isRef="5" />
          <Parent isRef="5" />
          <Sort isList="true" count="2">
            <value>ASC</value>
            <value>Prs_BarCode</value>
          </Sort>
        </dbMain>
      </Components>
      <Conditions isList="true" count="0" />
      <Guid>4312ae8a09374b55a344f00f7cb85b2f</Guid>
      <Margins>0.5,0.5,0.5,0.5</Margins>
      <Name>pgeReport</Name>
      <Orientation>Landscape</Orientation>
      <PageHeight>21</PageHeight>
      <PageWidth>29.7</PageWidth>
      <PaperSize>Statement</PaperSize>
      <Report isRef="0" />
      <RightToLeft>True</RightToLeft>
      <Watermark Ref="63" type="Stimulsoft.Report.Components.StiWatermark" isKey="true">
        <Font>Arial,100</Font>
        <TextBrush>[50:0:0:0]</TextBrush>
      </Watermark>
    </pgeReport>
  </Pages>
  <PrinterSettings Ref="64" type="Stimulsoft.Report.Print.StiPrinterSettings" isKey="true" />
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
  <ReportAlias>rptSummuryMonthlyReport</ReportAlias>
  <ReportChanged>6/16/2013 12:06:41 PM</ReportChanged>
  <ReportCreated>11/6/2011 9:01:08 AM</ReportCreated>
  <ReportFile>E:\New folder (3)\SummaryMonthlyReport(FromTo).mrt</ReportFile>
  <ReportGuid>9af68e351e7648f6a3c4c235d2fc202c</ReportGuid>
  <ReportName>rptSummuryMonthlyReport</ReportName>
  <ReportUnit>Centimeters</ReportUnit>
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
    
    public class rptSummuryMonthlyReport : Stimulsoft.Report.StiReport
    {
        
        public rptSummuryMonthlyReport()
        {
            this.InitializeComponent();
        }
        #region StiReport Designer generated code - do not modify#endregion StiReport Designer generated code - do not modify
    }
}
</Script>
  <ScriptLanguage>CSharp</ScriptLanguage>
  <Styles isList="true" count="3">
    <Master Ref="65" type="Stimulsoft.Report.StiStyle" isKey="true">
      <Brush>NavajoWhite</Brush>
      <Conditions isList="true" count="0" />
      <Description />
      <Font>Arial,8</Font>
      <Name>Master</Name>
      <TextBrush>Black</TextBrush>
    </Master>
    <EventStyle Ref="66" type="Stimulsoft.Report.StiStyle" isKey="true">
      <Brush>AntiqueWhite</Brush>
      <Conditions isList="true" count="0" />
      <Description />
      <Font>Arial,8</Font>
      <Name>EventStyle</Name>
      <TextBrush>Black</TextBrush>
    </EventStyle>
    <Style1 Ref="67" type="Stimulsoft.Report.StiStyle" isKey="true">
      <Brush>Transparent</Brush>
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
