using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using CommunityToolkit.Mvvm.Messaging;
using System.Collections.ObjectModel;
using System.Collections.Generic;
using System.Threading.Tasks;
using DuwademyMobile.Data;
using Microsoft.Maui.Controls;

namespace DuwademyMobile.ViewModel
{
    public partial class HomeViewModel : ObservableObject
    {
        [ObservableProperty]
        ObservableCollection<Course> _courses;

        [ObservableProperty]
        bool _isRefreshing = false;

        [ObservableProperty]
        bool _isBusy = false;

        [ObservableProperty]
        Course _selectedCourse;

        public HomeViewModel()
        {
            _courses = new ObservableCollection<Course>();

            // Registering for refresh messages
            WeakReferenceMessenger.Default.Register<RefreshMessage>(this, async (r, m) =>
            {
                await LoadData();
            });

            // Load courses initially
            Task.Run(LoadData);
        }

        [RelayCommand]
        async Task CourseSelected()
        {
            if (SelectedCourse == null)
                return;

            var navigationParameter = new Dictionary<string, object>
            {
                { "course", SelectedCourse }
            };

            // Navigate to the add course page
            await Shell.Current.GoToAsync("addcourse", navigationParameter);

            // Clear the selected course after navigation
            MainThread.BeginInvokeOnMainThread(() => SelectedCourse = null);
        }

        [RelayCommand]
        async Task LoadData()
        {
            if (IsBusy)
                return;

            try
            {
                IsRefreshing = true;
                IsBusy = true;

                var coursesCollection = await CourseManager.GetAll();

                // Update the courses collection on the main thread
                MainThread.BeginInvokeOnMainThread(() =>
                {
                    Courses.Clear();

                    foreach (var course in coursesCollection)
                    {
                        Courses.Add(course);
                    }
                });
            }
            catch (Exception ex)
            {
                // Handle any exceptions, e.g., display an alert
                await Application.Current.MainPage.DisplayAlert("Error", $"Failed to load courses: {ex.Message}", "OK");
            }
            finally
            {
                IsRefreshing = false;
                IsBusy = false;
            }
        }

        [RelayCommand]
        async Task AddNewCourse()
        {
            await Shell.Current.GoToAsync("addcourse");
        }
    }
}
