using DuwademyMobile.ViewModel;

namespace DuwademyMobile.Pages;

public partial class Courses : ContentPage
{
	public Courses()
	{
		InitializeComponent();
        BindingContext = new CoursesViewModel();
    }

    private void OnSearchButtonPressed(object sender, EventArgs e)
    {
        var viewModel = BindingContext as CoursesViewModel;
        if (viewModel != null)
        {
            viewModel.FilterCoursesCommand.Execute(null);
        }
    }

    protected override void OnAppearing()
    {
        base.OnAppearing();

        // Trigger data reload whenever the page appears
        var viewModel = BindingContext as CategoriesViewModel;
        if (viewModel != null)
        {
            viewModel.LoadDataCommand.Execute(null);
        }
    }
}