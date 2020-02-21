using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TreeStructure.Models
{
    public class Category
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int ParentID { get; set; }
        public List<Category> Categories = new List<Category>();

        public Category() { }

        public bool HasChildren()
        {
            if (this.Categories.Count > 0)
                return true;
            return false;
        }


    }
}
