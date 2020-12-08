using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FinancistoCloneWeb.Models.Maps
{
    public class NotaMap : IEntityTypeConfiguration<Nota>
    {
        public void Configure(EntityTypeBuilder<Nota> builder)
        {
            builder.ToTable("Nota");
            builder.HasKey(o => o.NotaId);

            //builder.HasOne(o => o.Type)
            //    .WithMany(o => o.Accounts)
            //    .HasForeignKey(o => o.TypeId);

            //builder.HasOne(o => o.Type)
            //    .WithMany()
            //    .HasForeignKey(o => o.TypeId);

            //builder.HasMany(o => o.Transactions)
            //    .WithOne()
            //    .HasForeignKey(o => o.AccountId);
        }
    }
}
