package BelajarCrud;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

public class Kecamatan extends javax.swing.JFrame {

    public Kecamatan() {
        initComponents();
        tampilkan();
    }

    public void tampilkan() {
        try {
            Connection con = Koneksi.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM m_kecamatan");
            DefaultTableModel model = (DefaultTableModel) tb_view.getModel();
            model.setRowCount(0);
            while (rs.next()) {
                model.addRow(new Object[]{
                    rs.getString("id"),
                    rs.getString("kode_wilayah"),
                    rs.getString("kode_kecamatan"),
                    rs.getString("nama_kecamatan")
                });
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void simpan() {
        try {
            Connection con = Koneksi.getConnection();
            Statement st = con.createStatement();
            st.executeUpdate("INSERT INTO m_kecamatan (kode_wilayah, kode_kecamatan, nama_kecamatan) VALUES ('"
                + txtKodeWilayah.getText() + "','"
                + txtKodeKecamatan.getText() + "','"
                + txtNamaKecamatan.getText() + "')");
            JOptionPane.showMessageDialog(null, "Data berhasil disimpan!");
            tampilkan();
            bersihkan();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        }
    }

    public void ubah() {
        try {
            Connection con = Koneksi.getConnection();
            Statement st = con.createStatement();
            st.executeUpdate("UPDATE m_kecamatan SET "
                + "kode_wilayah='" + txtKodeWilayah.getText() + "',"
                + "kode_kecamatan='" + txtKodeKecamatan.getText() + "',"
                + "nama_kecamatan='" + txtNamaKecamatan.getText() + "' "
                + "WHERE id='" + txtId.getText() + "'");
            JOptionPane.showMessageDialog(null, "Data berhasil diubah!");
            tampilkan();
            bersihkan();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        }
    }

    public void hapus() {
        int konfirmasi = JOptionPane.showConfirmDialog(null, "Yakin mau hapus?");
        if (konfirmasi == JOptionPane.YES_OPTION) {
            try {
                Connection con = Koneksi.getConnection();
                Statement st = con.createStatement();
                st.executeUpdate("DELETE FROM m_kecamatan WHERE id='" + txtId.getText() + "'");
                JOptionPane.showMessageDialog(null, "Data berhasil dihapus!");
                tampilkan();
                bersihkan();
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e.getMessage());
            }
        }
    }

    public void bersihkan() {
        txtId.setText("");
        txtKodeWilayah.setText("");
        txtKodeKecamatan.setText("");
        txtNamaKecamatan.setText("");
    }

    // Variables declaration
    private javax.swing.JTable tb_view;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextField txtId;
    private javax.swing.JTextField txtKodeWilayah;
    private javax.swing.JTextField txtKodeKecamatan;
    private javax.swing.JTextField txtNamaKecamatan;
    private javax.swing.JButton btnSimpan;
    private javax.swing.JButton btnUbah;
    private javax.swing.JButton btnHapus;
    private javax.swing.JButton btnBersihkan;
}