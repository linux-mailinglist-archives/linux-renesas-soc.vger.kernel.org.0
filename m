Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7411EC8C5D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 17:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727160AbfJBPIx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 11:08:53 -0400
Received: from mail-eopbgr1410128.outbound.protection.outlook.com ([40.107.141.128]:8928
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725766AbfJBPIw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 11:08:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=foSXsc8VtNBOAXT4FnxAP0iNhEvBb99b66NpU2FodrFBPbFTt93k98KSG3Lt8MZXx+E1nnvHlcusxszDfX1voso5dKzef9Ta62q8GQ3pY25QjYFSaUihDpZWN0utjV26aahHbbLUxFHZwUf/Ogv2QtznlNYmDpwL4smDN0q9ACAcgZTtw3FQeTqhP7BnEDBwBUJbMzUk8BZbHtixlRo62jA/jox4YIBCE1ePM5rh5CPoPr0rD22wtUBA3PBPYhbcqN4iXS6OGiKF+K6zPKNxT2ZFbRkl5JEG836lZa5opYzu/wMYNqnpYxzErhd+VywYiAQyH+XFiqt9z9cp3/bP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huPxcHnwm6ZXDjOS6nNCtHwlkSzgpT1ZIWGshDn6C6Y=;
 b=eSqp09G65ANoQ3NbpYU4Fy1r5Wfp6Xin2V8ShbiIUoZ6fL1NSp0/Fx3nindX283MMRe7HYHpfLmzYPk4UAKqNZP2vwCFhSsz2D5UM0SfHe29cD3/KHicag0enTUAVw+r3U0uOdjHlIpuFvGh+51iSFEcXvVH8vlYdoXG/Y1vdYpymObxhCjRrBx6RsdVYLqv5d3FyYA1IOfbW0olyqUMMb61a/2t6hYjKT3MukiW4qBZstnSnXcL4aRoJabCkc/sKMyyD+bhi3i+UiWYOdxnBH59jCuxFelmGdCD/Du1dqrKRmvw0HteO1qOF9TfXoh3Gnr3r0cBtXq0nzKyAwUxXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huPxcHnwm6ZXDjOS6nNCtHwlkSzgpT1ZIWGshDn6C6Y=;
 b=UfrLDupLGxyNF/IGC1cufTtoSuBfRudGU5i43SxsGdnd7AzcP4SGVQ3kQwQMxR7O1pCo2gB9ngRLjk0cgPE0G10FkQCZL6ZNihzZgBkG1ke18tsXgcIZ8TFR+wB16InlW20Jh9hLUMVfFTlRMH1p/Vl9W8OxhwaLzVyniXNXUFE=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB2486.jpnprd01.prod.outlook.com (52.134.253.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.16; Wed, 2 Oct 2019 15:08:49 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f%7]) with mapi id 15.20.2305.022; Wed, 2 Oct 2019
 15:08:49 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH v2 9/9] arm64: dts: renesas: Add support for Advantech
 idk-1110wr LVDS panel
Thread-Topic: [PATCH v2 9/9] arm64: dts: renesas: Add support for Advantech
 idk-1110wr LVDS panel
Thread-Index: AQHVeQl2b3I6RDU1w06P9Npjm8yxK6dHaZuAgAAKtjA=
Date:   Wed, 2 Oct 2019 15:08:49 +0000
Message-ID: <OSBPR01MB2103FBC99DD6CF2B004B1BBBB89C0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1570010906-47486-1-git-send-email-biju.das@bp.renesas.com>
 <1570010906-47486-10-git-send-email-biju.das@bp.renesas.com>
 <20191002142947.GE5262@pendragon.ideasonboard.com>
