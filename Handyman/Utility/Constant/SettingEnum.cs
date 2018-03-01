using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utility.Constant
{
    public static class SettingEnum
    {
        public static List<SettingType> AllSettings()
        {
            List<SettingType> list = new List<SettingType>();
            list.Add(new SettingType() { DisplayName = "Admin notification email", SystemName = "AdminEmailNotification" });
            return list;
        }
    }

    public class SettingType
    {
        public string DisplayName { get; set; }
        public string SystemName { get; set; }
    }
}
