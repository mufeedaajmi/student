import java.sql.*;

public class EmployeeAnalysis {

    public static void main(String[] args) {

        String url = "jdbc:mysql://localhost:3306/company";
        String user = "root";
        String password = "root";

        try {

            Connection con = DriverManager.getConnection(url, user, password);

            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery(
                    "SELECT department, AVG(salary) avg_salary FROM employee GROUP BY department");

            while (rs.next()) {

                System.out.println(rs.getString("department") + " "
                        + rs.getDouble("avg_salary"));
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
