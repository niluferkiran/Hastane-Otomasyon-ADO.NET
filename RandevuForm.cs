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
    public partial class RandevuForm : Form
    {
        HastaneOtomasyonEntities db = new HastaneOtomasyonEntities();
        public RandevuForm()
        {
            InitializeComponent();
        }
        private void RandevuForm_Load(object sender, EventArgs e)
        {
            var Poliklinik = db.Poliklinik.ToList();
            cmbPoliklinik.DataSource = Poliklinik;
            cmbPoliklinik.DisplayMember = "PoliklinkAdi";
            cmbPoliklinik.ValueMember = "PoliklinikID";

            
        }
        int secilenID;
        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            string aranan = textBox1.Text.ToString();
            List<Hasta> hastalar = db.Hasta.Where(x => x.TCKN.StartsWith(aranan)).ToList();
            dataGridView1.DataSource = hastalar;
            if (aranan.Length >= 11)
            {
                Hasta hasta = hastalar.First();
                //List<Randevu> randevus = hasta.Randevu.ToList();
            }
        }

        private void cmbPoliklinik_SelectionChangeCommitted(object sender, EventArgs e)
        {
            var poliklinikler = db.Poliklinik.ToList(); //Poliklinikleri çektirdik "Genel Cerrahi", "Göğüs Hastalıkları", "Göz"
            int selectedIndex = cmbPoliklinik.SelectedIndex; //Seçili itemin ID'sini aldık
            Poliklinik pol = poliklinikler[selectedIndex]; //Seçili itemin id'si ile bağlı olan polikliniği poliklinikler listesinden aldık
            var seciliPolDoktorlari = db.Doktorlar.Where(x => x.PoliklinikID == pol.PoliklinikID); //Doktorlar tablosunda o poliklinik ile ilişkili doktorları aldık
            List<int> doktorPersonelIdleri = new List<int>(); //doktor id'lerini tutacak liste
            foreach (var id in seciliPolDoktorlari) //id'leri listeye aktardık
            {
                doktorPersonelIdleri.Add(id.PersonelID);
            }
            var doktorlar = db.Personel.Where(x=> doktorPersonelIdleri.Contains(x.PersonelID)).ToList(); //Personeller tablosundan doktorIds listesine gelen personelleri aldırdık
            foreach (var item in doktorlar) //Combobox içinde isim soyisim şeklinde gelsin diye elimizdeki datanın isim ve soyismini birleştirdik
            {
                item.PersonelAdi = item.PersonelAdi + " " + item.PersonelSoyadi;
            }
            cmbDoktor.DataSource = doktorlar;
            cmbDoktor.DisplayMember = "PersonelAdi";
            cmbDoktor.ValueMember = "PersonelID";
        }

        Hasta secilenVeri;
        private void dataGridView1_DoubleClick(object sender, EventArgs e)
        {
            secilenID = Convert.ToInt32(dataGridView1.Rows[dataGridView1.CurrentRow.Index].Cells[0].Value.ToString());

            secilenVeri = db.Hasta.Find(dataGridView1.Rows[dataGridView1.CurrentRow.Index].Cells[0].Value);

            txtHastaAdi.Text = secilenVeri.HastaAdi;
            txtHastaSoyadi.Text = secilenVeri.HastaSoyadi;

        }
       
        private void btnTaniKaydet_Click(object sender, EventArgs e)
        {
            var cmbVal = (Personel)cmbDoktor.SelectedItem;
            var doktorRef = db.Doktorlar.Where(x=>x.PersonelID==cmbVal.PersonelID).FirstOrDefault();
            dateTimePicker1.Format = DateTimePickerFormat.Custom;
            dateTimePicker1.CustomFormat = "dd/MM/yyyy";

            dateTimePicker2.Format = DateTimePickerFormat.Custom;
            dateTimePicker2.CustomFormat = "hh:mm";

            secilenID = Convert.ToInt32(dataGridView1.Rows[dataGridView1.CurrentRow.Index].Cells[0].Value.ToString()); //id yi tutuyor


            Randevu yeniran = new Randevu();
            yeniran.HastaID = secilenID;
            yeniran.DoktorID = doktorRef.DoktorID; //id yi bulamadı
            yeniran.Tedavi = txtTedavi.Text;
            yeniran.Teshis = txtTeshis.Text;
            yeniran.Sikayet = txtSikayet.Text;

            db.Randevu.Add(yeniran);
            try
            {
                db.SaveChanges();
            }
            catch (Exception err)
            {
                throw;
            }
            int eklenenKayitID = yeniran.RandevuID;

            DateTime dt = dateTimePicker2.Value;
            TimeSpan ts = new TimeSpan(dt.Hour, dt.Minute, dt.Second);

            RandevuDetay ranDetay = new RandevuDetay();
            ranDetay.RandevuDetayDurum = true;
            ranDetay.RandevuID = eklenenKayitID;
            ranDetay.RandevuTarihi = dateTimePicker1.Value;
            ranDetay.RandevuSaati = ts;//değer null dönüyor
            ranDetay.YeniRandevuTarihi = dateTimePicker3.Value;
            //ranDetay.YeniRandevuTarihi = DateTime.Parse(dateTimePicker3.Value.ToString("dd/MM/yyyy"));
            ranDetay.HastaGeldimi = "E";




            db.RandevuDetay.Add(ranDetay);
            db.SaveChanges();


        }

        private void button2_Click(object sender, EventArgs e)
        {
            //secilenID = Convert.ToInt32(dataGridView1.Rows[dataGridView1.CurrentRow.Index].Cells[0].Value.ToString());

        }
    }
}
