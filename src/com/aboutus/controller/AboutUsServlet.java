package com.aboutus.controller;

import java.io.*;

import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.aboutus.model.*;
import com.mem.model.MailService;
import com.mem.model.MemberService;
import com.mem.model.MemberVO;



public class AboutUsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");
		String action = req.getParameter("action");
			
        if ("insert".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String about_des = req.getParameter("about_des").trim();
				if (about_des == null || about_des.trim().length() == 0) {
					errorMsgs.add("������走");
				}
				
				String about_time = req.getParameter("about_time").trim();
				if (about_time == null || about_time.trim().length() == 0) {
					errorMsgs.add("������走");
				}
				
				String about_phone = req.getParameter("about_phone").trim();
				if (about_phone == null || about_phone.trim().length() == 0) {
					errorMsgs.add("������走");
				}
				
				String about_add = req.getParameter("about_add").trim();
				if (about_add == null || about_add.trim().length() == 0) {
					errorMsgs.add("������走");
				}
				AboutUsVO aboutUsVO = new AboutUsVO();
				aboutUsVO.setAbout_des(about_des);
				aboutUsVO.setAbout_time(about_time);
				aboutUsVO.setAbout_phone(about_phone);
				aboutUsVO.setAbout_add(about_add);
			if (!errorMsgs.isEmpty()) {
					req.setAttribute("aboutUsVO", aboutUsVO); 
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/aboutus/aboutUsAdd.jsp");
					failureView.forward(req, res);
					return;
				}
				AboutUsService aboutUsSvc = new AboutUsService();
				aboutUsVO = aboutUsSvc.addAboutUs(about_des, about_time, about_phone, about_add);
				String url = "/back-end/aboutus/aboutUsList.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);				
			
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/aboutus/aboutUsAdd.jsp");
				failureView.forward(req, res);
			}
		}
		if ("getOne_For_Update".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
		try {
				String about_id = req.getParameter("about_id");
				AboutUsService aboutUsSvc = new AboutUsService();
				AboutUsVO aboutUsVO = aboutUsSvc.getOneAboutUs(about_id);
				req.setAttribute("aboutUsVO", aboutUsVO); 

				RequestDispatcher successView = req.getRequestDispatcher("/back-end/aboutus/update_aboutUs_input.jsp");
			    successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("��甇方���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/aboutus/aboutUsList.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { 
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String about_id = new String(req.getParameter("about_id").trim());
				String about_des = req.getParameter("about_des").trim();
				if (about_des == null || about_des.trim().length() == 0) {
					errorMsgs.add("��膩隢蝛箇");
				}
				
				String about_time = req.getParameter("about_time").trim();
				if (about_time == null || about_time.trim().length() == 0) {
					errorMsgs.add("��平����蝛箇");
				}
				
				String about_phone = req.getParameter("about_phone").trim();
				if (about_phone == null || about_phone.trim().length() == 0) {
					errorMsgs.add("�閰梯�蝛箇");
				}
				
				String about_add = req.getParameter("about_add").trim();
				if (about_add == null || about_add.trim().length() == 0) {
					errorMsgs.add("���隢蝛箇");
				}
				
				AboutUsVO aboutUsVO = new AboutUsVO();
				aboutUsVO.setAbout_id(about_id);
				aboutUsVO.setAbout_des(about_des);
				aboutUsVO.setAbout_time(about_time);
				aboutUsVO.setAbout_phone(about_phone);
				aboutUsVO.setAbout_add(about_add);
			
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("aboutUsVO", aboutUsVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/aboutus/update_aboutUs_input.jsp");
					failureView.forward(req, res);
					return; 
				}

				AboutUsService aboutUsSvc = new AboutUsService();
				aboutUsVO = aboutUsSvc.updateAboutUs(about_id, about_des, about_time, about_phone, about_add);
				req.setAttribute("aboutUsVO", aboutUsVO);
				String url = "/back-end/aboutus/aboutUsList.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/aboutus/update_aboutUs_input.jsp");
				failureView.forward(req, res);
			}
		}
        
        
        
        if ("delete".equals(action)) { 
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				String about_id = new String(req.getParameter("about_id").trim());
				AboutUsService aboutUsSvc = new AboutUsService();
				aboutUsSvc.deleteAboutUs(about_id);
				String url = "/back-end/aboutus/aboutUsList.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);								
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/aboutus/aboutUsList.jsp");
				failureView.forward(req, res);
			}
		}
        
        /*************************** 接收問題 *****************************************/
		if ("question".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				System.out.println(1);
				String about_vistor_email = req.getParameter("email");
				if (about_vistor_email == null || (about_vistor_email.trim()).length() == 0) {
					errorMsgs.add("請輸入您的Email");
				}
				String[] about_vistor_phone = req.getParameterValues("phone");
//				if (about_vistor_phone == null || (about_vistor_phone.trim()).length() == 0) {
//					errorMsgs.add("請輸入您的手機號碼");
//				}
				String about_question = req.getParameter("question");
				if (about_question == null || (about_question.trim()).length() == 0) {
					errorMsgs.add("請輸入您的問題");
				} 
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/aboutus/aboutUs.jsp");
					failureView.forward(req, res);
					return;
				}
				
				String to = about_vistor_email;
				String subject = "通知";
				String messageText = "已收到您的提問，請等待回覆。"  ;
				MailService mailService = new MailService();
				mailService.sendMail(to, subject, messageText);
				
//				Send se = new Send();
//				String[] tel = about_vistor_phone;
//			 	String message = "已收到您的提問，請等待回覆。";
//			 	se.sendMessage(tel , message);
				
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/aboutus/aboutUs.jsp");
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("發生不明錯誤,請重新常識或聯絡客服");
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/aboutus/aboutUs.jsp");
				failureView.forward(req, res);
			}
		}
	}

}
