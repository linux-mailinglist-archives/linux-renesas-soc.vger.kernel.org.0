Return-Path: <linux-renesas-soc+bounces-3635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FBD877132
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 13:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09E76281D31
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 12:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9D83B7A8;
	Sat,  9 Mar 2024 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ten3gqPV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2055.outbound.protection.outlook.com [40.107.114.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9803613D;
	Sat,  9 Mar 2024 12:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709987527; cv=fail; b=n6nt8CoXjblb5edUJGnZPiUaoRLdQtBSR6vzz7yCPDAnNBoRGiQqykYmYMjyqQGugB46fWbORD31yIqXPOOW7oqDF4ctsJOkmmapTcp8ZK2826A+C0kMaP9Rhyb3ifeTTC6F30/zngE6DLhK2UH1MpQAq0evyo/qqpANYFWClUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709987527; c=relaxed/simple;
	bh=TjgD2BirY0FYArXCaRqVymZTVXVLYRQylANtF6Oz8qE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MxY7oNJK4ys14FDNduapxgd6KuQjy0yflfkClOiWWEKdDcS43Se99zSNKz5s3MZrrFll7gl/70pXtZxQgBzCYKM0yiAHudKwlHhNwU95HY0HQ6kTn6WDKlljFo8jTfZqcPicTWmrp1EYLMi/dgQZL1OBFOP3njgc+4p2SavTMDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ten3gqPV; arc=fail smtp.client-ip=40.107.114.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFGtfYENs1No2I6b6k92BxvRR9sMD56JriT1cGhRM3DoxvLOeq69WzqeoBf1TqM6o6rTV1dpneCtqhuioPtx1RfGEKfFO/JT9RT3iKiT7iBWFVFi40q46tnAiVBxW1L77I6henkk/z+eo9O+kA6yOTyKLm9MOv4TrNFrkG5IQGQqtU7phpX/nS3aASQeqq+Ix4sLJdqOunM7Kz/bS7eI4wnul7VoMnAQA/TjlF2DROQvyy88Ixn9vAKsyxUMTUJguEJB7vJd/1C1BGupMWygqrbDWFWablHlI6lA4vJD4BKrPIMjLSbjZUh/FZ4z8R+4QLzUo4AtPxv17BotBMbzHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjgD2BirY0FYArXCaRqVymZTVXVLYRQylANtF6Oz8qE=;
 b=fPTFfju7N6/KTodnAKjJc5P84RV2IXdu0pbsEAz9eT+VJ1x6VXG+DnWAg/aIEaexJefzQVWw6q4TbpY2fnAT2sCsMPty5MgR/Ax65TdKWWXid6d4Quh7irqTpJQMi4HnjUEf/BuS/QXWtFXxlAip9s+5nr5Kg3uWv600T4SibfOycaetRJeEWt4sdNv1dH0Ghm4KMsqBNRXwB2yjkruO2Ud4laU5ev3GfofQtqZL5r/pE63hG/i4rEiwwsAdwmuKQ9oqqjkueXtsDjM6xQ2XKonrkv3yxw4srdjTNYuyu07efes8SP4YnWQXWUCbs+iSPF1+Mzi5PZnQ+CqshP006Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjgD2BirY0FYArXCaRqVymZTVXVLYRQylANtF6Oz8qE=;
 b=ten3gqPVcs4rYud9ihgwMSZQK0UhU8uITQhSxrqz4B8/1GtoMCXXifTfCPeahv65W25Y+SoFoY9KitnZhVTVRNBCsXqZGPEJqjj2awuOS9fzZu9ObgYsZ9o0ybi8MyT+fu4R/jU9wq2gml3P3sFqXjsvT/nnVe1lPZr3sYrUSmY=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by TYCPR01MB7965.jpnprd01.prod.outlook.com (2603:1096:400:186::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.33; Sat, 9 Mar
 2024 12:32:00 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b%7]) with mapi id 15.20.7362.024; Sat, 9 Mar 2024
 12:32:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 4/4] arm64: dts: renesas: r9a07g0{43,44,54}: Update usbhs
 family compatible
