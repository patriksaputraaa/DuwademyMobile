using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Collections.ObjectModel;
using DuwademyMobile.Data;
using System.Windows.Input;
using System.Diagnostics;

namespace DuwademyMobile.ViewModel
{
    public partial class CategoriesViewModel : ObservableObject
    {
        // Observable properties
        [ObservableProperty] string pageTitle;
        [ObservableProperty] ObservableCollection<Category> categories = new();
        [ObservableProperty] ObservableCollection<Category> filteredCategories = new();
        [ObservableProperty] bool isRefreshing = false;
        [ObservableProperty] bool isBusy = false;
        [ObservableProperty] Category selectedCategory;
        [ObservableProperty] string searchText = string.Empty;
        [ObservableProperty] Category editingCategory = new();
        public ICommand LoadCategoriesCommand { get; }
        public int CategoryID { get; private set; }
        public string CategoryName { get; private set; }
        public string CategoryDescription { get; private set; }

        public CategoriesViewModel()
        {
            LoadCategoriesCommand = new Command(async () => await LoadData());
        }
        public void Initialize(Category category = null)
        {
            if (category == null)  // Add category
            {
                PageTitle = "Add Category";
                EditingCategory = new Category(); // Create a new instance for adding
            }
            else  // Edit category
            {
                PageTitle = "Edit Category";
                EditingCategory = category; // Use the passed category for editing
                CategoryID = category.Id; // Assuming you have a property for ID in the ViewModel
                CategoryName = category.Name; // Assuming you have a property for Name
                CategoryDescription = category.Description; // Assuming you have a property for Description
            }
        }


        [RelayCommand]
        public async Task SaveCategory()
        {
            // Ensure the editingCategory is set correctly
            if (editingCategory == null || string.IsNullOrWhiteSpace(editingCategory.Name)) return;

            // Check if this is a new category (assuming Id is 0 for new categories)
            try
            {
                // Adding a new category
                if (editingCategory.Id == 0)
                {
                    var addedCategory = await CategoryManager.Add(editingCategory.Name, editingCategory.Description);
                    if (addedCategory != null)
                    {
                        categories.Add(addedCategory);
                        await LoadData(); // Refresh the category list
                        await Shell.Current.GoToAsync(".."); // Navigate back
                    }
                    else
                    {
                        Debug.WriteLine("Failed to add the category.");
                    }
                }
                else
                {
                    // Updating an existing category
                    await CategoryManager.Update(editingCategory);
                    await LoadData(); // Refresh the category list
                    await Shell.Current.GoToAsync(".."); // Navigate back
                }
            }
            catch (Exception ex)
            {
                // Handle or log exception
                Debug.WriteLine($"Error saving category: {ex.Message}");
            }

        }


        [RelayCommand]
        async Task LoadData()
        {
            if (IsBusy) return;

            try
            {
                IsRefreshing = true;
                IsBusy = true;

                // Ensure this is the correct endpoint
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
                // Log the error
                Debug.WriteLine($"Error fetching categories: {ex.Message}");
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
            FilteredCategories.Clear();
            var query = searchText?.Trim().ToLower();
            foreach (var category in Categories)
            {
                if (string.IsNullOrEmpty(query) || category.Name.ToLower().Contains(query))
                {
                    FilteredCategories.Add(category);
                }
            }
        }

        [RelayCommand]
        async Task UpdateCategory(Category category)
        {
            if (category == null || IsBusy) return;

            try
            {
                IsBusy = true;
                // Navigate to the AddEditCategory page for editing the selected category
                await Shell.Current.GoToAsync("addeditcategory", new Dictionary<string, object> { { "category", category } });
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

            try
            {
                IsBusy = true;
                await CategoryManager.Delete(category.Id);
                Categories.Remove(category);
                FilterCategories();
            }
            finally
            {
                IsBusy = false;
            }
        }

        [RelayCommand]
        async Task AddNewCategory()
        {
            // Initialize for adding a new category and navigate to the AddEditCategory page
            Initialize(null); // Call Initialize with null to set up for adding a new category
            await Shell.Current.GoToAsync("addeditcategory");
        }

        [RelayCommand]
        async Task CategorySelected()
        {
            if (SelectedCategory == null) return;

            // Navigate to the add/edit page with the selected category
            var parameters = new Dictionary<string, object> { { "category", SelectedCategory } };
            await Shell.Current.GoToAsync("addeditcategory", parameters);
            SelectedCategory = null; // Reset the selected category
        }


    }
}
