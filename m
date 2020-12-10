Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B33282D54B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 08:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728627AbgLJHeR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 02:34:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727408AbgLJHeR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 02:34:17 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0603.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::603])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F10AAC0613CF;
        Wed,  9 Dec 2020 23:33:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A46o0X0UF34iifeyyJkE7TZIOqPIbFOsAD5W2TzMgNlkhGGIbEB6JswEmdcPwMoWiZUqYMy8kiDJ8ORPR6xPkDMUMCZzLOYzrmNG6lnQt/4dxlBgTWf3J9z85eKWxO1r+6FVIw3sXD9GziBpR7iF7YPWwHqFkJ048AgLhIy611+7SsldRziHiJGAkm9Xhckd5ssueDIIXwrIx3ZvSHSWmgjlhckBsw56/+gmLPrl4ffffNNwDvlcO4sp3Z7vEF3k7WVKNjozZVEMt5HkR9lmHAeVZOf7ULehGizdY8+K5LPaVZznymFg1kPNAedXifPqXETdgKc53NCr5urdhyi+7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xezp/UXDNVVJs/Pb0WzYQgzpJ/iuqLO6rQZSnZSr7Tg=;
 b=ATVl7wWEbcmOAMUEumK/gRLQTC4tKt0kRoD8ji2yYkfrE1Uh+p20UjmYq7gmo2PfUdqq0xwsY5wzFIz2/qKyJ3BG415BY41N3V8fOnZ5x7rNK7Z3NKtBHAEaN6xM66DFh+6BZ/QU7CI9TB62epU8hSj/drj2sYnWauCU8xUnrKkG1KjIGg5vBLBh1+sDOeT+dgV+iTm+XCUUSpKxW7Fer9KJQxfAL8ewOnkAFCkzwWi2f+sq+apo8jSlJn5ZyWwb06F4OeRciIwS08dRavlq7Bdb3XsXXs0Gryoc9ir02HhV5suID6KiiVkUqY/t9MCwMBcwRgtFeEvIF9m4bpYCow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xezp/UXDNVVJs/Pb0WzYQgzpJ/iuqLO6rQZSnZSr7Tg=;
 b=eNX/5ZcQj6RSnRDlvoseY7BBLXrB983y9HJQjDf8cvafSB35/sXrkhfVTYSjZJCj7GZYibbprS9HZVARGpFb/Orw3slHMAfE25Zwcas6ppVeMNUxxJi/Cc2FLr8HNS1ZhQ/kglA+TSBNd9+7lg3TDTrmTPe9kzGhue09r8Ue/cc=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB2889.eurprd03.prod.outlook.com (2603:10a6:7:5f::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.13; Thu, 10 Dec 2020 07:33:27 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%6]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 07:33:27 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>
CC:     "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "khiem.nguyen.xt@renesas.com" <khiem.nguyen.xt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Topic: [PATCH 3/3] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Index: AQHWzi93D4ghTujm1EOpsE3lf7qGwqnvweaAgAAvMYA=
Date:   Thu, 10 Dec 2020 07:33:26 +0000
Message-ID: <f19f7c3cf1d25e55a40825d6048ab9134b7d3502.camel@fi.rohmeurope.com>
References: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1607414643-25498-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <CAMuHMdWY_M=XZF4FtP0E0vU3u=S1Gj7ynQVLyn1KA9iRDgvvOQ@mail.gmail.com>
         <TY2PR01MB3692AE2EBAE6876F1CA26A34D8CB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692AE2EBAE6876F1CA26A34D8CB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d09eca69-5c5f-4897-296f-08d89cdde23a
