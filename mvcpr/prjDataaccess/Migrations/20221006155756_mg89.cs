using Microsoft.EntityFrameworkCore.Migrations;

namespace prjDataaccess.Migrations
{
    public partial class mg89 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Kullanicilar",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Password = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Kullanicilar", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Gosterim_FilmID",
                table: "Gosterim",
                column: "FilmID");

            migrationBuilder.CreateIndex(
                name: "IX_Gosterim_SalonID",
                table: "Gosterim",
                column: "SalonID");

            migrationBuilder.AddForeignKey(
                name: "FK_Gosterim_Filmler_FilmID",
                table: "Gosterim",
                column: "FilmID",
                principalTable: "Filmler",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Gosterim_Salonlar_SalonID",
                table: "Gosterim",
                column: "SalonID",
                principalTable: "Salonlar",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Gosterim_Filmler_FilmID",
                table: "Gosterim");

            migrationBuilder.DropForeignKey(
                name: "FK_Gosterim_Salonlar_SalonID",
                table: "Gosterim");

            migrationBuilder.DropTable(
                name: "Kullanicilar");

            migrationBuilder.DropIndex(
                name: "IX_Gosterim_FilmID",
                table: "Gosterim");

            migrationBuilder.DropIndex(
                name: "IX_Gosterim_SalonID",
                table: "Gosterim");
        }
    }
}
