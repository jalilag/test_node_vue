Vue.component('myheader', {
  template: `
<div class="ui purple inverted menu">
	<a class="header item" href="/">Accueil</a>
</div>
`
})


Vue.component('myfooter', {
  template: `
<div class="ui inverted menu">
	<a class="footer item" href="/">Accueil</a>
</div>
`
})


let vm = new Vue({
	el:"#app",
	data:{
		message:"Jean",
	}
})

