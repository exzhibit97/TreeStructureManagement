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

        [HttpPost]
        public IActionResult Create([FromBody] Category category)
        {
            if (!ModelState.IsValid)
            {
                return View(category);
            }
            try
            {
                var categoryToAdd = new Category
                {
                    Name = category.Name,
                    ParentID = category.ParentID,
                };

                _service.AddNode(categoryToAdd);
                return new JsonResult(categoryToAdd);
            }
            catch (Exception ex)
            {
                return RedirectToAction(nameof(Index));
            }
        }

        public IActionResult Delete(int Id)
        {
            try
            {
                var category = _service.GetById(Id);
                /*Deletes only parent, orphaned children get connected to parent's parent
                _service.Delete(category);
                */

                //Deletes parent and his children - i.e cascade delete
                _service.DeleteWithChildren(category);

                //Deletes parent and sets its children to be descendants of its parent
                //_service.DeleteWithForcedAdoption(category);

                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest();
            }
        }
    }
}