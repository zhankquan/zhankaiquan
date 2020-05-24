/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.yourcompany.struts.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import po.Customer;

import com.yourcompany.struts.form.AlterForm;

import dao.ICustomerDao;
import dao.IManagerDao;


public class AlterAction extends Action {
private ICustomerDao cdao;
private IManagerDao mdao;	
	public ICustomerDao getCdao() {
		return cdao;
	}

	public void setCdao(ICustomerDao cdao) {
		this.cdao = cdao;
	}

	
	public IManagerDao getMdao() {
		return mdao;
	}

	public void setMdao(IManagerDao mdao) {
		this.mdao = mdao;
	}
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		AlterForm alterForm = (AlterForm) form;
		String account=alterForm.getAccount();
		String password=alterForm.getPassword();
		String cname=alterForm.getCname();
		String email=alterForm.getEmail();
		double cbalance=alterForm.getCbalance();
		
		Customer customer=new Customer();
		
		customer.setAccount(account);
		customer.setPassword(password);
		customer.setCname(cname);
		customer.setEmail(email);
		customer.setCbalance(cbalance);
		
		cdao.updateCustomer(customer);
		ArrayList customerlist=(ArrayList)mdao.getCustomerlist();
		request.getSession().setAttribute("customerlist",customerlist);
		return new ActionForward("/searchmenu.jsp");
	}
}