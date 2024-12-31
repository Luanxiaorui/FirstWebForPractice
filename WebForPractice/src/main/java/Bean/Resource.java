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
public class Resource {
    private Integer resource_id;
    private String title;
    private String description;
    private String file_path;
    private Timestamp upload_date;
}
