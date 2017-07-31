
$(document).ready(function(){
    $('#app').html('testme');
    $('#junk').html(' code editor')
    document.getElementById("input").value = '<!DOCTYPE html>\n<html>\n<body>\n<h2 class="example">A heading with class="example"</h2>\n<p class="example">A paragraph with class="example".</p>\n<p>Click the button to add a background color to the first element in the document with class="example" (index 0).</p>\n<button onclick="myFunction()">Try it</button>\n<p><strong>Note:</strong> The querySelectorAll() method is not supported in Internet Explorer 8 and earlier versions.</p>\n<script>\nfunction myFunction() {\n\tvar x = document.querySelectorAll(".example");\n\tx[0].style.backgroundColor = "red";\n}\n</script>\n</body>\n</html>';
    editorFunction();
});

function cleanUp(){
   document.getElementById("input").value ="";
editorFunction();
};
window.setInterval(function(){
    var y = document.getElementById("automatic").checked
    if (y==1){
        editorFunction()
    }
}, 1000);

function editorFunction(){
    //take input and put it into a variable x 
    var x = document.getElementById("input").value;
    // replaces output html with x
    document.getElementById("output").innerHTML = x;
    //selects all script functions in output and put it in an array called scripts
    var scripts = document.querySelectorAll('#output script');
    //selecting one item after another
    for(var i=0;i<scripts.length;i++){
        //selects one script and stores it in var oldScript
        var oldScript = scripts[i];
        //creates a new empty script element and puts in into newScript
        var newScript = document.createElement('script');
        //stores the actual content of the element into newScript
        newScript.textContent = oldScript.textContent;
        oldScript.parentNode.replaceChild(newScript,oldScript);
    }
};
function clickFunction(){
    $.ajax({
            url: "/editor/click",
            type: 'GET'
        });
};


