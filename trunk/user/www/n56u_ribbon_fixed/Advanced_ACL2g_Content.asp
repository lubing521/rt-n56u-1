<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="icon" href="images/favicon.png">

<title>ASUS Wireless Router <#Web_Title#> - <#menu5_1_4#></title>
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/main.css">

<script type="text/javascript" src="/jquery.js"></script>
<script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
<script language="JavaScript" type="text/javascript" src="/state.js"></script>
<script language="JavaScript" type="text/javascript" src="/help_2g.js"></script>
<script language="JavaScript" type="text/javascript" src="/general_2g.js"></script>
<script language="JavaScript" type="text/javascript" src="/popup.js"></script>
<script language="JavaScript" type="text/javascript" src="/client_function.js"></script>
<script language="JavaScript" type="text/javascript" src="/detect.js"></script>
<script>

var $j = jQuery.noConflict();

<% login_state_hook(); %>

var client_mac = login_mac_str();
var smac = client_mac.split(":");

var leases = [<% dhcp_leases(); %>];	// [[hostname, MAC, ip, lefttime], ...]
var wireless = [<% wl_auth_list(); %>];	// [[MAC, associated, authorized], ...]
var ipmonitor = [<% get_static_client(); %>];	// [[IP, MAC, DeviceName, Type, http, printer, iTune], ...]
var clients_info = getclients(1);

var ACLList = [<% get_nvram_list("DeviceSecurity11b", "rt_ACLList"); %>];

var over_var = 0;
var isMenuopen = 0;

function initial(){
	show_banner(1);

	show_menu(5,1,4);

	show_footer();

	showACLList();
	showLANIPList();
}

function applyRule(){
	if(prevent_lock()){
		showLoading();
		document.form.action_mode.value = " Restart ";
		document.form.current_page.value = "/Advanced_ACL2g_Content.asp";
		document.form.next_page.value = "";
		document.form.submit();
	}
	else
		return false;
}

function prevent_lock(){
	if(document.form.rt_macmode.value == "allow"){
		if(document.form.rt_macnum_x_0.value < 1){
			if(confirm("<#FirewallConfig_MFList_accept_hint1#>")){
				document.form.rt_maclist_x_0.value = smac[0] + smac[1] + smac[2] + smac[3] + smac[4] + smac[5];
				document.form.rt_macdesc_x_0.value = "";
				markGroupACL(document.form.rt_ACLList2, 32, ' Add ');
				document.form.submit();
			}
			else
				return false;
		}
		else
			return true;
	}
	else
		return true;
}

function setClientMAC(num){
	document.form.rt_maclist_x_0.value = clients_info[num][2];
	document.form.rt_macdesc_x_0.value = clients_info[num][0];
	hideClients_Block();
	over_var = 0;
}

function showLANIPList(){
	var code = "";
	var show_name = "";
	
	for(var i = 0; i < clients_info.length ; i++){
		if(clients_info[i][3] != 10)
			continue;
		
		if(clients_info[i][0] && clients_info[i][0].length > 20)
			show_name = clients_info[i][0].substring(0, 18) + "..";
		else
			show_name = clients_info[i][0];
		
		if(clients_info[i][2]){
			code += '<a href="javascript:void(0)"><div onmouseover="over_var=1;" onmouseout="over_var=0;" onclick="setClientMAC('+i+');"><strong>'+clients_info[i][1]+'</strong>';
			code += ' ['+clients_info[i][2]+']';
			if(show_name && show_name.length > 0)
				code += ' ('+show_name+')';
			code += ' </div></a>';
		}
	}
	if (code == "")
		code = '<div style="text-align: center;" onclick="hideClients_Block();"><#Nodata#></div>';
	code +='<!--[if lte IE 6.5]><iframe class="hackiframe2"></iframe><![endif]-->';	
	$("ClientList_Block").innerHTML = code;
}

function hideClients_Block(){
	$j("#chevron").children('i').removeClass('icon-chevron-up').addClass('icon-chevron-down');
	$('ClientList_Block').style.display='none';
	isMenuopen = 0;
}

function pullLANIPList(obj){
	if(isMenuopen == 0){
		$j(obj).children('i').removeClass('icon-chevron-down').addClass('icon-chevron-up');
		$("ClientList_Block").style.display = 'block';
		document.form.rt_maclist_x_0.focus();
		isMenuopen = 1;
	}
	else
		hideClients_Block();
}

