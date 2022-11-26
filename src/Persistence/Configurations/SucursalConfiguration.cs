using Encuesta.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace EnrolApp.Persistence.Configurations
{
    public class SucursalConfiguration : IEntityTypeConfiguration<Sucursal>
    {
        public void Configure(EntityTypeBuilder<Sucursal> builder)
        {

            builder.HasKey(x => x.IdSucursal);

            builder.HasMany(g => g.EncuestaTransaccions)
              .WithOne(g => g.Sucursal)
              .HasForeignKey(g => g.IdSucursal)
              .IsRequired()
              .OnDelete(DeleteBehavior.Cascade);

           

            builder.Property(x => x.NombreSucursal)
                .HasMaxLength(100)
               .IsRequired();

            builder.Property(x => x.NombreProvincia)
                .HasMaxLength(100)
               .IsRequired();

            builder.Property(x => x.NombreCiudad)
                .HasMaxLength(100)
               .IsRequired();
        }
    }
}
