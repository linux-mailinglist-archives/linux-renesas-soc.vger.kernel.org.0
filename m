Return-Path: <linux-renesas-soc+bounces-3652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1635B8775A7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Mar 2024 08:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51B011F2130A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Mar 2024 07:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44128FBED;
	Sun, 10 Mar 2024 07:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ngv/NDVw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2042.outbound.protection.outlook.com [40.107.114.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB8923D2;
	Sun, 10 Mar 2024 07:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710057434; cv=fail; b=ES/M4RHQ6CmhNnTLDjVqMyA0OJ6fYwlnTtmivUGJwbB1mGGHzNizCCqwEv0sXCxvt3q7D1qN6HV7PFCfsgFzIWG5CRpAwYhKp8MFl96VpANHpzejE69XP8I2kSM6itsSKHLnbX6BwLm69zhsA60C4WFLuu/nd/ylPA/OO9X/VWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710057434; c=relaxed/simple;
	bh=vnwQUvCYLbsKuKWPEbO4ogwoWpGGKa+IykiuPnMJDE0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZSh9O82AsW7I5EangvEAa1Z3KXeL/VXMwn+NABSNIbVRGHAGB/fhDqyFLI69Zf+zPfle945a0lJYQ5jOrefATFwfLWLB1emp5ldDYWS9N9trfYeWjTSIuqSPTh/KJDftm1GzwckmrDFK3A21TeDRgavxWl0nRAq+iRcB+iAH/vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ngv/NDVw; arc=fail smtp.client-ip=40.107.114.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecO//mKoW1Najoj7tbA4A2eyBRW7YbsqbXNVLSIjTq0bcKr1WGYW0dUE7TNnfJHY31u7qRMipj1wNOjj1636KJ/Wio53KSKPv0Wut2J5T6MAUzEFIkk8sMRj1uppH849oBLqRgJ9nUdKiY65FnLzGTY0TUkjSYtM4MhfgMBO8ZQdAFp6n3apOfenL2cQiEWtgEF2gy/5H4hKJHzZCP88tCqfqbSU9LlanjZBJY6Cu7mWbd8PLOa5y7+u39Sp0n9+vpwkP6kuT7W5srtxKixpPTAgFaGjV5iC/XPBwkP2dB3KQBmz3UZU0PO0ZBDoT1pcSGYsWvGBvtQ74F25tfGmsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnwQUvCYLbsKuKWPEbO4ogwoWpGGKa+IykiuPnMJDE0=;
 b=de3JadWfgf/b44d/fyxpmupO/qLnbdhtC39PQM+uMo0BOnObLiHsJVjTHmDNVCR7yktikbcPjNSqIcMTW3y0ThwM503D6fI287PtHF7vumidn4msUWzPrPAd4h8V9FtkJcjyiK2oCUKXmyPx2XSjYgRBCO5ke4dBo5KXajS0QX6alODpJVV+A4qF0eapOgWv2SyO8hrEMH7jU4JTMPNAVCYniuHx2ajMghtfSwt6jMGSrsGv5IxsY6yIEOFyeLGBvg17ju11WYAGOgb/hy+Q+6u/YuPdHJDctCjU6oqHnqm2EWNLvdfc/CqbS6Jk2LPYZy8rYihsnf1+QOsAFRtvFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnwQUvCYLbsKuKWPEbO4ogwoWpGGKa+IykiuPnMJDE0=;
 b=ngv/NDVwCoXdb7mtei6igH4gt8vLbHnaBU2dUqn3ynsIdQRfuzeIob56y7DSqbG5CoE7UPRV5ma74PxNLYcJTgyBG8MkT+IxEkIXmvExVH2530naInzAXJh8uoY6/hX3lkeXWdZ6O4jltKGRdGCJtn3k3rOjb4eAG107EVvvsTc=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by OSZPR01MB6751.jpnprd01.prod.outlook.com (2603:1096:604:134::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.33; Sun, 10 Mar
 2024 07:57:05 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b%7]) with mapi id 15.20.7362.024; Sun, 10 Mar 2024
 07:57:02 +0000
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
Thread-Index:
 AQHacYPMGWKOfJ8WCEqHUSv4i74FdbEvUfMAgAABIyCAAAOtAIAAADSQgAAR4gCAACQ3AIAAATtQgAENy3A=
