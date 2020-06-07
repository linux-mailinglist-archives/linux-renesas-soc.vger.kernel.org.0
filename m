Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF7421F0D77
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Jun 2020 19:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbgFGRs6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 Jun 2020 13:48:58 -0400
Received: from mail-eopbgr1400097.outbound.protection.outlook.com ([40.107.140.97]:30172
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726683AbgFGRs6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Jun 2020 13:48:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPMApfPFfn8Scdhgsq68940I3bwK2Jq5LN/+rrCNZ0PBIBt++2CPhwZ0XgjTDVbs++sgJ+sCfKJFGcz49QOQhGeR7FYmBhZEhIBaeSQ2VgDnWh4dG9PKEPv2KVthRwvoWzZhU4xeOU5kcHP5bagGaZ1wTI549OQhf+CZfjghugZvkR69pk1KZF1AwcUPy8+6Ya6WbsrSxEVr6UkhGV9JPztO2BItb/nnre3aLGJxu/f/E0Sj6EepLXTJ6UdTN6t54iysx3+rensObupyv+78T1wfe82LNcwOaIkAgOSNMXtOOwuyGrEznzobqRzkfgxOyKmje9G3aUuPDsW1XAGR7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgaZXwqVVLzEX9vQQyq90/oNTxQFG/bVi5nm3EdKfQg=;
 b=S21PQtj1LBy0msareHP7681jcQc0duMfBKM7qfL8FQgmIv6EhA7t5iwvvcgDZ0Ut5BD8+Bv2ea6FuP0v2RrdWF8NvrStkRpZ2Bpd5pvxrZZTsxKUqA2qgdeHrkdCoSg9Utlwsskp9JfQFeB1JsQ09shBtfI4E6BVG+7OFUfb+I7/+zCaOvfh8UEHgZwCuBKV0Nt32a5o/pl2XQCow2ENaEF5d0+ousmTzIXIA7pt8O7gYn6oZoOMiR1VczmPx7nJrLubqYHYS+JAlc/OcVAwLSYipXYpeknEy/n+RKnu2RxE0OW3rvZJO+EG24EnWAOd5wy2GXH9WKeRO63UORVGsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgaZXwqVVLzEX9vQQyq90/oNTxQFG/bVi5nm3EdKfQg=;
 b=Fif8qWwabaKXUhFJaFBdNK85E7dK3PV8E+JqLkHc3f1vdVs+brR4gtlt2HqCd1lyx8b97XHNSEVvM1myJ5X7M75O7/Iq59n3rc4aGN+YUnCXl/whT93m9Ws14wyuxWYtqETjpHoUJffLXOCXWSARpR8izT6F5kkk9EP8BR0Jq04=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (2603:1096:604:45::16)
 by OSBPR01MB2518.jpnprd01.prod.outlook.com (2603:1096:604:21::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Sun, 7 Jun
 2020 17:48:51 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::383a:9fc3:aaa4:d3b]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::383a:9fc3:aaa4:d3b%7]) with mapi id 15.20.3066.023; Sun, 7 Jun 2020
 17:48:51 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add device tree for
 camera DB
Thread-Topic: [PATCH] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add device tree for
 camera DB
Thread-Index: AQHWNCrNBjE0nrbwh0iyp8PGX/N5jajKAP6AgANlWICAABcmAIAAAbFg
Date:   Sun, 7 Jun 2020 17:48:50 +0000
Message-ID: <OSBPR01MB3590DB7106AED22A9C55C081AA840@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1590586141-21006-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX+M+k-JRy1Ps=hRZR=mSuexSQbJ0+Cw1337uO6nak_qQ@mail.gmail.com>
 <CA+V-a8vDVa0DSX_XT=NsmBta4O=v0p_Nn9M5x9N7gw_zc0yoyg@mail.gmail.com>
 <CAMuHMdUpqbzvbm4Dwt3PYB_irzNXERdSnH5KOmO-myo_=r7cAA@mail.gmail.com>
