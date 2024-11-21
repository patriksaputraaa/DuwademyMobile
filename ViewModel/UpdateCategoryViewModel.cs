using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using DuwademyMobile.Data;

namespace DuwademyMobile.ViewModel
{
    public partial class UpdateCategoryViewModel : ObservableObject
    {
        [ObservableProperty]
        private int categoryId;

        [ObservableProperty]
        private string categoryName;

        [ObservableProperty]
        private string categoryDescription;

        public UpdateCategoryViewModel(Category selectedCategory)
        {
            if (selectedCategory != null)
            {
                CategoryId = selectedCategory.Id;
                CategoryName = selectedCategory.Name;
                CategoryDescription = selectedCategory.Description;
            }
        }

        [RelayCommand]
        public async Task SaveUpdatedCategory()
        {
            if (string.IsNullOrWhiteSpace(CategoryName)) return;

            var updatedCategory = new Category
            {
                Id = CategoryId,
                Name = CategoryName,
                Description = CategoryDescription,
            };

            await CategoryManager.Update(updatedCategory);
            await Shell.Current.GoToAsync(".."); // Navigate back after updating
        }
    }
}
