compiler jspcompiler

" JSP abbreviations
iabbrev taglibc <%@ taglib uri="/tags/jstl-c" prefix="c" %>
iabbrev taglibf <%@ taglib uri="/tags/jstl-fmt" prefix="fmt" %>
iabbrev taglibh <%@ taglib uri="/tags/struts-html" prefix="html" %>
iabbrev taglibb <%@ taglib uri="/tags/struts-bean" prefix="bean" %>
iabbrev taglibt <%@ taglib uri="/tags/struts-tiles" prefix="tiles" %>
iabbrev taglibl <%@ taglib uri="/tags/struts-logic" prefix="logic" %>

" Web service abbreviations
iabbrev msg <message name=""><CR><part name="" element="" /><CR></message><ESC>kk

" Struts actions abbreviations
iabbrev actionskel <action<CR>path="/"<CR>type=""<CR>scope=""<CR>name=""<CR>validate=""<CR>input=""<CR>><CR></action>
iabbrev forwardview <forward name="view" path="" redirect="false" />
iabbrev forwardsuccess <forward name="success" path="" redirect="true" />
iabbrev forwardfail <forward name="failure" path="" redirect="false" />
iabbrev formbeandyn <form-bean name="" dynamic="true" type="org.apache.struts.action.DynaActionForm"><CR></form-bean><ESC>k
iabbrev formprop <form-property name="" type="" /><ESC>?name="<CR>eei

iabbrev aprop <property name="" value="" /><ESC>?name="<CR>eei

map ;c <ESC>^i<!--<ESC>$a--><ESC>
map ;uc <ESC>:s/<!--\\|-->//g<CR>
map ;hc <ESC>^i<%--<ESC>$a--%><ESC>
map ;uhc <ESC>:s/<%--\\|--%>//g<CR>

iabbrev mdepend <dependency><CR><groupId></groupId><CR><artifactId></artifactId><CR><version></version><CR></dependency><ESC>?<groupId><CR>wwa
