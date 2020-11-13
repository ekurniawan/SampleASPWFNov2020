using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace SampleDbCSharp.Helpers
{
    public static class Helpers
    {
        public static bool CekTipeFile(string fileName)
        {
            string ekstensi = Path.GetExtension(fileName).ToLower();
            switch (ekstensi)
            {
                case ".gif":
                case ".jpg":
                case ".jpeg":
                case ".png":
                    return true;
                default:
                    return false;
            }
        }

        public static string GetRestUrl()
        {
            return "https://localhost:44354/";
        }
    }
}