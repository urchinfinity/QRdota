library generic.command;

//The server-side commands sent from client to server//

const String SC_CREATE = "crt",
             SC_UPDATE = "upd";

///Commands for application activities.

///Add a torch
const String SC_ADD_TORCH = "torch.add";
///Query spell info
const String SC_SPELL = "spell";
///Query available spells
const String SC_SPELLS = "spell.own";
///Unlock a spell
const String SC_UNLOCK_SPELL = "spell.unlock";
///Use a spell
const String SC_USE_SPELL = "spell.use";
///Query item info
const String SC_ITEM = "item";
///Query items
const String SC_ITEMS = "item.own";
///Add an item
const String SC_ADD_ITEM = "item.add";
///Use an item
const String SC_USE_ITEM = "item.use";
///Query story detail
const String SC_STORY = "story";
///Query stories
const String SC_STORIES = "stories";
///Query lattice info
const String SC_LATTICE = "lattice";
///Query lattices progress
const String SC_LATTICES = "lattices";
///Query notifications (double list)
const String SC_NOTIFICATIONS = "notifs";
///Query user info
const String SC_USER_INFO = "usr";
///Query friend info
const String SC_FRIEND_INFO = "frnd";
///Query friend list
const String SC_FRIEND_LIST = "frnd.list";
///Send gift to a friend
const String SC_SEND_FRIEND = "frnd.send";
///Invite a friend
const String SC_INVITE_FRIEND = "frnd.invite";


//The client-side commands sent from server to client//

const String CC_REVISION = "rev",
             CC_LOAD     = "load",
             CC_RELOAD   = "reload",
             CC_UPDATE   = SC_UPDATE;

const String CC_ADD_TORCH = "torch.add";
const String CC_SPELL = "spell";
const String CC_SPELLS = "spell.own";
const String CC_UNLOCK_SPELL = "spell.unlock";
const String CC_USED_SPELL = "spell.used";
const String CC_ITEM = "item";
const String CC_ITEMS = "item.own";
const String CC_ADD_ITEM = "item.add";
const String CC_USED_ITEM = "item.used";
const String CC_STORY = "story";
const String CC_STORIES = "stories";
const String CC_LATTICE = "lattice";
const String CC_LATTICES = "lattices";
const String CC_NOTIFICATIONS = "notifs";
const String CC_USER_INFO = "usr";
const String CC_FRIEND_INFO = "frnd";
const String CC_FRIEND_LIST = "frnd.list";
const String CC_SEND_FRIEND = "frnd.send";
const String CC_RECV_FRIEND = "frnd.recv";
const String CC_INVITE_FRIEND = "frnd.invite";


//The server-side setting commands//

///Updates an entity
const String ST_UPDATE = SC_UPDATE;
///Retrieves a list of lattices progress
const String ST_LATTICES = SC_LATTICES;
///Retrieves lattice info.
const String ST_LATTICE = SC_LATTICE;
///Retrieves spell info.
const String ST_SPELL = SC_SPELL;
///Retrieves availble spells.
const String ST_SPELLS = SC_SPELLS;
///Update user spells
const String ST_UPDATE_SPELL = "spell.update";
///Retrieves item info.
const String ST_ITEM = SC_ITEM;
///Retrieves availble items.
const String ST_ITEMS = SC_ITEMS;
///Update user spells
const String ST_UPDATE_ITEM = "item.update";
///Retrieves story details.
const String ST_STORY = SC_STORY;
///Retrieves stories.
const String ST_STORIES = SC_STORIES;
///Retrieves notifications.
const String ST_NOTIFICATIONS = SC_NOTIFICATIONS;
///Retrieves user info.
const String ST_USER_INFO = "user";