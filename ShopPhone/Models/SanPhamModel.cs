using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopPhone.Models
{
    public class SanPhamModel
    {
        public int ID { get; set; }
        public string TenSanPham { get; set; }
        public string HinhAnhBia { get; set; }
        public string MoTa { get; set; }
        public Nullable<int> DonGia { get; set; }
        public Nullable<int> NoiSanXuat_ID { get; set; }
        public Nullable<int> Hang_ID { get; set; }
        public Nullable<int> SoLuong { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DatHang_ChiTiet> DatHang_ChiTiet { get; set; }
        public virtual Hang Hang { get; set; }
        public virtual Loai Loai { get; set; }
        public virtual NoiSanXuat NoiSanXuat { get; set; }
    }

}
