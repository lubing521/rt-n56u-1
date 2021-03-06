<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="icon" href="images/favicon.png">

<title>ASUS Wireless Router <#Web_Title#> - <#menu5_3_4#></title>
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/main.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/engage.itoggle.css">

<script type="text/javascript" src="/jquery.js"></script>
<script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/bootstrap/js/engage.itoggle.min.js"></script>
<script language="JavaScript" type="text/javascript" src="/state.js"></script>
<script type="text/javascript" language="JavaScript" src="/help.js"></script>
<script language="JavaScript" type="text/javascript" src="/general.js"></script>
<script language="JavaScript" type="text/javascript" src="/popup.js"></script>
<script language="JavaScript" type="text/javascript" src="/client_function.js"></script>
<script language="JavaScript" type="text/javascript" src="/detect.js"></script>
<script>
    var $j = jQuery.noConflict();
    $j(document).ready(function() {
        $j('#vts_enable_x_on_of').iToggle({
            easing: 'linear',
            speed: 70,
            onClickOn: function(){
                change_common_radio(this, 'IPConnection', 'vts_enable_x', '1')
                $j("#vts_enable_x_fake").attr("checked", "checked").attr("value", 1);
                $j("#vts_enable_x_1").attr("checked", "checked");
                $j("#vts_enable_x_0").removeAttr("checked");
            },
            onClickOff: function(){
                change_common_radio(this, 'IPConnection', 'vts_enable_x', '0')
                $j("#vts_enable_x_fake").removeAttr("checked").attr("value", 0);
                $j("#vts_enable_x_0").attr("checked", "checked");
                $j("#vts_enable_x_1").removeAttr("checked");
            }
        });
        $j("#vts_enable_x_on_of label.itoggle").css("background-position", $j("input#vts_enable_x_fake:checked").length > 0 ? '0% -27px' : '100% -27px');
    });

var wItem = new Array(new Array("", "", "TCP"),
						new Array("FTP", "21", "TCP"),
						new Array("SSH", "22", "TCP"),
						new Array("TELNET", "23", "TCP"),
						new Array("SMTP", "25", "TCP"),
						new Array("DNS", "53", "UDP"),
						new Array("FINGER", "79", "TCP"),
						new Array("HTTP", "80", "TCP"),
						new Array("POP3", "110", "TCP"),
						new Array("SNMP", "161", "UDP"),
						new Array("SNMP TRAP", "162", "UDP"));

var wItem2 = new Array(new Array("", "", "TCP"),
						new Array("Age of Empires", "2302:2400,6073", "BOTH"),
						new Array("BitTorrent", "6881:6889", "TCP"),
						new Array("Transmission", "51413", "BOTH"),
						new Array("Counter Strike(TCP)", "27030:27039", "TCP"),
						new Array("Counter Strike(UDP)", "27000:27015,1200", "UDP"),
						new Array("PlayStation2", "4658,4659", "BOTH"),
						new Array("Warcraft III", "6112:6119,4000", "BOTH"),
						new Array("WOW", "3724", "BOTH"),
						new Array("Xbox Live", "3074", "BOTH"));

<% login_state_hook(); %>

var client_ip = login_ip_str();
var client_mac = login_mac_str();

var leases = [<% dhcp_leases(); %>];	// [[hostname, MAC, ip, lefttime], ...]
var wireless = [<% wl_auth_list(); %>];	// [[MAC, associated, authorized], ...]
var ipmonitor = [<% get_static_client(); %>];	// [[IP, MAC, DeviceName, Type, http, printer, iTune], ...]
var clients_info = getclients();

var VSList = [<% get_nvram_list("IPConnection", "VSList"); %>];

var over_var = 0;
var isMenuopen = 0;

function initial(){
	show_banner(2);
	show_menu(5,4,2);
	show_footer();
	
	loadAppOptions();
	loadGameOptions();
	
	change_proto();
	
	showLANIPList();
	showVSList();
}

function applyRule(){
	showLoading();
	
	document.form.action_mode.value = " Restart ";
	document.form.next_page.value = "";

	document.form.submit();
}

function done_validating(action){
	if(action == " Add "){
		split_vts_rule();
	}
	else
		refreshpage();
}

function loadAppOptions(){
	free_options(document.form.KnownApps);
	add_option(document.form.KnownApps, "<#Select_menu_default#>", 0, 1);
	for(var i = 1; i < wItem.length; i++)
		add_option(document.form.KnownApps, wItem[i][0], i, 0);
}

