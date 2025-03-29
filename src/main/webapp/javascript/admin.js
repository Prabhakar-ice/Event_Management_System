/**
 * 
 */
document.addEventListener("DOMContentLoaded",function(){
	
	let input = document.getElementById('adminsearchBox');
	console.log("out");
	  input.addEventListener('keyup', function () {
		console.log("in");
	    const filter = input.value.toLowerCase();
	    const rows = document.querySelectorAll('#allevents tr');

	    rows.forEach(row => {
	      const text = row.textContent.toLowerCase();
	      row.style.display = text.includes(filter) ? '' : 'none';
	    });    

	  });
});