function validNewRow(max_rows) {
	if (document.form.rt_macnum_x_0.value >= max_rows){
		alert("<#JS_itemlimit1#> " + max_rows + " <#JS_itemlimit2#>");
		return false;
	}

	if (document.form.rt_maclist_x_0.value==""){
		alert("<#JS_fieldblank#>");
		document.form.rt_maclist_x_0.focus();
		document.form.rt_maclist_x_0.select();
		return false;
	}

	if (!validate_hwaddr(document.form.rt_maclist_x_0)){
		return false;
	}

	var mac_lower = document.form.rt_maclist_x_0.value.toLowerCase();

	for(i=0; i<ACLList.length; i++){
		if(mac_lower==ACLList[i][0].toLowerCase()) {
			alert('<#JS_duplicate#>' + ' (MAC: ' + ACLList[i][0] + ')' );
			document.form.rt_maclist_x_0.focus();
			document.form.rt_maclist_x_0.select();
			return false;
		}
	}

	return true;
}

function markGroupACL(o, c, b) {
	document.form.group_id.value = "rt_ACLList";
	if(b == " Add "){
		if (validNewRow(c) == false)
			return false;
	}
	pageChanged = 0;
	pageChangedCount = 0;
	document.form.action_mode.value = b;
	return true;
}

function showACLList(){
	var code = "";

	if(ACLList.length == 0) {
		code +='<tr><td colspan="3" style="text-align: center;"><div class="alert alert-info"><#IPConnection_VSList_Norule#></div></td></tr>';
	}
	else{
		for(var i = 0; i < ACLList.length; i++){
		    code +='<tr id="row' + i + '">';
		    code +='<td width="35%">' + ACLList[i][0] + '</td>';
		    code +='<td width="60%">' + ACLList[i][1] + '</td>';
		    code +='<td width="5%" style="text-align: center;"><input type="checkbox" name="rt_ACLList_s" value="' + i + '" onClick="changeBgColor(this,' + i + ');" id="check' + i + '"></td>';
		    code +='</tr>';
		}
		
		code += '<tr>';
		code += '<td colspan="2">&nbsp;</td>'
		code += '<td><button class="btn btn-danger" type="submit" onclick="return markGroupACL(this, 32, \' Del \');" name="rt_ACLList"><i class="icon icon-minus icon-white"></i></button></td>';
		code += '</tr>'
	}

	$j('#ACLList_Block').append(code);
}


function changeBgColor(obj, num){
	if(obj.checked)
		$("row" + num).style.background='#D9EDF7';
	else
		$("row" + num).style.background='whiteSmoke';
}

function done_validating(action){
	refreshpage();
}

</script>
<style>
#ClientList_Block{
    width: 380px;
    margin-top: 28px;
    position:absolute;
    text-align:left;
    height:auto;
    overflow-y:auto;
    padding: 1px;
    display:none;
}
#ClientList_Block div{
    height:20px;
    line-height:20px;
    text-decoration:none;
    padding-left:2px;
}
#ClientList_Block a{
    color:#000;
    font-size:12px;
    text-decoration:none;
}
#ClientList_Block div:hover, #ClientList_Block a:hover{
    cursor:default;
    color: #005580;
}
    .input-append{margin-bottom: 0px;}
    .input-append input{border-radius: 3px 0 0 3px;}
</style>
</head>

<body onload="initial();">

