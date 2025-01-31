﻿--set quoted_identifier on

declare @ReportFile_Name nvarchar(max)
declare @Report_Name nvarchar(max)
declare @ReportFile_File nvarchar(max)
declare @Report_RootName nvarchar(max)=N'درخواستها'
-------------------------------------------------------------------------------------------------------------
set @ReportFile_Name=N'R4343A800'
set @Report_Name=N'کارکرد ماهیانه (بر مبنای رنج)'
set @ReportFile_File=N'<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<StiSerializer version="1.02" type="Net" application="StiReport">
  <Dictionary Ref="1" type="Dictionary" isKey="true">
    <BusinessObjects isList="true" count="0" />
    <Databases isList="true" count="1">
      <Connection Ref="2" type="Stimulsoft.Report.Dictionary.StiSqlDatabase" isKey="true">
        <Alias>Connection</Alias>
        <ConnectionString>Password=salta123;Persist Security Info=True;Data Source=192.168.10.4;Integrated Security=False;Initial Catalog=GhadirGTS2;User ID=atlas</ConnectionString>
        <Name>Connection</Name>
      </Connection>
    </Databases>
    <DataSources isList="true" count="3">
      <MonthlyReport_DailyValue Ref="3" type="Stimulsoft.Report.Dictionary.StiSqlSource" isKey="true">
        <Alias>MonthlyReport_DailyValue</Alias>
        <Columns isList="true" count="44">
          <value>gridFields_ReserveField10,System.Decimal</value>
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
          <value>ThirdExit,System.Int32</value>
          <value>ThirdEntrance,System.Int32</value>
          <value>SecondExit,System.Int32</value>
          <value>SecondEntrance,System.Int32</value>
          <value>FirstExit,System.Int32</value>
          <value>FirstEntrance,System.Int32</value>
          <value>ShamsiDate,System.String</value>
          <value>Date,System.DateTime</value>
          <value>ScndCnpValue_PersonId,System.Decimal</value>
          <value>frDT,System.String</value>
          <value>toDT,System.String</value>
          <value>prsBarcode,System.String</value>
          <value>prsName,System.String</value>
        </Columns>
        <CommandTimeout>30</CommandTimeout>
        <Dictionary isRef="1" />
        <Name>MonthlyReport_DailyValue</Name>
        <NameInSource>Connection</NameInSource>
        <Parameters isList="true" count="2">
          <value>fromDate,,4,0</value>
          <value>toDate,,4,0</value>
        </Parameters>
        <SqlCommand>SELECT 
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
ORDER BY ShamsiDate</SqlCommand>
      </MonthlyReport_DailyValue>
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
      <MonthlyReport_MonthlyValue Ref="5" type="Stimulsoft.Report.Dictionary.StiSqlSource" isKey="true">
        <Alias>MonthlyReport_MonthlyValue</Alias>
        <Columns isList="true" count="32">
          <value>ScndCnpValue_PersonId,System.Decimal</value>
          <value>gridFields_ReserveField10,System.Decimal</value>
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
        </Columns>
        <CommandTimeout>30</CommandTimeout>
        <Dictionary isRef="1" />
        <Name>MonthlyReport_MonthlyValue</Name>
        <NameInSource>Connection</NameInSource>
        <Parameters isList="true" count="2">
          <value>fromDate,,4,0</value>
          <value>toDate,,4,0</value>
        </Parameters>
        <SqlCommand>select d.ScndCnpValue_PersonId
	,sum([gridFields_ReserveField10]) as [gridFields_ReserveField10]
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
    </DataSources>
    <Relations isList="true" count="0" />
    <Report isRef="0" />
    <Variables isList="true" count="0" />
  </Dictionary>
  <EngineVersion>EngineV2</EngineVersion>
  <GlobalizationStrings isList="true" count="0" />
  <MetaTags isList="true" count="0" />
  <Pages isList="true" count="1">
    <pgeReport Ref="6" type="Page" isKey="true">
      <Border>None;Black;2;Solid;False;4;Black</Border>
      <Brush>Transparent</Brush>
      <Components isList="true" count="5">
        <phbMain Ref="7" type="PageHeaderBand" isKey="true">
          <Brush>Transparent</Brush>
          <ClientRectangle>0,0.4,28.7,1.6</ClientRectangle>
          <Components isList="true" count="13">
            <txtOrgDefName Ref="8" type="Text" isKey="true">
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>7.6,0,10.6,1.2</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,18,Bold</Font>
              <Guid>c1e7b68399f34ef1b8f89fde7da3521a</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtOrgDefName</Name>
              <Page isRef="6" />
              <Parent isRef="7" />
              <Text>{nameOrg.OrgDef_Name}
