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
    public partial class HastaPaneli : Form
    {
        public HastaPaneli()
        {
            InitializeComponent();
        }
        HastaneOtomasyonEntities db = new HastaneOtomasyonEntities();

        public string aktifHasta;
        public string aktifHastaID;
        private void HastaPaneli_Load(object sender, EventArgs e)
        {
            //Hastayı db den bulduk //id eşitledik
            Hasta hastalar = db.Hasta.Where(x => x.TCKN == aktifHasta).FirstOrDefault();
            label3.Text = hastalar.HastaID.ToString();
            label4.Text = hastalar.TCKN;

        }
    }
}
