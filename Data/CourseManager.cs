using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Json;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace DuwademyMobile.Data
{
    public static class CourseManager
    {
        static readonly string BaseAddress = "https://actualbackendapp.azurewebsites.net";
        static readonly string Url = $"{BaseAddress}/api/";
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

        public static async Task<IEnumerable<Course>> GetAll()
        {
            if (Connectivity.Current.NetworkAccess != NetworkAccess.Internet)
                return new List<Course>();

            var client = await GetClient();
            string result = await client.GetStringAsync($"{Url}Courses");

            return JsonSerializer.Deserialize<List<Course>>(result, new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true,
            });
        }

        public static async Task<Course> Add(string name, string imageName, int duration, string description, Category category)
        {
            if (Connectivity.Current.NetworkAccess != NetworkAccess.Internet)
                return new Course();
            var part = new Course()
            {
                Name = name,
                ImageName = imageName,
                Duration = duration,
                Description = description,
                Category = category,
            };
            var msg = new HttpRequestMessage(HttpMethod.Post, $"{Url}Courses");
            msg.Content = JsonContent.Create<Course>(part);
            var response = await client.SendAsync(msg);
            response.EnsureSuccessStatusCode();
            var returnedJson = await response.Content.ReadAsStringAsync();

            var insertedCourse = JsonSerializer.Deserialize<Course>(returnedJson, new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true,
            });
            return insertedCourse;
        }

        public static async Task Update(Course course)
        {
            if (Connectivity.Current.NetworkAccess != NetworkAccess.Internet)
                return;
            HttpRequestMessage msg = new(HttpMethod.Put, $"{Url}Courses/{course.Id}");
            msg.Content = JsonContent.Create<Course>(course);
            var client = await GetClient();
            var response = await client.SendAsync(msg);
            response.EnsureSuccessStatusCode();

        }

        public static async Task Delete(string courseId)
        {
            if (Connectivity.Current.NetworkAccess != NetworkAccess.Internet)
                return;
            HttpRequestMessage msg = new(HttpMethod.Delete, $"{Url}Courses/{courseId}");
            var client = await GetClient();
            var response = await client.SendAsync(msg);
            response.EnsureSuccessStatusCode();
        }
    }
}
