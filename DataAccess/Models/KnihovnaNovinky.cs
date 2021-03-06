﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using DataAccess.Interface;

namespace DataAccess.Models
{
    public class KnihovnaNovinky : IEntity
    {
        public virtual int Id { get; set; }
        public virtual DateTime Date { get; set; }

        [AllowHtml]
        public virtual string Text { get; set; }

        public virtual int UserId { get; set; }
        public virtual int Type { get; set; }
        public virtual int TypeSub { get; set; }
        public virtual int Version { get; set; }
        public virtual int Priority { get; set; }
        public virtual bool Sticky { get; set; }
        public virtual int RefId { get; set; }
        public virtual string Action { get; set; }
        public virtual string Controller { get; set; }
    }
}
