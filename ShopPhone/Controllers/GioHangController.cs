using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopPhone.Models;

namespace ShopPhone.Controllers
{
    public class GioHangController : Controller
    {
        private ShopPhoneEntities db = new ShopPhoneEntities();
        // GET: GioHang
        public ActionResult Index()
        {
            return View();
        }
        // GET: GioHang/Them
        public ActionResult Them(int masp)
        {
            if (Session["cart"] == null)
            {
                var sp = db.SanPham.Find(masp);

                List<SanPhamTrongGio> cart = new List<SanPhamTrongGio>();
                cart.Add(new SanPhamTrongGio { sanpham = sp, SoLuongTrongGio = 1 });
                Session["cart"] = cart;
            }
            else
            {
                List<SanPhamTrongGio> cart = (List<SanPhamTrongGio>)Session["cart"];
                int index = isExist(masp);
                if (index != -1)
                {
                    cart[index].SoLuongTrongGio++;
                }
                else
                {
                    var sp = db.SanPham.Find(masp);
                    cart.Add(new SanPhamTrongGio { sanpham = sp, SoLuongTrongGio = 1 });
                }
                Session["cart"] = cart;
            }

            return RedirectToAction("Index");
        }

        // GET: GioHang/CapNhatTang
        public ActionResult CapNhatTang(int maSP)
        {
            List<SanPhamTrongGio> cart = (List<SanPhamTrongGio>)Session["cart"];
            foreach (var item in cart)
            {
                if (item.sanpham.ID == maSP && item.SoLuongTrongGio <= 10)
                    item.SoLuongTrongGio++;
            }
            Session["cart"] = cart;

            return RedirectToAction("Index");
        }

        // GET: GioHang/CapNhatGiam
        public ActionResult CapNhatGiam(int masp)
        {
            List<SanPhamTrongGio> cart = (List<SanPhamTrongGio>)Session["cart"];
            foreach (var item in cart)
            {
                if (item.sanpham.ID == masp && item.SoLuongTrongGio >= 1)
                    item.SoLuongTrongGio--;
            }
            Session["cart"] = cart;

            return RedirectToAction("Index");
        }

        // GET: GioHang/Xoa
        public ActionResult Xoa(int masp)
        {
            List<SanPhamTrongGio> cart = (List<SanPhamTrongGio>)Session["cart"];
            int index = isExist(masp);
            cart.RemoveAt(index);
            Session["cart"] = cart;
            return RedirectToAction("Index");
        }

        private int isExist(int id)
        {
            List<SanPhamTrongGio> cart = (List<SanPhamTrongGio>)Session["cart"];
            for (int i = 0; i < cart.Count; i++)
                if (cart[i].sanpham.ID.Equals(id))
                    return i;
            return -1;
        }
    }
}