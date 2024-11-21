namespace DuwademyMobile.Pages;

public partial class AddCourse : ContentPage
{
	public AddCourse()
	{
		InitializeComponent();
	}

    private async void OnAddCourseButtonClicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new AddCoursePage());
    }

}