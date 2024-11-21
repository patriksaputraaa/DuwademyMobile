using DuwademyMobile.Data;
using DuwademyMobile.ViewModel;
using Microsoft.Maui.Controls;

namespace DuwademyMobile.Pages
{
    public partial class Categories : ContentPage
    {
        private readonly CategoriesViewModel _viewModel;

        public Categories()
        {
            InitializeComponent();
            _viewModel = new CategoriesViewModel();
            BindingContext = _viewModel;
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();

            // Refresh data every time the page appears
            if (_viewModel.LoadCategoriesCommand.CanExecute(null))
            {
                _viewModel.LoadCategoriesCommand.Execute(null);
            }
        }

        private async void OnAddCategoryClicked(object sender, EventArgs e)
        {
            // Navigate to AddCategoryPage
            await Navigation.PushAsync(new AddCategoryPage());
        }

        private async void OnCategorySelected(object sender, SelectedItemChangedEventArgs e)
        {
            if (e.SelectedItem is Category selectedCategory)
            {
                // Navigate to UpdateCategoryPage with the selected category
                await Navigation.PushAsync(new UpdateCategoryPage(selectedCategory));

                // Clear the selection
                ((ListView)sender).SelectedItem = null;
            }
        }


        private async void OnDeleteCategoryClicked(object sender, EventArgs e)
        {
            if (sender is MenuItem menuItem && menuItem.CommandParameter is Category categoryToDelete)
            {
                // Confirm before deleting
                var confirmed = await DisplayAlert(
                    "Delete Category",
                    $"Are you sure you want to delete the category \"{categoryToDelete.Name}\"?",
                    "Yes",
                    "No");

                if (confirmed)
                {
                    await _viewModel.DeleteCategoryCommand.ExecuteAsync(categoryToDelete);
                }
            }
        }
    }
}
