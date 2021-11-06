using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShopPhone.Models;

namespace ShopPhone.Areas.Admin.Controllers
{
    public class NoiSanXuatController : Controller
    {
        private ShopPhoneEntities db = new ShopPhoneEntities();

        // GET: Admin/NoiSanXuat
        public ActionResult Index()
        {
            return View(db.NoiSanXuat.ToList());
        }

        // GET: Admin/NoiSanXuat/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NoiSanXuat noiSanXuat = db.NoiSanXuat.Find(id);
            if (noiSanXuat == null)
            {
                return HttpNotFound();
            }
            return View(noiSanXuat);
        }

        // GET: Admin/NoiSanXuat/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/NoiSanXuat/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,XuatXu")] NoiSanXuat noiSanXuat)
        {
            if (ModelState.IsValid)
            {
                db.NoiSanXuat.Add(noiSanXuat);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(noiSanXuat);
        }

        // GET: Admin/NoiSanXuat/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NoiSanXuat noiSanXuat = db.NoiSanXuat.Find(id);
            if (noiSanXuat == null)
            {
                return HttpNotFound();
            }
            return View(noiSanXuat);
        }

        // POST: Admin/NoiSanXuat/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,XuatXu")] NoiSanXuat noiSanXuat)
        {
            if (ModelState.IsValid)
            {
                db.Entry(noiSanXuat).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(noiSanXuat);
        }

        // GET: Admin/NoiSanXuat/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NoiSanXuat noiSanXuat = db.NoiSanXuat.Find(id);
            if (noiSanXuat == null)
            {
                return HttpNotFound();
            }
            return View(noiSanXuat);
        }

        // POST: Admin/NoiSanXuat/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NoiSanXuat noiSanXuat = db.NoiSanXuat.Find(id);
            db.NoiSanXuat.Remove(noiSanXuat);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
