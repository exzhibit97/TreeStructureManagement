    using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using TreeStructure.Infrastructure;
using TreeStructure.Models;
using TreeStructure.ViewModels;

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

        public IActionResult Delete(int id)
        {
            try
            {
                var category = _service.GetById(id);
                /*Deletes only parent, orphaned children get connected to parent's parent
                _service.Delete(category);
                */

                //Deletes parent and his children - i.e cascade delete
                _service.DeleteWithChildren(category);

                //Deletes parent and sets its children to be descendants of its parent
                //_service.DeleteWithForcedAdoption(category);

                return Ok(category);
            }
            catch (Exception ex)
            {
                return BadRequest();
            }
        }

        public IActionResult Edit(Category category)
        {
            try
            {
                //var categoryTemp = _service.GetById(category.Id);
                var categoryUpdated = new Category
                {
                    Id = category.Id,
                    Name = category.Name,
                    ParentID = category.ParentID,
                };

                _service.Update(categoryUpdated);

                return RedirectToAction(nameof(Index));

            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public IActionResult EditPartial(int id)
        {            
            var categories = _service.GetAll();
            var category = _service.GetById(id);
            ViewBag.catId = id;
            ViewBag.categoriesList = new SelectList(categories, "Id", "Name");   

            return PartialView("modalPartial", category);
        }
    }

}
