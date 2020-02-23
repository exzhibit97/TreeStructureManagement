using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TreeStructure.Models;

namespace TreeStructure.Infrastructure
{
    public interface IService
    {
        Category GetById(int id);
        List<Category> GetCategoryTree();       
        Category AddNode(Category category);        
        void Update(Category category);
        void Delete(Category category);
    }
}
