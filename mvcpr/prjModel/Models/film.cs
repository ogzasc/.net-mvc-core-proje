using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prjModel.Models
{
    public class film
    {
        public int Id { get; set; }
        public string FilmAd { get; set; }
        public DateTime? FilmYapimYil { get; set; }
        public List<Gosterim> gosterims { get; set; }

    }
}
