using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace FinancistoCloneWeb.Migrations
{
    public partial class InitialNota : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Etiqueta",
                columns: table => new
                {
                    EtiquetaId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Etiqueta", x => x.EtiquetaId);
                });

            migrationBuilder.CreateTable(
                name: "Nota",
                columns: table => new
                {
                    NotaId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Titulo = table.Column<string>(nullable: true),
                    UltimaModificacion = table.Column<DateTime>(nullable: false),
                    Contenido = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Nota", x => x.NotaId);
                });

            migrationBuilder.CreateTable(
                name: "NotaEtiqueta",
                columns: table => new
                {
                    NotaEtiquetaId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    EtiquetaId = table.Column<int>(nullable: false),
                    NotaId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_NotaEtiqueta", x => x.NotaEtiquetaId);
                    table.ForeignKey(
                        name: "FK_NotaEtiqueta_Etiqueta_EtiquetaId",
                        column: x => x.EtiquetaId,
                        principalTable: "Etiqueta",
                        principalColumn: "EtiquetaId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_NotaEtiqueta_Nota_NotaId",
                        column: x => x.NotaId,
                        principalTable: "Nota",
                        principalColumn: "NotaId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_NotaEtiqueta_EtiquetaId",
                table: "NotaEtiqueta",
                column: "EtiquetaId");

            migrationBuilder.CreateIndex(
                name: "IX_NotaEtiqueta_NotaId",
                table: "NotaEtiqueta",
                column: "NotaId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "NotaEtiqueta");

            migrationBuilder.DropTable(
                name: "Etiqueta");

            migrationBuilder.DropTable(
                name: "Nota");
        }
    }
}
