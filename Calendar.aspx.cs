using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Shiloh.BL;

namespace ShilohWeb
{
    public partial class Calendar : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            _EventId = GetEventId();
            _EventDate = GetEventDate();
            ucCalendar.SelectedDate = _EventDate;

            //if (!IsPostBack)
            {                
                ucCalendar.LoadActivities(_EventDate.Month, _EventDate.Year);                
                BindEvents();
            }            
        }

        protected override void OnInitComplete(EventArgs e)
        {
 	         base.OnInitComplete(e);
             ucCalendar.MonthChanged += new ShilohWeb.Controls.EventsCalendar.MonthChangedHandler(ucCalendar_MonthChanged);
        }

        #region Properties

        int _EventId;
        DateTime _EventDate;
        Shiloh.BL.Shiloh.activityDataTable _dtEvents;

        #endregion

        #region Methods

        protected DateTime GetEventDate()
        {
            DateTime eDate = DateTime.Now;
            
            if (Request.QueryString["dt"] != null)
            {
                string date = Request.QueryString["dt"].ToString();

                if (date.Length >= 8)
                {
                    int year = Convert.ToInt32(date.Substring(0, 4));
                    int month = Convert.ToInt32(date.Substring(4, 2));
                    int day = Convert.ToInt32(date.Substring(6, 2));

                    string eventDate = string.Concat(month.ToString(), "/", day.ToString(), "/", year.ToString());

                    if (!DateTime.TryParse(eventDate, out eDate))
                        eDate = DateTime.Now;
                }
            }

            return eDate;
        }

        protected int GetEventId()
        {
            int id = 0;

            if (Request.QueryString["eid"] != null)
            {
                if (!Int32.TryParse(Request.QueryString["eid"].ToString(), out id))
                    id = 0;
            }

            return id;
        }

        protected void BindEvents()
        {
            lbAllEvents.Visible = false;
            _dtEvents = ucCalendar.MonthlyActivities;

            if (_dtEvents != null)
            {
                dlEvents.ShowHeader = (_dtEvents.Rows.Count == 0);

                // if an event is specified, only show that event
                if (_EventId > 0)
                {
                    List<Shiloh.BL.Shiloh.activityRow> evt = new List<Shiloh.BL.Shiloh.activityRow>();

                    Shiloh.BL.Shiloh.activityRow row = _dtEvents.FindByID(_EventId);

                    if (row != null)
                        evt.Add(row);

                    dlEvents.DataSource = evt;
                    lbAllEvents.Visible = true;
                }
                // show all events for the month
                else
                {
                    string date = DateTime.Now.Date.ToLongDateString();
                    dlEvents.DataSource = _dtEvents.Select("activityStart >= '%dt%'".Replace("%dt%", date));
                    lbAllEvents.Visible = false;
                }

                dlEvents.DataBind();
            }
        }

        protected string BuildDateHeader(DateTime StartDate, DateTime EndDate)
        {
            string dateHdr = string.Empty;

            // if the start and end dates are the same, just show the one date
            if (StartDate.Date.CompareTo(EndDate.Date) == 0)
            {
                dateHdr = StartDate.ToString("dddd, MMMM dd");
            }
            else
            {
                // if the months are the same, then just show the day
                if (StartDate.Month == EndDate.Month)
                    dateHdr = string.Concat(StartDate.ToString("dddd, MMMM dd"), " - ", EndDate.ToString("dd"));
                else
                    dateHdr = string.Concat(StartDate.ToString("dddd, MMMM dd"), " - ", EndDate.ToString("MMM dd"));
            }

            return dateHdr;
        }

        protected string FormatLocationInfo(int EventId)
        {
            StringBuilder locationInfo = new StringBuilder(string.Empty);

            if (_dtEvents != null)
            {
                foreach (Shiloh.BL.Shiloh.activityRow row in _dtEvents.Rows)
                {
                    if (row.ID == EventId)
                    {
                        locationInfo.Append("<div style='font-size: 11pt; padding-top: 10px;'>");

                        if (!string.IsNullOrEmpty(row.location))
                        {
                            locationInfo.Append("<span class='label' style='width: 75px;'>Location: </span>");
                            locationInfo.Append(row.location);
                            locationInfo.Append("<br/>");
                        }

                        if (!string.IsNullOrEmpty(row.address))
                        {
                            locationInfo.Append("<span class='label' style='width: 75px;'>Address:</span> &nbsp;");
                            locationInfo.Append(row.address);
                            
                            if (!string.IsNullOrEmpty(row.city))                            
                                locationInfo.Append(", " + row.city);

                            if (!string.IsNullOrEmpty(row.state))
                                locationInfo.Append(", " + row.state);

                            if (!string.IsNullOrEmpty(row.zipCode))
                                locationInfo.Append(" " + row.zipCode);

                            locationInfo.Append("<br/>");
                        }

                        if (!string.IsNullOrEmpty(row.contactName))
                        {
                            locationInfo.Append("<span class='label' style='width: 75px;'>Contact: </span>");
                            locationInfo.Append(row.contactName);
                            locationInfo.Append("&nbsp;| &nbsp;");
                        }

                        if (!string.IsNullOrEmpty(row.contactEmailAddress))
                        {
                            locationInfo.Append("<span class='label'>Email: </span>");
                            locationInfo.Append(row.contactEmailAddress);
                            locationInfo.Append("&nbsp;| &nbsp;");
                        }

                        if (!string.IsNullOrEmpty(row.contactPhone))
                        {
                            locationInfo.Append("<span class='label'>Phone: </span>");
                            locationInfo.Append(row.contactPhone);
                        }

                        if (!string.IsNullOrEmpty(row.contactURL))
                        {
                            locationInfo.Append("<br/><span class='label' style='width: 75px;'>Website: </span>");                            
                            locationInfo.Append(row.contactURL);
                            locationInfo.Append("<br/>");
                        }

                        locationInfo.Append("</div>");
                        break;
                    }
                }
            }

            return locationInfo.ToString();
        }

        protected string BuildStyle(int EventId, DateTime EventDate, string Style)
        {
            string backColor = string.Empty;          

            if (DateTime.Now.CompareTo(EventDate) <= 0)
            {
                //backColor = Style.Replace("%color%", (EventId != _EventId) ? "White" : "rgb(255,255,128)");
                backColor = Style.Replace("%color%", "White");
            }
            else
            {
                backColor = Style.Replace("%color%", "Silver");
            }

            return backColor;
        }

        #endregion

        #region Calendar Events
        
        protected void ucCalendar_MonthChanged(object sender, ShilohWeb.Controls.EventsCalendar.MonthChangeEventArgs e)
        {
            _EventDate = e.NewSelectedDate;
            BindEvents();
        }

        #endregion
    }
}
