

var verFotoPost = function(event) {
    var reader = new FileReader();
    reader.onload = function(){
      var output = document.getElementById('subir-foto');
      output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
  };
  
  
  
 
//btnOkOp