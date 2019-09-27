Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C60CC0250
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2019 11:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfI0J2L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Sep 2019 05:28:11 -0400
Received: from mail-eopbgr1410100.outbound.protection.outlook.com ([40.107.141.100]:39264
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725890AbfI0J2L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Sep 2019 05:28:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMlgl5KMnTkiCDk5pfCV2QR0mgtjc9L1cSKMgUQrAy17/ZXjz0xO/WCJYSOeYkYt4kDJyn+z75DZeJd0OBKx4uqS25rdyoHLS6bjuZEqTqn5FqmebGkXlYCoXDYxpkjQuJLKceOiD/x7kr1CBtzHIs9em1NOuxhSu6cPXnyf4TvxJNqJqGY7jVFsbFXtd7GaymusUrF7C4AgKn3uHmLO9l8SYqzjgc9PIf01AqdKHoOa2d+wHpdh1d5l5WQGFZ7y95oQMjiJSMqlE2ZfnG97AqY8L7LVT35o91boDs/C/W3BrnneOusSCgP4USYYDnbjcol4/ooQKVLwzoOOSQyd2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sChrIM6QmmaAjJiMJQcAd1LYeqJ4szkpW/ZHzqXF8Y=;
 b=cTkG65NH6rF2hfi6NOhlXCGWWi6TD8UFzjg05MyM0xcIkMVH5Chn/Atkj10qDWktieHYTlT1poJfGrLUIK59fDaxRv6cbNYZAUQDpO6712Kj1Te9gUZBityoV1G5BCRA7yYXszAh5Cea8yQU1+nVZNaNVOY1crGk6SN9chACGELRUPw92+Vyb5ZoMluY4QAx2NFkv1SDiw91lhmjTR0OJVrDsZCAgTgV8bCXxnfpsebnHfEVVNIMuN5RqOLGCh0382gdkLrZvqCxh4NM4Lj6/3/ODbZ6wa/YTSKQntrhmPoWLOWY9lHNx/GBz/Ff7RMxukRd/pWZ44RKfzNpeh+EyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sChrIM6QmmaAjJiMJQcAd1LYeqJ4szkpW/ZHzqXF8Y=;
 b=iSYgpeImBh0aUHNFEPrKwfLGZS7RO/qul0VAZ0zmYq2irostqN/onpqscr9A2iUfEdts9NMHxCxUSjXOen4ZNw5F1i6Au6aJvCGzyOHQrvuPyo55dniRhZxCwdhZd8D0QYOHQXBG7lWuQwLTNjg9F1Lh2SSqslzA9ai1UB7zLgA=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB2375.jpnprd01.prod.outlook.com (52.134.254.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 27 Sep 2019 09:28:07 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::746b:49c1:925d:e9eb]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::746b:49c1:925d:e9eb%5]) with mapi id 15.20.2284.023; Fri, 27 Sep 2019
 09:28:07 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mmc: renesas_sdhi_internal_dmac: Add r8a774b1 support
Thread-Topic: [PATCH] mmc: renesas_sdhi_internal_dmac: Add r8a774b1 support
Thread-Index: AQHVcqQwVUdoU56Bi06ox7Sw0gSDmqc+BhQAgAAM8rCAAAqBAIABH8mQ
Date:   Fri, 27 Sep 2019 09:28:06 +0000
Message-ID: <OSBPR01MB210339B59E1B57FFDB00038AB8810@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1569307744-42479-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdUsLCciw7KFudSC7pRqfwwaGH5iJSgv906kY342V+6ocQ@mail.gmail.com>
 <OSBPR01MB21036B8294382D1A7A50816BB8860@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdXq1BaNSrOTqUkE34kS6i1kyEXLXe=S5pMdRiEvkD4fvw@mail.gmail.com>
