using DuwademyMobile.Data;
using DuwademyMobile.ViewModels;

namespace DuwademyMobile.Pages;

public partial class UpdateCourse : ContentPage
{
	public UpdateCourse()
	{
		InitializeComponent();
	}

    private async void OnCourseSelected(object sender, SelectedItemChangedEventArgs e)
    {
        if (e.SelectedItem is Course selectedCourse)
        {
            await Navigation.PushAsync(new UpdateCoursePage
            {
                BindingContext = new UpdateCourseViewModel(selectedCourse)
            });

            // Reset selection
            ((CollectionView)sender).SelectedItem = null;
        }
    }

}