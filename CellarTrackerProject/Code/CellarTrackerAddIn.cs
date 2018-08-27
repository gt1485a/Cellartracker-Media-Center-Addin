using System;
using System.Collections.Generic;
using System.Collections;
using System.Text;
using Microsoft.MediaCenter.Hosting;
using Microsoft.MediaCenter.DataAccess;
using Microsoft.MediaCenter.UI;
using Microsoft.Win32;
using System.Web;
using System.IO;
using System.Net;

namespace CellarTrackerProject.Code
{
    public class CellarTrackerAddIn : IAddInModule, IAddInEntryPoint
    {
        private static HistoryOrientedPageSession s_session;


        public void Initialize(Dictionary<string, object> appInfo, Dictionary<string, object> entryPointInfo)
        {
            
        }

        public void Uninitialize()
        {

        }

        public void Launch(AddInHost host)
        {
            if (host != null && host.ApplicationContext != null)
            {
                host.ApplicationContext.SingleInstance = true;
            }

            s_session = new HistoryOrientedPageSession();
            s_session.GoToPage("resx://CellarTrackerProject/CellarTrackerProject.Resources/CellarMain");

            //CellarTrackerProject.Properties.Settings.Default.Username = "John";
            //CellarTrackerProject.Properties.Settings.Default.Password = "Doe";
            //CellarTrackerProject.Properties.Settings.Default.Save();
        }

        public void GetImage(Image InImage, string Source)
        {
            
            //if (Source.Length > 0)
            //{
            //    try
            //    {
            //        WebRequest req = WebRequest.Create(Source);
            //        WebResponse response = req.GetResponse();
            //        Stream stream = response.GetResponseStream();
            //        ImageRequirements IR = new ImageRequirements(false);
            //        InImage = Image.FromStream(stream, IR);
            //        stream.Close();
            //    }
            //    catch (Exception)
            //    {
            //        //Trace.Writeline("There was a problem downloading the file");
            //    }
            //}
            
            
        }
    }
}
