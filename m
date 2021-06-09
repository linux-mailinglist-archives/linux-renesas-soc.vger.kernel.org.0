Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8CDD3A0D3A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 09:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234971AbhFIHKF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 03:10:05 -0400
Received: from mail-eopbgr1410124.outbound.protection.outlook.com ([40.107.141.124]:6208
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235073AbhFIHKA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 03:10:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mc595umWPDg8PQCK0tFrQmqSfVbmYMz9JJALWNeh+DEFaXNEBwJStbp6LURq7RtoFnjdyF7xWpHO71Vz3g0Eqlue7K22e7DiglESp88sKTt4wQVfJB/V9IcN6mCCm7TWAJq0T2DeR/ToZrIGfpidRSGYhyGZUPtSan6H3XGgOTKT24cwDeibF4A7oLt+kaZS59u2GQc0mnXPmGYnVC2eic284xz6xJEYsrlqn1Oxi6V790fOS3IpsY8H28MKXaG+oxL8HlvKB7gXCb8kDuPYZXuTK+hCXmvdGaZL9yPVd3hDz/RSeVFFSDX5kiPrQHB+RGOGcduldo5IWadNLgndPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NePzZR2srf00vjJKB1Xj1OtHi50CUr015xliIMSqEuU=;
 b=F9KCh0QAEjkwPNmnRj4W/uOZFrPvSXqI+sNLyrLmYnXVY7/pXgYCBSz1fHpJR77/aQ+Lts6NUH7dti+1V7rELmTbBeP61zLSceoRT2Folz1fyuPsSWDJqXBwWOncGvXLfqZKwEI4/OcM0boSjXwiK+VhcteRfAafeT7yAFqv0BH7vVeRUR5OgSPiuYQL47+lnCtYtyyhAc4QPwDVt0WXKF/L/ikwZty4cZgskTFvBhi7IXuWGDYrTSgz0wqnxLxz2XRxJjfZw94tKEh62yQvSW72Rf359oFbBDIY36sHq9VBKZhsr9hvpk+d5zEFnHg2DPF4czgqDj1BUmI08tyhqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NePzZR2srf00vjJKB1Xj1OtHi50CUr015xliIMSqEuU=;
 b=Aa4h/zWEQ1sFrYz/XOUVnl53gUX/D5xG1QU2Nq5FocbA35/OcHhU/Am/g1QHC9A6WgTf0/qAPxTIuW9ec+tiMb29xCMmAwx/CPearT9gnUOb3Rqw9ziKT6xz0PSDLEs7mZfqY56dPL+xAYdUwC/ZgC/dkCagbve8CcSNHNzmhBM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5701.jpnprd01.prod.outlook.com (2603:1096:604:c2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.27; Wed, 9 Jun
 2021 07:08:02 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4219.021; Wed, 9 Jun 2021
 07:08:02 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: RE: [PATCH v2 11/12] arm64: dts: renesas: Add initial DTSI for
 RZ/G2{L,LC} SoC's
Thread-Topic: [PATCH v2 11/12] arm64: dts: renesas: Add initial DTSI for
 RZ/G2{L,LC} SoC's
Thread-Index: AQHXWMZyYuQzkjFuh0OkiBvnoZpocasD3lhAgAdqnICAAABloA==
Date:   Wed, 9 Jun 2021 07:08:02 +0000
Message-ID: <OS0PR01MB5922432E7C5FC1188FAB73FE86369@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210603221758.10305-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <OS0PR01MB592232BFAF59D5C81CCBE6C7863B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdWCVsMOnURjS8BP9KW=nYW6q9hEfdb_x5_hLei=1DWp3g@mail.gmail.com>
In-Reply-To: <CAMuHMdWCVsMOnURjS8BP9KW=nYW6q9hEfdb_x5_hLei=1DWp3g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.219.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82221a77-82cf-478d-4114-08d92b15523f
x-ms-traffictypediagnostic: OS3PR01MB5701:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB570176E3D87F1FE35615608F86369@OS3PR01MB5701.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5SRY94Vj6w+RAlAj2D60AOMq2XdSB1KulzjM+5b1OWwhrQAHmLf22N85LT63jzJnRDmS2th9TY/vpuCp9C9HsxWhLpA+1Bs+ESVYcaVb/pbSTQypHOUdFu09o7t46YE4b5Ysqlx2665OGINqAWWrrfpK4/Ds8/wshqLrdi4vTVuSzeqB2LtFEIX4vqAGeRgKmPRmNPFnQSu9naSMq9HY0LpyMnT2uj8Dglcz9dvQDgIgEWa1gIeaub+EO4GnoP1ThA5Jh02gBjwt8kLJcX7VzsF7qL8S19KPtZG13Jw03pOo8EqhJPxNZrUIeB4VKxfQ7ihw+9cYHOsbPfqwTP/rS4aTvf4IuOZ0u53zuKjl7oOgc9VLqqRP18D28jGiocMiLByQ21loIDGPvI84wQYZbGYti3QmM6eNudlOucgscQGj23qrQbuZodlEbRhNEz/I8BIMpmCOtaqrs6exHSspfAU2X/79uRon9jAlO4cjXB8RztgQ7OnoO1QnB0+2LAmMvE11XPE+6M/mCgs4DYT7nVvhqxbgqxFJdmOLi6xvpzI/1Gx2/MUDl84Sg+3Q0RG4b7nAl111mp4PELw+TGLLcmXa/WYKQGfueWGrAIcxe44=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(26005)(9686003)(55016002)(66946007)(6506007)(186003)(71200400001)(5660300002)(33656002)(7416002)(6916009)(316002)(66446008)(76116006)(2906002)(86362001)(52536014)(54906003)(66476007)(4326008)(64756008)(66556008)(83380400001)(7696005)(122000001)(8936002)(8676002)(38100700002)(53546011)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?aUVadUhVUUZCSXBhaGQyZWsxM1BNQ1V3NnZuQ1JlNEhVNVloWTllMGx1YWlm?=
 =?utf-8?B?T3RwcnNFSTdxNlp1Njl2aXBMbmU0Wk1BVVErZlk2OWh2RVdyaGZ6Sm4wczNN?=
 =?utf-8?B?bG9WZ3VrejRwZ1RkbVF1L3lKejhDOUtzRVJzRUo0Q1lXeGRlamFmaTdRYTI5?=
 =?utf-8?B?czZTQWYvaVgrMXE5OHhLUnRMWFJITTZBd0NSN2tGa3lNcGZCVFR2clNBNWVT?=
 =?utf-8?B?eUxwL3J5M3Q2bnp2akFTbmxEeFl2SExFa01EeGFXQVBMK3B5dFJDcHQ2LzB4?=
 =?utf-8?B?YjZsdW9NOWVQbzFGN3NjaDZ1RWNMWXJDT0hHTElmY1dTSlVmNk5mbDdzQ2Za?=
 =?utf-8?B?SDI3ZU5KTzExQlpOYkErSWw5NUFHZGNxMzNZdnYxNXR0dVpMZzR5bkZtTkV6?=
 =?utf-8?B?a1VwUFN5WkFUUDU2UllwK1pSYUxzSFV1S0dIcWFHTktnNlhTcWs5Z1FlaHJn?=
 =?utf-8?B?aXgwTW9rcndVRHJYRjJ0a0xWZ0NJYld3SDA5eURIVm5DRDRkdWdqTjlabWlC?=
 =?utf-8?B?VysyTU5nQXA0YUMrNitNbklDZFhkQm5CQ2ptaFpFT2dkbVZxeCt1U1dKbjdD?=
 =?utf-8?B?aWRrUkNSLzFtLzdLQllPeG5lYzZValFNWCtMYUNvRG5XS0paRmwxc2pFVHAr?=
 =?utf-8?B?RVJpa1d5OVVOOG5EVWR6SmkyQmJQYkRQR2NGcmRVT2RYOVRld1lBTnNzTzZ4?=
 =?utf-8?B?NU1VV0hURzFiZ2JZV21wTDRxTmd6dVhHcFpqZE02bW1QeFpsVDd2L2x0dzE0?=
 =?utf-8?B?RDVUd2tHKzFncHlZK1pQV0t1aS9YRG1IRlM2YUFjWm8yMzRKaFBxckRmOCt5?=
 =?utf-8?B?dVkySjF6V3RLUVpGVTBYSlpHc3AvRnFnOFF5TlVzbFVwbGYyZXpQc1pOODNu?=
 =?utf-8?B?Wk9pY29IVDVBN1ZpNzNBUWlxNHh1bFg2N01tUE5LRTI4M3RrZTc5YlA3SlJQ?=
 =?utf-8?B?bW41Q05Pem1YaE5LTEFyeFc4SnFiMVU5cHAveUtydWxRL0hWS3BqQ0cyUXND?=
 =?utf-8?B?dGN5QllJVko0LzNsam1pRVBFQXNhTUtubUNsTStPRDZBK1hvamFDT280Mnhy?=
 =?utf-8?B?MStUT0NDMDROZUJKblpJRnh3SXZITkRIT21hKy8xMDJxTnZBNU9RN1FCU3B2?=
 =?utf-8?B?VW5RTUl0NEYycVVSTWF4ZnRTelRrSlJ4aGIxeFFvOThNNndtTDBzUHdyaGM0?=
 =?utf-8?B?MjR6SWN3WGxHRTV0YW9EYTJpYklZaXVwdWF3anYxQzU3K0I2VFVSZnJELzNN?=
 =?utf-8?B?ZG8rczV1Nzh3Q0RHbGRLbzdwZEU3RVdJR0R5RjJDT3U2aVB5WEtPdDBpZ2t6?=
 =?utf-8?B?WG5JVjZzMlBrcUFqSUVHK2wzV1BpRHdzbXFPK2poc0RrODlJRHdBWGV0LzVm?=
 =?utf-8?B?c0h6TStld0JHUlg0Um9iRjdWVW44ZGxJZGc4RzNsdytWMFNUcHBUNmhtK25Y?=
 =?utf-8?B?dmNGeFpZeXZVVVMwWklpakEvcnlqUWZXaTdrRjN0MVVoY0N2QmwvRyt5eFpC?=
 =?utf-8?B?WlNTeFZSdk1zUEZleVpiTXhVdlJBcWNTbzFpeUJqRTFSVzhNbjdzZk5HRkNu?=
 =?utf-8?B?OUh0VTF3UC9EVDNteW5nU3BQbnZGWW9VQnFkaGFuQzlyajBLYkRGaWhmNDV3?=
 =?utf-8?B?WWRnT1poVkRQT1ZFZ2JHWjRTS2JNaytWM1NmUVpiYXV3MUtIelU5VzJnME1Y?=
 =?utf-8?B?ODluRXZxVTNHc1RsNmIrbUVwU3E1MVFWd05QUnBYalI5WEs5a0s4K0dFa1ZT?=
 =?utf-8?Q?oY9Wv83xa5QLT9Q2pODpK1nwLWCUTXc99xT+bsj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82221a77-82cf-478d-4114-08d92b15523f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 07:08:02.1719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lUhDlRgZLEAS+G0npGkAWgd4Zkwdc9eKW3cwUJ5z+0Azv68Dgw5aiWozrwaaGJrX/Td9lwRhsvkIfuBDfyB1RCVD3z8t6wrCMucUPb+Ztds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5701
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMTEvMTJdIGFybTY0OiBkdHM6IHJlbmVzYXM6IEFkZCBpbml0aWFsIERUU0kgZm9y
DQo+IFJaL0cye0wsTEN9IFNvQydzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gRnJpLCBKdW4g
NCwgMjAyMSBhdCAzOjU1IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4N
Cj4gd3JvdGU6DQo+ID4gPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMTEvMTJdIGFybTY0OiBkdHM6IHJl
bmVzYXM6IEFkZCBpbml0aWFsIERUU0kgZm9yDQo+ID4gPiBSWi9HMntMLExDfSBTb0Mncw0KPiA+
ID4NCj4gPiA+IEFkZCBpbml0aWFsIERUU0kgZm9yIFJaL0cye0wsTEN9IFNvQydzLg0KPiA+ID4N
Cj4gPiA+IEZpbGUgc3RydWN0dXJlOg0KPiA+ID4gcjlhMDdnMDQ0LmR0c2kgID0+IFJaL0cyTCBm
YW1pbHkgU29DIGNvbW1vbiBwYXJ0cyByOWEwN2cwNDRsMS5kdHNpDQo+ID4gPiA9PiBTcGVjaWZp
YyB0byBSWi9HMkwgKFI5QTA3RzA0NEwgc2luZ2xlIGNvcnRleCBBNTUpIFNvQw0KPiA+ID4NCj4g
PiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXINCj4gPiA+IDxwcmFiaGFrYXIubWFoYWRl
di1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+
ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0NC5kdHNpDQo+IA0K
PiA+ID4gKyAgICAgICAgICAgICBjcGc6IGNsb2NrLWNvbnRyb2xsZXJAMTEwMTAwMDAgew0KPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEwN2cwNDQt
Y3BnIjsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MCAweDExMDEwMDAwIDAg
MHgxMDAwMD47DQo+ID4NCj4gPiBXaGF0IGFib3V0IFdEVE9WRl9SU1QoMHhCMTApIGFuZCBXRFRS
U1RfU0VMKDB4QjE0KSByZWdpc3RlcnMsIHRoaXMNCj4gcmVnaXN0ZXJzIHRvIGJlIGhhbmRsZWQg
YnkgV0RUIGRyaXZlci4NCj4gPiBVbmZvcnR1bmF0ZWx5IGl0IGlzIGluIENQRyBibG9jay4NCj4g
Pg0KPiA+IFNvIGRvIHdlIG5lZWQgdG8gbWFwIHRoZSBlbnRpcmUgQ1BHIHJlZ2lzdGVycyBvciB1
cCB0byAweEIwMD8NCj4gPg0KPiA+IEdlZXJ0LCBQcmFiaGFrYXI6IEFueSB0aG91Z2h0cz8NCj4g
DQo+IEFzIHRoZSByZWdpc3RlcnMgYXJlIHBhcnQgb2YgdGhlIENQRyBibG9jaywgSSB0aGluayB0
aGV5IHNob3VsZCBiZSBjb3ZlcmVkDQo+IGJ5IHRoZSBDUEcgbm9kZS4gIFlvdSBjYW4gaGFuZGxl
IHRoZW0gaW4gdGhlIENQRyBkcml2ZXIsIHRocm91Z2ggZnVuY3Rpb25zDQo+IGNhbGxlZCBmcm9t
IHRoZSBXRFQgZHJpdmVyIChjZnIuIHJjYXJfcnN0X3JlYWRfbW9kZV9waW5zKCkpLg0KDQpHb3Qg
aXQuIFNpbWlsYXIgY2FzZSBmb3IgV0RUQ1RSTCByZWdpc3RlciB0byBzdG9wIHdhdGNoZG9nLiBU
aGlzIHJlZ2lzdGVyIGlzIGluIFNZU0MgYmxvY2suIFNvDQp3ZSBuZWVkIHRvIGhhbmRsZSB0aGlz
IHJlZ2lzdGVyIGluIFNZU0MgZHJpdmVyLg0KDQpDaGVlcnMsDQpCaWp1DQoNCg0KPiANCj4gR3J7
b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiAN
Cj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlv
bmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
Lg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9n
cmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
