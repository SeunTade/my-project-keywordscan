using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace KeywordScan.Web.Migrations
{
    /// <inheritdoc />
    public partial class MigrationName2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "WebSearchresults");

            migrationBuilder.CreateTable(
                name: "WebSearchResponse",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    SearchEngine = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    RowCount = table.Column<int>(type: "int", nullable: true),
                    PositionsIndex = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    RunTime = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_WebSearchResponse", x => x.Id);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "WebSearchResponse");

            migrationBuilder.CreateTable(
                name: "WebSearchresults",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PositionsIndex = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    RowCount = table.Column<int>(type: "int", nullable: true),
                    RunTime = table.Column<DateTime>(type: "datetime2", nullable: true),
                    SearchEngine = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_WebSearchresults", x => x.Id);
                });
        }
    }
}
