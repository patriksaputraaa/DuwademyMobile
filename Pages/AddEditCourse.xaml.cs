using DuwademyMobile.ViewModels;

namespace DuwademyMobile.Pages;

public partial class AddEditCourse : ContentPage
{
	public AddEditCourse()
	{
		InitializeComponent();
        BindingContext = new AddEditCourseViewModel();
    }
}