using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using TextileCompanyApplication.Command;
using TextileCompanyApplication.Core;
using TextileCompanyApplication.View;

namespace TextileCompanyApplication.ViewModel
{
    public class ManagerViewModel : ClientViewModel
    {
        public override ICommand SignOutCommand { get; }

        public ManagerViewModel()
        {
            SignOutCommand = new DelegateCommand(SignOut);
        }

        /// <summary>
        /// Метод выхода из системы на окно авторизации.
        /// </summary>
        /// <param name="obj"></param>
        private void SignOut(object obj)
        {
            LogginedUser.ResetUser();

            new AuthorizationWindow().Show();

            Application.Current.Windows.Cast<Window>().FirstOrDefault(window => window is ManagerWindow).Close();
        }
    }
}