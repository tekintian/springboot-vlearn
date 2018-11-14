package cn.tekin.starter;

public class HelloService {

    HelloProperties helloProperties;

    public String sayHelloTekin(String name){
        return helloProperties.getPrefix() + "." + name + helloProperties.getSuffix();
    }

    public HelloProperties getHelloProperties() {
        return helloProperties;
    }

    public void setHelloProperties(HelloProperties helloProperties) {
        this.helloProperties = helloProperties;
    }
}
