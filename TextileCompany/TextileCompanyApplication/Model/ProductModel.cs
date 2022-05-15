using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using TextileCompanyApplication.Model.Entities;

namespace TextileCompanyApplication.Model
{
    public class ProductModel
    {
        private const string IMAGE_PATH = "pack://application:,,,/Assets/Images/";
        private const string PRODUCT_IS_AVAILABLE = "Есть в наличии";
        private const string PRODUCT_IS_NOT_AVAILABLE = "Нет в наличии";

        public string Article { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Manufacturer { get; set; }
        public string Provider { get; set; }
        public string Category { get; set; }
        public short Discount { get; set; }
        public int Amount { get; set; }
        public string Info { get; set; }
        public BitmapImage Image { get; set; }
        public string Availability { get; set; }
        public Brush Background { get; set; }

        public static ProductModel GetModelFromDb(Product context) =>
            new ProductModel()
            {
                Article = context.ProductArticleNumber,
                Name = context.ProductName,
                Price = context.ProductPrice,
                Manufacturer = context.Manufacturer.Value,
                Provider = context.Provider.Value,
                Category = context.ProductCategory.Value,
                Discount = context.ProductCurrentDiscount,
                Amount = context.ProductAmount,
                Info = context.ProductInfo,
                Image = string.IsNullOrWhiteSpace(context.ProductImage) ? new BitmapImage(new Uri(IMAGE_PATH + "picture.png"))
                    : new BitmapImage(new Uri(IMAGE_PATH + context.ProductImage)),
                Availability = context.ProductAmount > 0 ? PRODUCT_IS_AVAILABLE : PRODUCT_IS_NOT_AVAILABLE,
                Background = context.ProductAmount > 0 ? new SolidColorBrush(Colors.Transparent) : new SolidColorBrush(Colors.Gray)
            };

        public static implicit operator ProductModel(Product context) => GetModelFromDb(context);
    }
}