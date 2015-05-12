import java.awt.*;


import javax.swing.*;
public class Login {
	public static void main(String args[]){
		JFrame frame = new JFrame("Login");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		frame.setLocation(300,100);
		frame.setSize(800,600);
		frame.getContentPane().add(new LoginPanel());
		frame.pack();
		frame.setVisible(true);
	}
	
	
	
}
