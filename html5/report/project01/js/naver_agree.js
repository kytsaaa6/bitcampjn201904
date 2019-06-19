       $(document).ready(function () {


           // mainbox 클릭 시 이벤트 정의
           // 1. mainbox에 checked 속성을 추가
           // 2. mainbox 가 true 면 subbox 를 모두 true로 변경
           // 3. mainbox 가 false 면 subbox 를 모두 false로 변경
           $('#mainbox').change(function () {

               var chk = $('#mainbox').prop('checked');

               if (chk) {
                   $('.subbox').prop('checked', true);
               } else {
                   $('.subbox').prop('checked', false);
               }
           });

           // subbox 클릭 시 이벤트 정의
           // 1. 각 subbox에 checked 속성을 추가
           // 2. subbox가 하나라도 false 일 경우 mainbox를 체크 해제
           // 3. subbox가 모두 true 일 경우 mainbox도 체크
           $('.subbox').change(function () {

               var sub1 = $('#subbox1').prop('checked');
               var sub2 = $('#subbox2').prop('checked');
               var sub3 = $('#subbox3').prop('checked');
               var sub4 = $('#subbox4').prop('checked');

               if (!sub1 || !sub2 || !sub3 || !sub4) {
                   $('#mainbox').prop('checked', false);
               } else {
                   $('#mainbox').prop('checked', true);
               }

           });

           // 동의 버튼 클릭 시 이벤트 정의
           // 1. sub 박스 중 필수 동의 항목에 checked 속성 추가
           // 2. sub1,2 가 false 이면 해당 메시지를 html에 삽입
           // 3. sub1,2 가 true 이면 회원가입 페이지로 이동
           $('#agree').click(function () {

               var sub1 = $('#subbox1').prop('checked');
               var sub2 = $('#subbox2').prop('checked');

               if (!(sub1 && sub2)) {
                   var msg = '네이버 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.'
                   $('#msg').html(msg);
               } else {
                   location.href = 'naver_join.html';
               }

           });



       });
