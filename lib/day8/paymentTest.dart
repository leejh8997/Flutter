import 'package:flutter/material.dart';
import 'package:portone_flutter/iamport_payment.dart';
import 'package:portone_flutter/model/payment_data.dart';
import 'package:test2/day8/payment.dart';

void main() {
  runApp(PaymentMain());
}

class PaymentMain extends StatelessWidget {
  const PaymentMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaymentExam(),
    );
  }
}

class PaymentExam extends StatelessWidget {
  const PaymentExam({super.key});

  void payment(context) {
    IamportPayment(
      appBar: new AppBar(
        title: new Text('포트원 V1 결제'),
      ),
/* 웹뷰 로딩 컴포넌트 */
      initialChild: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/iamport-logo.png'),
              Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
/* [필수입력] 가맹점 식별코드 */
      userCode: 'iamport',
/* [필수입력] 결제 데이터 */
      data: PaymentData(
          pg: 'html5_inicis',                                          // PG사
          payMethod: 'card',                                           // 결제수단
          name: '포트원 V1 결제데이터 분석',                                  // 주문명
          merchantUid: 'mid_${DateTime.now().millisecondsSinceEpoch}', // 주문번호
          amount: 39000,                                               // 결제금액
          buyerName: '홍길동',                                           // 구매자 이름
          buyerTel: '01012345678',                                     // 구매자 연락처
          buyerEmail: 'example@naver.com',                             // 구매자 이메일
          buyerAddr: '서울시 강남구 신사동 661-16',                         // 구매자 주소
          buyerPostcode: '06018',                                      // 구매자 우편번호
          appScheme: 'example',                                        // 앱 URL scheme
          cardQuota : [2,3]                                            //결제창 UI 내 할부개월수 제한
      ),
/* [필수입력] 콜백 함수 */
      callback: (Map<String, String> result) {
        Navigator.pushReplacementNamed(
          context,
          '/result',
          arguments: result,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("결제"),),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, 
                  MaterialPageRoute(
                    builder: (context) => Payment(),
                  )
              );
              payment(context);

            },
            child: Text("결제")
        ),
      ),
    );
  }
}
