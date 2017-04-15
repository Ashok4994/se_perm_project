package com.controller;

import com.admin.Connect_db;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Admin
 */
public class User {

    private String firstname;
    private String lastname;
    private String address;
    private String phone;
    private String emailid;
    private Integer userid;
    private String role;
    private String status;
    private Integer mid;

    public User(Integer userid) {

        try {

            Statement stmt = Connect_db.getConnection().createStatement();
            ResultSet rs = stmt.executeQuery("select * from employee where userid ='" + userid + "'");

            while (rs.next()) {
                //out.println(rs.getInt(1) + "  " + rs.getString("first_name") + "  " + rs.getString("last_name") + "  " + rs.getString("email") + "  " + rs.getString("userid") + "  " + rs.getString("password"));
                this.firstname = rs.getString("firstname");
                this.lastname = rs.getString("lastname");
                this.address=rs.getString("address");  
                this.phone = rs.getString("phone");
                this.emailid = rs.getString("email");
                this.userid = rs.getInt("userid");
                this.role = rs.getString("role");
                this.status=rs.getString("status");
                this.mid=rs.getInt("mid");
            }
            //con.close();

        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public String getfirstName() {
        return firstname;
    }

    public void setfirstName(String firstname) {
        this.firstname = firstname;
    }

    public String getlastName() {
        return lastname;
    }

    public void setlastName(String lastname) {
        this.lastname = lastname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmailid() {
        return emailid;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getRole() {
        return role;
    }
    
    public void setRole(String role) {
        this.role = role;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    public String getStatus() {
        return status;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }
    public Integer getMid() {
        return mid;
    }
    
   
}
