using AutoMapper;
using KeywordScan.Web.Models.Dto;
using System.Text.RegularExpressions;

namespace KeywordScan.Web.Services
{
    public class SearchService : ISearchService
    {
        private readonly ISearchRepository _searchRepository;
        private readonly IMapper _mapper;
        public SearchService(ISearchRepository searchRepository, IMapper mapper)
        {
            _searchRepository = searchRepository;
            _mapper = mapper;
        }



        public async Task<WebSearchResponseDto> GetSearchResultsGoogleAsync(string keywords, string url)
        {
            var searchEngine = "Google";
            var result = new WebSearchResponseDto();

            try
            {
                using var client = new HttpClient(new HttpClientHandler());
                var request = new HttpRequestMessage(HttpMethod.Get, $"https://www.google.com/search?q={Uri.EscapeDataString(keywords)}&num=50");
               //headers might help
                request.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36");
                request.Headers.Add("Accept", "text/html");

                var html = await (await client.SendAsync(request)).Content.ReadAsStringAsync();

                if (html.Contains("Our systems have detected unusual traffic") ||
                    html.Contains("detected unusual traffic from your computer network") ||
                    html.Contains("<noscript>") ||
                    html.Contains("enablejs") ||
                    html.Contains("http-equiv=\"refresh\""))
                {
                    result.RowCount = 0;
                    result.PositionsIndex = "0";
                    result.Messages.Add($"{searchEngine}: Blocked by engine or Captcha has been triggered");
                    return result;
                }
                //Found google line regex online
                var matches = Regex.Matches(html, @"<div class=""yuRUbf"">\s*<a href=""(http[^""]+)""");
                var positions = new List<int>();
                int index = 1;

                foreach (Match match in matches)
                {
                    if (match.Groups[1].Value.Contains(url)) { positions.Add(index); }
                    index++;
                }

                result.RowCount = positions.Count;
                result.PositionsIndex = positions.Count > 0 ? string.Join(", ", positions) : "0";
                result.Messages.Add(positions.Count > 0
                    ? $"{searchEngine}: Found at positions {result.PositionsIndex}"
                    : $"{searchEngine}: Not found");

                return result;
            }
            catch
            {
                result.RowCount = 0;
                result.PositionsIndex = "0";
                result.Messages.Add($"{searchEngine}: Error occurred");
                return result;
            }
        }

        public async Task<WebSearchResponseDto> GetSearchResultsEDGEAsync(string keywords, string url)
        {
            var searchEngine = "Bing";
            var result = new WebSearchResponseDto();

            try
            {
                using var client = new HttpClient(new HttpClientHandler());
                var request = new HttpRequestMessage(HttpMethod.Get, $"https://www.bing.com/search?q={Uri.EscapeDataString(keywords)}&count=50");
                request.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) Edge/18.19041");
                request.Headers.Add("Accept", "text/html");

                var html = await (await client.SendAsync(request)).Content.ReadAsStringAsync();

                if (html.Contains("verify you are human") || html.Contains("Our systems have detected"))
                {
                    result.RowCount = 0;
                    result.PositionsIndex = "0";
                    result.Messages.Add($"{searchEngine}: Blocked by engine or Captcha has been triggered");
                    return result;
                }

                var matches = Regex.Matches(html, @"<li class=""b_algo"".*?<a href=""(http.*?)""");
                var positions = new List<int>();
                int index = 1;

                foreach (Match match in matches)
                {
                    if (match.Groups[1].Value.Contains(url))
                        positions.Add(index);
                    index++;
                }

                result.RowCount = positions.Count;
                result.PositionsIndex = positions.Count > 0 ? string.Join(", ", positions) : "0";
                result.Messages.Add(positions.Count > 0
                    ? $"{searchEngine}: Found at positions {result.PositionsIndex}"
                    : $"{searchEngine}: Not found");

                return result;
            }
            catch
            {
                result.RowCount = 0;
                result.PositionsIndex = "0";
                result.Messages.Add($"{searchEngine}: Error occurred");
                return result;
            }
        }

        public async Task<int> Create(WebSearchResponseDto model)
        {
            return await _searchRepository.Create(model);
        }

        public async Task<List<WebSearchResponseDto>> GetAll()
        {
            return (List<WebSearchResponseDto>)await    _searchRepository.GetAll();
        }
    }
}
