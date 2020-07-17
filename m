Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB7A223B68
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 14:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgGQMdN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 08:33:13 -0400
Received: from mail-eopbgr1410119.outbound.protection.outlook.com ([40.107.141.119]:49386
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726201AbgGQMdN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 08:33:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+fyWssEBOryhEnyb60gtaynL/ZcogW9hleB3dgzeoeXAE0VjyfDjqQjXv/LGAR1QI3aR96UAS9al2P2pjXOBUeSYuR1mHCEpay0pq2pvkalHehJpBYesnF00g7CqbbJSRrOFdg52o1Yc2aRu1/Kmll0ul+OeeZ+GUjonvS73CnoeGL07QD2LipMiyB6CFONQQvdynymp5p823EnNrnE40tFie3tQ2oX0TEABPuVLwXLFdmbtzRsLkjV0ztVHFa6WlLbvvVXPiyHpFdnqy6zO6/X/X1mnUabDb1C4es73XuqzczOyhe47B6LqvjiccopD4rgpXACuNGx0yJ2ZRrjvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0beFGK7xNBHu77ZwxbXCLlInUNqs5la0Nlck1FbIbM=;
 b=YAq3g8Y2ZaeFB+kVQHLHjJvNnDmNhXzCFjrk5yNeFcItHXaMyvr+k5KNaP9UIr8XH/d9JB51WkG7ziVHPKw6+KAV5dgZovSrtigDejKQovfpRtSy5jIA6AZS1msBwoAvHUf426cvhS/SyG6hniIMVUdlRkuIGTAObwh3Y5IhE2Y9apzgfe5x7reIIJw5ZhDIKbS+1SOPFdUnp2feF8F3szcNJx7eUAGQvt4EmBIKF9XP1YQdWsBlG4t2AympLGzyI/XCWvqAk9MoCOukokYXIOvIaejjuYGZUu8zZvTuzLLYzB+mNgPkFn9TSkSvL+QK02hh309X85tAEJqyPYUYQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0beFGK7xNBHu77ZwxbXCLlInUNqs5la0Nlck1FbIbM=;
 b=pN7brBE6V0kuPH2Eo2XG8wMAf1xdPXKBoAjwcsdQIpDA++Gju5y1/ebSy5Lzko96TGv12owDXhH8GEKR/IM/jWC1SdD+XFxxaU6skeZWu2wYPKQRRelXRkFH9u+hJEUQ5MrYHaokh5V8/2EDwpxJz3ToZWrbqoVzdXmivv1B23M=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB2159.jpnprd01.prod.outlook.com (2603:1096:404:4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Fri, 17 Jul
 2020 12:33:07 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3195.022; Fri, 17 Jul 2020
 12:33:07 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: add full-pwr-cycle-in-suspend into
 eMMC nodes
Thread-Topic: [PATCH] arm64: dts: renesas: add full-pwr-cycle-in-suspend into
 eMMC nodes
Thread-Index: AQHWVrImoipTHpQCfEOOGfl8yMfzBakIYI8AgALjfUCAACHpAIAAEe1ggAAFGICAABXGIIAAA+EAgAAoe6A=
Date:   Fri, 17 Jul 2020 12:33:07 +0000
Message-ID: <TY2PR01MB36921E2FC932E95E6C8E46CAD87C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1594382612-13664-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVqFU538syZq2B=An-MA3zo3RT115JmvaVxyt5mb-Wvsg@mail.gmail.com>
 <TY2PR01MB3692CD5627D9848ADDA88BF0D87C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdVzO=wwTyYhHj2Cg3g_rRQCHQ_97DVH8zXAkg_ki5ZHhw@mail.gmail.com>
 <TY2PR01MB3692646F94A991EB373A8AA3D87C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdU2R7qxtgmP6CgmN9_3SZeL7DFUs5iCAu2QG+UBay=EBw@mail.gmail.com>
 <TY2PR01MB36923CD412750CE20F416A45D87C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdUkzNx2nUrRN+0bny6BG95YVNqUiWN2L+BXsOD_o-=Vfg@mail.gmail.com>
In-Reply-To: <CAMuHMdUkzNx2nUrRN+0bny6BG95YVNqUiWN2L+BXsOD_o-=Vfg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 871f9a23-987e-4f23-c63f-08d82a4d8f3f
x-ms-traffictypediagnostic: TYAPR01MB2159:
x-microsoft-antispam-prvs: <TYAPR01MB2159A1BEB3DCA4C0EA4287ECD87C0@TYAPR01MB2159.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jXoQEzzyVt1xsI4oJEcTkZMVLKeeYV+PgIBW2PDagzi2yR36uTdZFMATOvHZBYlYVcSjjf6e/V+OP4Qd2I3IrR0xraiW8JCfdjCYME5mOTkqrWmFVdY0CYdKmT9AtFWpPAq+qpKJsSOAly8hg8BZ4GZl9vx/BywTDMjHT8rEfDppOJNc+8UnzaVyHemd3TJ2QTvcDfeQK41PrxuExvxheczoWb9kV4NqSjnAsv+5CYRxtncONIigamWblInYDHCpusfs0pfwInTd57gwZQ0r0TZJja6kUiVdfig8A5JCiWnbgmzSgnIJzWQOzSWIHI9f/ZIq1pZRlVs4TZg5xihS2w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(9686003)(66556008)(55016002)(66446008)(64756008)(76116006)(8676002)(55236004)(7696005)(6916009)(6506007)(2906002)(26005)(83380400001)(316002)(186003)(33656002)(71200400001)(86362001)(66476007)(66946007)(8936002)(4744005)(4326008)(54906003)(52536014)(5660300002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: a/BqeY5S6c6k5suSI4Cmzlfstf6y3tZjbcYyLB9UUYFkt/+HMAxF/Cem1fPyN6rlWI4WA/9vSENWR8fFGfQr3UEhKob2GzaqZXdlO1+a4xHm/wdvCymnkgsUYR/fN6ozpQopAKsjcNlfMezeXwJFgDybAklA0zb1f61MdQBZj4IEO4HDPoONGvk39XXiglLpZTFavDusaxgqp2ZaUL5SMBEbalBgioAIqZ1qQytI7aU3ly2j6EyLd8zMnvTWWBHyNoWRWfVGa31NVt1Fhct2ZNTX+obzFh3YWhGutc3J9gKadRibUtxnBFOYR5RyEZ2Gkt2louWDDKIACm5kltD4tZnV+pnI7mDVipzAjD4wIQoJ/trz1WJowtJ8xtInDxMyEQPq2R6JsQFMmNdVA3VrX2DHGoYLGqaO+yWgUqPhQYtHonjj52rYtsB7V0ksbWeVI5yaJOSfLl2PJrAUuJ8hfhHF2ShXN+9+KheH7jXBmusLKU3/3KBuImPiBrwy12zb
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 871f9a23-987e-4f23-c63f-08d82a4d8f3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 12:33:07.5945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Eliz2PejRL7PShuo/fE4ZJ6PeTs2wDmZU5IvVaEowdckojeEvC43RdJrl29ol+q31ZINZeOmXjJn2mwSwvELlsP9gVql8K18HFOrNsePkF+AsChbEhOp2h1UqHxzAuTq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2159
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5
LCBKdWx5IDE3LCAyMDIwIDc6MDcgUE0NCjxzbmlwPg0KPiA+ID4gPiBIb3dldmVyLCBQTUlDIG9u
IFVMQ0IgY2Fubm90IGNvbnRyb2wgdGhlIEtGIHBvd2VyIHVuZm9ydHVuYXRlbHkuDQo+ID4gPiA+
IFNvLCB3ZSBoYXZlIG5vIGNoYW5jZSB0byB1c2UgczJyYW0gb24gVUxDQitLRi4uLg0KPiA+ID4N
Cj4gPiA+IE1ha2VzIHNlbnNlLg0KPiA+ID4gQlRXLCB3aGF0IGhhcHBlbnMgaWYgeW91IHRyeSBz
MnJhbT8gSSBndWVzcyB0aGUgc3lzdGVtIGp1c3Qgd2FrZXMgdXAgYWdhaW4NCj4gPiA+IGltbWVk
aWF0ZWx5PyBPciBkb2VzIGl0IGNyYXNoPw0KPiA+DQo+ID4gSXQncyBmcm96ZW4gYWZ0ZXIgczJy
YW0uIFNvbWUgTEVEcyBvbiBVTENCIGlzIE9GRi4gQnV0LCBMRURzIG9uIEtGIGlzIHN0aWxsIE9O
Lg0KPiANCj4gT29wcy4NCj4gDQo+ID4gU28sIEknbSB3b25kZXJpbmcgaWYgaXQncyBiZXR0ZXIg
dG8gYWRkIHRoZSBwcm9wZXJ0eSBvbiBVTENCK0tGIHRvbw0KPiA+IGJlY2F1c2UgaXQgc2VlbXMg
VUxDQiBpcyB0dXJuZWQgb2ZmLiBCdXQsIHdoYXQgZG8geW91IHRoaW5rPw0KPiANCj4gSU1ITywg
YSBncmFjZWZ1bCBzaHV0ZG93biBpcyBiZXR0ZXIuDQoNClRoYW5rIHlvdSBmb3IgeW91ciBvcGlu
aW9uLiBJIHRoaW5rIHNvLiBTbywgSSdsbCBzdWJtaXQgYSBwYXRjaC4NCg0KQmVzdCByZWdhcmRz
LA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
