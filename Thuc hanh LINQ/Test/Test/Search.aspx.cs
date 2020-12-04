using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Test.Models;

namespace Test
{
    public partial class Search : System.Web.UI.Page
    {
        private string strCon = "Data Source=SKY-20200706ULN;Initial Catalog=QuanlyhocDB;Integrated Security=True";
        private QuanLyHocDBDataContext myContext;

        protected void Page_Load(object sender, EventArgs e)
        {
            myContext = new QuanLyHocDBDataContext(strCon);
            if (!IsPostBack)
            {
                var myQuery = from i in myContext.SinhViens
                              select i;
                ddlMaSV.DataSource = myQuery;
                ddlMaSV.DataValueField = "MaSV";
                //ddlMaSV.DataTextField = "HoTen";
                ddlMaSV.DataBind();
                ddlMaSV_SelectedIndexChanged(sender, e);

            }
        }

        protected void btnTim_Click(object sender, EventArgs e)
        {
            myContext = new QuanLyHocDBDataContext(strCon);
            var myDataContext = from i in myContext.SinhViens
                                join j in myContext.KhoaDaoTaos
                                on i.MaKhoa equals j.MaKhoa
                                where i.HoTen.Contains(txtTen.Text)
                                select new
                                {
                                    i.MaSV,
                                    i.HoTen,
                                    j.TenKhoa
                                };
            GrvData.DataSource = myDataContext;
            GrvData.DataBind();
        }

        protected void GridViewData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            myContext = new QuanLyHocDBDataContext(strCon);
            int row = Convert.ToInt32(e.CommandArgument);
            string sMaSV = GrvData.Rows[row].Cells[0].Text;
            if(e.CommandName == "btnChiTiet")
            {
                var myQuery = from i in myContext.MonHocs
                              join j in myContext.DangKyHocs
                              on i.MaMon equals j.MaMon
                              where j.MaSV == sMaSV
                              select new
                              {
                                  i.TenMon,
                                  j.NamHK
                              };
                GridViewDangKy.DataSource = myQuery;
                GridViewDangKy.DataBind();
            }
        }

        protected void ddlMaSV_SelectedIndexChanged(object sender, EventArgs e)
        {
            myContext = new QuanLyHocDBDataContext(strCon);
            var sMyQuery = from i in myContext.SinhViens
                           join j in myContext.KhoaDaoTaos
                           on i.MaKhoa equals j.MaKhoa
                           where i.MaSV == ddlMaSV.SelectedValue.ToString()
                           select new
                           {
                               i.MaSV,
                               i.HoTen,
                               j.TenKhoa

                           };
            GrvData.DataSource = sMyQuery;
            GrvData.DataBind();
        }
    }
}