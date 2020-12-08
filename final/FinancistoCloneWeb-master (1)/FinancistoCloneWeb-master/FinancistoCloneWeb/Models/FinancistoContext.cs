﻿using FinancistoCloneWeb.Models.Maps;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FinancistoCloneWeb.Models
{
    public class FinancistoContext : DbContext
    {
        //Esto se hace por cada tabla de base de datos
        public DbSet<Account>      Accounts { get; set; }
        public DbSet<Person>       People { get; set; }
        public DbSet<City>         Cities { get; set; }
        public DbSet<Type>         Types { get; set; }
        public DbSet<User>         Users { get; set; }
        public DbSet<Transaction>  Transactions { get; set; }
        public DbSet<File>         Files { get; set; }
        public DbSet<Nota>         Notas { get; set; }
        public DbSet<Etiqueta>     Etiquetas { get; set; }
        public DbSet<NotaEtiqueta> NotaEtiquetas { get; set; }

        public FinancistoContext(DbContextOptions<FinancistoContext> options)
            : base(options) { }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            //Esto se hace por cada tabla de base de datos
            modelBuilder.ApplyConfiguration(new AccountMap());
            modelBuilder.ApplyConfiguration(new PersonMap());
            modelBuilder.ApplyConfiguration(new CityMap());
            modelBuilder.ApplyConfiguration(new TypeMap());
            modelBuilder.ApplyConfiguration(new UserMap());
            modelBuilder.ApplyConfiguration(new TransactionMap());
            modelBuilder.ApplyConfiguration(new FileMap());
            modelBuilder.ApplyConfiguration(new NotaMap());
            modelBuilder.ApplyConfiguration(new EtiquetaMap());
            modelBuilder.ApplyConfiguration(new NotaEtiquetaMap());
        }

    }
}
