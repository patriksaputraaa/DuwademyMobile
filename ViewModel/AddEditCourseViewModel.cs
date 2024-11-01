using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using CommunityToolkit.Mvvm.Messaging;
using DuwademyMobile.Data;

namespace DuwademyMobile.ViewModels;

public partial class AddEditCourseViewModel : ObservableObject
{
    [ObservableProperty]
    int _courseID;

    [ObservableProperty]
    string _courseName;

    [ObservableProperty]
    string _courseImageName;

    [ObservableProperty]
    int _courseDuration;

    [ObservableProperty]
    string _courseDescription;

    [ObservableProperty]
    Category _courseCategory;

    public AddEditCourseViewModel()
    {
    }

    [RelayCommand]
    async Task SaveData()
    {
        if (CourseID <= 0)
            await InsertCourse();
        else
            await UpdateCourse();
    }

    [RelayCommand]
    async Task InsertCourse()
    {
        await CourseManager.Add(CourseName, CourseImageName, CourseDuration, CourseDescription, CourseCategory);

        WeakReferenceMessenger.Default.Send(new RefreshMessage(true));

        await Shell.Current.GoToAsync("..");
    }


    [RelayCommand]
    async Task UpdateCourse()
    {
        Course courseToSave = new()
        {
            Id = CourseID,
            Name = CourseName,
            ImageName = CourseImageName,
            Duration = CourseDuration,
            Description = CourseDescription,
            Category = CourseCategory
        };

        await CourseManager.Update(courseToSave);

        WeakReferenceMessenger.Default.Send(new RefreshMessage(true));

        await Shell.Current.GoToAsync("..");
    }

    [RelayCommand]
    async Task DeleteCourse()
    {
        if (CourseID <= 0)
            return;

        await CourseManager.Delete(CourseID);

        WeakReferenceMessenger.Default.Send(new RefreshMessage(true));

        await Shell.Current.GoToAsync("..");
    }

    [RelayCommand]
    async Task DoneEditing()
    {
        await Shell.Current.GoToAsync("..");
    }
}
