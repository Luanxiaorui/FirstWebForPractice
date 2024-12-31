package dao;

import Bean.Message;
import Bean.Reply;

import java.util.List;

public class MessageDAO extends BaseDAO {

    public boolean addMessage(String userId, String content) {
        String sql = "insert into messages(user_id, content) values(?,?)";
        return baseUpdate(sql, userId, content) > 0;
    }
    public List<Message> getAllMessages() {
        String sql = "select * from messages";
        return baseQuery(Message.class, sql);
    }


    public List<Message> getMessagesByUserId(String userId) {
        String sql = "select * from messages where user_id=?";
        return baseQuery(Message.class, sql, userId);
    }
    public Message getMessagesByMessageId(String messageId) {
        String sql = "select * from messages where message_id=?";
        return baseQuerySingle(Message.class, sql, messageId);
    }
    public Reply getReplyByReplyId(String replyId) {
        String sql = "select * from replies where reply_id=?";
        return baseQuerySingle(Reply.class, sql, replyId);
    }


    public List<Reply> getReplyByUserId(String userId) {
        String sql = "select * from replies where user_id=?";
        return baseQuery(Reply.class, sql, userId);
    }
    public List<Reply> getReplyByMessageId(String messageId) {
        String sql = "select * from replies where message_id=?";
        return baseQuery(Reply.class, sql, messageId);
    }

    public boolean deleteMessage(String messageId) {
        String sql = "delete from messages where message_id=?";
        return baseUpdate(sql, messageId) > 0;
    }
    public boolean deleteReply(String replyId) {
        String sql = "delete from replies where reply_id=?";
        return baseUpdate(sql, replyId) > 0;
    }

    public boolean addReply(String messageId, String userId, String content) {
        String sql = "insert into replies(message_id, user_id, content) values(?,?,?)";
        return baseUpdate(sql, messageId, userId, content) > 0;
    }
}
