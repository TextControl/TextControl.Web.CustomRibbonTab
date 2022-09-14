<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="tx_html5_addingtabs.index" %>

<%@ Register assembly="TXTextControl.Web, Version=31.0.1100.500, Culture=neutral, PublicKeyToken=6b83fe9a75cfb638" namespace="TXTextControl.Web" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.6.0.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <cc1:TextControl ID="TextControl1" runat="server" />

        <script type="text/javascript">
            // elements can be only added when the ribbon is completely loaded
            TXTextControl.addEventListener("ribbonTabsLoaded", function (e) {
                addTab();
            });
            function btnCustomAction() {
                alert("Custom button clicked.");
            }
            // this function adds a new tab and the tab content page
            function addTab() {
                sCustomTab = "<li><a onclick='activateCustomTab();' id='tabCustom' data-text='Custom Ribbon Tab'><div class='txTabTextContainer'>Custom Ribbon Tab</div></a></li>";
                // add the new tab after the 'View' tab
                document.getElementById('tabView').parentElement.insertAdjacentHTML(
                    'beforebegin', sCustomTab);
                sCustomTabContent = "<div id='ribbonTabCustom' class='tab-content' style='display: none;'>";
                sCustomTabContent += "<div id='ribbonGroupCustom' class='ribbon-group'>";
                sCustomTabContent += "  <div class='ribbon-group-content'>";
                sCustomTabContent += "      <div class='ribbon-group-content-row'>";
                sCustomTabContent += "          <div class='ribbon-group-button-group'>";
                sCustomTabContent += "              <div onclick='btnCustomAction()' id='BtnCustom' class='ribbon-button ribbon-button-big' title='Custom'>";
                sCustomTabContent += "                  <div class='ribbon-button-big-image-container'><img id='imgID_RibbonTabInsert_html_0' class='ribbon-button-big-image' src='custom.png'></img></div>";
                sCustomTabContent += "                  <div class='ribbon-button-big-label-container'><p class='ribbon-button-label'>Custom</p></div>";
                sCustomTabContent += "              </div>";
                sCustomTabContent += "          </div>";
                sCustomTabContent += "      </div>";
                sCustomTabContent += "  </div>";

                sCustomTabContent += "  <div class='ribbon-group-label-container'>";
                sCustomTabContent += "      <p class='ribbon-group-label'>Custom</p>";
                sCustomTabContent += "  </div>";
                sCustomTabContent += "</div>";
                sCustomTabContent += "</div>";
                // add the tab content to the tab content container
                document.getElementById('txRibbonTabContentContainer').insertAdjacentHTML(
                    'afterbegin', sCustomTabContent);
            }
            // activate the custom tab
            function activateCustomTab() {
                $('div.tab-content').css("display", "none");
                $('ul.tabs a').removeClass("selected");
                $("#ribbonTabCustom").css("display", "inline-block");
                $("#tabCustom").addClass("selected");
            }
        </script>

    </div>
    </form>
</body>
</html>