function loadGameOptions(){
	free_options(document.form.KnownGames);
	add_option(document.form.KnownGames, "<#Select_menu_default#>", 0, 1);
	for(var i = 1; i < wItem2.length; i++)
		add_option(document.form.KnownGames, wItem2[i][0], i, 0);
}

function change_proto(){
	if (document.form.vts_proto_x_0.value == "OTHER")
		inputCtrl(document.form.vts_protono_x_0, 1);
	else
		inputCtrl(document.form.vts_protono_x_0, 0);
}

function change_wizard(o, id){
	if(id == "KnownApps"){
		$("KnownGames").value = 0;
		
		for(var i = 0; i < wItem.length; ++i){
					if(wItem[i][0] != null && o.value == i){
							if(wItem[i][2] == "TCP")
								document.form.vts_proto_x_0.options[0].selected = 1;
							else if(wItem[i][2] == "UDP")
								document.form.vts_proto_x_0.options[1].selected = 1;
							else if(wItem[i][2] == "BOTH")
								document.form.vts_proto_x_0.options[2].selected = 1;
							else
								document.form.vts_proto_x_0.options[3].selected = 1;
						
						document.form.vts_ipaddr_x_0.value = client_ip;
						document.form.vts_port_x_0.value = wItem[i][1];
						document.form.vts_desc_x_0.value = wItem[i][0]+" Server";
						break;
					}
		}
		
		document.form.vts_lport_x_0.value = "";
	}
	else if(id == "KnownGames"){
		$("KnownApps").value = 0;
		
		for(var i = 0; i < wItem2.length; ++i){
			if(wItem2[i][0] != null && o.value == i){
				if(wItem2[i][2] == "TCP")
					document.form.vts_proto_x_0.options[0].selected = 1;
				else if(wItem2[i][2] == "UDP")
					document.form.vts_proto_x_0.options[1].selected = 1;
				else if(wItem2[i][2] == "BOTH")
					document.form.vts_proto_x_0.options[2].selected = 1;
				else
					document.form.vts_proto_x_0.options[3].selected = 1;
				
				document.form.vts_ipaddr_x_0.value = client_ip;
				document.form.vts_port_x_0.value = wItem2[i][1];
				document.form.vts_desc_x_0.value = wItem2[i][0];
				
				break;
			}
		}
	}
}

/*-----------------------------------------------------------------
Old markGroup in general.js, change to single page at 2008/04/10
------------------------------------------------------------------*/
function markGroup2(o, s, c, b) {
	document.form.group_id.value = s;
	if(b == " Add "){
		if (document.form.vts_num_x_0.value >= c){  //vts_num_x_0: number of virtual server
			alert("<#JS_itemlimit1#> " + c + " <#JS_itemlimit2#>");
			return false;
		}else if (document.form.vts_ipaddr_x_0.value==""){
			alert("<#JS_fieldblank#>");
			document.form.vts_ipaddr_x_0.focus();
			document.form.vts_ipaddr_x_0.select();
			return false;
		}else if(document.form.vts_port_x_0.value=="" && document.form.vts_proto_x_0.value != "OTHER"){
			alert("<#JS_fieldblank#>");
			document.form.vts_port_x_0.focus();
			document.form.vts_port_x_0.select();
			return false;
		}else if (document.form.vts_proto_x_0.value == "OTHER"){
			if (!validate_ipaddr(document.form.vts_ipaddr_x_0, "") ||
					!validate_range(document.form.vts_protono_x_0, 0, 255)) return false;
			else if (document.form.vts_protono_x_0.value==""){
				alert("<#JS_fieldblank#>");
				document.form.vts_protono_x_0.focus();
				return false;
			}
			
			for(i=0; i< VSList.length; i++){
				if (VSList[i][3] == 'OTHER' && VSList[i][4] == document.form.vts_protono_x_0.value) {
					alert('<#JS_duplicate#>' + ' (Protocol ' + VSList[i][4] + ')' );
					document.form.vts_protono_x_0.focus();
					document.form.vts_protono_x_0.select();
					return false;
				}
			}
			
			document.form.vts_port_x_0.value = "";
		}else{
				if (!validate_ipaddr(document.form.vts_ipaddr_x_0, "") ||
						!validate_portrange(document.form.vts_port_x_0, "") ||
						!validate_range_sp(document.form.vts_lport_x_0, 1, 65535)) return false;
				else if (document.form.vts_port_x_0.value==""){ 
						alert("<#JS_fieldblank#>");
						document.form.vts_port_x_0.focus();
						return false;
				}else{
					for(i=0; i< VSList.length; i++){
						if ((VSList[i][3] != 'OTHER') && 
						    (VSList[i][3] == 'BOTH' || document.form.vts_proto_x_0.value == 'BOTH' ||
						     VSList[i][3] == document.form.vts_proto_x_0.value) ) {
							if(document.form.vts_port_x_0.value == VSList[i][0]){
									alert('<#JS_duplicate#>' + ' (Port ' + VSList[i][0] + ')' );
									document.form.vts_port_x_0.focus();
									document.form.vts_port_x_0.select();
									return false;
							}
							if(!(portrange_min(document.form.vts_port_x_0.value, 11) > portrange_max(VSList[i][0], 11) ||
									portrange_max(document.form.vts_port_x_0.value, 11) < portrange_min(VSList[i][0], 11))){
									alert('<#JS_duplicate#>' + ' (Ports ' + VSList[i][0] + ')' );
									document.form.vts_port_x_0.focus();
									document.form.vts_port_x_0.select();
									return false;
							}
						}
					}
				}
				
				var vts_port_array = new Array();
				document.form.vts_protono_x_0.value = "";
		}
	}
	pageChanged = 0;
	pageChangedCount = 0;
	document.form.action_mode.value = b;
	return true;
}

