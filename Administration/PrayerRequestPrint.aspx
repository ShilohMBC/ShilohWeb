<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrayerRequestPrint.aspx.cs" Inherits="ShilohWeb.Administration.PrayerRequestPrint" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Print Prayer Request</title>
        
    <style media="all" type="text/css">
        LABEL
        {
            font-size: 12pt;
            font-weight: bold;
            width: 200px;
            float: left;
            width: 15em;
            font-weight: bold;
            text-align:right;
            vertical-align:middle;            
        }
        .dataLabel
        {
            font-size: medium;
        }
        BODY  {
        background:#d8d8d8;
        border:0;
        font-size:1.0em;
        font-family: Myriad Pro, Segoe UI, Trebuchet MS, Arial, Sans-Serif;
        margin:0;           
        padding:0;
        text-align:center; 
        }
        form {
        background-color:#ffffff;
        margin:1.5em auto;
        text-align:left;
        width:60em; 
        }
        .requestText
        {
            position: relative; 
            border: 1px solid silver; 
            padding: 10px; 
            width: 550px; 
            left: 275px;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 700px; padding: 20px 5px;">    
        <div style="position: relative; left: 50px;">
            <h1>Prayer Request</h1>
        </div>    
                
        <div>
            <label>Date request was received:</label>&nbsp;&nbsp;
            <asp:Label ID="lblDateReceived" runat="server" Text="" CssClass="dataLabel"></asp:Label>
        </div>
        <br />
        <div>
            <label>From/For: </label>&nbsp;&nbsp;
            <asp:Label ID="lblName" runat="server" Text="" CssClass="dataLabel"></asp:Label>
        </div>
        <br />
        <div>
            <label>Is this confidential?: </label>&nbsp;&nbsp;
            <asp:Label ID="lblConfidential" runat="server" Text="" CssClass="dataLabel"></asp:Label>
        </div>
        <br />
        <div>
            <label>Should a call be made?: </label>&nbsp;&nbsp;
            <asp:Label ID="lblCall" runat="server" Text="" CssClass="dataLabel"></asp:Label>
        </div>
        <div>
            <label>E-mail address: </label>&nbsp;&nbsp;
            <asp:Label ID="lblEmail" runat="server" Text="" CssClass="dataLabel"></asp:Label>
        </div>
        <br />
        <div>
            <label>Is someone in danger?: </label>&nbsp;&nbsp;
            <asp:Label ID="lblInDager" runat="server" Text="" CssClass="dataLabel"></asp:Label>
        </div>
        <br />
        <div>
            <label>Is someone in the hospital?: </label>&nbsp;&nbsp;
            <asp:Label ID="lblHostpital" runat="server" Text="" CssClass="dataLabel"></asp:Label>
        </div>
        
        <br />
        <label>Prayer Request:</label><br />
        <div class="requestText">
            <asp:Label ID="lblPrayerRequest" runat="server" Text=""></asp:Label>
        </div>
        <br />
        <div>
            <label>Resources Requested: </label>&nbsp;&nbsp;
            <asp:Label ID="lblReferrals" runat="server" Text="" CssClass="dataLabel"></asp:Label>
        </div>
        <br />
        
        <label>Special Requests: </label><br />
        <div class="requestText">
            <asp:Label ID="lblSpecialInstructions" runat="server" Text="" CssClass="dataLabel"></asp:Label>
        </div>        
        <br />
        <br />
        <div style="color: Gray; right: 10px;">

            <div>
                <label>Date Printed: </label>&nbsp;&nbsp;
                <asp:Label ID="lblDatePrinted" runat="server" Text="" CssClass="dataLabel"></asp:Label>            
            </div>
            <br />        
            <div>
                <label>Handled By: </label>&nbsp;&nbsp;
                <asp:Label ID="lblHandledBy" runat="server" Text="" CssClass="dataLabel"></asp:Label>            
            </div>
        </div>        
    </div>
    
    <script language="javascript" type="text/javascript">
        window.print();
    </script>
    </form>
</body>
</html>
