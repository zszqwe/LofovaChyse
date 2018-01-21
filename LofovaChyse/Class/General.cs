﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataAccess.Dao;
using DataAccess.Models;

namespace LofovaChyse.Class
{
    public class General
    {
        public static double GetCurrentUserMoney(string name)
        {
            KnihovnaUserDao dao = new KnihovnaUserDao();
            KnihovnaUser user = dao.GetByLogin(name);

            return user.Money;
        }

        public static string GetCurrentUserName(string name)
        {
            KnihovnaUserDao dao = new KnihovnaUserDao();
            KnihovnaUser user = dao.GetByLogin(name);

            return user.Name;
        }

        public static int GetCurrentUserNotifications(string name)
        {
            KnihovnaUserDao dao = new KnihovnaUserDao();
            KnihovnaUser user = dao.GetByLogin(name);

            KnihovnaNotifikaceDao nDao = new KnihovnaNotifikaceDao();
            IList<KnihovnaNotifikace> list = nDao.GetUserNotifikace(user.Id);

            int toReturn = 0;

            foreach (KnihovnaNotifikace n in list)
            {
                if (!n.Displayed)
                {
                    toReturn++;
                }
            }

            return toReturn;
        }

        [Authorize]
        public static int GetCurrentUserNotificationsAll(string name)
        {
            KnihovnaUserDao dao = new KnihovnaUserDao();
            KnihovnaUser user = dao.GetByLogin(name);

            KnihovnaNotifikaceDao nDao = new KnihovnaNotifikaceDao();
            IList<KnihovnaNotifikace> list = nDao.GetUserNotifikace(user.Id);

            return list.Count;
        }

        public static IList<KnihovnaNotifikace> GetCurrentUserNotificationsObject(string name, bool onlyUnread = false)
        {
            KnihovnaUserDao dao = new KnihovnaUserDao();
            KnihovnaUser user = dao.GetByLogin(name);

            KnihovnaNotifikaceDao nDao = new KnihovnaNotifikaceDao();
            IList<KnihovnaNotifikace> list = nDao.GetUserNotifikace(user.Id);
            IList<KnihovnaNotifikace> fList = new List<KnihovnaNotifikace>();

            if (onlyUnread)
            {
                foreach (KnihovnaNotifikace n in list)
                {
                    if (!n.Displayed)
                    {
                        fList.Add(n);
                    }
                }
                return fList;
            }

            
            return list;
        }

        public static string GetMiniaturePicture(string name)
        {
            KnihovnaUserDao dao = new KnihovnaUserDao();
            KnihovnaUser user = dao.GetByLogin(name);
            var i = user.ImageName;

            return user.ImageName;
        }
    }
}