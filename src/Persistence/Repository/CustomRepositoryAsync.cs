using Ardalis.Specification.EntityFrameworkCore;
using Encuesta.Application.Common.Interfaces;
using Encuesta.Persistence.Contexts;


namespace Encuesta.Persistence.Repository
{
    public  class CustomRepositoryAsync<T> : RepositoryBase<T>,IRepositoryAsync<T> where T : class
    {
        private readonly ApplicationDbContext dbContext;

        public CustomRepositoryAsync(ApplicationDbContext dbContext): base(dbContext)
        {
            this.dbContext = dbContext;
        }
    }
}
