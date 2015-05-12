import java.awt.*;

import javax.swing.*;
public class LoginPanel2 extends JPanel{
	JLabel zhanghao = new JLabel("账号： ");
	JLabel mima = new JLabel("密码： ") ;
	
	static JTextField t1 = new JTextField();
	JPasswordField t2 = new JPasswordField();
	static String a=t1.getText();
	String b=new String(t2.getPassword());
	
	public LoginPanel2(){
		this.setPreferredSize(new Dimension(200,200));
		this.setLocation(200,350);
		add(zhanghao);
		this.setOpaque(true);
	}
}
