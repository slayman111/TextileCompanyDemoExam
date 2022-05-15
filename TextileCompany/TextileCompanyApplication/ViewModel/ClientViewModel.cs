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
    public class ClientViewModel : VisitorViewModel
    {
        private string _fullname;

        public string Fullname { get => _fullname; set => SetProperty(ref _fullname, value); }

        public virtual ICommand SignOutCommand { get; }

        public ClientViewModel()
        {
            SignOutCommand = new DelegateCommand(SignOut);

            var user = LogginedUser.GetUser();
            Fullname = $"{user.UserName} {user.UserSurname} {user.UserPatronymic}";
        }

        /// <summary>
        /// Метод выхода из системы на окно авторизации.
        /// </summary>
        /// <param name="obj"></param>
        private void SignOut(object obj)
        {
            LogginedUser.ResetUser();

            new AuthorizationWindow().Show();

            Application.Current.Windows.Cast<Window>().FirstOrDefault(window => window is ClientWindow).Close();
        }
    }
}