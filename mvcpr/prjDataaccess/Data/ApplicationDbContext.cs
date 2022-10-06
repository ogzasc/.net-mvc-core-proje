using Microsoft.EntityFrameworkCore;
using prjModel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prjDataaccess.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options):base(options)
        {

        }

        public DbSet<film> Filmler { get; set; }
        public DbSet<Salon> Salonlar { get; set; }
        public DbSet<Gosterim> Gosterim { get; set; }
        public DbSet<Kullanici> Kullanicilar { get; set; }
    }
}
