using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using FinancistoCloneWeb.Models;
using System.Globalization;
using System.Text;
using Microsoft.AspNetCore.Authorization;
namespace FinancistoCloneWeb.Controllers
{
   // [Authorize]
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly FinancistoContext context;

        private List<Account> accounts = new List<Account>
        {
            new Account {Id = 1, Name = "Efectivo"},
            new Account {Id = 2, Name = "Tarjeta Credito BCP"},
            new Account {Id = 3, Name = "Tarjeta Credito Interbank"},
            new Account {Id = 4, Name = "Chanchito"},
            new Account {Id = 5, Name = "Bajo el colchon"}
        };

        public List<Etiqueta> Etiquetas = new List<Etiqueta>
                {
                    new Etiqueta { Nombre="Maestría"},
                    new Etiqueta { Nombre="AWS"},
                    new Etiqueta { Nombre="Bateas"},
                    new Etiqueta { Nombre="Commands"},
                    new Etiqueta { Nombre="maes"},
                    new Etiqueta { Nombre="android"},
                    new Etiqueta { Nombre="Main"}
                };
        public class DTOBuscador
        {
            public string buqueda { get; set; }
            public int id { get; set; }
        }

        public class DTONotaDelete
        {
            public int id { get; set; }
        }

        public class DTONotaCreate
        {
            public string Titulo { get; set; }
            public string Contenido { get; set; }
            public string Etiquetas  { get; set; }
        }


        public class DTONotaDetalle
        {
            public string Titulo { get; set; }
            public string Contenido { get; set; }
            public IEnumerable<Etiqueta> Etiquetas { get; set; }
        }

        public HomeController(ILogger<HomeController> logger, FinancistoContext context)
        {
            _logger = logger;
            this.context = context;
        }

        [HttpGet]
        [AllowAnonymous]
        public IActionResult Index()
        {
           
            return View();
        }


        [HttpGet]
        public ActionResult GetNotas(DTOBuscador model)
        {
            bool load = false;
            try

            {
                if (!context.Etiquetas.Any())
                {
                    context.Etiquetas.AddRange(Etiquetas);
                    context.SaveChanges();
                }
                var Data = context.Notas.Select(c => new {
                    Titulo    = c.Titulo,
                    Contenido = c.Contenido.ToUpper().Substring(0, 50),
                    NotaId    = c.NotaId
                }).ToList();
                
                if (!string.IsNullOrEmpty(model.buqueda)) { 
                         Data = context.Notas.Select(c=>new  {
                             Titulo      = c.Titulo,
                             Contenido   =  c.Contenido.ToUpper().Substring(0,50),
                             NotaId      = c.NotaId
                         }).Where(c=>c.Titulo.ToUpper().Contains(model.buqueda)
                                                || c.Contenido.Contains(model.buqueda)).ToList();
                }
                load = true;
                return Json(new { load = load, data = Data });

            }
            catch (Exception ex)
            {
            }
            return Json(new { load = load });

        }



        [HttpGet]
        public ActionResult GetNotasByEtiqueta(DTOBuscador model)
        {
            bool load = false;
            try
            {
                var ListNotas = context.NotaEtiquetas.Where(c => c.EtiquetaId == model.id).Select(c=>c.NotaId).ToList();

                var Data = context.Notas.Select(c => new {
                    Titulo = c.Titulo,
                    Contenido = c.Contenido.ToUpper().Substring(0, 50),
                    NotaId = c.NotaId
                }).Where(c=>ListNotas.Contains(c.NotaId)).ToList();

                load = true;
                return Json(new { load = load, data = Data });

            }
            catch (Exception ex)
            {
            }
            return Json(new { load = load });

        }
        

        [HttpGet]
        public ActionResult DetalleNota(DTONotaDelete obj)
        {
            bool load = false;
            try
            {
                DTONotaDetalle Data = new  DTONotaDetalle();
                var Nota            = context.Notas.FirstOrDefault(c=>c.NotaId == obj.id);
                Data.Contenido      = Nota.Contenido;
                Data.Titulo         = Nota.Titulo;

                    Data.Etiquetas = context.NotaEtiquetas.Where(c => c.NotaId == obj.id).Select(c=> new Etiqueta { 
                        EtiquetaId  = c.Etiqueta.EtiquetaId,
                        Nombre      = c.Etiqueta.Nombre,
                    }).ToList();
                load     = true;
                return Json(new { load = load, data = Data });

            }
            catch (Exception ex)
            {

            }
            return Json(new { load = load });
        }


        [HttpGet]
        public ActionResult GetEtiquetas()
        {
            bool load = false;
            try
            {
                var Data = context.Etiquetas.ToList();
                load = true;
                return Json(new { load = load, data = Data });

            }
            catch (Exception ex)
            {
            }
            return Json(new { load = load });
        }



        [HttpPost]
        public ActionResult createNota(DTONotaCreate model)
        {
            string message = string.Empty;
            try
            {
                List<int> Etiquetas = new List<int>();

                if (!String.IsNullOrEmpty(model.Etiquetas))
                {
                    String[] Disp = model.Etiquetas.Split(',');
                    foreach (var item in Disp)
                    {
                        int Temp = 0;
                        if (Int32.TryParse(item, out Temp))
                        {
                            Etiquetas.Add(Temp);
                        }
                    }
                }
                var NewNota = new Nota { Contenido = model.Contenido, Titulo = model.Titulo };
                context.Notas.Add(NewNota);
                context.SaveChanges();

                foreach (var item in Etiquetas)
                {
                    context.NotaEtiquetas.Add(new NotaEtiqueta { NotaId = NewNota.NotaId,EtiquetaId = item });
                    context.SaveChanges();
                }

                message = "Se registro correctamente";
            }
            catch (Exception ex)
            {
                message = ex.ToString();
            }

            return Json(new { message = message });
        }

        


        [HttpPost]
        public ActionResult deleteNota(DTONotaDelete obj)
        {
            string message = string.Empty;

            try
            {
                var FindNT = context.NotaEtiquetas.Where(c => c.NotaId == obj.id).ToList();
                context.NotaEtiquetas.RemoveRange(FindNT);
                context.SaveChanges();

                var FindObj = context.Notas.FirstOrDefault(c=>c.NotaId == obj.id);
                context.Notas.Remove(FindObj);
                context.SaveChanges();
                message = "Se ELIMINÓ correctamente";
            }
            catch (Exception ex)
            {
                message = ex.ToString();
            }

            return Json(new { message = message });
        }

        

        [HttpPost]

        public IActionResult Create(Account account)
        {
            if (string.IsNullOrEmpty(account.Name))
                ModelState.AddModelError("Name", "Nombre es requerido");            

            if (ModelState.IsValid)
            {
                //Guardar
                return RedirectToAction("Index");
            }

            return View(account);
            // No guardar
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public List<Account> BuscarPorNombre(string name)
        {
            //name = name.Replace("é", "e");
            return accounts.Where(o => string.Compare(
        RemoveAccents(o.Name), RemoveAccents(name), StringComparison.InvariantCultureIgnoreCase) == 0).ToList();
        }

        private static string RemoveAccents(string s)
        {
            Encoding destEncoding = Encoding.GetEncoding("utf-8");

            return destEncoding.GetString(
                Encoding.Convert(Encoding.UTF8, destEncoding, Encoding.UTF8.GetBytes(s)));
        }
    }
}
