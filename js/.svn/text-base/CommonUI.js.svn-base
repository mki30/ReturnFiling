$.fn.Clear = function()
{
    $("*", this).each(function()
    {
        var type = this.type, tag = this.tagName.toLowerCase();
        if (type == 'text' || type == 'password' || tag == 'textarea' || type == 'hidden')
            this.value = '';
        else if (type == 'checkbox' || type == 'radio')
            this.checked = false;
        else if (tag == 'select')
            this.selectedIndex = -1;
        else if (tag == "small")
            $(this).text("");
    });
};

$.fn.outerHTML = function(s)
{
    return (s) ? this.before(s).remove() : jQuery("<p>").append(this.eq(0).clone()).html();
}

function SaveInLocalStorage(key, val)
{
    if (typeof (localStorage) != 'undefined')
    {
        window.localStorage.removeItem("'" + key + "'");
        window.localStorage.setItem("'" + key + "'", val);
        return true;
    }
    else
    {
        alert("Your browser does not support local storage, please upgrade to latest browser");
        return false;
    }
}

function LoadFromLocalStorage(key, defaultValue)
{
    var v = window.localStorage.getItem("'" + key + "'");
    return v == null ? defaultValue : v;
}

function RemoveFromLocalStorage(key)
{
    window.localStorage.removeItem("'" + key + "'");
}
function htmlEncode(value) { return $('<div/>').text(value).html(); }
function htmlDecode(value) { return $('<div/>').html(value).text(); }

function ClearLocalStoreage()
{
    for (var propertyName in window.localStorage)
    {
        window.localStorage.removeItem(propertyName);
    }
}
function error(obj) { console.log(obj); }
function isNumberKey(evt)//for stopping the character value in integer textboxes
{
    var charCode = (evt.which) ? evt.which : event.keyCode

    switch (charCode)
    {
        case 8:
        case 9:
        case 27:
        case 32:
        case 37:
        case 39:
            return true;
    }

    if (charCode > 31
        && (charCode < 48 || charCode > 57)
        && (charCode < 96 || charCode > 105)) //For Numeric Keypad
        return false;

    return true;
}

function isAlphabet(evt)
{
    var charCode = (evt.which) ? evt.which : event.keyCode
    switch (charCode)
    {
        case 8:
        case 9:
        case 27:
        case 32:
        case 37:
        case 39:
            return true;
    }
    return charCode >= 65 && charCode <= 90;
}

$.fn.ValidateSubmit = function()
{
    var Flag = true;
    $("input,select,checkbox,password,radio", this).each(function()
    {
        if (Flag)
        {
            var M = $(this).data("required");
            if (M != undefined)
            {
                if ($(this).val() == "" && M != "")
                {
                    AlertName = this.name;
                    //$(this).focus();
                    //$(this).select();
                    Flag = false;
                    ShowAlert(M, "Required field missing", $(this).attr("id"));
                }
            }
        }
        if (Flag)
        {
            var M = $(this).data("minlength");
            if (M != undefined)
            {
                if ($(this).val() != "" && $(this).val().length != M)
                {
                    var Message = $(this).data("minlengthmessage");
                    if (Message != undefined)
                        AlertName = this.name;
                    Flag = false;
                    ShowAlert(Message, "Length is less than permitted value", $(this).attr("id"));
                    //alert(Message);
                }
            }
        }
    });
    return Flag;
};


function NoData(obj)
{
    if (obj == null) return true;
    if (obj == undefined) return true;
    if (obj == "[]") return true;
    if (obj.length == 0) return true;
    return false;
}

$.fn.serializeObject = function()
{
    var o = {};
    $("input,select,checkbox,password,radio,textarea,input:hidden", this).each(function()
    {
        var id = $(this).attr("id");
        var val = $.trim($(this).val())
        if (this.type == 'checkbox' || this.type == 'radio')
        {
            val = $(this).prop('checked') ? "1" : "0";
        }
        o[id] = val;
    });
    return o;
};

function toTitleCase(str)
{
    if (NoData(str))
        return "";
    return str.replace(/\w\S*/g, function(txt) { return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase(); });
}

var Action;

$(document).ready(function()
{

    if (Action != "permanent" && Action != "donation")
        $("#divMain").css('min-height', $(window).height() - 150 - ($(".header-panel").height() + $(".back-top").height() + $(".footer-panel").height()));

    $('.date').datetimepicker({ format: 'dd-M-yyyy', minView: 'month', autoclose: true });
    $(".Alpha").bind('keydown', function() { return isAlphabet(this); });
    $(".Numeric").bind('keydown', function() { return isNumberKey(this); });
    $(".del").bind('click', function()
    {
        var res = confirm("Record will be permanently deleted. Do you want to delete?");
        if (res)
        {
            $(this).text("Deleting..");
            var _what_to_delete = $(this).data("prop");
            var id = $(this).data("id");
            $.ajax(
                {
                    url: "/getdata.aspx?Action=Delete&Data1=" + _what_to_delete + "&Data2=" + id,
                    success: function() { location.reload(); }
                }
            );
        }
    });
});
