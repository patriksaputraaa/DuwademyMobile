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
            _viewModel.LoadCategoriesCommand.Execute(null); // This will now call LoadData correctly.
        }


        private async void OnCategorySelected(object sender, SelectedItemChangedEventArgs e)
        {
            if (e.SelectedItem is Category selectedCategory)
            {
                await Navigation.PushAsync(new AddEditCategory(selectedCategory)); // Navigate to edit page
            }
        }
    }
}
