$(document).ready(main);

function main(){
		
};

function validar(){
  var validado = false;
  var count = 0;
  texto = document.getElementById("text").value;
  boton = document.getElementById("submit");
  for(i=1;i<=texto.length ;i++){
    if(texto.substring(i-1, i) == " "){
    	count++;
    }
    if(count > texto/4){
		alert("Introduce texto");
    validado = true;
	}
  }
  if(validado){
  document.getElementById("submit").disabled = true;

  }else{
     document.getElementById("submit").disabled = false;
  }
}

function validar2(){
  var validado = false;
  var count = 0;
  texto = document.getElementById("text2").value;
  boton = document.getElementById("submit");
  for(i=1;i<=texto.length ;i++){
    if(texto.substring(i-1, i) == " "){
    	count++;
    }
    if(count > texto/4){
		alert("Introduce texto");
    validado = true;
	}
  }
  if(validado){
  document.getElementById("submit").disabled = true;

  }else{
     document.getElementById("submit").disabled = false;
  }
}