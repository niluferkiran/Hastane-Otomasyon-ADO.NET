using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PROJE_Deneme_1
{
    public partial class Form2 : Form
    {
       

        HastaneOtomasyonEntities db = new HastaneOtomasyonEntities();
        public string aktifKullanici;
        public string aktifKullaniciID;
        public Form2()
        {
            InitializeComponent();
        }


        private void btnCikis_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            string KullaniciID = db.Personel.ToString();
            //Kullanıcıyı DB'den bulduk
            Personel personel = db.Personel.Where(p => p.TCKN == aktifKullanici).Include(x=>x.Meslek).Include(x => x.Izinler).FirstOrDefault();
            label1.Text = "Hoşgeldin : " + personel.PersonelAdi;
            label2.Text = "Yetkiniz : " + personel.Meslek.MeslekTuru;
            label4.Text = "Kullanıcı ID : " + personel.PersonelID;
            if (personel.Meslek.MeslekID != 15 /*|| personel.Meslek.MeslekID != 8*/)
                btnPersonelEkle.Visible = false;


        }

        private void btnPersonelEkle_Click(object sender, EventArgs e)
        {
            PersonelEkle persEkle = new PersonelEkle();
            persEkle.Show();
        }

        private void btnRecete_Click(object sender, EventArgs e)
        {
            ReceteForm rct = new ReceteForm();
            rct.Show();
        }

        private void btnHastaKabul_Click(object sender, EventArgs e)
        {
            Form3 frm3 = new Form3();
            frm3.Show();
        }

        private void btnRandevu_Click(object sender, EventArgs e)
        {
            RandevuForm rndform = new RandevuForm();
            rndform.Show();
        }
    }
}
