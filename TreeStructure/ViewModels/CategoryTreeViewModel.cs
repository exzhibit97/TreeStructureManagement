using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TreeStructure.Models;

namespace TreeStructure.ViewModels
{
    public class CategoryTreeViewModel
    {
        public bool IsFirstCall { get; set; }
        public List<Category> Categories { get; set; }
    }
}
