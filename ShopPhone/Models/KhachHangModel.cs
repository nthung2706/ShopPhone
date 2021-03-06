using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShopPhone.Models
{
    public class KhachHangEdit
    {
        public KhachHangEdit()
        {
        }
        public KhachHangEdit(KhachHangEdit kh)
        {
            ID = kh.ID;
            HoTen = kh.HoTen;
            SoDienThoai = kh.SoDienThoai;
            DiaChi = kh.DiaChi;
            TenDangNhap = kh.TenDangNhap;
            MatKhau = kh.MatKhau;
            XacNhanMatKhaU = kh.XacNhanMatKhaU;
        }
        public int ID { get; set; }
        public string HoTen { get; set; }
        public string SoDienThoai { get; set; }
        public string DiaChi { get; set; }
        public string TenDangNhap { get; set; }
        public string MatKhau { get; set; }
        public string XacNhanMatKhaU { get; set; }
    }
    public class KhachHangLogin
    {
        [Display(Name = "Tên đăng nhập")]
        [Required(ErrorMessage = "Tên đăng nhập không được bỏ trống!")]
        public string TenDangNhap { get; set; }

        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Mật khẩu không được bỏ trống!")]
        [DataType(DataType.Password)]
        public string MatKhau { get; set; }
    }

    public class KhachHangChangePassword
    {
        [Display(Name = "Mật khẩu củ")]
        [Required(ErrorMessage = "Mật khẩu củ không được bỏ trống!")]
        [DataType(DataType.Password)]
        public string MatKhau { get; set; }

        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Mật khẩu không được bỏ trống!")]
        [DataType(DataType.Password)]
        public string MatKhauMoi { get; set; }

        [Display(Name = "Xác nhận mật khẩu")]
        [Required(ErrorMessage = "Xác nhận mật khẩu không được bỏ trống!")]
        [Compare("MatKhauMoi", ErrorMessage = "Xác nhận mật khẩu không chính xác!")]
        [DataType(DataType.Password)]
        public string XacNhanMatKhauMoi { get; set; }
    }
}