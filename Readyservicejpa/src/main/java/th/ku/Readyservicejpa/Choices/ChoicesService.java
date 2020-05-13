package th.ku.Readyservicejpa.Choices;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping({"/choices"})
public class ChoicesService {

    @Autowired
    private ChoicesRepository repository;

    @GetMapping
    public List<Choices> findAll(){
        return repository.findAll();
    }

    @GetMapping("/{id}")
    public Choices findById(@PathVariable String id) {
        return repository.findById(id).get();
    }

    @PostMapping
    public Choices create(@RequestBody Choices choices){
        repository.save(choices);
        return repository.findById(choices.getId()).get();
    }

    @PutMapping("/{id}")
    public Choices update(@PathVariable String id,
                       @RequestBody Choices choices) {
        Choices record = repository.findById(id).get();
        record.setChoices1(choices.getChoices1());
        record.setChoices2(choices.getChoices2());
        record.setChoices3(choices.getChoices3());
        record.setChoices4(choices.getChoices4());
        repository.save(choices);
        return record;
    }

    @DeleteMapping("/{id}")
    public Choices delete(@PathVariable String id) {
        Choices choices= repository.findById(id).get();
        repository.deleteById(id);
        return choices;
    }




}
