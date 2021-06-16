Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 518BB3A970A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jun 2021 12:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232048AbhFPKSR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Jun 2021 06:18:17 -0400
Received: from mail-eopbgr1310123.outbound.protection.outlook.com ([40.107.131.123]:52160
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232013AbhFPKSQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jun 2021 06:18:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLkiS//WO4pOUs53fLhJzD7tYhhHbF8E1awCNsg3wp6pPiL+B6kwQHy0Q8WcG2EE2s3anuC8WVlCCHori0RWiaHjTdk7GD+nAB1g6yDwrVMLhXeULm6VZIwJNjWEOpntzy1ENSWuMYRe9gmyE+cixGn36plL6hiF53JgDqIoNBU9HBCLcjdqe7EwY0bpd+yRH3ESix3xzTmA7UhcH+PX6npvkOlt34Epl2D+HwMMNh5s6dBf0AJDHUlRheuPZyloHUaA5l/3v+SPJbJTTEUMXHN4as5OMQZhNyHcnzjZgMSK4B/CfCJwKxFdY/IdtnhawnPcX7Ce/ozSBodsdLgOAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pC22kGL4aGDHyX08mp3DBfAFNMPA7taGQFO0HK/BlQ=;
 b=HL7btPtuYUNLKOn5Ygcn5lwiDFRu06y8u5obAMD5NDceU6AGpS9nKOLBJUJqPSP0o9XitV5vCUyl4BBiIN6ikAAMCREme6YjPWLKKu0J3TtMrQEzdkl68p56QUbbgDBuRLmpGjKla22HdlmHLkH9itGy98WGwIV1mDasbdmVWEgffCfltgAvTmsC+TKIH763xLCmITMtA9ti5Jd0MzUgF8ga16BkSjLLLkGHa/GzF8Wrzdr7/vrPzITGQAqef4FjNLV5Ec+WbZ9jSfTfFts4UjTAKH3Yn9QdA73+0YsEWQO/cyY9bO4Ccz3tpci3M958jRjfu1puA6kbalZ8usDX2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pC22kGL4aGDHyX08mp3DBfAFNMPA7taGQFO0HK/BlQ=;
 b=njuN/AmED76l/Gaa+fonoQRycn9rRuR1/gLnCC4cOulOIiIg2S5kpA9j+8UkU6pvRN/Qz6oKVTeZIWRVQNwkMHqrr+E3vax4JaJ3bB4Y8m6hlZrQw3d4WqUCHP22kFyexPvDD819i10z/ei5hkhhiwLVEu9L5eaS3Dk84bU+S88=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TY2PR01MB4604.jpnprd01.prod.outlook.com (2603:1096:404:10c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Wed, 16 Jun
 2021 10:16:05 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::d47c:6365:dc20:bb]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::d47c:6365:dc20:bb%3]) with mapi id 15.20.4242.016; Wed, 16 Jun 2021
 10:16:05 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 2/6] drivers: clk: renesas: r9a07g044-cpg: Add USB clocks
Thread-Topic: [PATCH 2/6] drivers: clk: renesas: r9a07g044-cpg: Add USB clocks
Thread-Index: AQHXXsg9QvlIkn27S0WnMNEjGBSsGqsTc30AgAFYS4CAAA3kAIAAAWOAgAABGYCAAAeiAIABjwSg
Date:   Wed, 16 Jun 2021 10:16:05 +0000
Message-ID: <TYCPR01MB5933A751C849B915F2B26D77860F9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20210611134642.24029-1-biju.das.jz@bp.renesas.com>
 <20210611134642.24029-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdXpOGWLMXph9OGeZqZiy33O_y5z2XfAf0YzQgb4q_8+rA@mail.gmail.com>
 <CAMuHMdV=AcCgwJqiEoUyK9cDnyT-arOVSNFS5Z1xxXQ7PeZzkg@mail.gmail.com>
 <YMh3eD55uP3XfEFI@pendragon.ideasonboard.com>
 <CAMuHMdV46wrvUNwhQ11VVutHrw6SmpnQv4S1RiDoL+KKzkUrHA@mail.gmail.com>
 <YMh5jWeONR6s+bwU@pendragon.ideasonboard.com>
 <CAMuHMdXHN-ThgpED0wUcWQjWyinnxQC8Yp_st-CWGpUj6mGmxw@mail.gmail.com>
