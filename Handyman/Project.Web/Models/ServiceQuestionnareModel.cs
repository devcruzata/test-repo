using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project.Web.Models
{
    public class ServiceQuestionnareModel
    {


        public int Questionnare_ID_Auto_PK { get; set; }

        public int Service_ID_FK { get; set; }

        public string Question { get; set; }

        public string AnswerType { get; set; }

        public string Answer1 { get; set; }

        public string Answer2 { get; set; }

        public string Answer3 { get; set; }

        public string Answer4 { get; set; }

        public List<Answers> Answer_List {get;set;}

        public List<ServiceQuestionnareModel> questions_List { get; set; }

        public ServiceQuestionnareModel(){
            Answer_List = new List<Answers>();
        }
    }


    public class Answers
    {
        public int AnswerSet_ID_Auto_PK { get; set; }

        public string AnswerDesc { get;set;}
    }
}