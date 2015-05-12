import java.awt.*;
import java.awt.event.*;

import javax.swing.*;
public class LoginPanel extends JPanel{
	
	ImageIcon ii = new ImageIcon("/Users/apple/Downloads/你画我猜图片2.jpg");
	JLabel tu = new JLabel(ii);

	JButton denglu = new JButton("登录～");
	JButton quxiao = new JButton("取消～");
	public LoginPanel(){
		
		tu.setBounds(0, 0, ii.getIconWidth(),ii.getIconHeight());
		denglu.addActionListener(new DengluListener());
		this.setPreferredSize(new Dimension(700,550));
		quxiao.addActionListener(new QuxiaoListener());
		add(tu);
		add(denglu);
		add(quxiao);
		tu.setOpaque(false);
		this.setVisible(true);
		
	}
	
	private class DengluListener implements ActionListener{
		public void actionPerformed(ActionEvent e){
			new PaintClient().launchFrame();
		}
	}
	
	private class QuxiaoListener implements ActionListener{
		public void actionPerformed(ActionEvent e){
			System.exit(0);
		}
	}
}
