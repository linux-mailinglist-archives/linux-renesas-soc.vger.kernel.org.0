Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56C3BC98B9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2019 08:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbfJCG7G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Oct 2019 02:59:06 -0400
Received: from mail-eopbgr1410115.outbound.protection.outlook.com ([40.107.141.115]:11090
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726048AbfJCG7G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Oct 2019 02:59:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKIU8gbwVkXF8gw330tEVmy1XpyFwKLrSyGkbtV2gAQ5CulqjQFMrB7pR7cCcT1mRIyl19fZNatflhyHkg80mlShz3Z/EUajeZUVt70SGtT5ewQl08dZyHWl+UOJnFNnmwcSMdKAPIm4jamiUGzDsU0ZrZM/jdy7QmnYSCy1BrvRkj82sER7xiHNJvuPfBFtJz68kAiKKiHb+PC8gkV+47BknjCw5eqTLdOT8HYZ0/neFEqHMo/5HPWil3DgRC/ec/cBZJj5RU4tD7F+MJ8j0aayklOodWgOJ9WLF5pSbX7b6r4gCfuTMr24GRtNOJiuxoy0TfUuVAw7UjomxY0ZaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+FjEsQiV2Iivui+tYsssuBwNZgLqlHC+ReVY1M/LJo=;
 b=AFfgl5TyjdpwGeJr+BcNbPxgtLKmBZbBM+iTWKPxIM32F3O4W8vCdOzmh8MaZzcGPfKR2zXhenriTfynRZIaEmfPALmq3mm8l65PAeuSdxtXaF39kUnwyEFlhLb4vcpr3+NNxYmdoIo3LYA0LFWYki8QjuwA8PLp10d+3sXkifiLsRruBB3bLn32cg2HtwgzmSc+z041hER5xt2lx9prFCT4ynNPsKX0zh3ckNRplEohiXNOZwl5p26UVAdmpH2HHkAXLNkaInJt7rOtE0mn9UszM9n5CWXWaJNpy4G7hqPGEEQnJh7JLeKqAkPQ9/DKHocAZxop3xpUHyDUK0Ft4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+FjEsQiV2Iivui+tYsssuBwNZgLqlHC+ReVY1M/LJo=;
 b=n3H5I6PORpdxgFxIX+6hiC27ng0ONCGVnf5NfRlZvIkIQrqLuKc2q38hlKGOnYI6gDJTe5LqkeXFqYKoZJ8oJjYIeJeGMC9TzT7R0o5cFoaojvWCP41k53FSQbh4zEHTdJhzfeAt2zE6FdxVEyu7xxnx8sy8M6f+5oth6S8X9xc=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB2023.jpnprd01.prod.outlook.com (52.134.243.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 06:59:02 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f%7]) with mapi id 15.20.2305.022; Thu, 3 Oct 2019
 06:59:02 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a774b1 CMT
 support
Thread-Topic: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a774b1 CMT
 support
Thread-Index: AQHVchsy9YYAaMwKvEWMepy4B2mVP6dIXKcAgAAplGCAAAQcgIAAAUdw
Date:   Thu, 3 Oct 2019 06:59:02 +0000
Message-ID: <OSBPR01MB210385AC1DFB9D0C9329D237B89F0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1569248907-62107-1-git-send-email-biju.das@bp.renesas.com>
 <df05997f-e9c5-d226-68cd-6f1274995688@linaro.org>
 <OSBPR01MB21036A4E612729D5C5709E7BB89F0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdURzHLLC+0KsuBBdRShUDnfD8fPQcfo3kUctt1AxGFkzg@mail.gmail.com>
