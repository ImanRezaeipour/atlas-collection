﻿
var CurrentLangID = null;
function DialogOvertimeJustificationRequest_onShow(sender, e) {
    CurrentLangID = parent.CurrentLangID;
    DialogOvertimeJustificationRequest.set_contentUrl("OvertimeJustificationRequest.aspx");
    document.getElementById('DialogOvertimeJustificationRequest_IFrame').style.display = '';
    document.getElementById('DialogOvertimeJustificationRequest_IFrame').style.visibility = 'visible';

    if (CurrentLangID == 'fa-IR') {
        document.getElementById('DialogOvertimeJustificationRequest_topLeftImage').src = 'Images/Dialog/top_right.gif';
        document.getElementById('DialogOvertimeJustificationRequest_topRightImage').src = 'Images/Dialog/top_left.gif';
        document.getElementById('DialogOvertimeJustificationRequest_downLeftImage').src = 'Images/Dialog/down_right.gif';
        document.getElementById('DialogOvertimeJustificationRequest_downRightImage').src = 'Images/Dialog/down_left.gif';
        document.getElementById('CloseButton_DialogOvertimeJustificationRequest').align = 'left';
        document.getElementById('tbl_DialogOvertimeJustificationRequestheader').dir = 'rtl';
        document.getElementById('tbl_DialogOvertimeJustificationRequestfooter').dir = 'rtl';        
    }
    if (CurrentLangID == 'en-US')
        document.getElementById('CloseButton_DialogOvertimeJustificationRequest').align = 'right';
}

function DialogOvertimeJustificationRequest_onClose(sender, e) {
    document.getElementById('DialogOvertimeJustificationRequest_IFrame').style.display = 'none';
    document.getElementById('DialogOvertimeJustificationRequest_IFrame').style.visibility = 'hidden';
    DialogOvertimeJustificationRequest.set_contentUrl("about:blank");
}

