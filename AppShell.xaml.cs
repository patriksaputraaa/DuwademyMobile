using DuwademyMobile.Pages;

namespace DuwademyMobile
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();

            Routing.RegisterRoute("addeditcourse", typeof(AddEditCourse));
            Routing.RegisterRoute("addeditcategory", typeof(AddEditCategory));

        }
    }
}
