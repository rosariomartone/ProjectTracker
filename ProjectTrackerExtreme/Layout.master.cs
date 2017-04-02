using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace ProjectTrackerExtreme {
    public partial class Layout : System.Web.UI.MasterPage
    {
        bool showSearch = true;
        public bool ShowSearch { get { return showSearch; } set { showSearch = value; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Header.DataBind();
        }

        public void CheckLogin()
        {
            if (Session["ProjectTracker_Token"] == null)
                Response.Redirect("~/Pages/LoginPage.aspx");
        }
    }
}