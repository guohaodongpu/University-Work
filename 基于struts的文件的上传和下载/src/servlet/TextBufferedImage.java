
package servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class TextBufferedImage extends HttpServlet
{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request, response);
    }
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException
    {
        //产生随机密码
    	resp.setHeader("Cache-Control","no-cache");
    	HttpSession session = req.getSession();
        String randomPassword = getRandom(4);
        System.out.println("randomPassword="+randomPassword);
    	session.setAttribute("randomCode", randomPassword);
        OutputStream out = resp.getOutputStream();

        try
        {
            JPEGImageEncoder encode = JPEGCodec.createJPEGEncoder(out);
            BufferedImage bi = CreateBufferedImage(randomPassword);
            encode.encode(bi);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    /**
     * 把随机码写到图片上返回
     * 
     * @param randomPassword //随机码
     * @return
     */
    private BufferedImage CreateBufferedImage(String randomPassword)
    {
        int width = 80;
        int height = 20;

        BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        Graphics2D g2d = bufferedImage.createGraphics();
        g2d.clearRect(0, 0, width, height);
        // 设定背景色
        g2d.setColor(getRandColor(200,250));
        g2d.fillRect(0, 0, width, height);
        
        
        // 随机产生155条干扰线，使图象中的认证码不易被其它程序探测到
        Random random = new Random();
        g2d.setColor(getRandColor(160,200));
        g2d.setFont(getFont());
        for (int i=0;i<155;i++)
        {
        	int x = random.nextInt(width);
        	int y = random.nextInt(height);
            int xl = random.nextInt(12);
            int yl = random.nextInt(12);
            g2d.drawLine(x,y,x+xl,y+yl);
        }

        // 取随机产生的认证码(4位数字)
        String sRand="";
        for (int i=0;i<4;i++){
            String rand = randomPassword.substring(i, i+1);
            sRand+=rand;
            // 将认证码显示到图象中
            g2d.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));//调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成
            g2d.drawString(rand,14*i+12,17);
        }
        
        g2d.dispose();
        return bufferedImage;

    }
    private Color getRandColor(int fc, int bc) {// 给定范围获得随机颜色
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}
    
    private Font getFont() {
		Random random = new Random();
		Font font[] = new Font[5];
		font[0] = new Font("Ravie", Font.PLAIN, 20);
		font[1] = new Font("Antique Olive Compact", Font.PLAIN, 20);
		font[2] = new Font("Forte", Font.PLAIN, 20);
		font[3] = new Font("Wide Latin", Font.PLAIN, 20);
		font[4] = new Font("Gill Sans Ultra Bold", Font.PLAIN, 20);
		return font[random.nextInt(5)];
	}
    /**
	 * 产生随机码(字母+数字)
	 * 
	 * @param length
	 *            随机码长度
	 * @return 随机码
	 */
	private  String getRandom(int length) {

		String randomCode = "";
		for (int i = 0; i < length; i++) {
			randomCode += getRandChar();
		}

		return randomCode;
	}
	public  String getRandChar() {
		int rand = (int) Math.round(Math.random() * 2);
		long itmp = 0;
		char ctmp = '\u0000';
		// 根据rand的值来决定来生成一个大写字母、小写字母和数字
		switch (rand) {
		// 生成大写字母
		case 1:
			itmp = Math.round(Math.random() * 25 + 65);
			ctmp = (char) itmp;
			return String.valueOf(ctmp);
			// 生成小写字母
		case 2:
			itmp = Math.round(Math.random() * 25 + 97);
			ctmp = (char) itmp;
			return String.valueOf(ctmp);
			// 生成数字
		default:
			itmp = Math.round(Math.random() * 9);
			return String.valueOf(itmp);
		}
	}
}