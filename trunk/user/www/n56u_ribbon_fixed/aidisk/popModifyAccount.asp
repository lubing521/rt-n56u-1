<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="icon" href="images/favicon.png">
<title>Mod New Account</title>
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/main.css">

<script type="text/javascript" src="../state.js"></script>
<script type="text/javascript">
var selectedAccount = parent.getSelectedAccount();

function initial(){
	$("new_account").value = selectedAccount;
	
	showtext($("selected_account"), selectedAccount);
	
	clickevent();
}

function clickevent(){
	$("Submit").onclick = function(){
			if(validForm()){
				$("account").value = selectedAccount;
				
				parent.showLoading();
				document.modifyAccountForm.submit();
				parent.hidePop("apply");
			}
		};
}

function validForm(){
	if($("new_account").value.length > 0)
		$("new_account").value = trim($("new_account").value);
	if($("new_password").value.length > 0)
		$("new_password").value = trim($("new_password").value);
	$("confirm_password").value = trim($("confirm_password").value);
	
	// new_account name
	if($("new_account").value.length > 0){
		if(trim($("new_account").value).length > 20){
			alert("<#File_Pop_content_alert_desc3#>");
			$("new_account").focus();
			return false;
		}
		
		var re = new RegExp("[^a-zA-Z0-9-]+","gi");
		if(re.test($("new_account").value)){
			alert("<#File_Pop_content_alert_desc4#>");
			$("new_account").focus();
			return false;
		}
		
		if(checkDuplicateName($("new_account").value, parent.get_accounts()) &&
				$("new_account").value != selectedAccount){
			alert("<#File_Pop_content_alert_desc5#>");
			$("new_account").focus();
			return false;
		}
	}
	
	// password
	if($("new_password").value != $("confirm_password").value){
		alert("<#File_Pop_content_alert_desc7#>");
		
		if($("new_password").value.length <= 0)
			$("new_password").focus();
		else
			$("confirm_password").focus();
		return false;
	}
	
	if($("new_account").value.length <= 0 && $("new_password").value.length <= 0){
		alert("並無輸入新的帳號或新的密碼!!"); /*2009 Need Translation Lock*/
		
		return false;
	}
		
	return true;
}

function checkDuplicateName(newname, teststr){
	var existing_string = teststr.join(',');
	existing_string = "," + existing_string + ",";
	var newstr = "," + trim(newname) + ","; 

	var re = new RegExp(newstr,"gi")
	var matchArray =  existing_string.match(re);
	if (matchArray != null)
		return true;
	else
		return false;
}
</script>
</head>

<body style="background: 0 none;"  onLoad="initial();">
<form method="post" name="modifyAccountForm" action="modify_account.asp" target="hidden_frame">
<input name="account" id="account" type="hidden" value="">
	<table width="90%" class="table well aidisk_table" cellpadding="0" cellspacing="0">
	<thead>
    <tr>
        <td width="95%">
            <h4><#ModAccountTitle#></h4> <span id="selected_account"></span>
        </td>
        <td style="text-align: right">
            <a href="javascript:void(0)" onclick="parent.hidePop('OverlayMask');"><i class="icon icon-remove"></i></a>
        </td>
      </tr>
    </thead>	
	<tbody>
    <tr valign="middle">
      <td height="30" colspan="2" class="hint_word"><#ModAccountAlert#></td>
    </tr>
    <tr>
      <th width=50%><#AiDisk_Account#>: </th>
      <td ><input class="input" name="new_account" id="new_account" type="text" maxlength="20"></td>
    </tr>
    <tr>
      <th><#ModAccountPassword#>: </th>
      <td><input class="input" name="new_password" id="new_password" type="password" maxlength="20"></td>
    </tr>
    <tr>
      <th><#Confirmpassword#>: </th>
      <td><input class="input" id="confirm_password" type="password" maxlength="20"></td>
    </tr>
	</tbody>	
    <tr>
      <th colspan="2" style="text-align: center"><input id="Submit" type="button" class="btn btn-primary" value="<#CTL_modify#>"></th>
    </tr>
  </table>
</form>
</body>
</html>
