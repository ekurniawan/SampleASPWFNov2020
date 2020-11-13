using Newtonsoft.Json;
using SampleDbCSharp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using RestSharp;
using System.Threading.Tasks;
using System.Web;
using RestSharp.Authenticators;

namespace SampleDbCSharp.Services
{
    public class CategoryServices
    {
        private RestClient _restClient;
        public CategoryServices()
        {

        }
        public CategoryServices(string username,string password)
        {
            _restClient = new RestClient
            {
                BaseUrl = new Uri(Helpers.Helpers.GetRestUrl())
            };
            
            _restClient.Authenticator = new HttpBasicAuthenticator(username,password);
        }

        public IEnumerable<Category> GetAll()
        {
            var request = new RestRequest("api/Category", Method.GET)
            {
                RequestFormat = DataFormat.Json
            };
            var response = _restClient.Execute<List<Category>>(request);
            if (response.Data == null)
                throw new Exception($"Error: {response.ErrorMessage}");

            return response.Data;
        }

        public Category GetById(int id)
        {
            var request = new RestRequest("api/Category/{id}", Method.GET)
            {
                RequestFormat = DataFormat.Json
            };
            request.AddParameter("id", id, ParameterType.UrlSegment);

            var response = _restClient.Execute<Category>(request);
            if (response.Data == null)
                throw new Exception($"Error: {response.ErrorMessage}");
            return response.Data;
        }

        public void InsertCategory(string CategoryName,string Description)
        {
            var newCategory = new Category
            {
                CategoryName = CategoryName,
                Description = Description
            };

            var request = new RestRequest("api/Category", Method.POST)
            {
                RequestFormat = DataFormat.Json
            };
            request.AddJsonBody(newCategory);
            try
            {
                var response = _restClient.Execute(request);
                if (response.StatusCode != System.Net.HttpStatusCode.OK)
                    throw new Exception($"Error: Gagal menambahan data: {response.ErrorMessage}");
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            
        }

        public void UpdateCategory(string CategoryName, string Description, int CategoryID)
        {
            var updateCategory = new Category
            {
                CategoryName = CategoryName,
                Description = Description,
                CategoryID = CategoryID
            };
            var request = new RestRequest("api/Category/{id}", Method.PUT)
            {
                RequestFormat = DataFormat.Json
            };
            request.AddParameter("id", CategoryID, ParameterType.UrlSegment);
            request.AddJsonBody(updateCategory);
            try
            {
                var response = _restClient.Execute(request);
                if (response.StatusCode != System.Net.HttpStatusCode.OK)
                    throw new Exception($"Error: Gagal mengupdate data: {response.ErrorMessage}");
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void DeleteCategory(int CategoryID)
        {
            var result = GetById(CategoryID);
            if(result!=null)
            {
                var request = new RestRequest("api/Category/{id}", Method.DELETE)
                {
                    RequestFormat = DataFormat.Json
                };
                request.AddParameter("id", CategoryID, ParameterType.UrlSegment);
                try
                {
                    var response = _restClient.Execute(request);
                    if (response.StatusCode != System.Net.HttpStatusCode.OK)
                        throw new Exception($"{response.ErrorMessage}");
                }
                catch (Exception ex)
                {
                    throw new Exception($"Error: {ex.Message}");
                }
            }
        }
    }
}