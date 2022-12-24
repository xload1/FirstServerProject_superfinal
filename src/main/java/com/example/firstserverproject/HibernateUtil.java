package com.example.firstserverproject;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.io.File;


public class HibernateUtil
{
    private static final SessionFactory sessionFactory = buildSessionFactory();

    private static SessionFactory buildSessionFactory()
    {
        try
        {
            return new Configuration().configure(new File("C://Users//marat//IdeaProjects//FirstServerProject//src//main//resources//hibernate.cfg.xml")).buildSessionFactory();
        } catch (Throwable throwable)
        {
            System.out.println("Session factory not created");
            throw new ExceptionInInitializerError(throwable);
        }
    }

    public static SessionFactory getSessionFactory()
    {
        if(sessionFactory==null) buildSessionFactory();
        return sessionFactory;
    }
    public static void close(){
        getSessionFactory().close();
    }
}