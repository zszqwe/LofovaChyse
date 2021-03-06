﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using DataAccess.Dao;
using DataAccess.Models;
using LofovaChyse.Class;

namespace LofovaChyse.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        private static string name = "";

        // GET: Login
        public ActionResult Index()
        {
            ViewBag.fuckOff = "";
            return View();
        }

        public ActionResult IndexR()
        {
            ViewBag.fuckOff = "ban";
            ViewBag.restrictedTo = General.UserBannedUntil(name).ToString("yyyy-MM-ddTHH:mm:ss");
            return View("Index");
        }

        [HttpPost]
        public ActionResult SignIn(string login, string password)
        {
            Cache.SessionRequest(Session);
            ViewBag.fuckOff = "";

            if (Membership.ValidateUser(login, password))
            {
                Cache.CacheSession cacheSession = Cache.Open(Session);
                KnihovnaUser knihovnaUser = cacheSession.Get<KnihovnaUser>("user");
                cacheSession.Flush();
                DateTime restrictedTo = knihovnaUser.RestrictedTo;
                
                // User is banned.
                if (DateTime.Compare(restrictedTo, DateTime.Now) >= 0)
                {
                    TempData["error"] = "Váš účet byl zablokován.";

                    name = knihovnaUser.Login;
                    return RedirectToAction("IndexR", "Login");
                }

                FormsAuthentication.SetAuthCookie(login, false);

                KnihovnaUserDao d = new KnihovnaUserDao();
                knihovnaUser = d.GetByLogin(login);
                knihovnaUser.LastLogin = DateTime.Now;
                knihovnaUser.PrimaryIp = GetUserIp();

                d.Update(knihovnaUser);

                return RedirectToAction("Index", "Home", new {area = ""});
            }

            TempData["error"] = "Přihlášení selhalo";
            ViewBag.fuckOff = "";
            return RedirectToAction("Index", "Login");


        }

        [HttpPost]
        public ActionResult SignUp(string login, string password)
        {
            KnihovnaUser user = new KnihovnaUser();
            user.Name = login;
            user.AuthLevel = 0;
            user.CommentsNumber = 0;
            user.Exp = 0;
            user.Id = Books.Counter();
            user.ImageName = "avatar.png";
            user.JoinedDateTime = DateTime.Now;
            user.LikesNumber = 0;
            user.Login = login;
            user.Money = 0;
            user.Password = password;
            user.AuthLevel = 0;
            user.PostsNumber = 0;
            user.CommentsNumber = 0;
            user.Reputation = 0;
            user.Surname = "";
            user.WelcomeText = "";
            user.Role = new KnihovnaRoleDao().GetbyId(2);
            user.RestrictedTo = DateTime.MinValue;

            KnihovnaUserDao dao = new KnihovnaUserDao();
            dao.Create(user);

            KnihovnaUserRoleDao rd = new KnihovnaUserRoleDao();
            KnihovnaUserRole r = new KnihovnaUserRole();
            r.Id = Books.Counter();
            r.Data = -1;
            r.DateFrom = DateTime.Now;
            r.DateTo = DateTime.MinValue;
            r.RoleId = 2;
            r.UserId = user.Id;

            rd.Create(r);

            NovinkyGenerator.PridatNovinku(user, dao.GetByLogin(user.Name).Id);

            return RedirectToAction("Index");
        }


        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session.Clear();

            return RedirectToAction("Index", "Login");
        }

        private string GetUserIp()
        {
            string ipList = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (!string.IsNullOrEmpty(ipList))
            {
                return ipList.Split(',')[0];
            }

            return Request.ServerVariables["REMOTE_ADDR"];
        }

    }
}