using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using CommunityToolkit.Mvvm.Messaging;
using DuwademyMobile.Data;

namespace DuwademyMobile.ViewModel
{
    public partial class AddCategoryViewModel : ObservableObject
    {
        [ObservableProperty]
        private string? categoryName;

        [ObservableProperty]
        private string? categoryDescription;

        [RelayCommand]
        public async Task AddCategory()
        {
            if (string.IsNullOrWhiteSpace(CategoryName))
            {
                await Application.Current.MainPage.DisplayAlert("Validation Error", "Category Name cannot be empty.", "OK");
                return;
            }

            try
            {
                await CategoryManager.Add(CategoryName, CategoryDescription);
                WeakReferenceMessenger.Default.Send(new RefreshMessage(true));
                await Shell.Current.GoToAsync("..");
            }
            catch (Exception ex)
            {
                await Application.Current.MainPage.DisplayAlert("Error", $"Failed to add category: {ex.Message}", "OK");
            }
        }

        [RelayCommand]
        public async Task Cancel()
        {
            await Shell.Current.GoToAsync("..");
        }
    }
}
