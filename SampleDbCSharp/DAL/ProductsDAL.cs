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

        public IEnumerable<ViewProductWithCategory> GetAll()
        {
            using(SqlConnection conn = new SqlConnection(GetConnStr()))
            {
                string strSql = @"select * from ViewProductWithCategory order by ProductName asc";
                var results = conn.Query<ViewProductWithCategory>(strSql);
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

        public void UpdateProduct(int ProductID,string ProductName, string Description,
            string ImagePath, double? UnitPrice, int? CategoryID)
        {
            using (SqlConnection conn = new SqlConnection(GetConnStr()))
            {
                //parameterize query agar tidak kena sql injection
                string strSql = @"update Products set ProductName=@ProductName,Description=@Description,
                                ImagePath=@ImagePath,UnitPrice=@UnitPrice,CategoryID=@CategoryID 
                                where ProductID=@ProductID";
                var param = new
                {
                    ProductName = ProductName,
                    Description = Description,
                    ImagePath = ImagePath,
                    UnitPrice = UnitPrice,
                    CategoryID = CategoryID,
                    ProductID = ProductID
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