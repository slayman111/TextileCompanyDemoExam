using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TextileCompanyApplication.Model.Entities;

namespace TextileCompanyApplication.Core
{
    public static class SelectedProduct
    {
        private static Product _selectedProduct;

        static SelectedProduct() => _selectedProduct = null;

        public static void SetProduct(Product product) => _selectedProduct = product;

        public static Product GetProduct() => _selectedProduct;

        public static void ResetProduct() => _selectedProduct = null;
    }
}