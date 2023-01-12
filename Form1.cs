using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity.SqlServer;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PROJE_Deneme_1
{
    public partial class Form1 : Form
    {
        //public olarak hastageçmişini hasta geçmişi formundan almak için string bir değer olarak verdim
        public int hastaGecmisiId;
        public Form1()
        {
            InitializeComponent();
        }
        HastaneOtomasyonEntities db = new HastaneOtomasyonEntities();
        private void Form1_Load(object sender, EventArgs e)
        {
            GuncelTablo();
        }

        private void GuncelTablo()
        {
            var kanGruplari = db.KanGrubu.ToList();
            var hastalar = db.Hasta.Where(x => x.HastaDurum == true).Select(
                h=> new {
                    Sira = h.HastaID,
                    HastaAdi = h.HastaAdi,
                    HastaSoyadi = h.HastaSoyadi,
                    TcNo = h.TCKN,
                    DogumTarihi = h.DogumTarihi,
                    Kilo = h.Kilo,
                    Cinsiyet = h.Cinsiyet,
                    TelefonNo = h.HastaTelefonNo,
                    Email = h.HastaMail,
                    KanGrubu = h.KanGrubu.KanGrubuID,
                    Adres = h.HastaAdres
                }).ToList();

            dataGridView1.DataSource = hastalar;
            this.dataGridView1.Columns[0].Visible = false; //id kolonunun görünmemesi için //bunu tekrar farklı şekilde yaz
            comboBox1.DataSource = kanGruplari;
            comboBox1.DisplayMember = "KanGrubuID";
            

            
        }
        string cinsiyet; bool yasamDurumu;
        private void button1_Click(object sender, EventArgs e)
        {
            if (txtHastaAdi.Text != "" )
            {
                
                if (radioButtonErkek.Checked)
                    cinsiyet = radioButtonErkek.Text;
                else
                    cinsiyet = radioButtonKadin.Text;
                if (radioButtonStabil.Checked)
                    yasamDurumu = true;
                else
                    yasamDurumu = false;

                Hasta hasta = new Hasta();
                hasta.HastaAdi = txtHastaAdi.Text;
                hasta.HastaSoyadi = txtHastaSoyadi.Text;
                hasta.HastaTelefonNo = txtTelefonNo.Text;
                hasta.TCKN = txtTCno.Text;
                hasta.DogumTarihi = dtpDogumTarihi.Value;
                hasta.Kilo = nudKilo.Value;
                hasta.Cinsiyet = cinsiyet;
                hasta.HastaMail = txtEmail.Text;
                hasta.KanGrubu = (KanGrubu)comboBox1.SelectedItem;
                hasta.HastaAdres = txtAdres.Text;
                hasta.HastaDurum = yasamDurumu;
                hasta.HastaGecmisiID = hastaGecmisiId;
                //1 Silindi
                //0 Silindi

                #region EskiEkleme
                /*db.Hasta.Add(new Hasta
                {
                    HastaAdi = txtHastaAdi.Text,
                    HastaSoyadi = txtHastaSoyadi.Text,
                    TCKN = txtTCno.Text,
                    DogumTarihi = dtpDogumTarihi.Value,
                    Kilo = nudKilo.Value,
                    //Cinsiyet = radioButtonKadin.Text && radioButtonErkek.Text
                    HastaTelefonNo = txtTelefonNo.Text,
                    HastaMail = txtEmail.Text,
                    //KanGrubu = comboBox1.SelectedValue.ToString(),
                    HastaAdres = txtAdres.Text

                });*/
                #endregion
                db.Hasta.Add(hasta);

                try
                {
                    db.SaveChanges();
                    MessageBox.Show("Kayıt başarıyla gerçekleştirilmiştir.");

                }
                catch (Exception err)
                {
                    Console.WriteLine(err);
                    throw;
                }

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
                else if (item is NumericUpDown)
                {
                    NumericUpDown nud = (NumericUpDown)item;
                    nud.Value = 0;
                }
                else if (item is DateTimePicker)
                {
                    DateTimePicker dtp = (DateTimePicker)item;
                    dtp.Value = DateTime.Now;
                }
            }
        }

        Hasta secilenVeri;
        private void dataGridView1_DoubleClick(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count < 0)
            {
                return;
            }
            secilenVeri = db.Hasta.Find(dataGridView1.Rows[dataGridView1.CurrentRow.Index].Cells[0].Value);
            txtHastaAdi.Text = secilenVeri.HastaAdi;
            txtHastaSoyadi.Text = secilenVeri.HastaSoyadi;
            txtTCno.Text = secilenVeri.TCKN;
            dtpDogumTarihi.Value = secilenVeri.DogumTarihi;
            nudKilo.Value = (decimal)secilenVeri.Kilo;
            txtTelefonNo.Text = secilenVeri.HastaTelefonNo;
            txtEmail.Text = secilenVeri.HastaMail;
            comboBox1.SelectedItem = secilenVeri.KanGrubuID;
            txtAdres.Text = secilenVeri.HastaAdres;
            cinsiyet = secilenVeri.Cinsiyet;
            yasamDurumu = (bool)secilenVeri.HastaDurum;


        }
        private void button2_Click(object sender, EventArgs e)
        {
            var refference = (KanGrubu)comboBox1.SelectedItem;
            if (txtHastaAdi.Text != "")
            {
                secilenVeri.HastaAdi = txtHastaAdi.Text;
                secilenVeri.HastaSoyadi = txtHastaSoyadi.Text;
                secilenVeri.TCKN = txtTCno.Text;
                secilenVeri.DogumTarihi = dtpDogumTarihi.Value;
                secilenVeri.Kilo = nudKilo.Value;
                secilenVeri.HastaTelefonNo = txtTelefonNo.Text;
                secilenVeri.HastaMail = txtEmail.Text;
                secilenVeri.KanGrubuID = refference.KanGrubuID;
                secilenVeri.HastaAdres = txtAdres.Text;
                secilenVeri.Cinsiyet = cinsiyet;
                secilenVeri.HastaDurum = yasamDurumu;

                db.SaveChanges();
                GuncelTablo();
                
            }
            Temizle();

        }

        private void button3_Click(object sender, EventArgs e)
        {
            DialogResult dialog = new DialogResult();
            dialog = MessageBox.Show("Silmek istediğinize emin misiniz?", "SİL", MessageBoxButtons.YesNo);
            if (dialog == DialogResult.Yes)
            {
                db.Hasta.Remove(db.Hasta.Find(dataGridView1.Rows[dataGridView1.CurrentRow.Index].Cells[0].Value));
                db.SaveChanges();
                GuncelTablo();
            }
        }

    }
}
