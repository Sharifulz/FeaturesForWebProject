/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.exam.dao;

import com.exam.Image;
import com.exam.NewHibernateUtil;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author shaarif
 */
public class ImageDao {
    public void doSave(Image im){
        Session ses = NewHibernateUtil.getSessionFactory().openSession();
        ses.getTransaction().begin();
        ses.save(im);
        ses.getTransaction().commit();
        ses.close();
    }
    
       public void doDelete(Image im){
        Session ses = NewHibernateUtil.getSessionFactory().openSession();
        ses.getTransaction().begin();
        ses.delete(im);
        ses.getTransaction().commit();
        ses.close();
    }

    public List<Image> getAllImage() {
         Session ses = NewHibernateUtil.getSessionFactory().openSession();
         List<Image> list = ses.createQuery("from Image").list();
         return list;
    }
}
