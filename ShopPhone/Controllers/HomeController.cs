using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopPhone.Libs;
using ShopPhone.Models;

namespace ShopPhone.Controllers
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

        public ActionResult ChiTiet(int masp)
        {
            var ChiTiet = (from sp in db.SanPham
                           where (sp.ID == masp)

                           select new SanPhamModel()
                           {
                               ID = masp,
                               TenSanPham = sp.TenSanPham,
                               HinhAnhBia = sp.HinhAnhBia,
                               MoTa = sp.MoTa,
                               Hang = sp.Hang,
                               NoiSanXuat = sp.NoiSanXuat,



                           }).ToList();

            return View(ChiTiet);
        }

        public ActionResult Logout()
        {
            // Xóa SESSION
            Session.RemoveAll();

            // Quay về trang chủ
            return RedirectToAction("Index", "Home");
        }

        public ActionResult MuaNhieuNhat()
        {
            var ShopPhone = db.DatHang_ChiTiet.Where(r => r.SoLuong > 0).OrderByDescending(r => r.SoLuong).ToList();
            var MuaNhieuNhat = (from sp in db.SanPham
                          join chitiet in db.DatHang_ChiTiet on sp.ID equals chitiet.SanPham_ID
                          where (chitiet.SoLuong > 0)
                          select new SanPhamModel()
                          {
                              TenSanPham = sp.TenSanPham,
                              HinhAnhBia = sp.HinhAnhBia,
                              DonGia = sp.DonGia,
                              ID = sp.ID,
                              SoLuong = chitiet.SoLuong
                          }).OrderByDescending(chitiet => chitiet.SoLuong).ToList();

            return View(MuaNhieuNhat);
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
        public ActionResult Login(KhachHangLogin khachHang)
        {
            if (ModelState.IsValid)
            {
                string mahoamatkhau = SHA1.ComputeHash(khachHang.MatKhau);
                var taiKhoan = db.KhachHang.Where(r => r.TenDangNhap == khachHang.TenDangNhap && r.MatKhau == mahoamatkhau).SingleOrDefault();

                if (taiKhoan == null)
                {
                    ModelState.AddModelError("LoginError", "Tên đăng nhập hoặc mật khẩu không chính xác!");
                    return View(khachHang);
                }
                else
                {
                    // Đăng ký SESSION
                    Session["MaKhachHang"] = taiKhoan.ID;
                    Session["HoTenKhachHang"] = taiKhoan.HoTen;

                    // Quay về trang chủ
                    return RedirectToAction("Index", "Home");
                }
            }

            return View(khachHang);
        }

        // GET: Home/Login
        public ActionResult LoginGioHang()
        {
            ModelState.AddModelError("LoginError", "");
            return View();
        }

        // POST: Home/Login
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LoginGioHang(KhachHangLogin khachHang)
        {
            if (ModelState.IsValid)
            {
                string mahoamatkhau = SHA1.ComputeHash(khachHang.MatKhau);
                var taiKhoan = db.KhachHang.Where(r => r.TenDangNhap == khachHang.TenDangNhap && r.MatKhau == mahoamatkhau).SingleOrDefault();

                if (taiKhoan == null)
                {
                    ModelState.AddModelError("LoginError", "Tên đăng nhập hoặc mật khẩu không chính xác!");
                    return View(khachHang);
                }
                else
                {
                    // Đăng ký SESSION
                    Session["MaKhachHang"] = taiKhoan.ID;
                    Session["HoTenKhachHang"] = taiKhoan.HoTen;

                    // Quay về trang chủ
                    return RedirectToAction("Index", "GioHang");
                }
            }

            return View(khachHang);
        }

        public ActionResult XacNhanMuaHang()
        {
            if (Session["MaKhachHang"] == null)
            {
                return RedirectToAction("LoginGioHang", "Home");
            }
            
            else
            {
                return View();
            }
        }

        public ActionResult DonHangCuaToi()
        {
            int makh = Convert.ToInt32(Session["MaKhachHang"]);
            var DonHangCuaToi = (from sp in db.SanPham
                            join chitiet in db.DatHang_ChiTiet on sp.ID equals chitiet.SanPham_ID
                            join dhang in db.DatHang on chitiet.DatHang_ID equals dhang.ID
                            join kh in db.KhachHang on dhang.KhachHang_ID equals kh.ID
                            where (kh.ID == makh)

                            select new DonHangCuaToi()
                            {
                                TenSanPham = sp.TenSanPham,
                                HinhAnhBia = sp.HinhAnhBia,
                                DonGia = chitiet.DonGia,
                                ID = kh.ID,
                                SoLuong = chitiet.SoLuong,
                                NgayDatHang = dhang.NgayDatHang

                            }).OrderByDescending(dhang => dhang.NgayDatHang).ToList();

            return View(DonHangCuaToi);
        }

        public ActionResult TimKiem(FormCollection collection)
        {
            string tukhoa = collection["TuKhoa"].ToString();
            var sp = db.SanPham.Where(r => r.TenSanPham.Contains(tukhoa) || r.Hang.TenHang.Contains(tukhoa) || r.NoiSanXuat.XuatXu.Contains(tukhoa)).ToList();
            return View(sp);
        }

        // POST: Home/Pay
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult XacNhanMuaHang(DatHang DatHang)
        {
            if (ModelState.IsValid)
            {
                // Lưu vào bảng dathang
                DatHang dh = new DatHang();
                dh.DiaChiGiaoHang = DatHang.DiaChiGiaoHang;
                dh.DienThoaiGiaoHang = DatHang.DienThoaiGiaoHang;
                dh.NgayDatHang = DateTime.Now;
                dh.KhachHang_ID = Convert.ToInt32(Session["MaKhachHang"]);
                dh.TinhTrang = 0;
                db.DatHang.Add(dh);
                db.SaveChanges();

                // Lưu vào bảng DatHang_ChiTiet
                List<SanPhamTrongGio> cart = (List<SanPhamTrongGio>)Session["cart"];
                foreach (var item in cart)
                {
                    DatHang_ChiTiet chitiet = new DatHang_ChiTiet();
                    chitiet.DatHang_ID = dh.ID;
                    chitiet.SanPham_ID = item.sanpham.ID;
                    chitiet.SoLuong = Convert.ToInt16(item.SoLuongTrongGio);
                    chitiet.DonGia = item.sanpham.DonGia;
                    db.DatHang_ChiTiet.Add(chitiet);
                    db.SaveChanges();
                }

                // Xóa giỏ hàng
                cart.Clear();

                // Quay về trang chủ
                return RedirectToAction("Index", "Home");
            }

            return View(DatHang);
        }

        public ActionResult DangKy()
        {
            return View();
        }

        //POST: Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DangKy(KhachHang kh)
        {
            if (ModelState.IsValid)
            {
                var check = db.KhachHang.FirstOrDefault(r => r.TenDangNhap == kh.TenDangNhap);
                if (check == null)
                {
                    kh.MatKhau = SHA1.ComputeHash(kh.MatKhau);
                    kh.XacNhanMatKhau = SHA1.ComputeHash(kh.XacNhanMatKhau);
                    db.Configuration.ValidateOnSaveEnabled = false;
                    db.KhachHang.Add(kh);
                    db.SaveChanges();
                    return RedirectToAction("Login");
                }
                else
                {
                    ViewBag.error = "Tên đăng nhập đã tồn tại !!!";
                    return View();
                }
            }
            return View();
        }

        public ActionResult ChangePassword()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePassword([Bind(Include = "MatKhau,MatKhauMoi,XacNhanMatKhauMoi")] KhachHangChangePassword khachHangChangePassword)
        {
            if (ModelState.IsValid)
            {
                int makh = Convert.ToInt32(Session["MaKhachHang"]);
                KhachHang khachHang = db.KhachHang.Find(makh);
                if (khachHang == null)
                {
                    return HttpNotFound();
                }
                khachHangChangePassword.MatKhau = SHA1.ComputeHash(khachHangChangePassword.MatKhau);
                if (khachHang.MatKhau == khachHangChangePassword.MatKhau)
                {
                    khachHangChangePassword.MatKhauMoi = SHA1.ComputeHash(khachHangChangePassword.MatKhauMoi);
                    khachHangChangePassword.XacNhanMatKhauMoi = khachHangChangePassword.MatKhauMoi;

                    khachHang.MatKhau = khachHangChangePassword.MatKhauMoi;
                    khachHang.XacNhanMatKhau = khachHangChangePassword.MatKhauMoi;

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
            return View(khachHangChangePassword);
        }
    }
}