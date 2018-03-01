using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utility.Constant
{
    public static class LanguageEnum
    {
        public static List<Language> Languages()
        {
            List<Language> languages = new List<Language>();
            languages.Add(new Language() { DisplayName = "English", CultureValue = "en-US" });
            languages.Add(new Language() { DisplayName = "Spanish", CultureValue = "es-MX" });
            return languages;
        }
    }

    public class Language
    {
        public string DisplayName { get; set; }
        public string CultureValue { get; set; }
    }
}
