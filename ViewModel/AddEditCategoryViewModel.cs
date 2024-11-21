using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using CommunityToolkit.Mvvm.Messaging;
using DuwademyMobile.Data;

namespace DuwademyMobile.ViewModel
{
    [QueryProperty(nameof(Category), "Category")]
    public partial class AddEditCategoryViewModel : ObservableObject
    {
        [ObservableProperty]
        private int categoryID;

        [ObservableProperty]
        private string? categoryName;

        [ObservableProperty]
        private string? categoryDescription;

        private Category? category;

        public Category? Category
        {
            get => category;
            set
            {
                category = value;
                Initialize(category);
            }
        }

        public void Initialize(Category? category)
        {
            if (category != null)
            {
                CategoryID = category.Id;
                CategoryName = category.Name;
                CategoryDescription = category.Description;
            }
            else
            {
                CategoryID = 0;
                CategoryName = string.Empty;
                CategoryDescription = string.Empty;
            }
        }

        [RelayCommand]
        public async Task SaveData()
        {
            if (string.IsNullOrWhiteSpace(CategoryName)) return;

            if (CategoryID <= 0)
                await InsertCategory();
            else
                await UpdateCategory();
        }

        [RelayCommand]
        public async Task InsertCategory()
        {
            var addedCategory = await CategoryManager.Add(CategoryName, CategoryDescription);
            WeakReferenceMessenger.Default.Send(new RefreshMessage(true));
            await Shell.Current.GoToAsync("..");
        }

        [RelayCommand]
        public async Task UpdateCategory()
        {
            if (CategoryID <= 0) return;

            var categoryToUpdate = new Category
            {
                Id = CategoryID,
                Name = CategoryName,
                Description = CategoryDescription,
            };

            await CategoryManager.Update(categoryToUpdate);
            WeakReferenceMessenger.Default.Send(new RefreshMessage(true));
            await Shell.Current.GoToAsync("..");
        }

        [RelayCommand]
        public async Task DeleteCategory()
        {
            if (CategoryID <= 0) return;

            await CategoryManager.Delete(CategoryID);
            WeakReferenceMessenger.Default.Send(new RefreshMessage(true));
            await Shell.Current.GoToAsync("..");
        }

        [RelayCommand]
        public async Task DoneEditing()
        {
            await Shell.Current.GoToAsync("..");
        }
    }
}
