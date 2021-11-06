using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopPhone.Models
{
    public class SanPhamTrongGio
    {
        public SanPham sanpham { get; set; }
        public int SoLuongTrongGio { get; set; }
    }

    public class DonHangCuaToi
    {
        public int ID { get; set; }
        public string TenSanPham { get; set; }
        public string HinhAnhBia { get; set; }
        public HttpPostedFileBase DuLieuHinhAnhBia { get; set; }
        public Nullable<int> DonGia { get; set; }
        public Nullable<short> SoLuong { get; set; }
        public Nullable<System.DateTime> NgayDatHang { get; set; }
    }
}