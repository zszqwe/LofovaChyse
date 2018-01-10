﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess.Models;
using NHibernate.Criterion;

namespace DataAccess.Dao
{
    public class BookDao : DaoBase<Book>
    {
        public BookDao() : base()
        {

        }

        public IList<Book> GetBooksPaged(int count, int page, out int totalBooks)
        {
            totalBooks = session.CreateCriteria<Book>().SetProjection(Projections.RowCount()).UniqueResult<int>();

            return session.CreateCriteria<Book>().AddOrder(Order.Asc("Name")).SetFirstResult((page - 1) * count).SetMaxResults(count).List<Book>();
        }

        public IList<Book> SearchBooks(string phrase)
        {
            return session.CreateCriteria<Book>().Add(Restrictions.Like("Name", string.Format("%{0}%", phrase))).List<Book>();
        }

        public IList<Book> GetBooksInCategoryId(int id)
        {
            return session.CreateCriteria<Book>().CreateAlias("Category", "cat").Add(Restrictions.Eq("cat.Id", id)).List<Book>();
        }
    }
}