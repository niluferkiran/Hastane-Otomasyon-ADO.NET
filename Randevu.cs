//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PROJE_Deneme_1
{
    using System;
    using System.Collections.Generic;
    
    public partial class Randevu
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Randevu()
        {
            this.ReceteDetay = new HashSet<ReceteDetay>();
        }
    
        public int RandevuID { get; set; }
        public int HastaID { get; set; }
        public int DoktorID { get; set; }
        public string Sikayet { get; set; }
        public string Teshis { get; set; }
        public string Tedavi { get; set; }
        public Nullable<bool> RandevuDurum { get; set; }
    
        public virtual Doktorlar Doktorlar { get; set; }
        public virtual Hasta Hasta { get; set; }
        public virtual RandevuDetay RandevuDetay { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ReceteDetay> ReceteDetay { get; set; }
    }
}
