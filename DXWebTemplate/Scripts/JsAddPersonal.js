function ChkValidate() {
    var alm0 = txtEMPID.GetText();
    var alm1 = cmbTitleTH.GetValue();
    var alm2 = txtFirstNameTH.GetValue();
    var alm3 = txtLastNameTH.GetText();
    var alm4 = cmbTitleENG.GetValue();
    var alm5 = txtFirstNameENG.GetText();
    var alm6 = txtLastNameENG.GetText();
    var alm7 = txtIDCARD.GetText();
    var alm8 = BirthDate.GetText();
    var alm9 = cmbStatusSoldier.GetValue();
    var alm10 = cmbLiveAddress.GetText();
    var alm11 = txtAddress.GetText(); //ที่อยู่
    var alm12 = cmbProvince.GetText();
    var alm13 = cmbAmphur.GetText();
    var alm14 = cmbTambon.GetText();
    var alm15 = cmbStatusMarry.GetValue();
    var alm16 = txtContactSibling.GetText();
    if (alm0 == "") {
        lbWnChk.SetText('txtEMPID');
        lbWarning.SetText('* กรุณากรอกรหัสพนักงาน !');
        PopupAlert.Show();
    } else if (alm1 == null) {
        lbWnChk.SetText('cmbTitleTH');
        lbWarning.SetText('* กรุณาเลือกคำนำหน้าชื่อ(ไทย) !');
        PopupAlert.Show();
    } else if (alm2 == null) {
        lbWnChk.SetText('txtFirstNameTH');
        lbWarning.SetText('* กรุณากรอกชื่อ(ภาษาไทย) !');
        PopupAlert.Show();
    } else if (alm3 == "") {
        lbWnChk.SetText('txtLastNameTH');
        lbWarning.SetText('* กรุณากรอกนามสกุล(ภาษาไทย) !');
        PopupAlert.Show();
    } else if (alm4 == null) {
        lbWnChk.SetText('cmbTitleENG');
        lbWarning.SetText('* กรุณาเลือกคำนำหน้าชื่อ(ภาษาอังกฤษ) !');
        PopupAlert.Show();
    } else if (alm5 == "") {
        lbWnChk.SetText('txtFirstNameENG');
        lbWarning.SetText('* กรุณากรอกชื่อ(ภาษาอังกฤษ) !');
        PopupAlert.Show();
    } else if (alm6 == "") {
        lbWnChk.SetText('txtLastNameENG');
        lbWarning.SetText('* กรุณากรอกนามสกุล(ภาษาอังกฤษ) !');
        PopupAlert.Show();
    } else if (alm7 == "") {
        lbWnChk.SetText('txtIDCARD');
        lbWarning.SetText('* กรุณากรอกเลขบัตรประชาชน !');
        PopupAlert.Show();
    } else if (alm8 == "เลือกวันที่") {
        lbWnChk.SetText('BirthDate');
        lbWarning.SetText('* กรุณาเลือกวันเดือนปีเกิด !');
        PopupAlert.Show();
    } else if (alm9 == null) {
        lbWnChk.SetText('cmbStatusSoldier');
        lbWarning.SetText('* กรุณาเลือกสถานภาพทางทหาร !');
        PopupAlert.Show();
    } else if (alm10 == null) {
        lbWnChkAddr.SetText('cmbLiveAddress');
        lbWarningAddr.SetText('* กรุณาเลือกประเภทสถานที่พัก !');
        PopupAlertAddr.Show();
    } else if (alm11 == '') {
        lbWnChkAddr.SetText('txtAddress');
        lbWarningAddr.SetText('* กรุณากรอกที่อยู่ !');
        PopupAlertAddr.Show();
    } else if (alm12 == null) {
        lbWnChkAddr.SetText('cmbProvince');
        lbWarningAddr.SetText('* กรุณาเลือกจังหวัด !');
        PopupAlertAddr.Show();
    } else if (alm13 == null) {
        lbWnChkAddr.SetText('cmbAmphur');
        lbWarningAddr.SetText('* กรุณาเลือกอำเภอ !');
        PopupAlertAddr.Show();
    } else if (alm14 == null) {
        lbWnChkAddr.SetText('cmbTambon');
        lbWarningAddr.SetText('* กรุณาเลือกตำบล !');
        PopupAlertAddr.Show();
    } else if (alm15 == null) {
        lb2Beer.SetText('cmbStatusMarry');
        lb1Beer.SetText('* กรุณาเลือกสถานภาพ !');
        PopupAlertMarry.Show();
    } else if (alm16 == '') {
        lb4Beer.SetText('txtContactSibling');
        lb3Beer.SetText('* กรุณากรอกบุคคลที่สามารถติดต่อได้ในกรณีเร่งด่วน !');
        PopupAlertSib.Show();
    } else if (DateStartWork.GetText() == 'เลือกวันที่') {
        lb6Beer.SetText('DateStartWork');
        lb5Beer.SetText('* กรุณาเลือกวันที่เริ่มงาน !');
        PopupAlertEmp.Show();
    } else if (cmbEMPtype.GetValue() == null) {
        lb6Beer.SetText('cmbEMPtype');
        lb5Beer.SetText('* กรุณาเลือกประเภทพนักงาน !');
        PopupAlertEmp.Show();
    } else if (txtIncome.GetText() == '') {
        lb6Beer.SetText('txtIncome');
        lb5Beer.SetText('* กรุณากรอกเงินเดือนเริ่มต้น !');
        PopupAlertEmp.Show();
    } else {
        callbackSave.PerformCallback()
    }

}
function SetFocusCtrl(ctrlChk) {
    eval(ctrlChk).SetFocus(true);
}