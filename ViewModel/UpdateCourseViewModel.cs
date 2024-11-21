using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using DuwademyMobile.Data;
using CommunityToolkit.Mvvm.Messaging;
using System.Collections.ObjectModel;
using Newtonsoft.Json;

namespace DuwademyMobile.ViewModels
{
    public partial class UpdateCourseViewModel : ObservableObject
    {
        [ObservableProperty]
        int courseID;

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
        ObservableCollection<Category> categories;

        private readonly HttpClient _httpClient;

        // Constructor for Update Course
        public UpdateCourseViewModel(Course course)
        {
            _httpClient = new HttpClient();
            // Initialize with the values from the existing course
            CourseID = course.Id;
            CourseName = course.Name;
            CourseImageName = course.ImageName;
            CourseDuration = course.Duration;
            CourseDescription = course.Description;
            CourseCategory = course.Category;

            // Load categories when the page is loaded
            InitializeCategories();
        }
        // Create an async initialization method
        private async void InitializeCategories()
        {
            await LoadCategoriesAsync();
        }

        public async Task LoadCategoriesAsync()
        {
            try
            {
                var response = await _httpClient.GetStringAsync("https://api.example.com/categories"); // Replace with your API URL
                var categoryList = JsonConvert.DeserializeObject<List<Category>>(response);
                Categories = new ObservableCollection<Category>(categoryList);
            }
            catch (Exception ex)
            {
                // Handle error
                Console.WriteLine($"Error loading categories: {ex.Message}");
            }
        }

        [RelayCommand]
        public async Task SaveData()
        {
            if (CourseID <= 0 || string.IsNullOrWhiteSpace(CourseName)) return;

            var courseToSave = new Course
            {
                Id = CourseID,
                Name = CourseName,
                ImageName = CourseImageName,
                Duration = CourseDuration,
                Description = CourseDescription,
                Category = CourseCategory
            };

            // If Update doesn't return a value, just call it without assignment
            await CourseManager.Update(courseToSave);

            // Send refresh message
            WeakReferenceMessenger.Default.Send(new RefreshMessage(true));

            // Navigate back to the previous page
            await Shell.Current.GoToAsync("..");
        }


        // Command to cancel and go back
        [RelayCommand]
        async Task DoneEditing()
        {
            await Shell.Current.GoToAsync("..");
        }
    }
}
