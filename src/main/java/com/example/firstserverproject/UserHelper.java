package com.example.firstserverproject;

import com.example.firstserverproject.entity.UserAcc;
import com.example.firstserverproject.entity.UserText;
import jakarta.servlet.http.HttpSession;
import lombok.Getter;
import lombok.Setter;
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
    public boolean checkPassword(String login, String password){
        Session session = sessionFactory.openSession();
        UserAcc checkUser = session.get(UserAcc.class, login);
        boolean isRightPassword = checkUser.getPassword().equals(password);
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
    public void addLoginToUserText(String login){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.getTransaction();
        transaction.begin();
        session.persist(new UserText(login, "Your text!"));
        transaction.commit();
        session.close();
    }
    public void updateText(String text, String login){
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = session.getTransaction();
        transaction.begin();
        UserText currUserText = session.get(UserText.class, login);
        currUserText.setUsertext(text);
        session.merge(currUserText);
        transaction.commit();
        session.close();
    }
    public String getText(String login){
        Session session = sessionFactory.openSession();
        String text = session.get(UserText.class, login).getUsertext();
        session.close();
        return text;
    }
}
