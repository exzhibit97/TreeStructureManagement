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
        private readonly CategoriesContext _context;

        public CategoriesController(CategoriesService service, CategoriesContext context)
        {
            _service = service;
            _context = context;
        }
        public IActionResult Index()
        {
            //var categoryItems = _context.CategoryItems.ToList();
            //var tree = TreeBuilder.BuildTree(categoryItems);
            var categoryTree = _service.GetCategoryTree();
            return View(categoryTree);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create([FromForm] Category category, int id)
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
            _context.CategoryItems.Add(category);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult AddChild(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var category = _context.CategoryItems.Find(id);
            
            if (category == null)
            {
                return NotFound();
            }

            return View();
        }

        [HttpPost]
        public IActionResult AddChild([FromForm] Category category, int id)
        {
            if (!ModelState.IsValid)
            {
                return View(category);
            }

            var parentCategory = _context.CategoryItems.Find(id);
            var childCategory = new Category
            {
                Name = category.Name,
                ParentID = id
            };

            parentCategory.Children.Add(childCategory);

            _context.CategoryItems.Add(childCategory);
            _context.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}