<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="icon" href="images/favicon.png">
<title>ASUS Wireless Router <#Web_Title#> - <#menu5_5_4#></title>
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/main.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/engage.itoggle.css">

<script type="text/javascript" src="/jquery.js"></script>
<script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/bootstrap/js/engage.itoggle.min.js"></script>
<script language="JavaScript" type="text/javascript" src="/state.js"></script>
<script language="JavaScript" type="text/javascript" src="/general.js"></script>
<script language="JavaScript" type="text/javascript" src="/popup.js"></script>
<script language="JavaScript" type="text/javascript" src="/help.js"></script>
<script language="JavaScript" type="text/javascript" src="/detect.js"></script>

<script>
    var $j = jQuery.noConflict();
    $j(document).ready(function() {
        $j('#fw_lw_enable_x_on_of').iToggle({
            easing: 'linear',
            speed: 70,
            onClickOn: function(){
                $j("#fw_lw_enable_x_fake").attr("checked", "checked").attr("value", 1);
                $j("#fw_lw_enable_x_11").attr("checked", "checked");
                $j("#fw_lw_enable_x_00").removeAttr("checked");
                enable_lw();
            },
            onClickOff: function(){
                $j("#fw_lw_enable_x_fake").removeAttr("checked").attr("value", 0);
                $j("#fw_lw_enable_x_00").attr("checked", "checked");
                $j("#fw_lw_enable_x_11").removeAttr("checked");
                enable_lw();
            }
        });
        $j("#fw_lw_enable_x_on_of label.itoggle").css("background-position", $j("input#fw_lw_enable_x_fake:checked").length > 0 ? '0% -27px' : '100% -27px');

        $j('#fw_lw_enable_x_1_on_of').iToggle({
            easing: 'linear',
            speed: 70,
            onClickOn: function(){
                $j("#fw_lw_enable_x_1_fake").attr("checked", "checked").attr("value", 1);
                $j("#fw_lw_enable_x_1_1").attr("checked", "checked");
                $j("#fw_lw_enable_x_1_0").removeAttr("checked");
                enable_lw_1();
            },
            onClickOff: function(){
                $j("#fw_lw_enable_x_1_fake").removeAttr("checked").attr("value", 0);
                $j("#fw_lw_enable_x_1_0").attr("checked", "checked");
                $j("#fw_lw_enable_x_1_1").removeAttr("checked");
                enable_lw_1();
            }
        });
        $j("#fw_lw_enable_x_1_on_of label.itoggle").css("background-position", $j("input#fw_lw_enable_x_1_fake:checked").length > 0 ? '0% -27px' : '100% -27px');
    });
</script>

<script>

<% login_state_hook(); %>

function initial(){
	show_banner(1);
	show_menu(5,6,5);
	show_footer();
	
	enable_auto_hint(10, 5);
	enable_lw();
	enable_lw_1();
	load_body();
}

function applyRule(){
	if(validForm()){
		updateDateTime(document.form.current_page.value);
		
		showLoading();
		
		document.form.action_mode.value = " Restart ";
		document.form.current_page.value = "/Advanced_Firewall_Content.asp";
		document.form.next_page.value = "";
		
		document.form.submit();
	}
}

var LWFilterList = [<% get_nvram_list("FirewallConfig", "LWFilterList"); %>];

