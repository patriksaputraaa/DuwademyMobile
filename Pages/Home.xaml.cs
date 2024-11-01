using DuwademyMobile.ViewModel;

namespace DuwademyMobile.Pages
{
    public partial class Home : ContentPage
    {
        public Home()
        {
            InitializeComponent();
            BindingContext = new CoursesViewModel(); // Set the BindingContext to CoursesViewModel
        }

        private void OnSearchButtonPressed(object sender, EventArgs e)
        {
            var viewModel = BindingContext as CoursesViewModel;
            if (viewModel != null)
            {
                viewModel.FilterCoursesCommand.Execute(null);
            }
        }
    }
}
