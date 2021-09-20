Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD9624112B5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Sep 2021 12:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235567AbhITKO7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Sep 2021 06:14:59 -0400
Received: from mail-eopbgr1410091.outbound.protection.outlook.com ([40.107.141.91]:32405
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230289AbhITKO6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 06:14:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DA1zzG6nNmdZhJU3qN0OyTsJmfUn+R69vuRAEWDnE0/TISg/1r+hZPWdYrPdQk+GulCHi0Z6M6/mkVsXw59CqK/yYlShdFw750Zs0McHcUxJcyRwB0CAGDtq3Oxfm5yrCpatgYKoNEBerMzMlEKiHj1Pah50DGTRJ14/7EptmQMa8B+MxDPi7Is8S/jH3Zk31wtn2a00XnhuHOO/Mjlw+Z4thryqC0QUyDUaz4tppmyz5c/sYpX0e075vlRSHUchGqunZMUv3BudDfNODxgLt1LUv4yFT4zj1FcJcObd5pbYJ8g/pMMACGA0a687L78fCWMWA3tty6XsfEEOpcch/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=jXGTH8L/6qBtLRFue/NVNAeOvnbT7mln5P/+gNRA+Q4=;
 b=YxUE9l3yP/NVuOETWBiFMYVbhUaT///u9hUekKGgYxGH8rt99phQqldY1L77nh23OFy3xiM3rPGyuudsfGGyvc3c6LAnmERW16S1stz9ENTwz/ohAOijndj021AjLDowPP8lFST5DriFPoftI66R6dFAj7QoyEkZefY2L+1SUf3CZl7CJBRXYNbBZXMcng82RcE0RODDgLJoG+lcrxU7YcRNDV6fsyNIX1hnLAM6a4NJbln7szGor60F6dPK0EZ3Fhg9QsmylYY5c5su7EoZoYnIr3S70uaUIq1givFO6z+QTp2qBt+hdni+g/XWCc24FYFiCQU4UcUkYS6klQ51lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXGTH8L/6qBtLRFue/NVNAeOvnbT7mln5P/+gNRA+Q4=;
 b=oHj5MzdJGrclIT/CKeJLXHPhNGx6gYZLLsekANOT5RVz1AXeefB8PkVph6HEIKW0SQTkCTdBVB9WgYf8XTft+ADveqsdCY3UxsuCzrcJ61LRI2YRycUj+49LLcPMBOUNqqoASESip7xDDR8eT70Dst0oL9bHAuv4r3msEbGjU1U=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSYPR01MB5432.jpnprd01.prod.outlook.com (2603:1096:604:86::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 20 Sep
 2021 10:13:29 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::6532:19dd:dfa1:4097]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::6532:19dd:dfa1:4097%9]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 10:13:29 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 2/2] drivers: clk: renesas: r9a07g044-cpg: Add SDHI clock
 and reset entries
Thread-Topic: [PATCH 2/2] drivers: clk: renesas: r9a07g044-cpg: Add SDHI clock
 and reset entries
Thread-Index: AQHXoxX4rY1l1YJJyUaRzdfKSFwVsKusx/yw
Date:   Mon, 20 Sep 2021 10:13:28 +0000
Message-ID: <OS0PR01MB5922EBE5ED852575B605556986A09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210804180803.29087-1-biju.das.jz@bp.renesas.com>
 <20210804180803.29087-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdXDJyp=eVGRgf6vzKKMyxhPN8_znC9fUxJu+mTwXYyiHA@mail.gmail.com>
