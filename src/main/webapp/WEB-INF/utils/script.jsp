<%--
  Created by IntelliJ IDEA.
  User: AlfredVRIGNAUD
  Date: 12/12/2022
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<script>
    function SupprimerVille(){
        if(confirm("Voulez-vous supprimer cette ville ?")){
            window.location="http://localhost:8080/TP_ESEO/SupprimerVille";
        }
        else{
            return;
        }
    }

</script>