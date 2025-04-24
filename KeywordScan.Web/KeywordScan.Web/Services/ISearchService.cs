using KeywordScan.Web.Models.Dto;

namespace KeywordScan.Web.Services
{
    public interface ISearchService
    {
        Task<WebSearchResponseDto> GetSearchResultsGoogleAsync(string keywords, string url);
        Task<WebSearchResponseDto> GetSearchResultsEDGEAsync(string keywords, string url);

        Task<int> Create(WebSearchResponseDto data);

        Task<List<WebSearchResponseDto>> GetAll();

    }
}
