//let tempo = timer.innerHTML.split(':');

//if(tempo[0] != "#[vars.timer]"){
//    min, seg = tempo[0], tempo[1];
//}






var min = 1, seg = 1; 

function start() {
    if((min == 1) && (seg == 1)){
        // clearWinners();
        relogio();
    }
}

function relogio(){
    if((min > 0) || (seg > 0)){
        if(seg == 0){
            seg = 59;
            min = min - 1;
        }
        else{					
            seg = seg - 1;				
        }
        if(min.toString().length == 1){
            min = "0" + min;
        }
        if(seg.toString().length == 1){
            seg = "0" + seg;
        }
        document.getElementById('spanRelogio').innerHTML = min + ":" + seg;				
        setTimeout('relogio()', 1000);
        setCookie('tempo',min + ":" + seg,60);
    }
    else{
        document.getElementById('spanRelogio').innerHTML = "00:00";
        min = 1;
        seg = 1;
    }
}

function setCookie(cname,cvalue,exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires=" + d.toGMTString();
    document.cookie = cname+"="+cvalue+"; "+expires;
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
            return "";
}

function checkCookie() {
    var cookie = getCookie("tempo");
    var token = getCookie("token");

    if ( cookie != "" ) {
        var tempo = getCookie('tempo').split(':');
        min = tempo[0];
        seg = tempo[1];

        relogio();
    }

    /** if (token != "") {

    }else{
        setCookie("token", #[vars.token], 30)
    } **/
}
