using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Encuesta.Domain.Entities;


[Table("Sucursal", Schema = "dbo")]
public class Sucursal
{
    [Key]
	[Column("idSucursal")]
	public Guid IdSucursal { get; set; }

	[Column("nombreSucursal", TypeName = "varchar(100)")]
	public string NombreSucursal { get; set; }

	[Column("nombreCiudad", TypeName = "varchar(100)")]
	public string NombreCiudad { get; set; }

	[Column("nombreProvincia", TypeName = "varchar(100)")]
	public string NombreProvincia { get; set; }

	public virtual ICollection<EncuestaTransaccion> EncuestaTransaccions { get; set; }
}