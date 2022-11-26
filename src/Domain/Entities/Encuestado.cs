using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Encuesta.Domain.Entities;


[Table("Encuestado", Schema = "dbo")]
public class Encuestado
{
    [Key]
	[Column("idEncuestado")]
	public Guid IdEncuestado { get; set; }

	[Column("identificacion", TypeName = "varchar(13)")]
	public string Identificacion { get; set; }

	[Column("nombresApellidos", TypeName = "varchar(100)")]
	public string NombresApellidos { get; set; }

    [Column("sexo", TypeName = "varchar(1)")]
	public string Sexo { get; set; }

    [Column("edad", TypeName = "int")]
	public int Edad { get; set; }


	public virtual ICollection<EncuestaTransaccion> EncuestaTransaccions { get; set; }
}