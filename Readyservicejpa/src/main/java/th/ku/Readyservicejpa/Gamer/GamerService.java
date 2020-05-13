package th.ku.Readyservicejpa.Gamer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import java.util.List;

@RestController
@RequestMapping({"/gamer"})
public class GamerService {

    @Autowired
    private GamerRepository repositoryGamer;

    @GetMapping
    public List<Gamer> findAll(){
        return repositoryGamer.findAll();
    }


    @GetMapping("/{id}")
    public Gamer findById(@PathVariable String id) {
        return repositoryGamer.findById(id).get();
    }

    @PostMapping
    public Gamer create(@RequestBody Gamer gamer){
        System.out.println(gamer);
        repositoryGamer.save(gamer);

        return repositoryGamer.findById(gamer.getId()).get();
    }

    @PutMapping("/{id}")
    public Gamer update(@PathVariable String id,
                       @RequestBody Gamer gamer) {
        Gamer record = repositoryGamer.findById(id).get();
        record.setName(gamer.getName());
        record.setScore(gamer.getScore());
        record.setHighScore(gamer.getHighScore());
        record.setRoomid(gamer.getRoomid());
        record.setStatus(gamer.getStatus());
        repositoryGamer.save(gamer);
        return record;
    }

    @DeleteMapping("/{id}")
    public Gamer delete(@PathVariable String id) {
        Gamer gamer = repositoryGamer.findById(id).get();
        repositoryGamer.deleteById(id);
        return gamer;
    }


}
