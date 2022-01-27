package edu.school21.springboot;

public class Tester {
    public static void main(String[] args) {
        String pattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z0-9]{8,}$";
        System.out.println("123123Aa"
        .matches(pattern));
    }

}
