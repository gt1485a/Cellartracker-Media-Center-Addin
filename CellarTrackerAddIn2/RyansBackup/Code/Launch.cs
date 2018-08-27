using System;
using System.Collections;
using System.Collections.Generic;
using Microsoft.MediaCenter.Hosting;
using Microsoft.MediaCenter.UI;
using Microsoft.MediaCenter.DataAccess;
using System.Web;
using System.IO;
using System.Net;
using System.Diagnostics;

namespace CellarTrackerAddIn2
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
            s_session.GoToPage(@"resx://CellarTrackerAddIn2/CellarTrackerAddIn2.Resources/CellarMain");
        }

        public Image GetImage(string ImgSource)
        {
            Image OutImg = null;
            if (ImgSource.Length > 0)
            {
                try
                {
                    WebRequest req = WebRequest.Create(ImgSource);
                    WebResponse response = req.GetResponse();
                    Stream stream = response.GetResponseStream();
                    System.Drawing.Image TI = System.Drawing.Image.FromStream(stream);
                    ImageRequirements IR = new ImageRequirements(false);
                    OutImg = Image.FromSystemImage(TI, IR);
                    stream.Close();
                }
                catch (Exception)
                {
                    //Trace.Writeline("There was a problem downloading the file");
                }
            }
            return OutImg;


        }
        public int GetJumps(String CurrentPos, string WineName, XmlRemoteValueList Items)
        {
            int Jumps = 0;
            int CurrPos = int.Parse(CurrentPos);
            if (WineName.Length == 0) return -1;
            for (int ii = 0; ii < Items.List.Count; ii++)
            {
  
                String Name = ((PropertySet)Items.List[ii]).Entries["Wine"].ToString();

                bool StatOK = true;

                if (WineName.Length > 0 && !Name.ToLower().StartsWith(WineName.ToLower())) StatOK = false;
                if (StatOK)
                {
                    Jumps = ii - CurrPos;
                    Jumps = ii;
                    break;
                }

            }
           
            return Jumps;
        }

        public XmlRemoteValueList FilterList(string WineName, string WineVintage, string WineType, string WineRegion, string WineCountry, XmlRemoteValueList Wines)
        {
            SortableList NewWines = new SortableList();
            
            for (int ii = 0; ii < Wines.List.Count; ii++)
            {
                bool StatOK = true;
                String Country = ((PropertySet)Wines.List[ii]).Entries["Locale"].ToString();
                String Type = ((PropertySet)Wines.List[ii]).Entries["Type"].ToString();
                String Vintage = ((PropertySet)Wines.List[ii]).Entries["Vintage"].ToString();
                String Name = ((PropertySet)Wines.List[ii]).Entries["Wine"].ToString();

                if (WineName.Length > 0 && !Name.ToLower().Contains(WineName.ToLower())) StatOK = false;
                if (WineVintage.Length > 0 && !Vintage.ToLower().Contains(WineVintage.ToLower())) StatOK = false;
                if (WineType.Length > 0 && !Type.ToLower().Contains(WineType.ToLower())) StatOK = false;
                if (WineCountry.Length > 0 && !Country.ToLower().Contains(WineCountry.ToLower())) StatOK = false;
                if (WineRegion.Length > 0 && !Country.ToLower().Contains(WineRegion.ToLower())) StatOK = false;

                if(StatOK) NewWines.Add(Wines.List[ii]);
            }
            Wines.List = NewWines;
            return Wines;
        }

        public string RoundString(string Input, int places)
        {
            double outval;
            double.TryParse (Input,out outval);
            return Math.Round(outval, places).ToString();
        }

    }
}