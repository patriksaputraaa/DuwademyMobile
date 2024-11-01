using DuwademyMobile.Data;
using Microsoft.Maui.Controls;

namespace DuwademyMobile.Pages
{
    public partial class LoginPage : ContentPage
    {
        public LoginPage()
        {
            InitializeComponent();
        }

        private async void OnLoginClicked(object sender, EventArgs e)
        {
            string username = UsernameEntry.Text;
            string password = PasswordEntry.Text;

            // Check the credentials
            if (username == "admin" && password == "password") // Change these to your desired credentials
            {
                // Store credentials in static variables
                UserCredentials.Username = username;
                UserCredentials.Password = password;

                // Navigate to the main page
                Application.Current.MainPage = new AppShell();
            }
            else
            {
                await DisplayAlert("Error", "Invalid username or password", "OK");
            }
        }
    }
}
