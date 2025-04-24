using System.ComponentModel.DataAnnotations;

namespace KeywordScan.Web.Models
{
    public class WebSearchResponse
    {
        [Key]
        public int Id { get; set; }
        public string? SearchEngine { get; set; }
        public int? RowCount { get; set; }
        public string? PositionsIndex { get; set; }
        public List<string>? Messages { get; set; }
        public DateTime? RunTime { get; set; }
    }
}
