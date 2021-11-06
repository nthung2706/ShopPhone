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
    public class TaiKhoanController : Controller
    {
        private ShopPhoneEntities db = new ShopPhoneEntities();

        // GET: Admin/TaiKhoan
        public ActionResult Index()
        {
            return View(db.TaiKhoan.ToList());
        }

        // GET: Admin/TaiKhoan/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaiKhoan taiKhoan = db.TaiKhoan.Find(id);
            if (taiKhoan == null)
            {
                return HttpNotFound();
            }
            return View(taiKhoan);
        }
        public ActionResult Logout()
        {
            // Xóa SESSION
            Session.Remove("ID");
            Session.Remove("hoten");
            Session.Remove("chucvu");

            // Quay về trang chủ
            return RedirectToAction("Index", "Home");
        }


        // GET: Admin/TaiKhoan/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/TaiKhoan/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,ChucVu,HoTen,TenDangNhap,MatKhau,XacNhanMatKhau,SoDienThoai,DiaChi")] TaiKhoan taiKhoan)
        {
            if (ModelState.IsValid)
            {

                // Mã hóa mật khẩu
                taiKhoan.MatKhau = SHA1.ComputeHash(taiKhoan.MatKhau);
                taiKhoan.XacNhanMatKhau = SHA1.ComputeHash(taiKhoan.XacNhanMatKhau);

                db.TaiKhoan.Add(taiKhoan);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(taiKhoan);
        }

        // GET: Admin/TaiKhoan/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaiKhoan taiKhoan = db.TaiKhoan.Find(id);
            if (taiKhoan == null)
            {
                return HttpNotFound();
            }
            return View(taiKhoan);
        }

        // POST: Admin/TaiKhoan/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,ChucVu,HoTen,TenDangNhap,MatKhau,SoDienThoai,XacNhanMatKhau,DiaChi")] NhanVienEdit taiKhoan)
        {
            if (ModelState.IsValid)
            {
                TaiKhoan n = db.TaiKhoan.Find(taiKhoan.ID);

                // Giữ nguyên mật khẩu cũ
                if (taiKhoan.MatKhau == null)
                {
                    n.ID = taiKhoan.ID;
                    n.HoTen = taiKhoan.HoTen;
                    n.SoDienThoai = taiKhoan.SoDienThoai;
                    n.DiaChi = taiKhoan.DiaChi;
                    n.TenDangNhap = taiKhoan.TenDangNhap;
                    n.XacNhanMatKhau = n.MatKhau;
                    n.ChucVu = taiKhoan.ChucVu;
                }
                else // Cập nhật mật khẩu mới
                {
                    n.ID = taiKhoan.ID;
                    n.HoTen = taiKhoan.HoTen;
                    n.SoDienThoai = taiKhoan.SoDienThoai;
                    n.DiaChi = taiKhoan.DiaChi;
                    n.TenDangNhap = taiKhoan.TenDangNhap;
                    n.MatKhau = SHA1.ComputeHash(taiKhoan.MatKhau);
                    n.XacNhanMatKhau = SHA1.ComputeHash(taiKhoan.XacNhanMatKhaU);
                    n.ChucVu = taiKhoan.ChucVu;
                }

                db.Entry(n).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(taiKhoan);
        }

        // GET: Admin/TaiKhoan/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaiKhoan taiKhoan = db.TaiKhoan.Find(id);
            if (taiKhoan == null)
            {
                return HttpNotFound();
            }
            return View(taiKhoan);
        }

        // POST: Admin/TaiKhoan/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TaiKhoan taiKhoan = db.TaiKhoan.Find(id);
            db.TaiKhoan.Remove(taiKhoan);
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