In-Reply-To: <20191002142947.GE5262@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af5d8048-d5eb-4d0e-25dd-08d7474a6e2d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBPR01MB2486:|OSBPR01MB2486:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB2486782BA21D927AA636B3F4B89C0@OSBPR01MB2486.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39850400004)(136003)(346002)(366004)(376002)(396003)(189003)(199004)(51914003)(54906003)(4326008)(3846002)(6116002)(8936002)(25786009)(316002)(229853002)(33656002)(81166006)(81156014)(2906002)(8676002)(107886003)(7736002)(256004)(6246003)(476003)(486006)(478600001)(44832011)(74316002)(11346002)(14454004)(305945005)(71190400001)(71200400001)(6506007)(76176011)(6916009)(86362001)(102836004)(52536014)(76116006)(446003)(66946007)(99286004)(6436002)(66066001)(66556008)(64756008)(66446008)(7696005)(55016002)(66476007)(9686003)(5660300002)(186003)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2486;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +T98IiXUYQg/zVjB+opfGEv+n8SYUroQ3DDVfbqnLeWyBohqYsMGe4zG/+Jg1fyQZxXR2a3sglbfUG06TpvWth+EvQyyT8q4ztgTdylqWaFC6CnvTLvmX923IK+RFs8wf93wbEXg9odzZxIdphaSPLyEAIQ814sQ/aoS7kEO82Po73jiSptLnmnFpUFdhgndLSJQQ6GtS5wL47SLcKovow82Itfvy83oRayZEI/be7Nn9WPXFrG1nTHSfEzIKgKfsbeHY+JnQ1pUu4/fj6p9pTKhE4bDczBw4vH0ifyPHc/PAiJAicaJxqEFDbVHkTq6qx2g0Lr8V8ecDb6W3oj3LXzh29aF7bKG0Ee6Tf3ET5y2LN6NP6BpuzrrfP/6AarRM+pBhoD+OLpaxn433xg5QkxxrZJ5+uIuY99shMhLc2I=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af5d8048-d5eb-4d0e-25dd-08d7474a6e2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 15:08:49.6509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vIFcIa+ytEWsjlUOFBzluuEiuhOUVflRaWwagGER2t8x13C+IGMS9KhalsVPCPbCqYhIlmdOmHOyPgvEf+1UsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2486
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2MiA5LzldIGFybTY0OiBkdHM6IHJlbmVzYXM6IEFkZCBzdXBwb3J0IGZvciBBZHZh
bnRlY2gNCj4gaWRrLTExMTB3ciBMVkRTIHBhbmVsDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gVGhh
bmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBXZWQsIE9jdCAwMiwgMjAxOSBhdCAxMTow
ODoyNkFNICswMTAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9y
dCBmb3IgQWR2YW50ZWNoIGlkay0xMTEwd3IgTFZEUyBwYW5lbC4NCj4gPiBUaGUgSGlIb3BlIFJa
L0cyW01OXSBpcyBhZHZlcnRpc2VkIGFzIGNvbXBhdGlibGUgd2l0aCBwYW5lbCBpZGstMTExMHdy
DQo+ID4gZnJvbSBBZHZhbnRlY2gsIGhvd2V2ZXIgdGhlIHBhbmVsIGlzbid0IHNvbGQgYWxvbmdz
aWRlIHRoZSBib2FyZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRh
c0BicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgVjEtLT5WMg0KPiA+ICAgICogSW5jb3Jw
b3JhdGVkIExhdXJlbnQncyByZXZpZXcgY29tbWVudHMNCj4gPiAtLS0NCj4gPiAgLi4uL3JlbmVz
YXMvcnpnMi1hZHZhbnRlY2gtaWRrLTExMTB3ci1wYW5lbC5kdHNpICAgfCA0Mg0KPiArKysrKysr
KysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspDQo+
ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9y
emcyLWFkdmFudGVjaC1pZGstMTExMHdyLXBhbmVsLmR0c2kNCj4gPg0KPiA+IGRpZmYgLS1naXQN
Cj4gPiBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcyLWFkdmFudGVjaC1pZGstMTEx
MHdyLXBhbmVsLmR0c2kNCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcyLWFk
dmFudGVjaC1pZGstMTExMHdyLXBhbmVsLmR0c2kNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
PiA+IGluZGV4IDAwMDAwMDAuLjRmODc2ZGYNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzItYWR2YW50ZWNoLWlkay0xMTEwd3ItDQo+
IHBhbmVsLmR0c2kNCj4gPiBAQCAtMCwwICsxLDQyIEBADQo+ID4gKy8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4gKy8qDQo+ID4gKyAqIERldmljZSBUcmVlIFNvdXJjZSBm
b3IgdGhlIEFkdmFudGVjaCBpZGstMTExMHdyIExWRFMgcGFuZWwNCj4gPiArY29ubmVjdGVkDQo+
ID4gKyAqIHRvIFJaL0cyIGJvYXJkcw0KPiA+ICsgKg0KPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIw
MTkgUmVuZXNhcyBFbGVjdHJvbmljcyBDb3JwLg0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKy8gew0K
PiA+ICsNCk9LLiBXaWxsIGZpeCB0aGlzLg0KDQo+IE5vIG5lZWQgZm9yIGEgYmxhbmsgbGluZSBo
ZXJlLiBBcGFydCBmcm9tIHRoaXMsDQo+IA0KPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiANCj4gPiArCXBhbmVsLWx2
ZHMgew0KPiA+ICsJCWNvbXBhdGlibGUgPSAiYWR2YW50ZWNoLGlkay0xMTEwd3IiLCAicGFuZWwt
bHZkcyI7DQo+ID4gKw0KPiA+ICsJCXdpZHRoLW1tID0gPDIyMz47DQo+ID4gKwkJaGVpZ2h0LW1t
ID0gPDEyNT47DQo+ID4gKw0KPiA+ICsJCWRhdGEtbWFwcGluZyA9ICJqZWlkYS0yNCI7DQo+ID4g
Kw0KPiA+ICsJCXBhbmVsLXRpbWluZyB7DQo+ID4gKwkJCS8qIDEwMjR4NjAwIEA2MEh6ICovDQo+
ID4gKwkJCWNsb2NrLWZyZXF1ZW5jeSA9IDw1MTIwMDAwMD47DQo+ID4gKwkJCWhhY3RpdmUgPSA8
MTAyND47DQo+ID4gKwkJCXZhY3RpdmUgPSA8NjAwPjsNCj4gPiArCQkJaHN5bmMtbGVuID0gPDI0
MD47DQo+ID4gKwkJCWhmcm9udC1wb3JjaCA9IDw0MD47DQo+ID4gKwkJCWhiYWNrLXBvcmNoID0g
PDQwPjsNCj4gPiArCQkJdmZyb250LXBvcmNoID0gPDE1PjsNCj4gPiArCQkJdmJhY2stcG9yY2gg
PSA8MTA+Ow0KPiA+ICsJCQl2c3luYy1sZW4gPSA8MTA+Ow0KPiA+ICsJCX07DQo+ID4gKw0KPiA+
ICsJCXBvcnQgew0KPiA+ICsJCQlwYW5lbF9pbjogZW5kcG9pbnQgew0KPiA+ICsJCQkJcmVtb3Rl
LWVuZHBvaW50ID0gPCZsdmRzX2Nvbm5lY3Rvcj47DQo+ID4gKwkJCX07DQo+ID4gKwkJfTsNCj4g
PiArCX07DQo+ID4gK307DQo+ID4gKw0KPiA+ICsmbHZkc19jb25uZWN0b3Igew0KPiA+ICsJcmVt
b3RlLWVuZHBvaW50ID0gPCZwYW5lbF9pbj47DQo+ID4gK307DQo+IA0KPiAtLQ0KPiBSZWdhcmRz
LA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K
