﻿<%@ page language="C#" autoeventwireup="true" inherits="GTS.Clock.Presentaion.WebForms.FirstDayYear_ToDate_ReportParameter, App_Web_zm3lnrmt" %>

<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AspNetPersianDatePickup" Namespace="AspNetPersianDatePickup"
    TagPrefix="pcal" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link href="css/combobox.css" runat="server" type="text/css" rel="Stylesheet" />
    <link href="css/toolbar.css" runat="server" type="text/css" rel="stylesheet" />
    <link href="css/label.css" runat="server" type="text/css" rel="Stylesheet" />
    <link href="css/alert_box.css" runat="server" type="text/css" rel="Stylesheet" />
    <link href="css/tableStyle.css" runat="server" type="text/css" rel="Stylesheet" />
    <link href="css/calendarStyle.css" type="text/css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <script type="text/javascript" src="JS/jquery.js"></script>
    <script type="text/javascript" src="JS/API/FirstDayYear_ToDate_ReportParameter_onPageLoad.js"></script>
    <script type="text/javascript" src="JS/API/FirstDayYear_ToDate_ReportParameter_Oparetions.js"></script>
    <script type="text/javascript" src="JS/API/Alert_Box.js"></script>
    <form id="FirstDayYear_ToDate_ReportParameterForm" runat="server" meta:resourcekey="FirstDayYear_ToDate_ReportParameterForm">
    <div style="height: 290px;" class="BoxStyle">
        <table id="tblMain_FirstDayYear_ToDate_ReportParameter" style="width: 100%; font-family: Arial;
            font-size: small" meta:resourcekey="AlignObj">
            <tr>
                <td valign="top">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 45%">
                                <asp:Label ID="lblTo_FirstDayYear_ToDate_ReportParameter" runat="server" Text=" تا تاریخ :"
                                    meta:resourcekey="lblTo_FirstDayYear_ToDate_ReportParameter"></asp:Label>
                            </td>
                            <td id="Container_toDateCalendars_RuleParameters">
                                <table runat="server" id="Container_pdptoDate_RuleParameters" visible="false" style="width: 100%">
                                    <tr>
                                        <td>
                                            <pcal:PersianDatePickup ID="pdptoDate_RuleParameters" runat="server" CssClass="PersianDatePicker"
                                                ReadOnly="true"></pcal:PersianDatePickup>
                                        </td>
                                    </tr>
                                </table>
                                <table runat="server" id="Container_gdptoDate_RuleParameters" visible="false" style="width: 100%">
                                    <tr>
                                        <td>
                                            <table id="Container_gCaltoDate_RuleParameters" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td onmouseup="btn_gdptoDate_RuleParameters_OnMouseUp(event)">
                                                        <ComponentArt:Calendar ID="gdptoDate_RuleParameters" runat="server" ControlType="Picker"
                                                            PickerCssClass="picker" PickerCustomFormat="yyyy/MM/dd" PickerFormat="Custom"
                                                            SelectedDate="2008-1-1">
                                                            <ClientEvents>
                                                                <SelectionChanged EventHandler="gdptoDate_RuleParameters_OnDateChange" />
                                                            </ClientEvents>
                                                        </ComponentArt:Calendar>
                                                    </td>
                                                    <td style="font-size: 10px;">
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <img id="btn_gdptoDate_RuleParameters" alt="" class="calendar_button" onclick="btn_gdptoDate_RuleParameters_OnClick(event)"
                                                            onmouseup="btn_gdptoDate_RuleParameters_OnMouseUp(event)" src="Images/Calendar/btn_calendar.gif" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <ComponentArt:Calendar ID="gCaltoDate_RuleParameters" runat="server" AllowMonthSelection="false"
                                                AllowMultipleSelection="false" AllowWeekSelection="false" CalendarCssClass="calendar"
                                                CalendarTitleCssClass="title" ControlType="Calendar" DayCssClass="day" DayHeaderCssClass="dayheader"
                                                DayHoverCssClass="dayhover" DayNameFormat="FirstTwoLetters" ImagesBaseUrl="Images/Calendar"
                                                MonthCssClass="month" NextImageUrl="cal_nextMonth.gif" NextPrevCssClass="nextprev"
                                                OtherMonthDayCssClass="othermonthday" PopUp="Custom" PopUpExpandControlId="btn_gdptoDate_RuleParameters"
                                                PrevImageUrl="cal_prevMonth.gif" SelectedDate="2008-1-1" SelectedDayCssClass="selectedday"
                                                SwapDuration="300" SwapSlide="Linear" VisibleDate="2008-1-1">
                                                <ClientEvents>
                                                    <SelectionChanged EventHandler="gCaltoDate_RuleParameters_OnChange" />
                                                    <Load EventHandler="gCaltoDate_RuleParameters_onLoad" />
                                                </ClientEvents>
                                            </ComponentArt:Calendar>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <ComponentArt:ToolBar ID="TlbRegister_FirstDayYear_ToDate_ReportParameter" runat="server"
                        CssClass="toolbar" DefaultItemActiveCssClass="itemActive" DefaultItemCheckedCssClass="itemChecked"
                        DefaultItemCheckedHoverCssClass="itemActive" DefaultItemCssClass="item" DefaultItemHoverCssClass="itemHover"
                        DefaultItemImageHeight="16px" DefaultItemImageWidth="16px" DefaultItemTextImageRelation="ImageBeforeText"
                        ImagesBaseUrl="images/ToolBar/" ItemSpacing="1px" UseFadeEffect="false">
                        <Items>
                            <ComponentArt:ToolBarItem ID="tlbItemRegister_TlbRegister_FirstDayYear_ToDate_ReportParameter"
                                runat="server" ClientSideCommand="tlbItemRegister_TlbRegister_FirstDayYear_ToDate_ReportParameter_onClick();"
                                DropDownImageHeight="16px" DropDownImageWidth="16px" ImageHeight="16px" ImageUrl="save.png"
                                ImageWidth="16px" ItemType="Command" meta:resourcekey="tlbItemRegister_TlbRegister_FirstDayYear_ToDate_ReportParameter"
                                TextImageSpacing="5" Enabled="true" />
                        </Items>
                    </ComponentArt:ToolBar>
                </td>
            </tr>
        </table>
    </div>
    <asp:HiddenField runat="server" ID="hfCurrentfromDate_RuleParameters" />
    <asp:HiddenField runat="server" ID="hfCurrenttoDate_RuleParameters" />
    <asp:HiddenField runat="server" ID="hfCurrentFromDate_FirstDayYear_ToDate_ReportParameter" />
    <asp:HiddenField runat="server" ID="hfCurrentToDate_FirstDayYear_ToDate_ReportParameter" />
    <asp:HiddenField runat="server" ID="hfConnectionError_FirstDayYear_ToDate_ReportParameter"
        meta:resourcekey="hfConnectionError_FirstDayYear_ToDate_ReportParameter" />
    <asp:HiddenField runat="server" ID="hfErrorType_FirstDayYear_ToDate_ReportParameter"
        meta:resourcekey="hfErrorType_FirstDayYear_ToDate_ReportParameter" />
    <asp:HiddenField runat="server" ID="ReportParameterID" />
    </form>
</body>
</html>
