package proCollab.projectManagement.capstoneProject.controller;

import java.security.Principal;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import proCollab.projectManagement.capstoneProject.model.Task;
import proCollab.projectManagement.capstoneProject.model.TaskDto;
import proCollab.projectManagement.capstoneProject.model.User;
import proCollab.projectManagement.capstoneProject.service.TaskService;
import proCollab.projectManagement.capstoneProject.service.UserService;

@Controller
public class CalendarController {
    private UserService userService;
    private TaskService taskService;

    @Autowired
    public CalendarController(UserService userService, TaskService taskService) {
        this.userService = userService;
        this.taskService = taskService;
    }

    @GetMapping("/calendar")
    public String calendarView() {
        return "views/calendar";
    }

    @GetMapping("/calendartasks")
    @ResponseBody
    public ResponseEntity<List<TaskDto>> userTasks(Model model, Principal principal) {
        String email = principal.getName();
        User user = userService.getUserByEmail(email);
        List<Task> allTasks = taskService.findByOwnerOrderByDateDesc(user);
        List<TaskDto> myTasks = allTasks.stream()
                .map(task -> new TaskDto(
                        task.getId(),
                        task.getName(),
                        task.getDescription(),
                        task.getDate().toString(),
                        task.isCompleted(),
                        task.getCreatorName()))
                .collect(Collectors.toList());
        return ResponseEntity.ok(myTasks);
    }
}
