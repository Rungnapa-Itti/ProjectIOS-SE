package th.ku.Readyservicejpa.Question;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping({"/question"})
public class QuestionService {

    @Autowired
    private QuestionRepository repository;

    @GetMapping
    public List<Question> findAll(){
        return repository.findAll();

    }

    @GetMapping("/{id}")
    public Question findById(@PathVariable String id) {
        return repository.findById(id).get();
    }

    @PostMapping
    public Question create(@RequestBody  Question question) {
        repository.save(question);
        return repository.findById(question.getId()).get();
    }

    @PutMapping("/{id}")
    public Question update(@PathVariable String id,
                       @RequestBody Question question) {
        Question record = repository.findById(id).get();
        record.setName(record.getName());
        record.setAnswer(record.getAnswer());

        repository.save(question);
        return record;
    }

    @DeleteMapping("/{id}")
    public Question delete(@PathVariable String id) {
        Question question = repository.findById(id).get();
        repository.deleteById(id);
        return question;
    }


}