Thread-Topic: [PATCH 4/4] arm64: dts: renesas: r9a07g0{43,44,54}: Update usbhs
 family compatible
Thread-Index: AQHacYPMGWKOfJ8WCEqHUSv4i74FdbEvUfMAgAABIyCAAAOtAIAAADSQ
Date: Sat, 9 Mar 2024 12:32:00 +0000
Message-ID:
 <OSAPR01MB15874A9DB0CE13AB0440242186262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240308180919.6603-1-biju.das.jz@bp.renesas.com>
 <20240308180919.6603-5-biju.das.jz@bp.renesas.com>
 <67819907-4366-483d-b71b-2646ffb076fd@linaro.org>
 <OSAPR01MB15874E48DD2269C2593DB55A86262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <ff569d52-f68f-410d-9897-9e1102171a1b@linaro.org>
In-Reply-To: <ff569d52-f68f-410d-9897-9e1102171a1b@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|TYCPR01MB7965:EE_
x-ms-office365-filtering-correlation-id: c0d73cbc-2592-40cc-660b-08dc4034eaf8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 edfGxV+90dZmzqhTW52kMOFmkauSES0w2sOuTR6nhjfFiliZ5yNeXpFvfZ5XWJPkRaXxEMXGrug0nTyD+X/Gqlq2Hoaor280X0sgDWWFxjor1+5a3epyhn1Chdh+tlkznoBofrZg9F1vEnIjgcW6KsIJuuWBLp3aD1HQxvk3k1VaQG71Q9rL7xmnOVmbI78STDunFw+BCPR9aDLUqDvUxe/sbe+FKhGpwaLQWidIj38Zf8W29CZE5k0cqnZebDXD9RJ7iMR9m+1dPsRwmDcf5G2CZaK2Idx9AkWt8VUoHSiVA5E4T1yD8HgV1w+2Vy2R5kUCGx3OTCkDfRwZrh1XMMDKzChc7sXAN+ES8UAsP0dQJyGa3c2SylDysflVi6VVe+WjEyFlz5pk2IZpMRyk8q4CD764WNwEuhBhbJSzIoZBoBIIKpbouL7g53pMnRVkDl7yu5GN2XxEWjSffA7OnecZIjnesFyZ2z3RHTSXtc+ATx+YK060sldECrDyNQi4bvOdHFnTUXca7242VQNGSyjtAP4VuI2QhIJEo4xox6kygXxeE2ZSWxGeFhjo8ceybxbx5ma5nyJW7aWVtMG5PEDL34qfsOngwmJYKFNzYnEWgh8iSPFi4P5EmIhxAdKMlCPyqUeWOe9U4UAHwtxgYJz/dsrP7KwmT8ZIpBHDr/3aI8JIFh7N3yJSJryTxMcEwG+/o1fZBQq5v3fl0Jk1I3woBkKeQmtGpXdNIkv2EC8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RjhiWUVPSUVUOXNWdnovZ01hclVKT2VmNmRWdmNVYlhUZTFUQzl5V2FpSHN1?=
 =?utf-8?B?NERMMFRPZjY3ekFoOUxHM09kdTgrTnNiZHV4eGgzNHljRHhXTWc3cXZtQnZw?=
 =?utf-8?B?VFduU0R6TVBGeVREK0hTeGJ1VHhULzU1aDBTTWtQN0N3NHRRUlNza0d4OEhX?=
 =?utf-8?B?dCtoak9BQ1Vyd1dyRXRDdWZLMDNsTTZNQUZETVBiNFRwU0dmSlBlbUtUZ1hz?=
 =?utf-8?B?WDd0VU44SUpmOW5WVkNVSDFpbFhXbS91cTNFMURHdXRtWjBGQWdkYndxWDFQ?=
 =?utf-8?B?Q0NpT1E1ajMxOXdPcVBicWtiaFloa0UwNkpDdmlZbk9UZmNlOHhmSFY4L0t0?=
 =?utf-8?B?VTdWbUVjZ3dpbDJqY1E3YzZiaEIzVHpmR2M1S3JGd1BVOHFFdFdweTFjN0kx?=
 =?utf-8?B?WWFxMWZjeGhEOFY3Z2F1VkRlUE1hcS94dHFSNFRXc25IRm43emVQWE1jcEJm?=
 =?utf-8?B?UEw3aGpDYUNONDk5NnE3M2ZObEw2bkttWWp2Z1IrNEFmbGZtUFhoclZuYS9x?=
 =?utf-8?B?ekg4MmhIckdUdEFVZzVONWpqbjhKdncvRkJ2Vmg3dUk3R1NxNkFjdFFTb3BX?=
 =?utf-8?B?YU1DUld1UDl6dVQ2b20xRmpuenRVZ05UQTVGNDVmOGVHdXhCcUpHZVJZeG9U?=
 =?utf-8?B?OGZBUm5hRis0NmRqNlBzYjVXZ0E2NGlVS0dwWmNwYzVhdzZPMm9iVlNmcjdZ?=
 =?utf-8?B?blBXRWV1K29kM3BmOGNjTnV3VEE5K0dyR3BJT2tMY1I4N2pINFFpMHNZelM3?=
 =?utf-8?B?UmxITC9OY0tUT1dINm5oQlR3VnpSRUFHdkNNaDA3Y1l1eWg3WERSZlhndlM2?=
 =?utf-8?B?REFGUllTRWtqZEJ6U04xV3RLT3ZmMmtsSDYwUXpvVSt5UWExOXhHL2ZXQm5q?=
 =?utf-8?B?Rms5cEgxSmFxUUYvSnIrOFBFYkgrODRjVzVQcnhvbXdraEFQYmxIL0kwajBL?=
 =?utf-8?B?MXVqVHZUYWJEY1pXN09uWm90aGR0RHVvdTlWeTZINHpUS0pOVUJORDYyWUNV?=
 =?utf-8?B?YWcwMzkyTUYreFNBWmNsM1BBSUJOdzFuNnNiaTdxRTFMU296aHg0UjFkeXI3?=
 =?utf-8?B?Z3NER3ZTUjI4T04zZVJzbStlWGFCNlN0eFRIUTI5TkU4RVd3eEhFSStrelhF?=
 =?utf-8?B?YkNPN3VYczhOeStpaWR4Umdxd3VDYjZpQ242QlZYYVh4TFEvbTh4VkVuUmFx?=
 =?utf-8?B?Nk5LTldYbEVCeWZKaVBWM3N5SHlacVpjaUhvb0RBdXdOTlI1VGtmMzl2M3BE?=
 =?utf-8?B?ZUVtK0NwZ0d2R0xVb1diaFY4WElURlNXWm03ZnNBRlZaYkVGMitjU1YwYTFj?=
 =?utf-8?B?b3p5ZGRqNlZoMDJaRnNZU2hKOFFVdHB2WEVlcHRwNXdyTXhGQlQ3QUVSSHVT?=
 =?utf-8?B?QnpYeGhJaUtYSm5qamNCQTJhT1pRMlBDb2NFcnN1bFNSeEptSDZTaFpjMXV6?=
 =?utf-8?B?QnBRQXhNMVFLMEY4VlFVMEdZdEpTV29BS2hpUzRnNHBDUU8xL2tlSWhqYlAr?=
 =?utf-8?B?dGNYZmlwdTVWK09RWlVYZ1IvTW9nUEhUaloxQndMN08rM1FGNzJoek5LcU1R?=
 =?utf-8?B?cFJpWnJDSXRTQnJ4VUhhaUVOVHpPODhoMU9hTWdnZDF6SFZ0WWJ5dDFXL05r?=
 =?utf-8?B?aXdjcnAweWtxdloxRkt1Zmk3R1VHcmg1MmRPdWJ0SDV5V2dqckpZWUdONy90?=
 =?utf-8?B?K2hSdVN3VG9Hd3ozU3lqejVZa1VaM2JsdnlGdlF0cDdtVGEwR2JxK25jK0NX?=
 =?utf-8?B?MGVyYTVhTmNjRnRqRllES0VycXAyN3RtQTNkemF4UDVLY1hRWU05NWYvbVQv?=
 =?utf-8?B?WUZsUXVWRWUrVXRIRVl0YmFuWUk5U1FXb20rTDU2Ymc2cEhhN0NrNXpOUlV4?=
 =?utf-8?B?UElUaUJlcVB6dlBRVG8zdWFKS2hBL0FpQ0tCdWtIaWZQM3FQNnFtREFXTER3?=
 =?utf-8?B?QUZjSHVVZjRmQWJxVU1XTXhRTWpTSWhKdXNOZE9KYklLNFFRdUNWa3ZyWUpK?=
 =?utf-8?B?N1dKN2k4d2oxbHhwNzJMaWJhcVpqUWRJUC9BdTh3dk9ldE51OVk0QUUvam0z?=
 =?utf-8?B?QTFYc2p2UU9HVjQwS3I5blRwdDB3aXpLTTFPVlQ5V3NCWlJ2MjhMMlJ6Wms3?=
 =?utf-8?B?RnpWQ0FpV25GQWd6c0luMjFUVXRIeFRqRkFDcXk0dUxHS3NlNzBIQmVmV00w?=
 =?utf-8?B?YUE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB1587.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d73cbc-2592-40cc-660b-08dc4034eaf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2024 12:32:00.4306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /SPfXx6EtsD98hjoHfx5JVRdf7GUbjjnS1sgAXXKS36ReNeoGtH8CDDa4uA6aLfvkvj4Ype9lgc+F3V8ivNX2Pujy06ct7g/20wCB9O0z0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7965

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmc+DQo+IFNlbnQ6IFNhdHVyZGF5LCBNYXJjaCA5LCAyMDI0IDEyOjI2IFBNDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggNC80XSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwN2cwezQzLDQ0LDU0fTog
VXBkYXRlIHVzYmhzIGZhbWlseSBjb21wYXRpYmxlDQo+IA0KPiBPbiAwOS8wMy8yMDI0IDEzOjE0
LCBCaWp1IERhcyB3cm90ZToNCj4gPiBIaSBLcnp5c3p0b2YgS296bG93c2tpLA0KPiA+DQo+ID4g
VGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3Nr
aUBsaW5hcm8ub3JnPg0KPiA+PiBTZW50OiBTYXR1cmRheSwgTWFyY2ggOSwgMjAyNCAxMjowOCBQ
TQ0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIDQvNF0gYXJtNjQ6IGR0czogcmVuZXNhczogcjlh
MDdnMHs0Myw0NCw1NH06DQo+ID4+IFVwZGF0ZSB1c2JocyBmYW1pbHkgY29tcGF0aWJsZQ0KPiA+
Pg0KPiA+PiBPbiAwOC8wMy8yMDI0IDE5OjA5LCBCaWp1IERhcyB3cm90ZToNCj4gPj4+IFJlcGxh
Y2UgJ3JlbmVzYXMscnphMm0tdXNiaHMtPnJlbmVzYXMscnpnMmwtdXNiaHMnIGFzIGZhbWlseQ0K
PiA+Pj4gY29tcGF0aWJsZSBmb3IgUlovRzJMIGZhbWlseSBTT0NzIGFzIHRoZXJlIGlzIGEgZGlm
ZmVyZW5jZSBpbiBudW1iZXINCj4gPj4+IG9mIHBpcGUgYnVmZmVycyBjb21wYXJlZCB0byBSWi9B
Mk0uDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPg0KPiA+Pj4gLS0tDQo+ID4+PiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I5YTA3ZzA0My5kdHNpIHwgMiArLQ0KPiA+Pj4gYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I5YTA3ZzA0NC5kdHNpIHwgMiArLQ0KPiA+Pj4gYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I5YTA3ZzA1NC5kdHNpIHwgMiArLQ0KPiA+Pj4gIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzLmR0c2kNCj4gPj4+IGIvYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0My5kdHNpDQo+ID4+PiBpbmRleCA4NzIxZjRjOWZh
MGYuLjc2NmM1NGI5MWFjYyAxMDA2NDQNCj4gPj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
cmVuZXNhcy9yOWEwN2cwNDMuZHRzaQ0KPiA+Pj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9y
ZW5lc2FzL3I5YTA3ZzA0My5kdHNpDQo+ID4+PiBAQCAtODEyLDcgKzgxMiw3IEBAIHVzYjJfcGh5
MTogdXNiLXBoeUAxMWM3MDIwMCB7DQo+ID4+Pg0KPiA+Pj4gIAkJaHN1c2I6IHVzYkAxMWM2MDAw
MCB7DQo+ID4+PiAgCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLHVzYmhzLXI5YTA3ZzA0MyIsDQo+
ID4+PiAtCQkJCSAgICAgInJlbmVzYXMscnphMi11c2JocyI7DQo+ID4+PiArCQkJCSAgICAgInJl
bmVzYXMscnpnMmwtdXNiaHMiOw0KPiA+Pg0KPiA+PiBUaGlzIGxvb2tzIGxpa2UgQUJJIGJyZWFr
IGFuZCBjb21taXQgbXNnIGlzIHF1aXRlIHZhZ3VlIGFib3V0IGl0Lg0KPiA+DQo+ID4gT0ssIFdp
bGwgdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZSBhcyBkcml2ZXIgaXMgdGFraW5nIGNhcmUgb2Yg
dGhlDQo+ID4gYmFja3dhcmQgY29tcGF0aWJpbGl0eS4NCj4gDQo+IEFoLCBJIHdhcyBub3QgcHJl
Y2lzZSBoZXJlLCB5b3Ugc2hvdWxkIGNvbnNpZGVyIHRoZSBpbXBhY3QgdGhpcyBpcyBvbiBEVEIg
dXNlZCBvbiBvdGhlciBrZXJuZWxzLiBZb3UNCj4gZ3V5cyBzaG91bGQgcmVhbGx5IHN0b3AgdXNp
bmcgaW1wcmVjaXNlL2luY29ycmVjdCBnZW5lcmljIGZhbGxiYWNrcyBhbmQsIHNpbmNlIGl0IGlz
IHVzdWFsbHkgdHJpY2t5IHRvDQo+IGtub3cgd2hpY2ggZmFsbGJhY2sgaXMgY29ycmVjdCBvciBu
b3QsIHlvdSBzaG91bGQgc3RvcCB1c2luZyB0aGVtIGF0IGFsbC4NCg0KVGhlcmUgd2lsbCBiZSBk
cml2ZXIgY2hhbmdlIHRvIGhhbmRsZSBTb0Mgc3BlY2lmaWMgY29tcGF0aWJsZS4NCg0KU28gLA0K
DQpvbGQgRFRCICsgb2xkIGtlcm5lbCB3aWxsIGhhdmUgMTYgcGlwZSBidWZmZXJzDQpvbGQgRFRC
ICsgbmV3ZXIga2VybmVsIHdpbGwgaGF2ZSA5IHBpcGUgYnVmZmVycy4NCk5ldyBEVEIgKyBuZXcg
a2VybmVsIHdpbGwgaGF2ZSA5IHBpcGUgYnVmZmVyLg0KDQpDaGVlciwNCkJpanUNCg0KDQo=

