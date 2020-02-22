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
        public int? ParentID { get; set; }
        public Category Parent { get; set; }
        public List<Category> Children { get; set; } = new List<Category>();

        public Category() { }

        public bool HasChildren()
        {
            if (this.Children.Count > 0)
                return true;
            return false;
        }
    }
}
