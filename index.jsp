<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE HTML>
<html lang="en">
	<head>
		<title>Flughafen LRY</title>
		<meta charset="UTF-8">
		<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>

		<style>
			tr:hover { background-color: #c5c5c5; }
			td { text-align: center; cursor: context-menu; }
			.editableTxt { cursor: context-menu; }
		</style>
	</head>
	<body>

		<%
		String FLZID = request.getParameter("FLZID");
		String FLZbez = request.getParameter("FLZbez");
		String FLZ1KlsPlaetze = request.getParameter("FLZ1KlsPlaetze");
		String FLZbKlsPlaetze = request.getParameter("FLZbKlsPlaetze");
		String FLZeKlsPlaetze = request.getParameter("FLZeKlsPlaetze");
		String FLZvKlsPlaetze = request.getParameter("FLZvKlsPlaetze");
		String FLZaktive = request.getParameter("FLZaktive");

		String FLUGZEUG_ID = request.getParameter("FLUGZEUG_ID");
		String BEZEICHNUNG = request.getParameter("BEZEICHNUNG");
		String SITZE_1_KLASSE = request.getParameter("SITZE_1_KLASSE");
		String SITZE_BUSINESS = request.getParameter("SITZE_BUSINESS");
		String SITZE_ECONOMY = request.getParameter("SITZE_ECONOMY");
		String SITZE_VARIA = request.getParameter("SITZE_VARIA");
		String AKTIV = request.getParameter("AKTIV");

		Connection conn = null;
		Statement stmt = null;
		String dbuid = "flughafen";
		String dbpwd = "flug";
		int updateQuery = 0;

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection ("jdbc:mysql://localhost:3306/flughafendb", dbuid, dbpwd);
		stmt = conn.createStatement();
		%>

		<script>
			var array = [];
			var headers = [];
			var trid;
			$('body').on('click', '.editableTxt', function() {
				trid = $(this).closest('tr').attr('id');

				var $el = $(this);
				var $input = $('<input/>').val( $el.text() );
				$el.replaceWith( $input );

				var save = function(){
					var $p = $("<label class='editableTxt'></label>").text( $input.val() );
					$input.replaceWith( $p );

					$('table thead tr th').each(function(index, item) {
					    headers[index] = $(item).text();
					});
					$('table tr:not(:last)').has('td').each(function() {
					    var arrayItem = {};
					    $('td', $(this)).each(function(index, item) {
					        arrayItem[headers[index]] = $(item).text();
					    });
					    array.push(arrayItem);
					});
					post(array);

				};
				$input.one('blur', save).focus();
			});

			function post(parameters) {
				var form = $('<form></form>');
				form.attr("method", "post");
				var result = parameters.find(obj => {
					return obj.FLUGZEUG_ID == trid;
				});
				$.each( result, function( key, value ) {
					var field = $('<input></input>');

					field.attr("type", "hidden");
					field.attr("name", key);
					field.attr("value", value);

					form.append(field);
				});

				$(document.body).append(form);
				form.submit();
			}

		</script>

		<%

		try {

			String the_sql = "UPDATE FLUGZEUGE SET FLUGZEUG_ID=?, BEZEICHNUNG=?, SITZE_1_KLASSE=?, SITZE_BUSINESS=?, SITZE_ECONOMY=?, SITZE_VARIA=?, AKTIV=? WHERE FLUGZEUG_ID=?";

			PreparedStatement pstmt = conn.prepareStatement(the_sql);
			pstmt.setString(1, FLUGZEUG_ID);
			pstmt.setString(2, BEZEICHNUNG);
			pstmt.setString(3, SITZE_1_KLASSE);
			pstmt.setString(4, SITZE_BUSINESS);
			pstmt.setString(5, SITZE_ECONOMY);
			pstmt.setString(6, SITZE_VARIA);
			pstmt.setString(7, AKTIV);
			pstmt.setString(8, FLUGZEUG_ID);

			updateQuery = pstmt.executeUpdate();
		} catch(SQLException e){
			out.println("<hr>" + e.getMessage() + "2<br>");
		} finally {
		}

		try {

			String the_sql = "DELETE FROM FLUGZEUGE WHERE FLUGZEUG_ID = ?";

			PreparedStatement pstmt = conn.prepareStatement(the_sql);
			pstmt.setString(1, FLZID);

			updateQuery = pstmt.executeUpdate();
		} catch(SQLException e){
			out.println("<hr>" + e.getMessage() + "2<br>");
		} finally {
		}

		try {

			String the_sql = "INSERT INTO FLUGZEUGE(BEZEICHNUNG,SITZE_1_KLASSE,SITZE_BUSINESS,SITZE_ECONOMY,SITZE_VARIA,AKTIV) VALUES(?,?,?,?,?,?)";

			PreparedStatement pstmt = conn.prepareStatement(the_sql);
			pstmt.setString(1, FLZbez);
			pstmt.setString(2, FLZ1KlsPlaetze);
			pstmt.setString(3, FLZbKlsPlaetze);
			pstmt.setString(4, FLZeKlsPlaetze);
			pstmt.setString(5, FLZvKlsPlaetze);
			pstmt.setString(6, FLZaktive);

			updateQuery = pstmt.executeUpdate();
		} catch(SQLException e){
			out.println("<hr>" + e.getMessage() + "2<br>");
		} finally {
		}



		try{

			String the_sql = "SELECT * FROM FLUGZEUGE";
			PreparedStatement pstmt = conn.prepareStatement(the_sql);
			ResultSet res = pstmt.executeQuery();

			out.println("<table id='SelectTable' border=1><thead><th id='FLUGZEUG_ID'>FLUGZEUG_ID</th><th id='BEZEICHNUNG'>BEZEICHNUNG</th><th id='SITZE_1_KLASSE'>SITZE_1_KLASSE</th><th id='SITZE_BUSINESS'>SITZE_BUSINESS</th><th id='SITZE_ECONOMY'>SITZE_ECONOMY</th><th id='SITZE_VARIA'>SITZE_VARIA</th><th id='AKTIV'>AKTIV</th></thead>");

			int rowcount = 0;
			while(res.next()) {
				rowcount++;
				out.print("<tr id=" + res.getString("FLUGZEUG_ID") + "><td><label class='selectMe'>" + res.getString("FLUGZEUG_ID") + "</label></td><td><label class='editableTxt selectMe'>" + res.getString("BEZEICHNUNG") + "</label></td><td><label class='editableTxt selectMe'>" + res.getString("SITZE_1_KLASSE") + "</label></td><td><label class='editableTxt selectMe'>" + res.getString("SITZE_BUSINESS") + "</label></td><td><label class='editableTxt selectMe'>" + res.getString("SITZE_ECONOMY") + "</label></td><td><label class='editableTxt'>" + res.getString("SITZE_VARIA") + "</label></td><td><label class='editableTxt selectMe'>" + res.getString("AKTIV") + "</label></td><td><form method='post'><input type='submit' value='L&ouml;schen'><input type='hidden' name='FLZID' value=" + res.getString("FLUGZEUG_ID") + "></form></td></tr>");
			}
			out.print("<tr><form method='post' action=''><td><p>new dataset</p></td><td><input type='text' name='FLZbez' class='newInput' required></td><td><input type='number' name='FLZ1KlsPlaetze' class='newInput' required></td><td><input type='number' name='FLZbKlsPlaetze' class='newInput' required></td><td><input type='number' name='FLZeKlsPlaetze' class='newInput' required></td><td><input type='number' name='FLZvKlsPlaetze' class='newInput' required></td><td><input type='number' name='FLZaktive' class='newInput' min='0' max='1' required></td><td><input type='submit' value='Hinzuf&uuml;gen'></td></form></tr>");

			out.println("</table>");
		} catch(SQLException e){
			out.println("<hr>" + e.getMessage() + "<br>");
		} finally {
		}

	  %>

	</body>
</html>
