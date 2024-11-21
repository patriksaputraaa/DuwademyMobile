using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using CommunityToolkit.Mvvm.Messaging;
using System.Collections.ObjectModel;
using DuwademyMobile.Data;

namespace DuwademyMobile.ViewModel
{
    public partial class CoursesViewModel : ObservableObject
    {
        [ObservableProperty] string pageTitle;
        [ObservableProperty] ObservableCollection<Course> courses = new();
        [ObservableProperty] ObservableCollection<Course> filteredCourses = new();
        [ObservableProperty] bool isRefreshing = false;
        [ObservableProperty] bool isBusy = false;
        [ObservableProperty] Course selectedCourse;
        [ObservableProperty] string searchText = string.Empty;
        [ObservableProperty] Course editingCourse = new();
        [ObservableProperty]
        ObservableCollection<string> categories = new();


        public CoursesViewModel()
        {
            Task.Run(LoadData);
            Task.Run(LoadCategoriesAsync);
            WeakReferenceMessenger.Default.Register<RefreshMessage>(this, async (r, m) =>
            {
                await LoadData();
            });
        }

        // Initializes PageTitle and EditingCourse for Add or Edit
        public void Initialize(Course course = null)
        {
            PageTitle = course == null ? "Add Course" : "Edit Course";
            EditingCourse = course ?? new Course();
        }

        // Saves the current EditingCourse, either adding or updating
        [RelayCommand]
        public async Task SaveCourse()
        {
            if (string.IsNullOrWhiteSpace(EditingCourse.Name)) return;

            try
            {
                if (EditingCourse.Id == 0)  // Add new course
                {
                    var addedCourse = await CourseManager.Add(EditingCourse.Name, EditingCourse.ImageName, EditingCourse.Duration, EditingCourse.Description, EditingCourse.Category);
                    if (addedCourse != null)
                    {
                        Courses.Add(addedCourse);
                        FilterCourses();
                    }
                }
                else  // Update existing course
                {
                    await CourseManager.Update(EditingCourse);
                    await LoadData();
                }
            }
            finally
            {
                EditingCourse = new Course();
            }
        }

        // Command to handle course selection and navigate to edit
        [RelayCommand]
        async Task CourseSelected()
        {
            if (SelectedCourse == null) return;
            await NavigateToAddEditCourse(SelectedCourse);
            SelectedCourse = null;
        }

        // Loads courses from CourseManager and refreshes list
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

        // Filters courses based on search text
        [RelayCommand]
        void FilterCourses()
        {
            FilteredCourses.Clear();
            var query = SearchText?.Trim().ToLower();
            foreach (var course in Courses)
            {
                if (string.IsNullOrEmpty(query) || course.Name.ToLower().Contains(query))
                {
                    FilteredCourses.Add(course);
                }
            }
        }

        // Initializes a new course and navigates to AddEditCourse page
        [RelayCommand]
        async Task AddNewCourse()
        {
            Initialize();
            await NavigateToAddEditCourse();
        }

        // Deletes a specific course and updates lists
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

        // Command to handle course update and navigation
        [RelayCommand]
        async Task UpdateCourse(Course course)
        {
            if (course == null || IsBusy) return;
            await NavigateToAddEditCourse(course);
        }

        // Navigates to AddEditCourse page, passing the selected course as parameter if editing
        private async Task NavigateToAddEditCourse(Course course = null)
        {
            try
            {
                IsBusy = true;

                var parameters = new Dictionary<string, object>
                {
                    { "course", course }
                };
                await Shell.Current.GoToAsync("addeditcourse", parameters);
            }
            finally
            {
                IsBusy = false;
            }
        }

        // Cancel command to reset EditingCourse and navigate back
        [RelayCommand]
        async Task Cancel()
        {
            EditingCourse = new Course();
            await Shell.Current.GoToAsync("..");
        }

        // Helper method to get valid image source or default image
        private static string defaultImage = "default_image.jpg"; // Path to your default image
        public static string GetImageSource(string imageName)
        {
            return IsValidImageUrl(imageName) ? imageName : defaultImage;
        }

        // Validates the image URL based on common extensions
        private static bool IsValidImageUrl(string url)
        {
            if (string.IsNullOrWhiteSpace(url))
                return false;

            var validExtensions = new List<string> { ".jpg", ".jpeg", ".png", ".gif", ".bmp" };
            return validExtensions.Any(ext => url.EndsWith(ext, StringComparison.OrdinalIgnoreCase));
        }

        private async Task LoadCategoriesAsync()
        {
            if (IsBusy) return;

            try
            {
                IsBusy = true;

                var fetchedCategories = await CategoryManager.GetAll();

                MainThread.BeginInvokeOnMainThread(() =>
                {
                    Categories.Clear();
                    foreach (var category in fetchedCategories)
                    {
                        Categories.Add(category.Name); // Assuming `Name` is the property to display
                    }
                    Console.WriteLine($"Categories loaded: {string.Join(", ", Categories)}"); // Log loaded categories
                });
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error loading categories: {ex.Message}");
            }
            finally
            {
                IsBusy = false;
            }
        }


    }
}