function validForm(){
	
	
	if((document.form.fw_lw_enable_x[0].checked ==true || document.form.fw_lw_enable_x_1[0].checked ==true ) 
		&& (document.form.filter_lw_date_x_Sun.checked ==false)
		&& (document.form.filter_lw_date_x_Mon.checked ==false)
		&& (document.form.filter_lw_date_x_Tue.checked ==false)
		&& (document.form.filter_lw_date_x_Wed.checked ==false)
		&& (document.form.filter_lw_date_x_Thu.checked ==false)
		&& (document.form.filter_lw_date_x_Fri.checked ==false)
		&& (document.form.filter_lw_date_x_Sat.checked ==false)){
			alert("<#FirewallConfig_LanWanActiveDate_itemname#><#JS_fieldblank#>");
			document.form.fw_lw_enable_x[0].checked=false;
			document.form.fw_lw_enable_x[1].checked=true;
			return false;
	}	
	
if(document.form.fw_lw_enable_x[0].checked == 1){
	if(!validate_timerange(document.form.filter_lw_time_x_starthour, 0)
			|| !validate_timerange(document.form.filter_lw_time_x_startmin, 1)
			|| !validate_timerange(document.form.filter_lw_time_x_endhour, 2)
			|| !validate_timerange(document.form.filter_lw_time_x_endmin, 3)
			){	return false; }

	var starttime = eval(document.form.filter_lw_time_x_starthour.value + document.form.filter_lw_time_x_startmin.value);
	var endtime = eval(document.form.filter_lw_time_x_endhour.value + document.form.filter_lw_time_x_endmin.value);
	
	if(starttime > endtime){
		alert("<#FirewallConfig_URLActiveTime_itemhint#>");
		document.form.filter_lw_time_x_startmin.value="00";
		document.form.filter_lw_time_x_starthour.value="00";
		return false;  
	}else if(starttime == endtime){
		alert("<#FirewallConfig_URLActiveTime_itemhint2#>");
		document.form.filter_lw_time_x_startmin.value="00";
		document.form.filter_lw_time_x_starthour.value="00";
		return false;  
	}

}

if(document.form.fw_lw_enable_x_1[0].checked == 1){
	if(!validate_timerange(document.form.filter_lw_time_x_1_starthour, 0)
			|| !validate_timerange(document.form.filter_lw_time_x_1_startmin, 1)
			|| !validate_timerange(document.form.filter_lw_time_x_1_endhour, 2)
			|| !validate_timerange(document.form.filter_lw_time_x_1_endmin, 3)
			){	return false; }

	var starttime_1 = eval(document.form.filter_lw_time_x_1_starthour.value + document.form.filter_lw_time_x_1_startmin.value);
	var endtime_1 = eval(document.form.filter_lw_time_x_1_endhour.value + document.form.filter_lw_time_x_1_endmin.value);
	
	if(starttime_1 > endtime_1){
		alert("<#FirewallConfig_URLActiveTime_itemhint#>");
		document.form.filter_lw_time_x_1_startmin.value="00";
		document.form.filter_lw_time_x_1_starthour.value="00";
		return false;  
	}else	if(starttime_1 == endtime_1){
		alert("<#FirewallConfig_URLActiveTime_itemhint2#>");
		document.form.filter_lw_time_x_1_startmin.value="00";
		document.form.filter_lw_time_x_1_starthour.value="00";
		return false;
	}
}

if(document.form.fw_lw_enable_x[0].checked == 1 && document.form.fw_lw_enable_x_1[0].checked == 1){
	if(starttime < starttime_1){
		if(!(endtime < starttime_1)){
			alert("<#FirewallConfig_URLActiveTime_itemhint4#>");
			return false; 
		}
	}else if(starttime_1 < starttime){
		if(!(endtime_1 < starttime)){
			alert("<#FirewallConfig_URLActiveTime_itemhint4#>");
			return false; 
		}
	}else if(starttime == starttime_1){
		alert("<#FirewallConfig_URLActiveTime_itemhint4#>");
		return false;
	}
}

	
	if(!validate_portlist(document.form.filter_lw_icmp_x, 'filter_lw_icmp_x'))
		return false;

	
	return true;
}

function done_validating(action){
	refreshpage();
}

function change_wizard(o, id){
	for(var i = 0; i < wItem.length; i++){
		if(wItem[i][0] != null){
			if(o.value == wItem[i][0]){
				if(wItem[i][2] == "TCP")
					document.form.filter_lw_proto_x_0.options[0].selected = 1;
				else if(wItem[i][2] == "UDP")
					document.form.filter_lw_proto_x_0.options[8].selected = 1;
				
				document.form.filter_lw_dstport_x_0.value = wItem[i][1];
			}
		}
	}
}

