using System;
using System.Collections.Generic;
using System.Data.Entity;
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
    public class AdminViewModel : ClientViewModel
    {
        private const string PRODUCT_NOT_SELECTED = "Товар не выбран";
        private const string DELETE = "Удаление товара";
        private const string PRODUCT_DELETE_MESSAGE = "Вы уверены что хотите удалить товар?";
        private const string PRODUCT_SUCCESSFULLY_DELETED = "Продукт успешно удален";
        private const string ERROR = "Ошибка";
        private const string INFO = "Информация";

        private ProductModel _selectedProduct;

        public ProductModel SelectedProduct { get => _selectedProduct; set => SetProperty(ref _selectedProduct, value); }

        public ICommand OpenProductAddingWindowCommand { get; private set; }
        public ICommand OpenProductEditingWindowCommand { get; private set; }
        public ICommand DeleteProductCommand { get; private set; }
        public override ICommand SignOutCommand { get; }

        public AdminViewModel()
        {
            OpenProductAddingWindowCommand = new DelegateCommand(OpenProductAddingWindow);
            OpenProductEditingWindowCommand = new DelegateCommand(OpenProductEditingWindow);
            DeleteProductCommand = new DelegateCommand(DeleteProduct);
            SignOutCommand = new DelegateCommand(SignOut);
        }

        /// <summary>
        /// Метод удаления товара.
        /// </summary>
        /// <param name="obj"></param>
        private async void DeleteProduct(object obj)
        {
            try
            {
                if (SelectedProduct is null) throw new Exception(PRODUCT_NOT_SELECTED);

                if (MessageBox.Show(PRODUCT_DELETE_MESSAGE, DELETE, MessageBoxButton.YesNo, MessageBoxImage.Question)
                    .Equals(MessageBoxResult.Yes))
                {
                    using (var context = new TradeEntities())
                    {
                        context.Product.Remove(await context.Product.FirstOrDefaultAsync(p => p.ProductArticleNumber.Equals(SelectedProduct.Article)));
                        await context.SaveChangesAsync();
                    }

                    MessageBox.Show(PRODUCT_SUCCESSFULLY_DELETED, INFO, MessageBoxButton.OK, MessageBoxImage.Information);

                    FilterProducts();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, ERROR, MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        /// <summary>
        /// Метод открытия окна добавления товара.
        /// </summary>
        /// <param name="obj"></param>
        private void OpenProductAddingWindow(object obj)
        {
            Core.SelectedProduct.ResetProduct();

            new ProductAddingWindow().Show();

            Close();
        }

        /// <summary>
        /// Метод открытия окна редактирования товара.
        /// </summary>
        /// <param name="obj"></param>
        private async void OpenProductEditingWindow(object obj)
        {
            try
            {
                if (SelectedProduct is null) throw new Exception(PRODUCT_NOT_SELECTED);

                using (var context = new TradeEntities())
                {
                    Core.SelectedProduct.SetProduct(await context.Product.FirstOrDefaultAsync(p => p.ProductArticleNumber.Equals(SelectedProduct.Article)));
                }

                new ProductAddingWindow().ShowDialog();

                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, ERROR, MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        /// <summary>
        /// Метод выхода на окно авторизации.
        /// </summary>
        /// <param name="obj"></param>
        private void SignOut(object obj)
        {
            LogginedUser.ResetUser();

            new AuthorizationWindow().Show();

            Close();
        }

        /// <summary>
        /// Метод закрывает текущее окно.
        /// </summary>
        private static void Close()
        {
            Application.Current.Windows.Cast<Window>().FirstOrDefault(window => window is AdminWindow).Close();
        }
    }
}