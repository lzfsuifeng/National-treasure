using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NT_Models
{
  public  class Action
    {
        public int Act_ID { get; set; }
        public string Act_Title {get;set;}
        public string Act_Content { get; set; }
        public string Act_Img { get; set; }
        public DateTime Act_Time { get; set; }
    }
}
