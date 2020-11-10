using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SampleDbCSharp.Models
{
    public class Product
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public string Description { get; set; }
        public string ImagePath { get; set; }
        public double? UnitPrice { get; set; }
        public int? CategoryID { get; set; }
    }
}