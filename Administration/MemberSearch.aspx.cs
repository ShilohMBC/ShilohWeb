using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShilohWeb.Administration
{
    public partial class MemberSearch : BaseAdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                grdMembers.Visible = true;
        }

        protected string BuildMemberLink(string FirstName, string LastName, int MemberId)
        {
            StringBuilder link = new StringBuilder("<a href='Member_Entry.aspx?mid=%mid%' title='View Member'>%name%</a>");

            link.Replace("%mid%", MemberId.ToString());
            link.Replace("%name%", string.Concat(FirstName.Trim(), " ", LastName.Trim()));

            return link.ToString();
        }

        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void sqldcMembers_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (string.IsNullOrEmpty(txtFirstName.Text) && string.IsNullOrEmpty(txtLastName.Text))
                e.Cancel = true;
        }
    }
}
