#!/usr/bin/perl

use strict;

my($dir,$class)=@ARGV;

$dir =~ s/((.*?)\/java\/)//;
$dir =~ s/\//./g;
#print "package $dir;\n\n";

if ($dir =~ /\.test/) {
  print <<"End";

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;
import junit.textui.TestRunner;

public class $class extends TestCase {

  protected Log log = LogFactory.getLog($class.class);

  public $class (String testName) {
    super(testName);
  }

  public static Test suite() {
    TestSuite suite = new TestSuite($class.class);
    return suite;
  }

  public static void main(String[] args) {
    try {
      TestRunner.run(suite());
    }
    catch (Throwable e) {
      log.debug(e.getMessage(), e);
    }
  }
}
End
}
elsif ($dir =~ /\.ejb\.service/ && $class =~ /Bean/) {

  my $int      = $dir . "." . $class;
  $int =~ s/Bean$//;

  my $home_int = $int . "Home";

  my $interface = $int;
  $interface =~ s/ejb\.//;

print <<"End";

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.overture.util.ejb.service.AbstractSessionBean;

/**
 *
 * All EJBObject, EJBHome and *.xml are generated using xdoclet.  See:
 * http://xdoclet.sourceforge.net
 *
 * \@ejb:bean
 *   type      = "Stateless"
 *   name      = "$home_int"
 *   jndi-name = "$home_int"
 *   view-type = "remote"
 *
 * \@ejb.home
 *   extends      = "javax.ejb.EJBHome"
 *   remote-class = "$home_int"
 *
 * \@ejb.interface
 *   extends      = "javax.ejb.EJBObject"
 *   remote-class = "$int"
 *
 * \@ejb.transaction
 *   type = "NotSupported"
 *
 * \@weblogic.transaction-descriptor
 *   trans-timeout-seconds = "5"
 *
 * \@author $ENV{'USER'}
 */

public class $class extends AbstractSessionBean {

  protected Log log = LogFactory.getLog($class.class);

  public void ejbCreate() { }

}
End

}
elsif ($dir =~ /\.forms/) {
  print <<"EndOfClass";
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eharmony.singles.admin.struts.forms.BaseActionForm;
import org.apache.struts.action.ActionMapping;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class $class extends BaseActionForm {

  protected Log log = LogFactory.getLog($class.class);

}
EndOfClass
}
elsif ($dir =~ /\.action/) {
  print <<"EndOfClass";
import com.eharmony.singles.admin.struts.actions.BaseAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class $class extends BaseAction {

  protected Log log = LogFactory.getLog($class.class);

  public ActionForward execute(ActionMapping       mapping,
                               ActionForm          form,
                               HttpServletRequest  request,
                               HttpServletResponse response)
    throws Exception {

    }
}
EndOfClass
}
elsif ($dir =~ /\.taglib/) {
  print<<"EndOfClass";
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.JspException;

public class $class extends BodyTagSupport {
  public int doStartTag() throws JspException {
  }
  public int doEndTag() throws JspException {
  }
}
EndOfClass
}
elsif ($dir =~ /\.databean/) {
  print<<"EndOfClass";
import com.go2.util.ObjectUtil;
import java.io.Serializable;

public class $class implements Serializable, Cloneable {

  public String toString() {
    return ObjectUtil.objectToString(this, "\\n");
  }
}
EndOfClass
}
elsif ($dir =~ /\.dao;/) {
  print <<"EndOfClass";
public interface $class {

}
EndOfClass
}
elsif ($dir =~ /\.filter/) {
  print <<"EndOfClass";
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.UnavailableException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class $class extends BaseFilter {

  protected Log log = LogFactory.getLog($class.class);

  public void doFilter(ServletRequest  request,
                       ServletResponse response,
                       FilterChain     chain)
    throws IOException, ServletException {

      if (getEnabled()) {
      }

      chain.doFilter(request, response);
    }
}
EndOfClass
}
else {
  print <<"EndOfClass";
public class $class {

  public void main(String[] args) {
  }
}
EndOfClass
}
0;
