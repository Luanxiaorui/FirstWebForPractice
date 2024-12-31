package Bean;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Builder;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {
    private Integer user_id;
    private String personal_id;
    private String name;
    private String password;
    private String role;
    private String email;
}
