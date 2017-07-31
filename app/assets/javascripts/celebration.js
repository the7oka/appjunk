$(document).ready(function(){
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
    colorful();
    scaryShit("#balloon1");
    scaryShit("#balloon2");
    scaryShit("#balloon3");
    scaryShit("#balloon4");
    scaryShit("#balloon5");
    scaryShit("#balloon6");
    scaryShit("#balloon7");
    scaryShit("#balloon8");
    scaryShit("#balloon9");
    scaryShit("#balloon10");
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
    x=Math.floor(Math.random()*(1000));
    y=Math.floor(Math.random()*(1000));
    s= Math.random()*(200);
      };
    };
  };
};
}, 10);

};


  });
function getRandomColor() {
    var letters = '0123456789ABCDEF';
    var color = '#';
    for (var i = 0; i < 6; i++ ) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}
var colorful = function(){
    loop = setInterval(function(){
    $('#colorful').css('color',getRandomColor())
}, 1000)
}