package isc.jasper;

import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRTableModelDataSource;
import net.sf.jasperreports.engine.design.*;
import net.sf.jasperreports.view.JRViewer;
import net.sf.jasperreports.engine.JRDefaultStyleProvider;
import net.sf.jasperreports.engine.design.JRDesignEllipse;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import java.util.HashMap;
import java.util.Map;

public class TestViewer
{
public static int DEFAULT_X_MARGIN = 30;
public static int DEFAULT_Y_MARGIN = 40;
private static int DEFAULT_PAGE_WIDTH = 600;
private static int DEFAULT_PAGE_HEIGHT = 810;

private static JRBand getTitleBand(String title)
{
JRDesignBand band = new JRDesignBand();
band.setHeight(50);
JRDesignLine line = new JRDesignLine();
line.setX(0);
line.setY(0);
line.setWidth(515);
line.setHeight(0);
band.addElement(line);
JRDesignStaticText textField = new JRDesignStaticText();
textField.setX(0);
textField.setY(10);
textField.setWidth(515);
textField.setHeight(30);
JRDesignReportFont bigFont = new JRDesignReportFont();
bigFont.setName("Arial_Normal");
bigFont.setDefault(true);
bigFont.setFontName("Arial");
bigFont.setSize(22);
bigFont.setPdfFontName("Helvetica");
bigFont.setPdfEncoding("Cp1252");
bigFont.setPdfEmbedded(false);
textField.setFont(bigFont);
textField.setText(title);
band.addElement(textField);

return band;
}

private static JRDesignBand getDetailBand()
{
//Detail
JRDesignBand band = new JRDesignBand();
band.setHeight(20);
JRDesignTextField textField = new JRDesignTextField();
textField.setX(0);
textField.setY(4);
textField.setWidth(50);
textField.setHeight(15);
JRDesignExpression expression = new JRDesignExpression();
expression.setValueClass(java.lang.String.class);
expression.setText("$F{one}");
textField.setExpression(expression);
band.addElement(textField);
textField = new JRDesignTextField();
textField.setStretchWithOverflow(true);
textField.setX(55);
textField.setY(4);
textField.setWidth(200);
textField.setHeight(15);
textField.setPositionType(JRElement.POSITION_TYPE_FLOAT);
expression = new JRDesignExpression();
expression.setValueClass(java.lang.String.class);
expression.setText("$F{two}");
textField.setExpression(expression);
band.addElement(textField);

return band;
}

private static JRDesignBand getEllipseBand()
{
JRDesignBand band = new JRDesignBand();
band.setHeight(200);

//JRDesignEllipse ellipse = new JRDesignEllipse();
//ellipse.setWidth(200);
//ellipse.setHeight(200);

//band.addElement(ellipse);

JRDesignExpression exp = new JRDesignExpression();
exp.setValueClass(java.lang.Boolean.class);
exp.setText("new Boolean(true)");
band.setPrintWhenExpression(exp);

return band;
}

private static JRDesignBand getSubReport()
{
JRDesignBand band = new JRDesignBand();

JRDesignStyle normalStyle = new JRDesignStyle();
normalStyle.setName("Arial_Normal");
normalStyle.setDefault(true);
normalStyle.setFontName("Arial");
normalStyle.setFontSize(12);
normalStyle.setPdfFontName("Helvetica");
normalStyle.setPdfEncoding("Cp1252");
normalStyle.setPdfEmbedded(false);

band.setHeight(400);
//JRDesignSubreport subReport = new JRDesignSubreport();
JRDesignSubreport subReport = new JRDesignSubreport(normalStyle.getDefaultStyleProvider());
subReport.setUsingCache(false);

JRDesignExpression exp = new JRDesignExpression();
exp.setText("$P{sub1_jr}");
exp.setValueClass(net.sf.jasperreports.engine.JasperReport.class);
subReport.setExpression(exp);

exp = new JRDesignExpression();
exp.setText("$P{sub1_ds}");
exp.setValueClass(net.sf.jasperreports.engine.JRDataSource.class);
subReport.setDataSourceExpression(exp);

band.addElement(subReport);

return band;
}

private static JasperDesign getSubReportDesign(String name) throws JRException
{
JasperDesign design = new JasperDesign();
design.setName(name);
design.setTitle(getTitleBand(name));
design.setPageWidth(DEFAULT_PAGE_WIDTH);
design.setPageHeight(DEFAULT_PAGE_HEIGHT);

JRDesignField field = new JRDesignField();
field.setName("one");
field.setValueClass(java.lang.String.class);
design.addField(field);

field = new JRDesignField();
field.setName("two");
field.setValueClass(java.lang.String.class);
design.addField(field);

field = new JRDesignField();
field.setName("three");
field.setValueClass(java.lang.String.class);
design.addField(field);

design.setSummary(getEllipseBand());
design.setDetail(getDetailBand());

return design;
}

private static JasperDesign getDesign() throws JRException {
JasperDesign design = new JasperDesign();

design.setName("TestReport");
design.setColumnCount(1);
design.setPageWidth(DEFAULT_PAGE_WIDTH);
design.setPageHeight(DEFAULT_PAGE_HEIGHT);
design.setTopMargin(DEFAULT_Y_MARGIN);
design.setBottomMargin(DEFAULT_Y_MARGIN);

design.setTitle(getTitleBand("Master Report"));

JRDesignParameter paramSub = new JRDesignParameter();
paramSub.setName("sub1_ds");
paramSub.setValueClass(net.sf.jasperreports.engine.JRDataSource.class);
design.addParameter(paramSub);

JRDesignParameter paramDB = new JRDesignParameter();
paramDB.setName("sub1_jr");
paramDB.setValueClass(net.sf.jasperreports.engine.JasperReport.class);
design.addParameter(paramDB);

design.setDetail(getSubReport());

return design;
}

static String[] columns = {"one","two","three"};
static String[][] values = {{"1","2","3"},{"4","5","6"},{"7","8","9"}};

public static void main(String[] args)
{
try
{
JasperDesign design = getDesign();
JasperReport jr = JasperCompileManager.compileReport(design);
JasperCompileManager.compileReportToFile(design,"c:\\temp\\mainreportExample.jasper");

TableModel tm = new DefaultTableModel(values,columns);
JRDataSource ds = new JRTableModelDataSource(tm);
JasperDesign subDesign = getSubReportDesign("subreport");
JasperReport sub = JasperCompileManager.compileReport(subDesign);
JasperCompileManager.compileReportToFile(subDesign,"c:\\temp\\subreportExample.jasper");

Map params = new HashMap();
params.put("sub1_ds",ds);
params.put("sub1_jr",sub);

// THIS WORKS! The subreport design works
// JasperPrint jp = JasperFillManager.fillReport(sub,null,ds);
// JRViewer viewer = new JRViewer(jp);

// THIS DOES NOT! The problem must be in passing the datasource down to the subreport
JasperPrint jp = JasperFillManager.fillReport(jr,params,new JREmptyDataSource(1));
JRViewer viewer = new JRViewer(jp);


JFrame frame = new JFrame();
frame.setSize(800,600);
frame.setContentPane(viewer);
frame.setVisible(true);
}
catch(Exception e)
{
e.printStackTrace();
}
}
} 
