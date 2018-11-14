package cn.tekin.web.exception;

/**
 * 用户自定义 exception
 * @author Tekin
 */
public class UserNotFoundException extends RuntimeException {
    public UserNotFoundException() {
        super("User Not Found/ 用户不存在message");
    }
}
