Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2645E17737B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2020 11:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbgCCKId (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Mar 2020 05:08:33 -0500
Received: from mail-eopbgr1410109.outbound.protection.outlook.com ([40.107.141.109]:18764
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727412AbgCCKId (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Mar 2020 05:08:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJzl/YbekRD0gAbsQWpqR5MQQyS3sOu2qc1uT2jjku64/zZH0UH0VhW2hwTapEJU/oxFb6pwGSjytbluWEqDWNm7WsmiFCfEio7x+X3uCoOh1S8M5EiWhhcV/Fw7nVfyrBm2hrk3ImvaRjuBgNTPh+Q69uqS0uk+pLi8cxJd5eFXhbY5Tb8nHUehWODJ49mLUJmfQwIDBNUdmYvOcSMyypPhSbagdhtWdbH9mawT2LBQTzAqYtLo3Q48y/3Ujeq5svPNTXLCdVwImNwscYj6NX+RvA+GONB+xSzsWUFFGOPPggdtztDR763njq9Pmd16xJmxaHOk9cLAC9TgorGKLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhFzxjvVU3imchvjYIaDPvqEeNzLjWvMiwXQBY/CnDY=;
 b=Y5Ss5p95dyABbUhowtYe6Py5g8g/mlRkp4EzvIDU9/1gLLN9R1u1uNd1e7OhHvIOLVcWUUXhJ3Xmd8XhbiGRLqhU6w6B1pTuSZjLcEB66VDP2a1rBMNuf4Yx86zNMchFt5ta+OLC9LDsme+YGwPBEjtCwL57c0apbzMFEfcRUVeHTotfdyeg0PU9qzQtSB4bmeM8dW2cEDC2sQQmPQ7bxs2o2lMk8LhamDfbvkI4OktlPH0X+hrTGZOgH0LPpv0gSRyKXOzUwufIN5G9xT5GVIFqphCHUBbMUVq+NTaU3bM7DbcjSD/rQ4qR/4blvInlNN/3CElyVCQVz2IbjhfG3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhFzxjvVU3imchvjYIaDPvqEeNzLjWvMiwXQBY/CnDY=;
 b=TKUXgOcYbSiKJaiL0l7hr+m9n2yed/Sryhmz6p/xWvkD0RKFZZhnx7+m5rnUKn54yuV/gkkPfQa+DczaeyaYRF499t3lqsPIk9P8MfkVqRZktd9SMDVB/U8FCYZTSwZRkK05iftUq4WeAxsdCB7XJzZI0znGnXr/Y3p/bdYsec4=
Received: from OSAPR01MB5028.jpnprd01.prod.outlook.com (20.179.179.149) by
 OSAPR01MB2466.jpnprd01.prod.outlook.com (52.134.245.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18; Tue, 3 Mar 2020 10:08:26 +0000
Received: from OSAPR01MB5028.jpnprd01.prod.outlook.com
 ([fe80::50c1:d043:233d:2092]) by OSAPR01MB5028.jpnprd01.prod.outlook.com
 ([fe80::50c1:d043:233d:2092%7]) with mapi id 15.20.2772.019; Tue, 3 Mar 2020
 10:08:25 +0000
From:   Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/2] ARM: dts: iwg22d-sodimm: enable LCD panel
Thread-Topic: [PATCH 1/2] ARM: dts: iwg22d-sodimm: enable LCD panel
Thread-Index: AQHV1tOpxdsnCnpdrEettMQX4zG+jKg1gnkAgAFVSyA=
Date:   Tue, 3 Mar 2020 10:08:25 +0000
Message-ID: <OSAPR01MB5028914C89C5B6F87EE12668AEE40@OSAPR01MB5028.jpnprd01.prod.outlook.com>
References: <1580323253-3281-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
 <1580323253-3281-2-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
 <CAMuHMdVDLrE8yu_vhhT=4u58XYPn=OAmf6XwO=qT2n=sxkLHXw@mail.gmail.com>
In-Reply-To: <CAMuHMdVDLrE8yu_vhhT=4u58XYPn=OAmf6XwO=qT2n=sxkLHXw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=marian-cristian.rotariu.rb@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0fde67cf-f1b0-48d8-f905-08d7bf5ad045
x-ms-traffictypediagnostic: OSAPR01MB2466:|OSAPR01MB2466:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB2466F21A9E8CF2F4F5DF8706AEE40@OSAPR01MB2466.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 03319F6FEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(199004)(189003)(26005)(186003)(9686003)(66946007)(66556008)(86362001)(107886003)(52536014)(478600001)(66476007)(76116006)(4326008)(64756008)(66446008)(55016002)(81156014)(81166006)(8676002)(71200400001)(6916009)(2906002)(316002)(5660300002)(53546011)(6506007)(33656002)(7696005)(54906003)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB2466;H:OSAPR01MB5028.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1CrthtbFkLgW2F7H92WjsCc5IpxQh9i1sLakPNWh4C2hmtCRpqKcF5/nRgxbezPzxcrg0eqBCe0ZEBnywF5bW8MwoOnQ2VTz5YBmeyhRxO4iIXnC0jKemKGoXNtLy0c8jJkaSFeOsBBrewH0OTsiaCGFnY89Su3Qu1veRsMeN0/koX8VL3rH1BfIyHZsbLW58gjHKCsnqPlryGNpAfNhQ6N167kY0CzR323d55rAC0xmBzsqZ/MOqCnhXminrJ7UV//S4KHGSq7Dy7Ck2AI96qlKl+folsDpMJ4ciddYyiWRe020Qp4aQ4bjg3nOEu4y0qxF58pLerbhkMjhJn66IbFRsZ/uzzkxH9bMzWVx2dq8H6FeXXCEuOPdg1gjYE2B+9gTizpVUE5LP56qMsiTpo0t1rSyEnks8sbnfXm60EHcRxXN5WDx0QNA/QurXZ4R
x-ms-exchange-antispam-messagedata: DH/x/woj6Nel5l6IRRWQEMuX3yywGQTPzG7+nqpLhlgLFy/cfJgQUDWhlr3oHoalAlPp2PNlt2Lr743NwE9OYu07sF6Ug+oGRgNJ2PhHgtFvQepMGNp+OdLRaF+Q1mEVflUD89U5D25XeD+3kUweCw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fde67cf-f1b0-48d8-f905-08d7bf5ad045
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2020 10:08:25.4825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tatmoa3UAYGhFgXSJZzi4l7HExQX2obtcDPXGW4PT8rarDF2SKUsVeXP/m8KQUP8zI0r3nwg+RymVdSZoe08cK3IaaL27vIq9u+WfL/RhYwgTvFz94QbS0LH2ceXtMZb8gfNaprE258jz9JSBY4vHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2466
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXchDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1t
NjhrLm9yZz4NCj4gU2VudDogMDIgTWFyY2ggMjAyMCAxMzo0MA0KPiBUbzogTWFyaWFuLUNyaXN0
aWFuIFJvdGFyaXUgPG1hcmlhbi1jcmlzdGlhbi5yb3Rhcml1LnJiQGJwLnJlbmVzYXMuY29tPg0K
PiBDYzogTGludXgtUmVuZXNhcyA8bGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnPjsg
Q2hyaXMgUGF0ZXJzb24NCj4gPENocmlzLlBhdGVyc29uMkByZW5lc2FzLmNvbT47IFByYWJoYWth
ciBNYWhhZGV2IExhZA0KPiA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gQVJNOiBkdHM6IGl3ZzIyZC1zb2RpbW06IGVu
YWJsZSBMQ0QgcGFuZWwNCj4gDQo+IEhpIE1hcmlhbi1DcmlzdGlhbiwNCj4gDQo+IE9uIFdlZCwg
SmFuIDI5LCAyMDIwIGF0IDc6NTggUE0gTWFyaWFuLUNyaXN0aWFuIFJvdGFyaXUgPG1hcmlhbi0N
Cj4gY3Jpc3RpYW4ucm90YXJpdS5yYkBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gT24gdGhl
IEdlbmVyaWMgU09ESU1NIERldmVsb3BtZW50IFBsYXRmb3JtIHRoZXJlIGlzIGFuIFJHQiBMQ0Qg
cGFuZWwNCj4gPiBkaXJlY3RseSBjb25uZWN0ZWQgdG8gdGhlIERVIG91dHB1dC4gSXQgdXNlcyB0
aGUgVFBVMCBhcyBiYWNrbGlnaHQsDQo+ID4gb25lIEdQSU8gcHVsbC11cCBjb25maWd1cmF0aW9u
IGZvciBwb3dlciBlbmFibGUsIFJbMjo3XSwgR1syOjddLA0KPiA+IEJbMjo3XSwgVlNZTkMsIEhT
WU5DLCBEVTBfRElTUCBhbmQsIERVMF9DTEsgYXMgaW5wdXRzLg0KPiA+DQo+ID4gVGhlcmUgaXMg
bm8gZW5jb2RlciBiZXR3ZWVuIHRoZSBEVSBhbmQgdGhlIHBhbmVsLCB0aGVyZWZvcmUgdGhlDQo+
ID4gZGVmYXVsdCBjb25uZWN0b3IgZHJpdmVyIGlzIHVzZWQuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBNYXJpYW4tQ3Jpc3RpYW4gUm90YXJpdQ0KPiA+IDxtYXJpYW4tY3Jpc3RpYW4ucm90YXJp
dS5yYkBicC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8cHJh
Ymhha2FyLm1haGFkZXYtDQo+IGxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBm
b3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvcjhhNzc0NS1p
d2cyMmQtc29kaW1tLmR0cw0KPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3I4YTc3NDUtaXdn
MjJkLXNvZGltbS5kdHMNCj4gPiBAQCAtNzksNiArNzksNTIgQEANCj4gPiAgICAgICAgICAgICAg
ICAgc3RhdGVzID0gPDMzMDAwMDAgMQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgMTgw
MDAwMCAwPjsNCj4gPiAgICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgdmNjcV9wYW5lbDog
cmVndWxhdG9yLXZjY3EtcGFuZWwgew0KPiA+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0g
InJlZ3VsYXRvci1maXhlZCI7DQo+ID4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1uYW1lID0g
IlBhbmVsIFZjY1EiOw0KPiA+ICsgICAgICAgICAgICAgICByZWd1bGF0b3ItbWluLW1pY3Jvdm9s
dCA9IDwzMzAwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgcmVndWxhdG9yLW1heC1taWNyb3Zv
bHQgPSA8MzMwMDAwMD47DQo+ID4gKyAgICAgICAgICAgICAgIGdwaW8gPSA8JmdwaW8xIDEzIEdQ
SU9fQUNUSVZFX0xPVz47DQo+ID4gKyAgICAgICAgICAgICAgIGVuYWJsZS1hY3RpdmUtaGlnaDsN
Cj4gPiArICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgYmFja2xpZ2h0IHsNCj4gPiArICAg
ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJwd20tYmFja2xpZ2h0IjsNCj4gPiArICAgICAgICAg
ICAgICAgcHdtcyA9IDwmdHB1IDMgNTAwMDAwMCBHUElPX0FDVElWRV9MT1c+Ow0KPiA+ICsgICAg
ICAgICAgICAgICBicmlnaHRuZXNzLWxldmVscyA9IDwwIDQgOCAxNiAzMiA2NCAxMjggMjU1PjsN
Cj4gPiArICAgICAgICAgICAgICAgZGVmYXVsdC1icmlnaHRuZXNzLWxldmVsID0gPDc+Ow0KPiA+
ICsgICAgICAgICAgICAgICBwaW5jdHJsLTAgPSA8JmJhY2tsaWdodF9waW5zPjsNCj4gPiArICAg
ICAgICAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiArICAgICAgIH07DQo+
ID4gKw0KPiA+ICsgICAgICAgbGNkIHsNCj4gPiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJlZHQsZXRtMDQzMDgwZGg2Z3AiLCAic2ltcGxlLXBhbmVsIjsNCj4gDQo+IEFjY29yZGluZyB0
byB0aGUgbGF0ZXN0IHBhbmVsLXNpbXBsZS55YW1sLCB0aGUgInNpbXBsZS1wYW5lbCIgc2hvdWxk
IGJlDQo+IGRyb3BwZWQuLi4NCkkgd2lsbCBkcm9wICJzaW1wbGUtcGFuZWwiIGluIHYyLg0KDQo+
IA0KPiA+ICsgICAgICAgICAgICAgICBwb3dlci1zdXBwbHkgPSA8JnZjY3FfcGFuZWw+Ow0KPiA+
ICsNCj4gPiArICAgICAgICAgICAgICAgcG9ydHMgew0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHBvcnRAMCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsY2RfaW46
IGVuZHBvaW50IHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmVtb3RlLWVuZHBvaW50ID0gPCZkdV9vdXRfcmdiMD47DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIH07DQo+ID4gKyAg
ICAgICAgICAgICAgIH07DQo+IA0KPiAuLi4gYW5kIHRoZXJlIHNob3VsZCBvbmx5IGJlIGEgc2lu
Z2xlICJwb3J0Ii4NCkluZGVlZCwgSSB3aWxsIGZpeCBpdC4NCg0KPiANCj4gPiArICAgICAgIH07
DQo+ID4gK307DQo+ID4gKw0KPiA+ICsmZHUgew0KPiA+ICsgICAgICAgcGluY3RybC0wID0gPCZk
dTBfcGlucz47DQo+ID4gKyAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiA+ICsN
Cj4gPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiArDQo+ID4gKyAgICAgICBwb3J0cyB7
DQo+ID4gKyAgICAgICAgICAgICAgIHBvcnRAMCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgZW5kcG9pbnQgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3Rl
LWVuZHBvaW50ID0gPCZsY2RfaW4+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIH07DQo+
ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gKyAgICAgICB9Ow0KPiA+ICB9Ow0KPiA+DQo+ID4g
ICZhdmIgew0KPiA+IEBAIC0xNTAsMTEgKzE5NiwyMSBAQA0KPiA+ICAgICAgICAgICAgICAgICBm
dW5jdGlvbiA9ICJhdmIiOw0KPiA+ICAgICAgICAgfTsNCj4gPg0KPiA+ICsgICAgICAgYmFja2xp
Z2h0X3BpbnM6IGJhY2tsaWdodCB7DQo+ID4gKyAgICAgICAgICAgICAgIHJlbmVzYXMsZ3JvdXBz
ID0gInRwdV90bzMiOw0KPiANCj4gQWNjb3JkaW5nIHRvIG15IHNjaGVtYXRpY3MsIERJU1BfQkxf
R1BJTyBpcyBjb25uZWN0ZWQgdG8NCj4gVFBVVE8zX0MoR1AwXzIxKSwgc28gdGhpcyBzaG91bGQg
YmUgInRwdV90bzNfYyIuDQoNClRoaXMgaXMgYSByYXRoZXIgYmlnIG1pc3Rha2UgYXMgSSBkaWQg
bm90IHRlc3QgdGhlIGJyaWdodG5lc3Mgb2YgdGhlIHBhbmVsLg0KSSBoYXZlIG5vdyByZXRlc3Rl
ZCB0aGUgdjIgcGF0Y2ggYW5kIHRoZSB2YXJpb3VzIGxldmVsIG9mIGJyaWdodG5lc3MNCndvcmsg
ZmluZS4gSSB3aWxsIHNlbmQgdGhlIHYyIGluIGEgYml0Lg0KDQpCZXN0IHJlZ2FyZHMsDQpNYXJp
YW4NCg==
