using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using SampleDbCSharp.Models;

namespace SampleDbCSharp.DAL
{
    public class CategoryDAL
    {
        private string GetConnStr()
        {
            return WebConfigurationManager
                .ConnectionStrings["WingToysDbConnectionString"].ConnectionString;
        }

        public IEnumerable<Category> GetAll()
        {
            List<Category> lstCategory = new List<Category>();
            using (SqlConnection conn = new SqlConnection(GetConnStr()))
            {
                string strSql = @"select * from Categories
                                  order by CategoryName asc";
                SqlCommand cmd = new SqlCommand(strSql, conn);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        lstCategory.Add(new Category
                        {
                            CategoryID = Convert.ToInt32(dr["CategoryID"]),
                            CategoryName = dr["CategoryName"].ToString(),
                            Description = dr["Description"].ToString()
                        });
                    }
                }
                dr.Close();
                cmd.Dispose();
                conn.Close();
            }
            return lstCategory;
        }

        public void Insert(string CategoryName,string Description)
        {
            using (SqlConnection conn = new SqlConnection(GetConnStr()))
            {
                string strSql = @"insert into Categories(CategoryName,Description) values(@CategoryName,@Description)";
                SqlCommand cmd = new SqlCommand(strSql, conn);
                try
                {
                    conn.Open();
                    cmd.Parameters.AddWithValue("@CategoryName", CategoryName);
                    cmd.Parameters.AddWithValue("@Description", Description);

                    cmd.ExecuteNonQuery();
                }
                catch (SqlException sqlEx)
                {
                    throw new Exception(sqlEx.Message);
                }
                finally
                {
                    cmd.Dispose();
                    conn.Close();
                }
            }
        }
    }
}