Return-Path: <linux-renesas-soc+bounces-18763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F21DEAE94ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 06:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC22B1C27993
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 04:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650D41A23A4;
	Thu, 26 Jun 2025 04:20:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2117.outbound.protection.partner.outlook.cn [139.219.146.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15B027713
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jun 2025 04:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750911616; cv=fail; b=TTWj1y0hipQJHEsJrpydkpELQ1bf6Ma/Toy+AV8ACcA/fGZMD/0kz1btX4BjKUUQwYagvsi5Rrqf7NEGwGsbyV/YvZi7qQJFs0u07w5s+u6iYz5g6YJUGj+s8Y2o/7E8WO6uYbhzwhSvw8BEs+cKCFMcFY543245+BKrVn8MLow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750911616; c=relaxed/simple;
	bh=SxuQBY1NjR+oLoLCMjTE62ZPH5KdbgeiXGX4WkBfez0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rRimvuQ2BYmjO6J8M0PbbAMJDZquMdAuyko5xE+mf2LOkyxhwyGX4GFiWQxh4TCOtL/Uo/y8Ac3J2HIwBcGLhfoXpUJ2PlWHgWm6NixurYpDqASui/pVUjeBg0sPBG/EeGTWB3LJ4rgUrlvvCFt6wudBSPjUoyjL/3Wo1D1yKiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRmhc0TkVjY2fqLX9NlmZmfFqtxpEzg/uJciMFsLw646onzsVSdAcwGluuDd/QhnaN8pUIvmFyHQOs0/HS52CT1j0jXYop9Lv65V80DypL/L9qqKrQ4OyVouHMy7mSzlctocDchWjgkq0rAZOYbF0A9y7gMM7evcIhDQpD+dJHk5ekuJVT27zU4E7c4TRvn6aIaOj59Qp1Px7PunxfxkbVcBdR6HZQvDOU+k2j+0nM3m/Qgaz3eUVtkEesSj4wX83oVjNsmLBEnYtsWn2lNjCjah3AhD7F143JeIO8OgypQWvXOBKJ7rHLwwf0kWDmiR0E/LTkGN2oiADQE1hzQCvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxuQBY1NjR+oLoLCMjTE62ZPH5KdbgeiXGX4WkBfez0=;
 b=E9xrJuWutFw2+F72VJOWPiKxM1Q+0zJrbzs9OlonIN7z8eGshn/n3QcTr1nE55yMVlsbZEpoKcszkDlz46ioEEN0q8q8ELnFSHipMwOjoHr+NdLDdepGI/aAv16WFETJNdzzovJ91C2B1rQaAVWdu3RVKz+i8YbUOChjt2hN43xdsOCHA6yGKm++O0p4wH3nsvdMtBA7lzB6GeHNb1HCISGQmmG4oEJyLLPULVIg+2qnCyrIXVA8fQfXbDyqSxgCoFlZ0ZMQJk4mMYokKbhcGqwDgMzFj8/+P/ipgjhbCWFMua4yGWSMadAjnacTlam/AcmA19Wm1vohc003VClqoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0746.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:23::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.38; Thu, 26 Jun
 2025 02:46:35 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18]) by SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18%7]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 02:46:35 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: Frank Li <Frank.li@nxp.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Subject: Re: [PATCH] i3c: don't fail if GETHDRCAP is unsupported
Thread-Topic: [PATCH] i3c: don't fail if GETHDRCAP is unsupported
Thread-Index: AQHb5arwMOuFZSgdAU2B/a+5YiZAlLQT/0WAgAC+dIA=
Date: Thu, 26 Jun 2025 02:46:35 +0000
Message-ID: <26c2b49b-713e-4e9c-8bf4-0ffbd0b4b050@starfivetech.com>
References: <20250625073505.7949-1-wsa+renesas@sang-engineering.com>
 <aFwUx65gdpv6H6rU@lizhi-Precision-Tower-5810>
