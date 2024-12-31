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
public class AdmissionsEmployment {
    private Integer ae_id;
    private String type;
    private String title;
    private String content;
    private Timestamp publish_date;
}