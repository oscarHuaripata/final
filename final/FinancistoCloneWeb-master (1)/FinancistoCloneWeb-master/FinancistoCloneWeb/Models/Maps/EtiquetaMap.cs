using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FinancistoCloneWeb.Models.Maps
{
    public class EtiquetaMap : IEntityTypeConfiguration<Etiqueta>
    {
        public void Configure(EntityTypeBuilder<Etiqueta> builder)
        {
            builder.ToTable("Etiqueta");
            builder.HasKey(o => o.EtiquetaId);

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