In-Reply-To: <CAMuHMdXDJyp=eVGRgf6vzKKMyxhPN8_znC9fUxJu+mTwXYyiHA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 814dba54-2c0e-4224-4aa9-08d97c1f4ae3
x-ms-traffictypediagnostic: OSYPR01MB5432:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSYPR01MB5432C3AE41AD438653154CFF86A09@OSYPR01MB5432.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jW92mlJGSFpSHk4SnkJYxPoe9VYoqxDSQgoJjVSRe4JtbszE6QZrB6UKLTcytU3U5D+XflcmAQwq4xyMHkbrwFiSQ9emIckSAxzZDu2n5KNbjUmZJ3Rf9gkBM8XbDSM2ImJmhv+zmjSYxtVpgn+uCiNu6DMMz+i37GV76u3RqE+HS+chp3+a61Qb9rP8x02gOf97mxeUDxtCsKQO4E0Ig5YiwaO6HLx3EPphrGF0ee1ZZ7bM8uP2oi/YhP3l6M4lO7Z+xbXLmWFrwNeJcEvtRBqdO74Ifo9vW5DhBNKAths2fYpcc54nb6PUfbEdamhrkBhBVpFexarS0Li09B0efw07dhKpB2XGpaL1tC6fwokLqEQO7ChLXqeZg7J2aNEbqRaMuIReYpvinnsxZJe+vEu0Hzh/RMQwq7XWvle2gzyJxlC26gJcq3HMqmh0F/siSMXuu3hU+QjfzgmgvT9CQkvGcLbf8Vy46pFCvDa5HAqyg/suN7SjrWRIq9Jy41ursY7K+aX8SNvXbACmHCIYiZn8l/Mp9cr720WpZh4Oa22hhJ9612h7GUPTwxAV+YpbbRLR0BDNKyOxIgd35pfT74OV8aAMVTb+CwPS9LEgCWXlMKFw8ZbAGo79hKQtPi/HhrHT9XGlEFLr1ND1q6CuJw568XwkbKjrwUKFyNBxJ1XSZMC9FRzEVbgz13UFUNKt9HNJwSqFb0pg+KuXQBLcKw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(8676002)(107886003)(122000001)(4326008)(66446008)(66476007)(53546011)(38070700005)(64756008)(33656002)(55016002)(76116006)(66946007)(71200400001)(5660300002)(66556008)(54906003)(26005)(52536014)(316002)(86362001)(8936002)(9686003)(186003)(38100700002)(6506007)(83380400001)(6916009)(2906002)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2s0cVhxYW1iTDRpVVFkS05YS0lSL1ZXMnQzdFdpSVRwbGdyMlpKenVVVU5m?=
 =?utf-8?B?THdJNHhzdUNVVUNPQ2tFanZlL2Q1V2tjZ0kyRGZGa3pDUHlNbEk5TDE4QmV2?=
 =?utf-8?B?MTA0WkJWQ0JHOTI5SCtaUlB4eDVBMVl0Nmh0aDJST0VhRkRUeWl6SUZwb2Yv?=
 =?utf-8?B?eHNZNSt6SENWdHNTeVJZM2tqcDR1K01OaUJMRkYySU9WcVlXV1FvRWF4QXpx?=
 =?utf-8?B?T0R4U3EvdlVMbVZwTTZqaWx3TStEaHlMTUJuVlE4NXhVajFuVDhnWW41SUFs?=
 =?utf-8?B?dW5HTVRmaDVrKzl3VUZnUld2ZzMzNDdVdjJaSmFWYkl5dGxCTzkvYU00b3R3?=
 =?utf-8?B?dXljNm1CTUY3anRVM0dQN0tsUExWNWlsUEtXMmNsUi9HaFEyV3piK3M1WUhk?=
 =?utf-8?B?czRtaFlFYXZRdDNKbnpBanFKU2drMFBodWhHMXB6OHNVM2tmOE5vRngzeEM3?=
 =?utf-8?B?Vy9aUDJFNUtwSkxDTVJieW8wUks3azVscDNrZkpUNklBWE1SRTV5NlN2aHc3?=
 =?utf-8?B?UFRCd1dSY2Nmb1lnWFFTRmJnNjVxRmphMWd1eW9FV05zc0tvRnJCMWJJZ2lL?=
 =?utf-8?B?U1ZPZXJ1aGFCbmNuMDBXZkJXZGhFeWU4NE5tNDVGVGwzR0VpV25nUW5iQ2gv?=
 =?utf-8?B?cmZRU0ZTYXl5SE8xdjk4S3BFQlBkSGRKYkdNNTVnclkrOGdBZ0ZaMzBxSVNB?=
 =?utf-8?B?WHhCS1NTNEFQRWMxQ1h0R0dlM1VXYkI5VUZKZTE4U29BU3pra1pJeGNpejk3?=
 =?utf-8?B?OXE2aTJvVjdVWE4yTnRVbVMxUGJHVnRFdGFrTUJnd1lEVlBqY0lyV1pjMkla?=
 =?utf-8?B?SXdidXVXQjJIbTg1WFBGVFczMnovMXA5ZDlJZUh2QWhRZyszaWFSZUttYWly?=
 =?utf-8?B?am41WVdNWjhabnQvd1k0WEtlVU1VZkorYkd4b2t1M2lBWWtMTDRUb2Ztem9J?=
 =?utf-8?B?ZkJ4UlloRndzcHYrWGVOanlMUjh1MzhPM0pkSmVyRkJMR0pzWUJLRUNYUzlk?=
 =?utf-8?B?ak1IVHVxYUJvdjhRaFVoQS9NNlluNkV1RFNZSkp4VmpieHhBUGg4aDFSQTV0?=
 =?utf-8?B?dGpjTjQ3aGFqVVFHL1BLaEM3UEZEQnY5TDhOT3U1NDlvRzhkakk2dVhsR1c4?=
 =?utf-8?B?QkYxY25XZUlhdlFlM0JhZ1phUXhodmRKMTNiV0xlQkdZTDU0N1QyUzRjUmVY?=
 =?utf-8?B?cll1TktmL1RCZEFrV20rSWhDS1NwcmZPR0xxSElkb01qR1VXSWNEaVNpc1FT?=
 =?utf-8?B?TXVBVEIrd0ZTRUtjMG0zNW13Zjc2dHRCOCtweTBLMG12NjlTdEo3Z09yYXBx?=
 =?utf-8?B?T0RBZDMzcUVFOXE2bGZ3YXlvdHRRR2JmUThnUzNjOTByUlNqYmJWUXZNTGpy?=
 =?utf-8?B?RitRNFlYNmw0TC8reUh6cXB6TDNuZzFKZkVha25FbTZxU0RIRzNsRHpGNmZv?=
 =?utf-8?B?Q2xxQzdud0o0KzR5QnV6dlNmeUc5NjBjY2ZTMTRobW5kVGhRRERSNEtqWXg3?=
 =?utf-8?B?b1FJUUhBY2MrMzVjeWtqUmdwalV3Q1VTT1p1cFU0VG1TbmkxWC9yZVhndTFY?=
 =?utf-8?B?cFRPMGJLV2RyZmxOY1JkalJvRHg5VXVpaEtZczMydERyMkMwVjloa3d4WlpS?=
 =?utf-8?B?eStoNDE4aFZ6UEZjREJmNzJUdytDbWVwU0RUTlNCQVZsZG9FMzd5bjJGa0p1?=
 =?utf-8?B?aFBSazJ0Tk0rdGNRR3JJc1kzbG01TGY5WFN6aC9CRm5KcEplZlpKWmtVVm9R?=
 =?utf-8?Q?na9UotWlTRDI3GL7SQftMNzi+QnK2QYIfzIjNU4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 814dba54-2c0e-4224-4aa9-08d97c1f4ae3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2021 10:13:29.0024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uBG1433/WgV/1dx89uL3rR+S3CNbW0MtY/m+wgx9pca/QYJ8SmOyL949+IO994au3kJULMU8Yek2LWguEJxlnYZ0VjKzC9DKBoUTRNsPAtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5432
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMi8yXSBkcml2ZXJzOiBjbGs6IHJlbmVzYXM6IHI5YTA3ZzA0NC1jcGc6IEFkZCBTREhJ
DQo+IGNsb2NrIGFuZCByZXNldCBlbnRyaWVzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2Vk
LCBBdWcgNCwgMjAyMSBhdCA4OjA4IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbT4NCj4gd3JvdGU6DQo+ID4gQWRkIFNESEl7MCwxfSBtdXgsIGNsb2NrIGFuZCByZXNldCBl
bnRyaWVzIHRvIENQRyBkcml2ZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5r
cyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yOWEw
N2cwNDQtY3BnLmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3I5YTA3ZzA0NC1jcGcu
Yw0KPiANCj4gPiBAQCAtNzcsNiArODUsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjcGdfY29y
ZV9jbGsNCj4gcjlhMDdnMDQ0X2NvcmVfY2xrc1tdIF9faW5pdGNvbnN0ID0gew0KPiA+ICAgICAg
ICAgREVGX0ZJWEVEKCIucGxsNl8yIiwgQ0xLX1BMTDZfMiwgQ0xLX1BMTDYsIDEsIDEpLA0KPiA+
DQo+ID4gICAgICAgICBERUZfRklYRUQoIi5wbGwyX2RpdjIiLCBDTEtfUExMMl9ESVYyLCBDTEtf
UExMMiwgMSwgMiksDQo+ID4gKyAgICAgICBERUZfRklYRUQoIi5jbGs4MDBmaXhfYyIsIENMS184
MDBGSVhfQywgQ0xLX1BMTDIsIDEsIDIpLA0KPiA+ICsgICAgICAgREVGX0ZJWEVEKCIuY2xrNTMz
Zml4X2MiLCBDTEtfNTMzRklYX0MsIENMS19QTEwyLCAyLCA2KSwNCj4gDQo+ICIyLCA2IiBjYW4g
YmUgc2ltcGxpZmllZCB0byAiMSwgMyIuDQoNCk9LLCBXaWxsIGNoYW5nZSBpdCB0byAxLDMuDQoN
Cj4gDQo+ID4gKyAgICAgICBERUZfRklYRUQoIi5kaXZfcGxsMl9kaXY4IiwgQ0xLX0RJVl9QTEwy
X0RJVjgsIENMS184MDBGSVhfQywgMSwNCj4gMiksDQo+ID4gKyAgICAgICBERUZfRklYRUQoIi5k
aXZfcGxsMl9kaXYxMiIsIENMS19ESVZfUExMMl9ESVYxMiwgQ0xLXzUzM0ZJWF9DLA0KPiA+ICsg
MSwgMiksDQo+IA0KPiBJIGp1c3QgbG92ZSB0aGUgY29uZnVzaW5nIGNsb2NrIG5hbWluZyBpbiB0
aGUgVXNlcidzIE1hbnVhbCENCj4gRElWX1BMTDJfRElWOCBydW5zIGF0IFBMTDIgLyA0LCBhbmQg
RElWX1BMTDJfRElWMTIgcnVucyBhdCBQTEwyIC8gNiA6LSgNCj4gDQoNClRoZXJlIGlzIGFuIHVw
ZGF0ZSBvbiBsYXRlc3QgSFcgbWFudWFsKFJldjEuMDAsIHNlcCwyMDIxKQ0KDQpBcyBwZXIgdGhp
cywgaXQgaXMganVzdCA0MDAgTUhaIGFuZCAyNjYgTUh6LiBJIHdpbGwgc2VuZCBuZXcgcGF0Y2gg
YmFzZWQgb24gdGhpcy4NCg0KDQo+ID4gKw0KPiA+ICAgICAgICAgREVGX0ZJWEVEKCIucGxsMl9k
aXYxNiIsIENMS19QTEwyX0RJVjE2LCBDTEtfUExMMiwgMSwgMTYpLA0KPiA+ICAgICAgICAgREVG
X0ZJWEVEKCIucGxsMl9kaXYyMCIsIENMS19QTEwyX0RJVjIwLCBDTEtfUExMMiwgMSwgMjApLA0K
PiA+DQo+ID4gQEAgLTEwMyw2ICsxMTYsMTIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjcGdfY29y
ZV9jbGsNCj4gcjlhMDdnMDQ0X2NvcmVfY2xrc1tdIF9faW5pdGNvbnN0ID0gew0KPiA+ICAgICAg
ICAgREVGX0ZJWEVEKCJaVCIsIFI5QTA3RzA0NF9DTEtfWlQsIENMS19QTEwzX0RJVjJfNF8yLCAx
LCAxKSwNCj4gPiAgICAgICAgIERFRl9NVVgoIkhQIiwgUjlBMDdHMDQ0X0NMS19IUCwgU0VMX1BM
TDZfMiwNCj4gPiAgICAgICAgICAgICAgICAgc2VsX3BsbDZfMiwgQVJSQVlfU0laRShzZWxfcGxs
Nl8yKSwgMCwNCj4gPiBDTEtfTVVYX0hJV09SRF9NQVNLKSwNCj4gPiArICAgICAgIERFRl9TRF9N
VVgoIlNEMCIsIFI5QTA3RzA0NF9DTEtfU0QwLCBTRUxfU0RISTAsDQo+ID4gKyAgICAgICAgICAg
ICAgICAgIHNlbF9zaGRpLCBBUlJBWV9TSVpFKHNlbF9zaGRpKSwgMCwgMCksDQo+ID4gKyAgICAg
ICBERUZfU0RfTVVYKCJTRDEiLCBSOUEwN0cwNDRfQ0xLX1NEMSwgU0VMX1NESEkxLA0KPiA+ICsg
ICAgICAgICAgICAgICAgICBzZWxfc2hkaSwgQVJSQVlfU0laRShzZWxfc2hkaSksIDAsIDApLA0K
PiANCj4gTG9va3MgbGlrZSBib3RoIC5mbGFnIGFuZCAubXV4X2ZsYWdzIGFyZSB1bm5lZWRlZD8N
Ck9LLiBXaWxsIHJlbW92ZSBpdC4NCg0KUmVnYXJkcywNCkJpanUNCg0KPiANCj4gPiArICAgICAg
IERFRl9GSVhFRCgiU0QwX0RJVjQiLCBDTEtfU0QwX0RJVjQsIFI5QTA3RzA0NF9DTEtfU0QwLCAx
LCA0KSwNCj4gPiArICAgICAgIERFRl9GSVhFRCgiU0QxX0RJVjQiLCBDTEtfU0QxX0RJVjQsIFI5
QTA3RzA0NF9DTEtfU0QxLCAxLCA0KSwNCj4gPiAgfTsNCj4gPg0KPiA+ICBzdGF0aWMgc3RydWN0
IHJ6ZzJsX21vZF9jbGsgcjlhMDdnMDQ0X21vZF9jbGtzW10gPSB7DQo+IA0KPiBUaGUgcmVzdCBs
b29rcyBnb29kIHRvIG1lLg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0t
IFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4
ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBq
b3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0
aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
DQo=
