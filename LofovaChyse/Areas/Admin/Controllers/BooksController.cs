﻿using DataAccess.Dao;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataAccess.Models;
using LofovaChyse.Class;

namespace LofovaChyse.Areas.Admin.Controllers
{
    public class BooksController : Controller
    {
        // GET: Books
        [Authorize]
        public ActionResult Index(int? page, int? cat)
        {
            string pozdrav = "Lof lof";
            int cislo = 12;
            int itemsOnPage = 2;
            int pg = page.HasValue ? page.Value : 1;
            int totalBooks;


            // Potřebuju uložit do kontaineru abych to dostal do view
            ViewBag.Pozdrav = pozdrav;
            ViewBag.Cislo = cislo;

            BookDao bookDao = new BookDao();
            IList<Book> books = bookDao.GetBooksPaged(itemsOnPage, pg, out totalBooks, cat);

            KnihovnaUser user = new KnihovnaUserDao().GetByLogin(User.Identity.Name);

            ViewBag.Pages = (int) Math.Ceiling((double) totalBooks / (double) itemsOnPage);
            ViewBag.CurrentPage = pg;
            ViewBag.PerPage = itemsOnPage;
            ViewBag.Categories = new BookCategoryDao().GetAll();

            if (Request.IsAjaxRequest())
            {
                return PartialView(books);
            }

            return View(books);
        }

        [Authorize(Roles = "knihovnik")]
        public ActionResult UpravitUzivatele()
        {
            KnihovnaUserDao dao = new KnihovnaUserDao();
            IList<KnihovnaUser> uzivatele = dao.GetAll();

            return View(uzivatele);
        }

        [Authorize(Roles = "knihovnik")]
        public ActionResult UzivatelDetail(int id)
        {
            KnihovnaUserDao dao = new KnihovnaUserDao();
            KnihovnaUser user = dao.GetbyId(id);

            return View(user);
        }