In-Reply-To: <CAMuHMdXHN-ThgpED0wUcWQjWyinnxQC8Yp_st-CWGpUj6mGmxw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.219.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 087385de-d54e-440c-92f8-08d930afc082
x-ms-traffictypediagnostic: TY2PR01MB4604:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB4604459B184671A323EE22A3860F9@TY2PR01MB4604.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n5KDgu5BY2WwUYzpCSfzkGSsDlOds8WBKF8vS9L3oTboQPj5lJwFL/Ddz2RW+YGilXe1C22x6gLZ0EdUIT0GtOEaEqvMclT2zXVAHTmF1W9oMUq7+Pc95kTwit1OB1NY2/5nbScJDNj3fccqQVYGCb827/UCV7J7/urzYxR9kYs8NAkjPMvRNgFGouyingAkprt3euaSLZBNUV+s7o+oRWSolOBMvvpuDlW3T3clXl/nugcTYNdEltVikq1zD4Afv80DQPw/TjSZf1iPEO/WPn7Ugd9ikr+FhqMKdnEzB2/M5ekQ1eHHJLgnWoHFVVka/OAryW56QxFfmgz7HBop7sysR2zLo8jtBnsamHEtEUxUTEM01mM+IoWKso3zIs86is905CALLPSH0JXS9Z3xjhe/stY7P7WZNCE3bf5W5rfivwgffSMOZVOMf3qzCrT3qy9vp+zX7lpvx50iMksw9GHer4oLHin47oTFfrzI/VvPovt2++G7cj5zrEPCbRF4g7rZk+1vpBCaPwWyzBzLDDdDBHgSQF7tBv0ec/CM4gie6dOIzx699UAohDv+is3+3NeFDRrk5awKAkmMg61QDacTRJMdqvqp+JVJRrgKQTU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(8936002)(7696005)(110136005)(6506007)(54906003)(5660300002)(9686003)(8676002)(4326008)(478600001)(83380400001)(107886003)(53546011)(55016002)(66946007)(316002)(64756008)(66446008)(122000001)(86362001)(66476007)(2906002)(66556008)(186003)(76116006)(38100700002)(33656002)(71200400001)(26005)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXMzc1cweE92cTBienVacUR3WGhIYklFdUNudG1NWTExeGk4UVNvY3NXT0w0?=
 =?utf-8?B?Vm80UWMvdXBpWkU4YmNmbm1vem9qRU5VeGptS3NJWjNhaGR6MTVYYmRIV1ZB?=
 =?utf-8?B?Rng0elJKRVpyQWQ1RnFkSCtXQ0tqN1Y2NnlwbzMwWW1EM1pDNEdSY0xpa0J0?=
 =?utf-8?B?QlhWQTg1dlE0RGg3SlZTMWo1b0xWMlZ3VW5GcVczUktXK2lvOW9NajR4Zy9K?=
 =?utf-8?B?aXNuU0dhbVJNL1BDa2FkSlVKdmpkNURLaGtwSFIrSEt4MSsrYkV3d0pGQkEx?=
 =?utf-8?B?Y1YyRENHN0pVMVVRSVo4WWVLc1Fkb09iZERGU1gzQ1ZLclZIU24zNXlGdHlF?=
 =?utf-8?B?NHZ5OENOUWtMRElYQmQvZUVMc2FLSUJsdkJPcTVqNHlsd1ZzbnV5OURRK1JQ?=
 =?utf-8?B?eEdNdFBabXlkbXlTNDRsTWtwdjdyeitmZ1lwMFZPOE5lWXMzSGNEYk96UW1C?=
 =?utf-8?B?cmRNbHYxRXFmcmVhdTh3NjdYVll4Tm1nRFkvVDZ5TjZoeFdGZks5d2N3NTNa?=
 =?utf-8?B?cVNnNjEwd3d5TkZuZEp1eS9FRUVUeElUTWFObEZPOG5INm9tcnZmSnEva2J5?=
 =?utf-8?B?MXZuSGVMZ0Rtbmk5R2t3TXZQYWR1eEE4NTNzejVPWlVZS0hjM01sQkRaRHpM?=
 =?utf-8?B?WGdrV2tPYmxETlg3cWhUdFJxMnpwSjFLZzBnS1JCcVROVG1oZ29EckQvVlNp?=
 =?utf-8?B?YzYrdFppajhjOE5ra0JmV0pIaXRsT25tQzdJUHRhMWExWm9JUzNMQmpJcm1F?=
 =?utf-8?B?VUJBc3JieG9xWU0xWExtSmNzSmNob2hBWjJWVWFEc1dZc1RhckVVbW9wYmlB?=
 =?utf-8?B?NGZrR2dhNE85V3FWSDVHb0dpSDA5Lyt6YTZSMExQN2FMeWNNTDdmaGorbmlD?=
 =?utf-8?B?ZXZtUU9NRHpZM0x3SDFYMUNBVWNxbXlXc2wrRHZ5UkIwSUE1VjUxMERoajgy?=
 =?utf-8?B?NGl2MlpidTZlK2o2NjNMRU1BeXJXaXZyRzF1ZnJaSCtmaVRBbUN3T01Za0Js?=
 =?utf-8?B?NW43SjhMTUZIRFNPK29FWkRVNGc0SUtCV093Y01DQ0RBdkpCVWt6VUM5RmNm?=
 =?utf-8?B?YmJnR3NEOW4zSksyRldjZ3dCaTdVdXBYNzlnWUpGWDU3OXc5eEUrcVlQWnNM?=
 =?utf-8?B?dmhIKzJvQkI5eG4waUdoaGRDam9zVHhHd1ZFVm42RFFOMXFtaVhhZGc4Ym9H?=
 =?utf-8?B?d3lpRWZVcmNEQWJzc040a0tqb0IwS3RJR3NwYjVtY1BoSjYyNTZJT3dyay84?=
 =?utf-8?B?Mmx1d245SlAyU2FjVFpqS3ZwbmFMbHFRRzBnb1RyZm1ub2FVS216RHAwd1Iy?=
 =?utf-8?B?WHhnUkx1Kzk5SXlKbmdLTXgzYVV1dlVnNWNzUWY5ZW9DNU1zaWxQR0JGUWF0?=
 =?utf-8?B?ZWpvb3gybmpuNFcwRXdLWUcrRGNOdmE2YnVobUF2blFuYUlHQUtteGlZT2hF?=
 =?utf-8?B?Um5MQWF2Nm12M0JUU21JY0U3YXRaR3c2WUZhYUNjVHhWVXJEU2J6NlN5b0hj?=
 =?utf-8?B?SUx4ZW9xZ0FUU2x6NlJVb0ZmWElFRkg2dC9MRUxYK0J1aUxTQTJVemxqUXRJ?=
 =?utf-8?B?VTJJbThOSXJRTGp2cG42ZE9sL1hFTmZ5a2RERFdYUHpCVmdURnJlSG5OQjdJ?=
 =?utf-8?B?VjhGVTdHZlRpTWI4aHpLRGZ0L1FEczNBb2ljM0Z2RDlOVzk4UlVWZi9TbU1N?=
 =?utf-8?B?RVhTTUdxNitaRzNpR2MwbzRRazlwbG90aVFRSWlPZ05KTUtCZFdrc25WRUxW?=
 =?utf-8?Q?JFvGkXgAYrigTAsURArxM60eamsVscDXoK3oPeK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 087385de-d54e-440c-92f8-08d930afc082
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2021 10:16:05.5823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: te/pIaEdIsMpXD23MbCjI/y+2eoeAdNeD5RF6/Pm/ZDWl+zrMJmrLcq8Yp0lhb0+U5IOWhh41SM6Z2MfHQVp8hnM72HlnpxOsKDnCCCv7/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4604
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQgYW5kIExhdXJlbnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQpJIGhh
dmUgZ29uZSB0aHJvdWdoIHRoZSBiZWxvdyBkaXNjdXNzaW9uIGFuZCBhZ3JlZWluZyBmb3IgdHdv
IGNsb2NrIGVudHJpZXMgaW4gZHQgYmluZGluZ3MNCmFuZCBpbXBsZW1lbnQgYSBnYXRlIGZvciBj
b250cm9sbGluZyB0aGlzIGNsb2Nrcy4NCg0KUmVnYXJkcywNCkJpanUNCg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIDIvNl0gZHJpdmVyczogY2xrOiByZW5lc2FzOiByOWEwN2cwNDQtY3BnOiBBZGQg
VVNCDQo+IGNsb2Nrcw0KPiANCj4gSGkgTGF1cmVudCwNCj4gDQo+IE9uIFR1ZSwgSnVuIDE1LCAy
MDIxIGF0IDExOjU3IEFNIExhdXJlbnQgUGluY2hhcnQNCj4gPGxhdXJlbnQucGluY2hhcnRAaWRl
YXNvbmJvYXJkLmNvbT4gd3JvdGU6DQo+ID4gT24gVHVlLCBKdW4gMTUsIDIwMjEgYXQgMTE6NTM6
MzdBTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiA+ID4gT24gVHVlLCBKdW4g
MTUsIDIwMjEgYXQgMTE6NDkgQU0gTGF1cmVudCBQaW5jaGFydA0KPiA+ID4gPGxhdXJlbnQucGlu
Y2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6DQo+ID4gPiA+IE9uIFR1ZSwgSnVuIDE1LCAy
MDIxIGF0IDEwOjU4OjU3QU0gKzAyMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToNCj4gPiA+
ID4gPiBPbiBNb24sIEp1biAxNCwgMjAyMSBhdCAyOjI2IFBNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnRAbGludXgtDQo+IG02OGsub3JnPiB3cm90ZToNCj4gPiA+ID4gPiA+IE9uIEZyaSwgSnVu
IDExLCAyMDIxIGF0IDM6NDYgUE0gQmlqdSBEYXMNCj4gPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gQWRkIGNsb2NrIGVudHJpZXMgZm9yIFVTQnswLDF9
Lg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBM
YWQgUHJhYmhha2FyDQo+ID4gPiA+ID4gPiA+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAu
cmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gVGhhbmtzIGZvciB5b3VyIHBh
dGNoIQ0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNh
cy9yOWEwN2cwNDQtY3BnLmMNCj4gPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNh
cy9yOWEwN2cwNDQtY3BnLmMNCj4gPiA+ID4gPiA+ID4gQEAgLTg4LDYgKzg4LDEyIEBAIHN0YXRp
YyBzdHJ1Y3QgcnpnMmxfbW9kX2Nsaw0KPiByOWEwN2cwNDRfbW9kX2Nsa3NbXSA9IHsNCj4gPiA+
ID4gPiA+ID4gICAgICAgICBERUZfTU9EKCJkbWFjIiwgICAgICAgICBSOUEwN0cwNDRfQ0xLX0RN
QUMsDQo+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUjlBMDdH
MDQ0X0NMS19QMSwNCj4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAweDUyYywgKEJJVCgwKSB8IEJJVCgxKSksDQo+ID4gPiA+ID4gPiA+IChCSVQoMCkgfCBCSVQo
MSkpKSwNCj4gPiA+ID4gPiA+ID4gKyAgICAgICBERUZfTU9EKCJ1c2IwIiwgICAgICAgICBSOUEw
N0cwNDRfQ0xLX1VTQjAsDQo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgUjlBMDdHMDQ0X0NMS19QMSwNCj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAweDU3OCwgKEJJVCgwKSB8IEJJVCgyKSB8DQo+IEJJVCgzKSksIChCSVQo
MCkgfCBCSVQoMikgfCBCSVQoMykpKSwNCj4gPiA+ID4gPiA+ID4gKyAgICAgICBERUZfTU9EKCJ1
c2IxIiwgICAgICAgICBSOUEwN0cwNDRfQ0xLX1VTQjEsDQo+ID4gPiA+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgUjlBMDdHMDQ0X0NMS19QMSwNCj4gPiA+ID4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDU3OCwgKEJJVCgxKSB8IEJJVCgzKSks
DQo+ID4gPiA+ID4gPiA+ICsgKEJJVCgxKSB8IEJJVCgzKSkpLA0KPiA+ID4gPiA+ID4gPiAgICAg
ICAgIERFRl9NT0QoInNjaWYwIiwgICAgICAgIFI5QTA3RzA0NF9DTEtfU0NJRjAsDQo+ID4gPiA+
ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUjlBMDdHMDQ0X0NMS19QMCwN
Cj4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDU4NCwgQklU
KDApLCBCSVQoMCkpLA0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFdoaWxlIHRoZSBhYm92ZSBt
YXRjaGVzIHRoZSBkYXRhc2hlZXQsIEkgc2VlIGEgcHJvYmxlbSB3aXRoDQo+ID4gPiA+ID4gPiB0
aGUgaW1wbGVtZW50YXRpb24uIEFzIEJJVCgzKSBvZiB0aGUNCj4gPiA+ID4gPiA+IENQR197Q0xL
T04sQ0xLTU9OLFJTVH1fVVNCIGlzIHNoYXJlZCBieSB0aGUgdHdvIFVTQjIuMA0KPiA+ID4gPiA+
ID4gY2hhbm5lbHMsIGRpc2FibGluZyBVU0JfUENMSyBvciBhc3NlcnRpbmcgVVNCX1BSRVNFVE4g
d2lsbA0KPiA+ID4gPiA+ID4gYWZmZWN0IGJvdGggY2hhbm5lbHMuICBTbyBpdCBsb29rcyBsaWtl
IHlvdSBuZWVkIHNwZWNpYWwNCj4gaGFuZGxpbmcgdG8gbWFrZSBzdXJlIHRoYXQgZG9lc24ndCBo
YXBwZW4gd2hpbGUgdGhlIG90aGVyIGNoYW5uZWwgaXMgaW4NCj4gdXNlLg0KPiA+ID4gPiA+ID4N
Cj4gPiA+ID4gPiA+IE9yIGFtIEkgbWlzc2luZyBzb21ldGhpbmc/DQo+ID4gPiA+ID4NCj4gPiA+
ID4gPiBJJ20gZ2V0dGluZyB0aGUgaW1wcmVzc2lvbiB3ZSBkbyBoYXZlIHRvIG1vZGVsIHRoZSBp
bmRpdmlkdWFsDQo+ID4gPiA+ID4gYml0cyBhcyBzZXBhcmF0ZSBjbG9ja3MgKGFuZCByZXNldHMp
LiAgVGhhdCB3b3VsZCBzb2x2ZSB0aGUNCj4gPiA+ID4gPiBwcm9ibGVtIHdpdGggdGhlIHNoYXJl
ZCBVU0JfUENMSywgYXMgdGhlIGNsb2NrIGZyYW1ld29yayB3aWxsDQo+ID4gPiA+ID4gdGFrZSBj
YXJlIG9mIGtlZXBpbmcgaXQgZW5hYmxlZCB3aGVuIGF0IGxlYXN0IG9uZSBjaGFubmVsIGlzIGlu
DQo+IHVzZS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEJlc2lkZXMgVVNCLCBTREhJIGhhcyA0IGNs
b2NrIGJpdHMsIHdoaWNoIHdlIGRlZmluaXRlbHkgZG9uJ3QNCj4gPiA+ID4gPiB3YW50IHRvIGNv
bnRyb2wgdG9nZXRoZXIsIGFzIHRoZSBjYXJkIGRldGVjdCBjbG9jayBtdXN0IG5vdCBiZQ0KPiA+
ID4gPiA+IHN0b3BwZWQgd2hpbGUgc3VzcGVuZGVkLg0KPiA+ID4gPiA+IEhvd2V2ZXIsIHRoZSBl
eGNlcHRpb24gdG8gdGhlIHJ1bGUgaXMgRXRoZXJuZXQ6IGVhY2ggY2hhbm5lbCBoYXMNCj4gPiA+
ID4gPiAyIGNsb2NrcywgYnV0IG9ubHkgYSBzaW5nbGUgYml0IHRvIGNvbnRyb2wsIHNvIHRoaXMg
bmVlZHMgYQ0KPiA+ID4gPiA+IGN1c3RvbSBzaW5nbGUtZ2F0ZS1mb3ItZHVhbC1jbG9jayBkcml2
ZXIuDQo+ID4gPiA+DQo+ID4gPiA+IERvZXMgaXQgPyBDYW4ndCB0aGUgc2FtZSBjbG9jayBiZSBy
ZWZlcmVuY2VkIHR3aWNlIGluIERUID8NCj4gPiA+DQo+ID4gPiBZZXMsIHlvdSBjYW4gcmVmZXJl
bmNlIHRoZSBzYW1lIGNsb2NrIHR3aWNlLiBCdXQgd2hhdCdzIHRoZSBwb2ludD8NCj4gPiA+IElm
IHRoZXkncmUgdHdvIGRpZmZlcmVudCBjbG9ja3MsIERUIHNob3VsZCByZWZlcmVuY2UgdHdvIGRp
ZmZlcmVudA0KPiA+ID4gY2xvY2tzLiAgQnV0IHRoZSBzaW5nbGUgYml0IHNob3VsZCBjb3JyZXNw
b25kIHRvIHRoZSBPUmVkIHZhbHVlIG9mDQo+ID4gPiB0aGUgdHdvIGNsb2NrIGVuYWJsZSBzdGF0
ZXMuDQo+ID4gPg0KPiA+ID4gT3IgZG8geW91IG1lYW4gc29tZXRoaW5nIGRpZmZlcmVudD8NCj4g
Pg0KPiA+IElmIHRoZSBkZXZpY2UgaGFzIHR3byBjbG9jayBpbnB1dHMsIEknZCBtb2RlbCB0aGUg
dHdvIGNsb2Nrcw0KPiA+IHNlcGFyYXRlbHkgaW4gdGhlIERUIGJpbmRpbmdzLiBJZiB0aG9zZSB0
d28gY2xvY2tzIGFyZSBnYXRlZCBieSB0aGUNCj4gPiBzYW1lIGJpdCBpbiBhbiBTb0MsIHdlIGhh
dmUgdHdvIG9wdGlvbnMgdG8gbW9kZWwgdGhlIGludGVncmF0aW9uOg0KPiA+DQo+ID4gLSBDcmVh
dGUgYSBkcml2ZXIgdGhhdCByZWdpc3RlcnMgZGlmZmVyZW50IGNsb2NrcyB3aXRoIHRoZSBzYW1l
IGdhdGluZw0KPiA+ICAgYml0LiBXZSdsbCBoYXZlIHR3byBjbG9ja3MgdG8gcmVmZXJlbmNlIGlu
IERULg0KPiANCj4gT0ssIHRoYXQncyB3aGF0IEkgc3VnZ2VzdGVkLg0KPiANCj4gPiAtIE1vZGVs
IGJvdGggY2xvY2tzIGFzIGEgc2luZ2xlIGNsb2NrIGluIHRoZSBjbG9jayBkcml2ZXIsIGFuZCBy
ZWZlcmVuY2UNCj4gPiAgIHRoYXQgY2xvY2sgdHdpY2UgaW4gRFQuIFRoaXMgaXMgc2ltcGxlciwg
YnV0IG9ubHkgd29ya3MgaWYgdGhlDQo+ID4gICBjb25zdW1lciBkb2Vzbid0IG5lZWQgdG8gcXVl
cnkgdGhlIGNsb2NrIHJhdGUuDQo+IA0KPiBNb2RlbGxpbmcgdGhlbSBhcyBhIHNpbmdsZSBjbG9j
ayBpcyBob3cgdGhlIGN1cnJlbnQgUlovRzJMIGNsb2NrIGRyaXZlcg0KPiB3b3VsZCBpbXBsZW1l
bnQgaXQuIEJ1dCB3aHkgYm90aGVyIHJlZmVyZW5jaW5nIGl0IHR3aWNlIGluIERUPw0KPiByZW5l
c2FzLGV0aGVyKi55YW1sIChhc3N1bWluZyB0aGUgRXRoZXJuZXQgYmxvY2sgaXMgY29tcGF0aWJs
ZSkgZG9jdW1lbnRzDQo+IGEgc2luZ2xlIGNsb2NrIG9ubHkgKGlnbm9yaW5nIG9wdGlvbmFsIHJl
ZmNsayksIGFuZCB0aGUgZHJpdmVyIGRvZXNuJ3QNCj4gY2FyZSBhYm91dCB0aGUgY2xvY2sgcmF0
ZS4NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMg
b2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJ
biBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15
c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBq
dXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
