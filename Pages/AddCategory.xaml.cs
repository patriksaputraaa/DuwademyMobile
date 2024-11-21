using DuwademyMobile.ViewModel;

namespace DuwademyMobile.Pages
{
    public partial class AddCategoryPage : ContentPage
    {
        public AddCategoryPage()
        {
            InitializeComponent();
            BindingContext = new AddCategoryViewModel();
        }
    }
}
