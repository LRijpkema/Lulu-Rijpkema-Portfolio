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

  <!doctype html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <title>Contact Form</title>
  </head>
  <body style="margin: 0; padding: 0">
    <table align="center" width="100%" cellpadding="0" cellspacing="0" border="0" style="width: 100%; max-width: 650px; margin: 0 auto;">
      <tr>
        <td>
          <table width="100%" bgcolor="#ffffff" cellpadding="0" cellspacing="0" border="0" style="width: 100%; max-width: 620px; margin: 0 auto; background: #ffffff;">
            <tr>
              <td style="background-color: #ffffff;">
                <table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding-top: 20px; padding-bottom: 20px;">
                  <tr>
                    <td style="text-align: left;">
                      <a href="#" style="text-decoration: none; font-size: 3rem; color: #000; font-family: 'Damion', cursive;">Lulu</a>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td>
                <table width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color: #ffffff; border: 4px solid #f9f9f9;">
                  <tr>
                    <td width="600" style="padding-top: 70px; padding-bottom: 40px; padding-left: 70px; padding-right: 70px;">
                      <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                          <td style="font-family: Verdana, sans-serif; color: #000000; text-align: left; padding-bottom: 15px;">
                            <label style="font-weight: bold; display: block; margin-bottom: 10px;">Name</label>
                            <div style="margin-bottom: 15px;">${name.value}</div>
                            <div style="border-bottom: 2px solid #f4f4f4;"></div>
                          </td>
                        </tr>
                        <tr>
                          <td style="font-family: Verdana, sans-serif; color: #000000; text-align: left; padding-bottom: 15px;">
                            <label style="font-weight: bold; display: block; margin-bottom: 10px;">Email</label>
                            <div style="margin-bottom: 15px;">
                              <a href="mailto:${email.value}" style="color: #000000;">${email.value}</a>
                            </div>
                            <div style="border-bottom: 2px solid #f4f4f4;"></div>
                          </td>
                        </tr>
                        <tr>
                          <td style="font-family: Verdana, sans-serif; color: #000000; text-align: left; padding-bottom: 15px; line-height: 25px;">
                            <label style="font-weight: bold; display: block; margin-bottom: 10px;">Message</label>
                            <div>${msg.value}</div>
                          </td>
                        </tr>
                        <tr>
                          <td height="20"></td>
                        </tr>
                        <tr>
                          <td>
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
-                            </table>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </body>
</html>

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








