// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function () {

    $('.round:nth-of-type(3)').hide();
    $('.round:nth-of-type(5)').hide();
    $('.round:nth-of-type(7)').hide();
    $('.round:nth-of-type(9)').hide();
    $('.round:nth-of-type(11)').hide();
    $('.round:nth-of-type(13)').hide();
    $('.round:nth-of-type(15)').hide();
    $('.round:nth-of-type(17)').hide();



    $('.results:nth-of-type(2)').hide();
    $('.results:nth-of-type(4)').hide();
    $('.results:nth-of-type(6)').hide();
    $('.results:nth-of-type(8)').hide();
    $('.results:nth-of-type(10)').hide();
    $('.results:nth-of-type(12)').hide();
    $('.results:nth-of-type(14)').hide();
    $('.results:nth-of-type(16)').hide();


    $codeName = $('#codeName');

    $codeName.on('keyup', function () {

        $('#nameOfClass').empty().append('class ' + this.value.substr(0, 1).toUpperCase() + this.value.substr(1));

        $('#nameMethod').empty().append(' "' + this.value.substr(0, 1).toUpperCase() + this.value.substr(1) + '"');


    });

    var round = 1;
    var rounds = 7;


//    while (round < rounds) {
//
//        $("#runRound:nth-of-type(round)").on('click', function () {
//            $('.results:nth-of-type(round + 1)').show();
//            $('.round:nth-of-type(round)').hide();
//        });
//
//        $("#nextRound:nth-of-type(round)").on('click', function () {
//            $('.results:nth-of-type(round + 1)').hide();
//            $('.round:nth-of-type(round + 2)').show();
//
//            round += 1
//        });
//    }

    var round_action = 1;

    $(".runRound").on('click', function () {
        console.log(round_action);

        if (round_action == 1){


            $('.results:nth-of-type(2)').show();
            $('.round:nth-of-type(1)').hide();
            round_action = 2;
        } else if (round_action == 2){


            $('.results:nth-of-type(4)').show();
            $('.round:nth-of-type(3)').hide();
            round_action = 3;
        } else if (round_action == 3){


            $('.results:nth-of-type(6)').show();
            $('.round:nth-of-type(5)').hide();
            round_action = 4;
        } else if (round_action == 4){
            console.log("action 3");

            $('.results:nth-of-type(8)').show();
            $('.round:nth-of-type(7)').hide();

            round_action = 5;
        } else if (round_action == 5){
            $('.results:nth-of-type(10)').show();
            $('.round:nth-of-type(9)').hide();
            round_action = 6;
        }

    });

    var next_action = 1;
    $(".nextRound").on('click', function () {
        if (next_action == 1) {
            $('.results:nth-of-type(2)').hide();
            $('.round:nth-of-type(3)').show();
            next_action = 2;
        } else if (next_action == 2) {

            $('.results:nth-of-type(4)').hide();
            $('.round:nth-of-type(5)').show();
            next_action = 3;
        } else if (next_action == 3) {

            $('.results:nth-of-type(6)').hide();
            $('.round:nth-of-type(7)').show();
            next_action = 4;
        } else if (next_action == 4) {

            $('.results:nth-of-type(8)').hide();
            $('.round:nth-of-type(9)').show();
            next_action = 5;
        } else if (next_action == 5) {

            $('.results:nth-of-type(10)').hide();
            $('.round:nth-of-type(11)').show();
            next_action = 6;
        }
        else if (next_action == 6) {

            $('.results:nth-of-type(12)').hide();
            $('.round:nth-of-type(13)').show();
            next_action = 7;
        }
    });

//    $("#runRound:nth-of-type(1)").on('click', function () {
//        $('div').css('border', 'solid red 3px');
//
//        $('.results:nth-of-type(2)').show();
//        $('.round:nth-of-type(1)').hide();
//    });
//
//    $("#nextRound:nth-of-type(1)").on('click', function () {
//        $('div').css('border', 'solid orange 3px');
//
//        $('.results:nth-of-type(2)').hide();
//        $('.round:nth-of-type(3)').show();
//    });

//
//    $("#runRound:nth-of-type(2)").on('click',  function(){
//        $('div').css('border', 'solid yellow 3px');
//
//        $('.results:nth-of-type(4)').show();
//        $('.round:nth-of-type(3)').hide();
//        $('.round:nth-of-type(1)').hide();
//
//    });
//
//    $("#nextRound:nth-of-type(2)").on('click',  function(){
//        $('div').css('border', 'solid green 3px');
//
//        $('.results:nth-of-type(4)').hide();
//        $('.round:nth-of-type(5)').show();
//    });
//
//
//    $("#runRound:nth-of-type(3)").on('click',  function(){
//        $('.results:nth-of-type(2)').show();
//        $('.round:nth-of-type(1)').hide();
//    });
//
//    $("#nextRound:nth-of-type(3)").on('click',  function(){
//        $('.results:nth-of-type(2)').hide();
//        $('.round:nth-of-type(3)').show();
//    });
//
//
//    $("#runRound:nth-of-type(4)").on('click',  function(){
//        $('.results:nth-of-type(2)').show();
//        $('.round:nth-of-type(1)').hide();
//    });
//
//    $("#nextRound:nth-of-type(4)").on('click',  function(){
//        $('.results:nth-of-type(2)').hide();
//        $('.round:nth-of-type(3)').show();
//    });
});
