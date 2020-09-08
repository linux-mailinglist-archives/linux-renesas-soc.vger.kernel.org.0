Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07A50260DF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 10:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729813AbgIHIsg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 04:48:36 -0400
Received: from mail-eopbgr1320121.outbound.protection.outlook.com ([40.107.132.121]:37232
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729775AbgIHIse (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 04:48:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRLgosyJMfCRP2/SfEGYM6cvqPoPSIhnSTzlcehw1aJGBUIJO2ELx7TR4tDG9grsvXMMF35ygByhfB5f7zI3m0o1lRS/426H10owmjYitZezUcZbpbPFsXVX9oeu5Rr65QjoG2YPOgJYOwl7qQIbbir62fLQOVadOHuVPP1FsY1BXSMjSucktA1gA1q8NHwjK1LdnyMm4nA6V/iIMXBUHrpI5XyDl1u1aUxQqSuGNq3oMPb1axKi/ulkBHOroQvRyIhBEamcbm4KJQ6tfKOzNoegXp0CpcVG9TeZv4KxJf3ZupZ6GFPDWic8GiW6ouBn1jlufHRcOmmcklN0iTjHmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hdhutw/7H9Z9v+YP/8IWWryryxxnW9QKlHoybIel7Ko=;
 b=e9a+3GIxNLmmAVCt8rUDqTVPIJbgpK3uECueRNkEoQK+MHFQrf0xM75pYUKx3Ag1X2+R1po7mjLN6mlNtRrg0Mftn0t71OtN3TJvebxWFgOI7VxoC5xTPnsH1GGCVsnbQiXKw44q0wTZ5Bz18UAYb61EOxUOpElTzheYhVfvFQ7KPYYMx/UvuufI3tepTSF7i8BmosrHGdkS1/BhJ7xUseg4AxFqzksbNxRShWbCwJhwXkfD8eznj81Vlp/lqhMIbHvhGEUKgv9uTYNlIQn1D1aVQCX1q/Sm6nLMrdUF+UcC04sO484PlJcDMt/gb68OFSpX0IEeQcJ2wNXoDZc5Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hdhutw/7H9Z9v+YP/8IWWryryxxnW9QKlHoybIel7Ko=;
 b=JPMbQzuhjipBgb0xKjIXA5gToLLh1EbqbvR8iC7zqO2UZz2lPBdI0vvz082DXQrCGC9XUQUYBDhj1f0WavVekMW45z5ayAAVbhaBWsojchcMeMmIssAMieROgCTZF5KICOVWEzWLilsHgkvnSVtZE7yqMmSlSnj2tdxZcTUVtVU=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB5243.jpnprd01.prod.outlook.com (2603:1096:404:11b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Tue, 8 Sep
 2020 08:48:28 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625%5]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 08:48:28 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH 04/14] dt-bindings: power: Add r8a779a0 SYSC power domain
 definitions
Thread-Topic: [PATCH 04/14] dt-bindings: power: Add r8a779a0 SYSC power domain
 definitions
Thread-Index: AQHWhPgVbk/t9sdD2kO1rhC1yP50XqlebRyAgAACANA=
Date:   Tue, 8 Sep 2020 08:48:28 +0000
Message-ID: <TY2PR01MB3692009CCFFB8008A9028137D8290@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdW39X_N577GnuiJgnmc32y4bW-jCO0hhQtTWZeoTDvgeA@mail.gmail.com>
In-Reply-To: <CAMuHMdW39X_N577GnuiJgnmc32y4bW-jCO0hhQtTWZeoTDvgeA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:7120:412c:ecaf:cff5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 42f48fb2-7560-439c-1a32-08d853d3f52c
x-ms-traffictypediagnostic: TY2PR01MB5243:
x-microsoft-antispam-prvs: <TY2PR01MB5243B21B2C4792315DE6BFB7D8290@TY2PR01MB5243.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yAEwXbZbDfAejAoITL6vy62hwx0mFBU+hqBq5aP3vuJm7JiKstETAG8oA4fvczQEwBk90G5mLPHCwZnIpcO2FQhSk3cYVUTlw0G4dNXiEOzNHQT8lxYWjkM3Aq3OF5ku3s/IA+PSce6yLjX312rxMOnMQGlctTLzhq90piSzWi6uv/yucG0KKIA15aT/F375eXXmIe8AKDN8Uex1x5W4bsWCEPqCfcVi6FcJn7Z5FB8H0DnMSI8E8TjztTILrqyPIHhEk1H+TUxjqspor+BSNetW77hnVIV0q9caVNoqCKr7i/srqq4zRG9SlShRPmx9rpjQeCMg/YmObRKMPCDzRw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(86362001)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(2906002)(6916009)(4326008)(316002)(8936002)(33656002)(7696005)(8676002)(54906003)(186003)(71200400001)(53546011)(55016002)(9686003)(478600001)(5660300002)(52536014)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: RJk/XIWQC4IbBMIzi5zL8yUkMSgk/IoxWjl1Oest3eIpZ8U+WlZTzpJJL4h9RLH09rat9a8D0YyojEJxgmIxvkdY2u7iWGEjU/8+7Ywja4Zs9C4pNydsVqGSjz+b7jE3UE/IVG3LaxkcjHwKNfyBdDj+DYrB1RQ0PTMKHabuVPHie5PaSLcWVaMXD4wZcTa366BsgkH9y5THxlIkrzwB3gG9uOpLmbzquO3GqQ1ORaShUote64mZjgKd0DQHcHHzsM/iNzk2WGA5WI1TWnRkdQuMFhy2Qg1C3FDqfeALQfZoVzodwpHORsa+Lc+Zwr5ExbEgPBzHWEayhZzvzTCYw4dynzkDGSID13AQLbJYzZT2LYE0lSK3lfaTKUdHX/KtlGUt9Unf/v85/aM44u8W5DTTCG9bvieB5c8xlZJZ9uJV1qFiUtWDtw98dtG6C5YGS6qgekJgPnYQ8m04mcHDuyzLOW1l1MeAfYPsqDEkixZ6gCAK5HrPtQ0EjqxOrknn4njAGyg8sShgLAxGNQE03CaQiVnpIUMVFS441/9qNK3KHRuvvmUw/hTeYGUPWUbV2paYBB6VwKuW9Y5WzX3bL3f46sNaf9iq4h690QdT+TozAwi6ZJz3Eho0AIBS24C7nH3aBct/bRKcr5TOsjVAq01A8cxJ3T52hbotwREv4ibY+DZGPfSfBS534REuOD0XlZhyNlZn4NSJYbhRe4FTZg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f48fb2-7560-439c-1a32-08d853d3f52c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 08:48:28.7629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9PDy38jVXZAGzDLYIXA/XdwaLyaLjnQ28TLBaWrX0kaPdG378v8uJeCIRv+hz0LBPlEu1lxFFBJpf4a7t/fbrjaHXG2JebCuP2rI/5usM8mhf47GpaXAE1gPxMvZYcmz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB5243
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2Rh
eSwgU2VwdGVtYmVyIDgsIDIwMjAgNTozOSBQTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+IA0K
PiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiBPbiBNb24sIFNlcCA3LCAyMDIwIGF0IDEx
OjIwIEFNIFlvc2hpaGlybyBTaGltb2RhDQo+IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2Fz
LmNvbT4gd3JvdGU6DQo+ID4gQWRkcyBwb3dlciBkb21haW4gaW5kaWNlcyBmcHIgUi1DYXIgVjNV
IChyOGE3NzlhMCkuDQo+IA0KPiBBZGQgLi4uIGZvcg0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBZ
b3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+IA0K
PiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Bvd2VyL3I4
YTc3OWEwLXN5c2MuaA0KPiA+IEBAIC0wLDAgKzEsNjEgQEANCj4gPiArLyogU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLw0KPiA+ICsvKg0KPiA+ICsgKiBDb3B5cmlnaHQg
KEMpIDIwMjAgUmVuZXNhcyBFbGVjdHJvbmljcyBDb3JwLg0KPiA+ICsgKi8NCj4gPiArI2lmbmRl
ZiBfX0RUX0JJTkRJTkdTX1BPV0VSX1I4QTc3OUEwX1NZU0NfSF9fDQo+ID4gKyNkZWZpbmUgX19E
VF9CSU5ESU5HU19QT1dFUl9SOEE3NzlBMF9TWVNDX0hfXw0KPiA+ICsNCj4gPiArLyoNCj4gPiAr
ICogVGhlc2UgcG93ZXIgZG9tYWluIGluZGljZXMgbWF0Y2ggdGhlIG51bWJlcnMgb2YgdGhlIGlu
dGVycnVwdCBiaXRzDQo+ID4gKyAqIHJlcHJlc2VudGluZyB0aGUgcG93ZXIgYXJlYXMgaW4gdGhl
IHZhcmlvdXMgSW50ZXJydXB0IFJlZ2lzdGVycw0KPiA+ICsgKiAoZS5nLiBTWVNDSVNDUjAsIElu
dGVycnVwdCBTdGF0dXMvQ2xlYXIgUmVnaXN0ZXIgMCkNCj4gDQo+IC4uLiBtYXRjaCB0aGUgUG93
ZXIgRG9tYWluIFJlZ2lzdGVyIE51bWJlcnMgKFBEUik/DQo+IA0KPiBSZXZpZXdlZC1ieTogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gaS5lLiB3aWxsIHF1
ZXVlIGluIGZvciB2NS4xMCwgaW4gYSBicmFuY2ggc2hhcmVkIGJ5IGRyaXZlciBhbmQgRFQuDQo+
IA0KPiBJZiB5b3UgYWdyZWUsIEkgY2FuIGZpeCB0aGUgYWJvdmUgd2hpbGUgYXBwbHlpbmcuDQoN
ClRoYW5rIHlvdSBmb3IgcG9pbnRlZCBpdCBvdXQhIEkgYWdyZWUgYWJvdXQgZml4aW5nIHRoZXNl
Lg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
