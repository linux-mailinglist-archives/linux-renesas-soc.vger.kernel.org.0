Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6703E9F55
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 09:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233076AbhHLHSA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 03:18:00 -0400
Received: from mail-eopbgr1410097.outbound.protection.outlook.com ([40.107.141.97]:12414
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230316AbhHLHSA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 03:18:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgPbJU/0wOoDcv4wiwD7zGFbTHDizdyjnWhvfDjSAgSNqon7qvwFRt4D39uFwgAcUgfhpdzo0uyWvaMIyNq078A+HhhpPOQ3k0/n9srYyKENjSpXipCfkCHz2rakzOFbAmCEl0WE8dNITCfHtachcD0kUZs6y5ri4RmxRIiwKz/NHPLb93Q6x6A81Cu+8g6cmpYM4J+ylVxabkQMtlaFY1T8OzUE5y5Ms6NQpgfipR2lWxECrFIWLSoOIXjxFLuCLl0M4bZ7u0dur8yecWf2aCuqRQH4/HjLwaGK5SZcIR2TCPwlVdvJRb8QOSeJ/yJOFoOX0rdwoMKovK2NNCIMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHKDDjRK3S1gtOqq0fskpzJd7E7Y+G+hjW9Hfqa+7pA=;
 b=A/XN4tO7+RLOZRcoRL/kxe3qsmUgmc0jCTNeuCPckKYnVG8DrR2Hxioa5fL1lnuHkHiNRKUb5tqo4CymLJl9UmXPzJoa9kNwhhsx2sQQ7WIraiT2f+ZE8sshp59htYVY5JCF/lKcOMSC9WiF45nhzDe0VzOsRsMdHyJnd3vcxRVjQHYJp5okqgIdEKjN1KMEjf0OLa0yrwCX9Rh00O4zWRXJpPtjsPkmoduzA4nRTh+i4jyIXmM8aRCvbTF1T7pZPJOOjmlqLBxuKA9P1632P7p+0w0eI0z+vBEOSbjrQC5GytHNRb82wiXIhfLM4ZJs6vsyKtZO6b8mPW4Qoa2Wxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHKDDjRK3S1gtOqq0fskpzJd7E7Y+G+hjW9Hfqa+7pA=;
 b=FBZrKd03XhUuAiW5RlHf7a+lYxPxBfwFEbAwxi7fMju1HqD3s1Xe/54Qth42cF0KQYIzi++tVUdQLGgCpPF4z1nDzfoxK9SUbJo8Q1bS9ow1ExV6vzom9zZ0emIHFCk/TTXz+FAA99QHjWqwLZv5wdw4aZMW6/J55VHAjbbYjgU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB1698.jpnprd01.prod.outlook.com (2603:1096:603:2f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Thu, 12 Aug
 2021 07:17:31 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4415.017; Thu, 12 Aug 2021
 07:17:31 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 4/6] arm64: dts: renesas: r9a07g044: Add USB2.0 phy and
 host support
Thread-Topic: [PATCH v5 4/6] arm64: dts: renesas: r9a07g044: Add USB2.0 phy
 and host support
Thread-Index: AQHXgxkE0cWhJdGLJUiGYUbbmoaYc6tsnFgAgALs6JA=
Date:   Thu, 12 Aug 2021 07:17:31 +0000
Message-ID: <OS0PR01MB592233D07AA6E4750267799786F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210727185527.19907-1-biju.das.jz@bp.renesas.com>
 <20210727185527.19907-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdXJY62vYx-ukDtdARg5duWqyKnL1CsoXEvf7-CfRcLZ0g@mail.gmail.com>
In-Reply-To: <CAMuHMdXJY62vYx-ukDtdARg5duWqyKnL1CsoXEvf7-CfRcLZ0g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e2644fe-d1b9-42c1-3df5-08d95d613fea
x-ms-traffictypediagnostic: OSAPR01MB1698:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB16980C66E6762B5244ED7DA186F99@OSAPR01MB1698.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YS1krNYcwISs03ftL4wfsP7jUaGuiu5k9oT202tnSvaE7eZv0AGCrHN5nC2WtBaGQ8AEtyyGzaATKJlFGiTHEMwEXoAEBV7cneGfRWflC04OKA66bJPGFdzomblX4QhS418poRtdjCe4rk8NiATSdwfZqmu1V7eEWoCD2/FSZwq2cF8jMeG6ZVTtm1HObLTPNlsL0wt8QwV8LU86Ln+ao9dioxi6snV90kl4lPgV2Guo16AyMeLmOnMUtwSXXFIMnvVr9WXABwfSwCN8VE7QAn5b+OlZvqLgNVVI4TkdVpNW0L6FLVKkv5bh206wxpFNxeHENi8xwpnLniREP513I4BGKGHQQ8leP85/nelTHPNvn9LU/JWp09vHxsyjrdIc0DSMEU5eI6ETc9Z/9t1/Q61j/QSurmbIpHXKQaJWVe+nMQ9Oum3/eiuyzux3hBTaG68d+vxj29PdVTV6ZB7q4pAQ6IWKTkd7A0PSNTPYFUB6wKf4lwOaP88/P+gGTn7keI+UT3B6G/SampvRE0ZCiZ1CfvWgx/mN1BOlp2Uz5KJb5T4v7ykrUomQMLXH7wjzvRKFP9twir7onXVEWbiYiEzbo26ZugmtU6jPIqN3/71eqghfRNcMHCrRHy6hq4UQtI/hMZcDSmsVtTcZ5EfxWIKoNsq9jVpJ2/QieNMA9YXcKFbRwDUZBbcNw99yiP2g2aALGBh1+2hJRaaTfprFyQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(55016002)(52536014)(83380400001)(5660300002)(66946007)(76116006)(86362001)(66446008)(64756008)(66556008)(66476007)(6916009)(54906003)(9686003)(71200400001)(107886003)(316002)(38100700002)(6506007)(53546011)(38070700005)(122000001)(7696005)(186003)(2906002)(26005)(478600001)(33656002)(4326008)(8936002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDVSQkRsTFZaMWhncUE5NHUyWUtkeW5OWnZkTUt6V1d5dndtdWNyVGgxeU4v?=
 =?utf-8?B?NVlObUpTczBjSGxoOGFxQXVuWnQvMmkrS0xMa1o5cFJWcWZMQlJTeGpFY0du?=
 =?utf-8?B?Vm5icUcwQytkaEEyM3JqU0QzejRKb0ZmaDFhSVZwOGdabHRRb3pIelVhTmN1?=
 =?utf-8?B?eXBHUG5KSmdLTElJYzhXbERCVHBJTVJTZFhpaWZhVk1jNGUxVnVGZm03NUNn?=
 =?utf-8?B?T1U1WnZpcTA1MFdZeDVCQWh2YnNmUW1sUHBFRWM4Szl0dXNPN29QWWxQR204?=
 =?utf-8?B?VEZuZG1QQ2UrWTZUYmZZejRDa1gxQnZaRnJEUkNQS0ZFUWM2N25CUXhCV09R?=
 =?utf-8?B?RTBBd0J1U3l6NEg2OTJBbGJkTUl2ci9NMjNKaU4wUGQzM3RUMEZXQUpWSDBl?=
 =?utf-8?B?T2M0Vkl2SmFvWTh5NVBjektmOTNuby93bU1FN2RUSHVCSnJ1TjNkZ3lTVVp4?=
 =?utf-8?B?V1lnclFySDV4UTRUdk1xUDN1d3lZM1U0VGFCa3phRWdqTmxjT2Q4R1RMYW81?=
 =?utf-8?B?Y2tLR3o4V0EwckhDZFE0Uk9wa2FzTVcvWTZFanQzZXNUbUplRm56V0lKQ1k1?=
 =?utf-8?B?b1pqUXVaRFNreG9DZVRsTXJDOEUvalRNRk5zNm9WRjdBMXgxcUw0WHdSQTNP?=
 =?utf-8?B?RmoxMytlYkJNYzA2djM0TlV4V1ExWVF5Q3VhWVhESG9NdWQvZS9paStVV1Yz?=
 =?utf-8?B?TlhsR3Y4ajdvTEVPQUtVRVYxelhCZ1QxbXdjZTZyaWQxdCtac2s2VkJ5MDBa?=
 =?utf-8?B?M1lFeGs2TXQ4eGpBYXJnYkVmamNvUHpMNDR3bkRBMnpITjk5bTNpSkt1Z0dR?=
 =?utf-8?B?U3lLZGpRT29xRVQ4emEyN1RpeGRyRGVCYnpxQk5HWmZ3eWNSTjNZV3ZGVDBh?=
 =?utf-8?B?T0RpOUR1NUMrb0YwYUR6ckxRYXNSOGo0elh6ZkJoWTBrU3JSVmRpSDhiMVBJ?=
 =?utf-8?B?ejc0NEZLckN2SGFqMkFZZkJ6NmE2NWd2WWZEaTFCS1Qxa3FSSG92LzBkRUQ2?=
 =?utf-8?B?dmVxR2duUTNmeUZJMEpZK0ZlL3VjclFlWEFhWkZNSUhXam5EN254ZGhVbVJn?=
 =?utf-8?B?NU1PV3pQRlltbU04NDc5dFA1KzVxV2d4UTRnQVNlKzdpSUNkQmtRVkhlY2ll?=
 =?utf-8?B?dGprUDZIaGJoNXM4N0M3TWhXUHBldVcyMUZCTTJvUVRqb0NvN1hBKzBLM0JK?=
 =?utf-8?B?OWFLL3B3ZU5qOTF3K1VJN2RuME9nbkRYNXRUN3kwaytjVUJIYmxnNUZhNVdr?=
 =?utf-8?B?Slg1NUIveFFWT1VpOXovamt2MnNaOTlDYmhTUE9IdE1rQUNjUmxKWCtDaWwz?=
 =?utf-8?B?QU1rYjFyV2ozdjM1bFhGMFpIQllPV083c2p0aHdHaHdYNmcvQWJlczVNVTNT?=
 =?utf-8?B?b0h3dWE4a090V2FySXYwRFNIU2FwTWpibEZydlV1U3JrNlRFdlVlRXpycXIx?=
 =?utf-8?B?MGkwMVZjU1ZwaXNOWFRGS2REaVhWZ2tNUnFFaStmOVk2ZXZER01VQ0ZESkNC?=
 =?utf-8?B?Z3NmUHZxdFNyeUxva1JHam9SUlRIdE84NUdwWnViK203K2Z6UG9YeG5Wd0RF?=
 =?utf-8?B?eFJiTkI3UU9HWkYySzNUOEJ1bkxNQ3M3eEY3eTRkNWFXVnVicVc1THNUc3Rr?=
 =?utf-8?B?VDhvaEZPWkhXYmh6SUNvenNqeUFqd3lxYUZ5WnJ0QVFRSzlGNmx1ZGJIVE5Y?=
 =?utf-8?B?R3hrQXV3U242NW5Ea3ZCZXVIdTRZc1BFbC9SU3RIR0t1dWZHTHJZd0d4YThV?=
 =?utf-8?Q?N6lxSP/C9E+jRwKlCXE4ERGx7veWn0f+k7OjccB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2644fe-d1b9-42c1-3df5-08d95d613fea
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2021 07:17:31.3644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E45qwC4HzMWWmM1cjn9vL+8iZQz/DhdfRU9WHKDEvDyP4W+NMxE6YQfmQ18TknETXx+94rtX06aTbF66DWZNDb1xXUep/Xg9z2bqGnTzAbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1698
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjUgNC82XSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwN2cwNDQ6IEFkZCBVU0IyLjAg
cGh5DQo+IGFuZCBob3N0IHN1cHBvcnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIEp1
bCAyNywgMjAyMSBhdCA4OjU1IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gd3JvdGU6DQo+ID4gQWRkIFVTQjIuMCBwaHkgYW5kIGhvc3Qgc3VwcG9ydCB0byBTb0Mg
RFQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhh
ZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEN
Cj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0NC5kdHNp
DQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0NC5kdHNpDQo+
ID4gQEAgLTIwMCw2ICsyMDAsMTAwIEBADQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgPDB4MCAweDExOTQwMDAwIDAgMHg2MDAwMD47DQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgaW50ZXJydXB0cyA9IDxHSUNfUFBJIDkgSVJRX1RZUEVfTEVWRUxfTE9XPjsNCj4gPiAgICAg
ICAgICAgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIHBoeXJzdDogdXNicGh5
LWN0cmxAMTFjNDAwMDAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAicmVuZXNhcyxyOWEwN2cwNDQtdXNicGh5LWN0cmwiLA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAicmVuZXNhcyxyemcybC11c2JwaHktY3RybCI7DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHgxMWM0MDAwMCAwIDB4MTAwMDA+Ow0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmY3BnIENQR19NT0QgUjlBMDdHMDQ0
X1VTQl9QQ0xLPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8JmNwZyBS
OUEwN0cwNDRfVVNCX1BSRVNFVE4+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBvd2Vy
LWRvbWFpbnMgPSA8JmNwZz47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgI3Jlc2V0LWNl
bGxzID0gPDE+Ow0KPiANCj4gU2hvdWxkIHRoZXJlIGJlIGEgc3RhdHVzID0gImRpc2FibGVkIj8N
Cg0KT0ssIHdpbGwgYWRkIGl0IGluIFNvQyBkdHNpLCBzaW5jZSBhbGwgUlovRzJMIGJhc2VkIGJv
YXJkcyBoYXZlIFVTQiBzdXBwb3J0Lg0KDQpJbiBmdXR1cmUsIGlmIHRoZXJlIGlzIGEgcmVxdWly
ZW1lbnQgZm9yIGhhbmRsaW5nIG9mIHBlcm1hbmVudGx5IHVudXNlZCBwaW4NCmFzIG1lbnRpb25l
ZCBpbiBzZWN0aW9uICIzNC40LjIuIEhhbmRsaW5nIG9mIHBlcm1hbmVudGx5IHVudXNlZCBwaW4i
DQp0aGVuIHdlIG5lZWQgdG8gZW5hYmxlIHRoaXMgZHJpdmVyIGluIFNvQyBkdHNpLiB3aXRoIGR0
LWJpbmRpbmcgYW5kIGRyaXZlciBwcm9iZSANCmNoYW5nZXMgZm9yIGhhbmRsaW5nIHRoZSBzYW1l
Lg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+IA0KPiBU
aGUgcmVzdCBsb29rcyBnb29kIHRvIG1lLCBzbyB3aXRoIHRoZSBhYm92ZSBjbGFyaWZpZWQ6DQo+
IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJl
Pg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBv
ZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IElu
IHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlz
ZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1
c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
