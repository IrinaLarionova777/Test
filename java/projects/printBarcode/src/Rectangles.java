// =========================================================
// ��������� ��������������� � ��������� ������
//
// (C) ������ �.�, 1997, 1998
//
// E-mail: frolov@glas.apc.org
// WWW:    http://www.glasnet.ru/~frolov
//            ���
//         http://www.dials.ccas.ru/frolov
// =========================================================
import java.applet.*;
import java.awt.*;
import java.util.*;

public class Rectangles extends Applet implements Runnable
{
  // ������ �� ������ ��������� ���������������
  Thread m_Rectangles = null;

  // -------------------------------------------------------
  // getAppletInfo
  // �����, ������������ ������ ���������� �� ������
  // -------------------------------------------------------
  public String getAppletInfo()
  {
    return "Name: Rectangles\r\n" +
      "Author: Alexandr Frolov\r\n" +
      "E-mail: frolov@glas.apc.org" +
      "WWW:    http://www.glasnet.ru/~frolov" +
      "Created with Microsoft Visual J++ Version 1.0";
  }

  // -------------------------------------------------------
  // paint
  // ����� paint, ����������� ��������� � ���� ������
  // -------------------------------------------------------
  public void paint(Graphics g)
  {
    // ���������� ������� ������� ���� ������
    Dimension dimAppWndDimension = size();
    
    // �������� � �������� ����������� ������ ����
    g.setColor(Color.yellow);
    
    // ����������� ���������� ������� ���� ������
    g.fillRect(0, 0, 
      dimAppWndDimension.width  - 1, 
      dimAppWndDimension.height - 1);

    // �������� � �������� ����������� ������ ����
    g.setColor(Color.black);

    // ������ ����� ������ ���� ������
    g.drawRect(0, 0, 
      dimAppWndDimension.width  - 1, 
      dimAppWndDimension.height - 1);
  }

  // -------------------------------------------------------
  // start
  // ����� ���������� ��� ������ ����������� ���� ������
  // -------------------------------------------------------
  public void start()
  {
    if (m_Rectangles == null)
    {
      m_Rectangles = new Thread(this);
      m_Rectangles.start();
    }
  }
  
  // -------------------------------------------------------
  // stop
  // ����� ����������, ����� ���� ������ �������� � ������
  // -------------------------------------------------------
  public void stop()
  {
    if (m_Rectangles != null)
    {
      m_Rectangles.stop();
      m_Rectangles = null;
    }
  }

  // -------------------------------------------------------
  // run
  // �����, ������� �������� � ������ ��������� ������
  // �� ������ � ���� ������ �������������� ����������
  // �����, ������� � ������������
  // -------------------------------------------------------
  public void run()
  {
    // �������� �������� ����������� ��� ���� ������
    Graphics g = getGraphics();

    // ���������� ������� ������� ���� ������
    Dimension dimAppWndDimension = size();

    while (true)
    {
      int x, y, width, height;
      int rColor, gColor, bColor;
      
      // �������� ��������� ������� �������
      // � ������������ ��������� ��������������
      x = (int)(dimAppWndDimension.width * Math.random());
      y = (int)(dimAppWndDimension.height * Math.random());
      width = (int)(dimAppWndDimension.width * 
              Math.random()) / 2;
      height = (int)(dimAppWndDimension.height * 
              Math.random()) / 2;
      
      // �������� ��������� ���� ��� ��������� 
      // ��������������
      rColor = (int)(255 * Math.random());
      gColor = (int)(255 * Math.random());
      bColor = (int)(255 * Math.random());

      // ������������� ��������� ���� � ��������� 
      // �����������
      g.setColor(new Color(rColor, gColor, bColor));

      // ������ �������������
      g.fillRect(x, y, width, height);

      // ��������� �������� �� 50 �����������
      try
      {
        Thread.sleep(50);
      }
      catch (InterruptedException e)
      {
        stop();
      }
    }
  }

  // -------------------------------------------------------
  // mouseEnter
  // ����� ����������, ����� ������ ���� ����������� ���
  // ����� ������
  // -------------------------------------------------------
  public boolean mouseEnter(Event evt, int x, int y)
  {
    if (m_Rectangles != null)
    {
      // ����� ������ ���� ����������� ��� ������������
      // ���� ������, �������� ����������������
      // ������ ��������� ���������������
      m_Rectangles.suspend();
    }
    return true;
  }

  // -------------------------------------------------------
  // mouseExit
  // ����� ����������, ����� ������ ���� ��������
  // ���� ������
  // -------------------------------------------------------
  public boolean mouseExit(Event evt, int x, int y)
  {
    if (m_Rectangles != null)
    {
      // ����� ������ ���� �������� ���� ������,
      // ������������ ������ ������ ��������� 
      // ���������������
      m_Rectangles.resume();
    }
    return true;
  }
}
