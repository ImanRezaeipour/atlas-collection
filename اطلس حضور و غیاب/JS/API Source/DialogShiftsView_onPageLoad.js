﻿

function DialogShiftsView_onShow(sender, e) {
    var CurrentLangID = parent.CurrentLangID;
    DialogShiftsView.set_contentUrl("ShiftsView.aspx");
    document.getElementById('DialogShiftsView_IFrame').style.display = '';
    document.getElementById('DialogShiftsView_IFrame').style.visibility = 'visible';

    if (CurrentLangID == 'fa-IR') {
        document.getElementById('DialogShiftsView_topLeftImage').src = 'Images/Dialog/top_right.gif';
        document.getElementById('DialogShiftsView_topRightImage').src = 'Images/Dialog/top_left.gif';
        document.getElementById('DialogShiftsView_downLeftImage').src = 'Images/Dialog/down_right.gif';
        document.getElementById('DialogShiftsView_downRightImage').src = 'Images/Dialog/down_left.gif';
        document.getElementById('CloseButton_DialogShiftsView').align = 'left';
        document.getElementById('tbl_DialogShiftsViewheader').dir = 'rtl';
        document.getElementById('tbl_DialogShiftsViewfooter').dir = 'rtl';        
    }
    if (CurrentLangID == 'en-US')
        document.getElementById('CloseButton_DialogShiftsView').align = 'right';
}

function DialogShiftsView_onClose(sender, e) {
    document.getElementById('DialogShiftsView_IFrame').style.display = 'none';
    document.getElementById('DialogShiftsView_IFrame').style.visibility = 'hidden';
    DialogShiftsView.set_contentUrl("about:blank");
}
