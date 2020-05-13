package th.ku.Readyservicejpa.Gamer;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GamerRepository  extends JpaRepository<Gamer,String> {
}
