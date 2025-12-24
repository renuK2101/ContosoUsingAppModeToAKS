using ContosoUniversity.Common.Interfaces;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;

namespace ContosoUniversity.Tests
{
    public static class MockExtensions
    {
        public static Mock<IRepository<T>> AsMockRepository<T>(this IEnumerable<T> list) where T : class
        {
            var mockRepo = new Mock<IRepository<T>>();
            var data = list.ToList();

            mockRepo.Setup(x => x.GetAll()).Returns(data);
            mockRepo.Setup(x => x.Get(It.IsAny<Expression<Func<T, bool>>>()))
                .Returns<Expression<Func<T, bool>>>(predicate => data.AsQueryable().FirstOrDefault(predicate));
            mockRepo.Setup(x => x.GetById(It.IsAny<int>()))
                .Returns<int>(id =>
                {
                    var idProperty = typeof(T).GetProperty("ID");
                    if (idProperty != null)
                    {
                        return data.FirstOrDefault(x => (int)idProperty.GetValue(x) == id);
                    }
                    return null;
                });
            mockRepo.Setup(x => x.Add(It.IsAny<T>()))
                .Callback<T>(entity => data.Add(entity));
            mockRepo.Setup(x => x.Update(It.IsAny<T>()));
            mockRepo.Setup(x => x.Delete(It.IsAny<T>()))
                .Callback<T>(entity => data.Remove(entity));

            return mockRepo;
        }

        public static Mock<IPersonRepository<T>> AsMockPersonRepository<T>(this IEnumerable<T> list) where T : class
        {
            var mockRepo = new Mock<IPersonRepository<T>>();
            var data = list.ToList();

            mockRepo.Setup(x => x.GetAll()).Returns(data);
            mockRepo.Setup(x => x.Get(It.IsAny<Expression<Func<T, bool>>>()))
                .Returns<Expression<Func<T, bool>>>(predicate => data.AsQueryable().FirstOrDefault(predicate));
            mockRepo.Setup(x => x.GetById(It.IsAny<int>()))
                .Returns<int>(id =>
                {
                    var idProperty = typeof(T).GetProperty("ID");
                    if (idProperty != null)
                    {
                        return data.FirstOrDefault(x => (int)idProperty.GetValue(x) == id);
                    }
                    return null;
                });
            mockRepo.Setup(x => x.Add(It.IsAny<T>()))
                .Callback<T>(entity => data.Add(entity));
            mockRepo.Setup(x => x.Update(It.IsAny<T>()));
            mockRepo.Setup(x => x.Delete(It.IsAny<T>()))
                .Callback<T>(entity => data.Remove(entity));

            return mockRepo;
        }
    }
}
