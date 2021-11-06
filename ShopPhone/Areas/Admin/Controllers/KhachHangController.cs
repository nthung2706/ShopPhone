using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShopPhone.Models;
using ShopPhone.Libs;

namespace ShopPhone.Areas.Admin.Controllers
{
    public class KhachHangController : Controller
    {
        private ShopPhoneEntities db = new ShopPhoneEntities();

        // GET: Admin/KhachHang
        public ActionResult Index()
        {
            return View(db.KhachHang.ToList());
        }

        // GET: Admin/KhachHang/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KhachHang khachHang = db.KhachHang.Find(id);
            if (khachHang == null)
            {
                return HttpNotFound();
            }
            return View(khachHang);
        }

        // GET: Admin/KhachHang/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/KhachHang/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,HoTen,SoDienThoai,DiaChi,TenDangNhap,MatKhau,XacNhanMatKhau")] KhachHang khachHang)
        {
            if (ModelState.IsValid)
            {
                // Mã hóa mật khẩu
                khachHang.MatKhau = SHA1.ComputeHash(khachHang.MatKhau);
                khachHang.XacNhanMatKhau = SHA1.ComputeHash(khachHang.XacNhanMatKhau);

                db.KhachHang.Add(khachHang);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(khachHang);
        }

        // GET: Admin/KhachHang/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KhachHang khachHang = db.KhachHang.Find(id);
            if (khachHang == null)
            {
                return HttpNotFound();
            }
            return View(khachHang);
        }

        // POST: Admin/KhachHang/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,HoTen,SoDienThoai,DiaChi,TenDangNhap,MatKhau,XacNhanMatKhau")] KhachHangEdit khachHang)
        {
            if (ModelState.IsValid)
            {
                KhachHang n = db.KhachHang.Find(khachHang.ID);

                // Giữ nguyên mật khẩu cũ
                if (khachHang.MatKhau == null)
                {
                    n.ID = khachHang.ID;
                    n.HoTen = khachHang.HoTen;
                    n.SoDienThoai = khachHang.SoDienThoai;
                    n.DiaChi = khachHang.DiaChi;
                    n.TenDangNhap = khachHang.TenDangNhap;
                    n.XacNhanMatKhau = n.MatKhau;
                }
                else // Cập nhật mật khẩu mới
                {
                    n.ID = khachHang.ID;
                    n.HoTen = khachHang.HoTen;
                    n.SoDienThoai = khachHang.SoDienThoai;
                    n.DiaChi = khachHang.DiaChi;
                    n.TenDangNhap = khachHang.TenDangNhap;
                    n.MatKhau = SHA1.ComputeHash(khachHang.MatKhau);
                    n.XacNhanMatKhau = SHA1.ComputeHash(khachHang.XacNhanMatKhaU);
                }

                db.Entry(n).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(khachHang);
        }

        // GET: Admin/KhachHang/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KhachHang khachHang = db.KhachHang.Find(id);
            if (khachHang == null)
            {
                return HttpNotFound();
            }
            return View(khachHang);
        }

        // POST: Admin/KhachHang/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            KhachHang khachHang = db.KhachHang.Find(id);
            db.KhachHang.Remove(khachHang);
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
