let day = null;
let month = null;
let year = null;

$(document).ready(function() {
    $('#container').draggable();
});

function getRndInteger(min, max) {
    return Math.floor(Math.random() * (max - min) ) + min;
  }

window.addEventListener('message', function(event) {
    const data = event.data;
    $("#container").fadeIn(350);
    if(data.receivedate) {
      let rd = data.receivedate;
      let parts = rd.split('/');
      day = parseInt(parts[0], 10);
      month = ( parts[1][0] === '0') ? parseInt(parts[1][1], 10) : parseInt(parts[1], 10);
      year = ( parts[2][0] === '0') ? parseInt(parts[2][1], 10) : parseInt(parts[2], 10);
    }
    if(data.item == 'id_card') {
      $("#container-id").fadeIn(350);
      if(data.gender == 1) {
        document.getElementById("picture").innerHTML = '<img src="../html/img/female.png" alt="">';
        document.getElementById("gender").innerHTML = '<p>Vrouw</p>';
      } else {
        document.getElementById("picture").innerHTML = '<img src="../html/img/male.png" alt="">';
        document.getElementById("gender").innerHTML = '<p>Man</p>';
      }
      document.getElementById("citizenid").innerHTML = '<p>' + year + '.' + month + '.' + day + '-' + getRndInteger(100, 999) + '-' + getRndInteger(10,99) + '</p>';
      document.getElementById("firstname").innerHTML = '<p>' + data.firstname + '</p>';
      document.getElementById("lastname").innerHTML = '<p>' + data.lastname +'</p>';
      document.getElementById("birthdate").innerHTML = '<p>' + data.birthdate + '</p>';
      document.getElementById("nationality").innerHTML = '<p>' + data.nationality + '</p>';
      document.getElementById("cardnum").innerHTML = '<p>' + getRndInteger(100,999) + '-' + getRndInteger(1000000,9999999) + '-' + getRndInteger(10,99) + '</p>';
      document.getElementById("expiredate").innerHTML = '<p>' + day + '/' + month + '/20' + (year+10) + '</p>';
      document.getElementById("signature").innerHTML = '<p>' + data.firstname + '</p>';
    }else if(data.item == 'driver_license') {
      $("#container-drive").fadeIn(350);
      if(data.gender == 1) {
        document.getElementById("picture2").innerHTML = '<img src="../html/img/female.png" alt="">';
        document.getElementById("picture22").innerHTML = '<img src="../html/img/female.png" alt="">';
      } else {
        document.getElementById("picture2").innerHTML = '<img src="../html/img/male.png" alt="">';
        document.getElementById("picture22").innerHTML = '<img src="../html/img/male.png" alt="">';
      }
      document.getElementById("firstname2").innerHTML = '<p>' + data.firstname + '</p>';
      document.getElementById("lastname2").innerHTML = '<p>' + data.lastname +'</p>';
      document.getElementById("birthdate2").innerHTML = '<p>' + data.birthdate + '</p>';
      document.getElementById("nationality2").innerHTML = '<p>' + data.nationality + '</p>';
      document.getElementById("succesdate2").innerHTML = '<p>' + day + '/' + month + '/' + year + '</p>';
      document.getElementById("cardnum2").innerHTML = '<p>' + getRndInteger(1000000000,9999999999) + '</p>';
      document.getElementById("expiredate2").innerHTML = '<p>' + day + '/' + (month+2) + '/20' + year + '</p>';
      document.getElementById("signature2").innerHTML = '<p>' + data.firstname + '</p>';
    }else if(data.item == 'driver_temp_license') {
      $("#container-tempdrive").fadeIn(350);
      if(data.gender == 1) {
        document.getElementById("picture2").innerHTML = '<img src="../html/img/female.png" alt="">';
        document.getElementById("picture22").innerHTML = '<img src="../html/img/female.png" alt="">';
      } else {
        document.getElementById("picture2").innerHTML = '<img src="../html/img/male.png" alt="">';
        document.getElementById("picture22").innerHTML = '<img src="../html/img/male.png" alt="">';
      }
      document.getElementById("firstname2").innerHTML = '<p>' + data.firstname + '</p>';
      document.getElementById("lastname2").innerHTML = '<p>' + data.lastname +'</p>';
      document.getElementById("birthdate2").innerHTML = '<p>' + data.birthdate + '</p>';
      document.getElementById("nationality2").innerHTML = '<p>' + data.nationality + '</p>';
      document.getElementById("succesdate2").innerHTML = '<p>' + day + '/' + month + '/' + year + '</p>';
      document.getElementById("cardnum2").innerHTML = '<p>' + getRndInteger(1000000000,9999999999) + '</p>';
      document.getElementById("expiredate2").innerHTML = '<p>' + day + '/' + (month+1) + '/20' + year + '</p>';
      document.getElementById("signature2").innerHTML = '<p>' + data.firstname + '</p>';
    }else if(data.item == 'lawyer_card') {
      $("#container-lawyer").fadeIn(350);
      document.getElementById("firstname3").innerHTML = '<p>' + data.firstname + ' ' + data.lastname + '</p>';
      document.getElementById("phone3").innerHTML = '<p>' + data.phone +'</p>';
      document.getElementById("email3").innerHTML = '<p>' + data.email + '</p>';
      document.getElementById("location3").innerHTML = '<p>' + data.location +'</p>';
      document.getElementById("website3").innerHTML = '<p>' + data.firstname + data.lastname +'.be</p>';
    }else if(data.item == 'police_card') {
      $("#container-police").fadeIn(350);
      if(data.gender == 1) {
        document.getElementById("picture4").innerHTML = '<img src="../html/img/female.png" alt="">';
      } else {
        document.getElementById("picture4").innerHTML = '<img src="../html/img/male.png" alt="">';
      }
      document.getElementById("firstname4").innerHTML = '<p>' + data.firstname + ' ' + data.lastname + '</p>';
    }
});

$( function() {
    $("body").on("keydown", function (key) {
        if (key.keyCode == 27) {
            close();
        }
    });
});

function close() {
    $("#container-id").fadeOut(350);
    $("#container-drive").fadeOut(350);
    $("#container-tempdrive").fadeOut(350);
    $("#container-lawyer").fadeOut(350);
    $("#container-police").fadeOut(350);
    $("#container").fadeOut(350);
    $.post("https://flex-card/CloseNui", JSON.stringify({}));
}

function zoom(event) {
    event.preventDefault();
  
    scale += event.deltaY * -0.001;
  
    // Restrict scale
    scale = Math.min(Math.max(.125, scale), 4);
  
    // Apply scale transform
    el2.style.transform = `scale(${scale})`;
    el3.style.transform = `scale(${scale})`;
    el4.style.transform = `scale(${scale})`;
    el5.style.transform = `scale(${scale})`;
    el6.style.transform = `scale(${scale})`;
  }
  
  let scale = 1;
  const el = document.querySelector('#container');
  const el2 = document.querySelector('#container-id');
  const el3 = document.querySelector('#container-drive');
  const el4 = document.querySelector('#container-tempdrive');
  const el5 = document.querySelector('#container-lawyer');
  const el6 = document.querySelector('#container-police');
  el.onwheel = zoom;

  el.addEventListener('wheel', zoom, { passive: false });