using KeywordScan.Web.Models;
using KeywordScan.Web.Models.Dto;
using KeywordScan.Web.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace KeywordScan.Web.Controllers
{
    public class SearchController : Controller
    {
        private readonly ISearchService _searchService;
        public SearchController(ISearchService searchService)
        {
            _searchService = searchService;
        }

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }


        [HttpGet]
        public async Task<IActionResult> Historical()
        {
            var data = await _searchService.GetAll();  
            return View(data);
        }


        [HttpPost]
        public async Task<IActionResult> Search(WebSearchrequest request)
        {
            if (string.IsNullOrWhiteSpace(request.Keywords) || string.IsNullOrWhiteSpace(request.Url))
            {
                return View("Index");
            }

            var googleResult = await _searchService.GetSearchResultsGoogleAsync(request.Keywords, request.Url);

            if (googleResult.RowCount.Equals(0))
            {
                var backupSearchResult = await _searchService.GetSearchResultsEDGEAsync(request.Keywords, request.Url);
                backupSearchResult.Messages.Add(googleResult.Messages.FirstOrDefault());
                return View("Result", backupSearchResult);
            }
            return View("Result", googleResult);
        }



        [HttpPost]
        public async Task<IActionResult> SaveSearchResult(WebSearchResponseDto model)
        {
           await _searchService.Create(model); 

            TempData["Message"] = "Search result saved successfully!";
            return RedirectToAction("Index", "Search");
        }











    }

}
