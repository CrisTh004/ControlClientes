<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${notificacion != null}">
    <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
        <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header">
                <i class="fab fa-brands fa-java rounded me-2"></i>
                <strong class="me-auto">JavaOfPlink</strong>
                <small>Hace un momento</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                ${notificacion}
            </div>
        </div>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", iniciarApp);
        function iniciarApp() {
            const toastLiveExample = document.getElementById('liveToast');

            const toast = new bootstrap.Toast(toastLiveExample);

            toast.show();
        }
    </script>
    <%
        request.getSession().setAttribute("notificacion", null);
    %>
</c:if>
