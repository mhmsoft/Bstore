﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace mvc3.Areas.AdminPanel.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class kitapProjesiEntities : DbContext
    {
        public kitapProjesiEntities()
            : base("name=kitapProjesiEntities3")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<favorim> favorim { get; set; }
        public virtual DbSet<kategori> kategori { get; set; }
        public virtual DbSet<resim> resim { get; set; }
        public virtual DbSet<role> role { get; set; }
        public virtual DbSet<siparis> siparis { get; set; }
        public virtual DbSet<siparisDetay> siparisDetay { get; set; }
        public virtual DbSet<urun> urun { get; set; }
        public virtual DbSet<user> user { get; set; }
        public virtual DbSet<yorum> yorum { get; set; }
        public virtual DbSet<indirim> indirim { get; set; }
    }
}
