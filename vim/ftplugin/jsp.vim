source $VIMRUNTIME/ftplugin/jsp.vim
compiler jspcompiler

iabbrev taglibc <%@ taglib uri="/tags/jstl-c" prefix="c" %>
iabbrev taglibf <%@ taglib uri="/tags/jstl-fmt" prefix="fmt" %>
iabbrev taglibh <%@ taglib uri="/tags/struts-html" prefix="html" %>
iabbrev taglibb <%@ taglib uri="/tags/struts-bean" prefix="bean" %>
iabbrev taglibt <%@ taglib uri="/tags/struts-tiles" prefix="tiles" %>
iabbrev taglibl <%@ taglib uri="/tags/struts-logic" prefix="logic" %>

iabbrev bmess <bean:message key="" /><ESC>?"<CR>i

iabbrev hiddenin <input type="hidden"<CR>  name="[<bean:write name="count"/>]."<CR>value="<bean:write name="" property=""/>"<CR>/><ESC>
