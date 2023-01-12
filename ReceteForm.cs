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
    public partial class ReceteForm : Form
    {
        public ReceteForm()
        {
            InitializeComponent();
        }
        HastaneOtomasyonEntities db = new HastaneOtomasyonEntities();
        private void ReceteForm_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = db.Hasta.ToList();

            comboBox1.DataSource = db.Poliklinik.Select(x=> new { x.PoliklinkAdi}).ToList();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            string aranan = textBox1.Text.ToString();
            List<Hasta> hastalar = db.Hasta.Where(x => x.TCKN.StartsWith(aranan)).ToList();
            dataGridView1.DataSource = hastalar;
            if(aranan.Length>=11)
            {
                Hasta hasta = hastalar.First();
                List<Randevu> randevus = hasta.Randevu.ToList();

            }

        }


        private void dataGridView1_DoubleClick(object sender, EventArgs e)
        {

        }
    }
}
