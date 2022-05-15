using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using TextileCompanyApplication.Command;
using TextileCompanyApplication.Core;
using TextileCompanyApplication.Model;
using TextileCompanyApplication.Model.Entities;
using TextileCompanyApplication.View;

namespace TextileCompanyApplication.ViewModel
{
    public class VisitorViewModel : BaseViewModel
    {
        private const string NOT_IMPORTANT_FILTER = "Все производители";

        private ObservableCollection<ProductModel> _products;
        private ObservableCollection<Manufacturer> _manufacturers;
        private string _nameFilter;
        private Manufacturer _selectedManufacturer;
        private string _productsAmount;

        public ObservableCollection<ProductModel> Products { get => _products; set => SetProperty(ref _products, value); }
        public ObservableCollection<Manufacturer> Manufacturers { get => _manufacturers; set => SetProperty(ref _manufacturers, value); }
        public string NameFilter
        { get => _nameFilter; set { SetProperty(ref _nameFilter, value); FilterProducts(); } }
        public Manufacturer SelectedManufacturer
        { get => _selectedManufacturer; set { SetProperty(ref _selectedManufacturer, value); FilterProducts(); } }
        public string ProductsAmount { get => _productsAmount; set => SetProperty(ref _productsAmount, value); }

        public ICommand OrderByIncreasingCommand { get; private set; }
        public ICommand OrderByDecreasingCommand { get; private set; }
        public ICommand ClearFiltersCommand { get; private set; }
        public ICommand OpenAuthorizationWindowCommand { get; private set; }

        public VisitorViewModel()
        {
            OrderByIncreasingCommand = new DelegateCommand(OrderByIncreasing);
            OrderByDecreasingCommand = new DelegateCommand(OrderByDecreasing);
            ClearFiltersCommand = new DelegateCommand(ClearFilters);
            OpenAuthorizationWindowCommand = new DelegateCommand(OpenAuthorizationWindow);

            Products = new ObservableCollection<ProductModel>();
            Manufacturers = new ObservableCollection<Manufacturer>
            {
                new Manufacturer() { Value = NOT_IMPORTANT_FILTER }
            };
            SelectedManufacturer = Manufacturers[0];

            using (var context = new TradeEntities())
            {
                foreach (var manufacturer in context.Manufacturer)
                    Manufacturers.Add(manufacturer);
            }
        }

        /// <summary>
        /// Метод фильтрации товаров по названию и производителю.
        /// </summary>
        protected void FilterProducts()
        {
            Products = new ObservableCollection<ProductModel>();

            using (var context = new TradeEntities())
            {
                if (string.IsNullOrWhiteSpace(NameFilter) && SelectedManufacturer.Value.Equals(NOT_IMPORTANT_FILTER))
                    foreach (var product in context.Product)
                        Products.Add(product);
                else foreach (var product in context.Product)
                        if (string.IsNullOrWhiteSpace(NameFilter))
                        {
                            if (product.Manufacturer.Value.Equals(SelectedManufacturer.Value))
                                Products.Add(product);
                        }
                        else if (SelectedManufacturer.Value.Equals(NOT_IMPORTANT_FILTER))
                        {
                            if (product.ProductName.Contains(NameFilter))
                                Products.Add(product);
                        }
                        else if (product.Manufacturer.Value.Equals(SelectedManufacturer.Value)
                            && product.ProductName.Contains(NameFilter))
                            Products.Add(product);

                ProductsAmount = $"{Products.Count()} из {context.Product.Count()}";
            }
        }

        /// <summary>
        /// Метод фильтрации товаров по возрастанию стоимости.
        /// </summary>
        /// <param name="obj"></param>
        private void OrderByIncreasing(object obj) => Products = new ObservableCollection<ProductModel>(Products.OrderBy(p => p.Price));

        /// <summary>
        /// Метод фильтрации товаров по убыванию стоимости.
        /// </summary>
        /// <param name="obj"></param>
        private void OrderByDecreasing(object obj) => Products = new ObservableCollection<ProductModel>(Products.OrderByDescending(p => p.Price));

        /// <summary>
        /// Метод сброса фильтрации товаров.
        /// </summary>
        /// <param name="obj"></param>
        private void ClearFilters(object obj) => (NameFilter, SelectedManufacturer) = (string.Empty, Manufacturers[0]);

        /// <summary>
        /// Метод открывает окно авторизации.
        /// </summary>
        /// <param name="obj"></param>
        private void OpenAuthorizationWindow(object obj)
        {
            new AuthorizationWindow().Show();

            Application.Current.Windows.Cast<Window>().FirstOrDefault(window => window is VisitorWindow).Close();
        }
    }
}