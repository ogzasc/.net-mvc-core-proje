using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prjModel.Models
{
    public class IlkGosterModel
    {
        public List<Gosterim> gosterimler { get; set; }
        public List<Salon> salon { get; set; }
        public List<film> film { get; set; }

    }
}
