using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using prjDataaccess.Data;
using prjModel.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Authentication;
using System.Threading.Tasks;
using System.Security.Claims;

namespace mvcpr.Controllers
{
    public class FilmController : Controller
    {
        public IEnumerable<film> resultss { get; set; }
        private readonly ApplicationDbContext _db;

       
        public FilmController(ApplicationDbContext db)
        {
            _db = db;
        }
        [AllowAnonymous]
        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }
        [AllowAnonymous]
        public async Task<IActionResult> Login(Kullanici kullanici)
        {
            var bilgiler =_db.Kullanicilar.SingleOrDefault(p=>p.UserName==kullanici.UserName&&p.Password==kullanici.Password);
            if(bilgiler != null)
            {
                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, kullanici.UserName),
                };
                var useridentity = new ClaimsIdentity(claims,"Login");
                ClaimsPrincipal principal=new ClaimsPrincipal(useridentity);
                await HttpContext.SignInAsync(principal);
                return RedirectToAction("Index","Film");
            }

            return View();
        }
        
        public IActionResult Index()
        {
            List<film> films = _db.Filmler.ToList();
            return View(films);
        }
        public IActionResult Update_Insert(int? id)
        {
            film fekle = new film();
            if (id == null)
            {
                return View(fekle);
            }
            fekle = _db.Filmler.FirstOrDefault(a => a.Id == id);
            if (fekle == null)
            {
                return NotFound();
            }
            return View(fekle);
        }
       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Update_Insert(film obj)
        {
            if (ModelState.IsValid)
            {
                if (obj.Id == 0)

                {
                    //ekleme

                    _db.Filmler.Add(obj);


                }
                else
                {
                    //güncelleme
                    _db.Filmler.Update(obj);
                }
                _db.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            return View(obj);
        }
      
        public IActionResult Sil(int id)
        {
            var objDb = _db.Filmler.FirstOrDefault(a => a.Id == id);
            _db.Filmler.Remove(objDb);
            _db.SaveChanges();
            return RedirectToAction(nameof(Index));
        }
   
        public IActionResult Goster(DateTime? start, DateTime? end)
        {
            var resultss = _db.Filmler.Where(p => p.FilmYapimYil >= start && p.FilmYapimYil <= end).ToList();
            return View(resultss);

        }
     
        public IActionResult Gosterim(int? film)
        {
            IlkGosterModel model = new IlkGosterModel()
            {
                gosterimler = _db.Gosterim.Where(p => p.film.Id == film).ToList(),
                film = _db.Filmler.ToList(),
                salon = _db.Salonlar.ToList()
            };
            return View(model);
        }
  
        public IActionResult SalonGosterim(int? salon)
        {
            IlkGosterModel model = new IlkGosterModel()
            {
                gosterimler = _db.Gosterim.Where(p => p.Salon.Id == salon).ToList(),
                film = _db.Filmler.ToList(),
                salon = _db.Salonlar.ToList()
            };
            return View(model);
        }

    }
}
//X yapım yılı ile Y yapım yılı arasındaki filmleri listeleme.
//-X filminin hangi salonlarda hangi yıllarda gösterime girdiğini listeleme
//-X salonunda gösterime giren tüm filmleri listeleme.

