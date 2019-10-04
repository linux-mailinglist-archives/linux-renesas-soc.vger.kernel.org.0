Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F29ECB476
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2019 08:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731738AbfJDGZu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Oct 2019 02:25:50 -0400
Received: from mail-eopbgr1410090.outbound.protection.outlook.com ([40.107.141.90]:62713
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730645AbfJDGZu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Oct 2019 02:25:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKXkyhN56zDM+sPZRRaJFGKMjrTpqN6c+J1XBmR/a/xcPFL5o/daZPj9mGZWp4KkqTDN68SI60EtKDLIQCJx2qBdBdCKmswLvRcZIaf9H0jZ2a1jsiUAa3xy6mBBgmKFJYg4wmVh0UKjIDvHj7EppoK/Wyzb8RLhWpdxUJpOETmX0T8wjnwvaxRa0r5IRsrulpszaA2GiQADzs0AyTHuzYwMxu1JUx/f1x+V8rRrRkVBAljP97R6OHkTw81S4Uh62LyIDtmS9unjBkTmelHXt1Nfz/G9bFxAC7qQ62Xr/bNW9AnH9CaPSWozHeF/MLBM8lIHr3Xw57wk57ackqJH3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Do8z0Dp2vhGz7bHrF2JM//+gbbB6y5YUHSvxyHfCLRY=;
 b=eNKEtyR1GcWJ4AlL61RnRNx8xQA6jPbJJC6y9yUlQVcl2LWua9tyrN5vsyflVW0I+wKG/FABCNr0olGX0QZcvsvVVbIFtWbgJTqD80OBlXYFu0l+FDWvbwO4Ii6bVRVMmzVsWc9N5oBBB0j8hj1/I2rCQMuj/eDJUFRhID2FTfGDAKP3YcxfsTwZhGlKcU+tGbtGKk8pIPrDl6GeWcqUMFRw4NpLA/0snrWG9bF/3zhxh8WScReulPgtNAUxDG5YR5c4C/XY0pxeI20Z7sRxTNAY6JqMRovocMGMU5l2lb7g+IgRNr6AByIkVr4gWFPQ40qOCUJtoiSJkGPc9qDqcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Do8z0Dp2vhGz7bHrF2JM//+gbbB6y5YUHSvxyHfCLRY=;
 b=nltpaNAZPIRmBX4o7xgFl6kJ5zCrbSbaPMvbSE8L22VubNBB1A5E7KyiLayR+qn82Iz5wEZyNLqdxvm/N9H6E0pwnjntixoyEGJGDVVjk0qDJ4sRItgU9v2sDl7bQUtONR198pD4xxltwHbFH1NXWTjf2g3DYNV1flFD1H27KFE=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3910.jpnprd01.prod.outlook.com (20.178.97.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 06:25:06 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f%7]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 06:25:06 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>
Subject: RE: [PATCH] mmc: renesas_sdhi_internal_dmac: Add r8a774b1 support
Thread-Topic: [PATCH] mmc: renesas_sdhi_internal_dmac: Add r8a774b1 support
Thread-Index: AQHVcqQwVUdoU56Bi06ox7Sw0gSDmqc+BhQAgAAM8rCAAAqBAIABH8mQgArVvbA=
Date:   Fri, 4 Oct 2019 06:25:05 +0000
Message-ID: <OSBPR01MB21039338C4101BDF113E728FB89E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1569307744-42479-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdUsLCciw7KFudSC7pRqfwwaGH5iJSgv906kY342V+6ocQ@mail.gmail.com>
 <OSBPR01MB21036B8294382D1A7A50816BB8860@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdXq1BaNSrOTqUkE34kS6i1kyEXLXe=S5pMdRiEvkD4fvw@mail.gmail.com>
 <OSBPR01MB210339B59E1B57FFDB00038AB8810@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB210339B59E1B57FFDB00038AB8810@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dac6c464-7fac-46b4-377a-08d74893992b
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBPR01MB3910:|OSBPR01MB3910:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB3910326EC5D965395F91D6ECB89E0@OSBPR01MB3910.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(199004)(189003)(51914003)(5660300002)(54906003)(6246003)(74316002)(478600001)(7736002)(76116006)(6116002)(305945005)(64756008)(86362001)(66446008)(66946007)(66476007)(66556008)(71190400001)(71200400001)(66066001)(316002)(52536014)(4326008)(110136005)(446003)(486006)(99286004)(44832011)(476003)(26005)(53546011)(6506007)(33656002)(7696005)(11346002)(256004)(186003)(76176011)(25786009)(55016002)(9686003)(2906002)(229853002)(6436002)(6306002)(966005)(14454004)(3846002)(81166006)(81156014)(8676002)(8936002)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3910;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G5GpPxWNa9bpvJlhsJGQ1rwSuheiww+QJzH7eleT3OxBuFXO46pG6eZlYyBgMAzMLd11FQ3YE8jGdNjsTtSqUHqLMCCP6U07FR2g9XOfjHdi6BrKRoJOQbg+/usdRms6Vn2GGTNJPdVl1k56DQ5TnZTMMDXjqJdJ+A3r15zVlKKtcUxewjs+9iK//lTB/68O6mDeuktEqStnCXSWz/m5lFgNplE6CKVO5w1OwQJ7I0+XMD4AeYTzMxtR7NMx31KmV0QFHpVz5JeUDPymUAqgwW+VTd0nxxvda5DPy1+fccGEhPFEqLq+xll1levm6QwixNkb/rf8NdllNEgfsSfyujngZvFB5c7llzFW0SAHr+K726mk/Pn0TWBkuhc+DqiyIK/Qjd9OpEO81+3fyfwqeFFjTVeZC0423G0EHknJBIEMC2kAPeJzkcvhpkEhnkOhFKHY+uWvxVS7D/1jzNZP/g==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dac6c464-7fac-46b4-377a-08d74893992b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 06:25:05.8086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BcBtFdyEloK/ZFpVx4/guX+nnWIgbrRJj3mxmKcD7Tsw3sQ8smz3/B/cnUBG8RdG6lQiBjCuroGDnAWIqDgM3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3910
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQpIaSBHZWVydCBhbmQgV29sZnJhbSwNCg0KQXJlIHlvdSBoYXBweSB3aXRoIHRoaXMgcGF0Y2g/
IFBsZWFzZSBsZXQgbWUga25vdy4NCg0KUmVnYXJkcywNCkJpanUNCg0KPiBTdWJqZWN0OiBSRTog
W1BBVENIXSBtbWM6IHJlbmVzYXNfc2RoaV9pbnRlcm5hbF9kbWFjOiBBZGQgcjhhNzc0YjENCj4g
c3VwcG9ydA0KPiANCj4gSGkgR2VlcnQsDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4N
Cj4gDQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gbW1jOiByZW5lc2FzX3NkaGlfaW50ZXJuYWxf
ZG1hYzogQWRkIHI4YTc3NGIxDQo+ID4gc3VwcG9ydA0KPiA+DQo+ID4gSGkgQmlqdSwNCj4gPg0K
PiA+IE9uIFRodSwgU2VwIDI2LCAyMDE5IGF0IDU6MTEgUE0gQmlqdSBEYXMgPGJpanUuZGFzQGJw
LnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gbW1j
OiByZW5lc2FzX3NkaGlfaW50ZXJuYWxfZG1hYzogQWRkIHI4YTc3NGIxDQo+ID4gPiA+IHN1cHBv
cnQgT24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgODo0OSBBTSBCaWp1IERhcw0KPiA+IDxiaWp1LmRh
c0BicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gVGhpcyBwYXRjaCBhZGRzIFNESEkg
c3VwcG9ydCBmb3IgUlovRzJOIChSOEE3NzRCMSkgU29DLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4g
PiA+IC0tLQ0KPiA+ID4gPiA+ICBkcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaV9pbnRlcm5h
bF9kbWFjLmMgfCAxICsNCj4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9yZW5l
c2FzX3NkaGlfaW50ZXJuYWxfZG1hYy5jDQo+ID4gPiA+ID4gYi9kcml2ZXJzL21tYy9ob3N0L3Jl
bmVzYXNfc2RoaV9pbnRlcm5hbF9kbWFjLmMNCj4gPiA+ID4gPiBpbmRleCA3NTFmZTkxLi43YzYw
MjBlIDEwMDY0NA0KPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvcmVuZXNhc19zZGhp
X2ludGVybmFsX2RtYWMuYw0KPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3QvcmVuZXNh
c19zZGhpX2ludGVybmFsX2RtYWMuYw0KPiA+ID4gPiA+IEBAIC0zMDgsNiArMzA4LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBzb2NfZGV2aWNlX2F0dHJpYnV0ZQ0KPiA+ID4gPiBzb2Nfd2hpdGVs
aXN0W10gPSB7DQo+ID4gPiA+ID4gICAgICAgICAgIC5kYXRhID0gKHZvaWQgKilCSVQoU0RISV9J
TlRFUk5BTF9ETUFDX09ORV9SWF9PTkxZKSB9LA0KPiA+ID4gPiA+ICAgICAgICAgLyogZ2VuZXJp
YyBvbmVzICovDQo+ID4gPiA+ID4gICAgICAgICB7IC5zb2NfaWQgPSAicjhhNzc0YTEiIH0sDQo+
ID4gPiA+ID4gKyAgICAgICB7IC5zb2NfaWQgPSAicjhhNzc0YjEiIH0sDQo+ID4gPiA+ID4gICAg
ICAgICB7IC5zb2NfaWQgPSAicjhhNzc0YzAiIH0sDQo+ID4gPiA+ID4gICAgICAgICB7IC5zb2Nf
aWQgPSAicjhhNzc0NzAiIH0sDQo+ID4gPiA+ID4gICAgICAgICB7IC5zb2NfaWQgPSAicjhhNzc5
NSIgfSwNCj4gPiA+ID4NCj4gPiA+ID4gSXMgdGhpcyBzdWZmaWNpZW50Pw0KPiA+ID4gPiBEbyB5
b3UgbmVlZCBhIHR1bmluZyBxdWlyayBlbnRyeSBpbiBzZGhpX3F1aXJrc19tYXRjaFtdPw0KPiA+
ID4NCj4gPiA+IERvIHlvdSBtZWFuIHRoZSAgInF1aXJrcy0+bWFudWFsX2NhbGlicmF0aW9uIiAg
YXMgbWVudGlvbmVkIGluIHRoZQ0KPiA+ID4gYmVsb3cNCj4gPiBwYXRjaCA/DQo+ID4gPg0KPiA+
ID4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTAyNDEzMS8NCj4gPg0KPiA+
IEV4YWN0bHkuIElzIFJaL0cyTiBhZmZlY3RlZD8NCj4gDQo+IE5vLiBSWi9HMk4gaXMgbm90IGFm
ZmVjdGVkLiAgSSBoYXZlIGVuYWJsZWQgSFM0MDAgbW9kZSBvbiBSWi9HMk4gYm9hcmQNCj4gYW5k
IHdpdGhvdXQgdGhpcyBwYXRjaCBpdCB3b3JrcyBmaW5lLg0KPiANCj4gTm90ZTotDQo+ICBJIGFs
c28gdGVzdGVkIHdpdGggcXVpcmsgZW50cnkgYWRkZWQgaW4gc2RoaV9xdWlya3NfbWF0Y2guICBU
aGF0IGlzIGFsc28gd29ya3MNCj4gZmluZS4NCj4gDQo+IFJlZ2FyZHMsDQo+IEJpanUNCg==
