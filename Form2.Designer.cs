
namespace PROJE_Deneme_1
{
    partial class Form2
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
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.btnHastaKabul = new System.Windows.Forms.Button();
            this.btnCikis = new System.Windows.Forms.Button();
            this.btnRecete = new System.Windows.Forms.Button();
            this.btnRandevu = new System.Windows.Forms.Button();
            this.btnPersonelEkle = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(0, 17);
            this.label1.TabIndex = 33;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 48);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(0, 17);
            this.label2.TabIndex = 33;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Calibri", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label3.Location = new System.Drawing.Point(337, 60);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(402, 40);
            this.label3.TabIndex = 34;
            this.label3.Text = "Hastane Otomasyon Sistemi";
            // 
            // btnHastaKabul
            // 
            this.btnHastaKabul.Font = new System.Drawing.Font("Calibri", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.btnHastaKabul.Image = global::PROJE_Deneme_1.Properties.Resources.icons8_dropper_patient_64;
            this.btnHastaKabul.Location = new System.Drawing.Point(231, 217);
            this.btnHastaKabul.Name = "btnHastaKabul";
            this.btnHastaKabul.Size = new System.Drawing.Size(202, 105);
            this.btnHastaKabul.TabIndex = 35;
            this.btnHastaKabul.Text = "Hasta Kabul";
            this.btnHastaKabul.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnHastaKabul.UseVisualStyleBackColor = true;
            this.btnHastaKabul.Click += new System.EventHandler(this.btnHastaKabul_Click);
            // 
            // btnCikis
            // 
            this.btnCikis.Font = new System.Drawing.Font("Calibri", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.btnCikis.Image = global::PROJE_Deneme_1.Properties.Resources.icons8_close_window_100;
            this.btnCikis.Location = new System.Drawing.Point(647, 217);
            this.btnCikis.Name = "btnCikis";
            this.btnCikis.Size = new System.Drawing.Size(194, 105);
            this.btnCikis.TabIndex = 32;
            this.btnCikis.Text = "Çıkış";
            this.btnCikis.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnCikis.UseVisualStyleBackColor = true;
            this.btnCikis.Click += new System.EventHandler(this.btnCikis_Click);
            // 
            // btnRecete
            // 
            this.btnRecete.Font = new System.Drawing.Font("Calibri", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.btnRecete.Image = global::PROJE_Deneme_1.Properties.Resources.icons8_prescription_64;
            this.btnRecete.Location = new System.Drawing.Point(231, 328);
            this.btnRecete.Name = "btnRecete";
            this.btnRecete.Size = new System.Drawing.Size(202, 105);
            this.btnRecete.TabIndex = 31;
            this.btnRecete.Text = "Reçete";
            this.btnRecete.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnRecete.UseVisualStyleBackColor = true;
            this.btnRecete.Click += new System.EventHandler(this.btnRecete_Click);
            // 
            // btnRandevu
            // 
            this.btnRandevu.Font = new System.Drawing.Font("Calibri", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.btnRandevu.Image = global::PROJE_Deneme_1.Properties.Resources.icons8_appointments_64__1_;
            this.btnRandevu.Location = new System.Drawing.Point(439, 217);
            this.btnRandevu.Name = "btnRandevu";
            this.btnRandevu.Size = new System.Drawing.Size(202, 105);
            this.btnRandevu.TabIndex = 30;
            this.btnRandevu.Text = "Randevu";
            this.btnRandevu.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnRandevu.UseVisualStyleBackColor = true;
            this.btnRandevu.Click += new System.EventHandler(this.btnRandevu_Click);
            // 
            // btnPersonelEkle
            // 
            this.btnPersonelEkle.Font = new System.Drawing.Font("Calibri", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.btnPersonelEkle.Image = global::PROJE_Deneme_1.Properties.Resources.icons8_employee_64;
            this.btnPersonelEkle.Location = new System.Drawing.Point(439, 328);
            this.btnPersonelEkle.Name = "btnPersonelEkle";
            this.btnPersonelEkle.Size = new System.Drawing.Size(202, 105);
            this.btnPersonelEkle.TabIndex = 27;
            this.btnPersonelEkle.Text = "Personel Ekle";
            this.btnPersonelEkle.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnPersonelEkle.UseVisualStyleBackColor = true;
            this.btnPersonelEkle.Click += new System.EventHandler(this.btnPersonelEkle_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(38, 109);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(0, 17);
            this.label4.TabIndex = 36;
            // 
            // Form2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1123, 576);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.btnHastaKabul);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnCikis);
            this.Controls.Add(this.btnRecete);
            this.Controls.Add(this.btnRandevu);
            this.Controls.Add(this.btnPersonelEkle);
            this.Name = "Form2";
            this.Text = "Anasayfa";
            this.Load += new System.EventHandler(this.Form2_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnCikis;
        private System.Windows.Forms.Button btnRecete;
        private System.Windows.Forms.Button btnRandevu;
        private System.Windows.Forms.Button btnPersonelEkle;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btnHastaKabul;
        private System.Windows.Forms.Label label4;
    }
}