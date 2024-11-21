using DuwademyMobile.Pages;
using Microsoft.Maui.Controls;

namespace DuwademyMobile
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();

            //routing.RegisterRoute(nameof(AddCategoryPage), typeof(AddCategoryPage));
            //routing.RegisterRoute(nameof(UpdateCategoryPage), typeof(UpdateCategoryPage));
            Routing.RegisterRoute(nameof(AddCategoryPage), typeof(AddCategoryPage));
            Routing.RegisterRoute(nameof(UpdateCategoryPage), typeof(UpdateCategoryPage));



        }
    }
}
