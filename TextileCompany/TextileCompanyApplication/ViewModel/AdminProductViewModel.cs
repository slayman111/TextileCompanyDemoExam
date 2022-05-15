using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using TextileCompanyApplication.Command;
using TextileCompanyApplication.Core;
using TextileCompanyApplication.Model.Entities;
using TextileCompanyApplication.View;

namespace TextileCompanyApplication.ViewModel
{
    public class AdminProductViewModel : BaseViewModel
    {
        private const string INVALID_PRICE = "Цена не должна быть меньше нуля";
        private const string INVALID_MAX_DISCOUNT = "Минимальная скидка не должна быть отрицательной";
        private const string INVALID_CURRENT_SICOUNT = "Текущая скидка не должна быть отрицательной";
        private const string INVALID_AMOUNT = "Кол-во не должно быть отрицательной";
        private const string EMPTY_TEXT_FIELDS = "Заполните все поля";
        private const string PRODUCT_SUCCESSFULLY_ADDED = "Продукт успешно добавлен";
        private const string ADD_PRODUCT = "Добавление товара";
        private const string ADD = "Добавить";
        private const string UPDATE_PRODUCT = "Редактирование товара";
        private const string UPDATE = "Изменить";
        private const string ASK_MESSAGE = "Вы уверены?";
        private const string INFO = "Информация";
        private const string ERROR = "Ошибка";

        private string _action;
        private string _article;
        private bool _isArticleReadOnly;
        private string _name;
        private UnitOfMeasurement _selectedUnitOfMeasurement;
        private decimal _price;
        private short _maxDiscount;
        private short _currentDiscount;
        private Manufacturer _selectedManufacturer;
        private Provider _selectedProvider;
        private ProductCategory _selectedCategory;
        private int _amount;
        private string _info;
        private ObservableCollection<UnitOfMeasurement> _unitOfMeasurements;
        private ObservableCollection<Manufacturer> _manufacturers;
        private ObservableCollection<Provider> _providers;
        private ObservableCollection<ProductCategory> _categories;

        public string Action { get => _action; set => SetProperty(ref _action, value); }
        public string Article { get => _article; set => SetProperty(ref _article, value); }
        public bool IsArticleReadOnly { get => _isArticleReadOnly; set => SetProperty(ref _isArticleReadOnly, value); }
        public string Name { get => _name; set => SetProperty(ref _name, value); }
        public UnitOfMeasurement SelectedUnitOfMeasurement { get => _selectedUnitOfMeasurement; set => SetProperty(ref _selectedUnitOfMeasurement, value); }
        public decimal Price { get => _price; set => SetProperty(ref _price, value); }
        public short MaxDiscount { get => _maxDiscount; set => SetProperty(ref _maxDiscount, value); }
        public short CurrentDiscount { get => _currentDiscount; set => SetProperty(ref _currentDiscount, value); }
        public Manufacturer SelectedManufacturer { get => _selectedManufacturer; set => SetProperty(ref _selectedManufacturer, value); }
        public Provider SelectedProvider { get => _selectedProvider; set => SetProperty(ref _selectedProvider, value); }
        public ProductCategory SelectedCategory { get => _selectedCategory; set => SetProperty(ref _selectedCategory, value); }
        public int Amount { get => _amount; set => SetProperty(ref _amount, value); }
        public string Info { get => _info; set => SetProperty(ref _info, value); }
        public ObservableCollection<UnitOfMeasurement> UnitOfMeasurements { get => _unitOfMeasurements; set => SetProperty(ref _unitOfMeasurements, value); }
        public ObservableCollection<Manufacturer> Manufacturers { get => _manufacturers; set => SetProperty(ref _manufacturers, value); }
        public ObservableCollection<Provider> Providers { get => _providers; set => SetProperty(ref _providers, value); }
        public ObservableCollection<ProductCategory> Categories { get => _categories; set => SetProperty(ref _categories, value); }

        public ICommand AddOrUpdateProductCommand { get; private set; }
        public virtual ICommand BackCommand { get; }

