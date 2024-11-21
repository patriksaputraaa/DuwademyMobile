using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using DuwademyMobile.Data;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using CommunityToolkit.Mvvm.Messaging;

namespace DuwademyMobile.ViewModels
{
    public partial class AddCourseViewModel : ObservableObject
    {
        [ObservableProperty]
        string courseName;

        [ObservableProperty]
        string courseImageName;

        [ObservableProperty]
        int courseDuration;

        [ObservableProperty]
        string courseDescription;

        [ObservableProperty]
        Category courseCategory;

        [ObservableProperty]
        List<Category> categories;

        private readonly HttpClient _httpClient;

        // Constructor for Add Course
        public AddCourseViewModel()
        {
            // Initialize values for adding a new course
            CourseName = string.Empty;
            CourseImageName = string.Empty;
            CourseDuration = 0;
            CourseDescription = string.Empty;
            CourseCategory = null;
            _httpClient = new HttpClient();
        }

        // Command to save the new course
        [RelayCommand]
        public async Task SaveData()
        {
            if (string.IsNullOrWhiteSpace(CourseName)) return;

            var newCourse = await CourseManager.Add(CourseName, CourseImageName, CourseDuration, CourseDescription, CourseCategory);

            if (newCourse != null)
            {
                // Send refresh message
                WeakReferenceMessenger.Default.Send(new RefreshMessage(true));

                // Navigate back to the previous page
                await Shell.Current.GoToAsync("..");
            }
        }

        // Command to cancel and go back
        [RelayCommand]
        async Task DoneEditing()
        {
            await Shell.Current.GoToAsync("..");
        }

        public async Task LoadCategoriesAsync()
        {
            try
            {
                var response = await _httpClient.GetStringAsync("https://api.example.com/categories"); // Replace with your API URL
                var categoryList = JsonConvert.DeserializeObject<List<Category>>(response);
                Categories = categoryList;
            }
            catch (Exception ex)
            {
                // Handle error (you can display a message or log it)
                Console.WriteLine($"Error loading categories: {ex.Message}");
            }
        }
    }
}
