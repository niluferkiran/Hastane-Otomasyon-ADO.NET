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
    public partial class LoginForm : Form
    {
        public LoginForm()
        {
            InitializeComponent();
        }
        HastaneOtomasyonEntities db = new HastaneOtomasyonEntities();
        Form2 frm2 = new Form2();
        HastaPaneli hastaPaneli = new HastaPaneli();

        private void LoginForm_Load(object sender, EventArgs e)
        {
            //sifreleriGuncelle();
        }
        public static DialogResult InputBox(string baslik, string bodyText, ref string value)
        {
            Form form = new Form();
            Label label = new Label();
            TextBox textBox = new TextBox();
            Button okButton = new Button();
            Button cancelButton = new Button();
            form.Text = baslik;
            label.Text = bodyText;
            okButton.Text = "Şifre Güncelle";
            cancelButton.Text = "Vazgeç";
            okButton.DialogResult = DialogResult.OK;
            cancelButton.DialogResult = DialogResult.Cancel;
            //(x, y, width, heigh)
            label.SetBounds(36, 36, 372, 13);
            textBox.SetBounds(56, 56, 700, 20);
            okButton.SetBounds(220, 160, 160, 60);
            cancelButton.SetBounds(400, 160, 160, 60);
            label.AutoSize = true;
            form.ClientSize = new Size(790, 305);
            form.FormBorderStyle = FormBorderStyle.FixedDialog;
            form.StartPosition = FormStartPosition.CenterScreen;
            form.MinimizeBox = false;
            form.MaximizeBox = false;
            form.Controls.AddRange(new Control[] { label, textBox, okButton, cancelButton });
            form.AcceptButton = okButton;
            form.CancelButton = cancelButton;
            DialogResult dialogResult = form.ShowDialog();
            value = textBox.Text;
            return dialogResult;
        }
        private void button1_Click(object sender, EventArgs e)
        {
            
            string tckNo = txtKullaniciAdi.Text != null ? txtKullaniciAdi.Text.ToString() : "";
            string sifre = string.IsNullOrEmpty(txtSifre.Text) ? "" : txtSifre.Text.ToString();
            List<Personel> personeller = db.Personel.ToList();
            //12345678911
            if(personeller.Any(x=>x.TCKN==tckNo) && tckNo.Length==11)
            {
                var personel = db.Personel.Where(x => x.TCKN == tckNo).FirstOrDefault();
                //NULL ya da ''
                if(sifre == "" && string.IsNullOrEmpty(personel.Sifre))
                {
                    string yeniSifre = "";
                    if(InputBox("Şifre Belirleme Ekranı", "Yeni Şifrenizi Giriniz", ref yeniSifre) == DialogResult.OK)
                    {
                        personel.Sifre = MD5Sifrele(yeniSifre);
                        SifrelerVeHashler sh = new SifrelerVeHashler();
                        sh.PersonelID = personel.PersonelID;
                        sh.Sifre = yeniSifre;
                        sh.Hash = MD5Sifrele(yeniSifre);
                        db.SifrelerVeHashler.Add(sh);
                        db.SaveChanges();
                    }
                }
                else
                {
                    if (personel != null)
                    {
                        if (personel.Sifre == MD5Sifrele(sifre))
                        {
                            frm2.aktifKullanici = tckNo;
                            frm2.Show();
                            this.Hide();
                        }
                        else
                        {
                            MessageBox.Show("Şifreler Eşleşmiyor");
                        }
                    }
                }
            }



            #region Eski Şifre Kontrolü
            /*Personel personel = new Personel();
                personel = db.Personel.Where(p => p.TCKN == tckNo).FirstOrDefault();
                if(personel != null)
                {
                    if(personel.Sifre==sifre)
                    {
                        frm2.aktifKullanici = tckNo;
                        frm2.Show();
                    }
                    else
                    {
                        MessageBox.Show("Şifreler Eşleşmiyor");
                    }
                }*/
            #endregion
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

        #region Şifre


        //public void sifreleriGuncelle()
        //{
        //    var personeller = db.Personel.ToList();
        //    List<SifrelerVeHashler> sh = new List<SifrelerVeHashler>();
        //    foreach (var personel in personeller)
        //    {
        //        personel.Sifre = MD5Sifrele("12345678");
        //        sh.Add(new SifrelerVeHashler
        //        {
        //            Hash = MD5Sifrele("12345678"),
        //            Sifre = "12345678",
        //            PersonelID = personel.PersonelID
        //        });
        //    }
        //    db.SifrelerVeHashler.AddRange(sh);
        //    db.SaveChanges();
        //}
        #endregion
        private void txtSifre_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyCode==Keys.Enter)
            {
                button1_Click(this, new EventArgs());
            }
        }

        private void btnHastaGiris_Click(object sender, EventArgs e)
        {
            
            string tckNo = txtHastaTCKNO.Text != null ? txtHastaTCKNO.Text.ToString() : "";
            string dogumtarihi = string.IsNullOrEmpty(txtHastaDogumTarihi.Text) ? "" : txtHastaDogumTarihi.Text.ToString();
            List<Hasta> hastalar = db.Hasta.ToList();
            string hastaID = db.Hasta.ToString();
            if (hastalar.Any(x=>x.TCKN==tckNo) && tckNo.Length==11)
            {
                var hasta = db.Hasta.Where(x => x.TCKN == tckNo).FirstOrDefault();
                if (hasta != null)
                {
                    
                    if (hasta.DogumTarihi.Date.Year.ToString() == dogumtarihi)
                    {
                        hastaPaneli.aktifHasta = tckNo;
                        hastaPaneli.Show();
                        hastaPaneli.aktifHastaID = hastaID;

                    }
                    else
                    {
                        MessageBox.Show("Şifreler Eşleşmiyor");
                    }

                }
            }
        }

        
    }
}
