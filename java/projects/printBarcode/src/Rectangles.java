// =========================================================
// Рисование прямоугольников в отдельной задаче
//
// (C) Фролов А.В, 1997, 1998
//
// E-mail: frolov@glas.apc.org
// WWW:    http://www.glasnet.ru/~frolov
//            или
//         http://www.dials.ccas.ru/frolov
// =========================================================
import java.applet.*;
import java.awt.*;
import java.util.*;

public class Rectangles extends Applet implements Runnable
{
  // Ссылка на задачу рисования прямоугольников
  Thread m_Rectangles = null;

  // -------------------------------------------------------
  // getAppletInfo
  // Метод, возвращающей строку информации об аплете
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
  // Метод paint, выполняющий рисование в окне аплета
  // -------------------------------------------------------
  public void paint(Graphics g)
  {
    // Определяем текущие размеры окна аплета
    Dimension dimAppWndDimension = size();
    
    // Выбираем в контекст отображения желтый цвет
    g.setColor(Color.yellow);
    
    // Закрашиваем внутреннюю область окна аплета
    g.fillRect(0, 0, 
      dimAppWndDimension.width  - 1, 
      dimAppWndDimension.height - 1);

    // Выбираем в контекст отображения черный цвет
    g.setColor(Color.black);

    // Рисуем рамку вокруг окна аплета
    g.drawRect(0, 0, 
      dimAppWndDimension.width  - 1, 
      dimAppWndDimension.height - 1);
  }

  // -------------------------------------------------------
  // start
  // Метод вызывается при первом отображении окна аплета
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
  // Метод вызывается, когда окно аплета исчезает с экрана
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
  // Метод, который работает в рамках отдельной задачи
  // Он рисует в окне аплета прямоугольники случайного
  // цвета, размера и расположения
  // -------------------------------------------------------
  public void run()
  {
    // Получаем контекст отображения для окна аплета
    Graphics g = getGraphics();

    // Определяем текущие размеры окна аплета
    Dimension dimAppWndDimension = size();

    while (true)
    {
      int x, y, width, height;
      int rColor, gColor, bColor;
      
      // Выбираем случайным образом размеры
      // и расположение рисуемого прямоугольника
      x = (int)(dimAppWndDimension.width * Math.random());
      y = (int)(dimAppWndDimension.height * Math.random());
      width = (int)(dimAppWndDimension.width * 
              Math.random()) / 2;
      height = (int)(dimAppWndDimension.height * 
              Math.random()) / 2;
      
      // Выбираем случайный цвет для рисования 
      // прямоугольника
      rColor = (int)(255 * Math.random());
      gColor = (int)(255 * Math.random());
      bColor = (int)(255 * Math.random());

      // Устанавливаем выбранный цвет в контексте 
      // отображения
      g.setColor(new Color(rColor, gColor, bColor));

      // Рисуем прямоугольник
      g.fillRect(x, y, width, height);

      // Выполняем задержку на 50 миллисекунд
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
  // Метод вызывается, когда курсор мыши оказывается над
  // окном аплета
  // -------------------------------------------------------
  public boolean mouseEnter(Event evt, int x, int y)
  {
    if (m_Rectangles != null)
    {
      // Когда курсор мыши оказывается над поверхностью
      // окна аплета, временно приостанавливаем
      // задачу рисования прямоугольников
      m_Rectangles.suspend();
    }
    return true;
  }

  // -------------------------------------------------------
  // mouseExit
  // Метод вызывается, когда курсор мыши покидает
  // окно аплета
  // -------------------------------------------------------
  public boolean mouseExit(Event evt, int x, int y)
  {
    if (m_Rectangles != null)
    {
      // Когда курсор мыши покидает окно аплета,
      // возобновляем работу задачи рисования 
      // прямоугольников
      m_Rectangles.resume();
    }
    return true;
  }
}
