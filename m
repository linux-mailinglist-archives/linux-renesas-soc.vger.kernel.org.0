Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 957C13EBBC9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Aug 2021 20:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbhHMSBt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Aug 2021 14:01:49 -0400
Received: from mail-eopbgr1410137.outbound.protection.outlook.com ([40.107.141.137]:58880
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229607AbhHMSBs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 14:01:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5jVT0dkX0aYhKxrqZ1eGO/RMZbm51SQtMb6e44FzM+y0PTa8Z/2UayVFTjYj/dJ6tLB/PPZ4rA/M/xLEEXfe5TDqy1L1tpEiekqqsKUW5N2bg5jpc3HUQhbo9oIHn5gB2UHPEac+0Pjs6sAr5POhPPRpaknUc+D6+AXRjdNts8MNda6jEN+FOHH81mYjUOmkEnoXot6NBKAV/7MwOF+3SwcPkiqNmfbUNVcie/aL7yav4idSreXrcxSdsFwom84QsXQuTkEoRs5Qcok9BSNx4TLr6Mk+RkpWBmLpBekaR1A1eO22iQinYJcbrHod/xe4o/gUjE1JCPMW766g/ZsyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a91IIgyCByfKgafHcHqMmMqBpTKGto2kvTmYhBP7xGs=;
 b=oGr+k6t7lq/85brjCMQgg4xHUIJNWTl3dkidf4xo+vO4fdidmJv/OGQs1NVhYxkDiq/leDSpNLBAR6Iw6741Xt8D6KLC6KPnewZJfN7AKNLDLeVp+8kiW7sMZUV6/dCLkBQ+HPvgZYfm/z/G1DiTrhtIS+PEIp33staxXyXtiCqguk2Mevk23/jH621vui4kTgb6FibAhz4xEROImus7wYd8jjDlFdy2gPqMqo1R6Eemz3SwuMu4VhCgel43fvNyBbcN4Kp/boJsjGzxFjKrJzdDtqwgFAvdnVfj5WPMw93/OgHsbVof7DE18e89dgkP1I+rGDDEL/GCl/5ZfkFa6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a91IIgyCByfKgafHcHqMmMqBpTKGto2kvTmYhBP7xGs=;
 b=fnqrIM4+fG8VwazHhd1Ho8yB3MOKxxTeGLxm2MSvEVpkP9VQfdpWOGH3+DQFmTftPuHD2hPguFJdAyT+nCi2v8741b05Vs4cct1iPMBPbcXB2uaexCl5ZU6STYSt/Xz7Y7jMsetIsnPzKAgEOPw7cdng6oicP6qYJlf6PLdp35o=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB4081.jpnprd01.prod.outlook.com (2603:1096:604:31::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.18; Fri, 13 Aug
 2021 18:01:12 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4415.020; Fri, 13 Aug 2021
 18:01:12 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 3/4] drivers: clk: renesas: rzg2l-cpg: Add support to
 handle coupled clocks
Thread-Topic: [PATCH v2 3/4] drivers: clk: renesas: rzg2l-cpg: Add support to
 handle coupled clocks
Thread-Index: AQHXgvI2g+77GqWYgE+LlXgC8Po5JatuLqGAgAFYXcCAABGoAIAB2EzAgAALn4CAAFSD0A==
Date:   Fri, 13 Aug 2021 18:01:12 +0000
Message-ID: <OS0PR01MB5922B105098DD31BDAD3DA5886FA9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210727141749.17783-1-biju.das.jz@bp.renesas.com>
 <20210727141749.17783-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUyiarunEWaQPyR+R+7RbMBXm-xaE1HpuyTwCcNymVS2g@mail.gmail.com>
 <OS0PR01MB5922E8535729D5AF997B33E986F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUcvRzW0dsdsq7j2JWfu=64JzM9M=z=qvhUhDFwXHuwQQ@mail.gmail.com>
 <OS0PR01MB5922495A19B0CDDD50D525D486FA9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdW6xKWp-KKv0exfx-JBb_GXjhvM3hczFSE77j4iORaM3A@mail.gmail.com>
In-Reply-To: <CAMuHMdW6xKWp-KKv0exfx-JBb_GXjhvM3hczFSE77j4iORaM3A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e55f862-5ff0-427d-0780-08d95e845615
x-ms-traffictypediagnostic: OSAPR01MB4081:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB4081592D63D6C98BD8F3CF5286FA9@OSAPR01MB4081.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wRk3WtvNe3FB8Tac7FqDNXtcifVursTcumQ2eyhbafbBgW8QI+zt3G7uSXubnMvnsaaMv+C2JFMQnSMjp+AWHmL66xEdUowykTuS7gkc75+CxqRFfkk2wEOaEAm3wOEbBbbO+LHmrVfoORV42L2DPds4agrl5K7QwmtN62QywMdENeXFqLslxq4A7SbU08haZWvLpqFNQZKOO00DvaW25eQVTKCz4Y900ebmzeX6xKxuPAFUylrbSSfDc2I0gBPEE27vpr7fIRjEOmMkHSIBHzRz4SkEU3wZOLvJMUd0drNqQoMUHWFRIomD9UNSmoC1/N1VoTfV6boq7TuIjryNupdRUCzdkDYekjqBdQmFfCDK+j6iyBXGiHluBM5972FpPFZ4LZeQ7Y7sie9OhvBIpye5biyjjdSg6ShLkHVkcmS61Z4PYwWgXx2BkhCeAZe0G/eSH+IA3Qgl2BIg+EWHuvg1OJFPGqNdBTbPnRujM1hmSpO9BqFUhYeBT4sduuUvYMfvVx63XWshFDei5D27kpjP2IwEakTa8CdffGa5SP8X7R60r/grXMt20bnxyGp0/r8PKxjRtUxxh9dblsvmWFfL0IPLdFEI0tony2U5HBQ06Gv+/p+GqcFo5knCBBs5c169xwIPiOzQbbwIBBxdrYlEjpkBB5wuWmRiwJjMU7OkF1JnlGfE+8wY9OKmz8vhzMtJHe0x9Fs2AHCIPtmuVg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(39850400004)(136003)(346002)(478600001)(66446008)(64756008)(66476007)(66556008)(8936002)(5660300002)(33656002)(316002)(122000001)(38070700005)(76116006)(8676002)(38100700002)(52536014)(2906002)(7696005)(6506007)(53546011)(186003)(83380400001)(9686003)(54906003)(86362001)(71200400001)(6916009)(107886003)(26005)(4326008)(66946007)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3ZaaitvQ3ZYMUZPak9wMEN0MTlXaW5ObklYTHJneEU4ZHppMTliM0hCZVZh?=
 =?utf-8?B?YmxjUjVUYjhGWkszd0kwQlQvenRnTDR2K0lteWNVL2RkRm5KWHI0eTFqTDd0?=
 =?utf-8?B?U3J4cE8zZE1ESGo5NmQ0M2d2MVM2dWt1c1FTVTJpK1hocnh3K2Jjb00yVHZF?=
 =?utf-8?B?dW1YWXBhVzgrYk0rM0tmeHFaZlpiMzArVG5FK2s1SEdTemdaS3N5Vm0yLzZu?=
 =?utf-8?B?Y1VDbkovTnFEWlo4VHNyTm9mWUFGenBxWnR4RjN4c2VxSHpXSDhNZEhSS0xP?=
 =?utf-8?B?WTNpVCtrYSsyVW5yazJNZXBDTGlDNEpXSSt2TFRubE1ldjU3MjhJZVphbmZk?=
 =?utf-8?B?WUdyb1RjcGVkRHNDTWdpMFNQcWpXWklmbjZFWVZRUENZRTBGdTJzaHJXN0xr?=
 =?utf-8?B?R2JzbUF6RUI1THAyOVVxRE1HcE1lekU0eis5SW9mQ3Z2RHBtL2ZpVEF2L3FS?=
 =?utf-8?B?MjMvNkJqZW9uaU5lZzZFa2xydTFadnVwa0ZtaVNka04zaWRoc3ZlMEJVSC9i?=
 =?utf-8?B?YThkMWR3aGZmbHFlRE5VNEg1ZU0xVDYzcXRkMEFjQkJ4dmxmbk1UQTkzT1JM?=
 =?utf-8?B?OVhBb2tsSWpXeHp6QXBNb3JLY0NUMnBlYzRUdEUySVQ1VTEvWUprT0JPNFFl?=
 =?utf-8?B?OEY4QXRwOStneEppczFhd2c2QjY0eHJ3WjZndlNHcU9CVUdrQWEzQndLeUc5?=
 =?utf-8?B?V3d5bWVwSzlwZDVHTEt6dkp5ZDdKTGF6b3hSeHhtRGdYdy9TZlg3MGQ3bGhQ?=
 =?utf-8?B?WUJhbkpRaHBRZ3piN282ZmNuMlFqcktnT0hDVXVWTzJQQkRtMzFqM3NVRldB?=
 =?utf-8?B?aS9NY2M5Z2pvNGQ0Ykp4Nm5NVzUvOVRsUkpnTTlNYzZ5dHdkcldiL0k3QWNa?=
 =?utf-8?B?VVV3dS9zVlRJWU1DME9RZXRDYzVsaWNoSjRnYWZWY1FBM25TSy9qWU9qb0FN?=
 =?utf-8?B?Rm90a2pNZVFWQUp4TmJ4QlEvTmtIcjVMd1VPZWF1TEdzM2J3QTVZQUxFVUJX?=
 =?utf-8?B?TXJrbnlaVkxOS3NuRU5veldtTDMrS0ZiVmdqWjliZzJlN0RTVVhSb3NsZy9s?=
 =?utf-8?B?dCtickRYbmUvU1lQZzc5S2VYZjRVaXFTRDZqTkZZc0tJSmJub2p4ZkhFZUh3?=
 =?utf-8?B?U3lGTXdmQ0lacjVHOFM3bURES3kvK3hraFY2b1pudWRPT1laUGg2c2poZERs?=
 =?utf-8?B?UVNzZndVYmxTQ0tDK2Rsd1pTdGRYQkhjMGVOUWtuQzBxWW5oQjllb1JkK1c2?=
 =?utf-8?B?N2tVUWNHWGtOdUJUYXVmc2ZYYzdteTRkckU3VHZMQ1I0SStjYWJFcXJlMURo?=
 =?utf-8?B?M3ptM0VZKzArUXNlR1RaRlp4MEJPbVlqMDlJelNVOHF4MmcvWTQyODl4SXB6?=
 =?utf-8?B?RXA5NzBmN2RoRmowaS83c2xwK2RsaTRWTXA0RW42bzBLZzNBWVBIVDNLV0pT?=
 =?utf-8?B?cFplbnRSS21GOWMyZUJvd3JHbHdhYW01eTFZYm91OVJ1eWU3UXpYQUJEbWQv?=
 =?utf-8?B?UEdCR01yWHBkaHE4WkR6WTFXVTdBMUl3TDZLZ1g0SjFzeENtbEZTZG5RK2dK?=
 =?utf-8?B?Ykd2Y25FbjRCOUVFNGo1alExU0xkaEovdnZ2T1cwRjFITEVXWjAwbjJTczVh?=
 =?utf-8?B?QzRmMEV3bU9GdklrenpRbThMNE9VckRnRCtBN1dpVjZEM2N5N0V5VTlPVUdM?=
 =?utf-8?B?TmVKODd1OFZQVDF2NlpNbFgwc1FBSnQ5VlhEeEdHZUQzRXNHNGVZNzNYUzJa?=
 =?utf-8?Q?vKvpy1jmC38p22K82O4MRZloXekPbqJCisSMNVo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e55f862-5ff0-427d-0780-08d95e845615
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2021 18:01:12.1134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /CAhkED+c50CKapm+QlCTeiYxbS6Jmmr33fo6ZdRyK1WZH/FzKYUWEOMzeO1Ax7vzhehQe7M3kJ+a1d/4F3qPu6KxrDTamPqBXTLO54qoo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4081
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMy80XSBkcml2ZXJzOiBjbGs6IHJlbmVzYXM6IHJ6ZzJsLWNwZzogQWRkIHN1cHBv
cnQNCj4gdG8gaGFuZGxlIGNvdXBsZWQgY2xvY2tzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24g
RnJpLCBBdWcgMTMsIDIwMjEgYXQgMjoxNyBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAzLzRdIGRy
aXZlcnM6IGNsazogcmVuZXNhczogcnpnMmwtY3BnOiBBZGQNCj4gPiA+IHN1cHBvcnQgdG8gaGFu
ZGxlIGNvdXBsZWQgY2xvY2tzIE9uIFRodSwgQXVnIDEyLCAyMDIxIGF0IDk6MDAgQU0NCj4gPiA+
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+
ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMy80XSBkcml2ZXJzOiBjbGs6IHJlbmVzYXM6
IHJ6ZzJsLWNwZzoNCj4gPiA+ID4gPiBBZGQgc3VwcG9ydCB0byBoYW5kbGUgY291cGxlZCBjbG9j
a3MgT24gVHVlLCBKdWwgMjcsIDIwMjEgYXQNCj4gPiA+ID4gPiA0OjE4IFBNIEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gPiB3cm90ZToNCj4gPiA+ID4gPiA+
IFRoZSBBWEkgYW5kIENISSBjbG9ja3MgdXNlIHRoZSBzYW1lIHJlZ2lzdGVyIGJpdCBmb3INCj4g
PiA+ID4gPiA+IGNvbnRyb2xsaW5nIGNsb2NrIG91dHB1dC4gQWRkIGEgbmV3IGNsb2NrIHR5cGUg
Zm9yIGNvdXBsZWQNCj4gPiA+ID4gPiA+IGNsb2Nrcywgd2hpY2ggc2V0cyB0aGUgQ1BHX0NMS09O
X0VUSC5DTEtbMDFdX09OIGJpdCB3aGVuIGF0DQo+ID4gPiA+ID4gPiBsZWFzdCBvbmUgY2xvY2sg
aXMgZW5hYmxlZCwgYW5kIGNsZWFycyB0aGUgYml0IG9ubHkgd2hlbiBib3RoDQo+IGNsb2NrcyBh
cmUgZGlzYWJsZWQuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+ID4gUmV2aWV3ZWQt
Ynk6IExhZCBQcmFiaGFrYXINCj4gPiA+ID4gPiA+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpA
YnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGFua3MgZm9yIHlvdXIgcGF0
Y2ghDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpn
MmwtY3BnLmMNCj4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3Bn
LmMNCj4gPiA+ID4gPiA+IEBAIC0zMzMsMTIgKzMzMywxNiBAQCByemcybF9jcGdfcmVnaXN0ZXJf
Y29yZV9jbGsoY29uc3Qgc3RydWN0DQo+ID4gPiA+ID4gY3BnX2NvcmVfY2xrICpjb3JlLA0KPiA+
ID4gPiA+ID4gICAqIEBodzogaGFuZGxlIGJldHdlZW4gY29tbW9uIGFuZCBoYXJkd2FyZS1zcGVj
aWZpYyBpbnRlcmZhY2VzDQo+ID4gPiA+ID4gPiAgICogQG9mZjogcmVnaXN0ZXIgb2Zmc2V0DQo+
ID4gPiA+ID4gPiAgICogQGJpdDogT04vTU9OIGJpdA0KPiA+ID4gPiA+ID4gKyAqIEBpc19jb3Vw
bGVkOiBmbGFnIHRvIGluZGljYXRlIGNvdXBsZWQgY2xvY2sNCj4gPiA+ID4gPiA+ICsgKiBAb25f
Y250OiBPTiBjb3VudCBmb3IgY291cGxlZCBjbG9ja3MNCj4gPiA+ID4gPiA+ICAgKiBAcHJpdjog
Q1BHL01TVFAgcHJpdmF0ZSBkYXRhDQo+ID4gPiA+ID4gPiAgICovDQo+ID4gPiA+ID4gPiAgc3Ry
dWN0IG1zdHBfY2xvY2sgew0KPiA+ID4gPiA+ID4gICAgICAgICBzdHJ1Y3QgY2xrX2h3IGh3Ow0K
PiA+ID4gPiA+ID4gICAgICAgICB1MTYgb2ZmOw0KPiA+ID4gPiA+ID4gICAgICAgICB1OCBiaXQ7
DQo+ID4gPiA+ID4gPiArICAgICAgIGJvb2wgaXNfY291cGxlZDsNCj4gPiA+ID4gPiA+ICsgICAg
ICAgdTggb25fY250Ow0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gV2hpbGUgdTggaXMgcHJvYmFibHkg
c3VmZmljaWVudCwgeW91IG1heSB3YW50IHRvIHVzZSB1bnNpZ25lZA0KPiA+ID4gPiA+IGludCwg
YXMgdGhlcmUgd2lsbCBiZSBhIGdhcCBhbnl3YXkgZHVlIHRvIGFsaWdubWVudCBydWxlcy4NCj4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gICAgICAgICBzdHJ1Y3QgcnpnMmxfY3BnX3ByaXYgKnByaXY7
ICB9Ow0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEBAIC0zOTIsMTEgKzM5NiwzNyBAQCBzdGF0
aWMgaW50DQo+ID4gPiA+ID4gPiByemcybF9tb2RfY2xvY2tfZW5kaXNhYmxlKHN0cnVjdCBjbGtf
aHcgKmh3LCBib29sIGVuYWJsZSkNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiAgc3RhdGljIGlu
dCByemcybF9tb2RfY2xvY2tfZW5hYmxlKHN0cnVjdCBjbGtfaHcgKmh3KSAgew0KPiA+ID4gPiA+
ID4gKyAgICAgICBzdHJ1Y3QgbXN0cF9jbG9jayAqY2xvY2sgPSB0b19tb2RfY2xvY2soaHcpOw0K
PiA+ID4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgcnpnMmxfY3BnX3ByaXYgKnByaXYgPSBjbG9jay0+
cHJpdjsNCj4gPiA+ID4gPiA+ICsgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gPiA+ID4g
PiA+ICsNCj4gPiA+ID4gPiA+ICsgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnByaXYtPnJtd19s
b2NrLCBmbGFncyk7DQo+ID4gPiA+ID4gPiArICAgICAgIGNsb2NrLT5vbl9jbnQrKzsNCj4gPiA+
ID4gPiA+ICsgICAgICAgaWYgKGNsb2NrLT5pc19jb3VwbGVkICYmIGNsb2NrLT5vbl9jbnQgPiAx
KSB7DQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgm
cHJpdi0+cm13X2xvY2ssIGZsYWdzKTsNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICByZXR1
cm4gMTsNCj4gPiA+ID4gPiA+ICsgICAgICAgfQ0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4g
KyAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZwcml2LT5ybXdfbG9jaywgZmxhZ3MpOw0K
PiA+ID4gPiA+DQo+ID4gPiA+ID4gSSB0aGluayB5b3UgY2FuIGF2b2lkIHRha2luZyB0aGUgc3Bp
bmxvY2sgYW5kIHRvdWNoaW5nIHRoZQ0KPiA+ID4gPiA+IGNvdW50ZXIgaWYgdGhlIGlzX2NvdXBs
ZWQgZmxhZyBpcyBub3Qgc2V0Lg0KPiA+ID4gPg0KPiA+ID4gPiBPSy4NCj4gPiA+ID4NCj4gPiA+
ID4gPg0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gICAgICAgICByZXR1cm4gcnpnMmxfbW9k
X2Nsb2NrX2VuZGlzYWJsZShodywgdHJ1ZSk7ICB9DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBIb3dl
dmVyLCBJJ20gd29uZGVyaW5nIGhvdyB0aGlzIGNhbiB3b3JrPw0KPiA+ID4gPiA+DQo+ID4gPiA+
ID4gICAgICAgREVGX0NPVVBMRUQoImV0aDBfYXhpIiwgUjlBMDdHMDQ0X0VUSDBfQ0xLX0FYSSwN
Cj4gPiA+IFI5QTA3RzA0NF9DTEtfTTAsDQo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgMHg1N2MsIDApLA0KPiA+ID4gPiA+ICAgICAgIERFRl9DT1VQTEVEKCJldGgwX2No
aSIsIFI5QTA3RzA0NF9FVEgwX0NMS19DSEksDQo+ID4gPiBSOUEwN0cwNDRfQ0xLX1pULA0KPiA+
ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4NTdjLCAwKSwNCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+IFRoaXMgd2lsbCBjcmVhdGUgMiBpbmRlcGVuZGVudCBjbG9ja3MsIGVhY2gg
d2l0aCB0aGVpciBvd24NCj4gPiA+ID4gPiBtc3RwX2Nsb2NrIHN0cnVjdHVyZSB0aGF0IGhhcyB0
aGUgaXNfY291cGxlZCBmbGFnIHNldC4gIEhlbmNlDQo+ID4gPiA+ID4gZWFjaCBjbG9jayBoYXMg
aXRzIG93biBjb3VudGVyLiBTaG91bGRuJ3QgdGhlIGNvdW50ZXIgYmUgc2hhcmVkPw0KPiA+ID4g
PiA+IEFtIEkgbWlzc2luZyBzb21ldGhpbmc/DQo+ID4gPiA+DQo+ID4gPiA+IE9vcHMuIFlvdSBh
cmUgY29ycmVjdC4gSSBuZWVkIHRvIGFkZCB0aGlzIGNvdW50ZXIgdG8gcHJpdiBpbnN0ZWFkDQo+
ID4gPiA+IG9mDQo+ID4gPiBtc3RwX2Nsb2Nrcy4NCj4gPiA+DQo+ID4gPiBPbiBzZWNvbmQgdGhv
dWdodCwgYSBjb3VudGVyIGlzIG92ZXJraWxsLiBBIHNpbXBsZSBmbGFnIHNob3VsZCBiZQ0KPiA+
ID4gc3VmZmljaWVudCwgYXMgdGhlIGNsayBjb3JlIG9ubHkgY2FsbHMgLntlbixkaXN9YWJsZSgp
IHdoZW4gdGhlDQo+ID4gPiBjbG9jayBpcyB7ZGlzLGVufWVuYWJsZWQuDQo+ID4NCj4gPiBKdXN0
IHRvIGNsYXJpZnksIHNpbXBsZSBmbGFnLCBkaWQgeW91IG1lYW4gdG8gdXNlIGJpdCBmbGFnPyAo
aWUsIDINCj4gPiBiaXRzICwgc2luY2Ugd2UgaGF2ZSAyIG1vZHVsZSBjbG9ja3MpIHdoZW4gY29y
ZSBjbG9jayBjYWxscyBlbmFibGUsIHNldA0KPiBhIGJpdCBhbmQgcmVzZXQgdGhlIGJpdCBkdXJp
bmcgZGlzYWJsZS4NCj4gPg0KPiA+IFRoZW4gYmFzZWQgb24gdGhlIDJiaXRzLCBlaXRoZXIgdHVy
biBvbi9vZmYgY2xvY2sgb3IganVzdCByZXR1cm4gdGhlDQo+IHN0YXR1cy4NCj4gPg0KPiA+IFBs
ZWFzZSBjb3JyZWN0IG1lLCBpZiBteSB1bmRlcnN0YW5kaW5nIHdyb25nPw0KPiANCj4gSnVzdCBv
bmUgYm9vbCBvciBiaXQgaW4gYSBiaXRmaWVsZCwgdGhlIHNlY29uZCBmbGFnIHdpbGwgYmUgaW4g
dGhlIG90aGVyDQo+IHN0cnVjdCBtc3RwX2Nsb2NrIChjYW4gdGhlcmUgYmUgdGhyZWUgY291cGxl
ZCBjbG9ja3M/KS4NCg0KUlovRzJMIGhhdmUgbWF4aW11bSAyIGNvdXBsZWQgY2xvY2tzLg0KDQo+
IA0KPiBTbyBJIHRoaW5rIHNvbWV0aGluZyBsaWtlIGJlbG93IHNob3VsZCB3b3JrOg0KDQo+IA0K
PiAgICAgIHN0cnVjdCBtc3RwX2Nsb2NrIHsNCj4gICAgICAgICAgICAgc3RydWN0IGNsa19odyBo
dzsNCj4gICAgICAgICAgICAgdTE2IG9mZjsNCj4gICAgICAgICAgICAgdTggYml0Ow0KPiAgICAg
KyAgICAgICBib29sIGVuYWJsZWQ7DQo+ICAgICAgICAgICAgIHN0cnVjdCByemcybF9jcGdfcHJp
diAqcHJpdjsNCj4gICAgICsgICAgICAgc3RydWN0IG1zdHBfY2xvY2sgKnNpYmxpbmdzOw0KPiAg
ICAgIH07DQo+IA0KPiAuZW5hYmxlZCBuZWVkcyB0byB0cmFjayB0aGUgc29mdCBzdGF0ZSBvZiB0
aGUgY2xvY2suDQo+IFRoZSBhY3R1YWwgY291cGxpbmcgaXMgaGFuZGxlZCB0aHJvdWdoIC5zaWJs
aW5ncywgd2hpY2ggcG9pbnRzIHRvIHRoZQ0KPiBvdGhlciBjb3VwbGVkIGNsb2NrIChvciBmb3Jt
cyBhIGNpcmN1bGFyIGxpc3QgaWYgeW91IGNhbiBoYXZlIG1vcmUgdGhhbg0KPiB0d28gY291cGxl
ZCBjbG9ja3MpLiAgV2hlbiByZWdpc3RlcmluZyBhIGNsb2NrLCBpZiBtb2QtPmlzX2NvdXBsZWQg
aXMgc2V0LA0KPiB5b3Ugd2FsayBhbGwgYWxyZWFkeSByZWdpc3RlcmVkIG1vZHVsZSBjbG9ja3Mg
dG8gZmluZCBvbmUgd2l0aCB0aGUgc2FtZQ0KPiBvZmYgYW5kIGJpdCwgYW5kIGxpbmsgdGhlbSB0
b2dldGhlci4NCg0KVGhhbmtzLCBXaWxsIHByb3RvdHlwZSBiYXNlZCBvbiB0aGUgYWJvdmUgc29s
dXRpb24uDQoNCj4gDQo+IEluIC57ZW4sZGlzfWFibGUoKSwgeW91IG9ubHkge2VuLGRpc31hYmxl
IHRoZSBoYXJkd2FyZSBjbG9jayBpZiBhbGwgb3RoZXINCj4gY2xvY2tzIGluIHRoZSBsaXN0IGFy
ZSBkaXNhYmxlZC4NCj4gDQo+IGlmIGl0IHR1cm5zIG91dCB0b28gY29zdGx5IHRvIGFkZCBhIHBv
aW50ZXIgdG8gZWFjaCBjbG9jayAoZGVwZW5kcyBvbiBzbGFiDQo+IGdyYW51bGFyaXR5KSwgeW91
IGNhbiBhbHNvIHVzZSBhIGRpZmZlcmVudCBzdHJ1Y3QgZm9yIGNvdXBsZWQNCj4gY2xvY2tzOg0K
PiANCj4gICAgIHN0cnVjdCBtc3RwX2NvdXBsZWRfY2xvY2sgew0KPiAgICAgICAgICAgICBzdHJ1
Y3QgbXN0cF9jbG9jayBtc3RwOw0KPiAgICAgICAgICAgICBzdHJ1Y3QgbXN0cF9jb3VwbGVkX2Ns
b2NrICpzaWJsaW5nczsNCj4gICAgIH07DQo+IA0KPiBidXQgdGhlbiB5b3UgZG8gbmVlZCBhbm90
aGVyIGZsYWcgaW4gbXN0cF9jbG9jayB0byBpbmRpY2F0ZSBpdCBpcyBhDQo+IGNvdXBsZWQgY2xv
Y2ssIHRoYXQgY2FuIGJlIGNvbnZlcnRlZCB0byBtc3RwX2NvdXBsZWRfY2xvY2sgdXNpbmcNCj4g
Y29udGFpbmVyX29mKCkuDQo+IA0KPiBEb2VzIHRoYXQgbWFrZSBzZW5zZT8NCg0KWWVzLiBUaGFu
a3MgZm9yIHBvaW50ZXJzLg0KDQpSZWdhcmRzLA0KQmlqdQ0K
