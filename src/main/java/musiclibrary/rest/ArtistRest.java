package musiclibrary.rest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import jdk.nashorn.internal.parser.JSONParser;
import musiclibrary.entities.Artist;
import musiclibrary.mvc.controller.ArtistController;
import musiclibrary.mvc.model.modelswithmorphia.ArtistDBModel;
import musiclibrary.mvc.view.uiArtistView;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Request;
import javax.ws.rs.core.Response;
import java.util.List;

@Path("/artists")
public class ArtistRest {
    private uiArtistView view;

    public ArtistRest() {
        view = new uiArtistView(new ArtistController(new ArtistDBModel()));
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getArtists() {
        List<Artist> artists = view.getAll();
        String jsonString = "";
        jsonString = JSONparser.getJSONstring(artists);
        return "{\"" + Artist.class.getSimpleName() + "\":" + jsonString + "}";//"{ \"id\" : 1, \"name\" : \"my_name\" }";
    }

//    @POST
//    @Path("/add")
//    @Consumes(MediaType.APPLICATION_JSON)
//    public Response putArtist(Artist artist) {
//        String output = artist.toString();
//        return Response.status(200).entity(output).build();
//    }

//    @POST
//    @Path("/add")
//    @Consumes(MediaType.APPLICATION_JSON)
//    public Artist putArtist(Response response) {
//        Artist artist = (Artist)response.getEntity();
//        view.add(artist);
//        return artist;
//    }

    @GET
    @Path("/add/{name}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Artist putArtist(@PathParam("name") String name) {
        Artist artist = new Artist(-1, name);
        view.add(artist);
        return artist;
    }

    @GET
    @Path("/del/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    public void delArtist(@PathParam("id") String id) {
        view.remove(Integer.parseInt(id));
    }
}
