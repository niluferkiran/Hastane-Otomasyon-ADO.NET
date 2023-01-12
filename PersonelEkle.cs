using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PROJE_Deneme_1
{
    public partial class PersonelEkle : Form
    {
        public PersonelEkle()
        {
            InitializeComponent();
        }

        HastaneOtomasyonEntities db = new HastaneOtomasyonEntities();
        PersonelIzinler persizin = new PersonelIzinler();
        private void PersonelEkle_Load(object sender, EventArgs e)
        {
            GuncelTablo();
        }

        private void GuncelTablo()
        {
            var Meslek = db.Meslek.ToList();
            listBox1.DataSource = db.Personel.ToList();

            comboBoxMeslek.DataSource = Meslek;
            comboBoxMeslek.DisplayMember = "MeslekTuru";

            var KanGrubu = db.KanGrubu.ToList();
            comboBoxKanGrubu.DataSource = KanGrubu;
            comboBoxKanGrubu.DisplayMember = "KanGrubuID";


        }
        string cinsiyet;
        Personel yeniPersonel = new Personel();
        private void btnKaydet_Click(object sender, EventArgs e)
        {
            if (txtAd.Text != "")
            {
                if (radioButtonKadin.Checked == true)
                {
                    cinsiyet = radioButtonKadin.Text;
                }
                else
                {
                    cinsiyet = radioButtonErkek.Text;
                }
                //Personel yeniPersonel = new Personel();
                yeniPersonel.Meslek = (Meslek)comboBoxMeslek.SelectedItem; //meslek id olarak mı gelecek?
                yeniPersonel.PersonelAdi = txtAd.Text;
                yeniPersonel.PersonelSoyadi = txtSoyad.Text;
                yeniPersonel.TCKN = txtTCKN.Text;
                yeniPersonel.DogumTarihi = dtpDogumTarihi.Value;
                yeniPersonel.EnSonMezuniyetBilgisi = txtMezuniyet.Text;
                yeniPersonel.Sifre = MD5Sifrele(txtSifre.Text);
                yeniPersonel.TelefonNo = txtTelefonNo.Text; //12 HANE CONSTRAINT geri getir db de
                yeniPersonel.Mail = txtMail.Text;
                yeniPersonel.İseGirisTarihi = dtpIseGirisTarihi.Value;
                yeniPersonel.KanGrubu = (KanGrubu)comboBoxKanGrubu.SelectedItem;
                yeniPersonel.Adres = txtAdres.Text;
                yeniPersonel.Cinsiyet = cinsiyet;
                yeniPersonel.PersonelDurum = true;
                yeniPersonel.HastaneID = 1;
                db.Personel.Add(yeniPersonel);
                try
                {
                    db.SaveChanges();
                }
                catch (Exception err)
                {
                    Console.WriteLine(err);
                    throw;
                }
                SifrelerVeHashler sifrelerVeHashler = new SifrelerVeHashler();
                sifrelerVeHashler.Hash = MD5Sifrele(txtSifre.Text);
                sifrelerVeHashler.Sifre = txtSifre.Text;
                sifrelerVeHashler.PersonelID = yeniPersonel.PersonelID;
                db.SifrelerVeHashler.Add(sifrelerVeHashler);
                db.SaveChanges();
                GuncelTablo();
                Temizle();
                
            }
        }

        private void Temizle()
        {
            foreach (var item in groupBox1.Controls)
            {
                if (item is TextBox)
                {
                    TextBox txt = (TextBox)item;
                    txt.Clear();
                }
                else if (item is DateTimePicker)
                {
                    DateTimePicker dtp = (DateTimePicker)item;
                    dtp.Value = DateTime.Now;
                }
            }
        }
        Personel secilenPersonel;
        private void listBox1_DoubleClick(object sender, EventArgs e)
        {
            if (listBox1.SelectedIndex != -1 || listBox1.SelectedItems.Count > 0)
            {
                secilenPersonel = (Personel)listBox1.SelectedItem;
                txtAd.Text = secilenPersonel.PersonelAdi;
                txtSoyad.Text = secilenPersonel.PersonelSoyadi;
                comboBoxMeslek.SelectedItem = secilenPersonel.Meslek.MeslekTuru;
                txtTCKN.Text = secilenPersonel.TCKN;
                dtpDogumTarihi.Value = secilenPersonel.DogumTarihi.Value;
                txtMezuniyet.Text = secilenPersonel.EnSonMezuniyetBilgisi;
                txtSifre.Text = db.SifrelerVeHashler.Where(x=>x.PersonelID==secilenPersonel.PersonelID).FirstOrDefault().Sifre;
                cinsiyet = secilenPersonel.Cinsiyet;
                txtTelefonNo.Text = secilenPersonel.TelefonNo;
                txtMail.Text = secilenPersonel.Mail;
                dtpIseGirisTarihi.Value = secilenPersonel.İseGirisTarihi;
                comboBoxKanGrubu.SelectedItem = secilenPersonel.KanGrubu.KanGrubuID;
                txtAdres.Text = secilenPersonel.Adres;

            }
            else
            {
                MessageBox.Show("Lütfen bir satır seçiniz.");
            }
        }

        private void btnGuncelle_Click(object sender, EventArgs e)
        {
            if (txtAd.Text != "")
            {
                secilenPersonel.PersonelAdi = txtAd.Text;
                secilenPersonel.PersonelSoyadi = txtSoyad.Text;
                secilenPersonel.TCKN = txtTCKN.Text;
                secilenPersonel.Meslek = (Meslek)comboBoxMeslek.SelectedItem;
                secilenPersonel.DogumTarihi = dtpDogumTarihi.Value;
                secilenPersonel.EnSonMezuniyetBilgisi = txtMezuniyet.Text;
                secilenPersonel.Sifre = MD5Sifrele(txtSifre.Text);
                secilenPersonel.Cinsiyet = cinsiyet;
                secilenPersonel.TelefonNo = txtTelefonNo.Text;
                secilenPersonel.Mail = txtMail.Text;
                secilenPersonel.İseGirisTarihi = dtpIseGirisTarihi.Value;
                secilenPersonel.KanGrubu = (KanGrubu)comboBoxKanGrubu.SelectedItem;
                secilenPersonel.Adres = txtAdres.Text;

                var sifreEnc = db.SifrelerVeHashler.Where(x => x.PersonelID == secilenPersonel.PersonelID).FirstOrDefault();
                sifreEnc.Hash = MD5Sifrele(txtSifre.Text);
                sifreEnc.Sifre = txtSifre.Text;
                db.SaveChanges();
                GuncelTablo();
                
            }
            Temizle();
        }
        private static string MD5Sifrele(string PersonelSifre)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] dizi = Encoding.UTF8.GetBytes(PersonelSifre);
            dizi = md5.ComputeHash(dizi);
            StringBuilder stringBuilder = new StringBuilder();
            foreach (var item in dizi)
            {
                stringBuilder.Append(item.ToString("x2").ToLower());
            }
            string sifrelenmis = stringBuilder.ToString();
            return sifrelenmis;
        }
       
        private void btnSil_Click(object sender, EventArgs e)
        {
            DialogResult dialog = new DialogResult();
            dialog = MessageBox.Show("Silmek istediğinize emin misiniz?", "SİL", MessageBoxButtons.YesNo);
            if (dialog == DialogResult.Yes)
            {

                if (listBox1.SelectedItems.Count > 0) 
                {
                    
                    db.Personel.Remove((Personel)listBox1.SelectedItem);
                    db.SaveChanges();
                    GuncelTablo();
                }
                
                Temizle();
             
            }
        }

        private void btnIzinler_Click(object sender, EventArgs e)
        {
            /*if (listBox1.SelectedItems.Count > 0)
            {
                //string id = db.Izinler.ToString();
                //PersonelIzinler pers = db.Izinler.Where(x=>x.IzinID==id);
                //yeniPersonel.PersonelID = db.Personel.OrderBy(x => x.PersonelID).ToList().Last().PersonelID + 1;
               
                //persizin.Show();
                //persizin.aktifPersonelID = id;



            }*/

            Personel personel = secilenPersonel;
            persizin.gelenID = personel.PersonelID;
            persizin.Show();
        }
    }
}
