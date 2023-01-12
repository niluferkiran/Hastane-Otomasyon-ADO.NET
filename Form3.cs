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
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }
        HastaneOtomasyonEntities db = new HastaneOtomasyonEntities();
        Form1 frm1 = new Form1();
        private void Form3_Load(object sender, EventArgs e)
        {
            var ilac = db.Ilaclar.ToList();

            comboBox1.DataSource = ilac;
            comboBox1.DisplayMember = "IlacAdi";

            GuncelTablo();




        }

        private void GuncelTablo()
        {
            //kayıt yaptığında durum 1 olanların güncel tablosu görünüyor
            dataGridView1.DataSource = db.HastaGecmisi.Where(x => x.HastaGecmisiDurum == true).ToList();

            this.dataGridView1.Columns[0].Visible = false;
            this.dataGridView1.Columns[5].Visible = false;
        }

        Ilaclar secilen;
        private void button1_Click(object sender, EventArgs e)
        {
            HastaGecmisi yeni = new HastaGecmisi();
            secilen = (Ilaclar)comboBox1.SelectedItem;
            yeni.KullandigiIlac = secilen.IlacAdi;
            yeni.GecirdigiHastalik = textBox1.Text;
            yeni.GecirdigiAmeliyat = textBox2.Text;
            yeni.Alerjiler = textBox3.Text;
            yeni.HastaID = db.Hasta.OrderBy(x => x.HastaID).ToList().Last().HastaID+1;
            db.HastaGecmisi.Add(yeni).HastaGecmisiDurum=true;
            //kayıt yaptığında durum 1 olarak veritabanına geçiyor
            try
            {
                db.SaveChanges();
                frm1.hastaGecmisiId = yeni.HastaGecmisiID;
                frm1.Show();
            }
            catch (Exception err)
            {
                Console.WriteLine(err);
                throw;
            }

            GuncelTablo();
            Temizle();

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
            }
        }


        HastaGecmisi secilenVeri;
        private void dataGridView1_DoubleClick(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count < 0)
            {
                return;
            }

            secilenVeri = db.HastaGecmisi.Find(dataGridView1.Rows[dataGridView1.CurrentRow.Index].Cells[0].Value);
            comboBox1.SelectedItem = secilenVeri.KullandigiIlac;
            textBox1.Text = secilenVeri.GecirdigiHastalik;
            textBox2.Text = secilenVeri.GecirdigiAmeliyat;
            textBox3.Text = secilenVeri.Alerjiler;

        }

        private void button2_Click(object sender, EventArgs e)
        {
            //güncelleme gerçekleşiyor
            HastaGecmisi hastaGecmisi = db.HastaGecmisi.Where(x=>x.HastaGecmisiID == secilenVeri.HastaGecmisiID).FirstOrDefault();
            Ilaclar ilaclar = (Ilaclar)comboBox1.SelectedItem;
            hastaGecmisi.KullandigiIlac = ilaclar.IlacAdi;
            hastaGecmisi.GecirdigiHastalik = textBox1.Text;
            hastaGecmisi.GecirdigiAmeliyat = textBox2.Text;
            hastaGecmisi.Alerjiler = textBox3.Text;
            db.SaveChanges();
            GuncelTablo();
            Temizle();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            HastaGecmisi hastaGecmisi = db.HastaGecmisi.Where(x => x.HastaGecmisiID == secilenVeri.HastaGecmisiID).FirstOrDefault();
            hastaGecmisi.HastaGecmisiDurum = false;
            db.SaveChanges();
            GuncelTablo();
        }

        private void GuncelSilinmisTablo()
        {
            dataGridView1.DataSource = db.HastaGecmisi.Where(x => x.HastaGecmisiDurum == false).ToList();
        }
    }
}
