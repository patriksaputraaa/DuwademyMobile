using DuwademyMobile.ViewModel;
using DuwademyMobile.Data; // Ensure you include the namespace for Category

namespace DuwademyMobile.Pages
{
    public partial class UpdateCategoryPage : ContentPage
    {
        public UpdateCategoryPage(Category selectedCategory)
        {
            InitializeComponent();
            BindingContext = new UpdateCategoryViewModel(selectedCategory);
        }
    }
}
