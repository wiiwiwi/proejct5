package member;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JPanel;

//�˻��� ���� �ּ� �Է½� �˸�â
public class DialogBox extends JDialog 
implements ActionListener{

	JButton b1;
	ZipcodeFrame f;
	
	public DialogBox(ZipcodeFrame f, String title, String msg) {
		super(f, true);
		this.f = f;
		setTitle(title);
		add(new JLabel(msg, JLabel.CENTER));
		
		JPanel p = new JPanel();
		p.setLayout(new FlowLayout());
		b1 = new JButton("Ȯ��");
		p.add(b1);
		b1.addActionListener(this);//�̺�Ʈ ����
		
		add(p, BorderLayout.SOUTH);
		
		setSize(250, 150);//�˸�â ũ��
		setLocation(f.getX()+f.getWidth()/2-(this.getWidth()/2),
				f.getY()+f.getHeight()/2-(this.getHeight()/2));//ZipcodeFrame�� �߰��� ��ġ
		//setLocation(f.getX(),f.getY());
		setVisible(true);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		dispose();//â�� �����
	}
}




