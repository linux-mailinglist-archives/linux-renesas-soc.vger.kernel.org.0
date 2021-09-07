Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63C7240218D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Sep 2021 02:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231760AbhIGADZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Sep 2021 20:03:25 -0400
Received: from mail-eopbgr1400115.outbound.protection.outlook.com ([40.107.140.115]:38924
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230169AbhIGADZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Sep 2021 20:03:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLMRmPpmDMj9GOtPL0Kt2vgEjcMf17sCFyrsBK0ZG6MQ16LRfHBq3zSukpPI9HxsMbgdXq2qut6TlML9sM6k5IuPswguJb5r/2kio5MQxGqFQCd6zGqwNF6VGcK6j43T+ZD57SQGeckk4yLYOJtZwqR7x/4rKxytr045gE63Tic0CRghGvhnkNF9efY6Cos2Aos0wrDbZqDORBUKyMX3gOuZYYJ2gCc7rMthVQsYw//t8eHf5NyXj4Nf1maNU9YHv28pd+VPwbETzvpKcK5FmtW7INN8+ddE24SGNtsi8ZGONQrDQEVZqF3gaMqsrrPcqEdZR8E2avGD/y0cxAFYzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=9IkjNcpv4+JyqwbD1me1kJcyatV+chIy+Pxyy3QzrF0=;
 b=BYpvHe9Mrf/j+EsybK5KOe2cRgIX0/x2BeE3Ka45V3gYNvMVIPxCs6PpolkRp1fyM5iy29H9xQ4pbo+Ym9OtYr8C6hksRrpBOi8462vbJhf6BFiSz3ab0iarg50j9owFwBzMh9SQGoiMllDKb6XQ/G9eh8eWnNb94e8UCDvzVk25WkWMhMyHA89ybTntykIQ52HBpW8OWEJZJ5/kf7YDPaFpiLunehL5h6zplr31NqGnGQEovMZcYR91i1a18OePBRwFHFhOF2HUpFNzyEFjRz+1JFLlmE3994P+WbQgyrfmQIYxFi7S99u5hIBZCLeORe30VrgPY8hxglUnd4NdKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IkjNcpv4+JyqwbD1me1kJcyatV+chIy+Pxyy3QzrF0=;
 b=CrtNplopwLqlWecJYsJwC/NG9DD8irMlPrBTN5lLGLVJpzROYdH8pu/jRhnjMF66//5Ygi7nijzkYMMnYERvamE4UD807fHksYJ7/j+H44Jw1suHnxfbWKjpfedzlyvU51SrPLTjEd0DqhRhABr7HbW6F056vIktyY6TMmMJC18=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB5611.jpnprd01.prod.outlook.com (2603:1096:404:8052::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Tue, 7 Sep
 2021 00:02:17 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b10a:f267:d52c:1e5b]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b10a:f267:d52c:1e5b%3]) with mapi id 15.20.4478.026; Tue, 7 Sep 2021
 00:02:17 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] iommu/ipmmu-vmsa: Add support for r8a779a0
Thread-Topic: [PATCH 2/2] iommu/ipmmu-vmsa: Add support for r8a779a0
Thread-Index: AQHXnxvyoah/Riy0106C9EDQXIK2f6uXKuaAgACM7RA=
Date:   Tue, 7 Sep 2021 00:02:17 +0000
Message-ID: <TY2PR01MB36928CB43B188D4082829A1FD8D39@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210901102705.556093-1-yoshihiro.shimoda.uh@renesas.com>
 <20210901102705.556093-3-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXwf0_+VKfuiFQf6roZErz-JAm06P5RBzD-Jwm1uk=p9A@mail.gmail.com>
