using System;
using System.Globalization;
using System.Collections.Generic;
using System.IO;
using System.Threading;
using Microsoft.MediaCenter.UI;

namespace CellarTrackerAddIn2.Code
{
    public class WineList : VirtualList
    {

        public WineList() 
        {
            Count = GetCellarSize();
            VisualReleaseBehavior = ReleaseBehavior.Dispose;
            EnableSlowDataRequests = true;
        }

        public int GetCellarSize()
        {
            return 100;
        }
        

    }

    public class Wine : ModelItem
    {
        
    }

    
}
