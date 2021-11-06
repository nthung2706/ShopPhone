using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopPhone.Libs;
using ShopPhone.Models;

namespace ShopPhone.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        private ShopPhoneEntities db = new ShopPhoneEntities();
        public ActionResult Index()
        {
            List<SanPham> sanPham = db.SanPham.ToList();
            return View(sanPham);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Logout()
        {
            // Xóa SESSION
            Session.RemoveAll();

            // Quay về trang chủ
            return RedirectToAction("Index", "Home");
        }

        // GET: Home/Login
        public ActionResult Login()
        {
            ModelState.AddModelError("LoginError", "");
            return View();
        }

        // POST: Home/Login
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(NhanVienLogin nhanVien)
        {
            if (ModelState.IsValid)
            {
                string matKhauMaHoa = SHA1.ComputeHash(nhanVien.MatKhau);
                var nhanvien = db.TaiKhoan.Where(r => r.TenDangNhap == nhanVien.TenDangNhap && r.MatKhau == matKhauMaHoa).SingleOrDefault();

                if (nhanvien == null)
                {
                    ModelState.AddModelError("LoginError", "Tên đăng nhập hoặc mật khẩu không chính xác!");
                    return View(nhanVien);
                }
                else
                {
                    // Đăng ký SESSION
                    Session["ID"] = nhanvien.ID;
                    Session["hoten"] = nhanvien.HoTen;
                    Session["ChucVu"] = nhanvien.ChucVu;

                    // Quay về trang chủ
                    return RedirectToAction("Index", "Home");
                }
            }

            return View(nhanVien);
        }

        public ActionResult ChangePassword()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePassword([Bind(Include = "MatKhau,MatKhauMoi,XacNhanMatKhauMoi")] NhanVienChangePassword nhanVienChangePassword)
        {
            if (ModelState.IsValid)
            {
                int makh = Convert.ToInt32(Session["ID"]);
                KhachHang khachHang = db.KhachHang.Find(makh);
                if (khachHang == null)
                {
                    return HttpNotFound();
                }
                nhanVienChangePassword.MatKhau = SHA1.ComputeHash(nhanVienChangePassword.MatKhau);
                if (khachHang.MatKhau == nhanVienChangePassword.MatKhau)
                {
                    nhanVienChangePassword.MatKhauMoi = SHA1.ComputeHash(nhanVienChangePassword.MatKhauMoi);
                    nhanVienChangePassword.XacNhanMatKhauMoi = nhanVienChangePassword.MatKhauMoi;

                    khachHang.MatKhau = nhanVienChangePassword.MatKhauMoi;
                    khachHang.XacNhanMatKhau = nhanVienChangePassword.MatKhauMoi;

                    db.Entry(khachHang).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Logout", "Home");
                }
                else
                {
                    ViewBag.error = "Mật khẩu cũ không đúng !!!";
                    return View();
                }


            }
            return View(nhanVienChangePassword);
        }
    }
}