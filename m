Return-Path: <linux-renesas-soc+bounces-3633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 736188770FE
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 13:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C53F51F215CD
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 12:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5AE52E631;
	Sat,  9 Mar 2024 12:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SIecVQDk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11011009.outbound.protection.outlook.com [52.101.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898F21F608;
	Sat,  9 Mar 2024 12:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709986498; cv=fail; b=IPfqzXGcmWy7n+IPz9JoO2Aa7n24vZgJwm5TJuVxuF6oc4Bqg3+IqvVyZ28iJ6MatudgfFcEvESGF1HWCgW5JYgvqgYVT/1fBwhlzZYS2fOZ6dpKv9Soswpz2p2Wh2/YCuaMZd5yBTyqtn4155qrlh7bu/UiNiO0DLfzMimP2pU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709986498; c=relaxed/simple;
	bh=YcIB0g79DVBH4lFEUy8YZk27HwN57mOUss2KT32JMmc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oyCigUI2rO5YqZDkpSdZU5nen7GAdEOAzntVosU45v4euHz2BSCBBAc1Fo5Qqp5+vUhYPTzG3hLzLDOS2YbycWslmIiASbtpFzZZ8VJE2m46CBqDwyAmhicQOlCj9y+BIlUQpPmfvoyIZYqNyTFxFltPb6QFyUTZOriDetrnlys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=SIecVQDk; arc=fail smtp.client-ip=52.101.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4sB3NIbMwyq1tAcvbrpOsaOGwj+Ytpv3bk8KnkLDFf8yJAXqEbCIUa4jDiePGFWgthWL4BHRpqpyGyY5lEAcVDpP5Z4BoxSwhlkUzDy/B+J/qjUPBPDznb4Le3+vbUMsRrg2c3P4mid+vXozKsQhHI9gCvy4ebVMLkogkhv6vn8xXKWav0lULeA5SA/ZfgbUqUi9XtEDVOfNRN/unnBWCtY1zy/q2jBFxoGVcD+OX+gk3if7pRkczReKFsYrCUiR5AiW1DcLc9xUITZxfvcE9vJvuOixD/BUsA+bP/tpvG30dWzJc3bw82+iy1VCHRSC/5wnJedxWnTACoHqgP4Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcIB0g79DVBH4lFEUy8YZk27HwN57mOUss2KT32JMmc=;
 b=L2x3g1/nt9WsjcjgHi2lBX+jUz+WnuEMtVY9pTgzJJBuqm8r836FiTUJfnHag6brfeFKB30slqtwoGpaxhDdLV/zFjtD7a/M/40mz6w/xaPUgQ7uSu7ErokU3GVuFvkA6/hnWE11+73TDR7gZJQbgCloz8Z1b76tbeGcyoGOfJIV3gOhUgYNBc8H0SfQob58lUKcSdRG0C/MBsBTiQ1f/pdM9UGSp/RyHw9fSPo63V2ywLQCei1YKCxze1Qopq/ZZ9XaWC9ul6ohc0DdDEF26IEvXoo+vnpQjswC/zTaWZKXe61a520mqUuC2DnKJEmxQ5rK23AZp8+jsV3k9esHZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcIB0g79DVBH4lFEUy8YZk27HwN57mOUss2KT32JMmc=;
 b=SIecVQDk+6hhhlW7rGfvKxf3AcPZZq4L5c4xlm6n1QSGpi5CB2Fle0y+8DNEVB1DVtWYu703YKjC6gjISUnFUvk/eTaUTPGSUJUsP18R9Gr3YECnENwv6LeMIbwQSqi9DFh3ZRcIXJ+ej5RkuAjZP6IZkQBsrO1G+AtrjKGrRpk=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by TYWPR01MB11272.jpnprd01.prod.outlook.com (2603:1096:400:3f6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.31; Sat, 9 Mar
 2024 12:14:51 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b%7]) with mapi id 15.20.7362.024; Sat, 9 Mar 2024
 12:14:51 +0000
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
Thread-Index: AQHacYPMGWKOfJ8WCEqHUSv4i74FdbEvUfMAgAABIyA=
Date: Sat, 9 Mar 2024 12:14:51 +0000
Message-ID:
 <OSAPR01MB15874E48DD2269C2593DB55A86262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240308180919.6603-1-biju.das.jz@bp.renesas.com>
 <20240308180919.6603-5-biju.das.jz@bp.renesas.com>
 <67819907-4366-483d-b71b-2646ffb076fd@linaro.org>
