using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Encuesta.Domain.Entities;


[Table("EncuestaMaestro", Schema = "dbo")]
public class EncuestaMaestro
{
    [Key]
	[Column("idEncuesta")]
	public Guid IdEncuesta { get; set; }

	[Column("orden", TypeName = "int")]
	public int Orden { get; set; }

	[Column("pregunta", TypeName = "varchar(100)")]
	public string Pregunta { get; set; }

    [Column("escala", TypeName = "varchar(50)")]
	public string Escala { get; set; }

    [Column("categoria", TypeName = "varchar(50)")]
	public string Categoria { get; set; }

	public virtual ICollection<EncuestaTransaccion> EncuestaTransaccions{ get; set; }
}