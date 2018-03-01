using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Common
{
    public class Utilities
    {
        public static string GenerateRandomPassword()
        {
            try
            {
                char[] chars = "abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();
                string pwd = string.Empty;
                Random random = new Random();
                for (int i = 0; i < 6; i++)
                {
                    int x = random.Next(1, chars.Length);
                    //Don't Allow Repetation of Characters
                    if (!pwd.Contains(chars.GetValue(x).ToString()))
                        pwd += chars.GetValue(x);
                    else
                        i--;
                }
                return pwd;
            }
            catch (Exception ex)
            {
                return "mYE54n";
            }
        }

        public static Boolean SendEmail(string emailid, string subject, string message)
        {
            try
            {

                var fromAddress = new MailAddress(ConfigurationManager.AppSettings["smtpUser"].ToString(), "My Renatal Hub");
                var toAddress = new MailAddress(emailid, "");
                string fromPassword = ConfigurationManager.AppSettings["smtpPass"].ToString();
                var smtp = new SmtpClient
                {
                    Host = ConfigurationManager.AppSettings["smtpServer"].ToString(),
                    Port = Convert.ToInt32(ConfigurationManager.AppSettings["smtpPort"].ToString()),
                    EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["smtpSSL"].ToString()),
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                };
                MailMessage msg = new System.Net.Mail.MailMessage(ConfigurationManager.AppSettings["smtpUser"].ToString(), emailid, subject, message);
                msg.IsBodyHtml = true;
                smtp.Send(msg);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public static string GetRegistrationEmailBodyText(string fullname, string username, string password)
        {
            return "Dear " + fullname + ", <br/><br/>You are successfully registered to My Renatal Hub. Following are the your account credentials <br/><br/>email address / username : " + username + "<br/>password : " + password + "<br/><br/>If you have any questions or trouble logging on please contact to administrator.<br/><br/>All the best,<br/><br/>My Rental Hub";
        }
    }
}
