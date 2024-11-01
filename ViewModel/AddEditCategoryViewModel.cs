using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using CommunityToolkit.Mvvm.Messaging;
using DuwademyMobile.Data;

namespace DuwademyMobile.ViewModel
{
    public partial class AddEditCategoryViewModel : ObservableObject
    {
        [ObservableProperty]
        int _categoryID;

        [ObservableProperty]
        string? _categoryName;

        [ObservableProperty]
        string? _categoryDescription;

        public void Initialize(Category? category)
        {
            if (category != null)
            {
                // We are editing an existing category
                CategoryID = category.Id; // Set the ID for the existing category
                CategoryName = category.Name;
                CategoryDescription = category.Description;
            }
            else
            {
                // We are adding a new category
                CategoryID = 0; // New category ID
                CategoryName = string.Empty;
                CategoryDescription = string.Empty;
            }
        }


        [RelayCommand]
        async Task SaveData()
        {
            // Ensure we have valid data
            if (string.IsNullOrWhiteSpace(CategoryName))
            {
                // Handle error, e.g., show a message to the user
                return;
            }

            if (CategoryID <= 0)
            {
                await InsertCategory(); // Add new category
            }
            else
            {
                await UpdateCategory(); // Update existing category
            }
        }

        [RelayCommand]
        async Task InsertCategory()
        {
            var addedCategory = await CategoryManager.Add(CategoryName, CategoryDescription);
            WeakReferenceMessenger.Default.Send(new RefreshMessage(true));
            await Shell.Current.GoToAsync("..");
        }

        [RelayCommand]
        async Task UpdateCategory()
        {
            var categoryToUpdate = new Category
            {
                Id = CategoryID, // Ensure we're using the correct ID
                Name = CategoryName,
                Description = CategoryDescription,
            };

            await CategoryManager.Update(categoryToUpdate);
            WeakReferenceMessenger.Default.Send(new RefreshMessage(true));
            await Shell.Current.GoToAsync("..");
        }

        [RelayCommand]
        async Task DeleteCategory()
        {
            if (CategoryID <= 0) return; // Can't delete if the ID is invalid

            await CategoryManager.Delete(CategoryID); // Delete the category
            WeakReferenceMessenger.Default.Send(new RefreshMessage(true)); // Notify of refresh
            await Shell.Current.GoToAsync(".."); // Navigate back
        }

        [RelayCommand]
        async Task DoneEditing()
        {
            await Shell.Current.GoToAsync(".."); // Navigate back without saving
        }
    }
}
