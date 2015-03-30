package ua.com.wordscount;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

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
    @ResponseBody
    public Map<String, Integer> getWordsCount(@RequestParam String text) {
        Map<String, Integer> map = new HashMap<>();

        if (text != null || !text.isEmpty()) {
            String[] words = text.replaceAll("\\W+'\\W+|\\+|\\-|\\.|\\,|!|@|#|\\$|%|\\^|\\*|\\(|\\)|;|\\/|<>\"", " ")
                    .replaceFirst("\\s+", "").split("\\s+");
            for (String word : words) {
                if (word.matches("[A-z+\\']{2,}")) {
                    if (map.get(word.toLowerCase()) == null) {
                        map.put(word.toLowerCase(), 1);
                    } else {
                        int count = map.get(word.toLowerCase());
                        map.put(word.toLowerCase(), count + 1);
                    }
                }
            }
            Iterator<Map.Entry<String, Integer>> it = map.entrySet().iterator();
            while (it.hasNext()) {
                if (it.next().getValue().equals(1)) it.remove();
            }
        }

        return map;
    }
}
