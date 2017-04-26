


var verFotoP = function(event) {
    var reader = new FileReader();
    reader.onload = function(){
      var output = document.getElementById('perfil');
      output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
  };
  
 var verFotoC = function(event) {
    var reader = new FileReader();
    reader.onload = function(){
      var output = document.getElementById('portada');
      output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
  };

