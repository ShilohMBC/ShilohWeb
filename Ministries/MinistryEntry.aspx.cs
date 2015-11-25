using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Shiloh.BL;

namespace ShilohWeb.Ministries
{
    public partial class MinistryEntry : BaseAdminPage
    {
        private const string UNSELECTED_MINISTRY = "-1";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                LoadMinistries();
            }
        }

        protected void LoadMinistries()
        {
            Ministry ministries = new Ministry();
            ddlMinistry.DataSource = ministries.GetAllMinistries();
            ddlMinistry.DataTextField = "name";
            ddlMinistry.DataValueField = "ministryId";
            ddlMinistry.DataBind();
        }

        protected bool FormIsValid()
        {
            this.Validate();

            return IsValid;
        }

        protected void ClearForm()
        {                   
            txtContactEmail.Text = string.Empty;
            txtContactName.Text = string.Empty;
            txtContactPhone1.Text = string.Empty;
            txtContactPhone2.Text = string.Empty;
            txtMiscInfo.Text = string.Empty;
            txtPrograms.Text = string.Empty;
            txtSummaryBrief.Text = string.Empty;
            txtSummaryDetailed.Text = string.Empty;
            txtSupport.Text = string.Empty;
        
            MakeReadOnly(false);
        }

        protected void MakeReadOnly(bool DoIt)
        {
            txtContactEmail.Enabled = !DoIt;
            txtContactName.Enabled = !DoIt;
            txtContactPhone1.Enabled = !DoIt;
            txtContactPhone2.Enabled = !DoIt;
            txtMiscInfo.Enabled = !DoIt;
            txtPrograms.Enabled = !DoIt;
            txtSummaryBrief.Enabled = !DoIt;
            txtSummaryDetailed.Enabled = !DoIt;
            txtSupport.Enabled = !DoIt;
            btnSubmit.Enabled = !DoIt;
        }

        protected bool SaveInfo()
        {
            bool isSaved = false;

            Shiloh.BL.MinistryEntry entry = new Shiloh.BL.MinistryEntry(Convert.ToInt32(ddlMinistry.SelectedValue));

            entry.contactEmail = txtContactEmail.Text;
            entry.contactName = txtContactName.Text;
            entry.contactPhone1 = txtContactPhone1.Text;
            entry.contactPhone2 = txtContactPhone2.Text;

            if (entry.Id == 0)
                entry.dateCreated = DateTime.Now;

            entry.description = txtSummaryDetailed.Text;
            entry.isLocked = false;
            entry.miscInfo = txtMiscInfo.Text;
            entry.programInfo = txtPrograms.Text;
            entry.summary = txtSummaryBrief.Text;
            entry.supportInfo = txtSupport.Text;
            
            try
            {
                isSaved = entry.Save();
            }
            catch (Exception ex)
            {
                lblMsg.Text = (ex.InnerException!=null) ? ex.InnerException.Message : ex.Message;
            }

            return isSaved;
        }
        
        protected void LoadEntry(Shiloh.BL.MinistryEntry Entry)
        {
            if (Entry != null)
            {
                txtContactEmail.Text = Entry.contactEmail;
                txtContactName.Text = Entry.contactName;
                txtContactPhone1.Text = Entry.contactPhone1;
                txtContactPhone2.Text = Entry.contactPhone2;
                txtMiscInfo.Text = Entry.miscInfo;
                txtPrograms.Text = Entry.programInfo;
                txtSummaryBrief.Text = Entry.summary;
                txtSummaryDetailed.Text = Entry.description;
                txtSupport.Text = Entry.supportInfo;
            
                MakeReadOnly(Entry.isLocked);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (FormIsValid())
            {
                if (SaveInfo())
                {
                    Response.Redirect("~/Ministries/MinstryEntryHome.aspx");
                }
                else
                {
                    lblMsg.Text = "Could not save ministry information. Try again.";
                }
            }
        }

        protected void ddlMinistry_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!ddlMinistry.SelectedValue.Equals(UNSELECTED_MINISTRY))
            {
                Shiloh.BL.MinistryEntry entry = new Shiloh.BL.MinistryEntry(Convert.ToInt32(ddlMinistry.SelectedValue));

                if (entry.Id > 0)
                {
                    LoadEntry(entry);
                }
                else
                    ClearForm();
            }
        }
    }
}
