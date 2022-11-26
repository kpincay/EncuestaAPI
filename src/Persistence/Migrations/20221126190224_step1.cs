using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Workflow.Persistence.Migrations
{
    public partial class step1 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.EnsureSchema(
                name: "dbo");

            migrationBuilder.CreateTable(
                name: "Encuestado",
                schema: "dbo",
                columns: table => new
                {
                    idEncuestado = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    identificacion = table.Column<string>(type: "varchar(13)", maxLength: 13, nullable: false),
                    nombresApellidos = table.Column<string>(type: "varchar(100)", maxLength: 100, nullable: false),
                    sexo = table.Column<string>(type: "varchar(1)", maxLength: 1, nullable: false),
                    edad = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Encuestado", x => x.idEncuestado);
                });

            migrationBuilder.CreateTable(
                name: "EncuestaMaestro",
                schema: "dbo",
                columns: table => new
                {
                    idEncuesta = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    orden = table.Column<int>(type: "int", nullable: false),
                    pregunta = table.Column<string>(type: "varchar(100)", maxLength: 100, nullable: false),
                    escala = table.Column<string>(type: "varchar(50)", maxLength: 50, nullable: false),
                    categoria = table.Column<string>(type: "varchar(50)", maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EncuestaMaestro", x => x.idEncuesta);
                });

            migrationBuilder.CreateTable(
                name: "Sucursal",
                schema: "dbo",
                columns: table => new
                {
                    idSucursal = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    nombreSucursal = table.Column<string>(type: "varchar(100)", maxLength: 100, nullable: false),
                    nombreCiudad = table.Column<string>(type: "varchar(100)", maxLength: 100, nullable: false),
                    nombreProvincia = table.Column<string>(type: "varchar(100)", maxLength: 100, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sucursal", x => x.idSucursal);
                });

            migrationBuilder.CreateTable(
                name: "EncuestaTransaccion",
                schema: "dbo",
                columns: table => new
                {
                    idEncuestaTransaccion = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    idEncuesta = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    idEncuestado = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    idSucursal = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EncuestaTransaccion", x => x.idEncuestaTransaccion);
                    table.ForeignKey(
                        name: "FK_EncuestaTransaccion_Encuestado_idEncuestado",
                        column: x => x.idEncuestado,
                        principalSchema: "dbo",
                        principalTable: "Encuestado",
                        principalColumn: "idEncuestado",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_EncuestaTransaccion_EncuestaMaestro_idEncuesta",
                        column: x => x.idEncuesta,
                        principalSchema: "dbo",
                        principalTable: "EncuestaMaestro",
                        principalColumn: "idEncuesta",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_EncuestaTransaccion_Sucursal_idSucursal",
                        column: x => x.idSucursal,
                        principalSchema: "dbo",
                        principalTable: "Sucursal",
                        principalColumn: "idSucursal",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_EncuestaTransaccion_idEncuesta",
                schema: "dbo",
                table: "EncuestaTransaccion",
                column: "idEncuesta");

            migrationBuilder.CreateIndex(
                name: "IX_EncuestaTransaccion_idEncuestado",
                schema: "dbo",
                table: "EncuestaTransaccion",
                column: "idEncuestado");

            migrationBuilder.CreateIndex(
                name: "IX_EncuestaTransaccion_idSucursal",
                schema: "dbo",
                table: "EncuestaTransaccion",
                column: "idSucursal");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "EncuestaTransaccion",
                schema: "dbo");

            migrationBuilder.DropTable(
                name: "Encuestado",
                schema: "dbo");

            migrationBuilder.DropTable(
                name: "EncuestaMaestro",
                schema: "dbo");

            migrationBuilder.DropTable(
                name: "Sucursal",
                schema: "dbo");
        }
    }
}
