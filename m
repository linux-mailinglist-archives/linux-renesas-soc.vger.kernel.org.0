Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23A9BE913
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 19:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728748AbfD2RbZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 13:31:25 -0400
Received: from mail-eopbgr1410133.outbound.protection.outlook.com ([40.107.141.133]:41136
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728807AbfD2RbZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 13:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swucM8BOh7f/BWiSuQmaNsmLU6pVebibAtYZxUbTeqc=;
 b=Kw/kCK7qLZ0CK5CwsrwlF9/mNDQogzR7hbiT0enfejSlbodi3eTF58aDXIocI9HRln37B3PRySTFv8eGCnbAOlm2eslSdHgD+hpNbnl4bItZftNb3K2f4BPIQjSKbitG939831a+6SDQNWh72lA4KjGxNRDg+mG2pkokirPhgyY=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1561.jpnprd01.prod.outlook.com (52.133.161.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Mon, 29 Apr 2019 17:31:18 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1835.018; Mon, 29 Apr 2019
 17:31:18 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Marc Zyngier <marc.zyngier@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/5] irqchip: Add Renesas RZ/A1 Interrupt Controller
 driver
Thread-Topic: [PATCH 2/5] irqchip: Add Renesas RZ/A1 Interrupt Controller
 driver
Thread-Index: AQHU/m8PB9wkGP0JyE6XlHkrtJGBYaZS6auAgAAU5ICAAAQ6gIAAXF+A
Date:   Mon, 29 Apr 2019 17:31:18 +0000
Message-ID: <TY1PR01MB15620363F895ACD71CFE77878A390@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190429093631.10799-1-geert+renesas@glider.be>
 <20190429093631.10799-3-geert+renesas@glider.be>
 <f9310d4c-8f9e-a837-3ed3-4d7c294efd3f@arm.com>
 <CAMuHMdU3i7vqs9hd7rfvYH8QtqvwUB5vgsa_fwo5L4E3DQ_d1Q@mail.gmail.com>
 <e6c6dfe7-f67d-90a9-eee5-d30b94c7c978@arm.com>
In-Reply-To: <e6c6dfe7-f67d-90a9-eee5-d30b94c7c978@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d415dc14-bf93-45ca-afa6-08d6ccc87d18
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1561;
x-ms-traffictypediagnostic: TY1PR01MB1561:
x-microsoft-antispam-prvs: <TY1PR01MB15618A1E1A81C110D0CEE12D8A390@TY1PR01MB1561.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39860400002)(136003)(376002)(396003)(346002)(199004)(189003)(53936002)(9686003)(33656002)(66946007)(55016002)(256004)(66556008)(66476007)(71190400001)(71200400001)(64756008)(229853002)(6436002)(68736007)(66446008)(52536014)(73956011)(86362001)(76116006)(4326008)(6246003)(7416002)(2906002)(6506007)(102836004)(76176011)(81166006)(478600001)(81156014)(72206003)(66066001)(14454004)(8676002)(486006)(446003)(305945005)(7696005)(26005)(3846002)(6116002)(8936002)(7736002)(74316002)(25786009)(316002)(54906003)(110136005)(93886005)(5660300002)(186003)(99286004)(476003)(11346002)(97736004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1561;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: myOHj3L3ouM3bcsuBGg7kbXqhK56EkXUwCy+LeWz8Sx0/Y5eYGJUHGNAEXPbHjam6LfGeK/xKyu64VTUeHsGOQX11XkSqwuwXpeO7PAb/YS5V0vrPNhYc111MPLyMhhSbOcfiGBIPd8hnqzqV1oDOFHy3n8w8k66XkyuxC2j0xVpynWrcDki4EHlE0+zcqpSOtljrBCws+evyGJdeB5fbb1FANjAwg6tfyOfcN3zajxe9eL+3AXzoCp1kHrlPX1/wA2vCqRJjEGMw9jzUJjAAx1kRt7bKTs2nON2a5p5mYhZ3Y4HSxtv67bWDz757G5zNpf4UR1soeBRhMQ+sWCI7MkVSi1TZLL0bWgzw+0oKQ0hr8JndI071e2ZmOPIJVgbgtwo+/Y1Xj/6KRFcHKcoh5nFOqDj2hVnz+hwMwJcW2g=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d415dc14-bf93-45ca-afa6-08d6ccc87d18
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 17:31:18.2948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1561
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQgYW5kIE1hcmMsDQoNCkkgdGVzdGVkIEdlZXJ0J3MgcGF0Y2hlcyBvbiBSWi9BMSBh
bmQgUlovQTIgYm9hcmRzIChwdXNoIGJ1dHRvbnMgYW5kIExDRA0KdG91Y2hzY3JlZW4gY29udHJv
bGxlcikuIFdvcmtzIGdyZWF0IQ0KDQokIGNhdCAvcHJvYy9pbnRlcnJ1cHRzDQogNDk6ICAgICAg
IDUwNTAgIGZjZmVmODAwLmludGVycnVwdC1jb250cm9sbGVyICAgMSBMZXZlbCAgICAgZnQ1eDA2
X3RzDQogNTA6ICAgICAgICAgMzIgIGZjZmVmODAwLmludGVycnVwdC1jb250cm9sbGVyICAgMyBF
ZGdlICAgICAgU1cxDQogNTE6ICAgICAgICAgMTIgIGZjZmVmODAwLmludGVycnVwdC1jb250cm9s
bGVyICAgMiBFZGdlICAgICAgU1cyDQogNTI6ICAgICAgICAgMTAgIGZjZmVmODAwLmludGVycnVw
dC1jb250cm9sbGVyICAgNSBFZGdlICAgICAgU1czDQoNCg0KRm9yIFJaL0EyLCBJIHBhdGNoZWQg
dGhlIGRyaXZlci9LY29uZmlnIGFzIGZvbGxvd3M6DQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJlbmVzYXMtcnphMS5jIGIvZHJpdmVycy9pcnFjaGlw
L2lycS1yZW5lc2FzLXJ6YTEuYw0KaW5kZXggNjUxMTAwMTlhZGRhLi44OWE3MjE4NjRmZjkgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJlbmVzYXMtcnphMS5jDQorKysgYi9kcml2
ZXJzL2lycWNoaXAvaXJxLXJlbmVzYXMtcnphMS5jDQpAQCAtMjA2LDcgKzIwNiwxMiBAQCBzdHJ1
Y3QgcnphMV9pcnFjX2luZm8gcnphMV9pcnFjX2luZm8gPSB7DQogICAgICAgIC5naWNfc3BpX2Jh
c2UgPSAwLA0KIH07DQogDQorc3RydWN0IHJ6YTFfaXJxY19pbmZvIHJ6YTJfaXJxY19pbmZvID0g
ew0KKyAgICAgICAuZ2ljX3NwaV9iYXNlID0gNCwNCit9Ow0KKw0KIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkIHJ6YTFfaXJxY19kdF9pZHNbXSA9IHsNCisgICAgICAgeyAuY29tcGF0
aWJsZSA9ICJyZW5lc2FzLHI3czkyMTAtaXJxYyIsICZyemEyX2lycWNfaW5mbyB9LA0KICAgICAg
ICB7IC5jb21wYXRpYmxlID0gInJlbmVzYXMscnphMS1pcnFjIiwgJnJ6YTFfaXJxY19pbmZvIH0s
DQogICAgICAgIHt9LA0KIH07DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvcmVuZXNhcy9LY29u
ZmlnIGIvZHJpdmVycy9zb2MvcmVuZXNhcy9LY29uZmlnDQppbmRleCAxNDQ4YjZkYmNkYjIuLjRh
YjdkY2ZkNmEyZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvc29jL3JlbmVzYXMvS2NvbmZpZw0KKysr
IGIvZHJpdmVycy9zb2MvcmVuZXNhcy9LY29uZmlnDQpAQCAtNjUsNiArNjUsNyBAQCBjb25maWcg
QVJDSF9SN1M5MjEwDQogICAgICAgIGJvb2wgIlJaL0EyIChSN1M5MjEwKSINCiAgICAgICAgc2Vs
ZWN0IFBNDQogICAgICAgIHNlbGVjdCBQTV9HRU5FUklDX0RPTUFJTlMNCisgICAgICAgc2VsZWN0
IFJFTkVTQVNfUlpBMV9JUlFDDQogICAgICAgIHNlbGVjdCBSRU5FU0FTX09TVE0NCiANCiBjb25m
aWcgQVJDSF9SOEE3M0E0DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCg0KSG93ZXZlciwgYXMgcGVyOg0KDQoN
Ck9uIE1vbiwgQXByIDI5LCAyMDE5LCBNYXJjIFp5bmdpZXIgd3JvdGU6DQo+ID4+PiArc3RydWN0
IHJ6YTFfaXJxY19pbmZvIHJ6YTFfaXJxY19pbmZvID0gew0KPiA+Pj4gKyAgICAgLmdpY19zcGlf
YmFzZSA9IDAsDQo+ID4+PiArfTsNCj4gPj4NCj4gPj4gVG8gYW5zd2VyIHlvdXIgcXVlc3Rpb24g
aW4gdGhlIGNvdmVyIGxldHRlciwgSSdkIHJhdGhlciB0aGlzIGNhbWUgZnJvbQ0KPiA+PiBEVC4g
QW5kIG90aGVyd2lzZSwgaXQgc2hvdWxkIGJlIGJlIHN0YXRpYy4NCj4gPg0KPiA+IChPb3BzLCBm
b3JnZXQgdGhlICJzdGF0aWMgY29uc3QiKQ0KPiA+DQo+ID4gVXNpbmcgYSBjdXN0b20gcHJvcGVy
dHksIG9yIGRlcml2ZWQgZnJvbSA4IGludGVycnVwdCBzcGVjaWZpZXJzIGluIHRoZQ0KPiA+IGlu
dGVycnVwdHMgcHJvcGVydHk/DQo+IA0KPiBBIGN1c3RvbSBwcm9wZXJ0eSBpcyBmaW5lIGJ5IG1l
IChldmVyeWJvZHkgZG9lcyB0aGF0IGFueXdheSkuDQoNCg0KSSdsbCByZS10ZXN0IGFmdGVyIHYy
IG9mIHRoZSBwYXRjaCB3aGVuIGdpY19zcGlfYmFzZSBtb3ZlcyB0byBEVC4NCg0KDQoNCklmIHlv
dSB3YW50IHRvIGFkZCBSWi9BMiBpbnRvIHRoaXMgc2VyaWVzIHRvIGdldCBpdCBhbGwgZG9uZSBh
dCBvbmNlLCANCkknbGwgdGVzdCB0aGF0IGFzIHdlbGwuDQoNCkp1c3Qgbm90ZSB0aGF0IG9uIHRo
ZSBSWi9BMk0gRVZCLCBvbmx5IFNXMyBpcyBjb25uZWN0ZWQgdG8gYW4gaW50ZXJydXB0IA0KcGlu
IChJUlEwKS4NCg0KJnBpbmN0cmwgew0KCS8qIFNXMyA9IElSUTAgKi8NCglrZXlib2FyZF9waW5z
OiBrZXlib2FyZCB7DQoJCXBpbm11eCA9IDxSWkEyX1BJTk1VWChQT1JUSiwgMSwgNik+OwkvKiBJ
UlEwICovDQoJfTsNCn07DQoNCi8gew0KCWtleWJvYXJkIHsNCgkJY29tcGF0aWJsZSA9ICJncGlv
LWtleXMiOw0KDQoJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQoJCXBpbmN0cmwtMCA9IDwm
a2V5Ym9hcmRfcGlucz47DQoNCgkJa2V5LTMgew0KCQkJaW50ZXJydXB0LXBhcmVudCA9IDwmaXJx
Yz47DQoJCQlpbnRlcnJ1cHRzID0gPDAgSVJRX1RZUEVfRURHRV9CT1RIPjsNCgkJCWxpbnV4LGNv
ZGUgPSA8S0VZXzM+Ow0KCQkJbGFiZWwgPSAiU1czIjsNCgkJCXdha2V1cC1zb3VyY2U7DQoJCX07
DQoJfTsNCn07DQoNCg0KDQpDaHJpcw0KDQo=