        public JsonResult SearchBooks(string query)
        {
            BookDao bookDao = new BookDao();
            IList<Book> books = bookDao.SearchBooks(query);

            List<string> names = (from Book b in books select b.Name).ToList();
            return Json(names, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Search(string phrase)
        {
            BookDao bookDao = new BookDao();
            IList<Book> books = bookDao.SearchBooks(phrase);

            if (Request.IsAjaxRequest())
            {
                return PartialView("Index", books);
            }

            return View("Index", books);
        }

        public ActionResult Category(int id)
        {
            IList<Book> books = new BookDao().GetBooksInCategoryId(id);
            ViewBag.Categories = new BookCategoryDao().GetAll();

            return View("Index", books);
        }

        public ActionResult Detail(int id, bool zobrazPopis = false)
        {
            BookDao bookDao = new BookDao();
            Book b = bookDao.GetbyId(id);

            ViewBag.Zobraz = zobrazPopis;

            if (Request.IsAjaxRequest())
            {
                return PartialView(b);
            }

            return View(b);
        }

        [Authorize(Roles = "knihovnik")]
        public ActionResult Create()
        {
            BookCategoryDao bookCategoryDao = new BookCategoryDao();
            IList<BookCategory> categories = bookCategoryDao.GetAll();
            ViewBag.Categories = categories;

            return View();
        }

        [HttpPost] // post only
        [Authorize(Roles = "knihovnik")]
        public ActionResult Add(Book book, HttpPostedFileBase picture, int categoryId)
        {
            if (ModelState.IsValid)
            {
                Book b = new Book()
                {
                    Name = book.Name,
                    Author = book.Author,
                    PublishedYear = book.PublishedYear,
                    Id = Books.Counter(),
                    Description = book.Description,
                    OwnerId = new KnihovnaUserDao().GetByLogin(User.Identity.Name),
                    Kategorie = new KnihovnaKategorieDao().GetbyId(2),
                    LastEditDateTime = DateTime.Now,
                    Version = 1,
                    IsPayed = false,
                    UnlockPrice = 0,
                    MinimalLevel = 0
                };


                if (picture != null)
                {
                    var z = picture.ContentLength;

                    if (picture.ContentType == "image/jpeg" || picture.ContentType == "image/png")
                    {
                        Image image = Image.FromStream(picture.InputStream);
                        Image smalImage = ImageHelper.ResizeImageHighQuality(image, 200, 200);


                        Bitmap btmBitmap = new Bitmap(smalImage);
                        Guid guid = Guid.NewGuid();

                        string imageName = guid.ToString() + ".jpg";
                        btmBitmap.Save(Server.MapPath("~/Uploads/Book/") + imageName,
                            ImageFormat.Jpeg); // Je potřeba namapovat cestu!

                        btmBitmap.Dispose();
                        image.Dispose();

                        b.ImageName = imageName;
                    }
                }

                BookCategoryDao bookCategoryDao = new BookCategoryDao();
                BookCategory bookCategory = bookCategoryDao.GetbyId(categoryId);

                b.Category = bookCategory;

                BookDao bookDao = new BookDao();
                bookDao.Create(b);

                NovinkyGenerator.PridatNovinku(b, new KnihovnaUserDao().GetByLogin(User.Identity.Name).Id);

                // Notifikace
                TempData["scs"] = "V pořádku";
            }
            else
            {
                return View("Create", book); // Vrátím vstupní data
            }

            return RedirectToAction("Index");
        }

        [Authorize(Roles = "knihovnik")]
        public ActionResult Edit(int id)
        {
            BookDao bookDao = new BookDao();
            BookCategoryDao bookCategoryDao = new BookCategoryDao();

            Book b = bookDao.GetbyId(id);
            ViewBag.Categories = bookCategoryDao.GetAll();
            ViewBag.UserId = b.OwnerId.Id;
            ViewBag.Kategorie = b.Kategorie.Id;

            return View(b);
        }

        [Authorize(Roles = "knihovnik")]
        [HttpPost]
        public ActionResult Update(Book book, HttpPostedFileBase picture, int categoryId)
        {
            try
            {
                BookDao bookDao = new BookDao();
                BookCategoryDao bookCategoryDao = new BookCategoryDao();

                BookCategory bookCategory = bookCategoryDao.GetbyId(categoryId);

                KnihovnaKategorieDao knihovnaKategorieDao = new KnihovnaKategorieDao();
                KnihovnaUserDao knihovnaUserDao = new KnihovnaUserDao();

                KnihovnaKategorie knihovnaKategorie = book.Kategorie;
                // KnihovnaUser knihovnaUser = knihovnaUserDao.GetbyId(book.OwnerId.Id);

                book.Category = bookCategory;
                book.Kategorie = knihovnaKategorie;
                //   book.OwnerId = knihovnaUser;

                if (picture != null)
                {
                    Image image = Image.FromStream(picture.InputStream);
                    Image smalImage = ImageHelper.ResizeImageHighQuality(image, 200, 200);

                    Bitmap btmBitmap = new Bitmap(smalImage);
                    Guid guid = Guid.NewGuid();

                    string imageName = guid.ToString() + ".jpg";
                    btmBitmap.Save(Server.MapPath("~/Uploads/Book/") + imageName,
                        ImageFormat.Jpeg); // Je potřeba namapovat cestu!

                    btmBitmap.Dispose();
                    image.Dispose();



                    System.IO.File.Delete(Server.MapPath("~/Uploads/Book/") + book.ImageName);

                    book.ImageName = imageName;
                }

                bookDao.Update(book);

                TempData["scs"] = "Kniha " + book.Name + " byla upravena";
            }
            catch (Exception e)
            {
                throw;
            }

            return RedirectToAction("Index", "Books");
        }

        [Authorize(Roles = "knihovnik")]
        [HttpPost]
        public ActionResult UpdateUser(int id, HttpPostedFileBase picture)
        {
            try
            {
                KnihovnaUserDao knihovnaUserDao = new KnihovnaUserDao();
                KnihovnaUser user = knihovnaUserDao.GetbyId(id);

                if (picture != null)
                {
                    Image image = Image.FromStream(picture.InputStream);
                    Image smalImage = ImageHelper.ResizeImageHighQuality(image, 32, 32);

                    Bitmap btmBitmap = new Bitmap(smalImage);
                    Guid guid = Guid.NewGuid();

                    string imageName = guid.ToString() + ".png";
                    btmBitmap.Save(Server.MapPath("~/Uploads/KnihovnaUzivatele/") + imageName,
                        ImageFormat.Png); // Je potřeba namapovat cestu!

                    btmBitmap.Dispose();

                    // HiRes save
                    Image bigImage = ImageHelper.ResizeImageHighQuality(image, 200, 200);
                    Bitmap btmBitmap2 = new Bitmap(bigImage);

                    string imageName2 = guid.ToString() + ".png";
                    btmBitmap2.Save(Server.MapPath("~/Uploads/KnihovnaUzivateleBig/") + imageName2, ImageFormat.Png);

                    btmBitmap2.Dispose();
                    bigImage.Dispose();

                    image.Dispose();


                    user.ImageName = imageName;
                    // System.IO.File.Delete(Server.MapPath("~/Uploads/KnihovnaUzivatele/") + user.ImageName);
                }

                knihovnaUserDao.Update(user);
            }
            catch (Exception e)
            {
                throw;
            }

            return RedirectToAction("Index", "Books");
        }

        [Authorize(Roles = "knihovnik")]
        public ActionResult Delete(int id)
        {
            try
            {
                BookDao bookDao = new BookDao();
                Book book = bookDao.GetbyId(id);

                System.IO.File.Delete(Server.MapPath("~/Uploads/Book/") + book.ImageName);

                bookDao.Delete(book);
                TempData["scs"] = "Kniha " + book.Name + " byla smazána";
            }
            catch (Exception e)
            {
                throw;
            }

            return RedirectToAction("Index", "Books");
        }

        [Authorize(Roles = "knihovnik")]
        public ActionResult AddSekce()
        {

            IList<BookSekce> list = new BookSekceDao().GetCategoriesDebug(null);


            return View(list);
        }

        [Authorize(Roles = "knihovnik")]
        [ValidateInput(false)]
        public ActionResult UpdateSekce(int targetId, string text, HttpPostedFileBase picture)
        {
            BookSekce s = new BookSekceDao().GetbyId(targetId);
            s.Name = text;

            Image image = Image.FromStream(picture.InputStream);
            Image smalImage = ImageHelper.ResizeImageHighQuality(image, 120, 120);

            Bitmap btmBitmap = new Bitmap(smalImage);
            Guid guid = Guid.NewGuid();

            string imageName = guid.ToString() + ".png";
            btmBitmap.Save(Server.MapPath("~/Uploads/Sekce/") + imageName,
                ImageFormat.Png); // Je potřeba namapovat cestu!

            btmBitmap.Dispose();
            image.Dispose();

            s.ImageName = imageName;
            new BookSekceDao().Update(s);


            return Redirect(Request.UrlReferrer.ToString());
        }

        [Authorize(Roles = "knihovnik")]
        public ActionResult AddOdznak()
        {
            KnihovnaOceneni o = new KnihovnaOceneni();
            ViewBag.DruhyOdznaku = new KnihovnaOceneniArchetypDao().GetAll();

            return View(o);
        }

        [Authorize(Roles = "knihovnik")]
        public ActionResult AddOdznakBook()
        {
            BookOdznak o = new BookOdznak();
            ViewBag.DruhyOdznaku = new BookOdznakArchetypDao().GetAll();

            return View(o);
        }

        [Authorize(Roles = "knihovnik")]
        public ActionResult AddOdznakArchetyp()
        {
            KnihovnaOceneniArchetyp o = new KnihovnaOceneniArchetyp();

            return View(o); 
        }

        [Authorize(Roles = "knihovnik")]
        public ActionResult AddOdznakArchetypBook()
        {
            BookOdznakArchetyp o = new BookOdznakArchetyp();

            return View(o);
        }


        [Authorize(Roles = "knihovnik")]
        [ValidateInput(false)]
        public ActionResult CreateOdznakArchetypBook(BookOdznakArchetyp book, HttpPostedFileBase picture)
        {
            if (ModelState.IsValid)
            {
                BookOdznakArchetyp b = new BookOdznakArchetyp()
                {
                    Name = book.Name,
                    Id = Books.Counter(),
                    Text = book.Text
                };


                if (picture != null)
                {
                    var z = picture.ContentLength;

                    if (picture.ContentType == "image/jpeg" || picture.ContentType == "image/png")
                    {
                        Image image = Image.FromStream(picture.InputStream);
                        Image smalImage = ImageHelper.ResizeImageHighQuality(image, 64, 64);


                        Bitmap btmBitmap = new Bitmap(smalImage);
                        Guid guid = Guid.NewGuid();

                        string imageName = guid.ToString() + ".png";
                        btmBitmap.Save(Server.MapPath("~/Uploads/Stuhy/") + imageName, ImageFormat.Png); // Je potřeba namapovat cestu!

                        btmBitmap.Dispose();
                        image.Dispose();

                        b.Image = imageName;
                    }
                }

                BookOdznakArchetypDao bookDao = new BookOdznakArchetypDao();
                bookDao.Create(b);

                // Notifikace
                TempData["scs"] = "V pořádku";
            }
            else
            {
                return View("AddOdznakArchetypBook", book); // Vrátím vstupní data
            }

            return Redirect(Request.UrlReferrer.ToString());
        }

        [Authorize(Roles = "knihovnik")]
        [ValidateInput(false)]
        public ActionResult CreateOdznakArchetyp(KnihovnaOceneniArchetyp book, HttpPostedFileBase picture)
        {
            if (ModelState.IsValid)
            {
                KnihovnaOceneniArchetyp b = new KnihovnaOceneniArchetyp()
                {
                    Name = book.Name,
                    Id = Books.Counter(),
                    OdznakId = Books.Counter(),
                    Text = book.Text
                };


                if (picture != null)
                {
                    var z = picture.ContentLength;

                    if (picture.ContentType == "image/jpeg" || picture.ContentType == "image/png")
                    {
                        Image image = Image.FromStream(picture.InputStream);
                        Image smalImage = ImageHelper.ResizeImageHighQuality(image, 64, 64);


                        Bitmap btmBitmap = new Bitmap(smalImage);
                        Guid guid = Guid.NewGuid();

                        string imageName = guid.ToString() + ".png";
                        btmBitmap.Save(Server.MapPath("~/Uploads/Odznaky/") + imageName, ImageFormat.Png); // Je potřeba namapovat cestu!

                        btmBitmap.Dispose();
                        image.Dispose();

                        b.Image = imageName;
                    }
                }

                KnihovnaOceneniArchetypDao bookDao = new KnihovnaOceneniArchetypDao();
                bookDao.Create(b);

                // Notifikace
                TempData["scs"] = "V pořádku";
            }
            else
            {
                return View("AddOdznakArchetyp", book); // Vrátím vstupní data
            }

            return Redirect(Request.UrlReferrer.ToString());
        }

        [Authorize(Roles = "knihovnik")]
        [ValidateInput(false)]
        public ActionResult CreateOdznak(KnihovnaOceneni book)
        {
            if (ModelState.IsValid)
            {
                KnihovnaOceneni b = new KnihovnaOceneni()
                {
                    Name = book.Name,
                    Id = Books.Counter(),
                    OdznakId = book.OdznakId,
                    Text = book.Text,
                    UserId = book.UserId,
                    DatumZiskani = DateTime.Now,
                    Image = book.Image,
                    Venovani = ""
                };

                KnihovnaOceneniArchetypDao a = new KnihovnaOceneniArchetypDao();
                KnihovnaOceneniArchetyp o = a.GetbyId(b.OdznakId);

                b.Image = o.Image;


                KnihovnaOceneniDao bookDao = new KnihovnaOceneniDao();
                bookDao.Create(b);

                // Notifikace
                TempData["scs"] = "V pořádku";
            }
            else
            {
                return View("AddOdznak", book); // Vrátím vstupní data
            }

            return Redirect(Request.UrlReferrer.ToString());
        }

        [Authorize(Roles = "knihovnik")]
        [ValidateInput(false)]
        public ActionResult CreateOdznakBook(BookOdznak book)
        {
            if (ModelState.IsValid)
            {
                BookOdznak b = new BookOdznak()
                {
                    Id = Books.Counter(),
                    OdznakId = book.OdznakId,
                    BookId = book.BookId,
                    Date = DateTime.Now           
                };

                BookOdznakDao bookDao = new BookOdznakDao();
                bookDao.Create(b);

                // Notifikace
                TempData["scs"] = "V pořádku";
            }
            else
            {
                return View("AddOdznakBook", book); // Vrátím vstupní data
            }

            return Redirect(Request.UrlReferrer.ToString());
        }
    }
}
