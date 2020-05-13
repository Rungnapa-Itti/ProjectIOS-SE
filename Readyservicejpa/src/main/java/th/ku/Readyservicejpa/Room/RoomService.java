package th.ku.Readyservicejpa.Room;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;



import java.util.List;

@RestController
@RequestMapping({"/room"})
public class RoomService {

    @Autowired
    private RoomRepository repositoryRoom;

    @GetMapping
    public List<Room> findAll(){
        return repositoryRoom.findAll();
    }

    @GetMapping("/{room_id}")
    public Room findById(@PathVariable String room_id) {
        return repositoryRoom.findById(room_id).get();
    }

    @PostMapping
    public Room create(@RequestBody Room room) {
        System.out.println(room);
        repositoryRoom.save(room);
        System.out.println(repositoryRoom.findById(room.getRoomID()).get());
        return repositoryRoom.findById(room.getRoomID()).get();
    }

    @PutMapping("/{room_id}")
    public Room update(@PathVariable String room_id,
                          @RequestBody Room room) {
        Room record =repositoryRoom.findById(room_id).get();
        record.setRoomID(room.getRoomID());
        record.setStatus(room.getStatus());
        record.setWin1(room.getWin1());
        record.setWin2(room.getWin2());
        record.setWin3(room.getWin3());

        return record;
    }

    @DeleteMapping("/{room_id}")
    public Room delete(@PathVariable String room_id) {
        Room room = repositoryRoom.findById(room_id).get();
        repositoryRoom.deleteById(room_id);

        return room;
    }


}
