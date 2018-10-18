function toggleAlert(){
    $(".alert").toggleClass('in out'); 
    return false; // Keep close.bs.alert event from removing from DOM
}

$("#btn").on("click", toggleAlert);
$('#bsalert').on('close.bs.alert', toggleAlert);