using Encuesta.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace Encuesta.Persistence.Contexts;

public class ApplicationDbContext : DbContext
{

    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options): base(options)
    {
        ChangeTracker.QueryTrackingBehavior = QueryTrackingBehavior.NoTracking;
    }

    public DbSet<EncuestaMaestro> EncuestaMaestros { get; set; }
    public DbSet<Encuestado> Encuestados { get; set; }
    public DbSet<Sucursal> Sucursals { get; set; }
    public DbSet<EncuestaTransaccion> EncuestaTransaccions { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder) =>
        modelBuilder.ApplyConfigurationsFromAssembly(typeof(ApplicationDbContext).Assembly);

 
}