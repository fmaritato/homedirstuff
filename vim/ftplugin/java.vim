source $VIMRUNTIME/ftplugin/java.vim
"compiler ant
compiler maven

" Handy abbreviations
abbrev psf public static final
abbrev psfs public static final String
abbrev mainmeth public static void main (String[] args) {<CR>}<ESC>O
abbrev sep /******************************************************************/

iabbrev loggerdecl private static Logger logger =<CR>Logger.getLogger(.class.getName());<CR><ESC>?public class<CR>wwye/getLogger(<CR>wlP

iabbrev xdocmeth /**<CR>@ejb:interface-method<CR>  view-type="remote"<CR>/<ESC>

iabbrev commonslogimport import org.apache.commons.logging.Log;<CR>import org.apache.commons.logging.LogFactory;
iabbrev commonslog   private final static Log log =<CR>LogFactory.getLog(.class);<CR><ESC>?\(public class\\|public abstract class\)?e2<CR>ye/getLog(<CR>wlP
