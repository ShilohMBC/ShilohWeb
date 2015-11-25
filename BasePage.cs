using System;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Security;
using System.Xml.Linq;
using System.ComponentModel;
using System.Configuration;
using System.Collections.Generic;

namespace ShilohWeb
{
    public class BasePage : System.Web.UI.Page
    {
        protected BasePage()
        {

        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            SetSSLMode();
        }

        #region Properties

        bool _IsSSLEnabled = true;
        protected bool IsSSLEnabled
        {
            get
            {
                if (System.Configuration.ConfigurationManager.AppSettings["SSLEnabled"] != null)
                {
                    bool isEnabled = true;

                    if (!bool.TryParse(System.Configuration.ConfigurationManager.AppSettings["SSLEnabled"].ToString(), out isEnabled))
                        isEnabled = true;

                    _IsSSLEnabled = isEnabled;
                }
                else
                    _IsSSLEnabled = true;

                return _IsSSLEnabled;
            }
        }

        [Browsable(true)]
        [Description("Determines if this page should be secure (SSL) or not")]
        public bool RequireSSL
        {
            get;
            set;
        }

        #endregion

        #region Methods

        protected void SetSSLMode()
        {
            SSLSecure();
        }

        protected void SSLSecure()
        {
            if (IsSSLEnabled)
            {
                //Force required into secure channel
                if (RequireSSL && !Request.IsSecureConnection)
                    Response.Redirect(Request.Url.ToString().Replace(BaseGlobals.UNSECURE_HTTP, BaseGlobals.SECURE_HTTP));

                //Force non-required out of secure channel
                if (!RequireSSL && Request.IsSecureConnection)
                    Response.Redirect(Request.Url.ToString().Replace(BaseGlobals.SECURE_HTTP, BaseGlobals.UNSECURE_HTTP));
            }
        }

        protected void SSLUnsecure()
        {
            //Force non-required out of secure channel
            if (!RequireSSL && Request.IsSecureConnection)
                Response.Redirect(Request.Url.ToString().Replace(BaseGlobals.SECURE_HTTP, BaseGlobals.UNSECURE_HTTP));
        }

        protected void EnsureFullDomain(string ShortDomain, string FullDomain)
        {
            if (Request.Url.ToString().ToLower().StartsWith(ShortDomain.ToLower().Replace("https:", "http:")))
            {
                Response.Redirect(FullDomain);
            }
        }

        #endregion

    }
}