In-Reply-To: <CAMuHMdXwf0_+VKfuiFQf6roZErz-JAm06P5RBzD-Jwm1uk=p9A@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0929c60b-196c-4882-7a10-08d97192c15f
x-ms-traffictypediagnostic: TYAPR01MB5611:
x-microsoft-antispam-prvs: <TYAPR01MB561198D1C0ABE1CE410DCAFCD8D39@TYAPR01MB5611.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X0VMjWOQ8RfsfT+9MjQQypOZg2nvhmwkg+oTWPylZPqFS65JCL+S2RMt4mDI+5bbfPuNnZWWwLZpY2ZiwZCtwJfOOtvIKlAk5o1tHoA1Dr++tgwLr9GltrksYAFGoYPTmcPTgIi+DdXkkkqADXEgM/WH5evBU+z8NZfh62si0cvtIH4dSrkd+U8zY1657kHXa/LLe/HCtJcQzNyd/RXn8i0V+UZmtrWfBdrwMZ928Uzs9hlg03T5GyTE4ogMx9QAT9wAhn64QUiYDHKxTGGbr5vVqcn9VAHJeRSdtcPcx4MohbrRn7UsruauUalkodjFYAQqRGoCNqlagSYjypdFzxueOtFqUVP/pobup02aRRW25IOduOITuCME9/aS69RVaJRkOYAYKCr8WJehmR+1tERaEIVOqoBW/unpHTjIOfyRNw0fS/l+9fZ9xohWsUhu4mIocsyK6phcILNthS8IKke0avY2xJk4DgzBwW/f/GoWxq6WSDZ2OjwZE1vTpayIzuxkNChzUTQ11KCz6OEsjjFOhOaF6aEzOJazowAsx9M9HhEMtAgK1FjV8ENOdAynSAzNNVGAQZFaVTDxOGDj5k81zgYP3dpkPy2xtBSWPrpwIgQf5vlRYSid7wsHq8lr6wfhfycgrPHsVMtfccbFLQw6nJHUnYusMwTS6oltHLYBbegVQxZQmfZdnwGNx2dat/4io03dqPGrcsIKkQ/wQXcUQVWwf098LxMIjipLy+5cdD8V++RxFCq8zu1Padv/LM8kawwvrphCcKYpZvkcqg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(478600001)(4326008)(71200400001)(64756008)(33656002)(86362001)(5660300002)(83380400001)(26005)(76116006)(54906003)(55016002)(186003)(9686003)(66946007)(66556008)(66446008)(7696005)(53546011)(66476007)(6506007)(8676002)(52536014)(2906002)(8936002)(6916009)(316002)(55236004)(38100700002)(122000001)(38070700005)(138113003)(98903001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFBTZGgrZkNueU9PRTE3NitxcFNkSVdBMnE0dWpZaXdxOFZxWnA4UTdBQm1m?=
 =?utf-8?B?UzdMUEdVdnBTRHFJU3pyRWlNUnZNbkJZTzh6L2J1VDlzNE91azZkUWdxQytE?=
 =?utf-8?B?SmE2bGM1bzFDcWJtcUhoZC8rN1Yzdms5QVlocEZTWnNDVjhuRGtvTFlEckNE?=
 =?utf-8?B?TXFoVE9OVFl4SFdiR2F4ckVmQnRNeVBLL2xwazh6OURUNVBaTDMvUkwraWc2?=
 =?utf-8?B?Mkh2aW4rWWdzUTQ5czNKTi9JY3VQMEJuZ2w2MnFSSnFkcVVtMkIzSVo0MXZX?=
 =?utf-8?B?SElvQlRvQjNZT2phaXNhUGVVU0I5UjJ6R0dGY3JPOTZ3QW9MWGxCTkRWZlZn?=
 =?utf-8?B?SFJoRGpTbmhQTUsrdjkxd1NjYkFJL09iK2s5RGIxNjFZNXB1Z05keUJwVFIw?=
 =?utf-8?B?ajlFVXB4UTE4NG1EWmpDMGNKRkRmUExvSTM4bnpRQm5rSm1Kb3ZZbm80U0VR?=
 =?utf-8?B?cnZKaDRFdllYbDk2VnJMcWtlS2svdDJ4TnREWEcyRnZqL2hYcUJlOVQza1Ix?=
 =?utf-8?B?ZVBvR2wxOU4vVDFlWHphc2dDMmdQaUM2aGt5ZEFzZWxUQTdDYVNFUHp5VGEx?=
 =?utf-8?B?WnNIUVJpNUx0YWc0OGRKK1ZPdXdmdzJQVHpjS3NBZjQ2VWsrVFBtK2xKQmR4?=
 =?utf-8?B?bHU1TXk5WmpQMTNsc3pEcm5Xa3JLN3Yxa21yQU13bmhYM0hoY05ySUlNZkgw?=
 =?utf-8?B?enhTWEVtdVo2dVAvcHVXRjRLcldoejlNM1BFWFVuN3kwUGlXeEFUMTBTWmQ3?=
 =?utf-8?B?ckxENVI4UitrZzZSNlJYRnlMcGtSRUNPaDBZUGIraWtad3dwMHI2TS9oNlVx?=
 =?utf-8?B?aVJJMzFrT2U5NmdRWHI5R0NRK2ZpWStER1VXNkU0Y1hJUkp5cHZIenpxVE4r?=
 =?utf-8?B?ODFEYVpaVm9UeDhEZFZVc256Z3Z2YVZOWDB6K21wZTFBVGNUR0ZoNDk4eEVC?=
 =?utf-8?B?QkRVaW5QK2dYWG9aNWd2S1pEdm9RSkNJYmN3OWdoQkNTNlk1aUdOSFhlem5G?=
 =?utf-8?B?bVVKVXFhKzlGN1llU1RyVm1ldHBLd3VCcjZSUWJ5RE9XNU1oWm8vQ09sMnAx?=
 =?utf-8?B?N2t5T1dHS28vTFRoMHBraVplUmhoZTFjN2szbmx5NlkzNVdHZkFuUnlIMGlK?=
 =?utf-8?B?NFdkZjFVOGhMZFBZUzRZenduS1hoV0c0MHB3Y1lFYUYxeGFIYURuYmFHY2lK?=
 =?utf-8?B?MmV2TndkSDk2a01sd1ZwR29GVk4zOE9BTlpyZXlCZGRURjdzMHpNejRrRjhZ?=
 =?utf-8?B?aXlUeEZWSjFhNUR0S0FNL2JCaUdtc3lmWUkwTHk4OWpBRzlqOVFYUU02L3pC?=
 =?utf-8?B?Rmc2WDl2NjBVaFVoNElBV2ZHcUZlUWYyc1lKeEZHcTBaOHZwZ3ZGRE5aZkVU?=
 =?utf-8?B?Nk56SXFyTW5zTVJDWmJyWUZQcWpyYmFLNVBYbzQ5cVB4V1ExM2lvekRKWi94?=
 =?utf-8?B?ZHJHSG90Zzh3UDZJZEdTZm1XZVBla2tyU251SEJpWEE0M2VFSWpWalEzc3Vn?=
 =?utf-8?B?QXBaeVFGcjJRR1VQOHVnYi9aNXhNWG96Ui90bEZCd3pVRzBxYmdkRmVzWHFn?=
 =?utf-8?B?S2QxMUNCT2N0UHgrTGs1Y1FidlZNQ25BbUg4MG50QnZFYnhWdzg2cFRWOE5u?=
 =?utf-8?B?Y1psbXAvcTFLMUlNcmZ3bms3NG9FZlEwQ3hqelh3SW9pWCs1QTdEQ0JQOFRB?=
 =?utf-8?B?WUpXN3VrWmJiRkV4WHg0bVNIQWR2eTh4YVRDZVJZZ2JHYU84OHF3MmJWN0t1?=
 =?utf-8?Q?Y7/49rYjmb1f1WxlUbrftP1zQo3EPF7yG3Opo/P?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0929c60b-196c-4882-7a10-08d97192c15f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 00:02:17.1630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wVECDQ91xMp/k6e0Jw51KbBHSkIsFYpjl9bmn9/Y/2e/q6CCh8lG962UhVOHt8gYN0VerWtOABk0W2J2eDNEF4ieOCWVVPiyJDTKgjzh16HgOlYKbmA/ObM9yu4e5M6M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5611
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2Rh
eSwgU2VwdGVtYmVyIDcsIDIwMjEgMTI6MzQgQU0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiAN
Cj4gT24gV2VkLCBTZXAgMSwgMjAyMSBhdCAxMjoyNyBQTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8
eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEFkZCBzdXBwb3J0
IGZvciByOGE3NzlhMCAoUi1DYXIgVjNVKS4gVGhlIElQTU1VIGhhcmR3YXJlIGRlc2lnbg0KPiA+
IG9mIHRoaXMgU29DIGRpZmZlcnMgdGhhbiBvdGhlcnMuIFNvLCBhZGQgYSBuZXcgaXBtbXVfZmVh
dHVyZXMgZm9yIGl0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEg
PHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiANCj4gPiAtLS0gYS9kcml2ZXJz
L2lvbW11L2lwbW11LXZtc2EuYw0KPiA+ICsrKyBiL2RyaXZlcnMvaW9tbXUvaXBtbXUtdm1zYS5j
DQo+IA0KPiA+IEBAIC05MjIsNiArOTIyLDIwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaXBtbXVf
ZmVhdHVyZXMgaXBtbXVfZmVhdHVyZXNfcmNhcl9nZW4zID0gew0KPiA+ICAgICAgICAgLnV0bGJf
b2Zmc2V0X2Jhc2UgPSAwLA0KPiA+ICB9Ow0KPiA+DQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
aXBtbXVfZmVhdHVyZXMgaXBtbXVfZmVhdHVyZXNfcjhhNzc5YTAgPSB7DQo+ID4gKyAgICAgICAu
dXNlX25zX2FsaWFzX29mZnNldCA9IGZhbHNlLA0KPiA+ICsgICAgICAgLmhhc19jYWNoZV9sZWFm
X25vZGVzID0gdHJ1ZSwNCj4gPiArICAgICAgIC5udW1iZXJfb2ZfY29udGV4dHMgPSA4LA0KPiAN
Cj4gU2hvdWxkbid0IHRoaXMgYmUgMTY/DQo+IE9yIGRvIHlvdSBwbGFuIHRvIGFkZCBzdXBwb3J0
IGZvciBtb3JlIHRoYW4gOCBjb250ZXh0cyBsYXRlciwgYXMgdGhhdA0KPiB3b3VsZCByZXF1aXJl
IGluY3JlYXNpbmcgSVBNTVVfQ1RYX01BWCwgYW5kIHVwZGF0aW5nIGlwbW11X2N0eF9yZWcoKQ0K
PiB0byBoYW5kbGUgdGhlIHNlY29uZCBiYW5rIG9mIDggY29udGV4dHM/DQoNCkkgd291bGQgbGlr
ZSB0byBhZGQgc3VwcG9ydCBmb3IgbW9yZSB0aGFuIDggY29udGV4dHMgbGF0ZXIgYmVjYXVzZQ0K
SSByZWFsaXplZCB0aGF0IGN0eF9vZmZzZXRfe2Jhc2Usc3RyaWRlfSBhcmUgbm90IHN1aXRhYmxl
IGZvciB0aGUgc2Vjb25kIGJhbmsNCm9mIDggY29udGV4dHMuLi4NCg0KPiBSZWdhcmRsZXNzLCBJ
IGFzc3VtZSB0aGlzIHdpbGwgc3RpbGwgd29yayB3aGVuIHdoZW4gbGltaXRpbmcgdG8gOA0KPiBj
b250ZXh0cywgc28NCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVu
ZXNhc0BnbGlkZXIuYmU+DQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXchDQoNCkJlc3QgcmVn
YXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCg==
