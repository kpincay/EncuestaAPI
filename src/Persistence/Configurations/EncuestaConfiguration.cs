using Encuesta.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace EnrolApp.Persistence.Configurations
{
    public class EncuestaMaestroConfiguration : IEntityTypeConfiguration<EncuestaMaestro>
    {
        public void Configure(EntityTypeBuilder<EncuestaMaestro> builder)
        {

            builder.HasKey(x => x.IdEncuesta);

            builder.HasMany(g => g.EncuestaTransaccions)
              .WithOne(g => g.EncuestaMaestro)
              .HasForeignKey(g => g.IdEncuesta)
              .IsRequired()
              .OnDelete(DeleteBehavior.Cascade);

           

            builder.Property(x => x.Pregunta)
                .HasMaxLength(100)
               .IsRequired();

            builder.Property(x => x.Escala)
                .HasMaxLength(50)
               .IsRequired();

            builder.Property(x => x.Categoria)
                .HasMaxLength(50)
               .IsRequired();
        }
    }
}
