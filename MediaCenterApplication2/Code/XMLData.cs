using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using Microsoft.MediaCenter;
using Microsoft.MediaCenter.UI;
using Microsoft.MediaCenter.Hosting;
using Microsoft.MediaCenter.DataAccess;
using System.Xml;
using System.Xml.XPath;

namespace CellarTrackerAddIn
{
    class XMLData : ModelItem
    {
        private XPathNavigator XPN;
        private XmlRemoteResource XRR;

        public void LoadData(string URI)
        {
            XmlDocument CTXML = new XmlDocument();
            CTXML.Load(URI);
            XPathDocument XPD = new XPathDocument(URI);
            XPN = XPD.CreateNavigator();
        }
        public string GetData(string XPath)
        {
            try
            {
                XPathNodeIterator Node = XPN.Select(XPath);
                Node.MoveNext();
                return Node.Current.Value;
            }
            catch (Exception e)
            {
                return "No Data";
            }
            return "No Data";
        }
        public void Test()
        {
            RemoteResourceUri RRU = new RemoteResourceUri();
            
            RRU.Uri = new Uri("http://www.cellartracker.com/api_read.asp");
            Dictionary<string, string> Querys = new Dictionary<string, string>();
            Querys.Add("user", "gt1485a");
            Querys.Add("password", "Darwin1");
            Querys.Add("API", "list");
            Querys.Add("Format", "XML");
            Querys.Add("Page", "1");
            Querys.Add("Records", "2");
            RRU.QueryPairs = Querys;
            XRR = new XmlRemoteResource();
            XRR.PropertyChanged += new PropertyChangedEventHandler(XRR_PropertyChanged);
            XRR.RequestUri = RRU;
            
            XmlRemoteValueList Wines = new XmlRemoteValueList();
            Wines.Source = "//row";
            XmlRemoteValue Vintage = new XmlRemoteValue();
            Vintage.Source = "//row/Vintage";
            XmlRemoteValue Wine = new XmlRemoteValue();
            Wine.Source = "//row/Wine";
            XmlRemoteValue Type = new XmlRemoteValue();
            Type.Source = "//row/Type";
            ArrayList D = new ArrayList();
            D.Add(Type);
            D.Add(Vintage);
            D.Add(Wine);

            Wines.Mappings = D;
            
            
        //    <Mappings>
        //  <da:XmlRemoteValueList Name="Wines" RepeatedType="PropertySet" Source="//row">
        //    <Mappings>
        //      <da:XmlRemoteValue Property="Entries.#Wine" Source="//row/Wine"/>
        //      <da:XmlRemoteValue Property="Entries.#Vintage" Source="//row/Vintage"/>
        //      <da:XmlRemoteValue Property="Entries.#Type" Source="//row/Type"/>
        //    </Mappings>
        //  </da:XmlRemoteValueList>
        //</Mappings>
            PropertySet PS = new PropertySet();
            PS.Entries.Add("Wines",Wines);
            
            XRR.Mappings = PS;
            

            XRR.GetDataFromResource();

            ArrayListDataSet F = new ArrayListDataSet();
            F.Add(new EditableText());

            
        }

        void XRR_PropertyChanged(IPropertyObject sender, string property)
        {
            Console.WriteLine("Foo");
        }
    }
}
