<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="DXWebTemplate.login" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width, user-scalable=no, maximum-scale=1.0, minimum-scale=1.0" />
    <meta charset="UTF-8">
    <title>WAC</title>
    <link rel='stylesheet prefetch' href='https://www.google.com/fonts#UsePlace:use/Collection:Roboto:400,300,100,500'>
    <%--<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'>--%>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel='stylesheet prefetch' href='https://www.google.com/fonts#UsePlace:use/Collection:Roboto+Slab:400,700,300,100'>
    <link rel="stylesheet" href="css/style.css">
   <link rel="shortcut icon" href="Images/omr.ico">
      <style>
        body, html
        {
            height: 100%;
        }
        
        .bg
        {
            /* The image used */
            background-image: url("BackgroundImg/3.jpg"); /* Full height */
            height: 90%; /* Center and scale the image nicely  style="background-image:url(EasyImage/3.jpg);" */
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
     
    </style>
</head>
    <%--style="background-image:url(Images/bg2.png);"--%>
<body class="bg">
    <div id="dialog" class="dialog dialog-effect-in">
  <div class="dialog-front">
    <div class="dialog-content">
      <form id="login_form" class="dialog-form" action="" method="POST">
        <fieldset>
         <%-- <legend>Log in</legend>--%>
            
          <div class="form-group">
            <label for="user_username" class="control-label">ชื่อเข้าใช้งาน :</label>
            <input type="text" id="user_username" class="form-control" name="user_username" autofocus/>
          </div>
          <div class="form-group">
            <label for="user_password" class="control-label">รหัสผ่าน :</label>
            <input type="password" id="user_password" class="form-control" name="user_password"/>
          </div>
          <div class="text-center pad-top-20">
            <p>คลิกเมื่อคุณลืม<br><a href="#" class="link"><strong>ชื่อเข้าใช้งาน</strong></a> หรือ <a href="#" class="link"><strong>รหัสผ่าน</strong></a>?</p>
          </div>
          <div class="pad-top-20 pad-btm-20">
            <input type="submit" class="btn btn-default btn-block btn-lg" value="Continue">
          </div>
          
                                        <dx:ASPxLabel ID="lbCheck" runat="server" ForeColor="Red" runat="server" ClientInstanceName="lbCheck">
                                            </dx:ASPxLabel>
            
        <table style="width:100%">
                <tr>
                    <td><dx:ASPxLabel ID="lbCopy" runat="server" Font-Size="6pt" ForeColor="#BDBDBD">
                                        </dx:ASPxLabel></td>
                    <td style="text-align:right;"><img src="images/logoMain.png" style="width:100px; height:70px;"/></td>
                </tr>
            </table>
        </fieldset>
      </form>
    </div>
  </div>
 
</div>
   <script type="text/javascript" src="Scripts/jquery.min.js"></script>

       <script type='text/javascript'>

           // The "getFormData()" function retrieves the names and values of each input field in the form;
           function CallAjaxRegis() {
               var name = txtName.GetText();
               var surname = txtSurname.GetText()
               var email = txtEmail.GetText()
               var pwd = txtPwd.GetText()
               var company = txtCompany.GetText()
               var phone = txtPhone.GetText()
               var val = 'name=' + name + '&surname=' + surname + '&email=' + email + '&pwd=' + pwd + '&company=' + company + '&phone=' + phone;
               //alert(val);
               $.ajax({
                   url: 'ajax_register.aspx',
                   data: val,
                   type: "GET",
                   cache: false,
                   success: function (msg) {
                       //alert(msg);
                       if (msg == 1) {
                           alert('! อีเมล์นี้ถูกใช้งานแล้ว');
                           txtEmail.SetFocus(true);
                       } else {
                           PopRegister.Hide();
                           popupResult.Show();
                       }

                   }
               });
           }
           function getFormData(form) {
               var data = {};
               $(form).find('input, select').each(function () {
                   if (this.tagName.toLowerCase() == 'input') {
                       if (this.type.toLowerCase() == 'checkbox') {
                           data[this.name] = this.checked;
                       } else if (this.type.toLowerCase() != 'submit') {
                           data[this.name] = this.value;
                       }
                   } else {
                       data[this.name] = this.value;
                   }
               });
               return data;
           }

           // The "addFormError()" function, when called, adds the "error" class to the form-group that wraps around the "formRow" attribute;

           function addFormError(formRow, errorMsg) {
               var errorMSG = '<span class="error-msg">' + errorMsg + '</span>';
               $(formRow).parents('.form-group').addClass('has-error');
               $(formRow).parents('.form-group').append(errorMSG);
               $('#dialog').removeClass('dialog-effect-in');
               $('#dialog').addClass('shakeit');
               setTimeout(function () {
                   $('#dialog').removeClass('shakeit');
               }, 300);
           }

           // FORM HANDLER:

           // form_name - This attribute ties the form-handler function to the form you want to submit through ajax. Requires an ID (ex: #myfamousid)
           // custom_validation - 

           function form_handler(form_name, custom_validation, success_message, error_message, success_function, error_function) {
               $(form_name).find('input[type="submit"]').on('click', function (e) { // if submit button is clicked

                   window.onbeforeunload = null; // cancels the alert message for unsaved changes (if such function exists)

                   $(form_name).find('.form-group .error-msg').remove();
                   var submitButton = this;
                   submitButton.disabled = true; // Disables the submit buttton until the rows pass validation or we get a response from the server.

                   var form = $(form_name)[0];
                   // The custom validation function must return true or false.
                   if (custom_validation != null) {
                       if (!custom_validation(form, getFormData(form))) {
                           submitButton.disabled = false;
                           return false;
                       }
                   }
                   e.preventDefault(); //STOP default action
               });
               $(document).click(function (e) { // Whenever the user clicks inside the form, the error messages will be removed.
                   if ($(e.target).closest(form_name).length) {
                       $(form_name).find('.form-group').removeClass('has-error');
                       setTimeout(function () {
                           $(form_name).find('.form-group .error-msg').remove();
                       }, 300);
                   } else {
                       return
                   }
               });
           }

           // LOGIN FORM: Validation function
           function validate_login_form(form, data) {
               if (data.user_username == "") {
                   // if username variable is empty
                   addFormError(form["user_username"], 'The username is invalid');
                   return false; // stop the script if validation is triggered
               }

               if (data.user_password == "") {
                   // if password variable is empty
                   addFormError(form["user_password"], 'The password is invalid');
                   return false; // stop the script if validation is triggered
               }

               //$('#dialog').removeClass('dialog-effect-in').removeClass('shakeit');
               //$('#dialog').addClass('dialog-effect-out');

               //$('#successful_login').addClass('active');
               //return true;

               //alert(data.user_username + "---" + data.user_password);
               var username = data.user_username;
               var password = data.user_password;
               //var val = 'usrname=' + username + '&pwd=' + password;
               var val = 'prm=' + username + '@' + password;

               //alert(val);
               $.ajax({
                   url: 'chk_login.aspx',
                   data: val,
                   type: "GET",
                   cache: false,
                   success: function (msg) {
                       //alert(msg);
                       if (msg == '1') {
                           location.href = "Default.aspx"; // อยู่ที่หน้าเดิม
                       } else {
                           lbCheck.SetClientVisible(true);
                           lbCheck.SetText("Username and password invalid !");
                           //alert("Username and password invalid !");
                       }
                   }
               });
           }

           // REGISTRATION FORM: Validation function
           function validate_registration_form(form, data) {
               if (data.user_username == "") {
                   // if username variable is empty
                   addFormError(form["user_username"], 'The username is invalid');
                   return false; // stop the script if validation is triggered
               }

               if (data.user_password == "") {
                   // if password variable is empty
                   addFormError(form["user_password"], 'The password is invalid');
                   return false; // stop the script if validation is triggered
               }

               if (data.user_cnf_password == "" || data.user_password != data.user_cnf_password) {
                   // if password variable is empty
                   addFormError(form["user_cnf_password"], "The passwords don't match");
                   return false; // stop the script if validation is triggered
               }

               if (!data.user_terms) {
                   // if password variable is empty
                   addFormError(form["user_terms"], "You need to read and accept the Terms and Conditions before proceeding");
                   return false; // stop the script if validation is triggered
               }

               $('#dialog').removeClass('dialog-effect-in').removeClass('shakeit');
               $('#dialog').addClass('dialog-effect-out');

               $('#successful_registration').addClass('active');
               //return true;
           }

           form_handler("#login_form", validate_login_form, null, null, null, null, null, null);
           form_handler("#register_form", validate_registration_form, null, null, null, null, null, null);

           var dialogBox = $('#dialog');

           dialogBox.on('click', 'a.user-actions', function () {
               dialogBox.toggleClass('flip');
           });

           $('#successful_login,#successful_registration').on('click', 'a.dialog-reset', function () {
               $('#successful_login,#successful_registration').removeClass('active');
               dialogBox.removeClass('dialog-effect-out').addClass('dialog-effect-in');
               document.getElementById('login_form').reset();
               document.getElementById('register_form').reset();
           });
    </script>
</body>
</html>