Date: Sun, 10 Mar 2024 07:57:02 +0000
Message-ID:
 <OSAPR01MB158719BA384CA9E730D051F786252@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240308180919.6603-1-biju.das.jz@bp.renesas.com>
 <20240308180919.6603-5-biju.das.jz@bp.renesas.com>
 <67819907-4366-483d-b71b-2646ffb076fd@linaro.org>
 <OSAPR01MB15874E48DD2269C2593DB55A86262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <ff569d52-f68f-410d-9897-9e1102171a1b@linaro.org>
 <OSAPR01MB15874A9DB0CE13AB0440242186262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <2821f23f-aac1-4b12-ba60-bc60da153d8a@linaro.org>
 <OSAPR01MB1587C505F324B11824AB6AB286262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <OSAPR01MB158700437A1D57805BAF349686262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
In-Reply-To:
 <OSAPR01MB158700437A1D57805BAF349686262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|OSZPR01MB6751:EE_
x-ms-office365-filtering-correlation-id: 1836e392-e15a-49b2-ca8e-08dc40d7abe3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dPWBf0WXNGOvFx260j6CBCY7MlMltgBMBRwecFnh/+28O9RfBFOu8ZutI/wl2UoIYcFWuQMQKlnjbTN6NpmeaRpOsXrGZhzqcMqlRdgbF+iEIhB3EdYV8xuTqePovuTi8x1WzhzoxvbmavvnNIZwOTIBo4A3T89WYJEAEHIYE6L7cPQJKCbgWzES5BmNMI+Sc5kqd+jCMVwVWfhf3RdA8zeAQeFKLdQhLcme9NlmtNklLpzuPG4XJQHhhlnN7RW6oMeByq3cTgFLrVDImflIsdfr6DgImBVWpdrPap76sHe9pQoCunqTDRxHWaKZ2QBSweiO2DZQdfMi5fxZ8fbpxNM4mYSzYlvR9RibWiVtwc2SafL96OmwX5lKejwf8TmHRuojw+O7p79BWssLwYwtQGB2NS0Vj0VEPNTdGvSxvE2j+637lLji2/JxkKqt0BGhU0IklFad763wq1Q56Sd4JZuuuvzmME22PEuEWAIW9wRGDkfl3CHMPfEIHoWnVSE2CB5qcPKphZ8GrD0x7fycwEH0uapa3QAQbqB6qdj+BC+vsti2SMKmM8FgPAoKWUi+Yg7Cr2M1t79oGqQSkTXU8cZUMxYGLSvm64jJZYphYw2e4h3l8d01WTjTyRtnYX1E03he7f2FY3SDOERWsepxPrPnsJ/Klwve2/UqgEggQdaFKbTkXGr1ipco0VtiynzYi2M8o5wX1sphJrtaMPF7EA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QVpiUlM0eit5elNHeFBMTXB3WlFRMU1VSTBHN0drUFNiZ1RvVGZrTXg5MHdp?=
 =?utf-8?B?NXgrWnZ3ZWZGVkFoZThmdTd4Vldpam1rV25SRUM0UXNLcXZzSVlVOW5Gells?=
 =?utf-8?B?WlhUenBkbkxWT0JzQjIwNHh0OTRGaEpSb0p6TjRFU0VaQzRRNDZFdWp4QWZ1?=
 =?utf-8?B?aGZUWngzMXJFY3B4TVVoRHA0RkpBRTNJV2owKzJJaVo3T0tESUc2WExzZVBH?=
 =?utf-8?B?eVoxc0t6Nkk4WlpqakJNaHNlQlV0RmtHZ2lxTmVyaDV2YXJ0SzFSdFBpZjFn?=
 =?utf-8?B?T2FaalVoanorRGt0Ym1Ha1dvSVF5eVZBK3pDcUVLWTlrNkUzdlQ0MEgvSWpy?=
 =?utf-8?B?VjErdGs5RDBJalhMUDdaUlBXM0JzWDZlTjJPdmRkOGQvL2tzMUlwVWJ1c2JJ?=
 =?utf-8?B?N0ZYdDlwYmlTMFN5UUNUVldlQmdZZ1hmMXlBOS9zVWhXSHA2enJ4S2RjTGpu?=
 =?utf-8?B?SFpxSEJMYkN3ZFFUNldLejhHN0Y0Z2xaZjNXZkpnUFF4WTdKU0c3TkhiNnZE?=
 =?utf-8?B?ZERRUlc3WURmRmRpcHlXdlN1NFIrUWJaWW16K2pyWHJLQ1FFWm9YZW9EREJw?=
 =?utf-8?B?cGJGcUdJNU1URFZxSzE1dm5wcEhiaVFIMHVxVHdNRXFVWWw3VDhSd2dnQUwv?=
 =?utf-8?B?TUdaaHRENUVtRjYrY3pFdFJuUDJCdW8rQ0pEVTJZbXBtN1NkRWtvcUJ2ZVkr?=
 =?utf-8?B?L0lMeVNLTmNQOGN1QnA1ak1XaDdDK1I4SVRkQTBOaEhhRU5FYnp1ZjdrWnhp?=
 =?utf-8?B?VVYzcEtCNFRMMHRJY0ZNRk9nU09ob0cvMHhPUi9tYzJBMHgxWUcxN21OY3VI?=
 =?utf-8?B?RU5vcU9raGpSY2I2MTkxc0VzdmpsZi9hblVOM295UXMvenE4WTVnWE5pSmxM?=
 =?utf-8?B?emlteHpqd3FmaEw1ZkUzMXZidXlqR3gyaFBPby9CTGlIK1FaRnhsNkZiSVNP?=
 =?utf-8?B?QWh2dE5NZG5GTUI4eTM3SElNalB1YXJhQXhBTUFVeFJQN3NzeHNNQ1B4cXVL?=
 =?utf-8?B?VVppaDBwNHZRdzZ5WURDbkdpNmtDQnZSTGwvVENJdldjbEJpaGZYZ3lWWlZo?=
 =?utf-8?B?a1NxWnBmcUYvd0gxOVJzY1ZsTHNHUHNTZ2xMSGVqVVl4Rm01U2haYWdudVdK?=
 =?utf-8?B?Vjg0Q2NoQnJaS0VCYitELzJKOS85b2VjZW1iU3pSMWdkRDJGYUptZGJUOUMw?=
 =?utf-8?B?WmUySmJNQ0NvcTl3c1lwLzdzQnBZc2hFa0d4anlKRVlKZ1R6YU93bHcrblhU?=
 =?utf-8?B?ZHJZaE9VZmU5eU9aRWorYk5VVWhsc0drdU9aK3NLS0FFeXdBc0xyQ0ZKc3Fw?=
 =?utf-8?B?akFhVWZMWGsxcXRndGgvOVJrTzBBbjdVaXhjdlFkWkdoandaU2xUNmtZNlVC?=
 =?utf-8?B?UUtPMG9jUGdSSzIxTUJVM1JNSDNlMGxQUFRZajJFN05LQUdra3grTU8zWEtM?=
 =?utf-8?B?a3A5cmJmZU10UmdnS2JQRWZLdStjMVZCdFFsT3NTZm9JM3BlVWIvSURPVkcr?=
 =?utf-8?B?RmcrM05LUExOM05BVXdxS1hDdVhobGNTYTM5UGJXTUM4SjlkRDFUaWVxSmlk?=
 =?utf-8?B?eDJKNWNsUEhsUjZzUVljR1Zidml2bDkvY2FKUGJhRkYrbS91U1hrVkpoZkRj?=
 =?utf-8?B?MjRDZXUzVHdqdDAzRVlnTFBZVkRKSVZRejBmSlE2cHZxMUxBeEhGeisyYmtE?=
 =?utf-8?B?S0VBTUpITW02LzNSdWZ2RG5nZGRtNS9iQ1RSWEl5SlJQZlBnSCtObWxFa3lH?=
 =?utf-8?B?NW9HanI1K1Nqd2hCbk1NV1VvckZ0dnRLYUljZ0Y0ZjZkVWZyZXIvTlhvTXNG?=
 =?utf-8?B?Z1lNcTFrKy9YM0NiSUJJL1diVEVUdlVxNnFzMHZyR0djSytKZkFrQW52dUti?=
 =?utf-8?B?NzY0b1JrcG1va0ZWeXZBUlM0b2VpbGwxemdwU2I0SEpzTFJCVXRDdW1IRG5X?=
 =?utf-8?B?T1hoaTF0NHNTczhTQkhOdFJndW9SYzA2Zi84dnY5aVQ0RThSVmFGUGRKcjBn?=
 =?utf-8?B?QmRFQWpXOExZKzZPVzNDaHFKS3BOcE0ybHVIbjB4bUV1cG9tVDF2UVozcmN0?=
 =?utf-8?B?RTFvdzlUWWpBeStGd2I0eTlFYTE2dWZCcnRMOThwNVNPYUdSWXNpRWdKZ2JD?=
 =?utf-8?B?VkpZZytoNmhlZWZQYktITlVoRW95Y1pmdmRuR3RwM1dycHU4Z3FuUkZYaU5s?=
 =?utf-8?B?WHc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1836e392-e15a-49b2-ca8e-08dc40d7abe3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2024 07:57:02.5177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1m8AI6PjpB3NOaOEzj3lOBeFGBr31LKiIHiVJN3ECOdo3HAl/GcLFR73pL69GJOJmGK4gqPzGsus8G5srRuXJ8jdz6B6RqvrMR5OHw8fN+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6751

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+ID4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxv
d3NraUBsaW5hcm8ub3JnPg0KPiA+ID4gU2VudDogU2F0dXJkYXksIE1hcmNoIDksIDIwMjQgMToz
MCBQTQ0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCA0LzRdIGFybTY0OiBkdHM6IHJlbmVzYXM6
IHI5YTA3ZzB7NDMsNDQsNTR9Og0KPiA+ID4gVXBkYXRlIHVzYmhzIGZhbWlseSBjb21wYXRpYmxl
DQo+ID4gPg0KPiA+ID4gT24gMDkvMDMvMjAyNCAxMzozMiwgQmlqdSBEYXMgd3JvdGU6DQo+ID4g
PiA+IEhpIEtyenlzenRvZiBLb3psb3dza2ksDQo+ID4gPiA+DQo+ID4gPiA+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiA+ID4gPj4gU2VudDogU2F0dXJkYXksIE1h
cmNoIDksIDIwMjQgMTI6MjYgUE0NCj4gPiA+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNC80XSBh
cm02NDogZHRzOiByZW5lc2FzOiByOWEwN2cwezQzLDQ0LDU0fToNCj4gPiA+ID4+IFVwZGF0ZSB1
c2JocyBmYW1pbHkgY29tcGF0aWJsZQ0KPiA+ID4gPj4NCj4gPiA+ID4+IE9uIDA5LzAzLzIwMjQg
MTM6MTQsIEJpanUgRGFzIHdyb3RlOg0KPiA+ID4gPj4+IEhpIEtyenlzenRvZiBLb3psb3dza2ks
DQo+ID4gPiA+Pj4NCj4gPiA+ID4+PiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCj4gPiA+ID4+
Pg0KPiA+ID4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPj4+PiBGcm9t
OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+
ID4gPiA+Pj4+IFNlbnQ6IFNhdHVyZGF5LCBNYXJjaCA5LCAyMDI0IDEyOjA4IFBNDQo+ID4gPiA+
Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNC80XSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwN2cw
ezQzLDQ0LDU0fToNCj4gPiA+ID4+Pj4gVXBkYXRlIHVzYmhzIGZhbWlseSBjb21wYXRpYmxlDQo+
ID4gPiA+Pj4+DQo+ID4gPiA+Pj4+IE9uIDA4LzAzLzIwMjQgMTk6MDksIEJpanUgRGFzIHdyb3Rl
Og0KPiA+ID4gPj4+Pj4gUmVwbGFjZSAncmVuZXNhcyxyemEybS11c2Jocy0+cmVuZXNhcyxyemcy
bC11c2JocycgYXMgZmFtaWx5DQo+ID4gPiA+Pj4+PiBjb21wYXRpYmxlIGZvciBSWi9HMkwgZmFt
aWx5IFNPQ3MgYXMgdGhlcmUgaXMgYSBkaWZmZXJlbmNlIGluDQo+ID4gPiA+Pj4+PiBudW1iZXIg
b2YgcGlwZSBidWZmZXJzIGNvbXBhcmVkIHRvIFJaL0EyTS4NCj4gPiA+ID4+Pj4+DQo+ID4gPiA+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+ID4gPiA+Pj4+PiAtLS0NCj4gPiA+ID4+Pj4+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVz
YXMvcjlhMDdnMDQzLmR0c2kgfCAyICstDQo+ID4gPiA+Pj4+PiBhcmNoL2FybTY0L2Jvb3QvZHRz
L3JlbmVzYXMvcjlhMDdnMDQ0LmR0c2kgfCAyICstDQo+ID4gPiA+Pj4+PiBhcmNoL2FybTY0L2Jv
b3QvZHRzL3JlbmVzYXMvcjlhMDdnMDU0LmR0c2kgfCAyICstDQo+ID4gPiA+Pj4+PiAgMyBmaWxl
cyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4gPiA+Pj4+Pg0K
PiA+ID4gPj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEw
N2cwNDMuZHRzaQ0KPiA+ID4gPj4+Pj4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlh
MDdnMDQzLmR0c2kNCj4gPiA+ID4+Pj4+IGluZGV4IDg3MjFmNGM5ZmEwZi4uNzY2YzU0YjkxYWNj
IDEwMDY0NA0KPiA+ID4gPj4+Pj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5
YTA3ZzA0My5kdHNpDQo+ID4gPiA+Pj4+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVz
YXMvcjlhMDdnMDQzLmR0c2kNCj4gPiA+ID4+Pj4+IEBAIC04MTIsNyArODEyLDcgQEAgdXNiMl9w
aHkxOiB1c2ItcGh5QDExYzcwMjAwIHsNCj4gPiA+ID4+Pj4+DQo+ID4gPiA+Pj4+PiAgCQloc3Vz
YjogdXNiQDExYzYwMDAwIHsNCj4gPiA+ID4+Pj4+ICAJCQljb21wYXRpYmxlID0gInJlbmVzYXMs
dXNiaHMtcjlhMDdnMDQzIiwNCj4gPiA+ID4+Pj4+IC0JCQkJICAgICAicmVuZXNhcyxyemEyLXVz
YmhzIjsNCj4gPiA+ID4+Pj4+ICsJCQkJICAgICAicmVuZXNhcyxyemcybC11c2JocyI7DQo+ID4g
PiA+Pj4+DQo+ID4gPiA+Pj4+IFRoaXMgbG9va3MgbGlrZSBBQkkgYnJlYWsgYW5kIGNvbW1pdCBt
c2cgaXMgcXVpdGUgdmFndWUgYWJvdXQgaXQuDQo+ID4gPiA+Pj4NCj4gPiA+ID4+PiBPSywgV2ls
bCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIGFzIGRyaXZlciBpcyB0YWtpbmcgY2FyZSBvZg0K
PiA+ID4gPj4+IHRoZSBiYWNrd2FyZCBjb21wYXRpYmlsaXR5Lg0KPiA+ID4gPj4NCj4gPiA+ID4+
IEFoLCBJIHdhcyBub3QgcHJlY2lzZSBoZXJlLCB5b3Ugc2hvdWxkIGNvbnNpZGVyIHRoZSBpbXBh
Y3QgdGhpcw0KPiA+ID4gPj4gaXMgb24gRFRCIHVzZWQgb24gb3RoZXIga2VybmVscy4gWW91IGd1
eXMgc2hvdWxkIHJlYWxseSBzdG9wDQo+ID4gPiA+PiB1c2luZyBpbXByZWNpc2UvaW5jb3JyZWN0
IGdlbmVyaWMgZmFsbGJhY2tzIGFuZCwgc2luY2UgaXQgaXMNCj4gPiA+ID4+IHVzdWFsbHkgdHJp
Y2t5IHRvIGtub3cgd2hpY2ggZmFsbGJhY2sgaXMNCj4gPiA+IGNvcnJlY3Qgb3Igbm90LCB5b3Ug
c2hvdWxkIHN0b3AgdXNpbmcgdGhlbSBhdCBhbGwuDQo+ID4gPiA+DQo+ID4gPiA+IFRoZXJlIHdp
bGwgYmUgZHJpdmVyIGNoYW5nZSB0byBoYW5kbGUgU29DIHNwZWNpZmljIGNvbXBhdGlibGUuDQo+
ID4gPiA+DQo+ID4gPiA+IFNvICwNCj4gPiA+ID4NCj4gPiA+ID4gb2xkIERUQiArIG9sZCBrZXJu
ZWwgd2lsbCBoYXZlIDE2IHBpcGUgYnVmZmVycyBvbGQgRFRCICsgbmV3ZXINCj4gPiA+ID4ga2Vy
bmVsIHdpbGwgaGF2ZSA5IHBpcGUgYnVmZmVycy4NCj4gPiA+ID4gTmV3IERUQiArIG5ldyBrZXJu
ZWwgd2lsbCBoYXZlIDkgcGlwZSBidWZmZXIuDQo+ID4gPg0KPiA+ID4gWW91IG1pc3NlZCBuZXcg
RFRCIGFuZCBvbGQga2VybmVsLiBUaGlzIGJyZWFrcyBhbGwgdXNlcnMgb2YgRFRTLg0KPiA+ID4g
VGhhdCdzIHRoZSBlbnRpcmUgcG9pbnQgb2YgeW91ciBicm9rZW4gZ2VuZXJpYyBjb21wYXRpYmxl
cyB3aGljaCB5b3UgZGlkIG5vdCBhZGRyZXNzLg0KPiA+DQo+ID4gQXMgcGVyIG15IGtub3dsZWRn
ZSwgdGhlcmUgaXMgbm8gdXNlciBpbiBSWi9HMkwgaXMgdXNpbmcgbmV3IERUQiBhbmQgb2xkIGtl
cm5lbC4NCj4gPiBTbywgaXQgaXMgc2FmZS4NCj4gDQo+IElmIHRoZXJlIGlzIGEgdXNlciBmb3Ig
c3VjaCBjaGFuZ2UsIHdlIGNvdWxkIHVzZQ0KPiANCj4gCWNvbXBhdGlibGUgPSAicmVuZXNhcyx1
c2Jocy1yOWEwN2cwNDMiLA0KPiAJICAgICAgICAgICAgICJyZW5lc2FzLHJ6ZzJsLXVzYmhzIiwN
Cj4gCQkJICJyZW5lc2FzLHJ6YTItdXNiaHMiOw0KPiANCj4gT3INCj4gDQo+IAljb21wYXRpYmxl
ID0gInJlbmVzYXMsdXNiaHMtcjlhMDdnMDQzIiwNCj4gCQkJICJyZW5lc2FzLHJ6YTItdXNiaHMi
Ow0KPiANCj4gDQo+IFRoZSBmb3JtZXIgY29uc3VtZXMgbGVzcyBtZW1vcnkgY29tcGFyZWQgdG8g
dGhlIGxhdGVyLg0KPiANCj4gQXMgbGF0ZXIgcmVxdWlyZXMsIDMgcGxhdGZvcm0gc3RydWN0dXJl
cyBmb3IgcnovZzJsLCByei92MmwgYW5kIHJ6L2d1bCB3aGVyZWFzIHRoZSBmb3JtZXIgcmVxdWly
ZXMganVzdA0KPiAxLg0KDQpBbm90aGVyIHdheSBpcyB1c2luZyBSWi9HMkwgU29DIGZhbGxiYWNr
IGNvbXBhdGlibGUgZm9yIGJvdGggUlovVjJMIGFuZCBSWi9GaXZlIHZhcmllbnRzDQoNCgljb21w
YXRpYmxlID0gInJlbmVzYXMsdXNiaHMtcjlhMDdnMDQzIiwNCgkgICAgICAgICAgICAgInJlbmVz
YXMsIHVzYmhzLXI5YTA3ZzA0NCIsDQoJCQkgInJlbmVzYXMscnphMi11c2JocyI7DQoNClRoaXMg
d2lsbCBmaXQgaW50byBhbGwgQUJJIGNvbWJpbmF0aW9ucyB3aXRoIG9wdGltaXplZCBtZW1vcnkg
dXNhZ2UgaW4gZHJpdmVyIHJlbGF0ZWQgdG8gcGxhdGZvcm0gc3RydWN0dXJlLg0KDQpvbGQgRFRC
ICsgb2xkIGtlcm5lbCB3aWxsIGhhdmUgMTYgcGlwZSBidWZmZXJzDQpvbGQgRFRCICsgbmV3IGtl
cm5lbCB3aWxsIGhhdmUgOSBwaXBlIGJ1ZmZlcnMNCk5ldyBEVEIgKyBvbGQga2VybmVsIHdpbGwg
aGF2ZSAxNiBwaXBlIGJ1ZmZlcnMNCk5ldyBEVEIgKyBuZXcga2VybmVsIHdpbGwgaGF2ZSA5IHBp
cGUgYnVmZmVycw0KDQpDaGVlcnMsDQpCaWp1DQoNCg0KDQoNCg0K

