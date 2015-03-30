package ua.com.wordscount;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Dmitry on 30.03.2015.
 */
@Controller
@RequestMapping(value = "/")
public class wordsCount {
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String getIndex() {
        return "index";
    }
    @RequestMapping(value = "/getWordsCount", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public Map<String, Integer> getWordsCount(@RequestParam String text) {
        Map<String, Integer> map = new HashMap<>();
        map.put(text, 1);
        return map;
    }
}
