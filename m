Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5DBE2D59DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 12:58:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728923AbgLJL5Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 06:57:25 -0500
Received: from mail-eopbgr70073.outbound.protection.outlook.com ([40.107.7.73]:17116
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729450AbgLJL5O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 06:57:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrKl6I97GXTjYEsg2pRaFtZin2IUlwyBKFag7ODWZ05DBRGOpGqkI+HCsdmIsdd9Bdc3ae2/7UbKc75D/Kxrgn5KXqy0+lgbz+v+aWHmHgKh31zU2SAWyRRewEIH0hO3yC64fZdm6jvxdhxvTpVaiWIUfe4SS+AdF13lAaKD30a/FnJs8mc57oMnjCwL0QTzqot7IPDIePiQT7JdXO4m6SjKIfy2RJwkLemL4Qc0LmmW4yd3S2WXCpT8EjxfSXrTOEC4YF04Qa9dNlWfT4sG+6BX6dsjOSujy8Bj2XaQKJq6+dsmUJo+OJhl060SGsLwjAikvVUG1ooo2jpAUDWiTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzlBcRaFHY8OnHaIL1HNPFJXpEZVlDeFg2ZZ12fwRHk=;
 b=U36POxK9so+QXu82SOkvtl+jYvO8HM1AZpt4jAo3kxG6dtqirKCwup9jGKOvQQ+ysR0tmreycGLGcpULO4l+fNd3/Yd24Y0vGIy47tSZ5qJ1GpsVXpn8asqOFLlEFFAAyr4K+424+keIgTmtwCI6olIDqrpcxd9op7lQaEijqaEVHeLgcp8b2B8QBD0tgJ/ipQq65c2etrkhSSINIBeAcIHAlJiHbBtQ6LP9p3O58JX1XaX0BqCingL07dtie/B6Hacz9uAcMeUibAwCGkkG8Wlj6xOnEyhwuewioan3H7a83QLP9ycnXuybXgYJ9+8SX0I3I2s10CpFMflSRfJvUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzlBcRaFHY8OnHaIL1HNPFJXpEZVlDeFg2ZZ12fwRHk=;
 b=lJ+4Tg/CpLlA2c6eXA9X39E4Zn9+Kgv/lUChG/Iwd3dTeiwkhW15MZTyIyQODjytgwlTz3GmueAp1X7hZLKMAaNp0yxVfTXS5QVhse0P525mOk82mgQXHBbJ/6KisBcxGMHbMcz435zaHB/XzuzsGYbOpYbkz3/Lb2lVWmGS06g=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0302MB2811.eurprd03.prod.outlook.com (2603:10a6:3:ec::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12; Thu, 10 Dec 2020 11:56:18 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%6]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 11:56:17 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>
CC:     "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "khiem.nguyen.xt@renesas.com" <khiem.nguyen.xt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Topic: [PATCH 3/3] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Index: AQHWzrxbDTJqpFQHAk2noPsccvHdN6nv/12AgAAp6YCAABAuAA==
Date:   Thu, 10 Dec 2020 11:56:17 +0000
Message-ID: <f7ba498de609623bf2df9e43cfddb7b92d699238.camel@fi.rohmeurope.com>
References: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1607414643-25498-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <2916e43d33fd13c88d983d7e8451a41ec3bf9e31.camel@fi.rohmeurope.com>
         <TY2PR01MB369226B2FCFB1E6C91E2EFD5D8CB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB369226B2FCFB1E6C91E2EFD5D8CB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: a15141c0-cc00-4973-715c-08d89d029a4f
x-ms-traffictypediagnostic: HE1PR0302MB2811:
x-microsoft-antispam-prvs: <HE1PR0302MB28110D86C6A3A6FCB5F576D0ADCB0@HE1PR0302MB2811.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FuqqwybWOMPiF/E8w7fzaxuP8yFObrqxyfj4RkfifFiha5V5StDXpOVhn43QGyb0phcU1IpKbLb6e7Cf49L6ijSudgUazbNfGGRDKcY68ucC9qHkly+va3ygMOaXAE3B6HxDuQITSMjzvAixomF5/s1o6v9ZQbvnPtlsHRojSf4w2qHW4C80QGoTk7QtlxxR4/1SxkJQS5rcgPTcL3tIx8qIKpFzs9JD3xnJp8aWBYbffLA+Wjfv6fhr/ZCn9UXtzEbHtkfGEqx5EPmIYWzH4HfpOivSq6TbtW55mThSULR25w0sqCvsik+wELSEcwY6Xlasbi8iRUVbPyb29R1d/A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(6486002)(66446008)(66556008)(66476007)(64756008)(76116006)(186003)(4001150100001)(508600001)(6916009)(83380400001)(8676002)(8936002)(26005)(71200400001)(66946007)(6506007)(2906002)(2616005)(54906003)(86362001)(4326008)(5660300002)(6512007)(3450700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?V1Q5UmRiUWRacENJbFFuK1FmMi9nTkRxdUluZ3lCcDhjN1ZpSklIeVJTYXg1?=
 =?utf-8?B?UVdBUS9KVlNsSEo4M1BvTFYyeGI2Y3dnOE53K29kTEJMQXNoNGFPaWwrNys4?=
 =?utf-8?B?cDJ0a3kxSmVXMURNZU1sUXd1bGNvSlNHRFhjWDZNd1FLU2NTM01VRUtDY0ww?=
 =?utf-8?B?bUcwd2ptd3ZGVFRmQkp3dVU5TkRaNllmQ1ZrNk9uT2E1NVhjTy9UZzI5UWo3?=
 =?utf-8?B?UHNXcEk1ZW9JRzVnZlVDVXNjc2JYdDJiVHNGR1d5UVo3ZTJOL0RtN0hrZ2d0?=
 =?utf-8?B?WkZyOE8xUit6ajduV0lIa1pWWURsMFhISnIzUFYvUUxJQlFab2xVdzZkMDE1?=
 =?utf-8?B?SWJsZCt1Q2Y5blVHSHBEMy9NVTllVkJTZjlDUTVrTFk0cG9WdlBsd0xYcjAx?=
 =?utf-8?B?VTVRWHl5MFUyRnVsczF3SXpoL0pCaE0zcHFERS9OR1I0VEhKWHpLZ2RvMkR6?=
 =?utf-8?B?UVpNem51V1RrYkUrTFhybWVEZldtd1hXWTFkaDN5UkZNM2pUaVZRempDcHVE?=
 =?utf-8?B?OFlpQ2t1a1hzeFBuTTg0Q1VhR2dxOFhveVZyRnZCRzY4cGpRSVpKV1hUakRK?=
 =?utf-8?B?TnZpUHVkSE1SUDJ4a2ptM0dqR2Z2KzRGcXJSWE1HOCtpYWtqRlF5UHZxU1ZC?=
 =?utf-8?B?ekpqZlZGNW1tVHA0Ry9rbEZPRlptUVpYdzVVRVBiZlhmZUZQN1FDSU1wa2lw?=
 =?utf-8?B?ZzV4N2t4T0VzdVVaSGtVNG5tWThWdUVxWkZ4VTRwekNkNHJCRyt5L0JVWEts?=
 =?utf-8?B?WlRQUkpwRlhNdFR4OGVMTHdsbXI0VDR1SEtGWkQybllqOXh0UUpiNTVCZWZX?=
 =?utf-8?B?VlJsRHlvc1RaTU9hOGpBRjJQdGQrOEtDMFdyTktpNXhYNnhvcW0rNEw2bnQ3?=
 =?utf-8?B?cGRyajZSVVpWQ1llNkVxOE5mRTVSaFVwb1dZald2SUxidGNPb21Sb0d3WnpT?=
 =?utf-8?B?MFpDc3dkZksxYzdNSHpkMk5NMzM3YjlWSmp2Y0NUNU55K1kvWlFoK0hjTWVT?=
 =?utf-8?B?UHlzVTkwMVdXTzEyeUlTbENIZ3MrVjk4eW1sSUtUSE5JdjdLYzBBMHdsMlRK?=
 =?utf-8?B?SGhFZ0x3eGdmQkwxV3BRalN2Q1VBM2wrclJ6cUZkNzJhNUVhbm1UR2dmazEw?=
 =?utf-8?B?c0EzSWtpbDBnb3pIOUJMRm1vcDl2Ymdaamd3SmtPaENEeUR1STg4aEFkR0Jp?=
 =?utf-8?B?VHFucm40NW9YQ1gxSFpiYndVTXpxZFNwbzJaWnQ1dzJMdzcvNEx4UzZmazhP?=
 =?utf-8?B?V1dDNmpSbWZZSEJuNUVNVk1RUDF6THhQN29rUG9RUjBKN3hCS01CKys3WVZt?=
 =?utf-8?Q?bofokLQ6fNZlhcor4KJkdn6B5DumGL5t/D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <25DFEA200BFAA04099BE00F729FFA6E3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a15141c0-cc00-4973-715c-08d89d029a4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 11:56:17.5619
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cRQfnwlIhUudomODJX0Cc2W98Rkh+JBfPwqWzUtVCpy5KsaYHsl1SR1iS309JuM7+03y0BIv/1330xyesNHbI/R5xFf7m4SD8VrRP2Bhw+USPEwcbelaqCPq9T63QaE6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2811
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgWW9zaGloaXJvIHNhbiwNCg0KT24gVGh1LCAyMDIwLTEyLTEwIGF0IDEwOjU4ICswMDAwLCBZ
b3NoaWhpcm8gU2hpbW9kYSB3cm90ZToNCj4gSGkgTWF0dGksDQo+IA0KPiA+IEZyb206IFZhaXR0
aW5lbiwgTWF0dGksIFNlbnQ6IFRodXJzZGF5LCBEZWNlbWJlciAxMCwgMjAyMCA1OjI4IFBNDQo+
ID4gDQo+ID4gT24gVHVlLCAyMDIwLTEyLTA4IGF0IDE3OjA0ICswOTAwLCBZb3NoaWhpcm8gU2hp
bW9kYSB3cm90ZToNCj4gPiA+IEZyb206IEtoaWVtIE5ndXllbiA8a2hpZW0ubmd1eWVuLnh0QHJl
bmVzYXMuY29tPg0KPiA+ID4gDQo+ID4gPiBUaGUgbmV3IFBNSUMgQkQ5NTc0TVdGIGluaGVyaXRz
IGZlYXR1cmVzIGZyb20gQkQ5NTcxTVdWLg0KPiA+ID4gQWRkIHRoZSBzdXBwb3J0IG9mIG5ldyBQ
TUlDIHRvIGV4aXN0aW5nIGJkOTU3MW13diBkcml2ZXIuDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEtoaWVtIE5ndXllbiA8a2hpZW0ubmd1eWVuLnh0QHJlbmVzYXMuY29tPg0KPiA+ID4g
W3NoaW1vZGE6IHJlYmFzZSBhbmQgcmVmYWN0b3JdDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZb3No
aWhpcm8gU2hpbW9kYSA8DQo+ID4gPiB5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4N
Cj4gPiA+IC0tLQ0KPiA+ID4gIGRyaXZlcnMvbWZkL2JkOTU3MW13di5jICAgICAgIHwgOTINCj4g
PiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ICBp
bmNsdWRlL2xpbnV4L21mZC9iZDk1NzFtd3YuaCB8IDgwDQo+ID4gPiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNzIgaW5zZXJ0
aW9ucygrKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvYmQ5NTcxbXd2
LmMgYi9kcml2ZXJzL21mZC9iZDk1NzFtd3YuYw0KPiA+ID4gaW5kZXggNTdiZGI2YS4uZjhmMGE4
NyAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvbWZkL2JkOTU3MW13di5jDQo+ID4gPiArKysg
Yi9kcml2ZXJzL21mZC9iZDk1NzFtd3YuYw0KPiA+ID4gQEAgLTIwLDYgKzIwLDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBtZmRfY2VsbCBiZDk1NzFtd3ZfY2VsbHNbXQ0KPiA+ID4gPSB7DQo+ID4g
PiAgCXsgLm5hbWUgPSAiYmQ5NTcxbXd2LWdwaW8iLCB9LA0KPiA+ID4gIH07DQo+ID4gPiANCj4g
PiA+ICsvKiBSZWdtYXAgZm9yIEJEOTU3MU1XViAqLw0KPiA+ID4gIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgcmVnbWFwX3JhbmdlIGJkOTU3MW13dl9yZWFkYWJsZV95ZXNfcmFuZ2VzW10NCj4gPiA+ID0g
ew0KPiA+ID4gIAlyZWdtYXBfcmVnX3JhbmdlKEJEOTU3MU1XVl9WRU5ET1JfQ09ERSwNCj4gPiA+
IEJEOTU3MU1XVl9QUk9EVUNUX1JFVklTSU9OKSwNCj4gPiA+ICAJcmVnbWFwX3JlZ19yYW5nZShC
RDk1NzFNV1ZfQktVUF9NT0RFX0NOVCwNCj4gPiA+IEJEOTU3MU1XVl9CS1VQX01PREVfQ05UKSwN
Cj4gPiA+IEBAIC0xMTIsNiArMTEzLDk1IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYmQ5NTd4X2Rh
dGENCj4gPiA+IGJkOTU3MW13dl9kYXRhID0NCj4gPiA+IHsNCj4gPiA+ICAJLm51bV9jZWxscyA9
IEFSUkFZX1NJWkUoYmQ5NTcxbXd2X2NlbGxzKSwNCj4gPiA+ICB9Ow0KPiA+ID4gDQo+ID4gPiAr
c3RhdGljIGNvbnN0IHN0cnVjdCBtZmRfY2VsbCBiZDk1NzRtd2ZfY2VsbHNbXSA9IHsNCj4gPiA+
ICsJeyAubmFtZSA9ICJiZDk1NzFtd3YtZ3BpbyIsIH0sDQo+ID4gDQo+ID4gQW5vdGhlciAnbml0
JyBzdWdnZXN0aW9uIHdoaWNoIHlvdSBjYW4gaWdub3JlIGlmIGl0IGRvZXMgbm90IG1ha2UNCj4g
PiBzZW5zZQ0KPiA+IDopDQo+ID4gDQo+ID4gQXJlIHRoZSBHUElPIGJsb2NrcyAxMDAlIGlkZW50
aWNhbD8gSWYgbm90LCB0aGVuIEkgd291bGQgc3VnZ2VzdA0KPiA+IGNoYW5naW5nIHRoaXMgdG86
DQo+ID4geyAubmFtZSA9ICJiZDk1NzRtd2YtZ3BpbyIsIH0sDQo+IA0KPiBUaGUgR1BJTyBibG9j
a3MgYXJlIG5vdCAxMDAlIGlkZW50aWNhbC4gQkQ5NTc0TVdGIHNlZW1zIHRvIGhhdmUNCj4gYW4g
YWRkaXRpb25hbCBmZWF0dXJlIHdoaWNoIEdQSU94IHBpbiBhcmUgdXNlZCBmb3Igb3RoZXIgbW9k
ZSBieQ0KPiB1c2luZyBncGlvIG11eCByZWdpc2l0ZXIuDQo+IA0KPiA+IGFuZCBwb3B1bGF0aW5n
IHRoZSBwbGF0Zm9ybV9kcml2ZXIgaWRfdGFibGUgZm9yIHN1YiBkcml2ZXIocykgdXNpbmcNCj4g
PiBzb21ldGhpbmcgbGlrZToNCj4gPiANCj4gPiBzdGF0aWMgY29uc3Qgc3RydWN0IHBsYXRmb3Jt
X2RldmljZV9pZCBiZDk1N3hfZ3Bpb19pZFtdID0gew0KPiA+ICAgICAgICAgeyAiYmQ5NTcxbXd2
LWdwaW8iLCBST0hNX0NISVBfVFlQRV9CRDk1NzEgfSwNCj4gPiAgICAgICAgIHsgImJkOTU3NG13
Zi1ncGlvIiwgUk9ITV9DSElQX1RZUEVfQkQ5NTc0IH0sDQo+ID4gICAgICAgICB7IH0sDQo+ID4g
fTsNCj4gPiANCj4gPiBUaGVuIHlvdSBjYW4gZ2V0IHRoZSBJQyB0eXBlIHVzaW5nDQo+ID4gcGxh
dGZvcm1fZ2V0X2RldmljZV9pZChwZGV2KS0+ZHJpdmVyX2RhdGEuDQo+IA0KPiBJIGdvdCBpdC4g
U28sIHBlcmhhcHMsIEkgc2hvdWxkIGFkZCB0aGVzZSB0eXBlcyBpbnRvDQo+IGluY2x1ZGUvbGlu
dXgvbWZkL3JvaG0tZ2VuZXJpYy5oLg0KDQpUaGF0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gbWUuIEkg
bGlrZSB0aGUgaWRlYSBvZiBjb2xsZWN0aW5nIHRoZSBJRHMgaW4NCnNhbWUgcGxhY2UgLSBidXQg
b24gdGhlIG90aGVyIGhhbmQsIHRoZSBkZWZpbmUgaW4gaWQtdGFibGUgaXMgbm90DQpyZWFsbHkg
dmlzaWJsZSBvdXRzaWRlIHRoZSBzdWItZHJpdmVyIC0gc28geW91IGNhbiBwcm9iYWJseSBhbHNv
IGRlZmluZQ0KdGhlIHR5cGUgaW4gc3ViLWRldmljZSBkcml2ZXIgaWYgeW91IHdpc2guIEkgZG9u
J3QgaGF2ZSBzdHJvbmcgb3Bpbmlvbg0Kb24gdGhhdC4NCj4gDQo+ID4gTmV4dCwgSSB0aGluayB0
aGUgcGFyZW50IGRhdGEgZnJvbSBNRkQgaXMgb25seSB1c2VkIHRvIGdldCB0aGUNCj4gPiByZWdt
YXANCj4gPiBhbmQgZGV2IGluIHN1Yi1kZXZpY2VzLCByaWdodD8gTWF5YmUgeW91IGNvdWxkIHNp
bXBsaWZ5IHRoaXMgYW5kDQo+ID4gZ2V0DQo+ID4gcmlkIG9mIHRoZSB3aG9sZSBNRkQgcGFyZW50
IGRhdGEgc3RydWN0dXJlPyBJIHRoaW5rIHlvdSBjYW4gdXNlDQo+ID4gDQo+ID4gcGRldi0+ZGV2
LnBhcmVudCB0byBnZXQgdGhlIHBhcmVudCBkZXZpY2UgYW5kDQo+ID4gZGV2X2dldF9yZWdtYXAo
cGRldi0+ZGV2LnBhcmVudCwgTlVMTCk7DQo+ID4gDQo+ID4gdG8gZ2V0IHRoZSByZWdtYXA/DQo+
IA0KPiBJSVVDLCB0aGVzZSBjb21tZW50cyBhcmUgcmVsYXRlZCB0byBncGlvLWJkOTU3MW13di5j
Lg0KPiAjIEFsc28sIGJkOTU3MW13di1yZWd1bGF0b3IuYz8NCj4gSWYgc28sIEkgZGlkbid0IHRy
eSB0aGlzIHlldCwgYnV0IHBlcmhhcHMsIHdlIGNhbiBtb2RpZnkgc3VjaCB0aGluZ3MuDQoNCkNv
cnJlY3QuIE15IHN1Z2dlc3Rpb24gd2FzIHJlbGF0ZWQgdG8gaG93IHJlZ21hcCBhbmQgZGV2IHBv
aW50ZXJzIGFyZQ0Kb2J0YWluZWQgaW4gc3ViLWRldmljZXMuIEl0IGlzIHJlbGF0ZWQgdG8gTUZE
IGJlY2F1c2UgSSB0aGluayB5b3UgY291bGQNCnJlbW92ZSB0aGUgTUZEIGRyaXZlciBkYXRhIHVz
YWdlLg0KDQo+IA0KPiA+IChBZnRlciB0aGlzIEkgd29uZGVyIGlmIHlvdSBuZWVkIHRoZQ0KPiA+
IHN0cnVjdCBiZDk1NzFtd3YgYXQgYWxsPykNCj4gDQo+IEknbSBzb3JyeSwgYnV0IEkgY291bGQg
bm90IHVuZGVyc3RhbmQgdGhpcy4NCg0KSSBiZWxpZXZlIHRoZSBzdHJ1Y3QgYmQ5NTcxbXd2IGlz
IGRlZmluZWQgb25seSB0byBjb2xsZWN0IGFsbCB0aGUgTUZEDQpkcml2ZXIgZGF0YSBpbiBvbmUg
c3RydWN0IHNvIHRoYXQgaXQgY2FuIGJlIHBhc3NlZCB0byBzdWItZHJpdmVycyB1c2luZw0KdGhl
IE1GRCBkZXZpY2UgcHJpdmF0ZSBkYXRhLiBCdXQgYXMgZmFyIGFzIEkgY2FuIHRlbGwsIHRoZSBz
dWItZGV2aWNlcw0Kb25seSB1c2UgcmVnbWFwIGFuZCBkZXYgcG9pbnRlcnMgZnJvbSB0aGlzIGRh
dGEuIElmIHRoaXMgaXMgdGhlIGNhc2UsDQp0aGVuIEkgdGhpbmsgdGhlcmUgaXMgbm8gbmVlZCB0
byBkZWZpbmUgdGhpcyBzdHJ1Y3Qgb3IgcG9wdWxhdGUgdGhlIE1GRA0KZHJpdmVyIGRhdGEgKHVu
bGVzcyBJIGFtIG1pc3Npbmcgc29tZXRoaW5nKS4NCg0KKEFuZCBhcyBhIGZ1cnRoZXIgY2xlbi11
cCwgb25lIGNvdWxkIHByb2JhYmx5IHN3aXRjaCBmcm9tOg0KcmVnbWFwX2FkZF9pcnFfY2hpcA0K
dG8NCmRldm1fcmVnbWFwX2FkZF9pcnFfY2hpcA0KYW5kIGdldCByaWQgb2YgdGhlIHJlbW92ZSBm
dW5jdGlvbikNCg0KYnV0IGFzIEkgc2FpZCAtIHRoZXNlIGFyZSBvbmx5ICduaXQnIGNvbW1lbnRz
IGFuZCBJIGFtIG5vdCBpbnNpc3Rpbmcgb24NCmNoYW5naW5nIHRoZXNlLiBFc3BlY2lhbGx5IHNp
bmNlIHNvbWUgb2YgdGhlIGNvbW1lbnRzIGFyZSBtb3JlIHJlbGF0ZWQNCnRvIGNoYW5naW5nIHRo
ZSBvcmlnaW5hbCBiZDk1NzFtd3YgdGhhbiBhZGRpbmcgc3VwcG9ydCBmb3IgdGhpcyBuZXcgSUMu
DQpJIGp1c3QgdGhpbmsgb25lIG1pZ2h0IGJlIGFibGUgdG8gbWFrZSB0aGlzIGEgbGl0dGxlIGJp
dCBzaW1wbGVyIDopDQoNCj4gPHNuaXA+DQo+ID4gPiAgLyoqDQo+ID4gPiAgICogc3RydWN0IGJk
OTU3eF9kYXRhIC0gaW50ZXJuYWwgZGF0YSBmb3IgdGhlIGJkOTU3eCBkcml2ZXINCj4gPiA+ICAg
Kg0KPiA+IA0KPiA+IE92ZXJhbGwgYSBnb29kIGxvb2tpbmcgZHJpdmVyISBUaGFua3MgYSBsb3Qh
DQo+IA0KPiBUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIHJldmlldyENCj4gDQo+IEJ5IHRo
ZSB3YXksIEkgcmVhbGl6ZWQgTGludXgga2VybmVsIHN1cHBvcnRzIGJkOTU3Ni1yZWd1bGF0b3Iu
Yw0KPiBhbmQgaXQgaGFzICJiZDk1N3giLCBidXQgaXQgZG9lc24ndCBzZWVtIHRvIGJlIGNvbXBh
dGlibGUgd2l0aA0KPiBCRDk1NzEuDQo+IFNvLCBJIHdvbmRlciBpZiBJIHNob3VsZCBub3QgdXNl
ICJiZDk1N3giIGluIHRoZSBiZDk1NzFtd3YgZHJpdmVyIHRvDQo+IGF2b2lkDQo+IGNvbmZ1c2lv
bi4gQnV0LCB3aGF0IGRvIHlvdSB0aGluaz8NCg0KVmFsaWQgcG9pbnQuIEkgdGhpbmsgQkQ5NTcz
IGFuZCBCRDk1NzMgYXJlIGNsb3NlIHRvIGVhY2gtb3RoZXJzIGJ1dA0KbGFyZ2VseSBkaWZmZXJl
bnQgZnJvbSBCRDk1NzEgYW5kIEJEOTU3NC4uLiBHb29kIGV4YW1wbGUgd2h5IHdpbGRjYXJkcw0K
YXJlIHNvIGhhcmQuIEkgaGF2ZSBwcmV2aW91c2x5IGF0dGVtcHRlZCB0byB1c2UgdGhlIHdpbGRj
YXJkcyBpbiBST0hNDQpQTUlDIHNvZnR3YXJlIG5hbWluZyAtIGFuZCB1c3VhbGx5IGZhaWxlZC4g
VGhlIG51bWJlcmluZyBkb2VzIG5vdA0KcmVhbGx5IHNlZW0gdG8gcmVmbGVjdCB0aGUgZnVuY3Rp
b25hbGl0eS4uLiBTbyBtYXliZSBpIGFtIG5vdCB0aGUgYmVzdA0KcGVyc29uIHRvIGNvbW1lbnQg
b24gdGhpcyBYRA0KDQpPbiB0aGUgb3RoZXIgaGFuZCwgc29tZXRpbWVzIHdlIHdhbnQgdG8gaGln
aGxpZ2h0IHRoYXQgc29tZSBvZiB0aGUNCmZ1bmN0aW9ucy9kZWZpbmVzIGFyZSB1c2VkIGJ5IGFs
bCBJQyB2ZXJzaW9ucyBhIGRyaXZlciBzdXBwb3J0cyAtIHdoaWxlDQpvdGhlcnMgYXJlIElDIHNw
ZWNpZmljLiBGb3IgZXhhbXBsZSwgaW5zaWRlIHRoZSBkcml2ZXIgd2hpY2ggc3VwcG9ydHMNCkJE
NzE4MzcgYW5kIEJENzE4NDcgSSB1c2VkIEJENzE4WFggYXMgYSBwcmVmaXggZm9yIGRlZmluZXMg
dGhhdCB3ZXJlDQpjb21tb24gZm9yIGJvdGggSUNzLiBJQyBzcGVjaWZpYyBkZWZpbmVzIEkgbmFt
ZWQgd2l0aCBCRDcxODM3IGFuZA0KQkQ3MTg0Ny4gSSB0aGluayB0aGF0IHdhcyBxdWl0ZSBjbGVh
ciBpbnNpZGUgdGhlIGRyaXZlciAodW50aWwgQkQ3MTg1MA0Kd2FzIG1hZGUgLSB3aGljaCB1c2Vz
IHNhbWUgZGVmaW5lcyBhcyBCRDcxODQ3Li4uIDp8ICkNCg0KU28uLi4gTXkgc3VnZ2VzdGlvbiAt
IHlvdSBjYW4gcHJvYmFibHkgdXNlIHdpbGRjYXJkcyBpbnNpZGUgYSBkcml2ZXINCihhbmQgY29t
bWVudCB0aGluZ3Mgd2hlbiB3aWxkY2FyZHMgZG8gbm90IG1hdGNoIGFueW1vcmUpLiBCdXQgSSB3
b3VsZA0Kbm90IGFkZCB3aWxkY2FyZHMgdG8gYW55IGdsb2JhbGx5IHZpc2libGUgZGVmaW5lcyAo
aW4gZGVmaW5pdGlvbnMNCmluY2x1ZGVkIGZyb20gaGVhZGVycywgZmlsZSBuYW1lcywgLi4uKQ0K
DQpBcyBSb2IgcHV0IGl0IGEgd2hpbGUgYWdvIC0gIk5hbWluZyBpcyBoYXJkIi4gOikNCg0KQmVz
dCBSZWdhcmRzDQogICAgTWF0dGkgVmFpdHRpbmVuDQo=
