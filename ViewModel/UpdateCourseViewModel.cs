using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using DuwademyMobile.Data;
using CommunityToolkit.Mvvm.Messaging;

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

        // Constructor for Update Course
        public UpdateCourseViewModel(Course course)
        {
            // Initialize with the values from the existing course
            CourseID = course.Id;
            CourseName = course.Name;
            CourseImageName = course.ImageName;
            CourseDuration = course.Duration;
            CourseDescription = course.Description;
            CourseCategory = course.Category;
        }

        // Command to save the updated course
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

            var updatedCourse = await CourseManager.Update(courseToSave);

            if (updatedCourse != null)
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