        public AdminProductViewModel()
        {
            AddOrUpdateProductCommand = new DelegateCommand(AddOrUpdateProduct);
            BackCommand = new DelegateCommand(SignOut);

            UnitOfMeasurements = new ObservableCollection<UnitOfMeasurement>();
            Manufacturers = new ObservableCollection<Manufacturer>();
            Providers = new ObservableCollection<Provider>();
            Categories = new ObservableCollection<ProductCategory>();

            using (var context = new TradeEntities())
            {
                foreach (var unitOfMeasurements in context.UnitOfMeasurement)
                    UnitOfMeasurements.Add(unitOfMeasurements);

                foreach (var manufacturer in context.Manufacturer)
                    Manufacturers.Add(manufacturer);

                foreach (var provider in context.Provider)
                    Providers.Add(provider);

                foreach (var category in context.ProductCategory)
                    Categories.Add(category);
            }

            if (SelectedProduct.GetProduct() is null)
            {
                Action = ADD;
                IsArticleReadOnly = false;

                SelectedUnitOfMeasurement = UnitOfMeasurements[0];
                SelectedManufacturer = Manufacturers[0];
                SelectedProvider = Providers[0];
                SelectedCategory = Categories[0];
            }
            else
            {
                Action = UPDATE;
                IsArticleReadOnly = true;

                var selectedProduct = SelectedProduct.GetProduct();

                Article = selectedProduct.ProductArticleNumber;
                Name = selectedProduct.ProductName;
                SelectedUnitOfMeasurement = UnitOfMeasurements
                    .FirstOrDefault(u => u.UnitOfMeasurementID.Equals(selectedProduct.ProductUnitOfMeasurementID));
                Price = selectedProduct.ProductPrice;
                MaxDiscount = selectedProduct.ProductMaxDiscount;
                CurrentDiscount = selectedProduct.ProductCurrentDiscount;
                SelectedManufacturer = Manufacturers
                    .FirstOrDefault(m => m.ManufacturerID.Equals(selectedProduct.ProductManufacturerID));
                SelectedProvider = Providers
                    .FirstOrDefault(p => p.ProviderID.Equals(selectedProduct.ProviderID));
                SelectedCategory = Categories
                    .FirstOrDefault(c => c.ProductCategoryID.Equals(selectedProduct.ProductCategoryID));
                Amount = selectedProduct.ProductAmount;
                Info = selectedProduct.ProductInfo;
            }
        }

        /// <summary>
        /// Метод добавления или редактирования товара.
        /// </summary>
        /// <param name="obj"></param>
        /// <exception cref="Exception"></exception>
        private async void AddOrUpdateProduct(object obj)
        {
            try
            {
                if (Price < 0) throw new Exception(INVALID_PRICE);
                if (MaxDiscount < 0) throw new Exception(INVALID_MAX_DISCOUNT);
                if (CurrentDiscount < 0) throw new Exception(INVALID_CURRENT_SICOUNT);
                if (Amount < 0) throw new Exception(INVALID_AMOUNT);
                if (string.IsNullOrWhiteSpace(Article)
                    || string.IsNullOrWhiteSpace(Name)
                    || string.IsNullOrWhiteSpace(Price.ToString())
                    || string.IsNullOrWhiteSpace(MaxDiscount.ToString())
                    || string.IsNullOrWhiteSpace(CurrentDiscount.ToString())
                    || string.IsNullOrWhiteSpace(Amount.ToString())
                    || string.IsNullOrWhiteSpace(Info)) throw new Exception(EMPTY_TEXT_FIELDS);

                using (var context = new TradeEntities())
                {
                    if (MessageBox.Show(ASK_MESSAGE, Action.Equals(ADD) ? ADD_PRODUCT : UPDATE_PRODUCT, MessageBoxButton.YesNo, MessageBoxImage.Question)
                        .Equals(MessageBoxResult.Yes))
                    {
                        context.Product.AddOrUpdate(new Product()
                        {
                            ProductArticleNumber = Article,
                            ProductName = Name,
                            ProductUnitOfMeasurementID = SelectedUnitOfMeasurement.UnitOfMeasurementID,
                            ProductPrice = Price,
                            ProductMaxDiscount = (byte)MaxDiscount,
                            ProductCurrentDiscount = (byte)CurrentDiscount,
                            ProductManufacturerID = SelectedManufacturer.ManufacturerID,
                            ProviderID = SelectedProvider.ProviderID,
                            ProductCategoryID = SelectedCategory.ProductCategoryID,
                            ProductAmount = Amount,
                            ProductInfo = Info
                        });

                        await context.SaveChangesAsync();

                        MessageBox.Show(PRODUCT_SUCCESSFULLY_ADDED, INFO, MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, ERROR, MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        /// <summary>
        /// Метод выхода на главное окно администратора.
        /// </summary>
        /// <param name="obj"></param>
        private void SignOut(object obj)
        {
            new AdminWindow().Show();

            Application.Current.Windows.Cast<Window>().FirstOrDefault(window => window is ProductAddingWindow).Close();
        }
    }
}