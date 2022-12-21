var hour = 0;
var min = 0;
var sec = 0;
var milli = 0;
var bool = true;
var check = true;
function restart(){
    hour = 0;
    min = 0;
    sec = 0;
    milli = 0;

    var clock = document.getElementById('MyClockDisplay');

    if(milli < 10){
        if(!(String(milli).includes("0"))||milli===0){
            milli = "0"+milli;
        }
    }
    if(sec<10){ 
        if(!(String(sec).includes("0"))||sec===0){
            sec = "0"+sec;
        }
    }
    if(min<10){
        if(!(String(min).includes("0"))||min===0){
            min = "0"+min;
        }
    }
    if(hour<10){
        if(!(String(hour).includes("0"))||hour===0){
            hour = "0"+hour;
        }
    }
    return clock.innerHTML = hour +":"+min+":"+sec+"."+milli;

}

function show(){
    if(bool){
        var clock = document.getElementById('MyClockDisplay');
        
        milli++;


        if(milli>99){
            sec++;
            milli=0;
        }

        if(sec>59){
            min++;
            sec=0;
        }
        if(min>59){
            hour++;
            min=0;
        }


        if(milli < 10){
            if(!(String(milli).includes("0"))||milli===0){
                milli = "0"+milli;
            }
        }
        if(sec<10){ 
            if(!(String(sec).includes("0"))||sec===0){
                sec = "0"+sec;
            }
        }
        if(min<10){
            if(!(String(min).includes("0"))||min===0){
                min = "0"+min;
            }
        }
        if(hour<10){
            if(!(String(hour).includes("0"))||hour===0){
                hour = "0"+hour;
            }
        }
        clock.innerHTML = hour +":"+min+":"+sec+"."+milli;

        check = false;
        setTimeout(show,10);
    }else{
        check = true;
        return 0;
    }

}


var btn = document.querySelectorAll("button.btn");
btn[0].addEventListener("click",function(){
    bool = true;
    if(check){
        show();
    }
});
btn[1].addEventListener('click',function(){
    bool = false;
    show();
})

btn[2].addEventListener('click',function(){
    
})


btn[3].addEventListener('click',function(){
    if(check){
        restart();
    }
})
