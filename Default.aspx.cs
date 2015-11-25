using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Shiloh.BL;
using System.Configuration;

namespace ShilohWeb
{
    public partial class Default : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string requestURL = Request.Url.ToString().ToLower();

                if (requestURL.Contains("//younglions.shiloh2000"))
                {
                    Response.Redirect("http://shiloh2000.com/younglions/Default.aspx");
                }
                else
                {
                    EnsureFullDomain("http://shiloh2000.com", "http://www.shiloh2000.com");                
                }

                BindEventList();                
            }

            hlStream.NavigateUrl = ConfigurationManager.AppSettings["StreamingURL"];

            // put logic here to pop open stream logo
            if (DateTime.Now.DayOfWeek == DayOfWeek.Sunday &&
                (DateTime.Now.Hour >= 10 && DateTime.Now.Hour <= 12))
            {
                hlStream.Visible = true;
            }
            else
            {
                hlStream.Visible = false;
            }

            if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["AlwaysShowStreamLogo"]) && ConfigurationManager.AppSettings["AlwaysShowStreamLogo"].ToLower().Equals("true"))
                hlStream.Visible = true;

            VideoCheck();
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            //ucCalendar.MonthChanged += new ShilohWeb.Controls.EventsCalendar.MonthChangedHandler(ucCalendar_MonthChanged);
        }

        #region Properties

        public struct sActivity
        {
            public int Id;
            public string Name;
            public string Description;
            public DateTime StartDate;
            public DateTime EndDate;
        }

        Shiloh.BL.Shiloh.activityDataTable _dtActivities;
        Dictionary<string, List<sActivity>> _Activities = new Dictionary<string, List<sActivity>>();

        #endregion

        #region Methods

        protected void VideoCheck()
        {
            string autoPlay = "1";

            if (Session[BaseGlobals.SESSION_PLAYVIDEO] != null)
            {
                if (Convert.ToBoolean(Session[BaseGlobals.SESSION_PLAYVIDEO]))
                {
                    autoPlay = "1";
                    Session[BaseGlobals.SESSION_PLAYVIDEO] = false;
                }
                else
                    autoPlay = "0";
            }
            else
            {
                autoPlay = "1";
                Session[BaseGlobals.SESSION_PLAYVIDEO] = false;
            }

            if (Request.Browser.Type.ToUpper().StartsWith("IE"))
            {
                litVideoIE.Text = litVideoIE.Text.Replace("%autoplay%", autoPlay.ToString());
                litVideoIE.Visible = true; litVideo.Visible = false;
            }
            else
            {
                litVideo.Text = litVideo.Text.Replace("%autoplay%", autoPlay.ToString());
                litVideoIE.Visible = false; litVideo.Visible = true;
            }            
        }

        private void AddActivity(DateTime ActivityDate, sActivity Activity)
        {
            string dateString = ActivityDate.ToShortDateString();

            if (!_Activities.ContainsKey(dateString))
            {
                List<sActivity> activities = new List<sActivity>();
                _Activities.Add(dateString, activities);
            }

            ((List<sActivity>)_Activities[dateString]).Add(Activity);
        }

        protected void LoadActivities(int Month, int Year)
        {
            _Activities.Clear();
            Activity activity = new Activity();

            _dtActivities = activity.GetByMonth(Month, Year);

            foreach (Shiloh.BL.Shiloh.activityRow row in _dtActivities.Rows)
            {                
                sActivity act = new sActivity();

                act.Id = row.ID;
                act.Name = row.name;
                act.Description = row.description;
                act.StartDate = row.activityStart;
                act.EndDate = row.activityEnd;

                // add to the list of activities for the day
                AddActivity(act.StartDate, act);                

                // if this is a date range then add an event for each day in the range
                int dayRange = Math.Abs(act.EndDate.Subtract(act.StartDate).Days);
                if (dayRange > 0)
                {                    
                    for (double i = 1; i <= dayRange; i++)
                    {
                        AddActivity(act.StartDate.AddDays(i), act);                
                    }
                }
            }

            BindEventList();
        }

        private Shiloh.BL.Shiloh.activityDataTable LoadDummyActvities()
        {
            Shiloh.BL.Shiloh.activityDataTable activities = new Shiloh.BL.Shiloh.activityDataTable();
            Shiloh.BL.Shiloh.activityRow row = activities.NewactivityRow();

            row.activityStart = DateTime.Now;
            row.activityEnd = DateTime.Now.AddHours(2);
            row.contactEmailAddress = "walshb@hotmail.com";
            row.contactName = "DeAndre' Braddy";
            row.description = "This event is off the chizzain! Come on down and do your dizzang!";
            row.ID = 1;
            row.name = "Event 1";
            row.tag = "";
            row.address = "";
            row.city = "";
            row.contactPhone = "";
            row.contactURL = "";
            row.frequency = 1;
            row.hostCommunityID = 0;
            row.imagePath = "";
            row.location = "";
            row.state = "";
            row.zipCode = "";

            activities.Rows.Add(row);

            row = activities.NewactivityRow();
            row.activityStart = DateTime.Now;
            row.activityEnd = DateTime.Now.AddHours(2);
            row.contactEmailAddress = "walshb@hotmail.com";
            row.contactName = "DeAndre' Braddy";
            row.description = "This event is off the chizzain! Come on down and do your dizzang! This event is off the chizzain! Come on down and do your dizzang! This event is off the chizzain! Come on down and do your dizzang!";
            row.ID = 2;
            row.name = "Event 2";
            row.tag = "";
            row.address = "";
            row.city = "";
            row.contactPhone = "";
            row.contactURL = "";
            row.frequency = 1;
            row.hostCommunityID = 0;
            row.imagePath = "";
            row.location = "";
            row.state = "";
            row.zipCode = "";

            activities.Rows.Add(row);

            row = activities.NewactivityRow();
            row.activityStart = DateTime.Now;
            row.activityEnd = DateTime.Now.AddHours(2);
            row.contactEmailAddress = "walshb@hotmail.com";
            row.contactName = "DeAndre' Braddy";
            row.description = "This event is off the chizzain! Come on down and do your dizzang!This event is off the chizzain! Come on down and do your dizzang!";
            row.ID = 3;
            row.name = "Event 3";
            row.tag = "";
            row.address = "";
            row.city = "";
            row.contactPhone = "";
            row.contactURL = "";
            row.frequency = 1;
            row.hostCommunityID = 0;
            row.imagePath = "";
            row.location = "";
            row.state = "";
            row.zipCode = "";

            activities.Rows.Add(row);

            row = activities.NewactivityRow();
            row.activityStart = DateTime.Now;
            row.activityEnd = DateTime.Now.AddHours(2);
            row.contactEmailAddress = "walshb@hotmail.com";
            row.contactName = "DeAndre' Braddy";
            row.description = "This event is off the chizzain! Come on down and do your dizzang!";
            row.ID = 4;
            row.name = "Event 4";
            row.tag = "";
            row.address = "";
            row.city = "";
            row.contactPhone = "";
            row.contactURL = "";
            row.frequency = 1;
            row.hostCommunityID = 0;
            row.imagePath = "";
            row.location = "";
            row.state = "";
            row.zipCode = "";
            activities.Rows.Add(row);

            return activities;

        }

        protected string GetDescription(string Description)
        {
            string desc = string.Empty;

            if (!string.IsNullOrEmpty(Description))
               desc = (Description.Length > 25) ? Description.Substring(0, 24) + "..." : Description;

            return desc.ToUpper();
        }

        protected string BuildDateHeader(DateTime StartDate, DateTime EndDate)
        {
            string dateHdr = string.Empty;

            // if the start and end dates are the same, just show the one date
            if (StartDate.Date.CompareTo(EndDate.Date) == 0)
            {
                dateHdr = StartDate.ToString("dddd, MMM dd");
            }
            else
            {
                // if the months are the same, then just show the day
                if (StartDate.Month == EndDate.Month)
                    dateHdr = string.Concat(StartDate.ToString("dddd, MMM dd"), " - " , EndDate.ToString("dd"));
                else
                    dateHdr = string.Concat(StartDate.ToString("dddd, MMM dd") , " - " , EndDate.ToString("MMM dd"));
            }

            return dateHdr;
        }

        protected string BuildEventURL(int EventId, DateTime ActivityDate)
        {
            string eventLink = "/Calendar.aspx?dt=%date%&eid=%eid%";
            eventLink = eventLink.Replace("%date%", ActivityDate.ToString("yyyyMMdd")).Replace("%eid%", EventId.ToString());

            return eventLink;
        }

        protected void BindEventList()
        {
            int activityCount = 0;
            Activity activity = new Activity();
            _dtActivities = activity.GetByMonth(DateTime.Now.Month, DateTime.Now.Year);
            //_dtActivities = LoadDummyActvities();
            
            List<Shiloh.BL.Shiloh.activityRow> shortList = new List<Shiloh.BL.Shiloh.activityRow>();

            if (_dtActivities != null)
            {
                foreach (Shiloh.BL.Shiloh.activityRow row in _dtActivities.Rows)
                {
                    if (activityCount < 2)
                    {
                        if (row.activityEnd.CompareTo(DateTime.Now.Date) >= 0)
                        {
                            shortList.Add(row);
                            activityCount += 1;
                        }
                    }
                    else
                        break;
                }

                // flip header and footer status
                if (shortList.Count > 0)
                {
                    pnlEvents.Visible = true;
                    pnlFallback.Visible = false;
                }
                else
                {
                    pnlEvents.Visible = false;
                    pnlFallback.Visible = true;
                }
                   
                dlEvents.DataSource = shortList;
                dlEvents.DataBind();
            }            
        }


        #endregion

        #region Calendar Events

        protected void ucCalendar_MonthChanged(object sender, ShilohWeb.Controls.EventsCalendar.MonthChangeEventArgs e)
        {
            BindEventList();
        }

        #endregion
    }
}
