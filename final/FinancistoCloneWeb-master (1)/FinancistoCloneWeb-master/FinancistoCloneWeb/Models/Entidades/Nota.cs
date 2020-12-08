using System;
namespace FinancistoCloneWeb.Models
{
    public class Nota
    {
        public Nota()
        {
            UltimaModificacion = DateTime.Now;
        }
        public int       NotaId { get; set; }
        public string    Titulo { get; set; }
        public DateTime  UltimaModificacion { get; set; }
        public string    Contenido { get; set; }
    }
}