In-Reply-To: <CAMuHMdXq1BaNSrOTqUkE34kS6i1kyEXLXe=S5pMdRiEvkD4fvw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70a2f0cf-559f-4e5e-63af-08d7432d0159
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBPR01MB2375:|OSBPR01MB2375:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB23754E84EFE364F6D503FAADB8810@OSBPR01MB2375.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(189003)(51914003)(199004)(26005)(256004)(25786009)(8676002)(81166006)(81156014)(86362001)(7736002)(305945005)(71200400001)(71190400001)(6916009)(74316002)(229853002)(66946007)(6436002)(55016002)(3846002)(66476007)(66556008)(76116006)(66446008)(64756008)(4326008)(14454004)(2906002)(8936002)(6246003)(6306002)(9686003)(186003)(446003)(6116002)(11346002)(99286004)(44832011)(476003)(102836004)(966005)(66066001)(7696005)(54906003)(33656002)(76176011)(5660300002)(53546011)(316002)(6506007)(486006)(478600001)(52536014);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2375;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GNMN8UejZrow5vwlv+CRkBAuoJC08hWGSCZsj9nOQPt716EMXpH1yBcSa6xulP1OSdOhvZxKS6gSBAuk0z6X5BadVBfAytf3cbJ1VL3/8XHaTwa5dBec9e9AhW4JaL5KMKD+0f1R22KJ007vfsL9Qj9b1ldak1SvxfmswaNIu4Aq5oHj1Gw2y5gqeowdETSyeqYl+hDqrkr4hC7lSK5w7SjjBEfp4eo1yxGIHCmyyGqeDCRw9wPbw0CZE1JaB/xthpMfnoLfAxlnTYvVxt2v6jBZCiur/XMvlP1AvUtQnfbFuirw/b+ELDJ4rdJImcEqcaXVVG1uv7+THMywVwSpvkuXr+pnAde8W8+G7JdFgSpKYxcqVrofyz5+ZXFfgCO5PQn3g6Adwlq4+PW6XTPMgwiRQjHzxRw8rPK1V2qtme7zlTLrqMfY1Cm3wkeWpP+/p/FpzXL40U2Woc2gYjTu2Q==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a2f0cf-559f-4e5e-63af-08d7432d0159
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 09:28:06.7131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mn0ha95KtJUGOkr0qnxlgnhvp7QpgsKp6Jhd6jbPiwv1OHq7SwuO/EsWVrkyF+8XdGIrsciDGSYfQa6Shy021A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2375
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIG1tYzogcmVuZXNhc19zZGhpX2ludGVybmFsX2RtYWM6IEFkZCByOGE3NzRiMQ0KPiBz
dXBwb3J0DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgNTox
MSBQTSBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gU3Vi
amVjdDogUmU6IFtQQVRDSF0gbW1jOiByZW5lc2FzX3NkaGlfaW50ZXJuYWxfZG1hYzogQWRkIHI4
YTc3NGIxDQo+ID4gPiBzdXBwb3J0IE9uIFR1ZSwgU2VwIDI0LCAyMDE5IGF0IDg6NDkgQU0gQmlq
dSBEYXMNCj4gPGJpanUuZGFzQGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gVGhpcyBw
YXRjaCBhZGRzIFNESEkgc3VwcG9ydCBmb3IgUlovRzJOIChSOEE3NzRCMSkgU29DLg0KPiA+ID4g
Pg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5j
b20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGlf
aW50ZXJuYWxfZG1hYy5jIHwgMSArDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3QvcmVu
ZXNhc19zZGhpX2ludGVybmFsX2RtYWMuYw0KPiA+ID4gPiBiL2RyaXZlcnMvbW1jL2hvc3QvcmVu
ZXNhc19zZGhpX2ludGVybmFsX2RtYWMuYw0KPiA+ID4gPiBpbmRleCA3NTFmZTkxLi43YzYwMjBl
IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaV9pbnRl
cm5hbF9kbWFjLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGlf
aW50ZXJuYWxfZG1hYy5jDQo+ID4gPiA+IEBAIC0zMDgsNiArMzA4LDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBzb2NfZGV2aWNlX2F0dHJpYnV0ZQ0KPiA+ID4gc29jX3doaXRlbGlzdFtdID0gew0K
PiA+ID4gPiAgICAgICAgICAgLmRhdGEgPSAodm9pZCAqKUJJVChTREhJX0lOVEVSTkFMX0RNQUNf
T05FX1JYX09OTFkpIH0sDQo+ID4gPiA+ICAgICAgICAgLyogZ2VuZXJpYyBvbmVzICovDQo+ID4g
PiA+ICAgICAgICAgeyAuc29jX2lkID0gInI4YTc3NGExIiB9LA0KPiA+ID4gPiArICAgICAgIHsg
LnNvY19pZCA9ICJyOGE3NzRiMSIgfSwNCj4gPiA+ID4gICAgICAgICB7IC5zb2NfaWQgPSAicjhh
Nzc0YzAiIH0sDQo+ID4gPiA+ICAgICAgICAgeyAuc29jX2lkID0gInI4YTc3NDcwIiB9LA0KPiA+
ID4gPiAgICAgICAgIHsgLnNvY19pZCA9ICJyOGE3Nzk1IiB9LA0KPiA+ID4NCj4gPiA+IElzIHRo
aXMgc3VmZmljaWVudD8NCj4gPiA+IERvIHlvdSBuZWVkIGEgdHVuaW5nIHF1aXJrIGVudHJ5IGlu
IHNkaGlfcXVpcmtzX21hdGNoW10/DQo+ID4NCj4gPiBEbyB5b3UgbWVhbiB0aGUgICJxdWlya3Mt
Pm1hbnVhbF9jYWxpYnJhdGlvbiIgIGFzIG1lbnRpb25lZCBpbiB0aGUgYmVsb3cNCj4gcGF0Y2gg
Pw0KPiA+DQo+ID4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTAyNDEzMS8N
Cj4gDQo+IEV4YWN0bHkuIElzIFJaL0cyTiBhZmZlY3RlZD8NCg0KTm8uIFJaL0cyTiBpcyBub3Qg
YWZmZWN0ZWQuICBJIGhhdmUgZW5hYmxlZCBIUzQwMCBtb2RlIG9uIFJaL0cyTiBib2FyZCBhbmQg
d2l0aG91dCB0aGlzIHBhdGNoIGl0IHdvcmtzIGZpbmUuDQoNCk5vdGU6LQ0KIEkgYWxzbyB0ZXN0
ZWQgd2l0aCBxdWlyayBlbnRyeSBhZGRlZCBpbiBzZGhpX3F1aXJrc19tYXRjaC4gIFRoYXQgaXMg
YWxzbyB3b3JrcyBmaW5lLg0KDQpSZWdhcmRzLA0KQmlqdQ0K