In-Reply-To: <aFwUx65gdpv6H6rU@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SH0PR01MB0841:EE_|SH0PR01MB0746:EE_
x-ms-office365-filtering-correlation-id: 43521c25-c415-44f2-b050-08ddb45baab1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|41320700013|1800799024|38070700018;
x-microsoft-antispam-message-info:
 QJzubMOj52aBbtraOG6gYddenMAe3qbFq8uaJGb7v3QWQeTKJ3sRRUIW+UfzRFqHzHMt751DQ93TLa8+n86Gc4/Uv5wp34A+GNEY3oXB/jLu/wpYg0vqGN6YdBW2iI+iV6UNznAnhM7BJBKKzqXYjHE2aeYUUBKDnGppbZq62PiIyT4NZjaZww/vZlrS0oJRqdLE+66YjnrXMaMKA7AYV+qOlORjiOQqK+1wg/tyOrk4L4GPIXasSkd2URln+kAZ6xmKl80YZHyR0/YdIz4LQU9S0mF12gUZuZ6DwvRzwnqRdyEWK62YscyUma/IvTqto+B2ItM3FjBg6Ao6wqH3YdlTHCrkDESxqm5OitTax05cJKjYCTjhdWwlceoCUmeaLiOtji4NGlQV4/Uy8nBtp3LJTvry+yBq0do4n2KrCGkUfqOULaqYdxlwIBO/rw3IwKhS7EnmdXcNiCrffvGm0bL4nNflG5Q3NqOX3voV/DJiUZ8kp0KGaV6vtLs5nQV1WZecB2LiEWorLSF/FiE9m9r+VqmZHMBMUQzwbrxJodyfSmCvt6kbjBh4EMXvoXHpa6L3GLKeTk6um5S8l8GTRgz9MxlVfIitA6X4Rn8SE7M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QWdYVHNEQXVQWkQ5OHhidHN6NWNmUlFjNUlpdVVPRHAva1p1NHhEeGwyRUlR?=
 =?utf-8?B?K2NmeGxFZCt1WUIveXh6Q3F1MkhpeGIvRE5CK2R5NEJRbGpqRzF2THhWQ1RI?=
 =?utf-8?B?R1UreGRkVTI1cmxpdVZOMTR3VCttVWQyNVBaVGR4L3JucmlpRHo3NXVKWWZi?=
 =?utf-8?B?VXEvNmlJQkRGaExJNUt5QkdJSFVLSXZyUENRWXdlZVlTMk91cGo1WFlMejZM?=
 =?utf-8?B?eWpkbENLY1IreGlvMDREdDRiancwaG5KN20wWmZPZGdZNEQwWExZZVNncmhJ?=
 =?utf-8?B?OGtPcG1kZy9WdTh5WGQ4dXMvbysvejBRalc5Q2lIWlJKWmNSL2RicCtURUdv?=
 =?utf-8?B?UXBlaFBwdnBDL1ZsMW9FTmFOb2xpdGJ6UENXb2ZOdCtIM3NsQlpKektJbVlZ?=
 =?utf-8?B?c3dGSVZ0OG14aFJ5cERuV3pnM2U3aFlOZHB3aFBHdWwybFByNDRWWFNybENW?=
 =?utf-8?B?K0gwckVwRzF0TmVzNGJodThMUzJUZEJmeDRmNzlkVmp4a0RrMUJ0TTFZVFNk?=
 =?utf-8?B?MHBEZko4OVlhSUxPUkxvSkJieGV2a013Y3A4WWs1OHZXTGwydGZxaS9IcFdu?=
 =?utf-8?B?OFpOU3ozU3JPTGk1Y2Z4UXN6SnBVRjkyNWMrWjN0UHdPdzVUM0FWYys5M1Iy?=
 =?utf-8?B?Ty8wL3pZQjF0ZG9JNTlwUUdMWFQ2Ly9SbjRxdG1yVU1BeXErYjlMNkl2WE5m?=
 =?utf-8?B?YnRRQVJzek8vaXU5cmt2Zk1MNkdPR3JGNDg5UEU5all1cDM5WUx5UFIzQ3Vu?=
 =?utf-8?B?UmtHdTQrY0NQeGJTaUhpeFA0WGVqeDF6UEdyYWdqY3duYkRZY1JWV3Npcklx?=
 =?utf-8?B?S2hFSVM0eno2bVB4RU1idzBPSFJvS3lUcWZYNk9qM0FnUXpnV2sxa0pQello?=
 =?utf-8?B?U21zQUYwT3E4SEhGdCs1UTIxR1gvc1RJQnI0K2diZitSbHl0UTVFYVN6WFpn?=
 =?utf-8?B?VlhTUUhDWGx2STVocXozUGowRFE0TVdJMys2S3JSZkc1amsyQjV3bnoxQTlL?=
 =?utf-8?B?aXV4THA0MzlBMFY2UnBocXRUS21FUWVvRTFvY1lzOWRERzBnWTlraENGY096?=
 =?utf-8?B?dXZqQmNDbGdPdUVXRWtMaU5Dbjhpc3NmRXBLNVl4VFUvYkdkckZYeDkxVGxE?=
 =?utf-8?B?NVVzdEFZdlJDc1dsK1M2VjZHZGFtVVhSdityYUtVVUVUZUs0dUxROFA2SUVl?=
 =?utf-8?B?TUF5VUZLclova1JUdThGaTI3NHVtRmZVTDlxYnVxUlIwQms5NHlxeWxsZmlC?=
 =?utf-8?B?Zm9TbHVIUFU3SFZnUjdma2R4aVlFdENaS3h2b2Y0ejFEa0l1MWpSK0s3V28r?=
 =?utf-8?B?M2FXS3B4d3hydjk2RHdGa3g4ZTdnOEVINSthbDhrNjIwN2s4alo2Y20wRnhz?=
 =?utf-8?B?c2xUbk5yakJqOVZrRENlbTYvRHZWYStZLzhhbE1MZUYzYnNsNnlYV3FBd3Vm?=
 =?utf-8?B?TnBQOCtVNzlzdXNkWWtmU3MxLzNFb0NEbW1yRUpZZGpYT0M4ekozQUVMNjUr?=
 =?utf-8?B?bjdKaHJWaFR2emNtalFXSGRwK2dhOEx4YzZ5cVNPY0VjUVFZU1Z6K2UrazVC?=
 =?utf-8?B?ekNQMjdlQkV4RWw0akhka3grWm1qMTJzVzhDQUFQeTZMYVpGdDF3YkJLTTIz?=
 =?utf-8?B?UGlpbTJyelB0WFBYQlZVUHpyTWFxeERud3djL21SREV5KzBxdExZZTh6UGxp?=
 =?utf-8?B?ZU5wL1I1TGtaV0FMZktFUHRHRnZVNW9Ca3ZJcm5qUFdzKzgzY0NRNktnUllk?=
 =?utf-8?B?cGMrakMxanZoN0Y0cjdqbS82aDk4MnMwZCtVY0ZCeG5rKzlJMkhINW5BUEF5?=
 =?utf-8?B?WllnUDYrTS9BYWJrQVdtVXhIU2djeXJ3UmlESlQrNU9RNjU3V1l5ajl1c3Fy?=
 =?utf-8?B?ZGVjc2VyTGFrbmlIdEdEakRScGpqTlNHR3VYK3l1WWtqY2JqRi9ETVJldkZn?=
 =?utf-8?B?ZFdxenVqZ2RzUmI0MDMxcmMxbmFmdVNTVUpQL0I3L2V4RTU0L0p5eUE3Wkky?=
 =?utf-8?B?cEpKUk9DRm5XV0Z6OEI5Q2EyTndoOThFTjhvbnJOdDVDMXVjMmJQMjdjVXVW?=
 =?utf-8?B?UmZHYzc1S1pJTkFQM29MeVFEMm9mdWdJZnlpRkZlaG5WaVVjNlB2N1BJT1Vk?=
 =?utf-8?B?QXpXRjhSeXZKSnVTWUp2dWZlUUtXL3gzS25GeE1jUjI4ejM3Z1RJN09IMHN4?=
 =?utf-8?B?a1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <051821FB34141C428F800370ADAAF659@CHNPR01.prod.partner.outlook.cn>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 43521c25-c415-44f2-b050-08ddb45baab1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 02:46:35.5200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 31ZOjoVArbMWMWhdYJBZbkWysd+NYWaUWFRAdw3nsUn7/bk0KmILkfCkyL8H3WUjRIKWEXnLEgO3mGn+C0OB2jTPlSgm/1/LDTZvBYGfs5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0746

