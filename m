Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FCA03B24ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 04:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhFXC1o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 22:27:44 -0400
Received: from mail-eopbgr1400138.outbound.protection.outlook.com ([40.107.140.138]:3344
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229826AbhFXC1m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 22:27:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKJwKDWzsu/gCgI5CWEbA/hqOI3JFY3gUSggW/yujeQ0jpvtqYSUSE0r0iAsZRoPMAvF9hw1FFZa7I0FBkEJzfEQnAYyafbDu1tqkBi/gbdHd2ENhUQoZTSS3aa1v9874DYX/MrXJSTPQtPvzWVnqJX9U9wc7fi7G00JoUweDPJBohxw97A07OS+n8hJV3M/yLad1FKSlgsJ7T6WMrzmSfClDI2MkTia6Ts6sDDpaDRRKr7FH27v5haTJJlsH/3ETjC93DhC/iNmsjxotQSjYY/HXmrv+b1pAbOfkAVlQpuktTVcYAseKbOaJSxyNpIQaQ2ovLPibzz/UAjzRDEjeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qnPOlUsbMDr0CsuKKugl5eWbmmG5N89/ACMHoGRBvQ=;
 b=aE7A9oBc5b7gqILJ4xwfWxRiKbQs9eBrHwWQ+FSgg0Qfnty8anq6cRpAzfuE+bOy2aitpq+t4aKRQ+Lju2raht0AWzHb/0IsCJ56jvJbcdhBKli/aVNKSF0h+yKfX945JDDirtZCeIDERcK6CmX/VOraucuWDnFaWhUi7cgYcTJy44BerhZRFA17YO39ml8WfP2sem9oieclDzlzxoh/K5rZqLTFGm5SQ4V4MDh3yeLnuUcaEYktcrHOkCf05IxWyEmxgND7zKJhA+jMz1Cmby/8gsG7tZfrw6J7rKMfK55+5qrq9GmBeUuZZzSjqCsSppM3PK0D9VgS1o2kcJw6rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qnPOlUsbMDr0CsuKKugl5eWbmmG5N89/ACMHoGRBvQ=;
 b=NNlxbcZ/XXb3DvpVvolTQr43DjuEfYRq0LnxdxlrtJrJ5jJOmA5Bzyk+r36jA7TBBAWW+gU7RJ01sVseKtL37W6BeL53vHZoIVjL3hrjtR6rrjDeEmx2iJhL0gNS2Sqx6/qnwEI94bUOrl2okfbYVvCC/pTjPFHBoZU/2XoK8zU=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB6427.jpnprd01.prod.outlook.com (2603:1096:400:a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Thu, 24 Jun
 2021 02:25:22 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4242.024; Thu, 24 Jun 2021
 02:25:22 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa@kernel.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH 04/14] mmc: renesas_sdhi: Add support for R-Car H3e-2G and
 M3e-2G
Thread-Topic: [PATCH 04/14] mmc: renesas_sdhi: Add support for R-Car H3e-2G
 and M3e-2G
Thread-Index: AQHXXdxGVxnXORnr0UKfnp2dzw5A3KsT3joAgAAN+YCADpPUcA==
Date:   Thu, 24 Jun 2021 02:25:21 +0000
Message-ID: <TY2PR01MB36929E0DE956A374B8CF5EE7D8079@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <22b4c393bf5074b53791d2797d8fe74deb8ea9a7.1623315732.git.geert+renesas@glider.be>
 <YMei/rKwEyicfx+H@pendragon.ideasonboard.com>
 <CAMuHMdUJQCv7Qe01Km=6F=yUjcNoo_OvOBrYpPcC3SbhX0Ru5Q@mail.gmail.com>
In-Reply-To: <CAMuHMdUJQCv7Qe01Km=6F=yUjcNoo_OvOBrYpPcC3SbhX0Ru5Q@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b3397c5-93ff-4969-45c0-08d936b7514a
x-ms-traffictypediagnostic: TYAPR01MB6427:
x-microsoft-antispam-prvs: <TYAPR01MB6427621DFA505EC423508538D8079@TYAPR01MB6427.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f4bjVCJjJZ8+S7T2wuCFqJ4uwkH4QKe0gWUhmi0i+fdutNE8SUPxv3AsxCr+xmibehdtxBlvtnDC5vyWTewyBm0+qhl4McNpLGN6IPPaT3M2ZUbypuDMWaN2tdHBZ0UHEuwpBM5D79vpgAZy87rWJfKuYmCxrG55LEUfTZAXMNK1GfEasjxhgBd34mioIauOVOlay8DnpjiYUgYKNPxSIhTgEWrVg2GwPwwMsIFOgDLzFKGuV54HmNtitULVXkp0fw9hrbO8mTCXgeUJMlMnu53edw5RJQG5QsZg9y5/pAXRwhQ1GmYQcUxa3wnAeBAEF7sMwqdh+i4/1DV6ITPZ4TI3cLEi3jrex657Ncn8D5LGrx/cNURrbEKFI6rdtw5yAY0pH0y2CcwjRuqWIS4UyVXpqak3y1Y41W5AzDEKy4rd+Gt2L2QSqRQ9YZTnAmGrtTSBH28IKxq8CLdFWFWGmn3oOsFppeTWnTqtUoHFiQyzNGJZB106suGvytb0yKAnjkWP2QFw23wJwryyGuE09PPw0LcA0hS9ujkeMxg0SwHwdjjQtcjQOBLHUacYU9AjRjirzoHvwyW4TDcgcTiU/kXbxadv42Cmai1cZWszh8s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(5660300002)(9686003)(122000001)(4326008)(55016002)(66446008)(478600001)(66946007)(64756008)(66476007)(66556008)(38100700002)(71200400001)(110136005)(54906003)(8936002)(76116006)(2906002)(316002)(6506007)(33656002)(52536014)(53546011)(186003)(26005)(8676002)(55236004)(7696005)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2RBY0pCR1NYZWVjMUY1a1M4dE1QeWJTSWhORCtVZndxNjFnamlXdnFNcTli?=
 =?utf-8?B?TnNDZDZIMGFpTDFZR1llZmFGd0R0YmJhVVBhd1hKaHJqZDhSbTBXMU54c2JI?=
 =?utf-8?B?dWNzNDJqM1ZvWG1pK1ZCMzJ3bWcwK1U0YjdyZWxKR01OOUh0em90Nmo0d3Zz?=
 =?utf-8?B?VzAyRU9sSllTUURUUDFGOURxbmNCaVUxbWg4S2tZM1NsbmlORTk0TkF5YXFu?=
 =?utf-8?B?MURtQlpHMHBvU2svZlhkT2gydjZXNFJNWnRWQmswRXhTS1lkamtidGtzTG9n?=
 =?utf-8?B?VlpUWWIrYm9mVHcxNXdkTG9aREhtK2dpSGtpUXJBQ1lRUjloSFVLUWNCNzdj?=
 =?utf-8?B?UXFEVlpEZkVPZUx4T1ZKNFFVa2FaOVFybndrUzBiYXppU2c3N1FvV1FzUXhX?=
 =?utf-8?B?MUdFcWV6SUJmZWE0OVc0b0pXbWZiblMyUHIrd0pzbkFBQ3ZFRE56VWFVenpL?=
 =?utf-8?B?bTVvdzhOUHNqWXJYSWhTajRDWlp1SkZ3OHdrMW1YSmdXQyswVXQ1VzlLbGFI?=
 =?utf-8?B?OEw0OGdSZUdMTU54Mm5GemVsUnJRdzhsUG1BVDhTUGcxWmdrZklLanR2MHho?=
 =?utf-8?B?Sjl5Z2YrREtWWjNjQ3VkSktrYmdBdGdVRFdPSHI5Ui8wQndEWGtaMldpU0Iz?=
 =?utf-8?B?QlJVNmo0VnZmT3JXSU5sVlRnQ1RYYy9DWGEwS25HYTArV1UvSldPTHFyV3R1?=
 =?utf-8?B?RkgzaXdLMloyTCtsZWVySG16QXNoK1BwclFVQ0lyMTI5Nm9lRjYyRDExb0pB?=
 =?utf-8?B?Z1hPaDh4RU02WG5nbzVOdHhWY01pNXI2ZnA5QlVpczN6ZExZcGhTa3ZHekRn?=
 =?utf-8?B?UnRjTThjdHVmSXlLRGpmVzVMUHZ1bktxd28rS3RpR1JSLzB4VVIwSlJ1SHR6?=
 =?utf-8?B?OGdLMFBUbndoRGdJcE1HSFppeEordllYTWJpY3dROGR0NE04ZmE0OWd6K2t5?=
 =?utf-8?B?Z1hVK3J0K202Mm9ZUGtXS1dzREVkcnEyZUMzRDhHMEVKWG1ITXNYd3VwRjA5?=
 =?utf-8?B?R1dLa0hSZGp2ejVZU05pbUFlRmh3c0FUSVVUWHlOVGF6L2FtMUM2dnVuZ1N2?=
 =?utf-8?B?dnBnNVNEeEFFTVVYR2xXL3dKeXVIMDF3ZU5BN212TSswcG0zSUlVT3VzdjlR?=
 =?utf-8?B?UnREU3JrYmRNK05wTThhaHBCamI1UndXMUc1TUtKMk5zTHZ0cVJXT1NuQnJJ?=
 =?utf-8?B?TUpLMExCVjA3eGxYTlZsb2drVUNtOFpwV1c2V0NZMlJyUUNLRVdRbUpHNFlu?=
 =?utf-8?B?Q21YdjhhMm8vTk16UUZjTjBTcmlaTWtRaXptK3cyQzJXZHBQWWlNcy9UWDBl?=
 =?utf-8?B?RC90UDBEcHQwTEJOM3dZelBnY2tPbElYYWwzMFJsN2IwSjFQT3pHM21uSzhC?=
 =?utf-8?B?V3h3NVAxaWwxZHZna1FhcmhmaktjL3dEYkRvV1QzbU1tbldRUzliNHlaYmd2?=
 =?utf-8?B?T1ZvY1ZTb3h2WXFteGxlRUNJbG1vcjdram4zMC93SUg4VDVscThJcFBJTTJH?=
 =?utf-8?B?cmYxU2NKRHZITHdGZ09FaFVvdmMzT2xxb2N1enlqemdLa3YzNUszTHNhL0dv?=
 =?utf-8?B?UkU5UUh1TUlrZ0d5R1ZRcEpseVk0WHpITkN4OWIrVFVvandXWlNNWVZuWnBO?=
 =?utf-8?B?dHVEMThqV0lOQ3J1MDRndHZnNUNpbWNOaGF2VEZYOUV3a0QzWDZSSGhQRWU2?=
 =?utf-8?B?MFExOFZwTkZpbGNZdTcydjhhR3QrSkh6RzVmeFc4VEV0NExXYk5DRm1DTWt1?=
 =?utf-8?Q?jOZFwurHApmzl+BX4hXDcUUkxD3okMlIVyVhgCj?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3397c5-93ff-4969-45c0-08d936b7514a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2021 02:25:21.8823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XPQ5SsXaK0D9nSDJK0xckno3RqaUewqczYOjEZOqWpeQv4xlvfcAqdqU2uGTMYbtXelqWd1WBWxFG6rSij4GRFg1UmNT/9UAQDizP502d/k+tGz7qcqcsZ+EjRDbpzKP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6427
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2Rh
eSwgSnVuZSAxNSwgMjAyMSA0OjMyIEFNDQo+IA0KPiBIaSBMYXVyZW50LA0KPiANCj4gT24gTW9u
LCBKdW4gMTQsIDIwMjEgYXQgODo0MiBQTSBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOg0KPiA+IE9u
IFRodSwgSnVuIDEwLCAyMDIxIGF0IDExOjM3OjE3QU0gKzAyMDAsIEdlZXJ0IFV5dHRlcmhvZXZl
biB3cm90ZToNCj4gPiA+IEFkZCBzdXBwb3J0IGZvciB0aGUgUi1DYXIgSDNlLTJHIChSOEE3NzlN
MSkgYW5kIE0zZS0yRyAoUjhBNzc5TTMpIFNvQ3MuDQo+ID4gPiBUaGVzZSBhcmUgZGlmZmVyZW50
IGdyYWRpbmdzIG9mIHRoZSBSLUNhciBIMyBFUzMuMCAoUjhBNzc5NTEpIGFuZCBNMy1XKw0KPiA+
ID4gKFI4QTc3OTYxKSBTb0NzLCBhbmQgdGh1cyBzdWJqZWN0IHRvIHRoZSBzYW1lIHF1aXJrcy4N
Cj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3Jl
bmVzYXNAZ2xpZGVyLmJlPg0KPiANCj4gPiA+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvcmVuZXNh
c19zZGhpX2NvcmUuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGlf
Y29yZS5jDQo+ID4gPiBAQCAtOTQzLDYgKzk0Myw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc29j
X2RldmljZV9hdHRyaWJ1dGUgc2RoaV9xdWlya3NfbWF0Y2hbXSAgPSB7DQo+ID4gPiAgICAgICB7
IC5zb2NfaWQgPSAicjhhNzc5NjUiLCAuZGF0YSA9ICZzZGhpX3F1aXJrc19yOGE3Nzk2NSB9LA0K
PiA+ID4gICAgICAgeyAuc29jX2lkID0gInI4YTc3OTgwIiwgLmRhdGEgPSAmc2RoaV9xdWlya3Nf
bm9oczQwMCB9LA0KPiA+ID4gICAgICAgeyAuc29jX2lkID0gInI4YTc3OTkwIiwgLmRhdGEgPSAm
c2RoaV9xdWlya3NfcjhhNzc5OTAgfSwNCj4gPiA+ICsgICAgIHsgLnNvY19pZCA9ICJyOGE3Nzlt
MSIsIC5kYXRhID0gJnNkaGlfcXVpcmtzX2JhZF90YXBzMjM2NyB9LA0KPiA+ID4gKyAgICAgeyAu
c29jX2lkID0gInI4YTc3OW0zIiwgLmRhdGEgPSAmc2RoaV9xdWlya3NfYmFkX3RhcHMxMzU3IH0s
DQo+ID4NCj4gPiBDb3VsZCB3ZSByZXVzZSB0aGUgZW50cmllcyBmb3IgSDMgYW5kIE0zIGluc3Rl
YWQsIGJ5IGRyb3BwaW5nIHRoZQ0KPiA+ICJFUzMuKiIgcmV2aXNpb24gPw0KPiANCj4gV2UgY2Fu
bm90IHJldXNlIHRoZSBIMyBFUzMuMCBlbnRyeSwgYXMgc29jX2RldmljZV9tYXRjaCgpDQo+IHdv
cmtzIGRpZmZlcmVudGx5IHRoYW4gb2ZfbWFjaGluZV9pc19jb21wYXRpYmxlKCk6IHRoZSBmb3Jt
ZXIgZG9lc24ndA0KPiBjb25zaWRlciAicjhhNzc5bTEiIGFuZCAicjhhNzc5NSIgZXF1aXZhbGVu
dCwgdGhlIGxhdHRlciBkb2VzLg0KPiBTYW1lIGZvciBNMy1XKyAobm8gZXhwbGljaXQgRVMzLjAg
dGhlcmUpIGFuZCBNM2UtMkcuDQo+IA0KPiBJdCdzIGEgcGl0eSB3ZSBzdGlsbCBkb24ndCBoYXZl
IGEgInF1aXJrLWZyZWUiIFNESEkgdmVyc2lvbiBvbiBIMw0KPiBhbmQgTTMtVyBjbGFzcyBTb0Nz
ICh3YWl0aW5nIGZvciBFUzQuMD8pLCBhcyB0aGF0IHdvdWxkIGFsbG93IHVzIHRvDQo+IGp1c3Qg
bWF0Y2ggb24gInJlbmVzYXMsc2RoaS1yOGE3Nzk1IiByZXNwLiAicmVuZXNhcyxzZGhpLXI4YTc3
OTYxIg0KPiB0aHJvdWdoIHRoZSBkcml2ZXIncyAub2ZfbWF0Y2hfdGFibGVbXSBpbnN0ZWFkLCB3
aGljaCB3b3VsZCB3b3JrIGZvcg0KPiBIM2UtMkcgYW5kIE0zZS0yRywgdG9vLg0KDQpQZXJoYXBz
LCBFUzQuMCB3aWxsIG5vdCBiZSByZWxlYXNlZC4gU28sIHdlIGNhbiByZWZhY3RvciB0aGUgZHJp
dmVyJ3MNCi5vZl9tYXRjaF90YWJsZVtdIG5vdy4gSSBpbnZlc3RpZ2F0ZWQgdGhpcyBhIGxpdHRs
ZSwgYW5kIGl0IHNlZW1zDQp3ZSBuZWVkIG1hbnkgcmVuZXNhc19zZGhpX29mX2RhdGEgZm9yIGVh
Y2ggU29DIGluc3RlYWQgb2YNCm9mX3JjYXJfZ2VuM19jb21wYXRpYmxlLiBCdXQsIEkgZ3Vlc3Mg
c3VjaCBtb2RpZmljYXRpb24gaXMgYmV0dGVyDQp0aGFuIGFkZGluZyBzZGhpX3F1aXJrc19tYXRj
aCBlbnRyaWVzLg0KDQpXb2xmcmFtLXNhbiwgd2hhdCBkbyB5b3UgdGhpbmtzPw0KDQpCZXN0IHJl
Z2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