In-Reply-To: <CAMuHMdURzHLLC+0KsuBBdRShUDnfD8fPQcfo3kUctt1AxGFkzg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53c44c55-5509-492e-ec23-08d747cf2c61
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBPR01MB2023:|OSBPR01MB2023:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB20238B186D26C790C4B1AB29B89F0@OSBPR01MB2023.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:386;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(51914003)(189003)(199004)(86362001)(71200400001)(54906003)(66946007)(6506007)(71190400001)(3846002)(99286004)(81166006)(81156014)(7736002)(305945005)(25786009)(74316002)(4326008)(8936002)(14444005)(55016002)(6246003)(6916009)(9686003)(52536014)(64756008)(256004)(33656002)(2906002)(8676002)(478600001)(76176011)(6116002)(53546011)(66476007)(229853002)(26005)(7696005)(14454004)(186003)(102836004)(316002)(446003)(5660300002)(476003)(76116006)(11346002)(66446008)(66066001)(486006)(66556008)(44832011)(6436002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2023;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XLIVvrToCcSQ5G1R76WPyvcHfsvj2tXeeHJnZmDQ5+vdeqIEYqtOnczv2wPxTWbTzk0YLk+KWLjkY4WIMcFyuzsTsHih6iL+QeR2yzZYnTtM2z2W5kd3fwGJnFAlUjjbH7al8jvbPehPnSPMclGgJTsNLiaiOUX0hmOTY2MBMnJypKzKJdQCUbpxC7WTw7SbuAHlpnSQ0xDNgEz5tgq9tyrx31NNFUiFBRSPPa3T+Rt9O8Yt5Ah0pr0IY5dnc/bpVu+SBunZG612SX+lIuj0uvAYDHBgHCKeyke9UPqGEf8e+1opVBj73nHVbN57/WrfywEFY/c/9B6SGmp9CLKUOMl6WdzNB5qvuGTGwi4WVLZ1oSDdW0PUdHzvHKbYMRHm+aSx4Xp+/Kxn6aO9G6zEwPGCh9NlCnvpFBu/wg9UIIs=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c44c55-5509-492e-ec23-08d747cf2c61
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 06:59:02.3032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YOOiWSEU9orIJFwd1s6OP1wdH8bKEL/++KQHzBTZBtoZRwT8CYhzkV/HelZmVAj3z7hfhAVjw5kY85/BkmPrEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2023
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIGR0LWJpbmRpbmdzOiB0aW1lcjogcmVuZXNhcywgY210OiBEb2N1bWVudCByOGE3NzRi
MQ0KPiBDTVQgc3VwcG9ydA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFRodSwgT2N0IDMsIDIw
MTkgYXQgODozOSBBTSBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0K
PiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHQtYmluZGluZ3M6IHRpbWVyOiByZW5lc2FzLCBj
bXQ6IERvY3VtZW50DQo+ID4gPiByOGE3NzRiMSBDTVQgc3VwcG9ydA0KPiA+ID4NCj4gPiA+IE9u
IDIzLzA5LzIwMTkgMTY6MjgsIEJpanUgRGFzIHdyb3RlOg0KPiA+ID4gPiBEb2N1bWVudCBTb0Mg
c3BlY2lmaWMgYmluZGluZ3MgZm9yIFJaL0cyTiAocjhhNzc0YjEpIFNvQy4NCj4gPiA+ID4NCj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzQGJwLnJlbmVzYXMuY29tPg0K
PiA+ID4gPiAtLS0NCj4gPiA+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90
aW1lci9yZW5lc2FzLGNtdC50eHQgfCAyICsrDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQNCj4gPiA+ID4gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvcmVuZXNhcyxjbXQudHh0DQo+ID4g
PiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3JlbmVzYXMsY210
LnR4dA0KPiA+ID4gPiBpbmRleCBjNTIyMGJjLi43YjFmNDU0IDEwMDY0NA0KPiA+ID4gPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvcmVuZXNhcyxjbXQudHh0
DQo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9y
ZW5lc2FzLGNtdC50eHQNCj4gPiA+ID4gQEAgLTMyLDYgKzMyLDggQEAgUmVxdWlyZWQgUHJvcGVy
dGllczoNCj4gPiA+ID4gICAgICAtICJyZW5lc2FzLHI4YTc3NDcwLWNtdDEiIGZvciB0aGUgNDgt
Yml0IENNVDEgZGV2aWNlIGluY2x1ZGVkDQo+ID4gPiA+IGluDQo+ID4gPiByOGE3NzQ3MC4NCj4g
PiA+ID4gICAgICAtICJyZW5lc2FzLHI4YTc3NGExLWNtdDAiIGZvciB0aGUgMzItYml0IENNVDAg
ZGV2aWNlIGluY2x1ZGVkDQo+ID4gPiA+IGluDQo+ID4gPiByOGE3NzRhMS4NCj4gPiA+ID4gICAg
ICAtICJyZW5lc2FzLHI4YTc3NGExLWNtdDEiIGZvciB0aGUgNDgtYml0IENNVDEgZGV2aWNlIGlu
Y2x1ZGVkDQo+ID4gPiA+IGluDQo+ID4gPiByOGE3NzRhMS4NCj4gPiA+ID4gKyAgICAtICJyZW5l
c2FzLHI4YTc3NGIxLWNtdDAiIGZvciB0aGUgMzItYml0IENNVDAgZGV2aWNlIGluY2x1ZGVkDQo+
ID4gPiA+ICsgaW4NCj4gPiA+IHI4YTc3NGIxLg0KPiA+ID4gPiArICAgIC0gInJlbmVzYXMscjhh
Nzc0YjEtY210MSIgZm9yIHRoZSA0OC1iaXQgQ01UMSBkZXZpY2UgaW5jbHVkZWQNCj4gPiA+ID4g
KyBpbg0KPiANCj4gIkNNVCBkZXZpY2VzIiwgY2ZyLiBjb21taXQgMWJlOGM5ZmQyYWM5YWQ3MyAo
ImR0LWJpbmRpbmdzOiB0aW1lcjogcmVuZXNhcywNCj4gY210OiBVcGRhdGUgUi1DYXIgR2VuMyBD
TVQxIHVzYWdlIikuDQoNCk9LLiBXaWxsIGNoYW5nZSB0aGlzLg0KDQo+ID4gPiByOGE3NzRiMS4N
Cj4gPiA+ID4gICAgICAtICJyZW5lc2FzLHI4YTc3NGMwLWNtdDAiIGZvciB0aGUgMzItYml0IENN
VDAgZGV2aWNlIGluY2x1ZGVkDQo+ID4gPiA+IGluDQo+ID4gPiByOGE3NzRjMC4NCj4gPiA+ID4g
ICAgICAtICJyZW5lc2FzLHI4YTc3NGMwLWNtdDEiIGZvciB0aGUgNDgtYml0IENNVDEgZGV2aWNl
IGluY2x1ZGVkDQo+ID4gPiA+IGluDQo+ID4gPiByOGE3NzRjMC4NCj4gPiA+ID4gICAgICAtICJy
ZW5lc2FzLHI4YTc3OTAtY210MCIgZm9yIHRoZSAzMi1iaXQgQ01UMCBkZXZpY2UgaW5jbHVkZWQg
aW4NCj4gcjhhNzc5MC4NCj4gPiA+ID4NCj4gPiA+DQo+ID4gPiBUaGUgcGF0Y2ggZG9lcyBub3Qg
YXBwbHkgb24gdGlwL3RpbWVycw0KPiA+DQo+ID4gT0suIEkgd2lsbCByZWJhc2Ugb24gdG9wIG9m
IHRpcC90aW1lcnMgYW5kIHdpbGwgc2VuZCBWMi4NCg0KUmVnYXJkcywNCkJpanUNCg==
