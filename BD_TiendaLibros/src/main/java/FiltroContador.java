import java.io.IOException;
import jakarta.servlet.*;

public class FiltroContador implements Filter {
// Para tener una referencia al contexto de filtro
	FilterConfig config;

	public void init(FilterConfig config) {
		this.config = config;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
// Tomamos el Contexto de sesi´on donde almacenaremos el contador
		ServletContext miContexto = config.getServletContext();
// Vemos si el atributo contador existe dentro del contexto
// En caso contrario lo creamos e inicializamos a cero
		Integer intContador = (Integer) miContexto.getAttribute("contador");
		if (intContador == null) {
			intContador = new Integer(0);
		}
		intContador = new Integer(intContador.intValue() + 1);
		miContexto.setAttribute("contador", intContador);
// Instruimos al contenedor para que invoque al siguiente filtro
		chain.doFilter(request, response);
	}

	public void destroy() {
	}
}
