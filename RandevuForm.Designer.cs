
namespace PROJE_Deneme_1
{
    partial class RandevuForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.lblPoliklinik = new System.Windows.Forms.Label();
            this.lblDoktor = new System.Windows.Forms.Label();
            this.cmbPoliklinik = new System.Windows.Forms.ComboBox();
            this.cmbDoktor = new System.Windows.Forms.ComboBox();
            this.lblHastaAdi = new System.Windows.Forms.Label();
            this.lblHastaSoyadi = new System.Windows.Forms.Label();
            this.txtHastaAdi = new System.Windows.Forms.TextBox();
            this.txtHastaSoyadi = new System.Windows.Forms.TextBox();
            this.lblSikayet = new System.Windows.Forms.Label();
            this.lblTeshis = new System.Windows.Forms.Label();
            this.lblTedavi = new System.Windows.Forms.Label();
            this.btnTaniKaydet = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.button2 = new System.Windows.Forms.Button();
            this.txtSikayet = new System.Windows.Forms.TextBox();
            this.txtTeshis = new System.Windows.Forms.TextBox();
            this.txtTedavi = new System.Windows.Forms.TextBox();
            this.dateTimePicker1 = new System.Windows.Forms.DateTimePicker();
            this.dateTimePicker2 = new System.Windows.Forms.DateTimePicker();
            this.dateTimePicker3 = new System.Windows.Forms.DateTimePicker();
            this.dataGridView2 = new System.Windows.Forms.DataGridView();
            this.button1 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).BeginInit();
            this.SuspendLayout();
            // 
            // textBox1
            // 
            this.textBox1.Font = new System.Drawing.Font("Calibri", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.textBox1.Location = new System.Drawing.Point(191, 30);
            this.textBox1.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(188, 28);
            this.textBox1.TabIndex = 0;
            this.textBox1.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Calibri", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label1.Location = new System.Drawing.Point(53, 30);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(65, 21);
            this.label1.TabIndex = 1;
            this.label1.Text = "TCK No:";
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(449, 30);
            this.dataGridView1.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.Size = new System.Drawing.Size(872, 188);
            this.dataGridView1.TabIndex = 2;
            this.dataGridView1.DoubleClick += new System.EventHandler(this.dataGridView1_DoubleClick);
            // 
            // lblPoliklinik
            // 
            this.lblPoliklinik.AutoSize = true;
            this.lblPoliklinik.Font = new System.Drawing.Font("Calibri", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.lblPoliklinik.Location = new System.Drawing.Point(53, 162);
            this.lblPoliklinik.Name = "lblPoliklinik";
            this.lblPoliklinik.Size = new System.Drawing.Size(109, 21);
            this.lblPoliklinik.TabIndex = 3;
            this.lblPoliklinik.Text = "Poliklinik Adı :";
            // 
            // lblDoktor
            // 
            this.lblDoktor.AutoSize = true;
            this.lblDoktor.Font = new System.Drawing.Font("Calibri", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.lblDoktor.Location = new System.Drawing.Point(53, 207);
            this.lblDoktor.Name = "lblDoktor";
            this.lblDoktor.Size = new System.Drawing.Size(95, 21);
            this.lblDoktor.TabIndex = 4;
            this.lblDoktor.Text = "Doktor Adı :";
            // 
            // cmbPoliklinik
            // 
            this.cmbPoliklinik.Font = new System.Drawing.Font("Calibri", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.cmbPoliklinik.FormattingEnabled = true;
            this.cmbPoliklinik.Location = new System.Drawing.Point(191, 162);
            this.cmbPoliklinik.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.cmbPoliklinik.Name = "cmbPoliklinik";
            this.cmbPoliklinik.Size = new System.Drawing.Size(188, 29);
            this.cmbPoliklinik.TabIndex = 5;
            this.cmbPoliklinik.SelectionChangeCommitted += new System.EventHandler(this.cmbPoliklinik_SelectionChangeCommitted);
            // 
            // cmbDoktor
            // 
            this.cmbDoktor.Font = new System.Drawing.Font("Calibri", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.cmbDoktor.FormattingEnabled = true;
            this.cmbDoktor.Location = new System.Drawing.Point(191, 207);
            this.cmbDoktor.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.cmbDoktor.Name = "cmbDoktor";
            this.cmbDoktor.Size = new System.Drawing.Size(188, 29);
            this.cmbDoktor.TabIndex = 6;
            // 
            // lblHastaAdi
            // 
            this.lblHastaAdi.AutoSize = true;
            this.lblHastaAdi.Font = new System.Drawing.Font("Calibri", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.lblHastaAdi.Location = new System.Drawing.Point(53, 71);
            this.lblHastaAdi.Name = "lblHastaAdi";
            this.lblHastaAdi.Size = new System.Drawing.Size(86, 21);
            this.lblHastaAdi.TabIndex = 23;
            this.lblHastaAdi.Text = "Hasta Adı :";
            // 
            // lblHastaSoyadi
            // 
            this.lblHastaSoyadi.AutoSize = true;
            this.lblHastaSoyadi.Font = new System.Drawing.Font("Calibri", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.lblHastaSoyadi.Location = new System.Drawing.Point(53, 118);
            this.lblHastaSoyadi.Name = "lblHastaSoyadi";
            this.lblHastaSoyadi.Size = new System.Drawing.Size(109, 21);
            this.lblHastaSoyadi.TabIndex = 24;
            this.lblHastaSoyadi.Text = "Hasta Soyadı :";
            // 
            // txtHastaAdi
            // 
            this.txtHastaAdi.Font = new System.Drawing.Font("Calibri", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.txtHastaAdi.Location = new System.Drawing.Point(191, 71);
            this.txtHastaAdi.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.txtHastaAdi.Name = "txtHastaAdi";
            this.txtHastaAdi.Size = new System.Drawing.Size(188, 28);
            this.txtHastaAdi.TabIndex = 27;
            // 
            // txtHastaSoyadi
            // 
            this.txtHastaSoyadi.Font = new System.Drawing.Font("Calibri", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.txtHastaSoyadi.Location = new System.Drawing.Point(191, 111);
            this.txtHastaSoyadi.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.txtHastaSoyadi.Name = "txtHastaSoyadi";
            this.txtHastaSoyadi.Size = new System.Drawing.Size(188, 28);
            this.txtHastaSoyadi.TabIndex = 28;
            // 
            // lblSikayet
            // 
            this.lblSikayet.AutoSize = true;
            this.lblSikayet.Location = new System.Drawing.Point(19, 38);
            this.lblSikayet.Name = "lblSikayet";
            this.lblSikayet.Size = new System.Drawing.Size(74, 21);
            this.lblSikayet.TabIndex = 29;
            this.lblSikayet.Text = "Şikayeti :";
            // 
            // lblTeshis
            // 
            this.lblTeshis.AutoSize = true;
            this.lblTeshis.Location = new System.Drawing.Point(19, 101);
            this.lblTeshis.Name = "lblTeshis";
            this.lblTeshis.Size = new System.Drawing.Size(62, 21);
            this.lblTeshis.TabIndex = 30;
            this.lblTeshis.Text = "Teşhis :";
            // 
            // lblTedavi
            // 
            this.lblTedavi.AutoSize = true;
            this.lblTedavi.Location = new System.Drawing.Point(19, 167);
            this.lblTedavi.Name = "lblTedavi";
            this.lblTedavi.Size = new System.Drawing.Size(64, 21);
            this.lblTedavi.TabIndex = 31;
            this.lblTedavi.Text = "Tedavi :";
            // 
            // btnTaniKaydet
            // 
            this.btnTaniKaydet.Image = global::PROJE_Deneme_1.Properties.Resources.icons8_save_30;
            this.btnTaniKaydet.Location = new System.Drawing.Point(288, 251);
            this.btnTaniKaydet.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.btnTaniKaydet.Name = "btnTaniKaydet";
            this.btnTaniKaydet.Size = new System.Drawing.Size(60, 62);
            this.btnTaniKaydet.TabIndex = 32;
            this.btnTaniKaydet.UseVisualStyleBackColor = true;
            this.btnTaniKaydet.Click += new System.EventHandler(this.btnTaniKaydet_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.txtTedavi);
            this.groupBox1.Controls.Add(this.txtTeshis);
            this.groupBox1.Controls.Add(this.txtSikayet);
            this.groupBox1.Controls.Add(this.lblSikayet);
            this.groupBox1.Controls.Add(this.lblTeshis);
            this.groupBox1.Controls.Add(this.lblTedavi);
            this.groupBox1.Font = new System.Drawing.Font("Calibri", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.groupBox1.Location = new System.Drawing.Point(12, 294);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.groupBox1.Size = new System.Drawing.Size(398, 360);
            this.groupBox1.TabIndex = 37;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Tanı ";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.button1);
            this.groupBox2.Controls.Add(this.dateTimePicker3);
            this.groupBox2.Controls.Add(this.dateTimePicker2);
            this.groupBox2.Controls.Add(this.dateTimePicker1);
            this.groupBox2.Controls.Add(this.label5);
            this.groupBox2.Controls.Add(this.label6);
            this.groupBox2.Controls.Add(this.label7);
            this.groupBox2.Controls.Add(this.btnTaniKaydet);
            this.groupBox2.Font = new System.Drawing.Font("Calibri", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.groupBox2.Location = new System.Drawing.Point(467, 294);
            this.groupBox2.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Padding = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.groupBox2.Size = new System.Drawing.Size(444, 360);
            this.groupBox2.TabIndex = 38;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Tarih Bilgileri";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(19, 34);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(123, 21);
            this.label5.TabIndex = 29;
            this.label5.Text = "Randevu Tarihi :";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(19, 96);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(119, 21);
            this.label6.TabIndex = 30;
            this.label6.Text = "Randevu Saati :";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(19, 167);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(157, 21);
            this.label7.TabIndex = 31;
            this.label7.Text = "Yeni Randevu Tarihi :";
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(723, 226);
            this.button2.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(218, 37);
            this.button2.TabIndex = 32;
            this.button2.Text = "Randevları Getir";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // txtSikayet
            // 
            this.txtSikayet.Location = new System.Drawing.Point(150, 34);
            this.txtSikayet.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.txtSikayet.Name = "txtSikayet";
            this.txtSikayet.Size = new System.Drawing.Size(223, 28);
            this.txtSikayet.TabIndex = 33;
            // 
            // txtTeshis
            // 
            this.txtTeshis.Location = new System.Drawing.Point(150, 97);
            this.txtTeshis.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.txtTeshis.Name = "txtTeshis";
            this.txtTeshis.Size = new System.Drawing.Size(223, 28);
            this.txtTeshis.TabIndex = 34;
            // 
            // txtTedavi
            // 
            this.txtTedavi.Location = new System.Drawing.Point(150, 163);
            this.txtTedavi.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.txtTedavi.Name = "txtTedavi";
            this.txtTedavi.Size = new System.Drawing.Size(223, 28);
            this.txtTedavi.TabIndex = 35;
            // 
            // dateTimePicker1
            // 
            this.dateTimePicker1.Location = new System.Drawing.Point(199, 29);
            this.dateTimePicker1.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.dateTimePicker1.Name = "dateTimePicker1";
            this.dateTimePicker1.Size = new System.Drawing.Size(224, 28);
            this.dateTimePicker1.TabIndex = 33;
            // 
            // dateTimePicker2
            // 
            this.dateTimePicker2.Location = new System.Drawing.Point(199, 160);
            this.dateTimePicker2.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.dateTimePicker2.Name = "dateTimePicker2";
            this.dateTimePicker2.Size = new System.Drawing.Size(224, 28);
            this.dateTimePicker2.TabIndex = 34;
            // 
            // dateTimePicker3
            // 
            this.dateTimePicker3.CustomFormat = "hh:mm:ss";
            this.dateTimePicker3.Format = System.Windows.Forms.DateTimePickerFormat.Time;
            this.dateTimePicker3.Location = new System.Drawing.Point(199, 88);
            this.dateTimePicker3.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.dateTimePicker3.Name = "dateTimePicker3";
            this.dateTimePicker3.Size = new System.Drawing.Size(118, 28);
            this.dateTimePicker3.TabIndex = 35;
            // 
            // dataGridView2
            // 
            this.dataGridView2.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView2.Location = new System.Drawing.Point(947, 226);
            this.dataGridView2.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.dataGridView2.Name = "dataGridView2";
            this.dataGridView2.RowHeadersWidth = 51;
            this.dataGridView2.RowTemplate.Height = 24;
            this.dataGridView2.Size = new System.Drawing.Size(364, 428);
            this.dataGridView2.TabIndex = 39;
            // 
            // button1
            // 
            this.button1.Image = global::PROJE_Deneme_1.Properties.Resources.icons8_remove_32;
            this.button1.Location = new System.Drawing.Point(363, 251);
            this.button1.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(60, 62);
            this.button1.TabIndex = 36;
            this.button1.UseVisualStyleBackColor = true;
            // 
            // RandevuForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 21F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1360, 672);
            this.Controls.Add(this.dataGridView2);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.txtHastaSoyadi);
            this.Controls.Add(this.txtHastaAdi);
            this.Controls.Add(this.lblHastaAdi);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.lblHastaSoyadi);
            this.Controls.Add(this.cmbDoktor);
            this.Controls.Add(this.cmbPoliklinik);
            this.Controls.Add(this.lblDoktor);
            this.Controls.Add(this.lblPoliklinik);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.textBox1);
            this.Font = new System.Drawing.Font("Calibri", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.Name = "RandevuForm";
            this.Text = "RandevuForm";
            this.Load += new System.EventHandler(this.RandevuForm_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label lblPoliklinik;
        private System.Windows.Forms.Label lblDoktor;
        private System.Windows.Forms.ComboBox cmbPoliklinik;
        private System.Windows.Forms.ComboBox cmbDoktor;
        private System.Windows.Forms.Label lblHastaAdi;
        private System.Windows.Forms.Label lblHastaSoyadi;
        private System.Windows.Forms.TextBox txtHastaAdi;
        private System.Windows.Forms.TextBox txtHastaSoyadi;
        private System.Windows.Forms.Label lblSikayet;
        private System.Windows.Forms.Label lblTeshis;
        private System.Windows.Forms.Label lblTedavi;
        private System.Windows.Forms.Button btnTaniKaydet;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox txtTedavi;
        private System.Windows.Forms.TextBox txtTeshis;
        private System.Windows.Forms.TextBox txtSikayet;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.DateTimePicker dateTimePicker3;
        private System.Windows.Forms.DateTimePicker dateTimePicker2;
        private System.Windows.Forms.DateTimePicker dateTimePicker1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.DataGridView dataGridView2;
    }
}