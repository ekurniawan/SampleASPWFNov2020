using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using Dapper;
using SampleDbCSharp.Models;

namespace SampleDbCSharp.DAL
{
    public class ProductsDAL
    {
        private string GetConnStr()
        {
            return WebConfigurationManager
                .ConnectionStrings["WingToysDbConnectionString"].ConnectionString;
        }

        public IEnumerable<Product> GetAll()
        {
            using(SqlConnection conn = new SqlConnection(GetConnStr()))
            {
                string strSql = @"select * from Products order by ProductName asc";
                var results = conn.Query<Product>(strSql);
                return results;
            }
        }

        public void InsertProduct(string ProductName, string Description, 
            string ImagePath,double? UnitPrice,int? CategoryID)
        {
            using (SqlConnection conn = new SqlConnection(GetConnStr()))
            {
                //parameterize query agar tidak kena sql injection
                string strSql = @"insert into Products(ProductName,Description,ImagePath,UnitPrice,CategoryID) 
                                  values(@ProductName,@Description,@ImagePath,@UnitPrice,@CategoryID)";
                var param = new
                {
                    ProductName = ProductName,
                    Description = Description,
                    ImagePath = ImagePath,
                    UnitPrice = UnitPrice,
                    CategoryID = CategoryID
                };
                try
                {
                    conn.Execute(strSql, param);
                }
                catch (SqlException sqlEx)
                {
                    throw new Exception($"Error: {sqlEx.Message}");
                }
            }
        }
    }
}