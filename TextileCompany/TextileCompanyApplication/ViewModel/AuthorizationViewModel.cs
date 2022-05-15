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
using TextileCompanyApplication.Model.Entities;
using TextileCompanyApplication.View;

namespace TextileCompanyApplication.ViewModel
{
    public class AuthorizationViewModel : BaseViewModel
    {
        private const string INVALID_ROLE = "Роль не распознана";
        private const string INVALID_USER = "Неправильный логин или пароль";
        private const string CAPTCHA = "F4B2";
        private const string INVALID_CAPTCHA = "Неправильная captcha";
        private const string EMPTY_CAPTCHA = "Неправильная captcha";
        private const string EMPTY_LOGIN_AND_PASSWORD_FIELDS = "Поля логина и пароля должны быть заполнены";
        private const string ERROR = "Ошибка";

        private string _login;
        private string _password;
        private string _captcha;
        private bool _isCaptchaVisible;

        public string Login { get => _login; set => SetProperty(ref _login, value); }
        public string Password { get => _password; set => SetProperty(ref _password, value); }
        public string Captcha { get => _captcha; set => SetProperty(ref _captcha, value); }
        public bool IsCaptchaVisible { get => _isCaptchaVisible; set => SetProperty(ref _isCaptchaVisible, value); }

        public ICommand SignInCommand { get; private set; }
        public ICommand OpenVisitorWindowCommand { get; private set; }

        public AuthorizationViewModel()
        {
            SignInCommand = new DelegateCommand(SignIn);
            OpenVisitorWindowCommand = new DelegateCommand(OpenVisitorWindow);

            IsCaptchaVisible = false;
        }

        /// <summary>
        /// Метод авторизации пользователя с проверкой captcha.
        /// </summary>
        /// <param name="obj"></param>
        private async void SignIn(object obj)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(Login) || string.IsNullOrWhiteSpace(Password))
                    throw new Exception(EMPTY_LOGIN_AND_PASSWORD_FIELDS);

                using (var context = new TradeEntities())
                {
                    if (!IsCaptchaVisible)
                    {
                        await ValidateUser(context);
                    }
                    else
                    {
                        if (string.IsNullOrWhiteSpace(Captcha)) throw new Exception(EMPTY_CAPTCHA);
                        if (Captcha.Equals(CAPTCHA))
                            await ValidateUser(context);
                        else throw new Exception(INVALID_CAPTCHA);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, ERROR, MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        /// <summary>
        /// Метод валидации пользователя.
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        /// <exception cref="Exception"></exception>
        private async Task ValidateUser(TradeEntities context)
        {
            var user = await context.User.FirstOrDefaultAsync(u => u.UserLogin.Equals(Login) && u.UserPassword.Equals(Password));

            if (user != null)
            {
                LogginedUser.SetUser(user);
                switch ((Model.Enums.Role)user.UserRoleID)
                {
                    case Model.Enums.Role.Admin: new AdminWindow().Show(); break;
                    case Model.Enums.Role.Manager: new ManagerWindow().Show(); break;
                    case Model.Enums.Role.Client: new ClientWindow().Show(); break;
                    default: throw new Exception(INVALID_ROLE);
                }

                Close();
            }
            else
            {
                IsCaptchaVisible = true;
                throw new Exception(INVALID_USER);
            }
        }

        /// <summary>
        /// Метод открытия окна гостя.
        /// </summary>
        /// <param name="obj"></param>
        private void OpenVisitorWindow(object obj)
        {
            new VisitorWindow().Show();

            Close();
        }

        /// <summary>
        /// Метод закрытия окна авторизации.
        /// </summary>
        private static void Close() => Application.Current.Windows.Cast<Window>().FirstOrDefault(window => window is AuthorizationWindow).Close();
    }
}