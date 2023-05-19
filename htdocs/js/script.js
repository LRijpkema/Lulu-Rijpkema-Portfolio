const toggleButton = document.getElementsByClassName('toggle-button')[0];
const navbarLinks = document.getElementsByClassName('navbar-links')[0];

toggleButton.addEventListener('click', () => {
    navbarLinks.classList.toggle('active');
    toggleButton.classList.toggle('active');
    
})


const el = document.getElementById('imgOne');
const hiddenDiv = document.getElementById('imgTwo');

el.addEventListener('mouseover', function handleMouseOver() {
  hiddenDiv.style.display = 'block';
  el.style.display = 'none';



});

el.addEventListener('mouseout', function handleMouseOut() {
    hiddenDiv.style.display = 'none';
    el.style.display = 'block';
  
  });
  

  const name = document.getElementById('name');
  const email = document.getElementById('email');
  const msg = document.getElementById('message');
  const submit = document.getElementsByClassName('contact-form')[0];
  const success = document.getElementById('success');
submit.addEventListener('submit', (e) => {
  e.preventDefault();
  console.log('clicked');
  console.log(email.value);


  let ebody = `

  <body>
  <table bgcolor="#fafafa" style=" width: 100%!important; height: 100%; background-color: #fafafa; padding: 20px; font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, 'Lucida Grande', sans-serif;  font-size: 100%; line-height: 1.6;">
  <tr>
  <td></td>
  <td bgcolor="#FFFFFF" style="border: 1px solid #eeeeee; background-color: #ffffff; border-radius:5px; display:block!important; max-width:600px!important; margin:0 auto!important; clear:both!important;"><div style="padding:20px; max-width:600px; margin:0 auto; display:block;">
  <table style="width: 100%;">
  <tr>
  <td><p style="text-align: center; display: block;  padding-bottom:20px;  margin-bottom:20px; border-bottom:1px solid #dddddd;"><img src="/htdocs/imgs/LULULOGO.png"/></p>
  <h1 style="font-weight: 200; font-size: 36px; margin: 20px 0 30px 0; color: #333333;">Details</h1>
  <p style="margin-bottom: 10px; font-weight: normal; font-size:16px; color: #333333;">[YOURFIELD]</p>
  <h2 style="font-weight: 200; font-size: 16px; margin: 20px 0; color: #333333;"> [YOURFIELD] </h2>
  <h2 style="font-weight: 200; font-size: 16px; margin: 20px 0; color: #333333;"> [YOURFIELD] </h2>
  <h2 style="font-weight: 200; font-size: 16px; margin: 20px 0; color: #333333;"> [YOURFIELD] </h2>
  <h2 style="font-weight: 200; font-size: 16px; margin: 20px 0; color: #333333;"> [YOURFIELD] </h2>
  <p style="text-align: center; display: block; padding-top:20px; font-weight: bold; margin-top:30px; color: #666666; border-top:1px solid #dddddd;">YOUR COMPANY NAME</p></td>
  </tr>
  </table>
  </div></td>
  <td></td>
  </tr>
  </table>
  </body>

      <b>Name: </b>${name.value}
      <br>
      <b>Email: </b> <a href="mailto:${email.value} ">${email.value}</a>
      <br>
      <b>Message: </b>${msg.value}
  `
    Email.send({
      SecureToken : "f4969327-4363-4e13-a7e8-334c637ac062 ",
      To : 'lulurijpkema@gmail.com',
      From : 'luluportfoliocontactform@gmail.com',
      Subject : "Email from " + name.value,
      Body : ebody
  }).then(
    

    (message) => { console.log(message);

      setTimeout(() => {
        name.value = '';
        email.value = '';
        msg.value = '';
      }, 300);

    if (message === "OK") {
      success.style.display = 'block';
    } else {
      error.style.display = 'block';
    }
    
    setTimeout(() => {
      success.style.display = 'none';
    }, 4000);
 

  });

});








