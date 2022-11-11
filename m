Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2819F62541E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Nov 2022 07:53:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbiKKGxd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Nov 2022 01:53:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiKKGxc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2022 01:53:32 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2126.outbound.protection.outlook.com [40.107.114.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 013EAD69
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 22:53:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQfapnglnfwWXzEU91Seh6cq0eKao/KxLQiSavaA1T348jTQjU65B9Q/G/EcTlPs/X+bVWxnzNPr5ULV4HABs4SqQcLDDmixsCyRhJSjXo1n50WBvmmTYsFnuKkRNhL6EgXwgnJX00mMbSrMvF1wMRM0EHvY5pfGRbmXrz5shR6dMc4MvM+qwHv2FJkoiaBT0kTmIWvVPqk9ZeGP9nxEqEun+mh318SPPW4uF4klEocu7XPcqa0KTu4pcwjDP0nNJ2q4bYHn+bvSwiJy5ZH5kmxYqzHk+qk6nK8Ig7Z7uJptLBPvuhWFQNFljqthLqFlRe6PLlbKJr8NsQaVncUXlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AcfF3tzGQSHmO+fuoHNmogRbIpiP9YUQJJCdBQ6SKc=;
 b=IDbe7LT2wiMv5/4C+KtJqtrZX7EH6kU12tQIdxLWU4JN2K/63NtaSPSCRElrT4kgVjFNrizadusDWhSf9O+EwZgYXAtE0AWYWnRru3QXk+vcfJo27/ShWqPzCgOUCdFWNHdLDb2UXlASDycCkrcMsJrRk71yStsIdrTXxL8jIXRqQAmBQptxf04iSJ6E/YM1EY5+Tn2GJiZXwjSkeDvRVOYILgQnlbl/w4weEQxG7TayeSPX2D3fPGhFrIJ2CQqM/Fjg1SsU+FYl3fLHHtjJX3dNOtkA0pcaB2cIBQN54kz5Vu0FBRA94HKiIWnHyVf+F4TxByB0xMdOdSILmjTZ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4AcfF3tzGQSHmO+fuoHNmogRbIpiP9YUQJJCdBQ6SKc=;
 b=Z6nJgLbJmWiud/Y8pQTS2nKidqcpWJRKNHTyX64xtmaIlnh7PBn51WhggafViXlvfzf2hqeNURGptT3X80+HbqTBEOqPPrt6AOrGghjdMh0zGw6zAU1cGExWEfxwO4Juuek0FwOxiGdEcUEtRxb+LGIWnHOnEkhUFH+B6eaHzfs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5591.jpnprd01.prod.outlook.com (2603:1096:604:b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 06:53:23 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2%3]) with mapi id 15.20.5813.014; Fri, 11 Nov 2022
 06:53:23 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Lee Jones <lee@kernel.org>
Subject: RE: [PATCH v5 2/5] clocksource/drivers: Add RZ/G2L MTU3 core driver
Thread-Topic: [PATCH v5 2/5] clocksource/drivers: Add RZ/G2L MTU3 core driver
Thread-Index: AQHY6hNAJYj9EqHn6kCGVCldveg3A64zkuWAgAAAgiCABcyfkA==
Date:   Fri, 11 Nov 2022 06:53:23 +0000
Message-ID: <OS0PR01MB592202FBA14C2FA28E51A34586009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221027144844.85149-1-biju.das.jz@bp.renesas.com>
 <20221027144844.85149-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVghus=mN0PajCsY5CAO+sT-NQPL9NJ5e=3wtqMOcahSQ@mail.gmail.com>
 <OS0PR01MB5922AE3F1A115CB00E6B1599863C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922AE3F1A115CB00E6B1599863C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB5591:EE_
