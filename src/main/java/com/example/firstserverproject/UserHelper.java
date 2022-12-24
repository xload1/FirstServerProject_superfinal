package com.example.firstserverproject;

import com.example.firstserverproject.entity.UserAcc;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class UserHelper
{
    private final SessionFactory sessionFactory;
    public UserHelper(){sessionFactory=HibernateUtil.getSessionFactory();}
    public boolean checkPresence(String login){
        Session session = sessionFactory.openSession();
        UserAcc checkUser = session.get(UserAcc.class, login);
        boolean isPresent;
        isPresent = checkUser != null;
        session.close();
        return isPresent;
    }
    public boolean checkPassword(UserAcc user){
        Session session = sessionFactory.openSession();
        UserAcc checkUser = session.get(UserAcc.class, user.getLogin());
        boolean isRightPassword = checkUser.getPassword().equals(user.getPassword());
        session.close();
        return isRightPassword;
    }
    public void addUser(String login, String password){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.getTransaction();
        transaction.begin();
        session.persist(new UserAcc(login, password));
        transaction.commit();
        session.close();
    }
}