<div class="wrapper">
    <div class="container-fluid" style="padding-right: 0px">
        <div class="row-fluid">
            <div class="span3"><center><div id="logo"></div></center></div>
            <div class="span9" >
                <div id="TopBanner"></div>
            </div>
        </div>
    </div>

    <div id="Loading" class="popup_bg"></div>

    <iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>

    <form method="post" name="form" id="ruleForm" action="/start_apply.htm" target="hidden_frame">

    <input type="hidden" name="current_page" value="Advanced_ACL2g_Content.asp">
    <input type="hidden" name="next_page" value="">
    <input type="hidden" name="next_host" value="">
    <input type="hidden" name="sid_list" value="DeviceSecurity11b;">
    <input type="hidden" name="group_id" value="rt_ACLList">
    <input type="hidden" name="modified" value="0">
    <input type="hidden" name="action_mode" value="">
    <input type="hidden" name="first_time" value="">
    <input type="hidden" name="action_script" value="">
    <input type="hidden" name="preferred_lang" id="preferred_lang" value="<% nvram_get_x("LANGUAGE", "preferred_lang"); %>">
    <input type="hidden" name="firmver" value="<% nvram_get_x("",  "firmver"); %>">

    <input type="hidden" name="rt_macnum_x_0" value="<% nvram_get_x("", "rt_macnum_x"); %>" readonly="1" />

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span3">
                <!--Sidebar content-->
                <!--=====Beginning of Main Menu=====-->
                <div class="well sidebar-nav side_nav" style="padding: 0px;">
                    <ul id="mainMenu" class="clearfix"></ul>
                    <ul class="clearfix">
                        <li>
                            <div id="subMenu" class="accordion"></div>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="span9">
                <!--Body content-->
                <div class="row-fluid">
                    <div class="span12">
                        <div class="box well grad_colour_dark_blue">
                            <h2 class="box_head round_top"><#menu5_1#> - <#menu5_1_4#> (2.4GHz)</h2>
                            <div class="round_bottom">
                                <div class="row-fluid">
                                    <div id="tabMenu" class="submenuBlock"></div>
                                    <div class="alert alert-info" style="margin: 10px;"><#DeviceSecurity11a_display1_sectiondesc#></div>

                                    <table width="100%" align="center" cellpadding="4" cellspacing="0" class="table">
                                        <tr>
                                            <th width="50%" style="border-top: 0 none;">
                                                <a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,18,1);"><#FirewallConfig_MFMethod_itemname#></a>
                                            </th>
                                            <td style="border-top: 0 none;">
                                                <select name="rt_macmode" class="input"  onChange="return change_common(this, 'DeviceSecurity11b', 'rt_macmode')">
                                                    <option value="disabled" <% nvram_match_x("DeviceSecurity11b","rt_macmode", "disabled","selected"); %>><#CTL_Disabled#></option>
                                                    <option value="allow" <% nvram_match_x("DeviceSecurity11b","rt_macmode", "allow","selected"); %>><#FirewallConfig_MFMethod_item1#></option>
                                                    <option value="deny" <% nvram_match_x("DeviceSecurity11b","rt_macmode", "deny","selected"); %>><#FirewallConfig_MFMethod_item2#></option>
                                                </select>
                                            </td>
                                        </tr>
                                    </table>

                                    <table width="100%" align="center" cellpadding="4" cellspacing="0" class="table" id="ACLList_Block">
                                        <tr>
                                            <th colspan="3" style="background-color: #E3E3E3;"><#FirewallConfig_MFList_groupitemname#></th>
                                        </tr>
                                        <tr>
                                            <th width="35%"><#FirewallConfig_MFhwaddr_itemname#></th>
                                            <th width="60%"><#WIFIMacDesc#></th>
                                            <th width="5%">&nbsp;</th>
                                        </tr>
                                        <tr>
                                            <td width="35%">
                                                <div id="ClientList_Block" class="alert alert-info"></div>
                                                <div class="input-append">
                                                    <input type="text" maxlength="12" class="span12" size="12" name="rt_maclist_x_0" onKeyPress="return is_hwaddr()" style="float:left; width: 175px"/>
                                                    <button class="btn" id="chevron" style="border-radius: 0px 4px 4px 0px;" type="button" onclick="pullLANIPList(this);" title="Select the MAC of WiFi clients." onmouseover="over_var=1;" onmouseout="over_var=0;"><i class="icon icon-chevron-down"></i></button>
                                                </div>
                                            </td>
                                            <td width="60%">
                                                <input type="text" maxlength="32" class="span12" size="32" name="rt_macdesc_x_0" onKeyPress="return is_string(this)" />
                                            </td>
                                            <td width="5%">
                                                <button class="btn" style="max-width: 219px" type="submit" onclick="return markGroupACL(this, 32, ' Add ');" name="rt_ACLList2" value="<#CTL_add#>" size="12"><i class="icon icon-plus"></i></button>
                                            </td>
                                        </tr>
                                    </table>

                                    <table class="table">
                                        <tr>
                                            <td width="50%" style="margin-top: 10px;">
                                                <input class="btn btn-info" type="button" value="<#GO_5G#>" onclick="location.href='Advanced_ACL_Content.asp';">
                                            </td>
                                            <td>
                                                <input class="btn btn-primary" style="width: 219px" type="button" value="<#CTL_apply#>" onclick="applyRule()" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    </form>

    <!--==============Beginning of hint content=============-->
    <div id="help_td" style="position: absolute; margin-left: -10000px" valign="top">
        <form name="hint_form"></form>
        <div id="helpicon" onClick="openHint(0,0);"><img src="images/help.gif" /></div>

        <div id="hintofPM" style="display:none;">
            <table width="100%" cellpadding="0" cellspacing="1" class="Help" bgcolor="#999999">
            <thead>
                <tr>
                    <td>
                        <div id="helpname" class="AiHintTitle"></div>
                        <a href="javascript:;" onclick="closeHint()" ><img src="images/button-close.gif" class="closebutton" /></a>
                    </td>
                </tr>
            </thead>

                <tr>
                    <td valign="top" >
                        <div class="hint_body2" id="hint_body"></div>
                        <iframe id="statusframe" name="statusframe" class="statusframe" src="" frameborder="0"></iframe>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <!--==============Ending of hint content=============-->

    <div id="footer"></div>
</div>
</body>
</html>
