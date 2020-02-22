using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TreeStructure.Models
{
    public static class TreeBuilder
    {
        public static IEnumerable<Category> FetchChildren(this Category root, List<Category> nodes)
        {
            return nodes.Where(n => n.ParentID == root.Id);
        }

        public static void RemoveChildren(this Category root, List<Category> nodes)
        {
            foreach (var node in root.Children)
            {
                nodes.Remove(node);
            }
        }

        public static Category BuildTree(this List<Category> nodes)
        {
            if (nodes == null)
            {
                throw new ArgumentNullException("nodes");
            }
            return new Category().BuildTree(nodes);
        }

        private static Category BuildTree(this Category root, List<Category> nodes)
        {
            if (nodes.Count == 0) { return root; }

            var children = root.FetchChildren(nodes).ToList();
            root.Children.AddRange(children);
            root.RemoveChildren(nodes);

            for (int i = 0; i < children.Count; i++)
            {
                for (int j = 0; j <= i; j++)
                {
                    Console.Write('-');
                }

                Console.WriteLine(children[i].Name);
                children[i] = children[i].BuildTree(nodes);
                if (nodes.Count == 0) { break; }
            }

            return root;
        }
    }
}
