using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using CommunityToolkit.Mvvm.Messaging;
using System.Collections.ObjectModel;
using System.ComponentModel;
using DuwademyMobile.Data;

namespace DuwademyMobile.ViewModel
{
    public partial class CategoriesViewModel : ObservableObject
    {
        [ObservableProperty]
        ObservableCollection<Category> _categories;

        [ObservableProperty]
        bool _isRefreshing = false;

        [ObservableProperty]
        bool _isBusy = false;

        [ObservableProperty]
        Category _selectedCategory;

        public CategoriesViewModel()
        {
            _categories = new ObservableCollection<Category>();

            WeakReferenceMessenger.Default.Register<RefreshMessage>(this, async (r, m) =>
            {
                await LoadData();
            });

            Task.Run(LoadData);
        }

        [RelayCommand]
        async Task PartSelected()
        {
            if (SelectedCategory == null)
                return;

            var navigationParameter = new Dictionary<string, object>()
        {
            { "part", SelectedCategory }
        };

            await Shell.Current.GoToAsync("addcategory", navigationParameter);

            MainThread.BeginInvokeOnMainThread(() => SelectedCategory = null);
        }

        [RelayCommand]
        async Task LoadData()
        {
            if (IsBusy)
                return;

            try
            {
                IsRefreshing = true;
                IsBusy = true;

                var categoriesCollection = await CategoryManager.GetAll();

                MainThread.BeginInvokeOnMainThread(() =>
                {
                    Category.Clear();

                    foreach (Category part in categoriesCollection)
                    {
                        Category.Add(part);
                    }
                });
            }
            finally
            {
                IsRefreshing = false;
                IsBusy = false;
            }
        }

        [RelayCommand]
        async Task AddNewCategory()
        {
            await Shell.Current.GoToAsync("addcategory");
        }
    }
}
