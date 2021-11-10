Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0FA544C032
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Nov 2021 12:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbhKJLkA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 06:40:00 -0500
Received: from mail-eopbgr1400092.outbound.protection.outlook.com ([40.107.140.92]:58000
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231131AbhKJLj5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 06:39:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYA6YB4y/yBoGp6hUeANaWKRZk2TgXIfAL5FyAsQyHi+zSw3BtVGf/P4M2F371jyvwBZW8lioNzpbWvX3Y6Z4pEQJppG2X1JUm/7M7OUJIPH+P5vaHtl3YZ0d4iFeqf5Sl/Eq1lALKE/RMzGGSImOq/qlk/K0oTzcsWnhoJPPMOvIGb9ZUNii0HF1UrFlep7jhErhgkixFaadiuIG+JJI8zuMR/THAFFhjxCg930NI/mkto9PV5UjfPey5oM0Di3yFVBDHZF476SwdAXAVIChyA9PHec8IlNrbWsAauS46pOQimx8A/+JucFmUqwToDC2+VB11XGzRRCZhcYtcppVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpFNoXZpRlDM6ihtKcKW18+FUmaC1WsX80EcPOZ8odM=;
 b=ihUhlNnkd973mqLTlnxxSiIFhrFXJmk+6hngzsv4Ve9XyR0UdPMLV47vh15aQGcOO0vgydD7CH6y6U/wS932g7rnKn1VlLZklshcV9gLRJVvg9BG5fVXQAwzgiaduM0cbQClSfxYW/sh57fRq/o/e/wkR3eCTFiERNaoAnKHVTYHDaVPBBi2Vqa17+/FCoDe/2aCwKH9i3da3T+sl/eJKHt3sXThi2ohYIZ7AlGMriVPyCusanSciJDx7b0DB8rkx+ejQjlSmwhRH9RFdueUN9krFZ2BoaD2UmqoiSfMkStzlW9nKjJPWOBoHG7s1pAJ6p3YAtzfDejlU2eqhPcmaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpFNoXZpRlDM6ihtKcKW18+FUmaC1WsX80EcPOZ8odM=;
 b=BWpsKJcpt/Rtb+Qa27+UO1qlJAI4umb+XOz/8jOlf7Wf2496JnypHVdXUO2+UP1YoO6S2/lBWo6eLCPCNXJcPiQhbH9uLoa3Q17EA8ZOaocXM68gmALXpZRTbf+cUZyQ9SLCQ4QHJmA6IlIpYe4+NAWIa+GCd9bVYL5LZql8hRA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5730.jpnprd01.prod.outlook.com (2603:1096:604:b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Wed, 10 Nov
 2021 11:37:06 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 11:37:06 +0000
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
Thread-Index: AQHX1g1yrO/DEDK5GkyhMVfA7q3phav8jySAgAAO94CAAAOp8A==
Date:   Wed, 10 Nov 2021 11:37:05 +0000
Message-ID: <OS0PR01MB59224396F5796647A675D75486939@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211110083152.31144-1-biju.das.jz@bp.renesas.com>
         <20211110083152.31144-3-biju.das.jz@bp.renesas.com>
         <CAMuHMdX+3TfX21HtuUcUQp1SZKJgZ0By8XFxzpxSED1H8_ua0w@mail.gmail.com>
 <d9f7b80e1abbd1323c5ec7fcdf57fb1a855929cd.camel@pengutronix.de>
In-Reply-To: <d9f7b80e1abbd1323c5ec7fcdf57fb1a855929cd.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e5b1c87-e10a-4df0-bc77-08d9a43e6c74
x-ms-traffictypediagnostic: OS0PR01MB5730:
x-microsoft-antispam-prvs: <OS0PR01MB5730709EA4C87E208B5F025686939@OS0PR01MB5730.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pN4y6CmM1L0ej/lBNSCad9fxzhi3Nxm3HPrrrp8KMhhgJ98cbOn6q8e0tVUzYRfhKNlv2AKZs2MYn6uKRHLfmpCkB8RsEdVoy5J//Om0qoXYznuc13BKTbKn66cT2JwZj+T0AUcsKbV581xOPw1B8d0+prTJE0p3g9GLZ/12LaLL8IJswKVvDpO1/pfXTutALd9L9BQI2+nZ8/RWgVPbmPkz3VuSKJn73px0pqt2CnBrWi6qQwHjLg9oKeRZ6nYHeS8wbVVffhnZufe9VVbBmglZ2o9gMTBPE8TQJkgxBGF2qaKad/5BzOPjg8JCtPAqf90BzjADgjanYHfaZHiLO15QEgGritL4oOiD133f/7rA4MOWT7x9TeLR4b2rmuwvvMZA7e9j7OVCiPvDV3lHuQaH/NfWR3HWMm7svJE8LG+Pr0Ip64L6zs1nCZstdy5k0bLr0hxlC+tTmhfqOJOiegWHTwbevadMLDSrbyfR4BW3qRO06oyKGLjkQrXZeX+I/VKwYgNDnYJqiqI6TMMTYO3ynTDJ5ryO/QTCfgrbOJXUHkCn1FgFE3SsPYQ3RKDMTyBWDWNtzFSEOgphWWRKvGjabInkcAQ9lIcc0fOiY/feE8wESEtk/FSwCh8tLgbnqTRmsQf4TfxrerUiYqiXgfA3ULzS+1Xtl856apYxrSxKfCAgtqCSm5MZeq2nm9EMs1Ifb9pI/txlE9oGO9ZV3w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(76116006)(66476007)(66556008)(186003)(66446008)(26005)(9686003)(64756008)(122000001)(7416002)(8676002)(4326008)(316002)(8936002)(110136005)(508600001)(54906003)(38070700005)(5660300002)(4001150100001)(6506007)(33656002)(2906002)(38100700002)(83380400001)(55016002)(53546011)(7696005)(86362001)(52536014)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWRxb3NLZ0NBRytpM0E0R0wxSHNlMFdhNkJoSk9zQ1c0RUhPd3JhSi8rdXNo?=
 =?utf-8?B?dEdsY0JBU1c5UGtmVWpIRGZjN01sR2RUay8rR243YXNOTFZUL2tYeUkyZDEz?=
 =?utf-8?B?MG1uZm5hcmpmakI4QURSeERpN0hockVRN1FHM1RGdy8yOERSS2hnbVV3VllF?=
 =?utf-8?B?VnR4VWVzMmJiaFBMTlRRbndlVzNESFkzY2l0QitHeEV2MUEwVk11QUpqNitK?=
 =?utf-8?B?bUZWQnIwTTdERmVhQWl3N0EvcGZLdCsvM3FrMlhmMmZtaU5KdlJkU3ZaMlRC?=
 =?utf-8?B?K3ZvU2xOVTE5bFlRZ1BTck9UR2ZPM1duNmcwRWpSMm9yazExT1lLOHRyMWFp?=
 =?utf-8?B?VStkOFlrYm9DZk1BaWZwb2dNUElXNW1zRm1qV1UxSmRsVExnN0laaG5OMEt1?=
 =?utf-8?B?cW9qVUdxSmQwaFFxMnc2d3VXL0Z5WUpuWndYTnlQVURDYnJacFFSMkhIRlV4?=
 =?utf-8?B?ZUphYnpHalRVVnc4NDhDY3dvOHJyQkxvR0tPc3FpemFUekRiSVFCOW8xTTN0?=
 =?utf-8?B?cWxtckJ0c3dLMkpUd0dKQUxwd3RGM3kreVlzR0NWZDNVUlJvVXc1eFkxd3N5?=
 =?utf-8?B?K2VlS0hLQWZ5VG9pZk91dDdwb0NSOVRGR2RjSHlqNXJyN252ckNhektySjVo?=
 =?utf-8?B?NSs0SDcyNkg2UlRmVU9KMzRxa0plT1A5MDh3NGFLOXFVSXR5V1hjY3huU3pN?=
 =?utf-8?B?c08xTE5FTCt2Qlo2M1NYQkdmTVFnK1A1Wlh0T3drVjBFWUpvZ1E4NlhBWjFx?=
 =?utf-8?B?bDBYajVKZnpUQkVUMXlIOGxhZDZ5ckRvWTkvendoSmJDNDBHeXlrQklxaE9q?=
 =?utf-8?B?eGx5S0duUXFxaTB2cjAwV1piLytYK3c4YTZicGEyTDd6VElDaWZPUDQ3WnN1?=
 =?utf-8?B?bFpZU2VNODIza3U5R3JwaHNPRXYrM3VoN1Y1TjdBU0p1eWJRRjZyWnk2UlND?=
 =?utf-8?B?UWRLSFNNa0UvVFB6QkR6eW1aTTIzdGFCMEtkQ1hjU3ZYQVIvNXdYOFdERThh?=
 =?utf-8?B?V0N1SHhkR0kreWNMM3RaeXJyMk52dVNEdGhhWnRZa3NtY2ZtWmZHSjhlYVVK?=
 =?utf-8?B?bllndEtFVmUrMURxdlUwTi9UYjMzaXRzNUI0SjVJaXh6bHIvcXpFZ2Y5OWJ5?=
 =?utf-8?B?d2ExdlVnbjRQN3VEejRPS3dpTFhsbm9FYVVDMU9GVk9tZjJpeENqODNuNlZU?=
 =?utf-8?B?VlAvVkVxcDcxUm5aNFRrT1NZYkNKeFY1OUtjeU9Sd29obkJJNFV4V2xvNGE5?=
 =?utf-8?B?NUxSaWdSQU12RnBLU2g3cTVWcW54TlRWdm5SR3pCSFpkU0Rhb1NmRlpUTmhV?=
 =?utf-8?B?WnRzQkZBTGNZY3h2Z2FaYmxWdVZYQWp3ejNYZzMyaEtKRnFDZXJRRWhMQ1Zy?=
 =?utf-8?B?b2Y2cXBaSmtVa0phR0lFR0lYYkNYNFhnQmkvTmt1MCt4RXVENjhpOEcvbEpP?=
 =?utf-8?B?NnVqYlc0VG9oV0k4endlWHJmVVlPNHd5WGlhTlJMNEF6dlI0VjFEejhFQS9h?=
 =?utf-8?B?ek1UeE90VnFNUlQzTEdRNTdoeVE4emtLVmR5dHA1bTdFQStndWpWSEs2Um9y?=
 =?utf-8?B?ZXFBSHhoZis0N0w3aVc5dExDcVpaWWx5L0hRMnl6b2NxU21lYm1CRzN6QVZp?=
 =?utf-8?B?WnM5b2trcHRtKzFkQ0FuOWVMN1hkL3ZoUTNTUmR4RllsL0NlQ3IwU2ZpdVFW?=
 =?utf-8?B?bTR5eUs0VjZJa0tLUC8xVTRXQ1JLOVhySVdVS0NMSzhKUlpRbzZQUWFiUGJ0?=
 =?utf-8?B?TVJjbWp2Rlhaais3aEJ5eU54WUxzS3BTZGhCWWU5WjI3R3NRbFlZZ0JJNk10?=
 =?utf-8?B?TWdqazd5QktlMmpFQTNKZTBibEQ5eFYySlJGZlk4YXhvYzdnUEs0YmJCbk04?=
 =?utf-8?B?dm5QUGhZaU1PTG9kOFREK2xnSXM5R2dtMDNqNnA0Ky9aZjFkY0ozZW5MS3U3?=
 =?utf-8?B?Mm8vOGhCUjlrZk9hV0F3bjRtRjdyVW11MUFhczVET2kyUlBSNE9ZZ1d6NlZG?=
 =?utf-8?B?czJlUnhJbFRXRkhZVmNyZ0Z3OHkyOGFCVUxOSjFqWjloWituRzBJeUFhSjNn?=
 =?utf-8?B?VXVSMDE0dTNqRC8vSEMvTkQrWURJS2lxMHJuZm1idlB6dWdIUjdrYWhrM0wx?=
 =?utf-8?B?WWpjYjhRcjZIMXBLVXcrQ09qN216S1FENHVOSGMza1IveUt4Zk91eG52ajhC?=
 =?utf-8?B?M2RoLzErWXFpTVR4TDM3dXJ4clFOaytKN2QrVThoT2xMZUkyS0cybCtHa01W?=
 =?utf-8?B?aXo3bUZnSEJLb3JKalArMk5Fd2Z3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5b1c87-e10a-4df0-bc77-08d9a43e6c74
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 11:37:06.2261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BRKpo9BjyPrT8RRtWNTAnrdXQBEOhrKfPip6wAqL6LD6gnIOidyMs/DA9TWc25e2DoUrPm+M7TqyyerDMKHi+7JvA8K+tGtQWsoLK/48YFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5730
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgUGhpbGlwcCBhbmQgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBjbG9ja3NvdXJjZS9kcml2ZXJzL3JlbmVzYXMtb3N0bTog
QWRkIFJaL0cyTCBPU1RNDQo+IHN1cHBvcnQNCj4gDQo+IEhpIEdlZXJ0LCBCaWp1LA0KPiANCj4g
T24gV2VkLCAyMDIxLTExLTEwIGF0IDExOjI3ICswMTAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+ID4gSGkgQmlqdSwNCj4gPg0KPiA+IE9uIFdlZCwgTm92IDEwLCAyMDIxIGF0IDk6MzIg
QU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiA+
IFJaL0cyTCBTb0MgaGFzIEdlbmVyaWMgVGltZXIgTW9kdWxlKGEuay5hIE9TVE0pIHdoaWNoIG5l
ZWRzIHRvDQo+ID4gPiBkZWFzc2VydCB0aGUgcmVzZXQgbGluZSBiZWZvcmUgYWNjZXNzaW5nIGFu
eSByZWdpc3RlcnMuDQo+ID4gPg0KPiA+ID4gVGhpcyBwYXRjaCBhZGRzIGFuIGVudHJ5IHBvaW50
IGZvciBSWi9HMkwgc28gdGhhdCB3ZSBjYW4gZGVhc3NlcnQNCj4gPiA+IHRoZSByZXNldCBsaW5l
IGluIHByb2JlIGNhbGxiYWNrLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IFJldmlld2VkLWJ5OiBMYWQgUHJh
Ymhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4g
PiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+ID4NCj4gPiA+IC0tLSBhL2RyaXZlcnMvY2xvY2tz
b3VyY2UvcmVuZXNhcy1vc3RtLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvcmVu
ZXNhcy1vc3RtLmMNCj4gPiA+IEBAIC0yMDksMyArMjExLDM5IEBAIHN0YXRpYyBpbnQgX19pbml0
IG9zdG1faW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUNCj4gPiA+ICpucCkNCj4gPiA+IMKgfQ0KPiA+
ID4NCj4gPiA+IMKgVElNRVJfT0ZfREVDTEFSRShvc3RtLCAicmVuZXNhcyxvc3RtIiwgb3N0bV9p
bml0KTsNCj4gPg0KPiA+IEJhY2tncm91bmQ6IHRoaXMgZHJpdmVyIHVzZXMgVElNRVJfT0ZfREVD
TEFSRSgpIGJlY2F1c2UgdGhlIE9TVE0gaXMNCj4gPiB0aGUgc3lzdGVtIHRpbWVyIG9uIFJaL0Eg
U29Dcywgd2hpY2ggZG8gbm90IGhhdmUgdGhlIEFSTSBhcmNoaXRlY3R1cmVkDQo+ID4gdGltZXIu
ICBSWi9HMkwgZG9lcyBoYXZlIHRoZSBBUk0gYXJjaGl0ZWN0dXJlZCB0aW1lci4NCj4gDQo+IFRo
YW5rcy4NCj4gDQo+ID4gPiArDQo+ID4gPiArI2lmZGVmIENPTkZJR19BUkNIX1I5QTA3RzA0NA0K
PiA+ID4gK3N0YXRpYyBpbnQgX19pbml0IG9zdG1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikgew0KPiA+ID4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2
Ow0KPiA+ID4gKyAgICAgICBzdHJ1Y3QgcmVzZXRfY29udHJvbCAqcnN0YzsNCj4gPiA+ICsgICAg
ICAgaW50IHJldDsNCj4gPiA+ICsNCj4gPiA+ICsgICAgICAgcnN0YyA9IGRldm1fcmVzZXRfY29u
dHJvbF9nZXRfZXhjbHVzaXZlKGRldiwgTlVMTCk7DQo+ID4gPiArICAgICAgIGlmIChJU19FUlIo
cnN0YykpDQo+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQ
VFJfRVJSKHJzdGMpLCAiZmFpbGVkIHRvDQo+ID4gPiArIGdldCByZXNldCIpOw0KPiA+ID4gKw0K
PiA+ID4gKyAgICAgICByZXNldF9jb250cm9sX2RlYXNzZXJ0KHJzdGMpOw0KPiA+ID4gKw0KPiA+
ID4gKyAgICAgICByZXQgPSBvc3RtX2luaXQoZGV2LT5vZl9ub2RlKTsNCj4gPiA+ICsgICAgICAg
aWYgKHJldCkgew0KPiA+ID4gKyAgICAgICAgICAgICAgIHJlc2V0X2NvbnRyb2xfYXNzZXJ0KHJz
dGMpOw0KPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gPiArICAgICAgIH0N
Cj4gPiA+ICsNCj4gPiA+ICsgICAgICAgcmV0dXJuIDA7DQo+ID4gPiArfQ0KPiA+ID4gKw0KPiA+
ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG9zdG1fb2ZfdGFibGVbXSA9IHsN
Cj4gPiA+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHJ6ZzJsLW9zdG0iLCB9LA0K
PiA+DQo+ID4gSSBiZWxpZXZlIHRoZSBPU1RNIGJsb2NrIG9uIFJaL0cyTCBpcyBpZGVudGljYWwg
dG8gdGhlIG9uZSBvbiBSWi9BLA0KPiA+IGFuZCB0aGUgcmVxdWlyZW1lbnQgdG8gZGVhc3NlcnQg
aXRzIG1vZHVsZSByZXNldCBpcyBhbiBTb0MgaW50ZWdyYXRpb24NCj4gPiBmZWF0dXJlIG9uIFJa
L0cyTC4gIEhlbmNlIHRoZSBkcml2ZXIgc2hvdWxkIG1hdGNoIG9uICJyZW5lc2FzLG9zdG0iDQo+
ID4gZm9yIGJvdGg/DQo+IA0KPiBJZiB0aGF0IGlzIHRoZSBjYXNlLCB0aGUgcmVzZXQgY291bGQg
YmUgbWFkZSByZXF1aXJlZCBmb3INCj4gICBjb21wYXRpYmxlID0gInJlbmVzYXMscjlhMDdnMDQ0
LW9zdG0iLCAicmVuZXNhcyxvc3RtIjsgaW4gdGhlIC55YW1sDQo+IGZpbGUuDQo+IA0KPiA+IFNv
IG15IHN1Z2dlc3Rpb24gd291bGQgYmUgdG8gaW5jbHVkZSB0aGUgcmVzZXQgaGFuZGxpbmcgaW4g
b3N0bV9pbml0KCkNCj4gPiBpbnN0ZWFkLCBidXQgbWFrZSBpdCBvcHRpb25hbCwgYW5kIGVycm9y
IG91dCBpbiBjYXNlIG9mIC1FUFJPQkVfREVGRVIuDQo+ID4NCj4gPiBJbiBjYXNlIGluaXRpYWxp
emF0aW9uIGZyb20gVElNRVJfT0ZfREVDTEFSRSgpIGZhaWxlZCwgdGhlIHBsYXRmb3JtDQo+ID4g
ZHJpdmVyIGNhbiBraWNrIGluIGxhdGVyIGFuZCByZXRyeS4NCj4gPg0KPiA+IEhvd2V2ZXIsIGl0
IHNlZW1zIF9fb2ZfcmVzZXRfY29udHJvbF9nZXQoKSBpZ25vcmVzIGFsbCBlcnJvcnMsDQo+ID4g
aW5jbHVkaW5nIC1FUFJPQkVfREVGRVIsIGlmIG9wdGlvbmFsIGlzIHRydWUsIHNvIHRoaXMgd29u
J3Qgd29yaz8NCj4gPg0KPiA+IFBoaWxpcHA6IGlzIHRoYXQgY29ycmVjdD8gSWYgeWVzLCBvc3Rt
X2luaXQoKSBoYXMgdG8gY2hlY2sgdGhlDQo+ID4gcHJlc2VuY2Ugb2YgYSByZXNldHMgcHJvcGVy
dHkgdG8gc2VlIGlmIHRoZSByZXNldCBpcyBvcHRpb25hbCBvcg0KPiByZXF1aXJlZC4NCj4gDQo+
IE5vLCBfX29mX3Jlc2V0X2NvbnRyb2xfZ2V0KCkgc2hvdWxkIG9ubHkgcmVwbGFjZSBpdHMgLUVO
T0VOVCByZXR1cm4gdmFsdWUNCj4gZHVlIHRvIGVycm9ycyBmcm9tIG9mX3Byb3BlcnR5X21hdGNo
X3N0cmluZygpIGFuZA0KPiBvZl9wYXJzZV9waGFuZGxlX3dpdGhfYXJncygpIHdpdGggTlVMTC4g
QW55dGhpbmcgZWxzZSBJJ2QgY29uc2lkZXIgYSBidWcuDQo+IA0KPiBTcGVjaWZpY2FsbHksIC1F
UFJPQkVfREVGRVIgaXMgc3RpbGwgcmV0dXJuZWQgaWYgbm8gZXhpc3RpbmcgcmNkZXYgaXMNCj4g
Zm91bmQgbWF0Y2hpbmcgdGhlIHN1Y2Nlc3NmdWwgInJlc2V0cyIgcGhhbmRsZSBsb29rdXAuIFNv
DQo+IA0KPiAJcnN0YyA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRfb3B0aW9uYWxfZXhjbHVzaXZl
KGRldiwgTlVMTCk7DQoNCkluIHRoaXMgY2FzZSwgSG93IGRvIHdlIGdldCBkZXYgaGVyZSBmcm9t
IGRldmljZV9ub2RlLCBhcyBkZXZpY2UgaXMgbm90IGF2YWlsYWJsZSBhdCB0aGlzIHBvaW50Pw0K
DQpSZWdhcmRzLA0KQmlqdQ0KDQo+IAlpZiAoSVNfRVJSKHJzdGMpKQ0KPiAJCXJldHVybiBkZXZf
ZXJyX3Byb2JlKGRldiwgUFRSX0VSUihyc3RjKSwgImZhaWxlZCB0byBnZXQNCj4gcmVzZXQiKTsN
Cj4gDQo+IAlyZXNldF9jb250cm9sX2RlYXNzZXJ0KHJzdGMpOw0KPiANCj4gYWRkZWQgdG8gb3N0
bV9pbml0KCkgc2hvdWxkIHdvcmsuIE5vdGUgdGhhdCBwbGF0Zm9ybV9wcm9iZSgpIHdpbGwgdGhy
b3cgYW4NCj4gYWRkaXRpb25hbCB3YXJuaW5nIGlmIC1FUFJPQkVfREVGRVIgaXMgcmV0dXJuZWQg
ZnJvbSBub24taG90cGx1Z2dhYmxlDQo+IGRyaXZlcnMgKGFuZCB0dXJuIGl0IGludG8gLUVOWElP
KS4NCj4gDQo+IHJlZ2FyZHMNCj4gUGhpbGlwcA0K