T24gMjUtSnVuLTIwMjUgMTE6MjQgUE0sIEZyYW5rIExpIHdyb3RlOg0KPiBPbiBXZWQsIEp1biAy
NSwgMjAyNSBhdCAwOTozNDo1MkFNICswMjAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+PiBJZiBh
IHRhcmdldCBoYXMgdGhlIEhEUl9DQVAgYml0IHNldCBpbiBCQ1IsIHRoZSBjb3JlIHdhbnRzIHRv
IGdldA0KPj4gYWRkaXRpb25hbCBpbmZvcm1hdGlvbiB1c2luZyB0aGUgQ0NDICdHRVRIRFJDQVAn
LiBOb3QgYWxsIGNvbnRyb2xsZXJzDQo+PiBzdXBwb3J0IHRoaXMgQ0NDLCB0aG91Z2guDQo+IA0K
PiBEbyB5b3Uga25vdyB3aGljaCB0YXJnZXQgZGV2aWNlIHN1cHBvcnQgSERSPyBJM0MgbWFzdGVy
IEFQSSBkb24ndCBIRFIgeWV0Lg0KPiANCj4+IFRoaXMgaXMgbm90IGZhdGFsLiBXZSBjYW4ganVz
dCBza2lwIGl0LiBUaGUNCj4+IGluZm9ybWF0aW9uIGlzIG5vdCBuZWVkZWQgaWYgdGhlIGNvbnRy
b2xsZXIgd29uJ3Qgc3VwcG9ydCBIRFIgYW55aG93Lg0KPiANCj4gVGhpcyBpcyBub3QgZmF0YWwg
YW5kIGNhbiBiZSBzYWZlbHkgc2tpcHBlZCwgYXMgdGhlIGluZm9ybWF0aW9uIGlzIG5vdA0KPiBu
ZWNlc3NhcnkgaWYgSERSIGlzIHVuc3VwcG9ydGVkIGJ5IHRoZSBjb250cm9sbGVyIGFueXdheS4N
Cj4gDQo+IEZyYW5rDQoNCkhpIEZyYW5rDQoNCkknbSB1c2UgYE1NQzU2MzNgIHRvIHRlc3Qgb3V0
IHRoZSBIRFItRERSIGZ1bmN0aW9uYWxpdHkgbWFzdGVyIGZ1bmN0aW9uYWxpdHkuDQpUaGUgcGF0
Y2ggY2FuIGJlIGFjY2VwdGVkIGFzIHNvbWUgY29udHJvbGxlciBtaWdodCBub3Qgc3VwcG9ydCBI
RFIuDQoNCg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFdvbGZyYW0gU2FuZyA8d3NhK3JlbmVzYXNA
c2FuZy1lbmdpbmVlcmluZy5jb20+DQo+PiAtLS0NCj4+DQo+PiBGb3VuZCBkdXJpbmcgdGhlIEkz
QyBwbHVnZmVzdCBpbiBXYXJzYXcuDQo+Pg0KPj4gIGRyaXZlcnMvaTNjL21hc3Rlci5jIHwgMiAr
LQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4N
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rl
ci5jDQo+PiBpbmRleCAyMDRiOTZlNmJlMWUuLmI2Yjk2Y2Y5ZTRlMCAxMDA2NDQNCj4+IC0tLSBh
L2RyaXZlcnMvaTNjL21hc3Rlci5jDQo+PiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYw0KPj4g
QEAgLTE0NDAsNyArMTQ0MCw3IEBAIHN0YXRpYyBpbnQgaTNjX21hc3Rlcl9yZXRyaWV2ZV9kZXZf
aW5mbyhzdHJ1Y3QgaTNjX2Rldl9kZXNjICpkZXYpDQo+Pg0KPj4gIAlpZiAoZGV2LT5pbmZvLmJj
ciAmIEkzQ19CQ1JfSERSX0NBUCkgew0KPj4gIAkJcmV0ID0gaTNjX21hc3Rlcl9nZXRoZHJjYXBf
bG9ja2VkKG1hc3RlciwgJmRldi0+aW5mbyk7DQo+PiAtCQlpZiAocmV0KQ0KPj4gKwkJaWYgKHJl
dCAmJiByZXQgIT0gLUVOT1RTVVBQKQ0KPj4gIAkJCXJldHVybiByZXQ7DQo+PiAgCX0NCj4+DQo+
PiAtLQ0KPj4gMi40Ny4yDQo+Pg0KPj4NCj4+IC0tDQo+PiBsaW51eC1pM2MgbWFpbGluZyBsaXN0
DQo+PiBsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MNCj4gDQoNCg==

