using AutoMapper;
using KeywordScan.Web.Models;
using KeywordScan.Web.Models.Dto;

namespace KeywordScan.Web.Helper
{
    public class AutoMapperHandler : Profile
    {
        public AutoMapperHandler()
        {
            CreateMap<WebSearchResponse, WebSearchResponseDto>() .ReverseMap();
        }
    }
}
