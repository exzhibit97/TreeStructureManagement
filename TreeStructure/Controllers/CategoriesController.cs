using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using TreeStructure.Infrastructure;
using TreeStructure.Models;

namespace TreeStructure.Controllers
{
    public class CategoriesController : Controller
    {
        private readonly CategoriesService _service;

        public CategoriesController(CategoriesService service)
        {
            _service = service;
        }

        public IActionResult Index()
        {
            var categoryTree = _service.GetCategoryTree();
            return View(categoryTree);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create([FromForm] Category category, int? id)
        {
            if (!ModelState.IsValid)
            {
                return View(category);
            }

            var categoryToAdd = new Category
            {
                Name = category.Name,
                ParentID = id,
            };
            _service.AddNode(categoryToAdd);
            return RedirectToAction("Index");
        }

        public IActionResult Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var category = _service.GetById((int)id);

            if (category == null)
            {
                return NotFound();
            }

            return View(category);
        }

        [HttpPost]        
        public IActionResult Delete(Category category)
        {   
            _service.Delete(category);

            return RedirectToAction(nameof(Index));
        }
    }
}