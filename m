Return-Path: <linux-renesas-soc+bounces-3218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EEE868189
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 20:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 800391F25405
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 19:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAFB5130AD5;
	Mon, 26 Feb 2024 19:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KObRoy6o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2071.outbound.protection.outlook.com [40.107.113.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2F612FF76;
	Mon, 26 Feb 2024 19:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708977430; cv=fail; b=MoFqd5UntCaOuRCM19OBqMXc++beLWU1MOjMhlToraWUZaYIjAMSGumE4OALum54s5ZIPkQnh6W1xDJVigjkNJ5cdU1N3JaMNFpm/r17KCBn3aLH79JaWCCUVwV8kh0pIBIkd3PJy2cVMp39OcdwKJwMCyJ7F9n78PRoVyD94qE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708977430; c=relaxed/simple;
	bh=OJlVwJTN/vCnzsGq1pN+ALKoOQMlwLNnnVF3X5K3KnY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CQWXZ9s8mmMVnrgh++mVWy3QQnGYVSjAAIbWAFJRz/o1h2wkFjzGc8iQ86EI9FZqCiIGCMETfVqI6omJFdOpVIXbcrbxgbRQJDnchJEGB/KWTKf7HsWfFMogYndzT59GGnxwL+lBZlGTdWajVSMf3zva/Qxvh7yq83B9JmFI36o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=KObRoy6o; arc=fail smtp.client-ip=40.107.113.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZ3cNZujupG8UwSP4fYRl/ztezwytLMFeSYcTsTDRnvEcvNi4zF5Ph316YtiGOLs4O1rtv3Ll2+DIo+vxgRQfNg7NrfBHRFEejKQEobqo5c3tmaecPmiDE1xf2+B8k11M5cYAwUAa0qBamBXxR1C/5ALS3s1iyoKP0Nu7ywjsRisM5ube+6XsRuwmma/qxKb5pOF9KmpMrZCVxPhI5QwJ7fpjsYLipogsfFYuoyk6Tvh2lHcbEyabo+/mpqmrfd3q5SbwSRUqPsT6cqo2elig3vOJUy6GzQ4/GNnuXLYWMJp55XJdccw7AfjVFQxf91j+8phya+9D4HU7NR+8drkdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJlVwJTN/vCnzsGq1pN+ALKoOQMlwLNnnVF3X5K3KnY=;
 b=EjbA5qNw6SA4I19s7EUeaH95ZBR/iQDkDE+wNuHvMestFtgYGTRTYnltNSbh329UFY/BMJPszJFldsmTSY+IwwTUhliuudA0c+ZuNfMzAcDgi4jI5GNgKkQlJg2sslepCu8w62OGZdsxpWCNdmzy8Z4gSaYB+bJhy/AA2z5qyMbWMyYN9TkY/A3XmkZoDzrNwQzoHgPjBo2ypWP1PvUOji36fZoYcpujKRdxpK2Yy9AmiXCw28HBksXIVw5Of9Ig2THqWizEDs7xwjnyqZ2j3x/2S30X5yxsqKQlHu310zv6ottAnqybSs53c5LRk0lybTIyKGs06SxCHmk4FzG1ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJlVwJTN/vCnzsGq1pN+ALKoOQMlwLNnnVF3X5K3KnY=;
 b=KObRoy6oZFS0B6YaPKKrFNvg1RNT8g5KxuDRWYkyCABxCKYaudujN+Ky1ky+yOUesfVrO4rEOmXT76Yb9jwTMd76cVDWqWjBi6QTuQJKXvxzabMuhq6lvtq3WVIMRpia3RrAWAe5ME6n+CF+9DsBr0C7FxFlwoopk7D6g9Xvzo0=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS3PR01MB8317.jpnprd01.prod.outlook.com
 (2603:1096:604:1a0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Mon, 26 Feb
 2024 19:57:03 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7316.023; Mon, 26 Feb 2024
 19:57:03 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 0/2] Enable DA9062 PMIC and built-in RTC, GPIO and
 ONKEY
Thread-Topic: [PATCH v2 0/2] Enable DA9062 PMIC and built-in RTC, GPIO and
 ONKEY
Thread-Index: AQHaaOyhkCgkX6T470quzHNeCvcRdrEdCF+AgAAAUCA=
Date: Mon, 26 Feb 2024 19:57:03 +0000
Message-ID:
 <TYCPR01MB1126969B1CA6BE51E0145AAF0865A2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240226194715.427597-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdW9VXjRKD9+akp67sqBj_CHLSnSt0cw_DvcGuwm4t1=Kg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW9VXjRKD9+akp67sqBj_CHLSnSt0cw_DvcGuwm4t1=Kg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS3PR01MB8317:EE_
x-ms-office365-filtering-correlation-id: 88a96188-a505-46a7-f1c7-08dc37051a2d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Wju4Y97Yp+yicutQF0U5bK134MFaBpfXAbJgTxBLzQD/CJ1A1HdtoHO0J1WeHSw/zXvErD4TWwTQcAIuHr97IQE6vi41gheezvM89ty8J0G2mGO4TOFWlGGQEC8Y4y4Bk7PV7yfYt6kQjm7sYz7T/QC83vsJJQt4KLtuj7XiexGcR7paFlJXIByYRlaPRQfEYLN5NhXBO85Kshfr909FBSUG4FFxC6qRDbEbVlgoyHLn6HgnEw8ByoyeP+qLj6An1u40gozsSBkIlevmwRA5rDezNf0t2jf1Y5ngUmJbbjbNvZ1FJiwymll1PWrOidFz6ZMzza9k7S900hpiQoxhu4rRbXytrtwJX8X2VNBSP/otN8k0sDmlrVBBSPUWnWkwyNyG9MKiO0ggmdTttPoHsi4Yd5gF8yLZXcGWjiNud1zE+i8PYQzqSU25aT06QWeTRdCG9aKYVrnnMyvBgzgH6J3uJUXx9n8X1M0FQamqGjDLvXQdOpdycWVBVRVXf8WMJt92J1CfQSlXjzPa3gOKEStgq8r1pE/pkTckGykLB9FR6aV/MNPJyg+Xu9rPyav5HOhpPJ6HU8pe3o61V11/6VI+D7AvZ0WV2j4OBxYQspWFETyvU04togkUGReUWzVJD0I83viL4tWdSVJtFXGZ+7Z7ZoOLQQbXPIY5TEBPwjpMZ4nFGNaFrBSlXZ9Xb0XLX/HPzOmYPgZ1JJ5AB90CZg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MzR0ODVtUDI0bjhSeXlqSk00RGEvSThkdmU4K1lPbW5vMHovTFJKNmJkeE4v?=
 =?utf-8?B?a0t4UUtTSm16dzIzOHdNK2xkMGlBRHdhWTBpcS9CTmtrSm45NUpBb2NXZGUx?=
 =?utf-8?B?MHJBSnBqeFhrOHJVS2srNm9CcDc4NUJta2QzTkpmR2xaME5HRkk4YnIwVy9k?=
 =?utf-8?B?TThaK2FSQVdLYmRRaXJUZDFyNHd3OC9FRkNzbE14MzJQZDV6aTFraVZiNjVl?=
 =?utf-8?B?bnl3ZnU0ZHBqZ2VCSkxmbENXMSthRUtGTG1aZmh5bjljNjh2NU01bGFxTGNx?=
 =?utf-8?B?ME0zQzlJWDFqTFFlQjQzMTNIa0tkMW5EQkRnSzA5RjRKWnRuanFKaDNWbzE2?=
 =?utf-8?B?NHByZHFxcVdHWWRxSktiVUl2NnVNOVB1TGZXYjRPbzVkR3U4QWJ3d25HRWNa?=
 =?utf-8?B?VTRTcEhBR0tyYitRUG5LZHV1R3dxSkUyYkR0SFdNOXVpNlI1L2F3eFhqU0RP?=
 =?utf-8?B?Q0dYZzNMRlptWEZya0dQbDJJeU9YcC95N1dRSHd0UDdHanl6cVV1VXkwVVF6?=
 =?utf-8?B?Z1h4OUM5ZWEyV2ZwNko4bFN0VkVhNngxMkkxbnhPb1RXVmpWYTVSK1ZxVFk1?=
 =?utf-8?B?b2pJOENFQ2l6eTI2VEJnS3hlTENLTDV1aTJ5THh3M0wrbWhxQ05JcHJHUDd5?=
 =?utf-8?B?cXF4TWtWQjJBaWN6bWRlSTdOUWQ1Y1ZzUHRSNkNaa2t6dFhvUDhWR2dHRFZF?=
 =?utf-8?B?T1VtTm5WQ0xDSHd3TzhtcGFPSk1DM3V0VSt6K3o2a1dxaUJjajJWaENHdEZw?=
 =?utf-8?B?SHh6a3VTYldFcVZkVDArdVlaVzJGajlobGxvN01zeEJxYTJYUFlWTU4yaE9G?=
 =?utf-8?B?VU85V3FOamNFVmZQaHY1bmF4dFVLRTNrOHZzRHRzZC81YklxOWV4Vk45RDVt?=
 =?utf-8?B?aDlrZkVsM1drbHRwSWlpSWViVVBWZlZBWGpKU1hYeHE3VFk4L05laC9SNFdr?=
 =?utf-8?B?VGVrNU4rVUU3a2tmZkJqb3RkYlRFSklUYTZXcFRRQ0kzelVQOWsvbWZ2UjFj?=
 =?utf-8?B?eDdNTG9mWTVOeVZ5ZWVFM1lidHhxRHQvbnpGUHl5OG9VWk1RWmoyZzg1TnFG?=
 =?utf-8?B?MnAvR3IxbS9vSDNLUmFuS3ppaE02WmVJL0lKVzVmaGpwVHllTFVJSWlzbFRI?=
 =?utf-8?B?ejlQZUFvMnZMK1lodWdNSmdiNldsUWFtOERkSWpQV0N3cWJJRTAzalMwYlc1?=
 =?utf-8?B?ZlZjVHlBRG5DTVlpcnlIYTAxSElxQVF2ZWdlUjlFOFlMak5TdUp2UUFOcGxV?=
 =?utf-8?B?bGtwMWJCakRPOTdmNHVIZm1EaENtTkNJYmlaNXZWNG9nQ0plb1NjV1lhcUZJ?=
 =?utf-8?B?emFjN3pYcFl2RktGaWVwNTJhc3NzWTV6YisyL096d2pyTDZQYzAvRnh2SFF2?=
 =?utf-8?B?UG04Z2VZR1ErSlNxa0YweDEzR0pNMEVVMlhKMTBMeWt4V0gyT3JwNFBzZ1ZH?=
 =?utf-8?B?TlFlN1czWXpyWFN5Q2t5THBuQllnVWhVLzhXRjFER3FLK1lTYTNESGU4Tmxp?=
 =?utf-8?B?dFkvUys0cjRIU2xYR3JGNUw5RTFjT1pWd3hQYitGZFYwL0dpdXYwd2N6U3Yy?=
 =?utf-8?B?aEtaTmlyc1BuSHdFUWFkejdnNGJsL0FCMTN5Z1VTWVQwZWVGV2U0L1V1NHFq?=
 =?utf-8?B?c2lLNTM3bnd1L2ZWMTJ1Y1diMGhUOWx6QVllc3QxZ2llb0NCU25pVXhPVHlO?=
 =?utf-8?B?b3Z0U3M3T0JHLzJ6N21PMkNYZmwrMUI1UE9jK1c1N25tVkpBQVh6dno2b1p6?=
 =?utf-8?B?OFJiK3FiVDNEY1pRTE9acjh1RlIzUHczdkliaE5BSVdYb1VVeFlTTGtYQzRP?=
 =?utf-8?B?SWd0ZzZJOTJNQlplblFGanNMY2FEczdHWmQxMWZvdTlDRE5EaURsV2xqZXBY?=
 =?utf-8?B?RjdOcG1oQ24rSm1qOGRqNVJaNmc2UEVwMDQvU01TNzIzbHl0WithYU5Kcml6?=
 =?utf-8?B?d0c0a2JHMGk5VzB0ek5xT0tmRVE0WnJDWTdFcGZXSWM0UmVBOEV3TURJSEdj?=
 =?utf-8?B?K2I5NEFXeC9ab3VHNC9vL05nVTRxc2EzQ3FjZ3ZyT2Y0VWhKZXZjZFpsYk5M?=
 =?utf-8?B?Y0RXWkkybjFPQjFyNGFKbVFleEs1Q0pabHVva1VLallndWpDN2U5SEo2K2Y1?=
 =?utf-8?B?Q2lTUWVqalRRUkQxWHlBLzExWEh5UXR6YU5DWEpHVVRhY3VGa01QSGZ0SmZx?=
 =?utf-8?B?RUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a96188-a505-46a7-f1c7-08dc37051a2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 19:57:03.2853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: byP/FY4aTWi7bMwoG7nGJvBgKG9B/tslgHpLZnEv2VXPOfaBuHwEIt3yXzHQdaGP//u82yNhLLCXwBQTTorevTrnTd3xvmIlVKSl5GP7oug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8317

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogTW9uZGF5LCBGZWJy
dWFyeSAyNiwgMjAyNCA3OjUxIFBNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMC8yXSBFbmFi
bGUgREE5MDYyIFBNSUMgYW5kIGJ1aWx0LWluIFJUQywgR1BJTyBhbmQNCj4gT05LRVkNCj4gDQo+
IEhpIEJpanUsDQo+IA0KPiBPbiBNb24sIEZlYiAyNiwgMjAyNCBhdCA4OjQ34oCvUE0gQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBUaGlzIHBhdGNo
IHNlcmllcyBhaW1zIHRvIGVuYWJsZSBEQTkwNjIgUE1JQyBhbmQgYnVpbHQtaW4gUlRDLCBHUElP
DQo+ID4gYW5kIE9OS0VZIG1vZHVsZXMgb24gdGhlIFJaL3tHMlVMLEZpdmV9IFNNQVJDIEVWSyBk
ZXZlbG9wbWVudCBib2FyZHMuDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgc2VyaWVzIQ0KPiANCj4g
DQo+ID4gQmlqdSBEYXMgKDIpOg0KPiA+ICAgYXJtNjQ6IGR0czogcmVuZXNhczogcnpnMnVsLXNt
YXJjOiBFbmFibGUgUE1JQyBhbmQgYnVpbHQtaW4gUlRDLCBHUElPDQo+ID4gICAgIGFuZCBPTktF
WQ0KPiA+ICAgYXJtNjQ6IGR0czogcmVuZXNhczogcnpnMnVsLXNtYXJjOiBbRE8gTk9UIEFQUExZ
XSBBZGQgUE1JQyBJUlENCj4gPiAgICAgcHJvcGVydHkNCj4gDQo+IFdoeSAiW0RPIE5PVCBBUFBM
WV0iPw0KDQpCeSBkZWZhdWx0IFBNSUMgSVJRIGlzIG5vdCBwb3B1bGF0ZWQgb24gU01BUkMgRVZL
J3MuIFdlIG5lZWQgdG8gd2lyZQ0KdGhlIFBNSUMgSVJRLiBDdXJyZW50bHkgSSB3aXJlZCBQTUlD
IElSUSdzIHRvIG9uZSBvZiB0aGUgUE1PRCBwaW5zDQp0byB0ZXN0IFJUQyBhbGFybSBhbmQgT25r
ZXkuDQoNCk5vdGU6IFJUQyBoYXMgYWxyZWFkeSBwb2xsaW5nIGFuZCBJUlEgc3VwcG9ydCB3aGVy
ZWFzIG9ua2V5IGhhcyBvbmx5DQpJUlEgc3VwcG9ydC4gVGhlcmUgaXMgYSBwYXRjaCBmb3Igc3Vw
cG9ydGluZyBwb2xsaW5nIG1vZGVbMV0NCg0KWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcHJvamVjdC9saW51eC1yZW5lc2FzLXNvYy9saXN0Lz9zZXJpZXM9ODE5ODcxDQoNCkNoZWVy
cywNCkJpanUNCg==

