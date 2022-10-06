using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prjModel.Models
{
    public class Gosterim
    {
        public int Id{ get; set; }
        public string GTarihi { get; set; }
        public int SalonID { get; set; }
        public int FilmID { get; set; }
        public Salon Salon { get; set; }
        public film film { get; set; }
    }
}