var vts_rule_array = new Array();
var count = 0;
function split_vts_rule(s){
	var count_dup = 0;
	
	if(typeof(s) != "undefined"){
		this.vts_rule_array = s;
	}
	if(this.vts_rule_array.length <= 0){
		refreshpage();
		return;
	}
	else{
		document.form.vts_port_x_0.value = this.vts_rule_array[0];
		this.vts_rule_array.shift();
	}
	
	for(i=0; i< VSList.length; i++){
		if(entry_cmp(VSList[i][3].toLowerCase(), document.form.vts_proto_x_0.value.toLowerCase(), 5)==0){
			if(!(portrange_min(document.form.vts_port_x_0.value, 11) > portrange_max(VSList[i][0], 11) ||
				portrange_max(document.form.vts_port_x_0.value, 11) < portrange_min(VSList[i][0], 11))){
				count_dup = count_dup + 1;
			}
			if(entry_cmp(VSList[i][1], document.form.vts_ipaddr_x_0.value.toLowerCase(), 15)==0){
				if(document.form.vts_lport_x_0.value.length!=0){
					if(entry_cmp(VSList[i][2], "", 5)==0){
						if(!(portrange_min(document.form.vts_lport_x_0.value, 5) > portrange_max(VSList[i][0], 11) || portrange_max(document.form.vts_lport_x_0.value, 5) < portrange_min(VSList[i][0], 11))){
							count_dup = count_dup + 1;
						}
					}
					else{
						if(portrange_min(document.form.vts_lport_x_0.value,5) == portrange_min(VSList[i][2], 5)){
							count_dup = count_dup + 1;
						}
					}
				}
				else{
					if(entry_cmp(VSList[i][2], "", 5)==0){
						if(!(portrange_min(document.form.vts_port_x_0.value, 11) > portrange_max(VSList[i][0], 11) ||
				         	  	portrange_max(document.form.vts_port_x_0.value, 11) < portrange_min(VSList[i][0], 11))){
							count_dup = count_dup + 1;
						}
					}
					else{
						if(!(portrange_min(document.form.vts_port_x_0.value, 11) > portrange_min(VSList[i][2], 5) ||
							portrange_max(document.form.vts_port_x_0.value, 11) < portrange_min(VSList[i][2], 5))){
								count_dup = count_dup + 1;
						}
					}
				}
			}
		}
	}
	
	if (count_dup != "0"){
		alert('<#JS_duplicate#>');
		split_vts_rule();
	}
	else{
		document.form.action = "/start_apply.htm";
		document.form.target = "hidden_frame";
		document.form.action_mode.value = " Add ";
		document.form.current_page.value = "";
		document.form.next_page.value = "";
		document.form.submit();
	}
}

function setClientIP(num){
	document.form.vts_ipaddr_x_0.value = clients_info[num][1];
	hideClients_Block();
	over_var = 0;
}

