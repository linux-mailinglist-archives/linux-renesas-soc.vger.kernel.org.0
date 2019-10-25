Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36115E411A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2019 03:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389098AbfJYBgF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Oct 2019 21:36:05 -0400
Received: from mail-eopbgr1410094.outbound.protection.outlook.com ([40.107.141.94]:29971
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730006AbfJYBgF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Oct 2019 21:36:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ghc5N+OQmunt3Sxngf1DOl9XD5HgG8r+up2Xp0pcUlMCtl6LfyJo6Ufs4Q+1GUDjP8dzEROwRCor1UTg48eFqCIY+18eBFzBOTglgIf9ydsRSWokZtRFYGDUUhkLM0ryEga348lNTBp8971cT1oPrnwnh28o8JnaWuVuM6+A8cTzdBy2rxuz29dlilxN2vgfbBwcWtYG+l8nSInxbkET+9AVmFSkdbzKJAp6uJV9JNDzEGuJj3sK5n0HOgMbkaC5Ak5sRaAPOXaDOr0mRqAJ0vIwwlsNghFeRA3oOQPVqPKk8hpA1znPYC6FD+ZeDZHLxmEALI36c6yCVjEb0qTbiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tZkQCDT0hJYLRK2jbxnKYm/OyeTylOSQMUflPgMbMQ=;
 b=mijPjmH3kdvmngP85+PCQOH9Ijs04lkJmckOGr1JQSDiFpNN+wFjqfoGCmVeiKAM2VrxtLZUT+Dt7wMGtHQ0Ko3a5raXLH9Owq1HmSp/+E36utvWQu1es/9YW4GeOrScJUZsC5nqcYEX/tps5Vt6i4yBjPfa6yQN+1yGmHS1CSWGIWppTn8nlxgxaW8U20BZGChwfjQ7xjyVjq8cY+hbnPEACaDzspOLel8lEQy366RX+Rxa3gdMAifcreahAjegDyhEurJ2JEPE8MH935miHDygbdowKay+AWU6a7izkl0ZiHssn+AhBmqxlqEGFGPwwJw/nijHHCVrqUEvL3xqYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tZkQCDT0hJYLRK2jbxnKYm/OyeTylOSQMUflPgMbMQ=;
 b=P+pw3Vck8VXEWtjFtvgCdN9KnJi5esjPf+vUvFe7ROXGWqJLKx3/5wjBuooM8g3LKrLT9TccIiWWV+J7KkyJgS9ndTNJxim9f4otToQTqBWNpXrcYYfmtOpjVPgyvJKlEKjqnjDbQQeRf82PM09y794M8FQ4OjiR+TaSB1n+8nY=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2910.jpnprd01.prod.outlook.com (20.177.105.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Fri, 25 Oct 2019 01:36:00 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2387.025; Fri, 25 Oct 2019
 01:36:00 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/3] clk: renesas: rcar-usb2-clock-sel: Add multiple
 clocks management
Thread-Topic: [PATCH 2/3] clk: renesas: rcar-usb2-clock-sel: Add multiple
 clocks management
Thread-Index: AQHVilyQBno/7qP88EeW+nLHX4y1PKdpqV2AgADp/1A=
Date:   Fri, 25 Oct 2019 01:36:00 +0000
Message-ID: <TYAPR01MB4544D5F2A77FBBA7B0AF7EBDD8650@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1571915821-1620-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1571915821-1620-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdU=58w=4A0WcqytFfyV_Q11BgYaDNsMsA8Z15mnm--ang@mail.gmail.com>
In-Reply-To: <CAMuHMdU=58w=4A0WcqytFfyV_Q11BgYaDNsMsA8Z15mnm--ang@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5054a1bf-2f2d-47b9-7423-08d758ebb121
x-ms-traffictypediagnostic: TYAPR01MB2910:
x-microsoft-antispam-prvs: <TYAPR01MB29106F0979C9E718748881D3D8650@TYAPR01MB2910.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(199004)(189003)(74316002)(305945005)(66066001)(99286004)(86362001)(7696005)(54906003)(76176011)(7736002)(102836004)(6506007)(316002)(26005)(186003)(81156014)(8676002)(64756008)(66446008)(81166006)(76116006)(8936002)(33656002)(486006)(476003)(52536014)(66556008)(25786009)(4326008)(229853002)(478600001)(6246003)(71190400001)(71200400001)(6436002)(11346002)(55016002)(446003)(9686003)(66476007)(3846002)(66946007)(6116002)(2906002)(256004)(6916009)(14454004)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2910;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zYU9n0gSC1GbeUSFG4LH/OJHCroYeMogapNXEgFwF6TqJo+VTOj7F4aGmuY2eKTglnvKQ/ffGn77ktIlG4o7TOlK0a7dlDFA1oyEfMUYQH+HeaPVTkvYvkw7jpAXg3zoknpG6itvg457pqlcr5GgPCkdil/wk2N134Nt9ECQmdossqpmmxAwJ6v6fjID6LZ0JA35eBhBZVs4FnB3F42ieqjWpz19JO17luYufrx2JQhR7Qe9MoI5uocoesEr6H0gsG6/Nz3WJyhgcZFuLznCREildgY9bO1/LdRubAE36IEVqIBqqaS70E0ZbNUGzzylyq0V6rR2/0MmfxqK8hm3RxfEadmwo4mf8BGnox0gN2yT5Jw6M0T5Ri95i14vQD0z/ZOo9J2ivipEyzzzjUwGwZDblauooaoUJu0w0VIyh2cWM/FftxjVwzyVvCUc4dEv
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5054a1bf-2f2d-47b9-7423-08d758ebb121
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 01:36:00.7063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I8iCYcZko/UYsVg/2v8az+NVLkfHwjTan0OX/Zf9FZPrnLmrYzlTZqYlL+TtDi8ehIZd0LAdueTLl99ssFeSr6yzWC87mozJkghLoonHWyAZ5vFkpDLYtJMhwWL0zPQx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2910
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgY29tbWVudHMhDQoNCj4gRnJvbTog
R2VlcnQgVXl0dGVyaG9ldmVuLCBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAyNCwgMjAxOSA4OjM1
IFBNDQo8c25pcD4NCj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3JjYXItdXNiMi1jbG9j
ay1zZWwuYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcmNhci11c2IyLWNsb2NrLXNl
bC5jDQo+ID4gQEAgLTUzLDE0ICs2MCwzMiBAQCBzdGF0aWMgdm9pZCB1c2IyX2Nsb2NrX3NlbF9k
aXNhYmxlX2V4dGFsX29ubHkoc3RydWN0IHVzYjJfY2xvY2tfc2VsX3ByaXYgKnByaXYpDQo+ID4N
Cj4gPiAgc3RhdGljIGludCB1c2IyX2Nsb2NrX3NlbF9lbmFibGUoc3RydWN0IGNsa19odyAqaHcp
DQo+ID4gIHsNCj4gPiAtICAgICAgIHVzYjJfY2xvY2tfc2VsX2VuYWJsZV9leHRhbF9vbmx5KHRv
X3ByaXYoaHcpKTsNCj4gPiArICAgICAgIHN0cnVjdCB1c2IyX2Nsb2NrX3NlbF9wcml2ICpwcml2
ID0gdG9fcHJpdihodyk7DQo+ID4gKyAgICAgICBpbnQgaSwgcmV0Ow0KPiA+ICsNCj4gPiArICAg
ICAgIGZvciAoaSA9IDA7IGkgPCBDTEtfTlVNOyBpKyspIHsNCj4gPiArICAgICAgICAgICAgICAg
cmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKHByaXYtPmNsa3NbaV0pOw0KPiA+ICsgICAgICAgICAg
ICAgICBpZiAocmV0KSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgd2hpbGUgKC0taSA+
PSAwKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2xrX2Rpc2FibGVfdW5w
cmVwYXJlKHByaXYtPmNsa3NbaV0pOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biByZXQ7DQo+ID4gKyAgICAgICAgICAgICAgIH0NCj4gPiArICAgICAgIH0NCj4gDQo+IFlvdSBj
YW4gdXNlIHRoZSBjbGtfYnVsa18qIEFQSXMsIGluc3RlYWQgb2Ygb3Blbi1jb2RpbmcgdGhlIHNh
bWUNCj4gb3BlcmF0aW9uLg0KDQpJIGRpZG4ndCBrbm93IHN1Y2ggQVBJcy4gSSdsbCBmaXggaXQu
DQoNCj4gPiBAQCAtMTMxLDYgKzE1NiwxNCBAQCBzdGF0aWMgaW50IHJjYXJfdXNiMl9jbG9ja19z
ZWxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgICAgICAgIHBtX3J1
bnRpbWVfZW5hYmxlKGRldik7DQo+ID4gICAgICAgICBwbV9ydW50aW1lX2dldF9zeW5jKGRldik7
DQo+IA0KPiBwbV9ydW50aW1lX2dldF9zeW5jKCkgd2lsbCBoYXZlIGFscmVhZHkgZW5hYmxlZCB0
aGUgZmlyc3QgbW9kdWxlIGNsb2NrIGxpc3RlZCBpbg0KPiB0aGUgRFQgImNsb2NrcyIgcHJvcGVy
dHkuDQo+IA0KPiBJZiB5b3Ugd2FudCB0aGUgZHJpdmVyIHRvIG1hbmFnZSBhbGwgY2xvY2tzIGl0
c2VsZiwgcGVyaGFwcyB0aGUgUE0gUnVudGltZQ0KPiBjYWxscyBzaG91bGQgYmUgZHJvcHBlZD8N
Cg0KSSdtIHRoaW5raW5nIFBNIFJ1bnRpbWUgY2FsbHMgYXJlIHJlbGF0ZWQgdG8gcG93ZXIgZG9t
YWluIGNvbnRyb2wgc28gdGhhdCB3ZSBjYW5ub3QNCmRyb3AgaXQuIE9yLCBzaW5jZSB0aGUgaGFy
ZHdhcmUgaXMgdGhlIEFsd2F5cy1vbiBkb21haW4sIGNhbiB3ZSBkcm9wIGl0IGFueXdheT8NCg0K
QmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
