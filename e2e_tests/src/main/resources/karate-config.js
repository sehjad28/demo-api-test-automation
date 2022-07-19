function fn(){
  karate.configure('connectTimeout', 180000);
  karate.configure('readTimeout', 180000);
    var apitestbase = Java.type('com.testautomation.api.base.APITestBase');
    properties = apitestbase.returnAllProperties();
  //Send Properties to Karate
  for(var key in properties) {
      karate.properties[key]=properties[key];
  }
}


function getTomorrowDate()
{
       var now     = new Date();
       var year    = now.getFullYear();
       var month   = now.getMonth()+1;
       var day     = now.getDate()+1;
       var hour    = now.getHours();
       var minute  = now.getMinutes();
       var second  = now.getSeconds();
       if(month.toString().length == 1) { month = '0'+ month; }
       if(day.toString().length == 1) { day = '0' + day; }
       if(hour.toString().length == 1) { hour = '0' + hour; }
       if(minute.toString().length == 1) { minute = '0' + minute; }
       if(second.toString().length == 1) { second = '0' + second; }
       var datetomorrow = year + '-' + month + '-'+ day;
       return datetomorrow;
}

function getCurrentDate(){
   var now     = new Date();
   var year    = now.getFullYear();
   var month   = now.getMonth()+1;
   var day     = now.getDate();
   var hour    = now.getHours();
   var minute  = now.getMinutes();
   var second  = now.getSeconds();
   if(month.toString().length == 1) { month = '0'+ month; }
   if(day.toString().length == 1) { day = '0' + day; }
   if(hour.toString().length == 1) { hour = '0' + hour; }
   if(minute.toString().length == 1) { minute = '0' + minute; }
   if(second.toString().length == 1) { second = '0' + second; }
   var datetoday = year + '-' + month + '-'+ day;
   return datetoday;
}

function getmyheaders(){

return {
'Authorization': 'Bearer 3f2167d98cceaa2dc908d5f5824da9dd6d1e388639795a8125386eb6a0baf0d3',
  'Content-Type': 'application/json'
};


}

function geCurrenttDateTime(){
       var now     = new Date();
       var year    = now.getFullYear();
       var month   = now.getMonth()+1;
       var day     = now.getDate();
       var hour    = now.getHours();
       var minute  = now.getMinutes();
       var second  = now.getSeconds();
       if(month.toString().length == 1) { month = '0'+ month; }
       if(day.toString().length == 1) { day = '0' + day; }
       if(hour.toString().length == 1) { hour = '0' + hour; }
       if(minute.toString().length == 1) { minute = '0' + minute; }
       if(second.toString().length == 1) { second = '0' + second; }
       var dateTime = year + '-' + month + '-'+ day + ' ' + hour + ':' + minute + ':' + second;
       return dateTime;
}

function convertMultiRowMapToJson(list){
	return Java.type('testautomation.api.json.JSONConverter').dbListMapToJson(list);
}
function convertListToJson(list){
	return Java.type('testautomation.api.json.JSONConverter').dbListToJson(list);
}

function getSingleValueFromDB(query){
       return Java.type('com.testautomation.common.database.PostgreDBQueryExecutor').getSingleValueFromTable(query);
}

function getSingleRowFromDB(query){
       return Java.type('com.testautomation.common.database.PostgreDBQueryExecutor').getSingleRowFromTable(query);
}

function getMultipleRowsFromDB(query){
       return Java.type('com.testautomation.common.database.PostgreDBQueryExecutor').getMultipleRowsFromTable(query);
}

function searchFileAndReturnContent(filename){
    return Java.type('com.testautomation.api.base.FileFinder').searchFileAndReturnContent(filename);
}

function generateRequest(request){
    return Java.type('com.testautomation.api.json.GenerateNewRequest').generate(request);
}

function requestStr(request,originalstr, replaceval ){
    return Java.type('com.testautomation.api.json.GenerateNewRequest').replace(request,originalstr, replaceval);
}

function convertToWholeNumber(strval){
    return parseInt(strval);
}


function getHeadersWithParams(client_id, client_secret) {
  return Java.type('com.testautomation.api.security.Auth0SecurityManager').getAuthorizationKey(client_id, client_secret);
}

function recordResponse(scenariofilename, response){
    Java.type('com.testautomation.api.responsebaseline.Recorder').capture(scenariofilename, response);
}

function getResponseFilenameFromFeatureFile(scenariofilename){
    return Java.type('com.testautomation.api.responsebaseline.Recorder').getResponseFilenameFromFeatureFile(scenariofilename);
}

function compareRequestResponse(actualresponsestr,expectedresponse){
    if(expectedresponse =='' || expectedresponse == null){
        return 'Baseline File Not Found. Please run Baseline first';
    }
    return Java.type('com.cinch.testautomation.api.json.CompareJSONString').compare(actualresponsestr,expectedresponse);
}

