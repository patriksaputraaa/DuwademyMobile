using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using CommunityToolkit.Mvvm.Messaging;
using DuwademyMobile.Data;
using DuwademyMobile.Pages;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Windows.Input;


namespace DuwademyMobile.ViewModel
{
    public partial class CategoriesViewModel : ObservableObject
    {
        // Observable properties
        [ObservableProperty]
        private ObservableCollection<Category> categories = new();
        [ObservableProperty] Category selectedCategory;

        [ObservableProperty]
        private ObservableCollection<Category> filteredCategories = new();

        [ObservableProperty]
        private bool isRefreshing;

        [ObservableProperty]
        private bool isBusy;

        [ObservableProperty]
        private string searchText = string.Empty;

        public ICommand LoadCategoriesCommand { get; }

        public CategoriesViewModel()
        {
            // Register for refresh messages
            WeakReferenceMessenger.Default.Register<RefreshMessage>(this, (r, m) =>
            {
                if (m.ShouldRefresh)
                    LoadCategoriesCommand.Execute(null);
            });

            LoadCategoriesCommand = new AsyncRelayCommand(LoadData);
        }

        [RelayCommand]
        async Task LoadData()
        {
            if (IsBusy) return;

            try
            {
                IsRefreshing = true;
                IsBusy = true;

                var categoryList = await CategoryManager.GetAll();

                MainThread.BeginInvokeOnMainThread(() =>
                {
                    Categories.Clear();
                    foreach (var category in categoryList)
                    {
                        Categories.Add(category);
                    }
                    FilterCategories();
                });
            }
            catch (HttpRequestException ex)
            {
                Debug.WriteLine($"Error fetching categories: {ex.Message}");
                await Application.Current.MainPage.DisplayAlert("Error", "Failed to load categories. Please try again.", "OK");
            }
            finally
            {
                IsRefreshing = false;
                IsBusy = false;
            }
        }

        [RelayCommand]
        void FilterCategories()
        {
            var query = SearchText?.Trim().ToLower();

            FilteredCategories.Clear();
            foreach (var category in Categories)
            {
                if (string.IsNullOrEmpty(query) || category.Name.ToLower().Contains(query))
                {
                    FilteredCategories.Add(category);
                }
            }
        }

        [RelayCommand]
        async Task AddCategory()
        {
            // Navigate to the AddCategoryPage
            await Shell.Current.GoToAsync(nameof(AddCategoryPage));
        }

        [RelayCommand]
        async Task EditCategory(Category category)
        {
            if (category == null || IsBusy) return;

            try
            {
                IsBusy = true;
                // Navigate to the UpdateCategoryPage with the selected category
                var parameters = new Dictionary<string, object> { { "Category", category } };
                await Shell.Current.GoToAsync(nameof(UpdateCategoryPage), parameters);
            }
            finally
            {
                IsBusy = false;
            }
        }

        [RelayCommand]
        async Task DeleteCategory(Category category)
        {
            if (category == null || IsBusy) return;

            var confirm = await Application.Current.MainPage.DisplayAlert("Confirm Delete", $"Are you sure you want to delete \"{category.Name}\"?", "Yes", "No");
            if (!confirm) return;

            try
            {
                IsBusy = true;
                await CategoryManager.Delete(category.Id);
                Categories.Remove(category);
                FilterCategories();
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error deleting category: {ex.Message}");
                await Application.Current.MainPage.DisplayAlert("Error", "Failed to delete the category. Please try again.", "OK");
            }
            finally
            {
                IsBusy = false;
            }
        }

        [RelayCommand]
        void RefreshData()
        {
            LoadCategoriesCommand.Execute(null);
        }

        public class RefreshMessage
        {
            public bool ShouldRefresh { get; }

            public RefreshMessage(bool shouldRefresh)
            {
                ShouldRefresh = shouldRefresh;
            }
        }

        [RelayCommand]
        public async Task CategorySelected()
        {
            if (SelectedCategory == null) return;

            // Handle the logic for when a category is selected, e.g., navigate to the edit page
            await Shell.Current.GoToAsync("addeditcategory", new Dictionary<string, object> { { "Category", SelectedCategory } });
        }

    }
}