function enable_lw(){
	if(document.form.fw_lw_enable_x[1].checked == 1)
		$("lw_time").style.display = "none";
	else 
		$("lw_time").style.display = "";
	return change_common_radio(this, 'FirewallConfig', 'lw_enable_x', '1')
}

function enable_lw_1(){
	if(document.form.fw_lw_enable_x_1[1].checked == 1)
		$("lw_time_1").style.display = "none";
	else 
		$("lw_time_1").style.display = "";
	return change_common_radio(this, 'FirewallConfig', 'lw_enable_x_1', '1')
}

function valid_subnet(){
	if(document.form.filter_lw_srcip_x_0.value.split("*").length >= 2){
		if(!valid_IP_subnet(document.form.filter_lw_srcip_x_0))
			return false;
	}else if(!valid_IP_form(document.form.filter_lw_srcip_x_0))
		return false;

	if(document.form.filter_lw_dstip_x_0.value.split("*").length >= 2){
		if(!valid_IP_subnet(document.form.filter_lw_dstip_x_0))
			return false;
	}else if(!valid_IP_form(document.form.filter_lw_dstip_x_0))
		return false;

	return true;
}


function valid_IP_subnet(obj){
	var ipPattern1 = new RegExp("(^([0-9]{1,3})\\.([0-9]{1,3})\\.([0-9]{1,3})\\.(\\*)$)", "gi");
	var ipPattern2 = new RegExp("(^([0-9]{1,3})\\.([0-9]{1,3})\\.(\\*)\\.(\\*)$)", "gi");
	var ipPattern3 = new RegExp("(^([0-9]{1,3})\\.(\\*)\\.(\\*)\\.(\\*)$)", "gi");
	var ipPattern4 = new RegExp("(^(\\*)\\.(\\*)\\.(\\*)\\.(\\*)$)", "gi");
	var parts = obj.value.split(".");
	if(!ipPattern1.test(obj.value) && !ipPattern2.test(obj.value) && !ipPattern3.test(obj.value) && !ipPattern4.test(obj.value)){
		alert(obj.value + " <#JS_validip#>");
		obj.focus();
		obj.select();
		return false;
	}else if(parts[0] == 0 || parts[0] > 255 || parts[1] > 255 || parts[2] > 255){
		alert(obj.value + " <#JS_validip#>");
		obj.focus();
		obj.select();
		return false;
	}else
		return true;
}

function valid_IP_form(obj){
	if(obj.value == ""){
		return true;
	}else{	//without netMask
		if(!validate_ipaddr_final(obj, obj.name)){
			obj.focus();
			obj.select();
			return false;
		}else
			return true;
	}
}

</script>
<style>
    .nav-tabs > li > a {
          padding-right: 6px;
          padding-left: 6px;
    }

    .radio.inline + .radio.inline,
    .checkbox.inline + .checkbox.inline {
      margin-left: 3px;
    }
</style>
</head>

