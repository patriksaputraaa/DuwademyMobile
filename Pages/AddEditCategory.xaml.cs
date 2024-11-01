using DuwademyMobile.Data;
using DuwademyMobile.ViewModel;
using Microsoft.Maui.Controls;

namespace DuwademyMobile.Pages
{
    public partial class AddEditCategory : ContentPage
    {
        private readonly AddEditCategoryViewModel _viewModel;

        // Constructor for editing a category
        public AddEditCategory(Category? category = null)
        {
            InitializeComponent();
            _viewModel = new AddEditCategoryViewModel();
            BindingContext = _viewModel;

            // Initialize the ViewModel based on whether we are adding or editing
            if (category != null)
            {
                _viewModel.Initialize(category);
            }
            else
            {
                _viewModel.Initialize(null); // For a new category
            }
        }

        // Constructor for adding a new category
        public AddEditCategory()
        {
            InitializeComponent();
            _viewModel = new AddEditCategoryViewModel();
            BindingContext = _viewModel;

            // Initialize ViewModel for adding a new category
            _viewModel.Initialize(null);
        }

        private async void OnSaveClicked(object sender, EventArgs e)
        {
            await _viewModel.SaveDataCommand.ExecuteAsync(null);
        }

        private async void OnCancelClicked(object sender, EventArgs e)
        {
            await Navigation.PopAsync(); // Just navigate back without saving
        }
    }
}
