package Bean;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Builder;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class News {
    private Integer news_id;
    private String title;
    private String content;
    private String author;
    private Timestamp publish_date;
    private String category;
}