function showLANIPList(){
	var code = "";
	var show_name = "";
	
	for(var i = 0; i < clients_info.length ; i++){
		if(clients_info[i][0] && clients_info[i][0].length > 20)
			show_name = clients_info[i][0].substring(0, 18) + "..";
		else
			show_name = clients_info[i][0];
		
		if(clients_info[i][1]){
			code += '<a href="javascript:void(0)"><div onmouseover="over_var=1;" onmouseout="over_var=0;" onclick="setClientIP('+i+');"><strong>'+clients_info[i][1]+'</strong>';
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

function pullLANIPList(obj){
	
	if(isMenuopen == 0){
		$j(obj).children('i').removeClass('icon-chevron-down').addClass('icon-chevron-up');
		$("ClientList_Block").style.display = 'block';
		document.form.vts_ipaddr_x_0.focus();
		isMenuopen = 1;
	}
	else
		hideClients_Block();
}

function hideClients_Block(){
	$j("#chevron").children('i').removeClass('icon-chevron-up').addClass('icon-chevron-down');
	$('ClientList_Block').style.display='none';
	isMenuopen = 0;
}

function showVSList(){
	var code = "";

	if(VSList.length == 0)
		code +='<tr><td colspan="7" style="text-align: center;"><div class="alert alert-info"><#IPConnection_VSList_Norule#></div></td></tr>';
	else{
		for(var i = 0; i < VSList.length; i++){
		code +='<tr id="row' + i + '">';
		code +='<td><div>'+ VSList[i][5] + '</td>';			//desp
		code +='<td width="15%">'+ VSList[i][0] + '</td>';	//Port  range
		code +='<td width="23%">'+ VSList[i][1] + '</td>';	//local IP
		code +='<td width="10%">' + VSList[i][2] + '</td>';	//local port
		code +='<td width="12%">' + VSList[i][3] + '</td>';	//proto
		code +='<td width="10%">' + VSList[i][4] + '</td>';	//proto no
		code +='<td width="5%" style="text-align: center;"><input type="checkbox" name="VSList_s" value="' + i + '" onClick="changeBgColor(this,' + i + ');" id="check' + i + '"></td>';
		code +='</tr>';
		}

		code += '<tr>';
		code += '<td colspan="6">&nbsp;</td>'
		code += '<td><button class="btn btn-danger" type="submit" onclick="markGroup2(this, \'VSList\', 64,\' Del \');" name="VSList"><i class="icon icon-minus icon-white"></i></button></td>';
		code += '</tr>'
	}

	$j('#VSList_Block').append(code);
}

function changeBgColor(obj, num){
	if(obj.checked)
		$("row" + num).style.background='#D9EDF7';
	else
		$("row" + num).style.background='whiteSmoke';
}
</script>

<style>
#ClientList_Block{
	width: 300px;
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

<body onload="initial();" onunLoad="return unload_body();">

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

    <form method="post" name="form" action="/start_apply.htm" target="hidden_frame" >
    <input type="hidden" name="productid" value="<% nvram_get_f("general.log","productid"); %>">
    <input type="hidden" name="current_page" value="Advanced_VirtualServer_Content.asp">
    <input type="hidden" name="next_page" value="">
    <input type="hidden" name="next_host" value="">
    <input type="hidden" name="sid_list" value="IPConnection;">
    <input type="hidden" name="group_id" value="VSList">
    <input type="hidden" name="modified" value="0">
    <input type="hidden" name="action_mode" value="">
    <input type="hidden" name="first_time" value="">
    <input type="hidden" name="action_script" value="">
    <input type="hidden" name="preferred_lang" id="preferred_lang" value="<% nvram_get_x("LANGUAGE", "preferred_lang"); %>">
    <input type="hidden" name="firmver" value="<% nvram_get_x("",  "firmver"); %>">

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
                            <h2 class="box_head round_top"><#t1NAT#> - <#menu5_3_4#></h2>
                            <div class="round_bottom">
                                <div class="row-fluid">
                                    <div id="tabMenu" class="submenuBlock"></div>
                                    <div class="alert alert-info" style="margin: 10px;"><#IPConnection_VServerEnable_sectiondesc#><br/>1. <#FirewallConfig_Port80_itemdesc#><br/>2. <#FirewallConfig_FTPPrompt_itemdesc#></div>

                                    <table width="100%" cellpadding="4" cellspacing="0" class="table">
                                        <tr>
                                            <th width="50%"><#IPConnection_VServerEnable_itemname#>
                                                <input type="hidden" name="vts_num_x_0" value="<% nvram_get_x("IPConnection", "vts_num_x"); %>" readonly="1" />
                                            </th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="vts_enable_x_on_of">
                                                        <input type="checkbox" id="vts_enable_x_fake" <% nvram_match_x("", "vts_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "vts_enable_x", "0", "value=0"); %>>
                                                    </div>
                                                </div>

                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" value="1" name="vts_enable_x" id="vts_enable_x_1" class="content_input_fd" onclick="return change_common_radio(this, 'IPConnection', 'vts_enable_x', '1')" <% nvram_match_x("IPConnection","vts_enable_x", "1", "checked"); %>/><#checkbox_Yes#>
                                                    <input type="radio" value="0" name="vts_enable_x" id="vts_enable_x_0" class="content_input_fd" onclick="return change_common_radio(this, 'IPConnection', 'vts_enable_x', '0')" <% nvram_match_x("IPConnection","vts_enable_x", "0", "checked"); %>/><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><#IPConnection_VSList_groupitemdesc#></th>
                                            <td id="VSList">
                                                <select name="KnownApps" id="KnownApps" class="input" onchange="change_wizard(this, 'KnownApps');"></select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><#IPConnection_VSList_gameitemdesc#></th>
                                            <td id="VSGameList">
                                                <select name="KnownGames" id="KnownGames" class="input" onchange="change_wizard(this, 'KnownGames');"></select>
                                            </td>
                                        </tr>
                                    </table>

                                    <table width="100%" cellpadding="4" cellspacing="0" class="table" id="VSList_Block">
                                        <tr>
                                            <th colspan="7" style="background-color: #E3E3E3;"><#IPConnection_VSList_title#></th>
                                        </tr>
                                        <tr>
                                            <th><#IPConnection_VServerDescript_itemname#></th>
                                            <th width="15%"><#IPConnection_VServerPort_itemname#></th>
                                            <th width="23%"><#IPConnection_VServerIP_itemname#></th>
                                            <th width="10%"><#IPConnection_VServerLPort_itemname#></th>
                                            <th width="12%"><#IPConnection_VServerProto_itemname#></th>
                                            <th width="10%"><#IPConnection_VServerPNo_itemname#></th>
                                            <th width="5%">&nbsp;</th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="text" size="12" maxlength="30" name="vts_desc_x_0" class="span12" onkeypress="return is_string(this)" />
                                            </td>
                                            <td>
                                                <input type="text" size="10" class="span12" name="vts_port_x_0" onkeypress="return is_portrange(this)" />
                                            </td>
                                            <td>
                                                <div id="ClientList_Block" class="alert alert-info"></div>
                                                <div class="input-append">
                                                    <input type="text" size="12" maxlength="15" name="vts_ipaddr_x_0" onkeypress="return is_ipaddr(this)" onkeyup="change_ipaddr(this)" autocomplete="off" style="float:left; width: 94px"/>
                                                    <button class="btn" id="chevron" style="border-radius: 0px 4px 4px 0px;" type="button" onclick="pullLANIPList(this);" title="Select the IP of LAN clients." onmouseover="over_var=1;" onmouseout="over_var=0;"><i class="icon icon-chevron-down"></i></button>
                                                </div>
                                            </td>
                                            <td>
                                                <input type="text" maxlength="5" size="5" class="span12" name="vts_lport_x_0" onkeypress="return is_number(this)" />
                                            </td>
                                            <td>
                                                <select name="vts_proto_x_0" class="span12" onchange="change_proto()">
                                                    <option value="TCP">TCP</option>
                                                    <option value="UDP">UDP</option>
                                                    <option value="BOTH">BOTH</option>
                                                    <option value="OTHER">OTHER</option>
                                                </select>
                                            </td>
                                            <td>
                                                <input type="text" class="span12" maxlength="3" size="3" name="vts_protono_x_0" onkeypress="return is_number(this)" />
                                            </td>
                                            <td>
                                                <button class="btn" type="submit" onclick="return markGroup2(this, 'VSList', 64, ' Add ');" name="VSList2"><i class="icon icon-plus"></i></button>
                                            </td>
                                        </tr>
                                    </table>

                                    <table class="table">
                                        <tr>
                                            <td style="border: 0 none;"><center><input name="button" type="button" class="btn btn-primary"  style="width: 219px" onclick="applyRule();" value="<#CTL_apply#>"/></center></td>
                                        </tr>
                                    </table>
                                    <!-- <div id=VSList_Block></div> -->
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
