﻿

function GetBoxesHeaders_MasterUnderManagementPersonnelExeptionAccessView() {
    GetBoxesHeaders_MasterUnderManagementPersonnelExeptionAccessViewPage();
}

function GetBoxesHeaders_MasterUnderManagementPersonnelExeptionAccessViewPage_onCallBack(Response) {
    parent.document.getElementById('Title_DialogUnderManagementPersonnelExeptionAccessView').innerHTML = Response[0];
    document.getElementById('header_BoxUnderManagementPersonnelExeptionAccessView_MasterUnderManagementPersonnelExeptionAccessView').innerHTML = Response[1];
}

function SetPageIndex_GridUnderManagementPersonnelExeptionAccessView_MasterUnderManagementPersonnelExeptionAccessView(index){
    SetPageIndex_GridUnderManagementPersonnelExeptionAccessView_MasterUnderManagementPersonnelExeptionAccessViewPage(index);
}

function SetPageIndex_GridUnderManagementPersonnelExeptionAccessView_MasterUnderManagementPersonnelExeptionAccessView_onCallBack(Response) {
    document.getElementById('MasterUnderManagementPersonnelExeptionAccessView_iFrame').contentWindow.CallBack_GridUnderManagementPersonnelExeptionAccessView_UnderManagementPersonnelExeptionAccessView.callback();
}



