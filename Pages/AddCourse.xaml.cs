namespace DuwademyMobile.Pages;
using DuwademyMobile.Pages;
using DuwademyMobile.ViewModels;

public partial class AddCourse : ContentPage
{
	public AddCourse()
	{
		InitializeComponent();
        BindingContext = new AddCourseViewModel();
    }

    private async void OnAddCourseButtonClicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new AddCourse());
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();

        // Load categories from the API
        var viewModel = (AddCourseViewModel)BindingContext;
        await viewModel.LoadCategoriesAsync();
    }

}