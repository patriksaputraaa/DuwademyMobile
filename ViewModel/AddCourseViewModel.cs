using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using DuwademyMobile.Data;
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

        // Constructor for Add Course
        public AddCourseViewModel()
        {
            // Initialize values for adding a new course
            CourseName = string.Empty;
            CourseImageName = string.Empty;
            CourseDuration = 0;
            CourseDescription = string.Empty;
            CourseCategory = null;
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

    }
}
