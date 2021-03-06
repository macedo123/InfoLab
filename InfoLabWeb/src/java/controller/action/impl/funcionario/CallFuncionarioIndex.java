/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.action.impl.funcionario;

import controller.action.ICommand;
import controller.action.impl.CallHomePage;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Usuario;
import model.dao.UsuarioDAO;

/**
 *
 * @author Anderson2
 */
public class CallFuncionarioIndex implements ICommand{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        if(request.getSession().getAttribute("user") == null){
            new CallHomePage().execute(request, response);
        }else if(((Usuario)request.getSession().getAttribute("user")).isCliente()){
            request.setAttribute("erro", "Sem acesso");
            new CallHomePage().execute(request, response);
        }else{
            RequestDispatcher rd = request.getRequestDispatcher("template.jsp?page=funcionarioIndex");            
            List<Usuario> lstFuncionario = new UsuarioDAO().findAllFuncionarios();
            request.setAttribute("lstFuncionario", lstFuncionario);
            rd.forward(request, response);
        }
    }
    
}
