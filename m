Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0A3319BED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Feb 2021 10:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbhBLJet (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Feb 2021 04:34:49 -0500
Received: from mail-am6eur05on2046.outbound.protection.outlook.com ([40.107.22.46]:40600
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229521AbhBLJeh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Feb 2021 04:34:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPMRgDSZ+lEmrxhs6O5mTD0LETx5nYHqai0Cs8r1EEO2ZdASLA8Qh4EqZIn98BpXACKxOL9586HliDNnds9d322bQ9CzP51c9CdTNnd7Ib33PBpBlM9aqAt7dKElwqueDaXkI9LkSKM5MjnSvLkergQRcuB7U9NwVnuHKBnT5dOFf/gp6kD+sj1GCd4GwKDJVtpxSq3o/S7ubGu7YSl/pxfifQKZroNu12hJO50sa9e2lzT0TP6dZncDHzaFyikX2CvNnczSTjUT6rgOPETo4+cI56JH3/Wi5BFdA5I0rzIqXc+zz1RZidI/rbId+atrsttAihTpMy4bi6AVD4WweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIpvBr94rB39kDrO2zIytSq1m9xsEDAYSrVDlYG9T0U=;
 b=M/BR2bAF+uiaD+gYKRiKRRk4AlcgvK8P6tL8We+rJJQHwaedWlg9xkcndjekuU6d9hrU++2PorOnJB2VVf325Ejwv85I8HIbLuz3lqlj0l91Zt7UmWdQ+IAMOsq0yQP1uXvAz2/bEwzxFYqRHpChDx8e9HMFPvG3Dk5UHdSsrMKtRfV/efDw4kmL2uegZbjwQwSloc3IHWqJzRtHCmlBBN1GinSOcdWIy95bM7zJKhiZqHvZriLmUIuZNbJHZJFE7GBKS1W9T9K1RxtYe7sE4+UevsZcPlo2BMH3ViX0gJSNMVj6ZlWi11qMDIscf09mF134In24bUelRvQoNCsOvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIpvBr94rB39kDrO2zIytSq1m9xsEDAYSrVDlYG9T0U=;
 b=UO7MClv3bvio6edX0YanAhthXky6w4fBXXm291mGF15izE54BhgVRFbs5/UhMPYZz+tsxBi6/qztsenW/Z58ZdYhlmx/CjJIwn47sor5Kspovao6pC0scHhP3C/LzP/4cTrWtiSZh67byqE7CK4FmjtNZyAeOCTcEGHm9HscBG0=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2393.eurprd03.prod.outlook.com (2603:10a6:3:68::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.29; Fri, 12 Feb 2021 09:33:45 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::c18c:4a01:ca24:78c1]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::c18c:4a01:ca24:78c1%5]) with mapi id 15.20.3846.031; Fri, 12 Feb 2021
 09:33:45 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
CC:     "agross@kernel.org" <agross@kernel.org>,
        "tj@kernel.org" <tj@kernel.org>,
        "jiangshanlai@gmail.com" <jiangshanlai@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [RFC PATCH 3/7] regulator: IRQ based event/error notification
 helpers
Thread-Topic: [RFC PATCH 3/7] regulator: IRQ based event/error notification
 helpers
Thread-Index: AQHXAHJWKt8WtHiVxkqAUnHICp8Su6pUQucA
Date:   Fri, 12 Feb 2021 09:33:44 +0000
Message-ID: <6355af19b137fe25d55c33f813b05ba43e2cd41e.camel@fi.rohmeurope.com>
References: <cover.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
         <3daf0531910c25d8b0da3964778ae2a6c9049d43.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <3daf0531910c25d8b0da3964778ae2a6c9049d43.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: fi.rohmeurope.com; dkim=none (message not signed)
 header.d=none;fi.rohmeurope.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9ce1252-4388-492b-6c64-08d8cf394af0