<body onload="initial();" onunLoad="disable_auto_hint(10, 5);return unload_body();">

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
    <input type="hidden" name="productid" value="<% nvram_get_f("general.log","productid"); %>">

    <input type="hidden" name="current_page" value="Advanced_Firewall_Content.asp">
    <input type="hidden" name="next_page" value="">
    <input type="hidden" name="next_host" value="">
    <input type="hidden" name="sid_list" value="FirewallConfig;">
    <input type="hidden" name="group_id" value="LWFilterList">
    <input type="hidden" name="modified" value="0">
    <input type="hidden" name="action_mode" value="">
    <input type="hidden" name="first_time" value="">
    <input type="hidden" name="action_script" value="">
    <input type="hidden" name="preferred_lang" id="preferred_lang" value="<% nvram_get_x("LANGUAGE", "preferred_lang"); %>">
    <input type="hidden" name="firmver" value="<% nvram_get_x("",  "firmver"); %>">

    <input type="hidden" name="filter_lw_date_x" value="<% nvram_get_x("FirewallConfig","filter_lw_date_x"); %>">
    <input type="hidden" name="filter_lw_time_x" value="<% nvram_get_x("FirewallConfig","filter_lw_time_x"); %>">
    <input type="hidden" name="filter_lw_time_x_1" value="<% nvram_get_x("FirewallConfig","filter_lw_time_x_1"); %>">
    <input type="hidden" name="filter_lw_num_x_0" value="<% nvram_get_x("FirewallConfig", "filter_lw_num_x"); %>" readonly="1">

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
                            <h2 class="box_head round_top"><#menu5_5#> - <#menu5_5_4#></h2>
                            <div class="round_bottom">
                                <div class="row-fluid">
                                    <div id="tabMenu" class="submenuBlock"></div>
                                    <div class="alert alert-info" style="margin: 10px;"><#FirewallConfig_display1_sectiondesc#></div>

                                    <table width="100%" cellpadding="4" cellspacing="0" class="table">
                                        <tr>
                                            <th colspan="2" style="background-color: #E3E3E3;"><#menu5_5_4#></th>
                                        </tr>
                                        <tr>
                                            <th width="50%"><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,10,3);"><#FirewallConfig_LanWanDefaultAct_itemname#></a></th>
                                            <td>
                                                <select name="filter_lw_default_x" class="input" onChange="return change_common(this, 'FirewallConfig', 'filter_lw_default_x')">
                                                    <option value="DROP" <% nvram_match_x("FirewallConfig","filter_lw_default_x", "DROP","selected"); %>><#WhiteList#></option>
                                                    <option value="ACCEPT" <% nvram_match_x("FirewallConfig","filter_lw_default_x", "ACCEPT","selected"); %>><#BlackList#></option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,10,5);"><#FirewallConfig_LanWanFirewallEnable_itemname#> 1?</a></th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="fw_lw_enable_x_on_of">
                                                        <input type="checkbox" id="fw_lw_enable_x_fake" <% nvram_match_x("FirewallConfig", "fw_lw_enable_x", "1", "value=1 checked"); %><% nvram_match_x("FirewallConfig", "fw_lw_enable_x", "0", "value=0"); %>>
                                                    </div>
                                                </div>

                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" value="1" name="fw_lw_enable_x" id="fw_lw_enable_x_11" onClick="enable_lw();" <% nvram_match_x("FirewallConfig","fw_lw_enable_x", "1", "checked"); %>><#checkbox_Yes#>
                                                    <input type="radio" value="0" name="fw_lw_enable_x" id="fw_lw_enable_x_00" onClick="enable_lw();" <% nvram_match_x("FirewallConfig","fw_lw_enable_x", "0", "checked"); %>><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="lw_time">
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,10,2);"><#FirewallConfig_LanWanActiveTime_itemname#> 1:</a></th>
                                            <td>
                                                <input type="text" maxlength="2" class="input" style="width: 25px;" size="2" name="filter_lw_time_x_starthour" onKeyPress="return is_number(this)">:
                                                <input type="text" maxlength="2" class="input" style="width: 25px;" size="2" name="filter_lw_time_x_startmin" onKeyPress="return is_number(this)">-
                                                <input type="text" maxlength="2" class="input" style="width: 25px;" size="2" name="filter_lw_time_x_endhour" onKeyPress="return is_number(this)">:
                                                <input type="text" maxlength="2" class="input" style="width: 25px;" size="2" name="filter_lw_time_x_endmin" onKeyPress="return is_number(this)">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,10,5);"><#FirewallConfig_LanWanFirewallEnable_itemname#> 2?</a></th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="fw_lw_enable_x_1_on_of">
                                                        <input type="checkbox" id="fw_lw_enable_x_1_fake" <% nvram_match_x("FirewallConfig", "fw_lw_enable_x_1", "1", "value=1 checked"); %><% nvram_match_x("FirewallConfig", "fw_lw_enable_x_1", "0", "value=0"); %>>
                                                    </div>
                                                </div>

                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" value="1" name="fw_lw_enable_x_1" id="fw_lw_enable_x_1_1" onClick="enable_lw_1();" <% nvram_match_x("FirewallConfig","fw_lw_enable_x_1", "1", "checked"); %>><#checkbox_Yes#>
                                                    <input type="radio" value="0" name="fw_lw_enable_x_1" id="fw_lw_enable_x_1_0" onClick="enable_lw_1();" <% nvram_match_x("FirewallConfig","fw_lw_enable_x_1", "0", "checked"); %>><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="lw_time_1">
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,10,2);"><#FirewallConfig_LanWanActiveTime_itemname#> 2:</a></th>
                                            <td>
                                                <input type="text" maxlength="2" class="input" style="width: 25px;" size="2" name="filter_lw_time_x_1_starthour" onKeyPress="return is_number(this)">:
                                                <input type="text" maxlength="2" class="input" style="width: 25px;" size="2" name="filter_lw_time_x_1_startmin" onKeyPress="return is_number(this)">-
                                                <input type="text" maxlength="2" class="input" style="width: 25px;" size="2" name="filter_lw_time_x_1_endhour" onKeyPress="return is_number(this)">:
                                                <input type="text" maxlength="2" class="input" style="width: 25px;" size="2" name="filter_lw_time_x_1_endmin" onKeyPress="return is_number(this)">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,10,1);"><#FirewallConfig_LanWanActiveDate_itemname#></a></th>
                                            <td>
                                                <div class="controls">
                                                    <label class="checkbox inline"><input type="checkbox" name="filter_lw_date_x_Mon" class="input" onChange="return changeDate();"><#DAY_Mon#></label>
                                                    <label class="checkbox inline"><input type="checkbox" name="filter_lw_date_x_Tue" class="input" onChange="return changeDate();"><#DAY_Tue#></label>
                                                    <label class="checkbox inline"><input type="checkbox" name="filter_lw_date_x_Wed" class="input" onChange="return changeDate();"><#DAY_Wed#></label>
                                                    <label class="checkbox inline"><input type="checkbox" name="filter_lw_date_x_Thu" class="input" onChange="return changeDate();"><#DAY_Thu#></label>
                                                    <label class="checkbox inline"><input type="checkbox" name="filter_lw_date_x_Fri" class="input" onChange="return changeDate();"><#DAY_Fri#></label>
                                                    <label class="checkbox inline"><input type="checkbox" name="filter_lw_date_x_Sat" class="input" onChange="return changeDate();"><#DAY_Sat#></label>
                                                    <label class="checkbox inline"><input type="checkbox" name="filter_lw_date_x_Sun" class="input" onChange="return changeDate();"><#DAY_Sun#></label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,10,4);"><#FirewallConfig_LanWanICMP_itemname#></a></th>
                                            <td>
                                                <input type="text" maxlength="32" class="input" size="32" name="filter_lw_icmp_x" value="<% nvram_get_x("FirewallConfig","filter_lw_icmp_x"); %>" onKeyPress="return is_portlist(this)">
                                            </td>
                                        </tr>
                                    </table>

                                    <table width="100%" cellpadding="4" cellspacing="0" class="table">
                                        <tr>
                                            <th colspan="6" style="background-color: #E3E3E3;" id="LWFilterList"><#FirewallConfig_LWFilterList_groupitemdesc#></th>
                                        </tr>
                                        <tr>
                                            <th colspan="2"><#FirewallConfig_LWFilterList_widzarddesc#></th>
                                            <td>
                                                <select name="LWKnownApps" class="span12" onChange="change_wizard(this, 'LWKnownApps');">
                                                    <option value="User Defined">User Defined</option>
                                                </select>
                                            </td>
                                            <td colspan="3">&nbsp;</td>
                                            <!--<td rowspan="3" valign="bottom" bgcolor="#FFFFFF" style="width:50px;">
                                                <input class="button" type="submit" onclick="if(validForm()){return markGroup(this, 'LWFilterList', 64, ' Add ');}" name="LWFilterList" value="<#CTL_add#>" style="padding:0px; margin:0px;"/>
                                            </td> -->
                                        </tr>
                                        <tr>
                                            <th width="25%"><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,18,3);"><#FirewallConfig_LanWanSrcIP_itemname#></a></th>
                                            <th width="15%"><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,18,2);"><#FirewallConfig_LanWanSrcPort_itemname#></a></th>
                                            <th width="25%"><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,18,3);"><#FirewallConfig_LanWanDstIP_itemname#></a></th>
                                            <th width="15%"><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,18,2);"><#FirewallConfig_LanWanDstPort_itemname#></a></th>
                                            <th width="15%"><#FirewallConfig_LanWanProFlag_itemname#></th>
                                            <th width="5%">&nbsp;</th>
                                        </tr>
                                        <tr>
                                            <td><input type="text" maxlength="15" class="span12" size="14" name="filter_lw_srcip_x_0" onKeyPress="return is_iprange(this)" onKeyUp="change_iprange(this)"></td>
                                            <td><input type="text" maxlength="11" class="span12" size="10" name="filter_lw_srcport_x_0" value="" onKeyPress="return is_portrange(this)"></td>
                                            <td><input type="text" maxlength="15" class="span12" size="14" name="filter_lw_dstip_x_0" onKeyPress="return is_iprange(this)" onKeyUp="change_iprange(this)"></td>
                                            <td><input type="text" maxlength="11" class="span12" size="10" name="filter_lw_dstport_x_0" value="" onKeyPress="return is_portrange(this)"></td>
                                            <td><select name="filter_lw_proto_x_0" class="span12"><option value="TCP" <% nvram_match_list_x("FirewallConfig","filter_lw_proto_x", "TCP","selected", 0); %>>TCP</option><option value="TCP ALL" <% nvram_match_list_x("FirewallConfig","filter_lw_proto_x", "TCP ALL","selected", 0); %>>TCP ALL</option><option value="TCP SYN" <% nvram_match_list_x("FirewallConfig","filter_lw_proto_x", "TCP SYN","selected", 0); %>>TCP SYN</option><option value="TCP ACK" <% nvram_match_list_x("FirewallConfig","filter_lw_proto_x", "TCP ACK","selected", 0); %>>TCP ACK</option><option value="TCP FIN" <% nvram_match_list_x("FirewallConfig","filter_lw_proto_x", "TCP FIN","selected", 0); %>>TCP FIN</option><option value="TCP RST" <% nvram_match_list_x("FirewallConfig","filter_lw_proto_x", "TCP RST","selected", 0); %>>TCP RST</option><option value="TCP URG" <% nvram_match_list_x("FirewallConfig","filter_lw_proto_x", "TCP URG","selected", 0); %>>TCP URG</option><option value="TCP PSH" <% nvram_match_list_x("FirewallConfig","filter_lw_proto_x", "TCP PSH","selected", 0); %>>TCP PSH</option><option value="UDP" <% nvram_match_list_x("FirewallConfig","filter_lw_proto_x", "UDP","selected", 0); %>>UDP</option></select></td>
                                            <td><button class="btn" type="submit" onclick="if(valid_subnet()){return markGroup(this, 'LWFilterList', 64, ' Add ');}" name="LWFilterList"><i class="icon icon-plus"></i></button></td>
                                        </tr>
                                        <tr>
                                            <td colspan="5">
                                                <select size="8" class="span12" name="LWFilterList_s" multiple="true" style="font-size:12px; font-weight:bold;">
                                                    <% nvram_get_table_x("FirewallConfig","LWFilterList"); %>
                                                </select>
                                            </td>
                                            <td>
                                                <button class="btn btn-danger" type="submit" onclick="return markGroup(this, 'LWFilterList', 64, ' Del ');" name="LWFilterList2"><i class="icon icon-minus icon-white"></i></button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6">
                                                <br />
                                                <center><input class="btn btn-primary" style="width: 219px" onclick="applyRule();" type="button" value="<#CTL_apply#>" /></center>
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
