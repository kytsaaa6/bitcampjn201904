$(document).ready(function () {


    // 포커스/포커스아웃 시에 테두리 색 변경
    $('input').focus(function () {
        $(this).css('border', '1px solid #08A600');
    });
    $('input').focusout(function () {
        $(this).css('border', '1px solid #DDD');
    });

    // 공통 변수
    var reqMsg = '필수정보 입니다.';


    // ID 입력창 블러 이벤트 정의
    // 1. 공백 블러 시 '필수정보입니다.' 메시지 및 css 삽입
    // 2. 정규식 결과 false 일 경우 메시지 삽입
    // 3. 모두 통과할 경우 통과 메시지 삽입
    $('#uId').blur(function () {
        var uId = $(this).val();
        var idReg = /[a-z0-9_-]{5,20}/;
        var msgField = $('#idMsg');
        var Msg = '5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.';
        var ChkMsg = '멋진 아이디네요!';
        if (uId.length < 1) {
            msgField.html(reqMsg).css('color', 'red');
        } else if (!idReg.test(uId)) {
            msgField.html(Msg).css('color', 'red');
        } else {
            msgField.html(ChkMsg).css('color', '#08A600');
        }
    });

    // PW 입력창 블러 이벤트 정의
    $('#uPw').blur(function () {
        var uPw = $(this).val();
        var pwReg = /^((?=.*[a-zA-Z])|(?=.*\d)|(?=.*\W)).{8,16}$/;
        var msgField = $('#pwMsg');
        var Msg = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.';
        var ChkMsg = '안전';
        if (uPw.length < 1) {
            msgField.html(reqMsg).css('color', 'red');
        } else if (!pwReg.test(uPw)) {
            msgField.html(Msg).css('color', 'red');
        } else {
            msgField.html(ChkMsg).css('color', '#08A600');
        }
    });

    // PW 재입력창 블러 이벤트 정의
    // 1. 공백 블러 시 '필수정보입니다.' 메시지 및 css 삽입
    // 2. PW1, PW2 값이 다를 경우 메시지 삽입
    // 3. PW1, PW2 일치할 경우 통과 메시지 삽입
    $('#uPw2').blur(function () {
        var uPw1 = $('#uPw').val();
        var uPw2 = $(this).val();
        var msgField = $('#pwMsg2');
        var Msg = '비밀번호가 일치하지 않습니다.';
        var ChkMsg = '일치';
        if (uPw2.length < 1) {
            msgField.html(reqMsg).css('color', 'red');
        } else if (uPw1 != uPw2) {
            msgField.html(Msg).css('color', 'red');
        } else {
            msgField.html(ChkMsg).css('color', '#08A600');
        }
    });

    // Name 입력창 블러 이벤트 정의
    $('#uName').blur(function () {
        var uName = $(this).val();
        var nameReg = /[a-zA-Z가-힣]{2,20}/;
        var msgField = $('#nameMsg');
        var Msg = '한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)';

        if (uName.length < 1) {
            msgField.html(reqMsg).css('color', 'red');
        } else if (!nameReg.test(uName)) {
            msgField.html(Msg).css('color', 'red');
        } else {
            msgField.empty();
        }
    });

    // 년도 입력창 블러 이벤트 정의
    $('#year').blur(function () {
        var year = $(this).val();
        var yearReg = /^(19[0-9][0-9]|20[0-1][0-9])$/;
        var msgField = $('#birMsg');
        var Msg = '태어난 년도 4자리를 정확하게 입력하세요.';

        if (year.length < 1 || !yearReg.test(year)) {
            msgField.html(Msg).css('color', 'red');
        } else {
            msgField.empty();
        }
    });

    // 월 선택창 체인지 이벤트 정의
    // 1. 선택 안할 경우 메시지 삽입
    // 2. 선택 되었으면 메시지 제거
    $('#month').change(function () {
        var day = $(this).val();
        var msgField = $('#birMsg');
        var Msg = '태어난 월(달)을 선택하세요.';
        if (day == '월') {
            msgField.html(Msg).css('color', 'red');
        } else {
            msgField.empty();
        }
    });

    // 일 입력창 블러 이벤트 정의
    $('#day').blur(function () {
        var day = $(this).val();
        var dayReg = /^(0[1-9]|[12][0-9]|3[0-1])$/;
        var msgField = $('#birMsg');
        var Msg = '태어난 일(날짜) 2자리를 정확하게 입력하세요.';

        if (day.length < 1 || !dayReg.test(day)) {
            msgField.html(Msg).css('color', 'red');
        } else {
            msgField.empty();
        }
    });

    // 성별 선택창 체인지 이벤트 정의
    // 1. 선택 안할 경우 메시지 삽입
    // 2. 선택 되었으면 메시지 제거
    $('#gender').change(function () {
        var gender = $(this).val();
        var msgField = $('#gMsg');
        var Msg = '성별을 선택하세요.';

        if (gender == '성별') {
            msgField.html(Msg).css('color', 'red');
        } else {
            msgField.empty();
        }
    });

    // 이메일 입력창 블러 이벤트 정의
    $('#uEmail').blur(function () {
        var uEmail = $('#uEmail').val();
        var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        var msgField = $('#emailMsg');
        var Msg = '이메일 주소를 다시 확인해주세요.';

        if (uEmail.length < 1) {
            return;
        } else if (!emailReg.test(uEmail)) {
            msgField.html(Msg).css('color', 'red');
        } else {
            msgField.empty();
        }
    });

    // 인증번호 받기 클릭시 휴대폰 번호에 대한 유효성 검사
    $('#cBtn').click(function () {
        var uPhone = $('#cInput').val();
        var phoneReg = /^\d{3}-\d{3,4}-\d{4}$/;
        var msgField = $('#pMsg');
        var Msg = '형식에 맞지 않는 번호입니다.';

        if (uPhone.length < 1) {
            msgField.html(reqMsg).css('color', 'red');
        } else if (!phoneReg.test(uPhone)) {
            msgField.html(Msg).css('color', 'red');
        } else {
            msgField.empty();

        }
    });


        // 보류...
        $('#joinForm').submit(function () {
            alert('가입완료');
        });


});
