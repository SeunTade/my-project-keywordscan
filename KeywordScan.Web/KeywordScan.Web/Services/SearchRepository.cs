using AutoMapper;
using KeywordScan.Web.Data;
using KeywordScan.Web.Models;
using KeywordScan.Web.Models.Dto;
using Microsoft.EntityFrameworkCore;

namespace KeywordScan.Web.Services
{
    public class SearchRepository : ISearchRepository
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper _mapper;

        public SearchRepository(ApplicationDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<int> Create(WebSearchResponseDto data)
        {
            var entity = _mapper.Map<WebSearchResponse>(data);  
            await _context.WebSearchResponse.AddAsync(entity);  
            return await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<WebSearchResponseDto>> GetAll()
        {

            List<WebSearchResponseDto> _response = new List<WebSearchResponseDto>();
            var data = await _context.WebSearchResponse.ToListAsync();
            if (data != null)
            {
                _response = _mapper.Map < List < WebSearchResponseDto >> (data);
            }
            return _response;
             
        }



    }
}
