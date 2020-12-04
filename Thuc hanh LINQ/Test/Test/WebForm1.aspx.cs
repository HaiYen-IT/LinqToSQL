using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Test.Models;

namespace Test
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private string strCon = "Data Source=SKY-20200706ULN;Initial Catalog=QuanlyhocDB;Integrated Security=True";
        private QuanLyHocDBDataContext myQLHDBDataContext;
        private static bool isAdd;
        protected void SetControl(bool status)
        {
            txtMaSV.Enabled = status;
            txtHoTen.Enabled = status;
            txtNgaySinh.Enabled = status;
            txtLopBC.Enabled = status;
            txtDiaChi.Enabled = status;
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            myQLHDBDataContext = new QuanLyHocDBDataContext(strCon);
            if (!IsPostBack)
            {
                var myQuery = from i in myQLHDBDataContext.KhoaDaoTaos
                              select i;
                ddlKhoa.DataSource = myQuery;
                ddlKhoa.DataValueField = "MaKhoa";
                ddlKhoa.DataTextField = "TenKhoa";
                ddlKhoa.DataBind();
                ddlKhoa_SelectedIndexChanged(sender, e);
                SetControl(false);
            }
        }

        protected void ddlKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            var myQuery = from i in myQLHDBDataContext.SinhViens
                          where i.MaKhoa == ddlKhoa.SelectedValue.ToString()
                          select i;
            GridView1.DataSource = myQuery;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int row = Convert.ToInt32(e.CommandArgument);
            if(e.CommandName == "btnSua")
            {
                isAdd = false;
                SetControl(false);
                txtMaSV.Text = GridView1.Rows[row].Cells[0].Text;
                txtHoTen.Text = GridView1.Rows[row].Cells[1].Text;
                txtNgaySinh.Text = GridView1.Rows[row].Cells[2].Text;
                txtDiaChi.Text = GridView1.Rows[row].Cells[3].Text;
                txtLopBC.Text = GridView1.Rows[row].Cells[4].Text;
                txtMaSV.Enabled = false;
            }
            else
            {
                string sMaSV = GridView1.Rows[row].Cells[0].Text;
                var myQuery = from i in myQLHDBDataContext.SinhViens
                              where i.MaSV == sMaSV
                              select i;
                myQLHDBDataContext.SinhViens.DeleteAllOnSubmit(myQuery);
                myQLHDBDataContext.SubmitChanges();
                ddlKhoa_SelectedIndexChanged(sender, e);
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            isAdd = true;
            SetControl(true);
            txtMaSV.Text = "";
            txtHoTen.Text = "";
            txtNgaySinh.Text = "";
            txtDiaChi.Text = "";
            txtLopBC.Text = "";

        }

        protected void btnGhi_Click(object sender, EventArgs e)
        {
            if (isAdd)
            {
                SinhVien mySinhViens = new SinhVien();
                mySinhViens.MaKhoa = ddlKhoa.SelectedValue.ToString();
                mySinhViens.MaSV = txtMaSV.Text;
                mySinhViens.HoTen = txtHoTen.Text;
                mySinhViens.NgaySinh = txtNgaySinh.Text;
                mySinhViens.DiaChi = txtDiaChi.Text;
                mySinhViens.LopBC = txtLopBC.Text;
                myQLHDBDataContext.SinhViens.InsertOnSubmit(mySinhViens);
                myQLHDBDataContext.SubmitChanges();
            }
            else
            {
                var myQuery = from i in myQLHDBDataContext.SinhViens
                              where i.MaSV == txtMaSV.Text
                              select i;
                SinhVien mySinhViens = myQuery.First();
                mySinhViens.MaKhoa = ddlKhoa.SelectedValue.ToString();
                mySinhViens.HoTen = txtHoTen.Text;
                mySinhViens.NgaySinh = txtNgaySinh.Text;
                mySinhViens.DiaChi = txtDiaChi.Text;
                mySinhViens.LopBC = txtLopBC.Text;
                myQLHDBDataContext.SubmitChanges();


            }
            ddlKhoa_SelectedIndexChanged(sender, e);
            SetControl(false);
            
        }
    }
}