x-ms-traffictypediagnostic: HE1PR0301MB2393:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB2393830F8104BE4FECA7696EAD8B9@HE1PR0301MB2393.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FL912G6SVhLSJJ/J0Znd+FIfLsrTq+7ZQ3GBnzDhixjGy8/3FHHD3Cf1Au8Frgp8yxtjPRfAn82iibp7Pfb2t5vk4lH4TIpeh6s73EGu7ff9iuDDAwUJc7eWfz/6R0QwTjiykWf4QUwpLuydWrAQ7odfzmWwusbYez9ormXMFTg7IkkEfAbsFV6DYHvP1mTO4l74w16ySMLr9bpIgHiZvMv0KW0O7f1mPqNLSkQ2ZIG2HFdMKQrJLPiJOgei9E1JHgwXOg5Co6OBHwbFlGQ2OCfm0AfKnLNv4flgTPh5DfX8jIB0GSBaL8kQJxQtuPLBvHTk7sKnh75vURlvdwrGhlTTpfq8YClrurBaSlEfYQxK04kSv9pgi1f+1zoOd1FaY2+YeWv2C72W3i/I5iLGS9vnTMcbweL4GxB4D5M3pqLxxIimd36iyPZxwOdsfOCn6ur87DEif09TcuhWZlTswnMew5Ambb9askMhDu5dvw0yL68bGUFktb9Oujp71E/LchYU20TwcPaX4u+QveM2pw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39840400004)(136003)(396003)(346002)(186003)(6862004)(6200100001)(6486002)(2906002)(71200400001)(83380400001)(15650500001)(7416002)(2616005)(6506007)(5660300002)(4326008)(76116006)(66946007)(66476007)(66446008)(54906003)(37006003)(86362001)(66556008)(64756008)(316002)(3450700001)(8936002)(26005)(6512007)(8676002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?engvdzZTMy9UYmo2RHVrcTgrMGlaUHZJUFlQUHB4eW5GQnNIdGxjdDBGSUtp?=
 =?utf-8?B?Wmx3WCtwL0ZDdjEzTmd2R0hVNFJ2eDVvMkdPVUVweitINGhxYkNJQnJKajNQ?=
 =?utf-8?B?dGl5VnZPYzZodVcyRzNSZkZPYTlaUGJXSEZWbW0rYlhxNk96RkRrUElGSEdq?=
 =?utf-8?B?THlyS2cyUk1lYm50MEJTNzdwc3JxWmFSNi9JMGMyZFpRL0F1U1duWUd1RmtM?=
 =?utf-8?B?YzFlZ0ZqVlpPazRvY01Hc0lzb3lyVHVZaFdtUmhtUmdlelF3Q0h4ZVdEZVpr?=
 =?utf-8?B?RGh4am1iRlRXK0pyZE1KRW5RU01haWhWNXh2S3plQ3FIenM5Mm5ET0lTYUlu?=
 =?utf-8?B?bDMrV1hOZ1dYWEFONXpUbWtxaWpPL0MyYWF4OXVJcUpRRnltaEROMXZERlRl?=
 =?utf-8?B?cU85bldlTGdSUjdjaGdkZUNWS2ZzcDNmanI3YmovdU1oL1RjTG5xTEJMQUU4?=
 =?utf-8?B?Z2dCVkdHRG1iT1gyWDNKcnJJdjBqQll6THZaZGRlajVuUnlZRDBYaENKZGtM?=
 =?utf-8?B?WWNGZFBMblZ0OVpUdVo1eDJERHFxclJMSkZXYmF2YmpXaDVKRE55ME5yTmFN?=
 =?utf-8?B?VExjcTNLQWdMZFJmUzBhd1JhVVpzSGxXS2F0cER4LzFWVnlteXlxS09uVjVC?=
 =?utf-8?B?SWY2alJoazBQMHQ2QmVldXRFK3U0bzlCRDE5SVAySXlGTGtGN3E2dGVITEhP?=
 =?utf-8?B?ZWo0VnBiSXNQa24xWlZUSTNtR3JDdFhhTFZzL2RXdFk5dU05eis1bFBXWjJh?=
 =?utf-8?B?NHRTUkxKWmxYR2RQdGxUeVlNajVIMXlDVjRpSXlQeUQzZ3NEamJjUDRXNXhP?=
 =?utf-8?B?SDVNNEVBVThMLy9iY1pNZHN0TUJOUGVKWlNNU09PT2t5NkJNbVYzY1l0WlV5?=
 =?utf-8?B?RGNLRmNWcytzWElsN1cwRUtJaDJxRmV1dGJ5TmMyRDZaV3F1bVV6NG82c1Mx?=
 =?utf-8?B?NkljVVpWa29QaFdqUktQREpMTytTZ25yN21BK1JNVEJvTFZsUlBxejgwWDVx?=
 =?utf-8?B?QkZwamF1UXZCa0RZNDlxNDkwbHZra29udFJUdGNtUGphNW9HU1lIYVRaRzJS?=
 =?utf-8?B?RXBlWHlJY2xMWklSM2VFOTVIOXJzenU4M2JzdEhobjVIZ2FRL1VZU0hzcFZZ?=
 =?utf-8?B?SWVUb1FKYnpzRzFLdXVMOCtSYlU5OEpyLzJGSlI4TUJHU2tvT1BWemlUNSs5?=
 =?utf-8?B?dDA1SHJ1SzZSL2hOd0lhUmdsREI3R0p1UmgyOFpBeWQ2QXBjQnJIUWxKTkhl?=
 =?utf-8?B?QzNlR2FSenVnSXZsRzZGOHREVWVaWStpaVFiOVlkVjRWbk5SQmlLS2Z5dlhN?=
 =?utf-8?B?VjRrV2owOEdkNTVJd1lzSHZMMlhhWDRTMWVjUFB5R0x2SU10ck1yQ3Q4U2xV?=
 =?utf-8?B?aVpYa2JsNmtHR1NwVUhqZWZjbnVJT2dHWUw1eENlTW9DOWZHUEtiM3FDOUxO?=
 =?utf-8?B?RkhhTmRBaVBFNWlLckVhL1ZNUlRSWXp0YmloVWNDWXFHS0ZuUXZtTVE3Q0NW?=
 =?utf-8?B?VTI3ZGFLTFpnRWc2d21jeldvV29aN2ljNmFwZFpnZ3I2TlRJanhhV1E3V3ox?=
 =?utf-8?B?bHRlR3JWbmUxVlFXclovWHNiT1dZRnkwVjk2VytPN3pGWm4yME9JNi9ZNWtw?=
 =?utf-8?B?eFNKSUdoR1d5K09xalBFSXJtamIvdTVQdTJ0SjZxOWlQSXozYzhyR2l6TDIr?=
 =?utf-8?B?RzhKeTNVY2pyeW4vTUs0bElnemVGN2xQWkU0NFkrSnlFemVXZ2swR1pBMFFQ?=
 =?utf-8?Q?sw0tnsOZP73JHDYmv8Ov4xU42NMIBnKXqSW1PQc?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF916E5B1E28FB4B84D4CD69E9A25B7D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ce1252-4388-492b-6c64-08d8cf394af0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2021 09:33:44.9141
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mKLdlMKIETvCiVBZfblu4/NoCKG6G0ZC4NGcoMzwo+8++FzANuOIDLmHu44VNsZgwpnxIghMKEh1tIxDnDA9gkuCtgltXJHY2/+L3zxLVyvi2WMI7/F14Z2J6xofdoQd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2393
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gVGh1LCAyMDIxLTAyLTExIGF0IDE0OjM1ICswMjAwLCBNYXR0aSBWYWl0dGluZW4gd3JvdGU6
DQo+IFByb3ZpZGUgaGVscGVyIGZ1bmN0aW9uIGZvciBJQydzIGltcGxlbWVudGluZyByZWd1bGF0
b3Igbm90aWZpY2F0aW9ucw0KPiB3aGVuIGFuIElSUSBmaXJlcy4gVGhlIGhlbHBlciBhbHNvIHdv
cmtzIGZvciBJUlFzIHdoaWNoIGNhbiBub3QgYmUNCj4gYWNrZWQuDQo+IEhlbHBlciBjYW4gYmUg
c2V0IHRvIGRpc2FibGUgdGhlIElSUSBhdCBoYW5kbGVyIGFuZCB0aGVuIHJlLWVuYWJsaW5nDQo+
IGl0DQo+IG9uIGRlbGF5ZWQgd29yayBsYXRlci4gVGhlIGhlbHBlciBhbHNvIGFkZHMNCj4gcmVn
dWxhdG9yX2dldF9lcnJvcl9mbGFncygpDQo+IGVycm9ycyBpbiBjYWNoZSBmb3IgdGhlIGR1cmF0
aW9uIG9mIElSUSBkaXNhYmxpbmcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aSBWYWl0dGlu
ZW4gPG1hdHRpLnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4NCj4gLS0tDQo+IA0KPiBUaGlz
IHBhdGNoIGhhcyBnb25lIHRocm91Z2ggb25seSBhIHZlcnkgbGltaXRlZCBhbW91bnQgb2YgdGVz
dGluZy4NCj4gQWxsDQo+IHJldmlld3MgLyBzdWdnZXN0aW9ucyAvIHRlc3RpbmcgaXMgaGlnaGx5
IGFwcHJlY2lhdGVkLg0KPiANCg0KLyogU05JUCAqLw0KDQo+ICsNCj4gK3N0YXRpYyB2b2lkIGRl
dl9kZWxheWVkX3dvcmtfZHJvcChzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKnJlcykNCj4gK3sN
Cj4gKwljYW5jZWxfZGVsYXllZF93b3JrX3N5bmMoKihzdHJ1Y3QgZGVsYXllZF93b3JrICoqKXJl
cyk7DQo+ICt9DQo+ICsNCj4gK2ludCBkZXZfZGVsYXllZF93b3JrX2F1dG9jYW5jZWwoc3RydWN0
IGRldmljZSAqZGV2LCBzdHJ1Y3QNCj4gZGVsYXllZF93b3JrICp3LA0KPiArCQkJCXZvaWQgKCp3
b3JrZXIpKHN0cnVjdCB3b3JrX3N0cnVjdA0KPiAqd29yaykpDQo+ICt7DQo+ICsJc3RydWN0IGRl
bGF5ZWRfd29yayAqKnB0cjsNCj4gKw0KPiArCXB0ciA9IGRldnJlc19hbGxvYyhkZXZfZGVsYXll
ZF93b3JrX2Ryb3AsIHNpemVvZigqcHRyKSwNCj4gR0ZQX0tFUk5FTCk7DQo+ICsJaWYgKCFwdHIp
DQo+ICsJCXJldHVybiAtRU5PTUVNOw0KPiArDQo+ICsJSU5JVF9ERUxBWUVEX1dPUksodywgd29y
a2VyKTsNCj4gKwkqcHRyID0gdzsNCj4gKwlkZXZyZXNfYWRkKGRldiwgcHRyKTsNCj4gKw0KPiAr
CXJldHVybiAwOw0KPiArfQ0KPiArDQoNCkkgZ290IG1haWwgZnJvbSBidWlsZC1ib3QuIFNwYXJz
ZSB3YXJuaW5nLiBCb3Qgc3VnZ2VzdGVkIHN0YXRpY2l6aW5nDQp0aGUgZGV2X2RlbGF5ZWRfd29y
a19hdXRvY2FuY2VsKCkuIEkgc2hvdWxkJ3ZlIGJlZW4gbW9yZSBjYXJlZnVsLg0KDQpJdCBob3cg
ZXZlciBtYWRlIG1lIHdvbmRlciBpZiB0aGlzIHdvdWxkIGFjdHVhbGx5IGJlIHdvcnRoIGV4cG9y
dGluZz8NCg0KVGhlcmUgc2VlbXMgdG8gYmUgZmV3IGRyaXZlcnMgd2hpY2ggbmVlZCBkZWxheWVk
IHdxIGFuZCB3aGljaCBpbXBsZW1lbnQNCi5yZW1vdmUoKSBqdXN0IHRvIGNhbGwgdGhlIGNhbmNl
bF9kZWxheWVkX3dvcmtfc3luYygpLg0KDQpJIHRoaW5rIHRoaXMgbWlnaHQgaGVscCBjbGVhbmlu
ZyB1cCB0aG9zZSg/KSBPciBhbSBJIGNvbXBsZXRlbHkgb2ZmDQpoZXJlPw0KDQpJIGp1c3QgZGlk
Og0KZ2l0IGdyZXAgLUExNSByZW1vdmUgfGdyZXAgLUIxMCAtQTEwIGNhbmNlbF9kZWxheWVkX3dv
cmtfc3luYw0KDQppbiBkcml2ZXJzIGRpcmVjdG9yeSBhbmQgc3BvdHRlZCBjb3VwbGUgb2YgY2Fu
ZGlkYXRlcyBsaWtlDQp3YXRjaGRvZy9yZXR1X3dkdC5jIChzaG91bGQgYWxzbyB1c2UgZGV2bV93
YXRjaGRvZ19yZWdpc3Rlcl9kZXZpY2UpDQpyZWd1bGF0b3IvcWNvbV9zcG1pLXJlZ3VsYXRvci5j
DQpwb3dlci9zdXBwbHkvc2JzLWNoYXJnZXIuYw0KcG93ZXIvc3VwcGx5L3Nicy1iYXR0ZXJ5LmMN
CnBvd2VyL3N1cHBseS9sdGMyOTQxLWJhdHRlcnktZ2F1Z2UuYw0KLi4uDQoNCkFuZCBuby4gSSBh
bSBub3Qgb2ZmZXJpbmcgdG8gZ28gdGhyb3VnaCBfYWxsXyBkcml2ZXJzLCBidXQgSSBndWVzcyBJ
DQpjb3VsZCBnbyB0aHJvdWdoIGF0IGxlYXN0IGZldyBvZiB0aGVtIDopDQoNCkFuZCBzb3JyeSBm
b3Igbm9pc2UgaWYgdGhpcyBoYXMgYmVlbiBzdWdnZXN0ZWQgYW5kIHJlamVjdGVkIGJlZm9yZSAt
IEkNCmRpZG4ndCBzcG90IHNvbWV0aGluZyBsaWtlIHRoaXMgZnJvbSBtYWlsIGxpc3RzLiAoTWF5
YmUgSSBhbSBtaXNzaW5nDQpzb21ldGhpbmc/KQ0KDQpCZXN0IFJlZ2FyZHMNCiAgIE1hdHRpIFZh
aXR0aW5lbg0KDQoNCi0tDQpNYXR0aSBWYWl0dGluZW4sIExpbnV4IGRldmljZSBkcml2ZXJzDQpS
T0hNIFNlbWljb25kdWN0b3JzLCBGaW5sYW5kDQpTV0RDDQpLaXZpaGFyanVubGVua2tpIDFFDQo5
MDIyMCBPVUxVDQpGSU5MQU5EDQoNCn5+fiAiSSBkb24ndCB0aGluayBzbywiIHNhaWQgUmVuZSBE
ZXNjYXJ0ZXMuIEp1c3QgdGhlbiBoZSB2YW5pc2hlZCB+fn4NCg0KU2ltb24gc2F5cyAtIGluIExh
dGluIHBsZWFzZS4NCiJub24gY29naXRvIG1lIiBkaXhpdCBSZW5lIERlc2NhcnRlLCBkZWluZGUg
ZXZhbmVzY2F2aXQNCg0KKFRoYW5rcyBmb3IgdGhlIHRyYW5zbGF0aW9uIFNpbW9uKQ0KDQo=