x-ms-traffictypediagnostic: HE1PR03MB2889:
x-microsoft-antispam-prvs: <HE1PR03MB2889FA6912F8E60A444A027CADCB0@HE1PR03MB2889.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +f2aNcRf2hmPR+cG25qRNPm25hWJVZmcIJ/DvlNueCQPy7wYGUEhiWN6jE1kq87g8N853YBZe4sziC3zqRLesh8zyMrgL4Iz7dpL5QhWEJvuxQCrf3V16KnjX+REM5l07N1o772ZH3qNblfH6uYCPcnBoY/mazi29ckfvuWliYjeDkoh5g0M7+bQxG877xdf4v7esQA5bYbtAL9l2wszbR7WSpN7n9yv+bBNx/2TvlZn01nZJSGB7EJPCaiS6krhX8+sRMoO2kzWpThO2Dp2Nkb19Z3PXQTjaM5dAqpkx7Mw2rx7MXwgssBSFMBDcdSvnuhl2Ji5JrkADSbZE+dvww==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(3450700001)(8676002)(508600001)(83380400001)(64756008)(66476007)(66946007)(66446008)(5660300002)(4326008)(4001150100001)(86362001)(110136005)(2906002)(66556008)(54906003)(2616005)(26005)(8936002)(71200400001)(6486002)(6506007)(6512007)(186003)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?OEd6RENaWlhINFZzenA3RmV0b2hweFFDOWxacmRMVENqcEVsRHRDZStYQ1J6?=
 =?utf-8?B?M1JrdDZVOTYyL2JxNldNVlJLWTgyckRpU1M1Vk14dkZRQjM3UHFDckxubG84?=
 =?utf-8?B?a1BSNEszWFBrblM2Qmg0YmpaWTV2OFZnRGFpRjMzRTQ3dnQ0WmFOS1Q3N096?=
 =?utf-8?B?YjEyTHpEdzlnVG90YXU0dmh0WVNSN01yODhselJFRzVnVUs2NHlUcUtJTG9a?=
 =?utf-8?B?clQ4MDBTTUFjM2J5Y0pVVTNPZXVjSEU1dDRYRW0yK1YrTEFiaWFXYXVXWUdJ?=
 =?utf-8?B?ZVhZZm9UVzlnMWdLNGpFQ3BuTVVGNWJUVUFWUUxndVp4QTFHUjFpdEthQURx?=
 =?utf-8?B?YkIrdG02MjBJSTIvZTM2M1ZwMXVObkpqZnd1S0RRRkRBbzFQRHppY29ac1gz?=
 =?utf-8?B?K0NUOSt0NUIzdTI0dEljcFJxSnkvTTVXZVF5S0QzMXJhRUxxeUsxSk5FbTdT?=
 =?utf-8?B?K0dqc2paSDlhRWZBMmsrR2R3bVl4REtCcXFnZ1krbEtSa3lMZjJyamo2b3lZ?=
 =?utf-8?B?bTVWbVdaL3Zpd0tuRTNmZEdhaWUvTEI1SUNKTHlDMVZLdytaUmVqanFxL25y?=
 =?utf-8?B?TndNcUdqdmxEcER0SmNLeUFXOFkxaDZjS3B1M0lnL1dkczNBUlZEblZRdFpw?=
 =?utf-8?B?TkVjRmdEc3lvSG5NcXh3TDl3SWM4RXlURGtGdjB6QVdydGNDZ3NkWEpSKzVs?=
 =?utf-8?B?ZTEzL1BCVituVXJ5RnJiaW9JanllN1JxN3NGT0lpTEYwTEtLSDhHWUVNbmZH?=
 =?utf-8?B?QmlWNGpNeXN2aUJqRU1tbzBoUmh0bG9vUS9YM2NuN0lzUWpFaEkrRDBnU3o5?=
 =?utf-8?B?azFTSm1kUG85ZldjS0NnaE5SSVVtSmt5MFFjSDBGenBJbEtTT3lSaG1ucVY3?=
 =?utf-8?B?SnU2WXpwSEtwa3hPMmo2eUJoR2RBYWl3U2JjWElFUk1sb0pabWlOZEtBeHJQ?=
 =?utf-8?B?Y2o3OVl1dUlka1RmRjhtR0VFdC8xVmpsU0E5NHJWRU9PMC9XbjNtK1BWY2M1?=
 =?utf-8?B?ZjJzbkJCbU90YlU2TFF0SlJVMSs1cG9kU1hsZ0hycGJpdWJScXljVVMxekU2?=
 =?utf-8?B?UGdwVVdVMWFYaDdWMWlUZFFQUXJ0MmEwSEtUSFBqM3pYRHNVZ0V2WnVISVZ5?=
 =?utf-8?B?M05PS00rV040MnpaUGlGdk4rRGtKcC9CWGltT1B1RVNFRThHeHUzcEZDOStu?=
 =?utf-8?B?TUNOVzJ3UlAyamgvVlNNYm80MTNuMjNFVFJlNy9NczFRZnBGd2VkSFcwMk1k?=
 =?utf-8?B?blFCVHgzVm1CTDlXYVdhbTU1Wm9lT3k4NHBXekVJMlBWK0ZsOVRQcFJBZG5T?=
 =?utf-8?Q?F45vYzaKkqahd43U/25NaIcpFg2jJGyTXr?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <AFD002876EA98F40A91A79E3A85BBD83@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d09eca69-5c5f-4897-296f-08d89cdde23a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 07:33:26.9403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bE0fC6huS+Xo0YtmDa0JvUhQXfImjXagZICJ5zbpM8uM/QBDTSy3XN7YPZJbigdjFppUeAR2l4rsvrujppGWD0PxtFEpVcb1h4i0vu9HSxWmg7yuRrGKxWV0Sda5s8ap
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB2889
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQpPbiBUaHUsIDIwMjAtMTItMTAgYXQgMDQ6NDQgKzAwMDAsIFlvc2hpaGlybyBTaGltb2RhIHdy
b3RlOg0KPiBIaSBHZWVydC1zYW4sDQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0K
PiANCj4gPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4sIFNlbnQ6IFdlZG5lc2RheSwgRGVjZW1i
ZXIgOSwgMjAyMCAxMDozMA0KPiA+IFBNDQo+IDxzbmlwPiANCj4gPiA+IC0tLSBhL2RyaXZlcnMv
bWZkL2JkOTU3MW13di5jDQo+ID4gPiArKysgYi9kcml2ZXJzL21mZC9iZDk1NzFtd3YuYw0KPiA+
ID4gDQo+ID4gPiBAQCAtMTgyLDYgKzI3Miw4IEBAIHN0YXRpYyBpbnQgYmQ5NTcxbXd2X3Byb2Jl
KHN0cnVjdCBpMmNfY2xpZW50DQo+ID4gPiAqY2xpZW50LA0KPiA+ID4gICAgICAgICBwcm9kdWN0
X2NvZGUgPSAodW5zaWduZWQgaW50KXJldDsNCj4gPiA+ICAgICAgICAgaWYgKHByb2R1Y3RfY29k
ZSA9PSBCRDk1NzFNV1ZfUFJPRFVDVF9DT0RFX1ZBTCkNCj4gPiA+ICAgICAgICAgICAgICAgICBi
ZC0+ZGF0YSA9ICZiZDk1NzFtd3ZfZGF0YTsNCj4gPiA+ICsgICAgICAgZWxzZSBpZiAocHJvZHVj
dF9jb2RlID09IEJEOTU3NE1XRl9QUk9EVUNUX0NPREVfVkFMKQ0KPiA+ID4gKyAgICAgICAgICAg
ICAgIGJkLT5kYXRhID0gJmJkOTU3NG13Zl9kYXRhOw0KPiA+ID4gDQo+ID4gPiAgICAgICAgIGlm
ICghYmQtPmRhdGEpIHsNCj4gPiA+ICAgICAgICAgICAgICAgICBkZXZfZXJyKGJkLT5kZXYsICJO
byBmb3VuZCBzdXBwb3J0ZWQgZGV2aWNlDQo+ID4gPiAlZFxuIiwNCj4gPiANCj4gPiBXaGlsZSBC
RDk1NzFNV1YgYW5kIEJEOTU3NE1XRiBjYW4gYmUgZGlzdGluZ3Vpc2hlZCBhdCBydW50aW1lLA0K
PiA+IEkgdGhpbmsgaXQgd291bGQgc3RpbGwgYmUgYSBnb29kIGlkZWEgdG8gZG9jdW1lbnQgYQ0K
PiA+ICJyb2htLGJkOTU3NG13ZiINCj4gPiBjb21wYXRpYmxlIHZhbHVlIGluIHRoZSBEVCBiaW5k
aW5ncywgYW5kIGxldCB0aGUgZHJpdmVyIG1hdGNoIG9uDQo+ID4gdGhhdC4NCj4gDQo+IEluIHRo
aXMgZHJpdmVyIHBvaW50IG9mIHZpZXcsIHdlIGNhbiB1c2Ugc3VjaCB0aGUgRFQgYmluZGluZ3Ms
DQo+IGhvd2V2ZXIsIGluIHRoZSBib2FyZCBwb2ludCBvZiB2aWV3LCBpdCdzIGRpZmZpY3VsdCB0
byBkZXNjcmliZQ0KPiB3aGljaCBjaGlwIGlzIGluc3RhbGxlZCBvbiByOGE3Nzk5MC1lYmlzdS5k
dHMuIFNvLCBJJ2QgbGlrZSB0bw0KPiBrZWVwIHRoaXMgcnVudGltZSBkZXRlY3Rpb24uDQoNCkZp
cnN0IG9mIGFsbCAtIEkgZG9uJ3Qgd2FudCB0byBpbnNpc3QgY2hhbmdlcyBoZXJlIHNvIG15IGNv
bW1lbnQgY2FuIGJlDQppZ25vcmVkLiBJIHdvdWxkIGRlZmluaXRlbHkgbGlrZSBzZWVpbmcgdGhl
IHN1cHBvcnQgZm9yIEJEOTU3NCBpbi10cmVlIQ0KDQpCdXQgYXMgYSAnbml0JzoNCkkgZG9uJ3Qg
a25vdyB3aGF0IGFyZSB0aGUgZGlmZmljdWx0aWVzIHlvdSBhcmUgcmVmZXJyaW5nIHRvIHNvIGl0
J3MNCmhhcmQgZm9yIG1lIHRvIGNvbW1lbnQgdGhpcy4gV2l0aG91dCBiZXR0ZXIgdW5kZXJzdGFu
ZGluZyBvZiBib2FyZCBkdHMNCmZpbGVzIC0gSSB0aGluayBCRDk1NzRNV0Ygc2hvdWxkIHJlYWxs
eSBoYXZlIG93biBjb21wYXRpYmxlIGFzIEkNCnVuZGVyc3Rvb2QgaXQgaXMgZGlmZmVyZW50IGZy
b20gdGhlIEJEOTU3MU1XVi4gUmVseWluZyBvbiBwcm9kdWN0IGNvZGUNCnByb2Jpbmcgc291bmRz
IGxpa2Ugc29tZXRoaW5nIHRoYXQgbWF5IGVhc2lseSBicmVhayB3aGVuL2lmIG5ldw0KdmFyaWFu
dHMgYXJlIHByb2R1Y2VkLiAoIEkndmUgc2VlbiBuZXcgSFcgdmFyaWFudHMgdXNpbmcgdGhlIHNh
bWUNCklEIGluZm9ybWF0aW9uIGJlaW5nIHByb2R1Y2VkIGluIHByZXZpb3VzIGNvbXBhbmllcyBJ
J3ZlIHdvcmtlZC4gU3VyZQ0KUk9ITSB3b3VsZG4ndCBkbyB0aGlzIGJ1dCBzdGlsbC4uLiA6XSAp
LiBBbmQgcHJvZHVjaW5nIGJvYXJkcyB3aGVyZSBEVFMNCmRvZXMgbm90IGFsbG93IGRlc2NyaWJp
bmcgdGhlIGNvcnJlY3QgY29tcG9uZW50cyBzb3VuZHMgbGlrZSBhc2tpbmcgZm9yDQphIG5vc2Ut
YmxlZWQgdG8gbWUuLi4gSWYgcHJvYmluZyBvZiBJQyB0eXBlIGZhaWxzIEFORCB0aGVyZSBpcyBk
ZXZpY2VzDQp3aXRoIHdyb25nIFBNSUMgaW5mb3JtYXRpb24gYnVybmVkIGluIERUIC0gdGhlbiBm
aXhpbmcgaXQgY2FuIGJlIGENCm5pZ2h0bWFyZS4gU28gSSB3b3VsZCByZWFsbHkgdHJ5IG1ha2Ug
RFRTIGZpbGVzIHN1Y2ggdGhhdCB0aGV5IGNhbiBiZQ0KY2hhbmdlZCB0byBtYXRjaCB0aGUgYWN0
dWFsIGJvYXJkLiAoUGVyaGFwcyBpbnRyb2R1Y2UgdGhlIGNvbXBhdGlibGUNCmZvciBCRDk1NzRN
V0YgLSBtYWtlIHRoaXMgZHJpdmVyIHRvIG1hdGNoIGJvdGggb2YgdGhlIFBNSUNzIC0gbGVhdmUg
dGhlDQpydW50aW1lIHByb2JpbmcgaGVyZSBmb3Igbm93IC0gYW5kIGluIHBhcmFsbGVsIHdvcmsg
d2l0aCB0aGUgRFRTIGZpbGVzDQpzbyB0aGF0IGV2ZW50dWFsbHkgdGhlIHByb2JpbmcgY2FuIGJl
IHJlbW92ZWQoPykgVGhhdCB3YXMgbXkgMTAgY2VudHMNCm9uIHRoaXMgdG9waWMgOl0gKQ0KDQpC
ZXN0IFJlZ2FyZHMNCiAgICBNYXR0aSBWYWl0dGluZW4NCg0K
