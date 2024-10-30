using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Json;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace DuwademyMobile.Data
{
    public static class CategoryManager
    {
        static readonly string BaseAddress = "https://actualbackendapp.azurewebsites.net";
        static readonly string Url = $"{BaseAddress}/api/v1/";
        private static string authorizationKey;
        static HttpClient client;

        private static async Task<HttpClient> GetClient()
        {
            if (client != null)
                return client;

            client = new HttpClient();

            if (string.IsNullOrEmpty(authorizationKey))
            {
                authorizationKey = await client.GetStringAsync($"{Url}login");
                authorizationKey = JsonSerializer.Deserialize<string>(authorizationKey);
            }

            client.DefaultRequestHeaders.Add("Authorization", authorizationKey);
            client.DefaultRequestHeaders.Add("Accept", "application/json");

            return client;
        }

        public static async Task<IEnumerable<Category>> GetAll()
        {
            if (Connectivity.Current.NetworkAccess != NetworkAccess.Internet)
                return new List<Category>();

            var client = await GetClient();
            string result = await client.GetStringAsync($"{Url}Categories");

            return JsonSerializer.Deserialize<List<Category>>(result, new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true,
            });
        }

        public static async Task<Category> Add(string name, string description)
        {
            if (Connectivity.Current.NetworkAccess != NetworkAccess.Internet)
                return new Category();
            var part = new Category()
            {
                Name = name,
                Description = description
            };
            var msg = new HttpRequestMessage(HttpMethod.Post, $"{Url}Categories");
            msg.Content = JsonContent.Create<Category>(part);
            var response = await client.SendAsync(msg);
            response.EnsureSuccessStatusCode();
            var returnedJson = await response.Content.ReadAsStringAsync();

            var insertedCategory = JsonSerializer.Deserialize<Category>(returnedJson, new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true,
            });
            return insertedCategory;
        }

        public static async Task Update(Category category)
        {
            if (Connectivity.Current.NetworkAccess != NetworkAccess.Internet)
                return;
            HttpRequestMessage msg = new(HttpMethod.Put, $"{Url}Categories/{category.Id}");
            msg.Content = JsonContent.Create<Category>(category);
            var client = await GetClient();
            var response = await client.SendAsync(msg);
            response.EnsureSuccessStatusCode();

        }

        public static async Task Delete(string categoryId)
        {
            if (Connectivity.Current.NetworkAccess != NetworkAccess.Internet)
                return;
            HttpRequestMessage msg = new(HttpMethod.Delete, $"{Url}Categories/{categoryId}");
            var client = await GetClient();
            var response = await client.SendAsync(msg);
            response.EnsureSuccessStatusCode();
        }
    }
}