گزارش کارکرد ماهیانه</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=True, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
            </txtOrgDefName>
            <txtMr Ref="9" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>25.2,0.6,3.4,0.6</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>c117217ae7db4a54b05f71695d8b791d</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtMr</Name>
              <Page isRef="6" />
              <Parent isRef="7" />
              <Text>گزارش کارکرد خانم/آقای</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </txtMr>
            <txtFrom Ref="10" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>28.2,0,0.4,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>5276b924f8bf455c990b7b8e41372eaa</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtFrom</Name>
              <Page isRef="6" />
              <Parent isRef="7" />
              <Text>از</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </txtFrom>
            <txtTo Ref="11" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>25.2,0,0.4,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>2e1fe8291046465381b77faa69a0ba25</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtTo</Name>
              <Page isRef="6" />
              <Parent isRef="7" />
              <Text>تا</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </txtTo>
            <txteportDate Ref="12" type="Text" isKey="true">
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
              <Name>txteportDate</Name>
              <Page isRef="6" />
              <Parent isRef="7" />
              <Text>: تاریخ تهیه گزارش</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </txteportDate>
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
              <Page isRef="6" />
              <Parent isRef="7" />
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
              <Page isRef="6" />
              <Parent isRef="7" />
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
              <Page isRef="6" />
              <Parent isRef="7" />
              <Text>{ReportHelper.Instance().UserName}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </txtUserName>
            <txtPersonId Ref="16" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>26.4,1,2.2,0.6</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>f0db4949132b4d60962dfcde166c10e9</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtPersonId</Name>
              <Page isRef="6" />
              <Parent isRef="7" />
              <Text>شماره پرسنلی</Text>
              <TextBrush>[89:89:89]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <VertAlignment>Center</VertAlignment>
            </txtPersonId>
            <txtPeriodicFromDate Ref="17" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>25.8,0,2.4,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>6648fb264e204b11ba2aecbeb5aab7bd</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtPeriodicFromDate</Name>
              <Page isRef="6" />
              <Parent isRef="7" />
              <Text>{MonthlyReport_DailyValue.frDT}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </txtPeriodicFromDate>
            <txtPeriodicToDate Ref="18" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>22.8,0,2.4,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>cf0b4cbced7e4075acd7cb85620bf298</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtPeriodicToDate</Name>
              <Page isRef="6" />
              <Parent isRef="7" />
              <Text>{MonthlyReport_DailyValue.toDT}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </txtPeriodicToDate>
            <txtName Ref="19" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>21.2,0.6,4,0.6</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>7870b6dd83af4d7dbb6f75c1cbd54cea</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtName</Name>
              <Page isRef="6" />
              <Parent isRef="7" />
              <Text>{MonthlyReport_DailyValue.prsName} </Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </txtName>
            <txtPrsBarCode Ref="20" type="Text" isKey="true">
              <AllowHtmlTags>True</AllowHtmlTags>
              <AutoWidth>True</AutoWidth>
              <Border>None;Black;1;Solid;False;4;[105:105:105]</Border>
              <Brush>Transparent</Brush>
              <CanBreak>True</CanBreak>
              <CanGrow>True</CanGrow>
              <CanShrink>True</CanShrink>
              <ClientRectangle>22.6,1,2.6,0.6</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Tahoma,8,Bold</Font>
              <Guid>8bc56af298c44d02bcd86fbb6991dfd1</Guid>
              <HorAlignment>Right</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>txtPrsBarCode</Name>
              <Page isRef="6" />
              <Parent isRef="7" />
              <Text>{MonthlyReport_DailyValue.prsBarcode}</Text>
              <TextBrush>[183:117:64]</TextBrush>
              <TextQuality>Wysiwyg</TextQuality>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </txtPrsBarCode>
          </Components>
          <Conditions isList="true" count="0" />
          <Name>phbMain</Name>
          <Page isRef="6" />
          <Parent isRef="6" />
        </phbMain>
        <ghbMain Ref="21" type="GroupHeaderBand" isKey="true">
          <Brush>Transparent</Brush>
          <ClientRectangle>0,2.8,28.7,0</ClientRectangle>
          <Components isList="true" count="0" />
          <Condition>{MonthlyReport_DailyValue.ScndCnpValue_PersonId}</Condition>
          <Conditions isList="true" count="0" />
          <Name>ghbMain</Name>
          <NewPageBefore>True</NewPageBefore>
          <Page isRef="6" />
          <Parent isRef="6" />
        </ghbMain>
        <hdrMain Ref="22" type="HeaderBand" isKey="true">
          <Border>AdvBlack;1;Solid;Black;1;Solid;Black;1;Solid;Black;1;Solid;False;4;Black</Border>
          <Brush>Gainsboro</Brush>
          <ClientRectangle>0,3.6,28.7,1</ClientRectangle>
          <Components isList="true" count="27">
            <htDailyWithoutPayLeave Ref="23" type="Text" isKey="true">
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
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>م بی حقوق روزانه</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htDailyWithoutPayLeave>
            <htHourlyWithoutPayLeave Ref="24" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>1.2,0,1,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>b731db0aa1514a50a320e3789b612697</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htHourlyWithoutPayLeave</Name>
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>م بی حقوق ساعتی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htHourlyWithoutPayLeave>
            <htDailyMeritoriouslyLeave Ref="25" type="Text" isKey="true">
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
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>مرخصی استحقاقی روزانه</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htDailyMeritoriouslyLeave>
            <htHourlyMeritoriouslyLeave Ref="26" type="Text" isKey="true">
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
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>مرخصی استحقاقی ساعتی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htHourlyMeritoriouslyLeave>
            <htDailySickLeave Ref="27" type="Text" isKey="true">
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
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>مرخصی استعلاجی روزانه</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htDailySickLeave>
            <htHourlySickLeave Ref="28" type="Text" isKey="true">
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
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>مرخصی استعلاجی ساعتی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htHourlySickLeave>
            <htHostelryMission Ref="29" type="Text" isKey="true">
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
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>ماموریت شبانه روزی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htHostelryMission>
            <htDailyMission Ref="30" type="Text" isKey="true">
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
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>ماموریت روزانه</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htDailyMission>
            <htHourlyMission Ref="31" type="Text" isKey="true">
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
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>ماموریت ساعتی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htHourlyMission>
            <htDailyAbsence Ref="32" type="Text" isKey="true">
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
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>غیبت غیرمجاز روزانه</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htDailyAbsence>
            <htHourlyUnallowableAbsence Ref="33" type="Text" isKey="true">
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
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>غیبت غیر مجاز ساعتی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htHourlyUnallowableAbsence>
            <htHourlyAllowableAbsence Ref="34" type="Text" isKey="true">
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
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>غیبت مجاز ساعتی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htHourlyAllowableAbsence>
            <htUnallowableOverTime Ref="35" type="Text" isKey="true">
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
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>اضافه کار غیرمجاز</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htUnallowableOverTime>
            <htAllowableOverTime Ref="36" type="Text" isKey="true">
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
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>اضافه کار مجاز</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htAllowableOverTime>
            <htImpureOperation Ref="37" type="Text" isKey="true">
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
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>کارکرد ناخالص ساعتی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htImpureOperation>
            <htDailyPureOperation Ref="38" type="Text" isKey="true">
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
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>کارکرد خالص روزانه</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htDailyPureOperation>
            <htHourlyPureOperation Ref="39" type="Text" isKey="true">
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
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>کارکرد خالص ساعتی</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htHourlyPureOperation>
            <htPresenceDuration Ref="40" type="Text" isKey="true">
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
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>حضور کاری</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htPresenceDuration>
            <htNecessaryOperation Ref="41" type="Text" isKey="true">
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
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>کارکرد لازم</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htNecessaryOperation>
            <htThirdExit Ref="42" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>20.6,0,0.9,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>28b9b73624204b6192a356d043250d6b</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htThirdExit</Name>
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>خروج سوم</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htThirdExit>
            <htThirdEntrance Ref="43" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>21.5,0,0.9,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>5c66d7745d3c4c039338e10ebcfbe2a0</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htThirdEntrance</Name>
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>ورود سوم</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htThirdEntrance>
            <htSecondExit Ref="44" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>22.4,0,0.9,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>0a40a06b90bf4ac5829d1f6112ea9e30</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htSecondExit</Name>
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>خروج دوم</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htSecondExit>
            <htSecondEntrance Ref="45" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>23.3,0,0.9,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>8cc5a20f4eb5448b84c9d8dcf52223ca</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htSecondEntrance</Name>
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>ورود دوم</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htSecondEntrance>
            <htFirstExit Ref="46" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>24.2,0,0.9,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>9dc1d250a9544d9c98126f6308ce737b</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htFirstExit</Name>
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>خروج اول</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htFirstExit>
            <htFirstEntrance Ref="47" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>25.1,0,0.9,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>43a11da307cd4b7ea1811126c47ae81b</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htFirstEntrance</Name>
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>ورود اول</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htFirstEntrance>
            <htDate Ref="48" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>26,0,1.2,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>1178c4230464493bb432bbcf5dacfad6</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htDate</Name>
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>روز</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htDate>
            <htShamsiDate Ref="49" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[191:191:191]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>27.2,0,1.5,1</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.75</Font>
              <Guid>261f5cb855cf426fb5d14dd90edb3122</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>htShamsiDate</Name>
              <Page isRef="6" />
              <Parent isRef="22" />
              <Text>تاریخ</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </htShamsiDate>
          </Components>
          <Conditions isList="true" count="0" />
          <Guid>4cc69102fe74471bb68b734711459a11</Guid>
          <Name>hdrMain</Name>
          <Page isRef="6" />
          <Parent isRef="6" />
          <ToolTip>erwr</ToolTip>
        </hdrMain>
        <dbMain Ref="50" type="DataBand" isKey="true">
          <Border>All;Black;1;Solid;False;4;Black</Border>
          <Brush>Transparent</Brush>
          <BusinessObjectGuid isNull="true" />
          <ClientRectangle>0,5.4,28.7,0.5</ClientRectangle>
          <Components isList="true" count="27">
            <dtDailyWithoutPayLeave Ref="51" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>0,0,1.2,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>18c3c1309a6e46a6a6f046b976c505c8</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtDailyWithoutPayLeave</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().FixedDailyValue(MonthlyReport_DailyValue.gridFields_DailyWithoutPayLeave)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtDailyWithoutPayLeave>
            <dtHourlyWithoutPayLeave Ref="52" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>1.2,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>0d31de2a058a4b3397c730109b947e0b</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtHourlyWithoutPayLeave</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().IntTimeToRealTime(MonthlyReport_DailyValue.gridFields_HourlyWithoutPayLeave)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtHourlyWithoutPayLeave>
            <dtDailyMeritoriouslyLeave Ref="53" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>2.2,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>783ddc7632dd4db08973b591a4ffa08e</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtDailyMeritoriouslyLeave</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().FixedDailyValue(MonthlyReport_DailyValue.gridFields_DailyMeritoriouslyLeave)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtDailyMeritoriouslyLeave>
            <dtHourlyMeritoriouslyLeave Ref="54" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>3.2,0,1.2,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>1eb1bbd7ac59487dab3a118a1a0ef4d9</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtHourlyMeritoriouslyLeave</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().IntTimeToRealTime(MonthlyReport_DailyValue.gridFields_HourlyMeritoriouslyLeave)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtHourlyMeritoriouslyLeave>
            <dtDailySickLeave Ref="55" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>4.4,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>0a312fda1e464ef9bbe1143d5c315515</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtDailySickLeave</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().FixedDailyValue(MonthlyReport_DailyValue.gridFields_DailySickLeave)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtDailySickLeave>
            <dtHourlySickLeave Ref="56" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>5.4,0,1.2,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>c016bc4cd5e44035ba240b096b936aae</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtHourlySickLeave</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().IntTimeToRealTime(MonthlyReport_DailyValue.gridFields_HourlySickLeave)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtHourlySickLeave>
            <dtHostelryMission Ref="57" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>6.6,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>154c331998954ccfb2085e2464cb3de7</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtHostelryMission</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().FixedDailyValue(MonthlyReport_DailyValue.gridFields_HostelryMission)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtHostelryMission>
            <dtDailyMission Ref="58" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>7.6,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>2f813a1c67a64f1a9de60aaaca4bdc9b</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtDailyMission</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().FixedDailyValue(MonthlyReport_DailyValue.gridFields_DailyMission)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtDailyMission>
            <dtHourlyMission Ref="59" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>8.6,0,1.2,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>c4ff4868533a46c3a2ddf3de387444fc</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtHourlyMission</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().IntTimeToRealTime(MonthlyReport_DailyValue.gridFields_HourlyMission)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtHourlyMission>
            <dtDailyAbsence Ref="60" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>9.8,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>0874e81525994c90817da1b2cfb3c860</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtDailyAbsence</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().FixedDailyValue(MonthlyReport_DailyValue.gridFields_DailyAbsence)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtDailyAbsence>
            <dtHourlyUnallowableAbsence Ref="61" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>10.8,0,1.2,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>1734be30e3054dd69fc4ac9b1ae1f400</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtHourlyUnallowableAbsence</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().IntTimeToRealTime(MonthlyReport_DailyValue.gridFields_HourlyUnallowableAbsence)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtHourlyUnallowableAbsence>
            <dtHourlyAllowableAbsence Ref="62" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>12,0,1.2,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>8182641dd9e147dba8155910e389a632</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtHourlyAllowableAbsence</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().IntTimeToRealTime(MonthlyReport_DailyValue.gridFields_HourlyAllowableAbsence)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtHourlyAllowableAbsence>
            <dtUnallowableOverTime Ref="63" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>13.2,0,1.1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>dd10e269fa97431bbc31c4bf4416a737</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtUnallowableOverTime</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().IntTimeToRealTime(MonthlyReport_DailyValue.gridFields_UnallowableOverTime)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtUnallowableOverTime>
            <dtAllowableOverTime Ref="64" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>14.3,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>aea1a926d53342d59ca546b1be071afc</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtAllowableOverTime</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().IntTimeToRealTime(MonthlyReport_DailyValue.gridFields_AllowableOverTime)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtAllowableOverTime>
            <dtImpureOperation Ref="65" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>15.3,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>acd149c5353d4d74b87485dd5d6662d9</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtImpureOperation</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().IntTimeToRealTime(MonthlyReport_DailyValue.gridFields_ImpureOperation)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtImpureOperation>
            <dtDailyPureOperation Ref="66" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>16.3,0,0.8,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>0e168a7dc2134343a1ab1e5d90a29534</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtDailyPureOperation</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().FixedDailyValue(MonthlyReport_DailyValue.gridFields_DailyPureOperation)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtDailyPureOperation>
            <dtHourlyPureOperation Ref="67" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>17.1,0,1.4,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>a7c51824d53c4fb2b4602029355576a1</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtHourlyPureOperation</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().IntTimeToRealTime(MonthlyReport_DailyValue.gridFields_HourlyPureOperation)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtHourlyPureOperation>
            <dtPresenceDuration Ref="68" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>18.5,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>c418614c0cff4a81bca719ae390937aa</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtPresenceDuration</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().IntTimeToRealTime(MonthlyReport_DailyValue.gridFields_PresenceDuration)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtPresenceDuration>
            <dtNecessaryOperation Ref="69" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>19.5,0,1.1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>fc61e9a022c241eaa87cafc53730b3a8</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtNecessaryOperation</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().IntTimeToRealTime(MonthlyReport_DailyValue.gridFields_NecessaryOperation)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtNecessaryOperation>
            <dtThirdExit Ref="70" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>20.6,0,0.9,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>3b1924693b82467da4d2adaddbe78339</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtThirdExit</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().IntTimeToRealTime(MonthlyReport_DailyValue.ThirdExit)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtThirdExit>
            <dtThirdEntrance Ref="71" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>21.5,0,0.9,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>cd38f9e36a654951aa4b77e4e8e1cca5</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtThirdEntrance</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().IntTimeToRealTime(MonthlyReport_DailyValue.ThirdEntrance)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtThirdEntrance>
            <dtSecondExit Ref="72" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>22.4,0,0.9,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>ad516b702448414b9e2f934baa60a6c6</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtSecondExit</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().IntTimeToRealTime(MonthlyReport_DailyValue.SecondExit)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtSecondExit>
            <dtSecondEntrance Ref="73" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>23.3,0,0.9,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>58696900da90432f8a3953df0dc224fc</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtSecondEntrance</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().IntTimeToRealTime(MonthlyReport_DailyValue.SecondEntrance)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtSecondEntrance>
            <dtFirstExit Ref="74" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>24.2,0,0.9,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>974197cfb195405f8d35899e40244558</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtFirstExit</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().IntTimeToRealTime(MonthlyReport_DailyValue.FirstExit)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtFirstExit>
            <dtFirstEntrance Ref="75" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>25.1,0,0.9,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8</Font>
              <Guid>00720695fbf7420eb183dad9ca0e8408</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtFirstEntrance</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().IntTimeToRealTime(MonthlyReport_DailyValue.FirstEntrance)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtFirstEntrance>
            <dtDate Ref="76" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>26,0,1.2,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,9</Font>
              <Guid>0715656a9ea24040ab28a6efab57a873</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtDate</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{ReportHelper.Instance().ShamsiDayName(MonthlyReport_DailyValue.Date)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </dtDate>
            <dtShamsiDate Ref="77" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>Transparent</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>27.2,0,1.5,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,7.5</Font>
              <Guid>ddaa8cbaca9946a9aee65824190ec0ed</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>dtShamsiDate</Name>
              <Page isRef="6" />
              <Parent isRef="50" />
              <Text>{Remove(MonthlyReport_DailyValue.ShamsiDate,0,5)}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </dtShamsiDate>
          </Components>
          <Conditions isList="true" count="0" />
          <DataRelationName isNull="true" />
          <DataSourceName>MonthlyReport_DailyValue</DataSourceName>
          <EvenStyle>EventStyle</EvenStyle>
          <Filters isList="true" count="0" />
          <Guid>8a75d5d125b8490e919a438cc50433ec</Guid>
          <Name>dbMain</Name>
          <Page isRef="6" />
          <Parent isRef="6" />
          <Sort isList="true" count="2">
            <value>ASC</value>
            <value>Date</value>
          </Sort>
        </dbMain>
        <GroupFooterBand1 Ref="78" type="GroupFooterBand" isKey="true">
          <Brush>Transparent</Brush>
          <ClientRectangle>0,6.7,28.7,0.6</ClientRectangle>
          <Components isList="true" count="20">
            <mtDailyWithoutPayLeave Ref="79" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[34:177:76]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>0,0,1.2,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8,Bold</Font>
              <Guid>de35436391ec4d6cb526728bad1ac8ac</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>mtDailyWithoutPayLeave</Name>
              <Page isRef="6" />
              <Parent isRef="78" />
              <Text>{ReportHelper.Instance().FixedDailyValue(Sum(MonthlyReport_DailyValue.gridFields_DailyWithoutPayLeave))}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </mtDailyWithoutPayLeave>
            <mtHourlyWithoutPayLeave Ref="80" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[34:177:76]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>1.2,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8,Bold</Font>
              <Guid>4d03061852e14501850fc5dade310777</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>mtHourlyWithoutPayLeave</Name>
              <Page isRef="6" />
              <Parent isRef="78" />
              <Text>{ReportHelper.Instance().IntTimeToTime(Sum(MonthlyReport_DailyValue.gridFields_HourlyWithoutPayLeave))}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </mtHourlyWithoutPayLeave>
            <mtDailyMeritoriouslyLeave Ref="81" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[34:177:76]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>2.2,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8,Bold</Font>
              <Guid>0f43316b172143fa91af1bcae7fa8263</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>mtDailyMeritoriouslyLeave</Name>
              <Page isRef="6" />
              <Parent isRef="78" />
              <Text>{ReportHelper.Instance().FixedDailyValue(Sum(MonthlyReport_DailyValue.gridFields_DailyMeritoriouslyLeave))}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </mtDailyMeritoriouslyLeave>
            <mtHourlyMeritoriouslyLeave Ref="82" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[34:177:76]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>3.2,0,1.2,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8,Bold</Font>
              <Guid>f5e9bbab551149de89fbf49956803d00</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>mtHourlyMeritoriouslyLeave</Name>
              <Page isRef="6" />
              <Parent isRef="78" />
              <Text>{ReportHelper.Instance().IntTimeToTime(Sum(MonthlyReport_DailyValue.gridFields_HourlyMeritoriouslyLeave))}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </mtHourlyMeritoriouslyLeave>
            <mtDailySickLeave Ref="83" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[34:177:76]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>4.4,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8,Bold</Font>
              <Guid>b5d879ebb69641cebe04e4095eeb31fd</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>mtDailySickLeave</Name>
              <Page isRef="6" />
              <Parent isRef="78" />
              <Text>{ReportHelper.Instance().FixedDailyValue(Sum(MonthlyReport_DailyValue.gridFields_DailySickLeave))}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </mtDailySickLeave>
            <mtHourlySickLeave Ref="84" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[34:177:76]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>5.4,0,1.2,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8,Bold</Font>
              <Guid>d504ef33b44242f99b93aedd7329a2d6</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>mtHourlySickLeave</Name>
              <Page isRef="6" />
              <Parent isRef="78" />
              <Text>{ReportHelper.Instance().IntTimeToTime(Sum(MonthlyReport_DailyValue.gridFields_HourlySickLeave))}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </mtHourlySickLeave>
            <mtHostelryMission Ref="85" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[34:177:76]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>6.6,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8,Bold</Font>
              <Guid>a9d3a810c02a4e84a55fa369dc0ba1a4</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>mtHostelryMission</Name>
              <Page isRef="6" />
              <Parent isRef="78" />
              <Text>{ReportHelper.Instance().FixedDailyValue(Sum(MonthlyReport_DailyValue.gridFields_HostelryMission))}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </mtHostelryMission>
            <mtDailyMission Ref="86" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[34:177:76]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>7.6,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8,Bold</Font>
              <Guid>3ed4f16d04424520b44fa0aae02be5bc</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>mtDailyMission</Name>
              <Page isRef="6" />
              <Parent isRef="78" />
              <Text>{ReportHelper.Instance().FixedDailyValue(Sum(MonthlyReport_DailyValue.gridFields_DailyMission))}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </mtDailyMission>
            <mtHourlyMission Ref="87" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[34:177:76]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>8.6,0,1.2,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8,Bold</Font>
              <Guid>4388ff85ff2346a0bd287f4ce883ca0c</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>mtHourlyMission</Name>
              <Page isRef="6" />
              <Parent isRef="78" />
              <Text>{ReportHelper.Instance().IntTimeToTime(Sum(MonthlyReport_DailyValue.gridFields_HourlyMission))}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </mtHourlyMission>
            <mtDailyAbsence Ref="88" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[34:177:76]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>9.8,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8,Bold</Font>
              <Guid>b31aca8ba0544713944b99a58449b750</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>mtDailyAbsence</Name>
              <Page isRef="6" />
              <Parent isRef="78" />
              <Text>{ReportHelper.Instance().FixedDailyValue(Sum(MonthlyReport_DailyValue.gridFields_DailyAbsence))}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </mtDailyAbsence>
            <mtHourlyUnallowableAbsence Ref="89" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[34:177:76]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>10.8,0,1.2,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8,Bold</Font>
              <Guid>bb284db9ac544f34a9a2f0eeeeed22ac</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>mtHourlyUnallowableAbsence</Name>
              <Page isRef="6" />
              <Parent isRef="78" />
              <Text>{ReportHelper.Instance().IntTimeToTime(Sum(MonthlyReport_DailyValue.gridFields_HourlyUnallowableAbsence))}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </mtHourlyUnallowableAbsence>
            <mtHourlyAllowableAbsence Ref="90" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[34:177:76]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>12,0,1.2,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8,Bold</Font>
              <Guid>35acb0fe1b1149de85a7189899d0abb5</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>mtHourlyAllowableAbsence</Name>
              <Page isRef="6" />
              <Parent isRef="78" />
              <Text>{ReportHelper.Instance().IntTimeToTime(Sum(MonthlyReport_DailyValue.gridFields_HourlyAllowableAbsence))}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </mtHourlyAllowableAbsence>
            <mtUnallowableOverTime Ref="91" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[34:177:76]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>13.2,0,1.1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8,Bold</Font>
              <Guid>a148efa1b4d24fae9609cb22afc93768</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>mtUnallowableOverTime</Name>
              <Page isRef="6" />
              <Parent isRef="78" />
              <Text>{ReportHelper.Instance().IntTimeToTime(Sum(MonthlyReport_DailyValue.gridFields_UnallowableOverTime))}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </mtUnallowableOverTime>
            <mtImpureOperation Ref="92" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[34:177:76]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>15.3,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8,Bold</Font>
              <Guid>ff0a22cb5d864fe0bb352b15a4e407e1</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>mtImpureOperation</Name>
              <Page isRef="6" />
              <Parent isRef="78" />
              <Text>{ReportHelper.Instance().IntTimeToTime(Sum(MonthlyReport_DailyValue.gridFields_ImpureOperation))}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </mtImpureOperation>
            <mtDailyPureOperation Ref="93" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[34:177:76]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>16.3,0,0.8,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8,Bold</Font>
              <Guid>bcff5ff32596413598f9a891b5ce0eaa</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>mtDailyPureOperation</Name>
              <Page isRef="6" />
              <Parent isRef="78" />
              <Text>{ReportHelper.Instance().FixedDailyValue(Sum(MonthlyReport_DailyValue.gridFields_DailyPureOperation))}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </mtDailyPureOperation>
            <mtHourlyPureOperation Ref="94" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[34:177:76]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>17.1,0,1.4,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8,Bold</Font>
              <Guid>e6d207778f514c13a918e8e72cc295f3</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>mtHourlyPureOperation</Name>
              <Page isRef="6" />
              <Parent isRef="78" />
              <Text>{ReportHelper.Instance().IntTimeToTime(Sum(MonthlyReport_DailyValue.gridFields_HourlyPureOperation))}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </mtHourlyPureOperation>
            <mtPresenceDuration Ref="95" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[34:177:76]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>18.5,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8,Bold</Font>
              <Guid>7e085d38a43b4ded96e1476c24ff7075</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>mtPresenceDuration</Name>
              <Page isRef="6" />
              <Parent isRef="78" />
              <Text>{ReportHelper.Instance().IntTimeToTime(Sum(MonthlyReport_DailyValue.gridFields_PresenceDuration))}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </mtPresenceDuration>
            <mtNecessaryOperation Ref="96" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[34:177:76]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>19.5,0,1.1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8,Bold</Font>
              <Guid>dca4cad994a3453a8de916bad9c8cf9d</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>mtNecessaryOperation</Name>
              <Page isRef="6" />
              <Parent isRef="78" />
              <Text>{ReportHelper.Instance().IntTimeToTime(Sum(MonthlyReport_DailyValue.gridFields_NecessaryOperation))}</Text>
              <TextBrush>Black</TextBrush>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </mtNecessaryOperation>
            <mtTotal Ref="97" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[34:177:76]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>20.6,0,8.1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8,Bold</Font>
              <Guid>ff21bfd78c8942c5ba1f5b67a731100b</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>mtTotal</Name>
              <Page isRef="6" />
              <Parent isRef="78" />
              <Text>مجموع</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <VertAlignment>Center</VertAlignment>
            </mtTotal>
            <mtAllowableOverTime Ref="98" type="Text" isKey="true">
              <Border>All;Black;1;Solid;False;4;Black</Border>
              <Brush>[34:177:76]</Brush>
              <CanGrow>True</CanGrow>
              <ClientRectangle>14.3,0,1,0.5</ClientRectangle>
              <Conditions isList="true" count="0" />
              <Font>Arial,8,Bold</Font>
              <Guid>cc52b8faff0d49c5afdcc30bd124054a</Guid>
              <HorAlignment>Center</HorAlignment>
              <Margins>0,0,0,0</Margins>
              <Name>mtAllowableOverTime</Name>
              <Page isRef="6" />
              <Parent isRef="78" />
              <Text>{ReportHelper.Instance().IntTimeToTime(Sum(MonthlyReport_DailyValue.gridFields_AllowableOverTime))}</Text>
              <TextBrush>Black</TextBrush>
              <TextOptions>HotkeyPrefix=None, LineLimit=False, RightToLeft=False, Trimming=None, WordWrap=True, Angle=0, FirstTabOffset=40, DistanceBetweenTabs=20,</TextOptions>
              <Type>Expression</Type>
              <VertAlignment>Center</VertAlignment>
            </mtAllowableOverTime>
          </Components>
          <Conditions isList="true" count="0" />
          <Name>GroupFooterBand1</Name>
          <Page isRef="6" />
          <Parent isRef="6" />
        </GroupFooterBand1>
      </Components>
      <Conditions isList="true" count="0" />
      <Guid>4312ae8a09374b55a344f00f7cb85b2f</Guid>
      <Margins>0.5,0.5,0.5,0.5</Margins>
      <Name>pgeReport</Name>
      <Orientation>Landscape</Orientation>
      <PageHeight>35</PageHeight>
      <PageWidth>29.7</PageWidth>
      <PaperSize>Statement</PaperSize>
      <Report isRef="0" />
      <RightToLeft>True</RightToLeft>
      <Watermark Ref="99" type="Stimulsoft.Report.Components.StiWatermark" isKey="true">
        <Font>Arial,100</Font>
        <TextBrush>[50:0:0:0]</TextBrush>
      </Watermark>
    </pgeReport>
  </Pages>
  <PrinterSettings Ref="100" type="Stimulsoft.Report.Print.StiPrinterSettings" isKey="true" />
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
  <ReportAlias>rptMonthlyReport</ReportAlias>
  <ReportChanged>6/17/2013 8:28:41 AM</ReportChanged>
  <ReportCreated>11/6/2011 9:01:08 AM</ReportCreated>
  <ReportFile>E:\New folder (3)\MonthlyReport(FromTo).mrt</ReportFile>
  <ReportGuid>00e74233e0b3488c8dc2f2e68bcb8c39</ReportGuid>
  <ReportName>rptMonthlyReport</ReportName>
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
    
    public class rptMonthlyReport : Stimulsoft.Report.StiReport
    {
        
        public rptMonthlyReport()
        {
            this.InitializeComponent();
        }
        #region StiReport Designer generated code - do not modify#endregion StiReport Designer generated code - do not modify
    }
}
</Script>
  <ScriptLanguage>CSharp</ScriptLanguage>
  <Styles isList="true" count="3">
    <Master Ref="101" type="Stimulsoft.Report.StiStyle" isKey="true">
      <Brush>NavajoWhite</Brush>
      <Conditions isList="true" count="0" />
      <Description />
      <Font>Arial,8</Font>
      <Name>Master</Name>
      <TextBrush>Black</TextBrush>
    </Master>
    <EventStyle Ref="102" type="Stimulsoft.Report.StiStyle" isKey="true">
      <Brush>AntiqueWhite</Brush>
      <Conditions isList="true" count="0" />
      <Description />
      <Font>Arial,8</Font>
      <Name>EventStyle</Name>
      <TextBrush>Black</TextBrush>
    </EventStyle>
    <Style1 Ref="103" type="Stimulsoft.Report.StiStyle" isKey="true">
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
