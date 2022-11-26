using Encuesta.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace EnrolApp.Persistence.Configurations
{
    public class EncuestadoConfiguration : IEntityTypeConfiguration<Encuestado>
    {
        public void Configure(EntityTypeBuilder<Encuestado> builder)
        {

            builder.HasKey(x => x.IdEncuestado);

            builder.HasMany(g => g.EncuestaTransaccions)
              .WithOne(g => g.Encuestado)
              .HasForeignKey(g => g.IdEncuestado)
              .IsRequired()
              .OnDelete(DeleteBehavior.Cascade);

           

            builder.Property(x => x.Identificacion)
                .HasMaxLength(13)
               .IsRequired();

            builder.Property(x => x.NombresApellidos)
                .HasMaxLength(100)
               .IsRequired();

            builder.Property(x => x.Sexo)
                .HasMaxLength(1)
               .IsRequired();
        }
    }
}
