using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prjModel.Models
{
    public class Kullanici
    {
        public int Id { get; set; }
        
        public string UserName { get; set; }
        
        public string Password { get; set; }
        

    }
}