In-Reply-To: <CAMuHMdUpqbzvbm4Dwt3PYB_irzNXERdSnH5KOmO-myo_=r7cAA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a96678af-19b0-48eb-121e-08d80b0b0a12
x-ms-traffictypediagnostic: OSBPR01MB2518:
x-microsoft-antispam-prvs: <OSBPR01MB2518B6AC33C725269713453BAA840@OSBPR01MB2518.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04270EF89C
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ghGafmlbNNUd5Ul7WY/TB6sU80bgGoxZfGyUvg9oFkMo14qpZulz1vAYUxrnEAryO2kO3lJ8Y+GKSX7J/66+GxPZMUUz7Gg/SOBG64mAsx3Icfv3/h7aocb0PJJKttAMm+9gdW4R8X3jCMT1vjiWFS2X6JKQZdqe+DN77+fzD5u64I1AmVjW8yUKhO55gC2DQvzvB2bfbHyEbYvx92XMAMpIccg6wCIO8cxbbXLRJxgxGuF+FYxvR7w4Qix32saVDSFUnyOfnMHBO9Q1qARHnfCBFIOQlvUfdgPhHU5qA9WSCXzy73XgtYFFVQsUNQ6JekLLNZeddewRoSqhQXST8Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(366004)(376002)(39850400004)(346002)(110136005)(316002)(9686003)(55016002)(54906003)(66476007)(64756008)(66556008)(66446008)(71200400001)(66946007)(76116006)(5660300002)(2906002)(53546011)(6506007)(33656002)(7696005)(83380400001)(86362001)(478600001)(52536014)(4326008)(186003)(26005)(8936002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: gU5doDPFUGYSzH41n8ca6NnMxjrQNQBsf6Cqdo/bWjAsnqXnfCsKwuCJUCoZ5z8YvW8/7DUewLsOFlwfwsEZdp13uefy/P9wLl00tkxY2MdfQVBJYRkkUXiDE0E89f7lipHhlSHOMRrHqPxvdQ1eXR+YaWWW6Ss0DGVDeYvdoMWeGY9iu0lO4a3ef8rdnhrBQYZkgZefXGfxFWNWDpAy7ZE7d3Dcv1zRUSMdv5KjEjMdY7akCnmoshkoIJXrZtux20e/lss/1V48t1iJ4j1m1AbwxTuoyBbwHRXLPouHWnh9/tc3p4C/WNt4IrveGJF2+BRYALxtbKOg47XHlAAm54Nnb+FOz2zw0eyLQI08XF5roIOfWtDOk07FcP+gAi3V6th1UeH49gjo2xyrYh9YjGMN8/3pTtUTbV/zMl0sgmgpwxMpdeER5opu9OKS6NWgR/+9wGfLW8+dy/vp/7lpIUqgI4nbZf5+pd71CbiaTNt/hH9i5k/aFdCRA6auVj/p
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a96678af-19b0-48eb-121e-08d80b0b0a12
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2020 17:48:51.0289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gF+V4CJ3tRLPDtcSY1RXiv6P6xjZ3ho5LhYhDiaSCAaNckRkKuA+hLnoHTLQKW3nczWov5b3CPjcPmusAbEKCcrfqRGJ1tJIbXLMryiKPyP+1c4tE+vFxFhdEJEdchKj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2518
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDcgSnVuZSAyMDIw
IDE4OjQyDQo+IFRvOiBMYWQsIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+
DQo+IENjOiBQcmFiaGFrYXIgTWFoYWRldiBMYWQgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBi
cC5yZW5lc2FzLmNvbT47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBNYWdudXMg
RGFtbQ0KPiA8bWFnbnVzLmRhbW1AZ21haWwuY29tPjsgb3BlbiBsaXN0Ok9QRU4gRklSTVdBUkUg
QU5EIEZMQVRURU5FRCBERVZJQ0UgVFJFRSBCSU5ESU5HUyA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5l
bC5vcmc+OyBMaW51eA0KPiBLZXJuZWwgTWFpbGluZyBMaXN0IDxsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnPjsgTGludXgtUmVuZXNhcyA8bGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwu
b3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBBUk06IGR0czogcjhhNzc0Mi1pd2cyMWQtcTct
ZGJjbS1jYTogQWRkIGRldmljZSB0cmVlIGZvciBjYW1lcmEgREINCj4NCj4gSGkgUHJhYmhha2Fy
LA0KPg0KPiBPbiBTdW4sIEp1biA3LCAyMDIwIGF0IDY6MTkgUE0gTGFkLCBQcmFiaGFrYXINCj4g
PHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToNCj4gPiBPbiBGcmksIEp1biA1LCAy
MDIwIGF0IDE6MjcgUE0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4g
d3JvdGU6DQo+ID4gPiBPbiBXZWQsIE1heSAyNywgMjAyMCBhdCAzOjI5IFBNIExhZCBQcmFiaGFr
YXINCj4gPiA+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+IHdyb3Rl
Og0KPiA+ID4gPiBBZGQgc3VwcG9ydCBmb3IgdGhlIGNhbWVyYSBkYXVnaHRlciBib2FyZCB3aGlj
aCBpcyBjb25uZWN0ZWQgdG8NCj4gPiA+ID4gaVdhdmUncyBSWi9HMUggUXNldmVuIGNhcnJpZXIg
Ym9hcmQuIEFsc28gZW5hYmxlIHR0eVNDWzAxMzVdIGFuZA0KPiA+ID4gPiBldGhlcm5ldDEgaW50
ZXJmYWNlcy4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8
cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiBSZXZpZXdl
ZC1ieTogTWFyaWFuLUNyaXN0aWFuIFJvdGFyaXUgPG1hcmlhbi1jcmlzdGlhbi5yb3Rhcml1LnJi
QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4NCj4gPiA+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJo
b2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiA+ID4NCj4gPiA+ID4gLS0tIC9kZXYv
bnVsbA0KPiA+ID4gPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9yOGE3NzQyLWl3ZzIxZC1xNy1k
YmNtLWNhLmR0cw0KPiA+ID4NCj4gPiA+ID4gKyZzY2lmYjEgew0KPiA+ID4gPiArICAgICAgIHBp
bmN0cmwtMCA9IDwmc2NpZmIxX3BpbnM+Ow0KPiA+ID4gPiArICAgICAgIHBpbmN0cmwtbmFtZXMg
PSAiZGVmYXVsdCI7DQo+ID4gPiA+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+ID4NCj4g
PiA+IEJlZm9yZSBJIHF1ZXVlIHRoaXMgaW4gcmVuZXNhcy1kZXZlbCBmb3IgdjUuOSwgSSBoYXZl
IG9uIHF1ZXN0aW9uOg0KPiA+ID4gQXMgdGhpcyBwb3J0IGNhcnJpZXMgUlRTL0NUUyBzaWduYWxz
LCBwZXJoYXBzIHlvdSB3YW50IHRvIGFkZA0KPiA+ID4NCj4gPiA+ICAgICBydHMtZ3Bpb3MgPSA8
JmdwaW80IDIxIEdQSU9fQUNUSVZFX0xPVz47DQo+ID4gPiAgICAgY3RzLWdwaW9zID0gPCZncGlv
NCAxNyBHUElPX0FDVElWRV9MT1c+Ow0KPiA+ID4NCj4gPiBBYWhhIHRoZSB1c2VyIG1hbnVhbCBt
ZW50aW9uZWQgUlRTL0NUUyB3YXNuJ3QgY29ubmVjdGVkLCBidXQgSSB0ZXN0ZWQNCj4gPiB0aGlz
IHdpdGggdGhlIGFib3ZlIHdoaWNoIGRpc3Byb3ZlcyB0aGUgRG9jLiBTaGFsbCBJIHBvc3QgaXQg
YXMgYQ0KPg0KPiBSVFMvQ1RTIGFyZSBpbmRlZWQgbm90IGNvbm5lY3RlZCB0byB0aGUgZGVkaWNh
dGVkIFJUUy9DVFMgcGlucyBvZg0KPiBTQ0lGQjEsIHNvIHRoZSBkb2N1bWVudGF0aW9uIGlzIHJp
Z2h0Lg0KPiBIb3dldmVyLCB0aGUgcGlucyBvbiB0aGUgc2VyaWFsIHBvcnQgY29ubmVjdG9yIGNh
biBiZSB1c2VkIGFzIEdQSU9zLA0KPiBoZW5jZSB0aGV5IGNhbiBiZSB1c2VkIHdpdGggc29mdHdh
cmUtY29udHJvbGxlZCBSVFMvQ1RTLg0KPg0KPiA+IHNlcGFyYXRlIHBhdGNoIG9yIHBvc3QgYSB2
MiBpbmNsdWRpbmcgaXQuDQo+DQo+IFVwIHRvIHlvdSwgSSBjYW4gaGFuZGxlIGJvdGguDQo+DQpJ
IHNoYWxsIHBvc3QgYSB2Mi4NCg0KQ2hlZXJzLA0KLS1QcmFiaGFrYXINCg0KPiBHcntvZXRqZSxl
ZXRpbmd9cywNCj4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4NCj4gLS0NCj4g
R2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAt
LSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPg0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdp
dGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4g
SSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29t
ZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcw0KDQoNClJlbmVzYXMgRWxlY3Ryb25pY3MgRXVyb3BlIEdtYkgsIEdlc2No
YWVmdHNmdWVocmVyL1ByZXNpZGVudDogQ2Fyc3RlbiBKYXVjaCwgU2l0eiBkZXIgR2VzZWxsc2No
YWZ0L1JlZ2lzdGVyZWQgb2ZmaWNlOiBEdWVzc2VsZG9yZiwgQXJjYWRpYXN0cmFzc2UgMTAsIDQw
NDcyIER1ZXNzZWxkb3JmLCBHZXJtYW55LCBIYW5kZWxzcmVnaXN0ZXIvQ29tbWVyY2lhbCBSZWdp
c3RlcjogRHVlc3NlbGRvcmYsIEhSQiAzNzA4IFVTdC1JRE5yLi9UYXggaWRlbnRpZmljYXRpb24g
bm8uOiBERSAxMTkzNTM0MDYgV0VFRS1SZWcuLU5yLi9XRUVFIHJlZy4gbm8uOiBERSAxNDk3ODY0
Nw0K
