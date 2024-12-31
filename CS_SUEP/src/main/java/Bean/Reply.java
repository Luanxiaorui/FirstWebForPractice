package Bean;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Reply {
    private int reply_id;
    private String user_id;
    private String content;
    private Timestamp created_at;
    private int message_id;
}
