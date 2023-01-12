using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PROJE_Deneme_1
{
    public partial class PersonelIzinler : Form
    {


        public int gelenID;
        public PersonelIzinler()
        {
            InitializeComponent();
        }
        HastaneOtomasyonEntities db = new HastaneOtomasyonEntities();
        private void PersonelIzinler_Load(object sender, EventArgs e)
        {
            
            label1.Text = db.Personel.Where(x => x.PersonelID == gelenID).FirstOrDefault().PersonelAdi;
            GuncelTablo();

        }

        private void GuncelTablo()
        {
            using (HastaneOtomasyonEntities db = new HastaneOtomasyonEntities())
            {
                
                var izinlerlist = db.Izinler.Where(x=>x.PersonelID==gelenID).ToList();
                foreach (var izin in izinlerlist)
                {
                    ListViewItem ekle = new ListViewItem(izin.IzinID.ToString());
                    ekle.SubItems.Add(izin.IzınTuru);
                    ekle.SubItems.Add(izin.IzinBaslangic.ToString());
                    ekle.SubItems.Add(izin.IzinBitis.ToString());
                    ekle.SubItems.Add(izin.IzinAdresi);

                    lsvIzinler.Items.Add(ekle);
                }
            }
        }

        private void btnKaydet_Click(object sender, EventArgs e)
        {
            Izinler yeni = new Izinler();
            //yeni.PersonelID = txtPersonelAdi.Text;
            yeni.IzınTuru = txtIzinTuru.Text;
            yeni.IzinBaslangic = dtpBaslangic.Value;
            yeni.IzinBitis = dtpBitis.Value;
            yeni.IzinAdresi = txtAdres.Text;

            string[] satir = { yeni.IzınTuru, yeni.IzinBaslangic.ToString(), yeni.IzinBitis.ToString(), yeni.IzinAdresi };
            ListViewItem lvItem = new ListViewItem(satir);
            lvItem.Tag = yeni;
            lsvIzinler.Items.Add(lvItem);

            db.SaveChanges();
            GuncelTablo();
        }

        Izinler secilen;
        private void lsvIzinler_DoubleClick(object sender, EventArgs e)
        {

            if (lsvIzinler.SelectedItems.Count > 0) 
            {
                secilen = (Izinler)lsvIzinler.SelectedItems[0].Tag;
                //txtPersonelAdi.Text = secilen.Personel.PersonelAdi;
                txtIzinTuru.Text = secilen.IzınTuru;
                dtpBaslangic.Value = secilen.IzinBaslangic;
                dtpBitis.Value = secilen.IzinBitis;
                txtAdres.Text = secilen.IzinAdresi;

            }
        }
    }
}
