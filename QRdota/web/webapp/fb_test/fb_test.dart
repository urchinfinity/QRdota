import "dart:html";
import "dart:js";
import "dart:convert";

String accessToken;
String userId;
var graphApi = 'https://graph.facebook.com';

class InvitableFriend {
  String token;
  String name;
  String picUrl;
  
  InvitableFriend.fromJSON(Map invitableFriend): 
    token = invitableFriend['id'],
    name = invitableFriend['name'],
    picUrl = invitableFriend['picture']['data']['url'] {
    this.token = token;
    this.name = name;
    this.picUrl = picUrl;
  }
  
  JsObject toJsObject() {
    var jsObj = new JsObject.jsify({
      'token':token,
      'name':name,
      'picUrl':picUrl
    });
    return jsObj;
  }
}


void main() {
  print('dddddddd');
  querySelector('#text').text = 'tetetete';

  // callback for javascript function testJsFunc()
  context['testJsFunc'] = (JsObject authResponse) {
    print('testJsFunc callback');
    
    accessToken = authResponse['accessToken'];
    userId = authResponse['userID'];
    print('abc'  '${authResponse.hasProperty('accessToken').toString()}');
    HttpRequest.getString('$graphApi/me?access_token=$accessToken').then((String responseStr) {
      print(responseStr);
      Map response = JSON.decode(responseStr);
      querySelector('#text').text = response['name'];
    });
    querySelector('#btn').onClick.listen((event) => window.alert('Confirmed!'));
    querySelector('#btn_invite').onClick.listen(inviteSelect);
    print(accessToken);
    //print(authResponse['userID']);
    
    updateFriendList();
  };
}


void updateFriendList() {
    UListElement invitableList = querySelector('#friend_list');
    
    HttpRequest.getString('$graphApi/me/invitable_friends?access_token=$accessToken').then((String responseStr) {
          print('friendResponse: $responseStr');
          Map response = JSON.decode(responseStr);
          List friends =  response['data'];
          for (var f in friends) {
            var friend = new InvitableFriend.fromJSON(f);
            var picElem = new ImageElement();
            var friendElem = new LIElement();
            var btn = new ButtonElement();
            picElem..src = friend.picUrl
                ..width = 20
                ..height = 20;
            
            btn.text = 'Invite';
            btn.onClick.listen((event) => invite(friend));
            
            friendElem.text = friend.name;
            friendElem.append(picElem);
            friendElem.append(btn);
            invitableList.children.add(friendElem);
          }
        });
}


void invite(InvitableFriend friend) {
  print('inviting ${friend.name}');
  /*HttpRequest.getString(
      '$graphApi/me/apprequests?access_token=$accessToken&message=一起來玩QRDOTA啦缺人&to=${friend.token}')
      .then((String respStr) {
    print('已邀請${friend.name}->$respStr');
  });*/
  
 
  context.callMethod('jsInvite',[friend.toJsObject()]);
}


void inviteSelect(var event) {
  context.callMethod('jsInviteSelect');
}

