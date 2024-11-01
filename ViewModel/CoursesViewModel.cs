using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using CommunityToolkit.Mvvm.Messaging;
using System.Collections.ObjectModel;
using DuwademyMobile.Data;

namespace DuwademyMobile.ViewModel
{
    public partial class CoursesViewModel : ObservableObject
    {
        // Add PageTitle as an observable property to set it dynamically
        [ObservableProperty] string pageTitle;

        // Other observable properties
        [ObservableProperty] ObservableCollection<Course> courses = new();
        [ObservableProperty] ObservableCollection<Course> filteredCourses = new();
        [ObservableProperty] bool isRefreshing = false;
        [ObservableProperty] bool isBusy = false;
        [ObservableProperty] Course selectedCourse;
        [ObservableProperty] string searchText = string.Empty;
        [ObservableProperty] Course editingCourse = new();

        public CoursesViewModel()
        {
            // Load courses upon ViewModel creation
            Task.Run(LoadData);

            // Register for refresh messages
            WeakReferenceMessenger.Default.Register<RefreshMessage>(this, async (r, m) =>
            {
                await LoadData();
            });
        }

        // Initializes fields for Add or Edit based on selected course
        public void Initialize(Course course = null)
        {
            if (course == null)  // Add course
            {
                PageTitle = "Add Course";
                editingCourse = new Course();
            }
            else  // Edit course
            {
                PageTitle = "Edit Course";
                editingCourse = course;
            }
        }

        // Save or update course based on current editing state
        [RelayCommand]
        public async Task SaveCourse()
        {
            if (string.IsNullOrWhiteSpace(editingCourse.Name)) return;

            if (editingCourse.Id == 0)  // Add new course
            {
                var addedCourse = await CourseManager.Add(editingCourse.Name, editingCourse.ImageName, editingCourse.Duration, editingCourse.Description, editingCourse.Category);
                if (addedCourse != null)
                {
                    courses.Add(addedCourse);
                    FilterCourses();
                }
            }
            else  // Edit existing course
            {
                await CourseManager.Update(editingCourse);
                await LoadData();
            }
        }

        // Handles selection of a course for navigation and editing
        [RelayCommand]
        async Task CourseSelected()
        {
            if (selectedCourse == null) return;

            // Navigate with selected course details
            var parameters = new Dictionary<string, object> { { "course", selectedCourse } };
            await Shell.Current.GoToAsync("addcourse", parameters);
            SelectedCourse = null;
        }

        // Load data from CourseManager and refresh lists
        [RelayCommand]
        async Task LoadData()
        {
            if (IsBusy) return;

            try
            {
                IsRefreshing = true;
                IsBusy = true;

                var courseList = await CourseManager.GetAll();
                MainThread.BeginInvokeOnMainThread(() =>
                {
                    Courses.Clear();
                    foreach (var course in courseList)
                    {
                        Courses.Add(course);
                    }
                    FilterCourses();
                });
            }
            finally
            {
                IsRefreshing = false;
                IsBusy = false;
            }
        }

        // Filter courses based on search text
        [RelayCommand]
        void FilterCourses()
        {
            FilteredCourses.Clear();
            var query = searchText?.Trim().ToLower();
            foreach (var course in Courses)
            {
                if (string.IsNullOrEmpty(query) || course.Name.ToLower().Contains(query))
                {
                    FilteredCourses.Add(course);
                }
            }
        }

        // Add a new course and reset state
        [RelayCommand]
        async Task AddNewCourse()
        {
            if (IsBusy || editingCourse == null) return;

            try
            {
                IsBusy = true;
                var addedCourse = await CourseManager.Add(editingCourse.Name, editingCourse.ImageName, editingCourse.Duration, editingCourse.Description, editingCourse.Category);
                if (addedCourse != null)
                {
                    Courses.Add(addedCourse);
                    FilterCourses();
                }
            }
            finally
            {
                IsBusy = false;
                editingCourse = new Course();
            }
        }

        // Delete a specific course and update lists
        [RelayCommand]
        async Task DeleteCourse(Course course)
        {
            if (course == null || IsBusy) return;

            try
            {
                IsBusy = true;
                await CourseManager.Delete(course.Id);
                Courses.Remove(course);
                FilterCourses();
            }
            finally
            {
                IsBusy = false;
            }
        }

        // Update course details and refresh data
        [RelayCommand]
        async Task UpdateCourse(Course course)
        {
            if (course == null || IsBusy) return;

            try
            {
                IsBusy = true;

                // Navigate to the AddEditCourse page with the selected course as a parameter
                var navigationParameter = new Dictionary<string, object>
        {
            { "course", course }
        };
                await Shell.Current.GoToAsync("addeditcourse", navigationParameter);
            }
            finally
            {
                IsBusy = false;
            }
        }



        private static string defaultImage = "default_image.jpg"; // Path to your default image
        public static string GetImageSource(string imageName)
        {
            if (IsValidImageUrl(imageName))
            {
                return imageName;
            }
            return defaultImage; // Return default image if the URL is not valid
        }

        private static bool IsValidImageUrl(string url)
        {
            if (string.IsNullOrWhiteSpace(url))
                return false;

            var validExtensions = new List<string> { ".jpg", ".jpeg", ".png", ".gif", ".bmp" };
            return validExtensions.Any(ext => url.EndsWith(ext, StringComparison.OrdinalIgnoreCase));
        }
    }
}

