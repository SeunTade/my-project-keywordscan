using System.ComponentModel.DataAnnotations;

namespace KeywordScan.Web.Models.Dto
{
    public class WebSearchResponseDto
    {

        public string? SearchEngine { get; set; }
        public int? RowCount { get; set; }
        public string? PositionsIndex { get; set; }

        public List<string>? Messages { get; set; }=       new List<string>();
        public DateTime? RunTime { get; set; } =  DateTime.Now;
    }
}
