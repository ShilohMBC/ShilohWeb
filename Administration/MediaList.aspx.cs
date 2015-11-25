using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShilohWeb.Administration
{
    public partial class MediaList : BaseAdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SetDateRanges();
        }

        #region Methods

        protected void SetDateRanges()
        {

            if (!IsPostBack)
            {
                Session["MediaDateStartDate"] = DateTime.Now.AddDays(-31.0);
                Session["MediaDateEndDate"] = DateTime.Now;
            }
            else
            {
                Session["MediaDateStartDate"] = ucFilterDays.DateRangeStart;
                Session["MediaDateEndDate"] = ucFilterDays.DateRangeEnd;
            }
        }

        #endregion

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            ucFilterDays.FilterChanged += new ShilohWeb.Controls.FilterDays.FilterChangedHandler(ucFilterDays_FilterChanged);
        }

        private void ucFilterDays_FilterChanged(object sender, ShilohWeb.Controls.FilterDays.FilterChangedEventArgs e)
        {
            sqldcMedia.Select(new DataSourceSelectArguments());
        }

        private void ucFilterMonthYear_FilterChanged(object sender, ShilohWeb.Controls.FilterMonthYear.FilterChangedEventArgs e)
        {
            sqldcMedia.Select(new DataSourceSelectArguments());
        }

        protected void sqldcMedia_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            SetDateRanges();
        }

        protected void grdMedia_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
        }

        protected void grdMedia_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
        }


        protected void grdMedia_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }
    }
}
