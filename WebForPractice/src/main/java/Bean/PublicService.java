package Bean;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Builder;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PublicService {
    private Integer serviceId;
    private String name;
    private String description;
    private String link;
}

