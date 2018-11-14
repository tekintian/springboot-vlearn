package cn.tekin.springbootstartdiy.demo;

public class ArrayDemo {
    public static void main(String[] args) {
        System.out.println(new ArrayDemo().countA("AAAA rating stringA"));
    }
    public int countA(String str){
        if (str == null || str.equals("")) {
            return 0;
        }
        int count =0;

        for (int i = 0; i <str.length(); i++) {
            if(str.substring(i,i+1).equals("A")){
                count++;
            }
        }

    return count;
    }
}