In-Reply-To: <67819907-4366-483d-b71b-2646ffb076fd@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|TYWPR01MB11272:EE_
x-ms-office365-filtering-correlation-id: 8d1af755-76fb-4394-b1dc-08dc403285c1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 BwV7KylEIH473AGOKS8oQEZWcmdYSGAiEQjCwskhHdViiWffqOkPcDQ5J+DrjhJ/VdL1jK8uTrfd4m79LSS9ST4fZaMUB0c9i7NylCo0l5v2Zh6+jWNQ/BrjWlUffePXEq3sPLJX7jW4u4Y3SLpCS5i64WfSQx++VPf45R0PXS5fvnzaeFWcdf2SSt0oswbmlLA/mRIK+YOM5+nrZ1G59u2sEh12h1cQrHyJTmGAOQ9TAlDKAQeBNv4vj2/0EjJBrnhlkeSB2Yl0Qv8E6dZTpIOWhUUmbrZXk6if7Mh6T5funix1JqGhWGYwcMH75MhyLBszgp8moGZ83yywcrmd50PukC3+46QJGLQCjds4Mp9bCyIqae54UD2CEngzpSltyTHhyOWMbR1NeS9+Ut9F83oCv3x2YWSi5tWP99zv+jHskqFk0ls7RgbAWQqtI081lu0p/P+A+PlupeAAg+IAb9VpvlOPFpI5EoToqkp+LAXrlEH0Tq7ut50x9SAXmwJHQ+ZuRboG0bOI+0ZbSAQ/7JU3NfDVwBl/430R2W7FFjWiiaIMwB2emCvMwrcAq+XNqCyDN97JnKI62BJRd/kxUbDeWOhxxZRDAEgYmzZ7mWVLSqU5d98zx9ohx/bHDJRNV08Kux9qKZNFanZ14OB9l3bp8kDfljr+fE8fqPahGB1mbqbw/zUWtvmKb3kH1yurM+z7mpbm+Lm/7XdsOOGfuw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bkNzRUVNaW9JMFhuL2J0T2EzZjN6RUJqengwZGdCMFFnZTJ3Z1FpQ3A0WElj?=
 =?utf-8?B?ZnhGdTE1cDhpazg4Y0loRUZwNUFZY2U5NDFRN0ZKSWdYQkJZRXlaaXJGOFVy?=
 =?utf-8?B?cXJCSVlnMW92SXNqZy9lWVV1cnk1ZTJLUDZWZmt2VlhpbGZkb3pKVEM5Y0tO?=
 =?utf-8?B?bGVralpDU0JhSHY3bk1sZjNnSGlsVEI3MDJhVUpYNXZqVkkwMEJZYlF4dElM?=
 =?utf-8?B?S3ZCbjZsUXRoZ3MvOUJJeDJ0UWQzNEdZQWhjd0xJY0RyMEVWcjVvbERkVXph?=
 =?utf-8?B?MkllbzRCOFMvR3ZGQWdienU5TUpLejFuSzQ1dHIzM1pFYTdEUHV3S3dJUWwr?=
 =?utf-8?B?YTZJdGhrcnd5a3IyT28wVGttN0F0ZUVKdWpDQVdRQlNmS2hSd1BQWlFMZHh2?=
 =?utf-8?B?NjQ5U2VQdXhmRmhzVmcvbG5USG90REd6ZWl2bVBIS0VBc3JLSDh6KzMwb016?=
 =?utf-8?B?RklHNndYRkdjdTR0NlVWSy81d0FvWlBpSjZkVkpRQTNvcEpyUm80THNEQXoz?=
 =?utf-8?B?ZlIrbXQvaEJlQ1JMZjh1RWtQdFhHemtUUDFXRkgzNDA3NmUxOHB5L3REeGVh?=
 =?utf-8?B?d2ZOTnRoRmFQTGtQcVJjS3NSaVJsRVozUys4Q0xPQTBITHhJRlliYm5BTHFs?=
 =?utf-8?B?T2NoRW9mMmh5R1BiT3JGNElUMlo5aVU3bnpad05VQUprTGgzTTJsOFNWVXFt?=
 =?utf-8?B?MWJUY0tGRDh1WUdmSUl6VWFncHJiR0VBcXRubklGejFyeVF6UWFEOXJZYXZJ?=
 =?utf-8?B?SjByeGhGbUNJcXFjRFhwdmRSSnRqUmNVU2dvVXU1dy8wWTZLYU5DWkZ4b3pR?=
 =?utf-8?B?aGl3Tkd0SmhreUMxR2NyOGFhTWtUU2cxWGtscnZHbEg2VWc2K2xxUnJEU25a?=
 =?utf-8?B?K2NpRFVpN0xUd21JUUpPV0ZIUUtXRkFGUjZueWR5TkhWV1ZTWktwY0pMV1Er?=
 =?utf-8?B?dVZ0YWd2L3JOQmpJdStqcjZ4R05GQVRySzJvVEw0YkpwTGJoQjdXQjVuK01G?=
 =?utf-8?B?WFM1d2FkK1ZpSnJOdlhSSmZMWnNON2lycTZaKytrVFNETG5Ed3k1aVB3ZCsw?=
 =?utf-8?B?T0ZwQ2xmZFJPVGMvWkJKVXRCaDNLNFZJRzV5RzI5NWtTMFluSW00UU95Y2J0?=
 =?utf-8?B?RVZVYTM1elFEYllLS2Jja1Fpc0Q4WU5CRlIzd2V3UlF1K05Kb2xlWisyZWVS?=
 =?utf-8?B?S1RpbURaa2E1V1ZSQnNOcDVkQ2hqczdSckxhUHJkN0dNbnhPMXJwUzI5QjNx?=
 =?utf-8?B?c3pXQ2tjUENjc1AxSUNocTVySXBTWDhwVlV1Wm1oNy9ZZjdTMmRDR0djcXlL?=
 =?utf-8?B?dDgvM0NMQWNZU0ozdXpVQmhkNXVOT0E1Z0tPcEJrM0podGxrNnFpc1VGa3Vn?=
 =?utf-8?B?bE8wUkd6Z0RDdm5XR1p3dHl1ZnNybTFSQ1c5aXdnaGxENGp3Y3JKN2hoU0Rh?=
 =?utf-8?B?MmI5WllkVVRXQURaQ2ZUTmZRa2s4Uk0yd3BURDRwaVM2VnFYK0xlclRvanEv?=
 =?utf-8?B?Q1V5RVh3SUpybFg0S21Oczlqb2lnU0J6TTd1b3djN1V3VTY4SkttTTRUWEc2?=
 =?utf-8?B?Y3NZdkpneWZNMlpPUlpEckxNeisxS1cxOHFueDhGL3dINEhSOThXbzlzQmdG?=
 =?utf-8?B?c1QxWmRaQlhKSDNmNDFGZzdBRHV0TG9FWnNHY0ZpZWhRR3F0ZWpSbkxPVzlI?=
 =?utf-8?B?YU9teU1tMWl4blgxekxYMXZ5UlFHd1hna1BPajRKeE1tNHZCR3RQOXRNbGc2?=
 =?utf-8?B?Rmd6dWpWWVJCTkREanNrZ2YvWXp2dmQ5SktUWmNSSGNSR3BzN3R0L0k4VUI4?=
 =?utf-8?B?UlVVWDRYL3BydmY3Ni85blRGMXNOcVVxUjNseXk0b2NMVWM3cHczTm1nQzNl?=
 =?utf-8?B?dTRXOThocTZycWpPTG54QnZrYXAwc3BUR3ZNQnA3L2lJdnovbFZlbXNoRU5O?=
 =?utf-8?B?Y3B5TXBWcXFYWUgrK015N3k2dkYrK3BmRzdvUGEvUnkzL0tNWFJIdVlOYThq?=
 =?utf-8?B?bTdXUGg5LzZrRVMzZDl6U0FoWDZhSlUzZlBCZEdUb2RucW5qZllid2NxRXhz?=
 =?utf-8?B?azk3VHpwZktYTXVaeXhvd2FLWm5QQlNVTFA3b3N3NENJSXlhelJKbE1ZTUtP?=
 =?utf-8?B?djk4MzA4amx2NXlBTjBiK3JJQjgxNzFvSnB1ejlmbDVnQmtxenEwbnZWdE83?=
 =?utf-8?B?MWc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d1af755-76fb-4394-b1dc-08dc403285c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2024 12:14:51.5910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OULVhxvejH08o2FQbcnxU5TnjV8kv6gtBhg4p9pJSP7450sjU0nR9/1GAhX1/kK4F8CjQO7MbGAyjZluAv1wUDBKdzOK9Xk6tyI+nVSmwVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11272

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiBTZW50OiBTYXR1cmRheSwgTWFyY2gg
OSwgMjAyNCAxMjowOCBQTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDQvNF0gYXJtNjQ6IGR0czog
cmVuZXNhczogcjlhMDdnMHs0Myw0NCw1NH06IFVwZGF0ZSB1c2JocyBmYW1pbHkgY29tcGF0aWJs
ZQ0KPiANCj4gT24gMDgvMDMvMjAyNCAxOTowOSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gUmVwbGFj
ZSAncmVuZXNhcyxyemEybS11c2Jocy0+cmVuZXNhcyxyemcybC11c2JocycgYXMgZmFtaWx5DQo+
ID4gY29tcGF0aWJsZSBmb3IgUlovRzJMIGZhbWlseSBTT0NzIGFzIHRoZXJlIGlzIGEgZGlmZmVy
ZW5jZSBpbiBudW1iZXINCj4gPiBvZiBwaXBlIGJ1ZmZlcnMgY29tcGFyZWQgdG8gUlovQTJNLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPg0KPiA+IC0tLQ0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQz
LmR0c2kgfCAyICstDQo+ID4gYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0NC5k
dHNpIHwgMiArLQ0KPiA+IGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNTQuZHRz
aSB8IDIgKy0NCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2Fz
L3I5YTA3ZzA0My5kdHNpDQo+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdn
MDQzLmR0c2kNCj4gPiBpbmRleCA4NzIxZjRjOWZhMGYuLjc2NmM1NGI5MWFjYyAxMDA2NDQNCj4g
PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzLmR0c2kNCj4gPiAr
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzLmR0c2kNCj4gPiBAQCAt
ODEyLDcgKzgxMiw3IEBAIHVzYjJfcGh5MTogdXNiLXBoeUAxMWM3MDIwMCB7DQo+ID4NCj4gPiAg
CQloc3VzYjogdXNiQDExYzYwMDAwIHsNCj4gPiAgCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLHVz
YmhzLXI5YTA3ZzA0MyIsDQo+ID4gLQkJCQkgICAgICJyZW5lc2FzLHJ6YTItdXNiaHMiOw0KPiA+
ICsJCQkJICAgICAicmVuZXNhcyxyemcybC11c2JocyI7DQo+IA0KPiBUaGlzIGxvb2tzIGxpa2Ug
QUJJIGJyZWFrIGFuZCBjb21taXQgbXNnIGlzIHF1aXRlIHZhZ3VlIGFib3V0IGl0Lg0KDQpPSywg
V2lsbCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIGFzIGRyaXZlciBpcyB0YWtpbmcgY2FyZSBv
ZiB0aGUgYmFja3dhcmQNCmNvbXBhdGliaWxpdHkuDQoNCkNoZWVycywNCkJpanUNCg==

