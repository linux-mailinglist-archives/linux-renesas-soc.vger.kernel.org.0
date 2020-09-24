Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1F6276DA9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Sep 2020 11:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgIXJkc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Sep 2020 05:40:32 -0400
Received: from mail-eopbgr1400092.outbound.protection.outlook.com ([40.107.140.92]:54750
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726315AbgIXJk3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Sep 2020 05:40:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuK3ZYP5ubvHP2UmRqM1ZZ6iJ9mKmwHjtvRLu6dOoN0eAkTnaDxujqiulScykpU6XEn4LjEeXLqy9324ocdeETMiyUdu/2AO2I3pZ4nULHRSKIsW/bqdlmZOpWXmY2uF4Tq6n/w6PcUfvMkDwQJ4GeGwsTqGdG+mXOnqV4vhGHJ7YmxIBhARtGMsG1LK93N/YE6eo6n7vzcily60Ba9Q82RWEGh1Z9tj4w+QvU8A8lxZRepCFpR+gZkpcotImorxgX/pV+PEiDU2rgD1xxLMTQiz00ZibD9M2RlRryXtlnwzqThtU2RglX6HINrr4K2yot6NXf2aQp1juQzS7FOnjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7/L0k1wG+eKu1Of2JUyDXTRSQxWj5dF61AMOYJ7hwo=;
 b=eW+fXc9NWf3xxtKLOcB/P5+KXNjLdmddozMcvZLtOExAUzofOHY1Hu8O/I9N7+zZs5CfX2VwhoVS2W+nuygYgy1YquJzb9wk4DZtiWZFUmKjUhtUxPjeemRD9o4U9pScrIbZnHGHu9rScWbloZXW8pmz2ak9wW4QGVGfUt4kMz5Jdm8nmhB5dabYYc7tFtQ7p9FcT/ele0+YpTaQltZv6tndgW+8uZQX5LTptJH0WLwPi0aiaBcOheVJCsZL0C3ePuRdRQfzb2v3rZBXLXq+PkN5muA3WnzpJ/xy0NSk9Ina4Lw2HeSTANLkAxH2uvg5tpF1CA1C2N5B56XludCTHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7/L0k1wG+eKu1Of2JUyDXTRSQxWj5dF61AMOYJ7hwo=;
 b=QMIzKflEvownlvbY3w9kJG3Z+U/t2J3v96BifgfVFJuJyLmmY9jtmW7h6qmsQ2tR7mohg2oyCLHE14BeYcLiK1ctVh/juQ0UeCQ60KSL3p+yQXyRpIuZH4ck03I7OOPPPqofAIKsAiRrlWkBGmNpuu5lpuHj9ImUVxPOurSx0/M=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY1PR01MB1513.jpnprd01.prod.outlook.com
 (2603:1096:403:2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 24 Sep
 2020 09:40:26 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84%3]) with mapi id 15.20.3412.020; Thu, 24 Sep 2020
 09:40:26 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] ARM: dts: iwg20d-q7-common: Fix touch controller probe
 failure
Thread-Topic: [PATCH] ARM: dts: iwg20d-q7-common: Fix touch controller probe
 failure
