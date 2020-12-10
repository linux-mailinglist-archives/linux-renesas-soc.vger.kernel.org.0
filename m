Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C98582D557A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 09:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387967AbgLJI3t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 03:29:49 -0500
Received: from mail-eopbgr1320110.outbound.protection.outlook.com ([40.107.132.110]:2390
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387954AbgLJI3s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 03:29:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUvtYHeo7WDaDBSJyoXrbpOSuXS5hP+GvEUNAKx89HMpwiS4mMvk7nLMNCG5NaYb8ExTJiVJbXubXB2Lb4KVo+TB3VDI4tbTeVsTV0tlM+mKnA2gavfjwTd1Ah1luyL510UifyDVzaeb0BKA+2ZSsDtAem1fat0pGPVFg7b2CbphNUDQrf1FF8gJ0yGy3AboC1Vpf7U5oWzPR45AYvEQ68NRpE6SKoiIzEJut7zRtbdi5HqrBhLdJUzVZc9YhBSgNgEC0vqrYQtYCCPnMZK8UvJTZZ75ydljPGNzi0EOUHIQxGKXn1+3rKaIS0M3lWh6kupx5S0Nki/oX7NubaJSyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2fcoF4t+FdA7wx5bxrCvrRWeb6qVrITb2LT3L5VILo=;
 b=HO67jGLvtFl53k2BJ0n3I4h1LikHoCKaci/IxzDVaINspm2wcF4Z5raavOHMjebAxKSFS0AqvJcJC0rTwSqFnFcqYOkh1CJji975kbHUUdijepO8noJagIDLzCm3JmSusaIqxdFKeT4OJjm6MxiaWZ0Aeh3wpe4vBwHS8dVXbA5xcywDssJOK39pikhYbfxYanjOCw0nOqkkPpZ/TmiZ1PNeSNKtQvfVLgfMEUJ2V94vQUnZltsgZK9QdMVUUuhgd62ijEQTtYOzYj1wAUagiHJC+O2pJroplwEpyz8xuqDFWo4r+SmbHOUuscEvm65GnMHqGFstlkdo6u5TGAH2Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2fcoF4t+FdA7wx5bxrCvrRWeb6qVrITb2LT3L5VILo=;
 b=WL2htVeKo7TbAWHDcC0MOpyqorE32AtFawfFwMbH96Wvsh+A5bs3hAje1VV+6AJb8NnuR0WHmFaKqkdCJxql6hv/38If3WvvmIycNYQy9UfFr8wV78pgx1R4CNSAzRWnj5qRyT3MS3l7QtMzCxo3Q+Ob3imb0walqBbonR+zJBE=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB5004.jpnprd01.prod.outlook.com (2603:1096:404:118::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 10 Dec
 2020 08:28:13 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3654.015; Thu, 10 Dec 2020
 08:28:13 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
CC:     "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/3] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Topic: [PATCH 3/3] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Index: AQHWzTi2AvmFiRi710Seq6CPF4SJ96nuxG0AgAD19iCAADipAIAADOkAgAABZPA=
Date:   Thu, 10 Dec 2020 08:28:13 +0000
Message-ID: <TY2PR01MB3692AE318BCCA6F987AB5CD3D8CB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1607414643-25498-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWY_M=XZF4FtP0E0vU3u=S1Gj7ynQVLyn1KA9iRDgvvOQ@mail.gmail.com>
 <TY2PR01MB3692AE2EBAE6876F1CA26A34D8CB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <f19f7c3cf1d25e55a40825d6048ab9134b7d3502.camel@fi.rohmeurope.com>
 <CAMuHMdVL5MrHr7P=WCN4vqLaD6km7TocC5FK_dNJdnTMV+YBwg@mail.gmail.com>
In-Reply-To: <CAMuHMdVL5MrHr7P=WCN4vqLaD6km7TocC5FK_dNJdnTMV+YBwg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:70b3:188b:a9ac:357d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 917bba84-d3e7-4b25-0985-08d89ce58908
x-ms-traffictypediagnostic: TY2PR01MB5004:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB5004982CC8CEA9D953FEFA97D8CB0@TY2PR01MB5004.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xqwUb/gxMZGULiA6gLiqPt/2mm5A4l22Zm+9yW0GCqhexwh2e6MAXqPMh3TO0u0sMt+3C1NODrYcLtbzHiGXw48+ulZfEKmFcmshjaAvmTHedRRbgANyq1Uv4qZltXNoKTOaEJh2HvtWF8K6MmurlsDypjIV/0SmIV2gubs0rOHIwq4piR9OpadslUIEDI2qsbFMpX0py/fEF35iZclrcO/T/SqGloiTXU3F7nd1kSuvhOP3y3fmseMDs/yoUYkMKOT5ruhoeY2SPA/oX4jbyX6y4Jjq/M6M6m8WI9dwbzGw9Ijs8gxvsusVH4OePaqwR2m7PqfsQ+UHUWBDrUeq/Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(9686003)(83380400001)(71200400001)(508600001)(4326008)(6506007)(53546011)(64756008)(66476007)(76116006)(66946007)(110136005)(66446008)(186003)(54906003)(7696005)(66556008)(5660300002)(55016002)(33656002)(52536014)(86362001)(8936002)(4001150100001)(2906002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?aXVoaGd5TWdNOWRVMnc5bHVHZ1o5bTVBUE5ZSUpDTHhRWU8zekM0WW9uTkZp?=
 =?utf-8?B?R2l6eUxkSXRvYWFOVmtZZWQxb3o4Nkxac24rMCsyeFdCN0N5T3VoVEtxb3Vn?=
 =?utf-8?B?TElzSUlteE82NnB0Z1BTckVRaThJUlFML25kYnlyb0VFM2pBSFdSbHpIUks2?=
 =?utf-8?B?YkVYTkozdHl6ZnZDT20vNXRUMC85SXdYWEg3andsK2ZibnhFSUJQdWJuZ3dB?=
 =?utf-8?B?d3BKRzVwSU54SERyS0FhNnkvcjdQeVRkSmFxc3lWK2tiYThUdFVJZUZYbHdL?=
 =?utf-8?B?LytoSzBxUnh0OXh3MHZJRVFrZENtb2pQRzNLY1R3S1hYVUNKNUdQRFowZGwv?=
 =?utf-8?B?WDcvbTBxYW9oejFLaDdNdytYa0MyMmxVWVBoV0UyVmN1S0RrT1dVWm81OFpy?=
 =?utf-8?B?TEJzNFdJMGplWmZFRXRYaWJXMFNRaE9TVFJiK0dwRmNPVFhRWGgvVjcvU2Vw?=
 =?utf-8?B?ZHVYVnJWZE9BT0hIS1JiQ0tZM202OVFWVyszcld1U0czVmRHWnlHWTRxdjJH?=
 =?utf-8?B?REhyaGg2ZEtpY0VkY0dXOTM5elNTQlUvKzh2Z2xXSnQxczNtN2VmSDNQU3po?=
 =?utf-8?B?SzFxZWJHa3RpcCtzeFJsM1BZUzVxVFhhdEltc2N1c29aTUhzMkhSWmNNNGNQ?=
 =?utf-8?B?UDdLakhwa3FON2wzWWdENm5UOHJiSDBZSk5WNEFjR1BreTJReTRuaVcrcnRF?=
 =?utf-8?B?Y0prdmRzQ0tYY0E0U1pLU3BjZk5qa0p1YWZDbkdPVHJXcHlxa1QvdGFIU1Jv?=
 =?utf-8?B?MmVlbkJIYnkzbnRBYnJwTXA1OVlCVXBWNnFzd3BvdWo0R2RoVEtOaHFhcmF6?=
 =?utf-8?B?UXYwK1RDZXZLZVJiNGdHRTAvUHNFOSt3d1M1dlhKM3RickZiQ3ZaMnpmc2xO?=
 =?utf-8?B?SjNHT0N2QUdQM09hZUx6eCtYNXlMNTFOUmc5UjRtTWsvNE11NUFsb0Mza1Jn?=
 =?utf-8?B?N1pKRFpIVFRjMDZpdzZsZm1WL0RvUUVIM05wcEg5N3Bxb1JxRXEwWEFGeXV6?=
 =?utf-8?B?ZThoTW0zN01yQWdvQTVLenllQ0FsaVg0SXd3U2NXaEZqT1FpYUpIMWIrdUQ0?=
 =?utf-8?B?ek1hMzZwVlBYazQrVjRnc20yOU1qOXlqZFJtU2Ztc0toK1pJbmo2RkJYYko0?=
 =?utf-8?B?dzZLY2xKS0gvVGp2aXphNVVPdzRRSmNZd1NBOFJuOU15SGgvZVpZNVd3cmNL?=
 =?utf-8?B?YUhsR1V1bHRISjFQZHhnNGZFMjFhQTRSa29DRnNUTVpYNVJIS3ozODQyL1d3?=
 =?utf-8?B?OGdtWXdta0NJeGRTZEx3QnN4U3YxLzdwSkxJM3JGVlhaMkNGeUNycHdoQVRJ?=
 =?utf-8?B?WHBTa0RyallSK085T2FTRjZZYzgvaU42Uml3S3NDWlRUV0E5c1p5Rm51VEM5?=
 =?utf-8?Q?viO8HgKBA0R5eCsen0/fDg2MOfKSB1h0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 917bba84-d3e7-4b25-0985-08d89ce58908
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 08:28:13.2344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: End86LjRLpV+W+TxOqmC01Gu5r37KuHAD19MdeQTksAascugOxbgJ3xTLf96I/IM5lmzJte4Mq6wG+7NCopLKL20+uI2Km9+1HgbqId0Jr/u2blLyqs7tvzdsDISIEZO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB5004
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLCBNYXR0aSwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnRzIQ0KDQo+
IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNkYXksIERlY2VtYmVyIDEwLCAy
MDIwIDU6MjAgUE0NCj4gDQo+IEhpIE1hdHRpLCBTaGltb2RhLXNhbiwNCj4gDQo+IE9uIFRodSwg
RGVjIDEwLCAyMDIwIGF0IDg6MzMgQU0gVmFpdHRpbmVuLCBNYXR0aQ0KPiA8TWF0dGkuVmFpdHRp
bmVuQGZpLnJvaG1ldXJvcGUuY29tPiB3cm90ZToNCj4gPiBPbiBUaHUsIDIwMjAtMTItMTAgYXQg
MDQ6NDQgKzAwMDAsIFlvc2hpaGlybyBTaGltb2RhIHdyb3RlOg0KPiA+ID4gPiBGcm9tOiBHZWVy
dCBVeXR0ZXJob2V2ZW4sIFNlbnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgOSwgMjAyMCAxMDozMA0K
PiA+ID4gPiBQTQ0KPiA+ID4gPHNuaXA+DQo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9tZmQvYmQ5
NTcxbXd2LmMNCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL21mZC9iZDk1NzFtd3YuYw0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gQEAgLTE4Miw2ICsyNzIsOCBAQCBzdGF0aWMgaW50IGJkOTU3MW13dl9w
cm9iZShzdHJ1Y3QgaTJjX2NsaWVudA0KPiA+ID4gPiA+ICpjbGllbnQsDQo+ID4gPiA+ID4gICAg
ICAgICBwcm9kdWN0X2NvZGUgPSAodW5zaWduZWQgaW50KXJldDsNCj4gPiA+ID4gPiAgICAgICAg
IGlmIChwcm9kdWN0X2NvZGUgPT0gQkQ5NTcxTVdWX1BST0RVQ1RfQ09ERV9WQUwpDQo+ID4gPiA+
ID4gICAgICAgICAgICAgICAgIGJkLT5kYXRhID0gJmJkOTU3MW13dl9kYXRhOw0KPiA+ID4gPiA+
ICsgICAgICAgZWxzZSBpZiAocHJvZHVjdF9jb2RlID09IEJEOTU3NE1XRl9QUk9EVUNUX0NPREVf
VkFMKQ0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBiZC0+ZGF0YSA9ICZiZDk1NzRtd2ZfZGF0
YTsNCj4gPiA+ID4gPg0KPiA+ID4gPiA+ICAgICAgICAgaWYgKCFiZC0+ZGF0YSkgew0KPiA+ID4g
PiA+ICAgICAgICAgICAgICAgICBkZXZfZXJyKGJkLT5kZXYsICJObyBmb3VuZCBzdXBwb3J0ZWQg
ZGV2aWNlDQo+ID4gPiA+ID4gJWRcbiIsDQo+ID4gPiA+DQo+ID4gPiA+IFdoaWxlIEJEOTU3MU1X
ViBhbmQgQkQ5NTc0TVdGIGNhbiBiZSBkaXN0aW5ndWlzaGVkIGF0IHJ1bnRpbWUsDQo+ID4gPiA+
IEkgdGhpbmsgaXQgd291bGQgc3RpbGwgYmUgYSBnb29kIGlkZWEgdG8gZG9jdW1lbnQgYQ0KPiA+
ID4gPiAicm9obSxiZDk1NzRtd2YiDQo+ID4gPiA+IGNvbXBhdGlibGUgdmFsdWUgaW4gdGhlIERU
IGJpbmRpbmdzLCBhbmQgbGV0IHRoZSBkcml2ZXIgbWF0Y2ggb24NCj4gPiA+ID4gdGhhdC4NCj4g
PiA+DQo+ID4gPiBJbiB0aGlzIGRyaXZlciBwb2ludCBvZiB2aWV3LCB3ZSBjYW4gdXNlIHN1Y2gg
dGhlIERUIGJpbmRpbmdzLA0KPiA+ID4gaG93ZXZlciwgaW4gdGhlIGJvYXJkIHBvaW50IG9mIHZp
ZXcsIGl0J3MgZGlmZmljdWx0IHRvIGRlc2NyaWJlDQo+ID4gPiB3aGljaCBjaGlwIGlzIGluc3Rh
bGxlZCBvbiByOGE3Nzk5MC1lYmlzdS5kdHMuIFNvLCBJJ2QgbGlrZSB0bw0KPiA+ID4ga2VlcCB0
aGlzIHJ1bnRpbWUgZGV0ZWN0aW9uLg0KPiANCj4gVG8gY2xhcmlmeTogSSBtZWFudCB0byBkb2N1
bWVudCBhbmQgYWRkIHRoZSBjb21wYXRpYmxlIHZhbHVlLCBidXQNCj4gdHJlYXQgYm90aCBjb21w
YXRpYmxlIHZhbHVlcyB0aGUgc2FtZSBpbiB0aGUgZHJpdmVyLCBhbmQgc3RpbGwgZG8gcnVudGlt
ZQ0KPiBwcm9iaW5nLg0KDQpUaGFuayB5b3UhIEkgdW5kZXJzdG9vZCBpdC4NCg0KPHNuaXA+DQo+
ID4gUk9ITSB3b3VsZG4ndCBkbyB0aGlzIGJ1dCBzdGlsbC4uLiA6XSApLiBBbmQgcHJvZHVjaW5n
IGJvYXJkcyB3aGVyZSBEVFMNCj4gPiBkb2VzIG5vdCBhbGxvdyBkZXNjcmliaW5nIHRoZSBjb3Jy
ZWN0IGNvbXBvbmVudHMgc291bmRzIGxpa2UgYXNraW5nIGZvcg0KPiA+IGEgbm9zZS1ibGVlZCB0
byBtZS4uLiBJZiBwcm9iaW5nIG9mIElDIHR5cGUgZmFpbHMgQU5EIHRoZXJlIGlzIGRldmljZXMN
Cj4gPiB3aXRoIHdyb25nIFBNSUMgaW5mb3JtYXRpb24gYnVybmVkIGluIERUIC0gdGhlbiBmaXhp
bmcgaXQgY2FuIGJlIGENCj4gPiBuaWdodG1hcmUuIFNvIEkgd291bGQgcmVhbGx5IHRyeSBtYWtl
IERUUyBmaWxlcyBzdWNoIHRoYXQgdGhleSBjYW4gYmUNCj4gDQo+IFRoZSBpc3N1ZSB3ZSdyZSBm
YWNpbmcgaXMgdGhhdCBvbGRlciBFYmlzdS00RCBib2FyZHMgaGF2ZSBCRDk1NzEsIHdoaWxlDQo+
IG5ld2VyIGJvYXJkcyBoYXZlIEJEOTU3NC4gIFRoZSBzY2hlbWF0aWNzIHNheSAiQkQ5NTc0TVdG
LU0gKHRlbnRhdGl2ZQ0KPiB2ZXI6QkQ5NTcxVEwxX0UzKSIsIHNvIGl0IGxvb2tzIGxpa2UgYm90
aCBwYXJ0cyBhcmUgcGluLWNvbXBhdGlibGUNCj4gKGlnbm9yaW5nIG1pc3NpbmcgcGlucyBmb3Ig
QVZTLCBMRE8xLCBMRE8yLCBhbmQgTERPNiBvbiBCRDk1NzQpLg0KPiBIZW5jZSBhcmNoL2FybTY0
L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAtZWJpc3UuZHRzIGhhcyBhIGRldmljZSBub2RlDQo+
IGNvbXBhdGlibGUgd2l0aCAicm9obSxiZDk1NzFtd3YiLiAgSWYgd2UgaGF2ZSBydW50aW1lIHBy
b2JpbmcsIHdlIGNhbg0KPiBrZWVwIG9uIHVzaW5nIHRoYXQgZm9yIGJvdGggdmFyaWFudHMuDQoN
ClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIGV4cGxhaW5pbmcgdGhpcyEgSXQncyB2ZXJ5IGNsZWFy
IDopDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCg==
