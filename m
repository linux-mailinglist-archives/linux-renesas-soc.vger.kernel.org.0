Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 401C844C127
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Nov 2021 13:21:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231559AbhKJMX6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 07:23:58 -0500
Received: from mail-eopbgr1410139.outbound.protection.outlook.com ([40.107.141.139]:31456
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231460AbhKJMX5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 07:23:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1gyf25u514NhVGzWf9VqfwxjVtdsB6AI+cDTrXFRNceWWUsr/llw6Wa/G+szK4jBAyBe1BkAQur4aGCbFAWhBNyrZfUsZWFN+WbAu/LJnlmALSZdERXonljGE8VoJx9bIERvrORSj8yHg0+Kw0FrRS5cxj55iDKFdN6U1iNtWUUEDWM7xtCE2gBYr+JWuWk8QWWn5PqMcZuEIA6xHg1F5JUH43UsXFO1NpezIyfAF0qIxsUZ+aiMmmehDE4SqqMtTwJU+aYCz18O5NKQZt8x2Mg/iFy2MHb6NUqwmcesvKCyPsTYXkuvOt4c++M2Ow0I8263THnxbdB7K4lQGV+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMynxSE6JOWx36q9khVYJc9+4LkfIwUMX18xkcFx6PA=;
 b=VWrcqAvXRXcq2O29FvOGe9iNABoa42nH6GgTJYWzsAJX47JWAzlR9m+aSxN28jKLceUlUeJl0bMoHCR6QLZ1oSATuGMPwddE10mCvf19qPrHJ/91+PahpDv90xlgiSL9KpdtbJE47MncLn0rasZiOcr7M/8rx/q7MMgSV5IRik5N7n/sycibieI8ZSnTgKqKzX+BF8Yc0Ruzih7Ewq8qy06V+L/AXpNZPcFenUKPuw/L4qShBSGKMFCuRHgxpYKMU/5xr5303Rds5GNr/0Y0jVzzG5SntR4Xgt2xlAXE/AjzV+Vc9QUOOJWtvG0QGnU07C0pJD+e/DQM7xTloaC5ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMynxSE6JOWx36q9khVYJc9+4LkfIwUMX18xkcFx6PA=;
 b=OrEfibOVA6cyUoLbyODNMEIApSTmxlDGv2Xwhj1KfZUQChTII2Qi98YqA0a5wWHAcIb0/i3rk+6JIANgg7LhXjvb64CxD8jUIwgoysZMWoHkcOoiqAzYl9D3EzzL1Rd4MzW8BQfr1HsEBj3VVz6PcVPxlJtRNqHUq6G2Huvw+0I=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2913.jpnprd01.prod.outlook.com (2603:1096:603:3f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 10 Nov
 2021 12:21:08 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 12:21:08 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM
 support
Thread-Topic: [PATCH 2/2] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM
 support
Thread-Index: AQHX1g1yrO/DEDK5GkyhMVfA7q3phav8jySAgAAO94CAAAOp8IAABRaAgAAGcuA=
Date:   Wed, 10 Nov 2021 12:21:07 +0000
Message-ID: <OS0PR01MB5922FE03FB66C8BB411F63CF86939@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211110083152.31144-1-biju.das.jz@bp.renesas.com>
         <20211110083152.31144-3-biju.das.jz@bp.renesas.com>
         <CAMuHMdX+3TfX21HtuUcUQp1SZKJgZ0By8XFxzpxSED1H8_ua0w@mail.gmail.com>
         <d9f7b80e1abbd1323c5ec7fcdf57fb1a855929cd.camel@pengutronix.de>
         <OS0PR01MB59224396F5796647A675D75486939@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <92389952d7072efafaf7da67acfce84fd5f3b932.camel@pengutronix.de>
In-Reply-To: <92389952d7072efafaf7da67acfce84fd5f3b932.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc37a89e-b1c0-4253-0298-08d9a4449334
x-ms-traffictypediagnostic: OSAPR01MB2913:
x-microsoft-antispam-prvs: <OSAPR01MB29131DCCF22731632CE2855586939@OSAPR01MB2913.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V1lVpFVFnhhH2i4XLUDG/ioK+u3YwmgwL/u6frzgClM2nXxpnLWQWD7tla7SY07pgoyjjTgP4QqGDpRHs5n8p1qpxlMEwRceEAP0VPuDB3GpOpmA603yzAdT3AyWkuOBCpoCfwkveNU4RkldbAWl7qzqv7Gnd3bZyZNwA7WjpKLrBv3jbffBjU8zZyLxLe+Cr+lo7bN+62dzZC3Cf1R92GYwyQNn9n9t9qNZPC0QZNL+Bol/deVWPxAj+CovUDaV4CzhBhL61hIDoJu7BeyWMU3/wz4ehgC46+9A6jrWrx1XZ7+y3XPPUJ/abBRgrxvD0BezIznp2hwxjgZDg7RykEIICPyB03Ujd0LoMrXl0fW8pkvIpoC/8zyn3MikS4YoZ4I3PsKArEnpkoz7q0gauUKIMVre2+b+vPeYGt/alJBFV4NYyaI1098aOim4kECN4+f7T1IYJF9i631533i9vp/0XhBLxkmtPfOxERme5qOlexOXX2DIslcWxywRlowAwjP32J0cMgDwJyyja8XPn4hSyQ/CgKxZwRYPZewWbH1uIueA0GzIHsGFiOYSIcM/IrB4ONVk0yGaeVmA5WJZR2kphMh6/CywFAZ/hwfAmo2LdtRx/Dw94ysu1VuRIE5vWo93db84AoNkku51aCnQ3MnKDCXEInKtEJfoxjlCx1CKqB27/eJiavdPnHcTXm47+EevtlAB1bLiY9y4X/NfmQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(9686003)(6506007)(8676002)(86362001)(64756008)(66476007)(5660300002)(53546011)(83380400001)(7696005)(38100700002)(8936002)(55016002)(71200400001)(4001150100001)(26005)(52536014)(186003)(38070700005)(66946007)(4326008)(2906002)(54906003)(7416002)(66446008)(33656002)(316002)(66556008)(110136005)(122000001)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFpLeDNaenJuZ1lJLzhGV2dmQkhkb0MrZkZ3QVJzSjhYckxRT0o3NFZkVmR1?=
 =?utf-8?B?MkVZaWMyUXUzN3N1bUxuOVAyUG5VTlV3aXFHT3doWm9md2dEV0NoblQvbFNL?=
 =?utf-8?B?Z3FqWnFJNTI1OWVud0FVZVQ1S0QwQTc5dGVXNU1ML2pyRGZBTzVtekxod2hD?=
 =?utf-8?B?ZGFaclY4c2J4TEI3bHRjQTNnYUZZTStqRlhKWjlSNzVDRW8xZzhIVkR1QkYz?=
 =?utf-8?B?MXl3UWpJT2lWYk85ZThZR0RhYmJPVzVwZndHMW1xMG9YOFBrMVpkZDRHMFVz?=
 =?utf-8?B?NytSaWVZL0M3czArZHZxMElTVVlhS3JQdXFuTDJGUUFmamR0YnJBcTJmd1JP?=
 =?utf-8?B?NmdQUUZvZnczYmZiNkpubUt4bHZML3ZNM3VkZWJyek0zRndIT3lPR1RXNjV2?=
 =?utf-8?B?NERjbmFKenZtT1B0NUFuR1NtY2xUWStSTlZLblhsV1hsUUEyS3o5WnRWdnoz?=
 =?utf-8?B?SGhKNmNaVXRyL0p2dTk3aWRjeVhBemdzdnZlSVBybXBXUlJrbjNhdXBVRWd1?=
 =?utf-8?B?azErRC9qaklYWGYxcThXTXRDdVJmN0xkWk1wN3JPMzNFQTc3MCswa0d0dllp?=
 =?utf-8?B?YnBvek91bGUrQUljMitVditiWjJUVEw2eFZQRjNJL05YVWxTcmRRQzFIQ1F0?=
 =?utf-8?B?Umh5OEwrcWZldnk0MDdWald2S2lnbnMyQU45WWsydUlNRDgxakZsR2pBRTND?=
 =?utf-8?B?K2dTOEtDa2hsS0xWWFZHbVMvaHRDdlM3N2xWVjBiamVnMzlRR0xKbGYxZWxQ?=
 =?utf-8?B?ZTZpb2Y0OHUvTElZaFFvSFRFeTQ4UGJPaG9uQUZRQUV5TDUxZXRaSWEzSVIv?=
 =?utf-8?B?Qy9MdjBQQklVM3htWW9ZaXhqQktPRjJvZlpkQ2Fob2lBdUFjVDJsYWVZTjdY?=
 =?utf-8?B?VklyWFc0aCtvZVMxdVo1ejRiZUt3eXVBV29aT28wcnFrMlBOeklyQk9BYUdp?=
 =?utf-8?B?N3dHOXAwRkdiZWl6dGNlcVZjN2NLeWRWUnQ5TTR0YlBnNnRNY1NTaWVKV1Fr?=
 =?utf-8?B?QjVLN0h1Z282bGExRENHRTJkZDlSYTV5L09vSVp5d1VhajBpYmdqZ1o4eEtG?=
 =?utf-8?B?QnJNU25jOUZ3Y2E0dTBpeVozdjFKNERQdkdzaTRkeHB2SktWZXcxclZGRVc4?=
 =?utf-8?B?VXhEUUhlUERJWTZUU0VkS3MzZEErQ2tiOWtBTE1BQWxCTlh4TnViRWUwQVAw?=
 =?utf-8?B?aFVWTnlaL3FOY2EydTNkU1hodGxoYVJLRkhKOVBlcE1GWkdyVmUvQm5FTDF1?=
 =?utf-8?B?U1RxWHdCT3ZCS1EwTG01OS9ZZFdvQm0yRndWQjhzZ2RXUjMxblMzNEFrelQ0?=
 =?utf-8?B?aXNlMXNZMVVlVjA3eEE2aFdhcGI2OW5BWUFZRTh0cWhPT2JtK3RuVnRRekl1?=
 =?utf-8?B?QWFYVjZNRHFwRGYxL1hXRUZZVm5DZk9TbEYwNkNxNnFERVZKdU9sa2ZRdGJV?=
 =?utf-8?B?S3R4VjlrbnR5OWxJdEgwaURabDNvSVZpNzlnYlc0QnNkRzZzNTA2eWd5Rmxx?=
 =?utf-8?B?NHorQkdQZTRlYmVnQkxkZzVTUk9saDdqeW15OUdmdU9PaCtnUWdpaWpFaU1K?=
 =?utf-8?B?R2oxekJNbEZYU25pTE9XR05UVkdvRnF0SVVRcjQrRGg3UzkvRGtaWTZDMkQw?=
 =?utf-8?B?N1MrWXJ3S3VLcHVBZExzaFV2RTVVZGxiTkxLbk9SYnBGdnF1WVRtQUxHWFJi?=
 =?utf-8?B?WmdjUU5BVUxLWXZXRm5CZnMzNjRaWDRCZjJtNTJjL1hxdXRXR2ROQVh6a2th?=
 =?utf-8?B?UUUySnU1RCsvOWNHNmx3SU10aHBtcUQweG9aQk1QdXhRTm0vSlB4VzVBVUJk?=
 =?utf-8?B?ZVRNc0RQbVg2YjdaUzRkNGxmc0FCbFVQUCt2YUJyMDN0ZnVTTUFKMXRNNTFt?=
 =?utf-8?B?VzE4N3BCSC9FMzJkajQzRUdjL3p6Y2FZUDdsYzd6VE4vRElJSnRJVDRiMHZN?=
 =?utf-8?B?WXVEVktMM2UrTG04OVhVdXUrNjZ6cDV0ekVOWVFqV0VGVWN4SG5YdVFESldQ?=
 =?utf-8?B?L3RESlI3ZG85Nnk5bGhpNFVDUmJ5US9qTjdoVDJJWVkzUnh1NDNNSXQrZ3l0?=
 =?utf-8?B?Y1F5ZUg2MUt5T0JPZ2lwcGJnRmljaVBPVjdIKzdrSnBjMXlCRVBOYkI0R0Nr?=
 =?utf-8?B?OHN4bmFGUFloMW5LY0crNzJtNXFZN0k5VUdWQXZYZkRVZ2ZMNmhnWnhHVWF4?=
 =?utf-8?B?ZVo1aWxRamhzUHdZS3JIbU9zSGgyb24zT1BOSkhCb3dqYXJRT0d6ZzczOS9K?=
 =?utf-8?B?QmZNTFJwWEd0RzA1SXZyR3Jlekl3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc37a89e-b1c0-4253-0298-08d9a4449334
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 12:21:07.8859
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HSeqQqH6HuRhFgWUb7ec4bavhF83E3ha6W5wfvfd8mLXp6ia6PTQLDW/89uZ74/hxcOS/uAQm8/N4asYShFpPQJDlry1DN512SNCDtiGeOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2913
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgUGhpbGlwcCwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gY2xvY2tzb3VyY2UvZHJp
dmVycy9yZW5lc2FzLW9zdG06IEFkZCBSWi9HMkwgT1NUTQ0KPiBzdXBwb3J0DQo+IA0KPiBPbiBX
ZWQsIDIwMjEtMTEtMTAgYXQgMTE6MzcgKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+IEhpIFBo
aWxpcHAgYW5kIEdlZXJ0LA0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQo+ID4N
Cj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBjbG9ja3NvdXJjZS9kcml2ZXJzL3JlbmVz
YXMtb3N0bTogQWRkDQo+ID4gPiBSWi9HMkwgT1NUTSBzdXBwb3J0DQo+ID4gPg0KPiA+ID4gSGkg
R2VlcnQsIEJpanUsDQo+ID4gPg0KPiA+ID4gT24gV2VkLCAyMDIxLTExLTEwIGF0IDExOjI3ICsw
MTAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQo+ID4gPiA+IEhpIEJpanUsDQo+ID4gPiA+
DQo+ID4gPiA+IE9uIFdlZCwgTm92IDEwLCAyMDIxIGF0IDk6MzIgQU0gQmlqdSBEYXMNCj4gPiA+
ID4gPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4g
UlovRzJMIFNvQyBoYXMgR2VuZXJpYyBUaW1lciBNb2R1bGUoYS5rLmEgT1NUTSkgd2hpY2ggbmVl
ZHMgdG8NCj4gPiA+ID4gPiBkZWFzc2VydCB0aGUgcmVzZXQgbGluZSBiZWZvcmUgYWNjZXNzaW5n
IGFueSByZWdpc3RlcnMuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGlzIHBhdGNoIGFkZHMgYW4g
ZW50cnkgcG9pbnQgZm9yIFJaL0cyTCBzbyB0aGF0IHdlIGNhbg0KPiA+ID4gPiA+IGRlYXNzZXJ0
IHRoZSByZXNldCBsaW5lIGluIHByb2JlIGNhbGxiYWNrLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+
ID4gPiA+IFJldmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyDQo+ID4gPiA+ID4gPHByYWJoYWthci5t
YWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4NCj4gPiA+ID4gVGhhbmtzIGZv
ciB5b3VyIHBhdGNoIQ0KPiA+ID4gPg0KPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvY2xvY2tzb3Vy
Y2UvcmVuZXNhcy1vc3RtLmMNCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3Jl
bmVzYXMtb3N0bS5jDQo+ID4gPiA+ID4gQEAgLTIwOSwzICsyMTEsMzkgQEAgc3RhdGljIGludCBf
X2luaXQgb3N0bV9pbml0KHN0cnVjdA0KPiA+ID4gPiA+IGRldmljZV9ub2RlDQo+ID4gPiA+ID4g
Km5wKQ0KPiA+ID4gPiA+IMKgfQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gwqBUSU1FUl9PRl9ERUNM
QVJFKG9zdG0sICJyZW5lc2FzLG9zdG0iLCBvc3RtX2luaXQpOw0KPiA+ID4gPg0KPiA+ID4gPiBC
YWNrZ3JvdW5kOiB0aGlzIGRyaXZlciB1c2VzIFRJTUVSX09GX0RFQ0xBUkUoKSBiZWNhdXNlIHRo
ZSBPU1RNDQo+ID4gPiA+IGlzIHRoZSBzeXN0ZW0gdGltZXIgb24gUlovQSBTb0NzLCB3aGljaCBk
byBub3QgaGF2ZSB0aGUgQVJNDQo+ID4gPiA+IGFyY2hpdGVjdHVyZWQgdGltZXIuICBSWi9HMkwg
ZG9lcyBoYXZlIHRoZSBBUk0gYXJjaGl0ZWN0dXJlZCB0aW1lci4NCj4gPiA+DQo+ID4gPiBUaGFu
a3MuDQo+ID4gPg0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArI2lmZGVmIENPTkZJR19BUkNIX1I5
QTA3RzA0NA0KPiA+ID4gPiA+ICtzdGF0aWMgaW50IF9faW5pdCBvc3RtX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpIHsNCj4gPiA+ID4gPiArICAgICAgIHN0cnVjdCBkZXZpY2Ug
KmRldiA9ICZwZGV2LT5kZXY7DQo+ID4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgcmVzZXRfY29udHJv
bCAqcnN0YzsNCj4gPiA+ID4gPiArICAgICAgIGludCByZXQ7DQo+ID4gPiA+ID4gKw0KPiA+ID4g
PiA+ICsgICAgICAgcnN0YyA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRfZXhjbHVzaXZlKGRldiwg
TlVMTCk7DQo+ID4gPiA+ID4gKyAgICAgICBpZiAoSVNfRVJSKHJzdGMpKQ0KPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIocnN0YyksICJm
YWlsZWQNCj4gPiA+ID4gPiArIHRvIGdldCByZXNldCIpOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4g
PiArICAgICAgIHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQocnN0Yyk7DQo+ID4gPiA+ID4gKw0KPiA+
ID4gPiA+ICsgICAgICAgcmV0ID0gb3N0bV9pbml0KGRldi0+b2Zfbm9kZSk7DQo+ID4gPiA+ID4g
KyAgICAgICBpZiAocmV0KSB7DQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHJlc2V0X2NvbnRy
b2xfYXNzZXJ0KHJzdGMpOw0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0K
PiA+ID4gPiA+ICsgICAgICAgfQ0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArICAgICAgIHJldHVy
biAwOw0KPiA+ID4gPiA+ICt9DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCBvc3RtX29mX3RhYmxlW10gPSB7DQo+ID4gPiA+ID4gKyAgICAg
ICB7IC5jb21wYXRpYmxlID0gInJlbmVzYXMscnpnMmwtb3N0bSIsIH0sDQo+ID4gPiA+DQo+ID4g
PiA+IEkgYmVsaWV2ZSB0aGUgT1NUTSBibG9jayBvbiBSWi9HMkwgaXMgaWRlbnRpY2FsIHRvIHRo
ZSBvbmUgb24NCj4gPiA+ID4gUlovQSwgYW5kIHRoZSByZXF1aXJlbWVudCB0byBkZWFzc2VydCBp
dHMgbW9kdWxlIHJlc2V0IGlzIGFuIFNvQw0KPiA+ID4gPiBpbnRlZ3JhdGlvbiBmZWF0dXJlIG9u
IFJaL0cyTC4gIEhlbmNlIHRoZSBkcml2ZXIgc2hvdWxkIG1hdGNoIG9uDQo+ICJyZW5lc2FzLG9z
dG0iDQo+ID4gPiA+IGZvciBib3RoPw0KPiA+ID4NCj4gPiA+IElmIHRoYXQgaXMgdGhlIGNhc2Us
IHRoZSByZXNldCBjb3VsZCBiZSBtYWRlIHJlcXVpcmVkIGZvcg0KPiA+ID4gwqDCoGNvbXBhdGli
bGUgPSAicmVuZXNhcyxyOWEwN2cwNDQtb3N0bSIsICJyZW5lc2FzLG9zdG0iOyBpbiB0aGUNCj4g
PiA+IC55YW1sIGZpbGUuDQo+ID4gPg0KPiA+ID4gPiBTbyBteSBzdWdnZXN0aW9uIHdvdWxkIGJl
IHRvIGluY2x1ZGUgdGhlIHJlc2V0IGhhbmRsaW5nIGluDQo+ID4gPiA+IG9zdG1faW5pdCgpIGlu
c3RlYWQsIGJ1dCBtYWtlIGl0IG9wdGlvbmFsLCBhbmQgZXJyb3Igb3V0IGluIGNhc2Ugb2YNCj4g
LUVQUk9CRV9ERUZFUi4NCj4gPiA+ID4NCj4gPiA+ID4gSW4gY2FzZSBpbml0aWFsaXphdGlvbiBm
cm9tIFRJTUVSX09GX0RFQ0xBUkUoKSBmYWlsZWQsIHRoZQ0KPiA+ID4gPiBwbGF0Zm9ybSBkcml2
ZXIgY2FuIGtpY2sgaW4gbGF0ZXIgYW5kIHJldHJ5Lg0KPiA+ID4gPg0KPiA+ID4gPiBIb3dldmVy
LCBpdCBzZWVtcyBfX29mX3Jlc2V0X2NvbnRyb2xfZ2V0KCkgaWdub3JlcyBhbGwgZXJyb3JzLA0K
PiA+ID4gPiBpbmNsdWRpbmcgLUVQUk9CRV9ERUZFUiwgaWYgb3B0aW9uYWwgaXMgdHJ1ZSwgc28g
dGhpcyB3b24ndCB3b3JrPw0KPiA+ID4gPg0KPiA+ID4gPiBQaGlsaXBwOiBpcyB0aGF0IGNvcnJl
Y3Q/IElmIHllcywgb3N0bV9pbml0KCkgaGFzIHRvIGNoZWNrIHRoZQ0KPiA+ID4gPiBwcmVzZW5j
ZSBvZiBhIHJlc2V0cyBwcm9wZXJ0eSB0byBzZWUgaWYgdGhlIHJlc2V0IGlzIG9wdGlvbmFsIG9y
DQo+ID4gPiByZXF1aXJlZC4NCj4gPiA+DQo+ID4gPiBObywgX19vZl9yZXNldF9jb250cm9sX2dl
dCgpIHNob3VsZCBvbmx5IHJlcGxhY2UgaXRzIC1FTk9FTlQgcmV0dXJuDQo+ID4gPiB2YWx1ZSBk
dWUgdG8gZXJyb3JzIGZyb20gb2ZfcHJvcGVydHlfbWF0Y2hfc3RyaW5nKCkgYW5kDQo+ID4gPiBv
Zl9wYXJzZV9waGFuZGxlX3dpdGhfYXJncygpIHdpdGggTlVMTC4gQW55dGhpbmcgZWxzZSBJJ2Qg
Y29uc2lkZXIgYQ0KPiBidWcuDQo+ID4gPg0KPiA+ID4gU3BlY2lmaWNhbGx5LCAtRVBST0JFX0RF
RkVSIGlzIHN0aWxsIHJldHVybmVkIGlmIG5vIGV4aXN0aW5nIHJjZGV2DQo+ID4gPiBpcyBmb3Vu
ZCBtYXRjaGluZyB0aGUgc3VjY2Vzc2Z1bCAicmVzZXRzIiBwaGFuZGxlIGxvb2t1cC4gU28NCj4g
PiA+DQo+ID4gPiAJcnN0YyA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRfb3B0aW9uYWxfZXhjbHVz
aXZlKGRldiwgTlVMTCk7DQo+ID4NCj4gPiBJbiB0aGlzIGNhc2UsIEhvdyBkbyB3ZSBnZXQgZGV2
IGhlcmUgZnJvbSBkZXZpY2Vfbm9kZSwgYXMgZGV2aWNlIGlzIG5vdA0KPiBhdmFpbGFibGUgYXQg
dGhpcyBwb2ludD8NCj4gDQo+IE9oLCByaWdodC4NCj4gV2UgYXJlIG1pc3NpbmcgYW4gb2ZfcmVz
ZXRfY29udHJvbF9nZXRfb3B0aW9uYWxfZXhjbHVzaXZlKCkgZm9yIHRoaXM6DQo+IA0KPiBzdGF0
aWMgaW5saW5lIHN0cnVjdCByZXNldF9jb250cm9sDQo+ICpvZl9yZXNldF9jb250cm9sX2dldF9v
cHRpb25hbF9leGNsdXNpdmUoDQo+IAkJc3RydWN0IGRldmljZV9ub2RlICpub2RlLCBjb25zdCBj
aGFyICppZCkgew0KPiAJcmV0dXJuIF9fb2ZfcmVzZXRfY29udHJvbF9nZXQobm9kZSwgaWQsIDAs
IGZhbHNlLCB0cnVlLCB0cnVlKTsgfQ0KDQpJIGhhdmUgdGVzdGVkIE9TVE0gZHJpdmVyIHdpdGgg
dGhpcyBuZXcgQVBJIGFuZCB3b3Jrcy4NCg0KSG93IGRvIHdlIHByb2NlZWQ/IFdpbGwgeW91IHN1
Ym1pdCB0aGlzIHBhdGNoIHNlcGFyYXRlIGluIHJlc2V0IHRyZWUgPyBvciBEbyB5b3Ugd2FudCBt
ZSB0byBzZW5kIHRoaXMgcGF0Y2ggDQphcyB2MiBmb3IgdGhpcyBzZXJpZXM/DQoNClBsZWFzZSBs
ZXQgbWUga25vdy4NCg0KUmVnYXJkcywNCkJpanUgDQo+IA0KPiByZWdhcmRzDQo+IFBoaWxpcHAN
Cg==
