//using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using KeywordScan.Web.Models;
using Microsoft.EntityFrameworkCore;

namespace KeywordScan.Web.Data
{
    public class ApplicationDbContext : DbContext
    {

        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {

        }

        public DbSet<WebSearchResponse> WebSearchResponse { get; set; }

    }
}