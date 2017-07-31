$(document).ready(function(){
    $('#app').html('con')
    $('#junk').html('juring')
    var mouseX=0;
    var mouseY=0;
    $(document).on('mousemove',function(m){
mouseX = m.pageX - 100;
mouseY = m.pageY - 60;

    });
    document.addEventListener('touchmove', function(e) {
      e.preventDefault();

      mouseX = e.pageX;
    mouseY = e.pageY;
  }, false);
    scaryShit("#conjuring1");
    scaryShit("#conjuring2");
    scaryShit("#conjuring3");
    scaryShit("#conjuring4");
    scaryShit("#conjuring5");
    scaryShit("#conjuring6");
    scaryShit("#conjuring7");
    scaryShit("#conjuring8");
    scaryShit("#conjuring9");
    scaryShit("#conjuring10");
    function scaryShit(id){
var x=Math.floor(Math.random()*(1000));
var y=Math.floor(Math.random()*(1000));
var s = Math.random()*(1000);
loop = setInterval(function(){
x += (mouseX - x)/s;
y += (mouseY - y) /s;
$(id).css({left:x, top:y});
if ((mouseX-x) > -100){
  if ((mouseX-x) < 100){
    if ((mouseY-y) > -70){
      if ((mouseY-y) < 180) {
        p=document.getElementById("location").innerHTML;
        p= p*1+1;
        document.getElementById("location").innerHTML=p;
        if (p%50 == 0){
                  $.ajax({
      url: "/conjuring/click",
        type: 'GET'
    });
        };
    x=Math.floor(Math.random()*(1000));
    y=Math.floor(Math.random()*(1000));
    s= Math.random()*(1000);
      };
    };
  };
};
}, 10);

};


  });