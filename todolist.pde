import http.requests.*;
import controlP5.*;

ControlP5 cp5;

String TODOIST_BASE_URL = "https://todoist.com/API/v7/";
String TOKEN = "da0587a59a8462a5abc640b2d2f0d271a6a00888";

Todoist todoist;


void setup() {
  size(680, 680);
  background(200);
  cp5 = new ControlP5(this);
  cp5.addTextfield("textInput_1").setPosition(20, 100).setSize(200, 40).setAutoClear(false);

  todoist = new Todoist(height, width);
}

void draw() {
}

void keyPressed() {
  if (key == ENTER || key == RETURN) {
    todoist.addItem(cp5.get(Textfield.class, "textInput_1").getText());
  }
}

class Todoist {
  float x, y;
  Todoist (float _x, float _y) {
    x = _x;
    y = _y;
  }
  void addItem(String content) {
    // content = java.net.URLEncoder.encode(content);

    String request_url = TODOIST_BASE_URL + "add_item";
    PostRequest post = new PostRequest(request_url);
    post.addData("token", TOKEN);
    post.addData("content", content);
    post.send();
    println("response: " + post.getContent());
    // {"assigned_by_uid":7526949,"due_date_utc":null,"is_archived":0,"labels":[],"sync_id":null,"all_day":false,"in_history":0,"date_added":"Wed 29 Jun 2016 05:47:07 +0000","checked":0,"date_lang":"en","id":63847304,"content":"asdf asdfads asdf","indent":1,"user_id":7526949,"is_deleted":0,"priority":1,"item_order":3,"responsible_uid":null,"project_id":168052938,"collapsed":0,"date_string":null}
  }
}
