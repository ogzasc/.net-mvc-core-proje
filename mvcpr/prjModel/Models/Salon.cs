using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prjModel.Models
{
    public class Salon
    {  
        public int Id { get; set; }
        public string SalonAd { get; set; }
        public List<Gosterim> gosterims { get; set; }
    }
}
