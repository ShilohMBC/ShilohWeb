using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShilohWeb.Controls {
    public partial class CommunityCalendar : System.Web.UI.UserControl {
        protected void Page_Load(object sender, EventArgs e) {
            // TODO: Add highlight for today's date and gather events for today's date for the current community
            // if (Session.Keys.Get
        }

        protected void communityCalendar_SelectionChanged(object sender, EventArgs e) {
            // TODO: Select activities for the selected date for the current community
            // TODO: Update event list informatio with the current day's events
            //          giving a default message if there are no events or list upcoming events following selected date
        }

        protected void communityCalendar_DayRender(object sender, DayRenderEventArgs e) {
            if (e.Day.IsWeekend) {
                e.Cell.BackColor = System.Drawing.Color.BlanchedAlmond;
                e.Cell.ForeColor = System.Drawing.Color.CadetBlue;
            }
            if (e.Day.IsToday) {
                e.Cell.BackColor = System.Drawing.Color.White;
                e.Cell.ForeColor = System.Drawing.Color.Black;
            }
            // TODO: If the day has an event, make the day font bold
        }
    }
}