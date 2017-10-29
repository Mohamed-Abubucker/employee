search = () => {
    var search = jQuery("#srch-term").val();
    window.location.href = "/Home/Index?word=" + encodeURIComponent(search);
}
showAlert = (type, text) => {
    var html = "<div class='alert alert-" + type + "'><button type='button' class='close' data-dismiss='alert'>x</button><span>" + text + "</span></div>"
    $('#alert-placeholder').html(html).fadeIn('slow');
    $("html, body").animate({ scrollTop: 0 }, "slow");
}

hideAlert = () => {
    $('#alert-placeholder').html('').fadeIn('slow');
}

 showProgressDiv=()=> {
    $('#loadingcomment').fadeIn('slow');

}

 hideProgressDiv = () => {
     $('#loadingcomment').fadeOut('slow');
 }
 redirectToHome = () => {
     setTimeout(() => { window.location.href = "/Home/Index"; }, 5000);
 }

 edit = (id) => {
     window.location.href = "/Home/Edit/" + id;
 }

deleteemp = (id) => {
    if (confirm('Are you sure you wish to delete him?')) {
        $.ajax({
            url: '/api/Employee/' + id,
            type: 'DELETE',
            dataType: 'json',
            data: "",
            contentType: 'application/json; charset=utf-8',
            success: function (data, textStatus, jqXHR) {
                //alert(JSON.stringify(data));
                if (data) {

                    showAlert('info', "Employee deleted Successfully");
                    hideProgressDiv();
                    redirectToHome();
                }
                else {
                    showAlert('danger', 'Error: unable to delete. plz try again later.');
                    hideProgressDiv();
                    console.log(data.reason);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                //show alert div instead of this

                showAlert('danger', 'Error:' + errorThrown);
                hideProgressDiv();
                console.log(errorThrown);
            }
        });
    }
}

$(document).ready(() => {
    hideProgressDiv();

    $("#empcreate").on("submit", function (e) {
        e.preventDefault();
        showProgressDiv();
        var employee = {};

        employee.NAME = $('#NAME').val();
        employee.DOJ = $('#DOJ').val();
        employee.MOBILE = $('#MOBILE').val();
        employee.EMAIL = $('#EMAIL').val();
       
        employee.SALARY = $('#SALARY').val();
        employee.DESIGN = $('#DESIGN').val();
        employee.DEPT = $('#DEPT').val();

        $.ajax({
            url: '/api/Employee',
            type: 'POST',
            dataType: 'json',
            data: JSON.stringify(employee),
            contentType: 'application/json; charset=utf-8',
            success: function (data, textStatus, jqXHR) {
                //alert(JSON.stringify(data));
                if (data) {

                    showAlert('success', "Employee Registered Successfully. Redirecting to home..");
                    hideProgressDiv();
                    redirectToHome();
                }
                else {
                    showAlert('danger', 'Error: Failed to Register. please try again later');
                    hideProgressDiv();
                    console.log(data.reason);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                //show alert div instead of this

                showAlert('danger', 'Error:' + errorThrown);
                hideProgressDiv();
                console.log(errorThrown);
            }
        });
    });

    $("#empupdate").on("submit", function (e) {
        e.preventDefault();
        showProgressDiv();
        var employee = {};

        employee.ID = $('#ID').val();
        employee.NAME = $('#NAME').val();
        employee.DOJ = $('#DOJ').val();
        employee.MOBILE = $('#MOBILE').val();
        employee.EMAIL = $('#EMAIL').val();

        employee.SALARY = $('#SALARY').val();
        employee.DESIGN = $('#DESIGN').val();
        employee.DEPT = $('#DEPT').val();

        $.ajax({
            url: '/api/Employee',
            type: 'PUT',
            dataType: 'json',
            data: JSON.stringify(employee),
            contentType: 'application/json; charset=utf-8',
            success: function (data, textStatus, jqXHR) {
                //alert(JSON.stringify(data));
                if (data) {

                    showAlert('success', "Employee Updated Successfully. Redirecting to home..");
                    hideProgressDiv();
                    redirectToHome();
                }
                else {
                    showAlert('danger', 'Error: Failed to Updated. please try again later');
                    hideProgressDiv();
                    console.log(data.reason);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                //show alert div instead of this

                showAlert('danger', 'Error:' + errorThrown);
                hideProgressDiv();
                console.log(errorThrown);
            }
        });
    });

});