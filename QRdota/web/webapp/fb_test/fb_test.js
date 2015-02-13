var jsInvite = function(friend) {
  console.log('invite token=' + friend.token);
  FB.ui({
      method: 'apprequests',
      message: '陪我玩QRDOTA拜託',
      to: friend.token
    }, 
    function(response){
        console.log('invite done,' + response);
        for (var property in response) {
          if (response.hasOwnProperty(property)) {
             console.log(property + response[property])
          }
        }
    }
  );
}


function jsInviteSelect() {
  FB.ui({
      method: 'apprequests',
      message: '陪我玩QRDOTA拜託',
    }, 
    function(response){
        console.log('invite done,' + response);
        for (var property in response) {
          if (response.hasOwnProperty(property)) {
             console.log(property + response[property])
          }
        }
    }
  );

}
