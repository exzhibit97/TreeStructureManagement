using System;
using TreeStructure.Models;
using Xunit;

namespace TreeStructureTests
{
    public class CategoryUnitTests
    {
        [Fact]
        public void CheckChildren_ReturnsTrue_WhenChildrenExist()
        {
            //Arrange
            Category category = new Category
            {
                Name = "MainCategory",
                Children = { new Category(), new Category() }
            };
            
            //Act
            var result = category.HasChildren();

            //Assert
            Assert.True(result);
        }

        [Fact]
        public void CheckChildren_ReturnsFalse_WhenNoChildren()
        {
            //Arrange
            Category category = new Category
            {
                Name = "MainCategory",
                Children = { }
            };

            //Act
            var result = category.HasChildren();

            //Assert
            Assert.False(result);
        }
    }
}
