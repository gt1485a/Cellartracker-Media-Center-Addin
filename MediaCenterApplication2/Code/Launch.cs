using System.Collections.Generic;
using Microsoft.MediaCenter.Hosting;

using System;

namespace CellarTrackerAddIn
{
    public class MyAddIn : IAddInModule, IAddInEntryPoint
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
            //host.MediaCenterEnvironment.PlayMedia(Microsoft.MediaCenter.MediaType.Datacast,
            s_session = new HistoryOrientedPageSession();
            s_session.GoToPage("resx://CellarTrackerAddIn/CellarTrackerAddIn.Resources/Default");
            XMLData Data = new XMLData();
            Data.Test();
            
        }
       
    }
}