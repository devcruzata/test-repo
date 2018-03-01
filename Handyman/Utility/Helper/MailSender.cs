using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Diagnostics;
using System.Net.Mail;

using System.Configuration;
using System.Net;

namespace Utility.Helper
{
    public class MailSender
    {

        private readonly int port_no;
        private readonly string smtp_server;
        private readonly string fromAddress;
        private readonly bool ssl_status;
        private readonly string user_name;
        private readonly string mail_pass;


        public MailSender()
        {
            port_no = Convert.ToInt32(ConfigurationManager.AppSettings["Port"]);
            smtp_server = ConfigurationManager.AppSettings["MailServer"];
            fromAddress = ConfigurationManager.AppSettings["MailAuthUser"];
            user_name = ConfigurationManager.AppSettings["MailAuthUser"];
            mail_pass = ConfigurationManager.AppSettings["MailAuthPass"];
            ssl_status = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSSL"]);
        }
        public void SendMail(string ToAddress, string mail_subject, string mail_body )
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress(fromAddress, "Online Karigar");
            message.To.Add(ToAddress);
            message.Subject = mail_subject;
            message.Body = mail_body;
            message.IsBodyHtml = true;
            //System.Net.Mail.Attachment attachment;
            //attachment = new System.Net.Mail.Attachment(filePath);
            //message.Attachments.Add(attachment);
            

            message.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;

            SmtpClient smtpClient = new SmtpClient(smtp_server, port_no);
            smtpClient.EnableSsl = ssl_status;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential(user_name, mail_pass);
            smtpClient.Send(message);

        }
    }
}