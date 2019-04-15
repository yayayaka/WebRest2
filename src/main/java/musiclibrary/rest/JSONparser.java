package musiclibrary.rest;

import musiclibrary.entities.Entity;

import java.util.List;

public final class JSONparser {
    public static String getJSONstring(List<? extends Entity> entity) {
//        String result = "";
//        for (int pointer = 0; pointer < entity.size(); pointer++) {
//            result += entity.toString();
//            if (pointer + 1 != entity.size()) result += ", ";
//        }
        String entityString = entity.toString();
//                .replaceAll("\\[", "{ ")
//                .replaceAll("\\]", " }")
//                .replaceAll(" ", "");
        return entityString;
    }
}
