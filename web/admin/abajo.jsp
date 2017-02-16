        </div>
    </div>
</div>

<script>
    var clic = 1;
    alert("esto ya no debe ir");
    function mos_man(){ 
        if(clic==1){
            document.getElementById("mantenimientos").style.display = "block";
            clic = clic + 1;
        } else{
            document.getElementById("mantenimientos").style.display = "none";
            clic = 1;
        }   
}
</script>

                        
</body>

    <!--   Core JS Files   -->


	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="assets/js/demo.js"></script>
                                
</html>
