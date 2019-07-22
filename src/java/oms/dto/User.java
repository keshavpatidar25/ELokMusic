package oms.dto;

public class User { //Bean Class
    private String userName, pass, name, role, secretQues, secretAns;

    public User() {
    }

    public User(String userName) {
        this.userName = userName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getSecretQues() {
        return secretQues;
    }

    public void setSecretQues(String secretQues) {
        this.secretQues = secretQues;
    }

    public String getSecretAns() {
        return secretAns;
    }

    public void setSecretAns(String secretAns) {
        this.secretAns = secretAns;
    }

}
