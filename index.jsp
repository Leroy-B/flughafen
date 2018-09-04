<!DOCTYPE HTML>
<html lang="en">
	<head>
		<title>Flughafen LRY</title>
		<meta charset="UTF-8">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
		<link href="/fontawesome/css/all.css" rel="stylesheet">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

	</head>
	<body>

        <!-- Wrapper -->
        <div id="wrapper">

            <!-- Header -->
            <header id="header" class="alt">
                <span class="logo"><img src="images/logo2.png" alt="leroy's logo" width="200px"></span>
				<h1>Flughafen LRY</h1>
            </header>

            <!-- Nav -->
            <nav id="nav">
                <ul>
                    <li><a href="#Abflug"><i class="fas fa-plane-departure"></i> Abfl&uuml;ge</a></li>
                    <li><a href="#Ankunft"><i class="fas fa-plane-arrival"></i> Ank&uuml;nfte</a></li>
                    <li><a href="#Flotte"><i class="fas fa-pastafarianism"></i> Flotte</a></li>
                </ul>
            </nav>

            <!-- Main -->
            <div id="main">

				<%
					String subpage = "start";


				%>

                <!-- Abflug -->
				<section id="Abflug" class="main special">
                    <header class="major">
                        <h2><i class="fas fa-plane-departure"></i> Abflüge</h2>
                    </header>
					<%@include file="index1.jsp" %>

                    <!-- <ul class="features">
                        <li>
                            <h3></h3>
                            <p></p>
                            <a href="" class="button"></a>
                        </li>
                    </ul> -->
                </section>

				<!-- Ankunft -->
				<section id="Ankunft" class="main special">
                    <header class="major">
                        <h2><i class="fas fa-plane-arrival"></i> Ankünfte</h2>
                    </header>
                    <ul class="features">
                        <li>
                            <h3></h3>
                            <p></p>
                            <a href="" class="button"></a>
                        </li>
                    </ul>
                </section>

				<!-- Flotte -->
				<section id="Flotte" class="main special">
                    <header class="major">
                        <h2><i class="fas fa-pastafarianism"></i> Unsere Flotte</h2>
                    </header>
					<ul class="features">
                        <li>
                            <h3></h3>
                            <p></p>
                            <a href="" class="button"></a>
                        </li>
                    </ul>
                </section>

            </div>

            <!-- Footer -->
            <footer id="footer">
                <p class="copyright">&copy; Leroy<br></p>
            </footer>

        </div>

        <!-- Scripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.scrollex.min.js"></script>
        <script src="assets/js/jquery.scrolly.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
        <script src="assets/js/main.js"></script>

	</body>
</html>