Thread-Index: AQHWkkl/lcuagICdI0atS35JemmLzql3e3mAgAAAaAA=
Date:   Thu, 24 Sep 2020 09:40:26 +0000
Message-ID: <TYBPR01MB530919C0B122741BF8D25A8B86390@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20200924080535.3641-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdV5m3LH9QyX=Gau5UsDz3AZvqNOgCJiHb6Je+7qS0Ltvw@mail.gmail.com>
In-Reply-To: <CAMuHMdV5m3LH9QyX=Gau5UsDz3AZvqNOgCJiHb6Je+7qS0Ltvw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [109.153.226.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ab8335dd-9fa4-4bf6-e7d7-08d8606dde1b
x-ms-traffictypediagnostic: TY1PR01MB1513:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1513CA14082F9935F8FA358B86390@TY1PR01MB1513.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qOExiN9gu+Z7z81EymmfUo8NLPL5qe8lvWZ6ZpKE4IC5Zich9IO+vcnNSs/fJs/Kd2s/WeRYK8cDvpDMV3RRtckF6Be2SRndOgrPumuxxodHGbYmjjB5pVNRpKhFcx1RGzdMzPmagN2O63e3Zjt0EVCwvGAchg7dp4zZPZwy+dKJPvbn3q+TTa45QMEv2HAi8IWv+rLvQKUHxa/7DgoSe8GiybHgdO977j4TeX3z3mevN+anf4qKzs4c2zNpYxxLXGyAJHcwnrQagvP/MsroTIPI5esvUGzQDyi0IZkjGcJOzmRS1zTdMOfYcRnFbU9OOX2xi+/8yDKCWYyxA341Svbwo1JZMV0c5j0PU6qBf6jbwbrHdB1pwLyuYdnKEE2NqNTKDKRg0xdzQ7HUEixkKig5j4mDkAvkVuKkz5g2bTtQny7DVTprsGpdRHxr7g84H7gbtZovER8aXum2ZvhQIw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(9686003)(107886003)(26005)(64756008)(66446008)(478600001)(7696005)(66556008)(76116006)(66476007)(71200400001)(316002)(53546011)(6506007)(966005)(66946007)(4326008)(33656002)(54906003)(55016002)(8936002)(5660300002)(52536014)(83380400001)(6916009)(8676002)(86362001)(186003)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 0ZsayUuq8YGiMRcGKWURhBM+zGXTnLANTym/PO3FuZkAnZdpOrS1BvBzVqGSBHWDvIy1Z8wD69qfq8hjRAmVpdqGv1mC3k1GNMdJS3n9hRuTWGdPWe+a83NgukVw7koZ7zQUjH5Diar1u8mQgtFqlazHKcgFCSzn8nhKyMMmUkrWCrvbsgwFQgsGsIk1UyFDNrmmAh7hZxL6Mz+EqOYzJpiHw4usomGuWTSuS+6y52H+S4eCO6KpIa0aTV1O3LoQ8d4SLDCZTiBq4SWax/XxL/CmoflIfKPFmSqpOdaH+3LIk1C7m1ckKII3O0grcHcmPufDfpEI5mNVrcbv64DQCPhARJk7/GhpoWSeuipB5DIatk65xHUpDDK3EddOWErHMchKFx5KMrLsAIgf1uOnVz9AWJSzvizr17UN2rTDqzcDFVilBNPzE2r0ggMRMfwhx7Ko+Z44f/S03omeYo7GXWfgbJAGOFPHkrMjzK4lewV6ApDjV3GU7aHA5xF8lG9bkU732jkK4P/ZxtuAEm20OFbT5tjkHsP30dTtTeXkLXOdTAORd1a7AamM4AUisOiTJELooFwjvtg208vbTpZNCDvWHh2JAOlpHhn95+JSPKQrCibGwqrXuNA0yLueoDAvgLsf+L8kTUFchHrfW4OkPQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab8335dd-9fa4-4bf6-e7d7-08d8606dde1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 09:40:26.5484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JtXM32QSVKKkan0NmJkThvdYnPTaOVwh8W1nsXbjScXNmvb7bMO+AS9Nd0jm4fKg4tafp6DyGPml6kxhUdvH8IzF3G6IFmFe8v02PzwYSEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1513
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIEFSTTogZHRzOiBpd2cyMGQtcTctY29tbW9uOiBGaXggdG91Y2ggY29udHJvbGxlcg0K
PiBwcm9iZSBmYWlsdXJlDQo+DQo+IEhpIEJpanUsDQo+DQo+IE9uIFRodSwgU2VwIDI0LCAyMDIw
IGF0IDEwOjA1IEFNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3Jv
dGU6DQo+ID4gQXMgcGVyIHRoZSBpV2F2ZSBSWi9HMU0gc2NoZW1hdGljLCB0aGUgc2lnbmFsIExW
RFNfUFBFTiBjb250cm9scw0KPiA+IHN1cHBseSB2b2x0YWdlIGZvciB0b3VjaCBwYW5lbCwgTFZE
UyByZWNlaXZlciBhbmQgUkdCIExDRCBwYW5lbC4gQWRkDQo+ID4gcmVndWxhdG9yIGZvciB0aGVz
ZSBkZXZpY2Ugbm9kZXMgYW5kIHJlbW92ZSBwb3dlcmRvd24tZ3Bpb3MgcHJvcGVydHkNCj4gPiBm
cm9tIGx2ZHMtcmVjZWl2ZXIgbm9kZSBhcyBpdCByZXN1bHRzIGluIHRvdWNoIGNvbnRyb2xsZXIg
ZHJpdmVyIHByb2JlIGZhaWx1cmUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGlu
Y2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiAtLS0NCj4gPiB2
NC0+djUgOiBSZXN0b3JlZCBMYXVyZW50J3MgUmIgdGFnLCBzaW5jZSBpdCBpcyBtaW5vciBjaGFu
Z2UsIHJlbmFtaW5nDQo+ID4gdjQtPnZjYy1zdXBwbHkgdG8gcG93ZXItc3VwcGx5DQo+ID4NCj4g
PiB2My0+djQgOiBJbmNvcnBvcmF0ZWQgTGF1cmVudCdzIHJldmlldw0KPiA+IHYzLT5jb21tZW50
cyhodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExNzA3ODg3LykNCj4gPiAgICAg
ICAgICBBZGRlZCBMYXVyZW50J3MgUmV2aWV3ZWQtYnkgdGFnDQo+ID4gdjItPnYzIDogQWRkZWQg
dGhlIG1pc3NpbmcgcGFydCBmcm9tIHRoZSBwYXRjaC4gcmVtb3ZhbCBvZiBwb3dlcmRvd24tDQo+
IGdwaW9zIHByb3BlcnR5Lg0KPiA+IHYxLT52MiA6IEFkZCByZWd1bGF0b3IgaW4gdG91Y2ggcGFu
ZWwsIExWRFMgcmVjZWl2ZXIgYW5kIFJHQiBMQ0QgcGFuZWwNCj4gPiB2MS0+ZGV2aWNlIG5vZGVz
DQo+ID4gICAgICAgICAgICAoUmVmOiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNo
LzExNzA3NTU5LykNCj4gPiB2MSA6IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gv
MTE3MDU4MTkvDQo+DQo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZSENCj4NCj4gQXMgdGhlIHByZXJl
cXVpc2l0ZXMgYXJlIG5vdyBpbiBuZXh0LCBJIGNhbiBxdWV1ZSB0aGlzIGluIHJlbmVzYXMtZGV2
ZWwgZm9yDQo+IHY1LjExIGFmdGVyIHY1LjEwLXJjMSBoYXMgYmVlbiByZWxlYXNlZC4NCj4gT3Ig
ZG8geW91IHRoaW5rIHRoaXMgc2hvdWxkIGJlIGZhc3QtdHJhY2tlZCBhcyBhIGZpeCBmb3IgdjUu
MTAgb3IgdjUuOT8NCg0KSSB0aGluayBpdCBzaG91bGQgYmUgZmFzdCB0cmFja2VkLCBzaW5jZSBp
dCBpcyBhIHJlZ3Jlc3Npb24uIEFsc28gd2UgbmVlZCB0byBmYXN0IHRyYWNrICB0aGUgZGVwZW5k
ZW5jeSBwYXRjaGVzIGFzIHdlbGwuDQoNCkZpeGVzOiA2Zjg5ZGQ5ZTkzMjUgKCJBUk06IGR0czog
aXdnMjBkLXE3LWNvbW1vbjogQWRkIExDRCBzdXBwb3J0IikNClsxXSBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0L2NvbW1p
dC8/aD1uZXh0LTIwMjAwOTIzJmlkPTk0NmE2MWFiMmQ3NThjYzY0NWY2ZTYzZjFhNWUyNzMxNjkw
YzM5NDMNClsyXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9uZXh0L2xpbnV4LW5leHQuZ2l0L2NvbW1pdC8/aD1uZXh0LTIwMjAwOTIzJmlkPTJjZDlkZjJi
ZTc1NzY2NDUyZmVmODdjMzdlYzM3ZDkxZjRjYmFmNmINCg0KPiBJLmUuIGlzIHRoaXMgYW4gYWN0
dWFsIHJlZ3Jlc3Npb24sIG9yIGp1c3Qgc29tZXRoaW5nIHRoYXQgbmV2ZXIgd29ya2VkIGJlZm9y
ZT8NCj4gTm90ZSB0aGF0IHYxIGhhZCBhIEZpeGVzIHRhZywgd2hpY2ggd2FzIGxvc3QgaW4gc3Vi
c2VxdWVudCB2ZXJzaW9ucy4NCg0KSSBtaXNzZWQgdG8gYWRkIGZpeGVzIHRhZyBpbiBzdWJzZXF1
ZW50IHZlcnNpb25zLg0KRml4ZXM6IDZmODlkZDllOTMyNSAoIkFSTTogZHRzOiBpd2cyMGQtcTct
Y29tbW9uOiBBZGQgTENEIHN1cHBvcnQiKQ0KDQpDaGVlcnMsDQpCaWp1DQoNCg0KUmVuZXNhcyBF
bGVjdHJvbmljcyBFdXJvcGUgR21iSCwgR2VzY2hhZWZ0c2Z1ZWhyZXIvUHJlc2lkZW50OiBDYXJz
dGVuIEphdWNoLCBTaXR6IGRlciBHZXNlbGxzY2hhZnQvUmVnaXN0ZXJlZCBvZmZpY2U6IER1ZXNz
ZWxkb3JmLCBBcmNhZGlhc3RyYXNzZSAxMCwgNDA0NzIgRHVlc3NlbGRvcmYsIEdlcm1hbnksIEhh
bmRlbHNyZWdpc3Rlci9Db21tZXJjaWFsIFJlZ2lzdGVyOiBEdWVzc2VsZG9yZiwgSFJCIDM3MDgg
VVN0LUlETnIuL1RheCBpZGVudGlmaWNhdGlvbiBuby46IERFIDExOTM1MzQwNiBXRUVFLVJlZy4t
TnIuL1dFRUUgcmVnLiBuby46IERFIDE0OTc4NjQ3DQo=
