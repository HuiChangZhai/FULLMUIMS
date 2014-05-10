<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/EnterpriseBg.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    EnterpriseDynamicEdit
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptAndStyleContent" runat="server">
    <link href="/Content/CSS/SiteBg.css" rel="stylesheet" />
    <link href="/Content/CSS/FixedItemListTable.css" rel="stylesheet" />
    <script src="/Content/ueditor1_3_6-utf8-net/ueditor.config.js"></script>
    <script src="/Content/ueditor1_3_6-utf8-net/ueditor.all.min.js"></script>
    <script src="/Content/ueditor1_3_6-utf8-net/lang/zh-cn/zh-cn.js"></script>
    <script src="/Scripts/WebSite/HTMLEncoding.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var editor = UE.getEditor('editor', {
                themePath: "/Content/ueditor1_3_6-utf8-net/themes/",
                UEDITOR_HOME_URL: "/Content/ueditor1_3_6-utf8-net/"
            });
            editor.ready(function () {
                <%
                EnterpriseDynamic enterpriseDynamic = Model as EnterpriseDynamic;
                if (enterpriseDynamic != null)
                {%>
                    editor.setContent(HTMLEncoding.Coding2Txt("<%:enterpriseDynamic.EnterpriseDynamicContent %>"));
                <%}%>
            });

            $("#SubmitButton").click(function (e) {
                Summit();
            });

            var Saving = false;
            function Summit() {
                if (!Saving) {
                    Saving = true;
                    $("#enterpriseDynamicTitle").val($("#enterpriseDynamicVal").val());
                    var enterpriseBrief = UE.getEditor('editor').getContent();
                    $("#enterpriseDynamicContent").val(HTMLEncoding.Encoding(enterpriseBrief));

                    $("#EditorForm").submit();
                }
            }
        });
    </script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="MainContentDiv">
        <%
            EnterpriseDynamic enterpriseDynamic = Model as EnterpriseDynamic;
            if (enterpriseDynamic == null)
            {%>
        <div style="text-align: center; color: red; padding: 10px;"><%:(string)ViewBag.ErrorMessage %></div>
        <%}
            else
            {%>
        <form id="EditorForm" name="EditorForm" action="EnterpriseDynamicEdit" method="post">
            <input name="EnterpriseDynamicID" id="EnterpriseDynamicID" type="hidden" value="<%:enterpriseDynamic.EnterpriseDynamicID %>"/>
            <input name="enterpriseDynamicTitle" id="enterpriseDynamicTitle" type="hidden" value=""/>
            <input id="enterpriseDynamicContent" name="enterpriseDynamicContent" type="hidden" value=""/>
        </form>
        <table class="TableInfo">
            <tr>
                <td class="lable">标题</td>
                <td><input class="Title" id="enterpriseDynamicVal" value="<%:enterpriseDynamic.EnterpriseDynamicTitle %>"/></td>
            </tr>
            <tr>
                <td class="lable">内容</td>
                <td>
                    <div id="editor" style="width:800px; height: 300px;">
                    </div>
                </td>
            </tr>
            <tr>
                <td class="lable">内容</td>
                <td><input class="SubmitButton" id="SubmitButton" type="button" value="保存"/></td>
            </tr>
        </table>
        <%}
        %>
    </div>
</asp:Content>