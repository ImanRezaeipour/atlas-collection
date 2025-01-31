﻿SET NOCOUNT ON

BEGIN TRANSACTION DeleteTables

PRINT 'خالی کردن جداول'
BEGIN

    UPDATE TA_Person
    SET    Prs_PrsDtlID = NULL ,
           prs_employid = NULL

	DELETE FROM TA_UIValidationGroup
    DELETE FROM TA_Illness
    DELETE FROM TA_DashboardSettings
    DELETE FROM TA_DataAccessOrgan
    DELETE FROM TA_OrganDefine
    DELETE FROM TA_PermitPair
    DELETE FROM TA_AssignWorkGroup
    DELETE FROM TA_AssignRuleParameter
    DELETE FROM TA_CalculationDateRangeTemplate
    DELETE FROM TA_EngineCalculationDateRange
    DELETE FROM TA_DataAccessWorkGroup
    DELETE FROM TA_LeaveSettings
    DELETE FROM TA_Calculation_Flag_Persons
    DELETE FROM TA_DataAccessShift
    DELETE FROM TA_EmploymentType
    DELETE FROM TA_ELESetting
    DELETE FROM TA_UsedLeaveDetail
    DELETE FROM TA_WorkGroupDetail
    DELETE FROM TA_DataAccessRuleGroup
    DELETE FROM TA_DutyPlace
    DELETE FROM TA_TrafficSettings
    DELETE FROM TA_Doctor
    DELETE FROM TA_Department
    DELETE FROM TA_RuleConcept
    DELETE FROM TA_DefinedConceptValue
    DELETE FROM TA_ControlStation
    DELETE FROM TA_DataAccessManager
    DELETE FROM TA_SecondaryConceptParameter
    DELETE FROM TA_ConceptTemplateParameter
    DELETE FROM TA_ShiftPair
    DELETE FROM TA_ConceptTemplateMapping
    DELETE FROM TA_PersonParamValue
    DELETE FROM TA_ShiftException
    DELETE FROM TA_CompaireDiffrence
    DELETE FROM TA_UnderManagment
    DELETE FROM TA_TriggerLog
    DELETE FROM TA_UserSettings
    DELETE FROM TA_Request
    DELETE FROM TA_Rule
    DELETE FROM TA_SecondaryConceptMap
    DELETE FROM TA_RuleParameter
    DELETE FROM TA_ImperativeRequest
    DELETE FROM TA_RuleCategory
    DELETE FROM TA_CalcClose
    DELETE FROM TA_LeaveYearRemain
    DELETE FROM TA_CFPLog
    DELETE FROM TA_Manager
    DELETE FROM TA_ProceedTrafficPair
    DELETE FROM TA_LeaveCalcResult
    DELETE FROM TA_OperatorDateRangeAccess
    DELETE FROM TA_OperatorWorkGroupAccess
    DELETE FROM TA_WorkGroup
    DELETE FROM TA_OperatorUndermanagement
    DELETE FROM TA_OperatorShiftAccess
    DELETE FROM TA_OperatorRuleGroupAccess
    DELETE FROM TA_SecurityActiveDirectoryDomains
    DELETE FROM TA_SecurityUser
    DELETE FROM TA_OperatorReportAccess
    DELETE FROM TA_OperatorManagerAccess
    DELETE FROM TA_Shift
    DELETE FROM TA_SMSSettings
    DELETE FROM TA_ManagerFlow
    DELETE FROM TA_EmailSettings
    DELETE FROM TA_PersonTASpec
    DELETE FROM TA_GridMonthlyOperationGridClientSettings
    DELETE FROM TA_DataAccessOrganizationUnit
    DELETE FROM TA_GridMonthlyOperationGridMasterSettings
    DELETE FROM TA_ExceptionShift
    DELETE FROM TA_RequestDetail
    DELETE FROM TA_DataAccessPrecard
    DELETE FROM TA_PersonDetail
    DELETE FROM TA_Substitute
    DELETE FROM TA_SubstitutePrecardAccess
    DELETE FROM TA_RuleCategoryPart
    DELETE FROM TA_Person
    DELETE FROM TA_DataAccessReport
    DELETE FROM TA_RequestStatus
    DELETE FROM TA_SecondaryConcept
    DELETE FROM TA_DataAccessFlow
    DELETE FROM TA_CoceptsReserveField
    DELETE FROM TA_DesignedReportColumn
    DELETE FROM TA_DataAccessDoctor
    DELETE FROM TA_GunChartClientSettings
    DELETE FROM TA_Budget
    DELETE FROM TA_DesignedReportCondition
    DELETE FROM TA_DataAccessCtrlStation
    DELETE FROM TA_NotificationServicesHistory
    DELETE FROM TA_Flow
	DELETE FROM TA_FlowGroup
    DELETE FROM TA_PairableSecondaryConceptValuePair
    DELETE FROM TA_LeaveIncDec
    DELETE FROM TA_Clock
    DELETE FROM TA_GridDetailedMonthlyOperationGridFields
    DELETE FROM TA_PTable
    DELETE FROM TA_DataAccessDepartment
    DELETE FROM TA_PriorityDependency
    DELETE FROM TA_BaseTraffic
    DELETE FROM TA_PublicMessage
    DELETE FROM TA_OverTimePermit
    DELETE FROM TA_NobatKari
    DELETE FROM TA_OrganizationUnit
    DELETE FROM TA_PrivateMessage
    DELETE FROM TA_MissionLocation
    DELETE FROM TA_PersonRangeAssignment
    DELETE FROM TA_PersonCalculationValidity
    DELETE FROM TA_GridMasterMonthlyOperationGridFields
    DELETE FROM TA_Permit
    DELETE FROM TA_ArchiveConceptValue
    DELETE FROM TA_GridExistConcepts
    DELETE FROM TA_ClockType
    DELETE FROM TA_PersonRuleCategoryAssignment
    DELETE FROM TA_Chart
    DELETE FROM TA_ProceedTraffic
    DELETE FROM TA_Operator
    DELETE FROM TA_GridColumnColor
    DELETE FROM TA_Grade
	DELETE FROM TA_BioTmpIds
	DELETE FROM TA_NormalDateRange
	DELETE FROM TA_PersonReserveFieldComboValue
	DELETE FROM TA_TemplateCondition
	DELETE FROM TA_RuleTemplateMapping
	DELETE FROM TA_GridMonthlyOperationConceptValues

	TRUNCATE TABLE TA_SecondaryConceptValue

END

COMMIT TRANSACTION DeleteTables