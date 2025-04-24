using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace KeywordScan.Web.Migrations
{
    /// <inheritdoc />
    public partial class MigrationName3 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Messages",
                table: "WebSearchResponse",
                type: "nvarchar(max)",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Messages",
                table: "WebSearchResponse");
        }
    }
}
