using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TreeStructure.Models;

namespace TreeStructure.ViewModels
{
    public class CategoryEditViewModel
    {
        public Category Category { get; set; }
        public IEnumerable<Category> Categories { get; set; }
    }
}
