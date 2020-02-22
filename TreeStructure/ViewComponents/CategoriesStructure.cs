using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TreeStructure.Infrastructure;
using TreeStructure.Models;
using TreeStructure.ViewModels;

namespace TreeStructure.ViewComponents
{
    [ViewComponent]
    public class CategoriesStructure : ViewComponent
    {
        private readonly CategoriesService _service;

        public CategoriesStructure(CategoriesService service)
        {
            _service = service;
        }
        public Task<IViewComponentResult> InvokeAsync(List<Category> categories, bool isFirstCall)
        {
            if (isFirstCall)
                categories = _service.GetCategoryTree();

            var viewModel = new CategoryTreeViewModel { IsFirstCall = isFirstCall, Categories = categories };
            //something is not going right and I needed to explicitly state return type here.
            return Task.FromResult<IViewComponentResult>(View(viewModel)); 
        }
    }
}
