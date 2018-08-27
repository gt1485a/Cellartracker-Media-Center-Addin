using System.Collections.Generic;
using Microsoft.MediaCenter.Hosting;

namespace MediaCenterApplication3
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
            s_session = new HistoryOrientedPageSession();
            s_session.GoToPage("resx://CellarTrackerAddIn2/CellarTrackerAddIn2.Resources.Default");
        }
    }
}