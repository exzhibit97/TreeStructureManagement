using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TreeStructure.Models;

namespace TreeStructure.Infrastructure
{
    public class CategoriesService
    {
        private readonly CategoriesContext _context;

        public CategoriesService(CategoriesContext context)
        {
            _context = context;
        }

        public List<Category> GetCategoryTree()
        {

            var tree = _context.CategoryItems
                .Include(c => c.Children)
                .AsEnumerable()
                .Where(x => x.Parent == null)
                .ToList();
            return tree;
        }

    }
}
