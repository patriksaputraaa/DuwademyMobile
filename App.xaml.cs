using DuwademyMobile.Data;
using DuwademyMobile.Pages;
using Microsoft.Maui.Controls;
namespace DuwademyMobile
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            // Check if username and password are already set
            if (string.IsNullOrEmpty(UserCredentials.Username) || string.IsNullOrEmpty(UserCredentials.Password))
            {
                MainPage = new NavigationPage(new LoginPage());
            }
            else
            {
                MainPage = new AppShell(); // Set the shell with flyout
            }
        }
    }
}