x-ms-office365-filtering-correlation-id: 64fee091-d1b3-4661-a31d-08dac3b16d67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PjaNQH9XeN8mz5/8c8PiMoJjkksaBVZ4DyPzPjuTBJvhLL3wwGu++hKZLPAozDnoh+ZLKsj1Nn/ObIjVgs1XHZqjUkFoOl3DopR8/wD53f17u1+M0H2A9gPrEZUEHyKw1XOUY777rEK284KGVtvNW0d+6OiSMCKvm6i+HbNgLlZZ+3eIGTq49SFCY6GwLksZObOvFmfkyAwq8y1tsEWdWUtQKapoXZ8emnTDGNjT8SGfI2cKne6XhYiID7vp22VEn7a6RNAyCXiLQIieewHypNJ+lfUcLDjwju/UJY/pX4ZRQ8WGfQ1M8MIhwH2tg1kKAZGLP13+LyQeJ38/kvtiS7nzMC87PViTY7dQXb+UVuzfKpp/SfK/rBviuBM4L0Hf8skLKoeKTSsJh8J1VrWZk4DXLRijbOmxEXAnjvhTnslf0qEeG+ZhYHaW2gtxs/vHzPc6oawZ2FW5lmyBFCw4VZwx633a4i61GL295cUoKurpSB9oybV+MTPPEZWPlKICZjH5xAk+NCGf9iZaRUNhmL0o7LzpL/28/xemVrFu1xhK+j5TprjGH9Qf81VSjnde4m2B+pj8UCbV5uRY+CS7+omt0NhjRlOopfga8jGxWzVN66ydS2blWq0wNOq1vS48PnpXe18BmLSFws5KpzLftlNB3o37JMtK3fw8HzdO9F5uw5SzBr3MvUK8yo3Q5r244WTJ5r/+gnMxtQSBxrJ3dHgeu+1t9CX3NIiASE1kMlz57TUIz7ZVBhQBqariyIp8nl6x6JsXBxy+vDFQxIrPZg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199015)(55016003)(6916009)(316002)(54906003)(9686003)(53546011)(71200400001)(26005)(86362001)(186003)(478600001)(6506007)(7696005)(33656002)(83380400001)(41300700001)(5660300002)(38070700005)(66556008)(66946007)(76116006)(8936002)(2906002)(8676002)(64756008)(66446008)(4326008)(66476007)(122000001)(52536014)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmV3ZGdieVN4Lzc2VmVIeG1aL1cyRTVQOVEvWHllOHl2czE2NFZsemlNOUlN?=
 =?utf-8?B?WlFXbUo0akdueGtpODNrZ3ZmZnZ0Q0RDbGRCckc1a1ZMeWl5WWViL2hjYmVv?=
 =?utf-8?B?RWpzYUtJZW5MREdMay9QZ29YNTFUb1luSmx4bUZuaHdPNXNRYWVLQ2NmNktr?=
 =?utf-8?B?a296RjBwVDN4N3JUUGhuODFZckUxQlFHNVcvWC83QnBONDBVVk5ONWcrKzQ3?=
 =?utf-8?B?T2M3R256elZhcnB0Ym9yN01LYUg2NkNaZXloZ1BmVkFoOWJFaCtXa1NKWVcw?=
 =?utf-8?B?eHF1Njdrdi9PYmFtUmRVbHNUbkU4WFV6QVQzbElnTWFiZG02ZVBQNjZrY3Rj?=
 =?utf-8?B?OTVDb1crY205SUZ5a0tFTVFBdDlIZ2tvZkZELzh3ZGdLZmFueEdvTFpyTTFI?=
 =?utf-8?B?bWdDNHc0TkZIdWFTcU8wL2J5MTNUSzhoRFlqZ3l5Z3k3TmlBWWFCSzFkTFR5?=
 =?utf-8?B?cUhDNTZJd3VISDUxVSs3UkQveTNGZzRJNmw5QWdGbXMwdGxWWHoxWGR0SldV?=
 =?utf-8?B?d2tnd3FETzA3dU04bXV6NitkdXQyVGRveC9ROGFNZVJ3OVlheVJ2bE5BY3J0?=
 =?utf-8?B?RjhxOTFqKzNtL1JQMHFHY3JEa25UNnU0UnhJQVBaUlJJeE90VFM0dG9iS1VF?=
 =?utf-8?B?a2xUc1I4cTZTTks4QWtXMFhRbG9MOW9WKzk3aUtTRmtONUNITjYwQnYrTjM1?=
 =?utf-8?B?eVVzQWtwWFVxWWx1Uk0rQ21zRHJNTmFhVjFGQnlsRngyME02Z2UvWCs3ZkN6?=
 =?utf-8?B?WmtOYVdtTjROb0ViNlgyeVgxOEEwdzlGN0o4cCsxT0x5TW5LdXBWaDhUUENx?=
 =?utf-8?B?d042OU00VGFhUnFwYlFCTjUxUlRtN2Jqcm9BQzdSdDlOWVdHODZva3cxU2tw?=
 =?utf-8?B?eURiNHZHa1laQWxCTGl1OVZIc09wQzZrcGJPSlY3Y05ES2ZLTHRrMzlsRDZ4?=
 =?utf-8?B?TjEyQXk5ck1McitQREVqQUU3ZnNPN20ycHJQTktqMWhlb2VuazUrcFVsQWlS?=
 =?utf-8?B?QmV3SEdqTlhYSi9NeFZOS0IxWHZuaVQzaThpUFNGY0ZkMnpKTkc4UXR4MTRT?=
 =?utf-8?B?NlluOUxmcVZtWFo4TDJjanBxWkJuVUIyYjhNdUZ4aEVmNWpmY29rQlBFUWZW?=
 =?utf-8?B?ZWVCTFZvV1RvMHVGYWhyTFVJSUVadXNPKytFYlZ5cTBQVGRkM2NnZUkvdzk3?=
 =?utf-8?B?NzErazZMVFRNV1R1RVk4L0MzaU1VRWpaZ3V2bWZ2TU83dk9Qa01RdTkvUVB2?=
 =?utf-8?B?WFBrdjFHckJBcE02WEx1c09MWElhUkh1RGtWR2p1aWFOT2x3eVloc25LZEFa?=
 =?utf-8?B?cEdkSkZOUEZPMG1TNi9KTEJpbWE1SlhCTWhnNTBBUDk3OS82dDNFcXNkZHJr?=
 =?utf-8?B?QUpadWdWa3lFZG5ZVklmWHVZOXc3bW83bW5tTTVualY5OEJYR0FMZHRpMm03?=
 =?utf-8?B?NVFBMUVvc2JyMks2OEx3dGNqMDNReXBYY1k3bG1VVGZVOTQvakkyay9rZnlX?=
 =?utf-8?B?Rm5yNFUyS0pKV1d6ZEY3Y2hxMExMbnRiUHlWZldLUzFPNWp0dzduUWhadUox?=
 =?utf-8?B?RDVrbldmMGdReHB3aFRxck9hUmgzcGZHc0QyU3ZDbm5icUwrZE1OajdZaVU1?=
 =?utf-8?B?dngwa2hWSjVCckxWNWNETTZVblU3cFFXWmMrcnFhQ0hhRWkrMk5IVDJFMnA4?=
 =?utf-8?B?RUNTRUlzdkg2RWRIa3l2SmNmcWZHcnoxOGFVNFlodG5iMHZkOHNhTk1BSmxD?=
 =?utf-8?B?QVhJYVZXcHJZTnBrTTgzUHdPVVg2SzhxY0lGdVNqSFhrRzF5WnN0Q2pMRTZv?=
 =?utf-8?B?ajI1UGVhaTdveTEydnRyWUY3M3IzeWZEWGNIMTR2b1V5dEl3b2xBaFZ5dFNE?=
 =?utf-8?B?b2NScjk5czNYc3h6VUtEcmdnMm5HUzRRaC9Jei9KUnk1Rys0OC9DZlBONnpJ?=
 =?utf-8?B?MFFYYlJkaUJkM1pRTWdIS1BtTjk4akw2VGFyR3p0bDdjVnRNdE5ZTXBmSHVZ?=
 =?utf-8?B?U0FaRGs4UFhTVlNCU2xUSmljQ1BrQk82Y01OeEQ0RjliL0FPdmtobmh0SkZO?=
 =?utf-8?B?UHowTm82UDlkMVNLZXF1SnZpNC95VXh5R09vRDBndXAvMjE0Z0gwSXNka2tU?=
 =?utf-8?B?aTNEeDFMVzU4ejlCU0h0Kzc0UFpMcmdoODZNYWJ0dTJ5RFVRaXNvRGFqY2xM?=
 =?utf-8?B?Nmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64fee091-d1b3-4661-a31d-08dac3b16d67
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2022 06:53:23.8010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FzrotNsCIv/B6viQH/q8LBGlU5lJMfWgP/H6v4fUN1H+CE8JcV0IZKekPhgLnm7k1ZTDY/JolHi6yHDPC8GILBIhYPvRfxIeiPvjh/b/w6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5591
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBTZW50OiAwNyBOb3ZlbWJlciAyMDIyIDE0OjI3DQo+
IFRvOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBDYzogUGhp
bGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT47IERhbmllbCBMZXpjYW5vDQo+IDxk
YW5pZWwubGV6Y2Fub0BsaW5hcm8ub3JnPjsgVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9u
aXguZGU+OyBDaHJpcw0KPiBQYXRlcnNvbiA8Q2hyaXMuUGF0ZXJzb24yQHJlbmVzYXMuY29tPjsg
UHJhYmhha2FyIE1haGFkZXYgTGFkDQo+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVu
ZXNhcy5jb20+OyBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7DQo+IExlZSBKb25l
cyA8bGVlQGtlcm5lbC5vcmc+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjUgMi81XSBjbG9ja3Nv
dXJjZS9kcml2ZXJzOiBBZGQgUlovRzJMIE1UVTMgY29yZSBkcml2ZXINCj4gDQo+IEhpIEdlZXJ0
LA0KPiANCj4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQo+IA0KPiA+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjUgMi81XSBjbG9ja3NvdXJjZS9kcml2ZXJzOiBBZGQgUlovRzJMIE1UVTMgY29yZQ0K
PiA+IGRyaXZlcg0KPiA+DQo+ID4gSGkgQmlqdSwNCj4gPg0KPiA+IE9uIFRodSwgT2N0IDI3LCAy
MDIyIGF0IDQ6NDkgUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3
cm90ZToNCj4gPiA+IEFkZCBSWi9HMkwgTVRVMyBjb3JlIGRyaXZlciBmb3IgdGhlIE11bHRpLUZ1
bmN0aW9uIFRpbWVyIFB1bHNlIFVuaXQNCj4gPiA+IDMNCj4gPiA+IChNVFUzYSkgaGFyZHdhcmUg
YXZhaWxhYmxlIG9uIFNvQ3MgZnJvbSBSZW5lc2FzLiBUaGUgY29yZSBkcml2ZXINCj4gPiA+IGFs
bG93IHRvIHNoYXJlIHRoZSBjbGsgYW5kIGNoYW5uZWwgYmV0d2VlbiB0aGUgb3RoZXIgZHJpdmVy
cyBsaWtlDQo+ID4gPiBQV00sIENsb2NrIFNvdXJjZSwgQ2xvY2sgZXZlbnQgYW5kIENvdW50ZXIu
DQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiB2NC0+djU6DQo+ID4NCj4gPiBUaGFua3MgZm9y
IHRoZSB1cGRhdGUhDQo+ID4NCj4gPiA+ICAqIE1vdmVkIGNvcmUgZHJpdmVyIGZyb20gTUZEIHRv
IHRpbWVyDQo+ID4gPiAgKiBDaGlsZCBkZXZpY2VzIGluc3RhdGlhdGVkIHVzaW5nIG1mZF9hZGRf
ZGV2aWNlcygpDQo+ID4NCj4gPiA+IC0tLSBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvS2NvbmZpZw0K
PiA+ID4gKysrIGIvZHJpdmVycy9jbG9ja3NvdXJjZS9LY29uZmlnDQo+ID4gPiBAQCAtNTI0LDYg
KzUyNCwxNiBAQCBjb25maWcgU0hfVElNRVJfTVRVMg0KPiA+ID4gICAgICAgICAgIFRpbWVyIFB1
bHNlIFVuaXQgMiAoTVRVMikgaGFyZHdhcmUgYXZhaWxhYmxlIG9uIFNvQ3MgZnJvbQ0KPiA+IFJl
bmVzYXMuDQo+ID4gPiAgICAgICAgICAgVGhpcyBoYXJkd2FyZSBjb21lcyB3aXRoIDE2LWJpdCB0
aW1lciByZWdpc3RlcnMuDQo+ID4gPg0KPiA+ID4gK2NvbmZpZyBSWl9NVFUzDQo+ID4gPiArICAg
ICAgIGJvb2wgIlJlbmVzYXMgUlovRzJMIE1UVTMgY29yZSBkcml2ZXIiDQo+ID4gPiArICAgICAg
IGRlcGVuZHMgb24gKEFSQ0hfUlpHMkwgJiYgT0YpIHx8IENPTVBJTEVfVEVTVA0KPiA+DQo+ID4g
QXMgeW91IGFyZSBjYWxsaW5nIG1mZF9hZGRfZGV2aWNlcygpLCB0aGlzIGRyaXZlciBuZWVkcyAo
YSB2ZXJ5IHNtYWxsDQo+ID4gcGFydA0KPiA+IG9mKSB0aGUgZnVuY3Rpb25hbGl0eSBwcm92aWRl
ZCBieSBNRkQuDQo+ID4NCj4gPiBJZiBDT05GSUdfTUZEX0NPUkUgaXMgbm90IHNldDoNCj4gPg0K
PiA+ICAgICBhYXJjaDY0LWxpbnV4LWdudS1sZDogZHJpdmVycy9jbG9ja3NvdXJjZS9yei1tdHUz
Lm86IGluIGZ1bmN0aW9uDQo+ID4gYHJ6X210dTNfcmVzZXRfYXNzZXJ0JzoNCj4gPiAgICAgcnot
bXR1My5jOigudGV4dCsweDM4KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgbWZkX3JlbW92ZV9k
ZXZpY2VzJw0KPiA+ICAgICBhYXJjaDY0LWxpbnV4LWdudS1sZDogZHJpdmVycy9jbG9ja3NvdXJj
ZS9yei1tdHUzLm86IGluIGZ1bmN0aW9uDQo+ID4gYHJ6X210dTNfcHJvYmUnOg0KPiA+ICAgICBy
ei1tdHUzLmM6KC50ZXh0KzB4MTgwKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgbWZkX2FkZF9k
ZXZpY2VzJw0KPiA+DQo+ID4gU28gZWl0aGVyIHlvdSBzaG91bGQgbWFrZSB0aGlzIGRlcGVuZCBv
biBNRkRfQ09SRSwgb3IgbW92ZSB0byBhbm90aGVyDQo+ID4gbWVjaGFuaXNtIGZvciByZWdpc3Rl
cmluZyB0aGUgc3ViIGRldmljZXMgKGUuZy4gY2FsbGluZw0KPiA+IHBsYXRmb3JtX2RldmljZV97
YWxsb2MsYWRkfSgpLCBjZnIuIHJwY2lmX3Byb2JlKCkpLg0KPiANCj4gT0suIEkgd2lsbCBhZGQg
ZGVwZW5kcyBvbiBNRkRfQ09SRS4NCj4gSGVyZSB3ZSBjYW4gbWFrZSB1c2Ugb2YgbWZkX2NlbGwg
cnpfbXR1M19kZXZzIHRvIGRlZmluZSBzdWJkZXZpY2VzIGFuZCBhDQo+IHNpbmdsZSBjYWxsIGZv
ciBpbnN0YW50aWF0aW5nIHN1YiBkZXZpY2VzLg0KPiANCg0KT0sgd2lsbCBzZW5kIFY2IHdpdGgg
dGhlc2UgY2hhbmdlcyBhbG9uZyB3aXRoIHNvbWUgY2xlYW51cCBpbiBwcm9iZSBlcnJvciBwYXRo
Lg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4NCj4gPiA+ICsgICAgICAgaGVscA0KPiA+ID4g
KyAgICAgICAgIFNlbGVjdCB0aGlzIG9wdGlvbiB0byBlbmFibGUgUmVuZXNhcyBSWi9HMkwgTVRV
MyBjb3JlIGRyaXZlcg0KPiBmb3INCj4gPiA+ICsgICAgICAgICB0aGUgTXVsdGktRnVuY3Rpb24g
VGltZXIgUHVsc2UgVW5pdCAzIChNVFUzYSkgaGFyZHdhcmUNCj4gPiA+ICsgYXZhaWxhYmxlDQo+
ID4gb24NCj4gPiA+ICsgICAgICAgICBTb0NzIGZyb20gUmVuZXNhcy4gVGhlIGNvcmUgZHJpdmVy
IGFsbG93IHRvIHNoYXJlIHRoZSBjbGsNCj4gPiA+ICsgYW5kDQo+ID4gY2hhbm5lbA0KPiA+ID4g
KyAgICAgICAgIGJldHdlZW4gdGhlIG90aGVycyBkcml2ZXJzIGxpa2UgUFdNLCBDbG9jayBTb3Vy
Y2UsIENsb2NrDQo+ID4gPiArIGV2ZW50DQo+ID4gYW5kDQo+ID4gPiArICAgICAgICAgQ291bnRl
ci4NCj4gPiA+ICsNCj4gPg0KPiA+IEdye29ldGplLGVldGluZ31zLA0KPiA+DQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gPg0KPiA+IC0tDQo+ID4gR2VlcnQgVXl0dGVyaG9l
dmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLQ0KPiA+IGdlZXJ0QGxp
bnV4LSBtNjhrLm9yZw0KPiA+DQo+ID4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRl
Y2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYQ0KPiA+IGhhY2tlci4gQnV0IHdoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3INCj4gPiBz
b21ldGhpbmcgbGlrZSB0aGF0Lg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LS0gTGludXMgVG9ydmFsZHMNCg==
