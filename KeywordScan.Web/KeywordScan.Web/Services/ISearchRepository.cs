using KeywordScan.Web.Models.Dto;

namespace KeywordScan.Web.Services
{
    public interface ISearchRepository
    {

        Task<IEnumerable<WebSearchResponseDto>> GetAll();

        Task<int> Create(WebSearchResponseDto data);


    }
}
