Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60FD54B90E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 14:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731750AbfFSMsV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 08:48:21 -0400
Received: from mail-eopbgr1400103.outbound.protection.outlook.com ([40.107.140.103]:37856
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727244AbfFSMsV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 08:48:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWSyT86+JfXBUEk9jVcQUyqekb/plKEWpUrq6cr+eUc=;
 b=gavJdEXTJy4mDBJ4DnHd8Axl0a0Dm2Sq2Au2CP1GF1CD5KrDJOfl2gXqtdCtUbh2PmPg2XHgBiASn5arg71MTUC3a3CASGVJrGlD05nMoIvwykmIZzrn8tjuUGqePbe/nhigElbnLayF4ItvUGPnXW3mbeVtzg52BYMdMJwfcIg=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1769.jpnprd01.prod.outlook.com (52.133.160.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 19 Jun 2019 12:48:17 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b%7]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 12:48:17 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>
Subject: RE: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add HDMI support
Thread-Topic: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add HDMI support
Thread-Index: AQHVJek7vUy9P93/fEWDP1bpe4SW26ai7NGAgAAAbxA=
Date:   Wed, 19 Jun 2019 12:48:17 +0000
Message-ID: <TY1PR01MB1770B099456BD96D352DF526C0E50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560871119-16570-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190619124131.GB21753@pendragon.ideasonboard.com>
In-Reply-To: <20190619124131.GB21753@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91f4ff9b-55b0-4d17-b65a-08d6f4b4669a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1769;
x-ms-traffictypediagnostic: TY1PR01MB1769:
x-microsoft-antispam-prvs: <TY1PR01MB17699AF85F93A000B2798140C0E50@TY1PR01MB1769.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(376002)(396003)(136003)(39850400004)(346002)(199004)(189003)(478600001)(66946007)(25786009)(53936002)(8676002)(68736007)(6916009)(305945005)(7736002)(486006)(476003)(99286004)(186003)(81166006)(4326008)(6246003)(71200400001)(71190400001)(44832011)(86362001)(14454004)(446003)(14444005)(256004)(7696005)(66476007)(64756008)(53546011)(76176011)(229853002)(6506007)(74316002)(8936002)(6436002)(81156014)(11346002)(102836004)(9686003)(55016002)(66066001)(316002)(3846002)(2906002)(52536014)(54906003)(6116002)(73956011)(5660300002)(33656002)(66556008)(66446008)(26005)(76116006);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1769;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LIRe47gNc5TCa0DpRcOio37MYsN1Nw9NnaKmj9wkv1PMY5Ra4Zwf0UMotRnhyrc9s/HyKC3k8sxC81t393miR75i/3w+ZJ65GfSO3DuwyJAvY8TrRMM1biFz7pGwr/nMA1c1fOKOWxQ3dVbwhZuDASWtcFsK071mScJpUYXMTs04/KoazOUqDLgJhyf/10roEK+eWx1YX3bBKYJ0pKFErnGHZWNsinPOZ7ld+uLyKilv7wUiSBuz0MrGyu1Cb/1lsIo2e3yg1Q+6XDp6EZtfyB0BUzD5QHPqUTCX0s9mG7yU9TdxCv0iinc2MagcftZcbc9TfDXoETr3fNAniA5fxY34MBj2m0bETXMbacqSbZS+ymv6FKdfrD++xdmQRB5iRQCeYpX4gIcA8Od5lfH3kup0NBtUvZLZaxAKfD8yvdw=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f4ff9b-55b0-4d17-b65a-08d6f4b4669a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 12:48:17.1020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1769
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGF1cmVudCwNCg0KPiBGcm9tOiBsaW51eC1yZW5lc2FzLXNvYy1vd25lckB2Z2VyLmtlcm5l
bC5vcmcgPGxpbnV4LXJlbmVzYXMtc29jLW93bmVyQHZnZXIua2VybmVsLm9yZz4gT24gQmVoYWxm
IE9mIExhdXJlbnQgUGluY2hhcnQNCj4gU2VudDogMTkgSnVuZSAyMDE5IDEzOjQyDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggMy8zXSBhcm02NDogZHRzOiByZW5lc2FzOiBoaWhvcGUtY29tbW9uOiBB
ZGQgSERNSSBzdXBwb3J0DQo+IA0KPiBIaSBGYWJyaXppbywNCj4gDQo+IFRoYW5rIHlvdSBmb3Ig
dGhlIHBhdGNoLg0KPiANCj4gT24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDQ6MTg6MzlQTSArMDEw
MCwgRmFicml6aW8gQ2FzdHJvIHdyb3RlOg0KPiA+IEFkZCBIRE1JIHN1cHBvcnQgdG8gdGhlIEhp
SG9wZSBSWi9HMltNTl0gbW90aGVyIGJvYXJkIGNvbW1vbg0KPiA+IGR0c2kuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2Fz
LmNvbT4NCj4gPg0KPiA+IC0tLQ0KPiA+IFBsZWFzZSBub3RlIHRoYXQgdGhpcyBwYXRjaCB3YXMg
dGVzdGVkIHdpdGggYSA0SyBtb25pdG9yIGFuZCBjbWE9OTZNDQo+ID4NCj4gPiAgYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL2hpaG9wZS1jb21tb24uZHRzaSB8IDYyICsrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL2hpaG9wZS1jb21t
b24uZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9oaWhvcGUtY29tbW9uLmR0c2kN
Cj4gPiBpbmRleCA2MjVjM2FhLi5lNzU2OGUxIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvcmVuZXNhcy9oaWhvcGUtY29tbW9uLmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL3JlbmVzYXMvaGlob3BlLWNvbW1vbi5kdHNpDQo+ID4gQEAgLTE3LDYgKzE3LDE4
IEBADQo+ID4gIAkJc3Rkb3V0LXBhdGggPSAic2VyaWFsMDoxMTUyMDBuOCI7DQo+ID4gIAl9Ow0K
PiA+DQo+ID4gKwloZG1pMC1vdXQgew0KPiA+ICsJCWNvbXBhdGlibGUgPSAiaGRtaS1jb25uZWN0
b3IiOw0KPiA+ICsJCWxhYmVsID0gIkhETUkwIE9VVCI7DQo+IA0KPiBJcyB0aGUgbGFiZWwgcGh5
c2ljYWxseSBwcmVzZW50IG9uIHRoZSBkZXZpY2UgKHByaW50ZWQgb24gdGhlIGJvYXJkIG9yDQo+
IHRoZSBjYXNlKSA/DQoNCkkgYW0gYWZyYWlkIGl0J3Mgbm90LiBTaGFsbCBJIHNlbmQgYSB2Mj8g
T3IgcGVyaGFwcyBTaW1vbiBjb3VsZCB0YWtlIGl0IG91dCB3aGlsZSBhcHBseWluZz8NCg0KPiAN
Cj4gQXBhcnQgZnJvbSB0aGF0LCB3aXRob3V0IGFjY2VzcyB0byB0aGUgc2NoZW1hdGljcyBJIGNh
bid0IHJlYWxseSB0ZWxsIGlmDQo+IHRoZSBEVCBpcyBjb3JyZWN0LCBidXQgbm90aGluZyBzdHJp
a2VzIG1lIGFzIHJlYWxseSB3cm9uZywgc28NCg0KSSBkaWRuJ3Qga25vdyB5b3UgaGFkIG5vIGFj
Y2VzcyB0byB0aGUgc2NoZW1hdGljcywgb24gdGhlaXIgd2F5Li4uDQoNClRoYW5rcywNCkZhYg0K
DQo+IA0KPiBBY2tlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVh
c29uYm9hcmQuY29tPg0KPiANCj4gPiArCQl0eXBlID0gImEiOw0KPiA+ICsNCj4gPiArCQlwb3J0
IHsNCj4gPiArCQkJaGRtaTBfY29uOiBlbmRwb2ludCB7DQo+ID4gKwkJCQlyZW1vdGUtZW5kcG9p
bnQgPSA8JnJjYXJfZHdfaGRtaTBfb3V0PjsNCj4gPiArCQkJfTsNCj4gPiArCQl9Ow0KPiA+ICsJ
fTsNCj4gPiArDQo+ID4gIAlsZWRzIHsNCj4gPiAgCQljb21wYXRpYmxlID0gImdwaW8tbGVkcyI7
DQo+ID4NCj4gPiBAQCAtODIsNiArOTQsMzAgQEANCj4gPiAgCQlzdGF0ZXMgPSA8MzMwMDAwMCAx
DQo+ID4gIAkJCSAgMTgwMDAwMCAwPjsNCj4gPiAgCX07DQo+ID4gKw0KPiA+ICsJeDMwMl9jbGs6
IHgzMDItY2xvY2sgew0KPiA+ICsJCWNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOw0KPiA+ICsJ
CSNjbG9jay1jZWxscyA9IDwwPjsNCj4gPiArCQljbG9jay1mcmVxdWVuY3kgPSA8MzMwMDAwMDA+
Ow0KPiA+ICsJfTsNCj4gPiArDQo+ID4gKwl4MzA0X2NsazogeDMwNC1jbG9jayB7DQo+ID4gKwkJ
Y29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7DQo+ID4gKwkJI2Nsb2NrLWNlbGxzID0gPDA+Ow0K
PiA+ICsJCWNsb2NrLWZyZXF1ZW5jeSA9IDwyNTAwMDAwMD47DQo+ID4gKwl9Ow0KPiA+ICt9Ow0K
PiA+ICsNCj4gPiArJmR1IHsNCj4gPiArCWNsb2NrcyA9IDwmY3BnIENQR19NT0QgNzI0PiwNCj4g
PiArCQkgPCZjcGcgQ1BHX01PRCA3MjM+LA0KPiA+ICsJCSA8JmNwZyBDUEdfTU9EIDcyMj4sDQo+
ID4gKwkJIDwmdmVyc2FjbG9jazUgMT4sDQo+ID4gKwkJIDwmeDMwMl9jbGs+LA0KPiA+ICsJCSA8
JnZlcnNhY2xvY2s1IDI+Ow0KPiA+ICsJY2xvY2stbmFtZXMgPSAiZHUuMCIsICJkdS4xIiwgImR1
LjIiLA0KPiA+ICsJCSAgICAgICJkY2xraW4uMCIsICJkY2xraW4uMSIsICJkY2xraW4uMiI7DQo+
ID4gKwlzdGF0dXMgPSAib2theSI7DQo+ID4gIH07DQo+ID4NCj4gPiAgJmVoY2kwIHsNCj4gPiBA
QCAtMTA5LDExICsxNDUsMzcgQEANCj4gPiAgCX07DQo+ID4gIH07DQo+ID4NCj4gPiArJmhkbWkw
IHsNCj4gPiArCXN0YXR1cyA9ICJva2F5IjsNCj4gPiArDQo+ID4gKwlwb3J0cyB7DQo+ID4gKwkJ
cG9ydEAxIHsNCj4gPiArCQkJcmVnID0gPDE+Ow0KPiA+ICsJCQlyY2FyX2R3X2hkbWkwX291dDog
ZW5kcG9pbnQgew0KPiA+ICsJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZoZG1pMF9jb24+Ow0KPiA+
ICsJCQl9Ow0KPiA+ICsJCX07DQo+ID4gKwl9Ow0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAgJmhzdXNi
IHsNCj4gPiAgCWRyX21vZGUgPSAib3RnIjsNCj4gPiAgCXN0YXR1cyA9ICJva2F5IjsNCj4gPiAg
fTsNCj4gPg0KPiA+ICsmaTJjNCB7DQo+ID4gKwljbG9jay1mcmVxdWVuY3kgPSA8NDAwMDAwPjsN
Cj4gPiArCXN0YXR1cyA9ICJva2F5IjsNCj4gPiArDQo+ID4gKwl2ZXJzYWNsb2NrNTogY2xvY2st
Z2VuZXJhdG9yQDZhIHsNCj4gPiArCQljb21wYXRpYmxlID0gImlkdCw1cDQ5djU5MjMiOw0KPiA+
ICsJCXJlZyA9IDwweDZhPjsNCj4gPiArCQkjY2xvY2stY2VsbHMgPSA8MT47DQo+ID4gKwkJY2xv
Y2tzID0gPCZ4MzA0X2Nsaz47DQo+ID4gKwkJY2xvY2stbmFtZXMgPSAieGluIjsNCj4gPiArCX07
DQo+ID4gK307DQo+ID4gKw0KPiA+ICAmb2hjaTAgew0KPiA+ICAJc3RhdHVzID0gIm9rYXkiOw0K
PiA+ICB9Ow0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCg==
