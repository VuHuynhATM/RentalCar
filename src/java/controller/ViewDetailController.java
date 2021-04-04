/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.OrderDTO;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tuanv
 */
public class ViewDetailController extends HttpServlet {

    private static final String SUCCESS = "detail.jsp";
    private static final String ERROR = "history.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String orderID = request.getParameter("txtorderID");
            SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
            Date curentDate = new Date();
            if (orderID != null) {
                if (!orderID.trim().isEmpty()) {
                    HttpSession session = request.getSession();
                    ArrayList<OrderDTO> list = (ArrayList<OrderDTO>) session.getAttribute("HISTORY");
                    for (OrderDTO orderDTO : list) {
                        if (orderDTO.getOrderID().equals(orderID)) {
                            boolean check = true;
                            request.setAttribute("ORDERVIEW", orderDTO);
                            if (orderDTO.isStatus()) {
                                Set<String> key = orderDTO.getHash().keySet();
                                for (String detailID : key) {
                                    Date renDate = date.parse(orderDTO.getHash().get(detailID).getRentalDate());
                                    if (curentDate.after(renDate)) {
                                        check = false;
                                    }
                                }
                                if (check) {
                                    request.setAttribute("ALLOWREMOVE", "True");
                                }
                            }
                            url = SUCCESS;
                        }
                    }
                }
            }
        } catch (Exception e) {
            log(e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
