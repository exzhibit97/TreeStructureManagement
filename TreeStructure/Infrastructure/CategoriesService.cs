﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TreeStructure.Models;

namespace TreeStructure.Infrastructure
{
    public class CategoriesService : IService
    {
        private readonly CategoriesContext _context;

        public CategoriesService(CategoriesContext context)
        {
            _context = context;
        }
        public List<Category> GetAll()
        {
            return _context.CategoryItems.ToList();
        }

        public Category GetById(int id)
        {
            return _context.CategoryItems.Where(c => c.Id == id).AsNoTracking().FirstOrDefault();
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

        public Category AddNode(Category category)
        {
            _context.CategoryItems.Add(category);
            _context.SaveChanges();

            return category;
        }        

        public void Update(Category category)
        {
            _context.Entry(category).State = EntityState.Modified;
            _context.SaveChanges();
        }

        public void Delete(Category category)
        {
            _context.CategoryItems.Remove(category);
            _context.SaveChanges();
        }

        public void DeleteWithChildren(Category category)
        {
            var catChildren = _context.CategoryItems.Where(c => c.ParentID == category.Id).ToList();
            category.Children = catChildren;
            if (!category.HasChildren())
            {
                _context.CategoryItems.Remove(category);                
            }
            else
            {
                _context.CategoryItems.Remove(category);
                foreach (var children in category.Children)
                {
                    this.DeleteWithChildren(children);
                }
            }            
            _context.SaveChanges();
        }   
        
        public void DeleteWithForcedAdoption(Category category)
        {
            var catChildren = _context.CategoryItems.Include(c => c.Children).Where(i => i.ParentID == category.Id).ToList();
            if (catChildren.Count() == 0)
            {
                _context.CategoryItems.Remove(category);
            }
            else
            {                
                foreach (var children in catChildren)
                {
                    children.ParentID = category.ParentID;
                }                
            }
            _context.CategoryItems.Remove(category);
            _context.SaveChanges();
        }

    }
}
