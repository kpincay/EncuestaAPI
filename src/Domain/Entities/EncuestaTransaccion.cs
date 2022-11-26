using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Encuesta.Domain.Entities;


[Table("EncuestaTransaccion", Schema = "dbo")]
public class EncuestaTransaccion
{
    [Key]
	[Column("idEncuestaTransaccion")]
	public Guid IdEncuestaTransaccion { get; set; }

	[Column("idEncuesta")]
	public Guid IdEncuesta { get; set; }
	public virtual EncuestaMaestro EncuestaMaestro { get; set; }

	[Column("idEncuestado")]
	public Guid IdEncuestado { get; set; }
	public virtual Encuestado Encuestado { get; set; }

	[Column("idSucursal")]
	public Guid IdSucursal { get; set; }
	public virtual Sucursal Sucursal { get; set; }
}