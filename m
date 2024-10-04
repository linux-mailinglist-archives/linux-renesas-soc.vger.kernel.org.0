Return-Path: <linux-renesas-soc+bounces-9387-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9919902C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 14:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02084283DD3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 12:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1714E156861;
	Fri,  4 Oct 2024 12:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gUL+fvj7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CE72747B;
	Fri,  4 Oct 2024 12:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728044310; cv=fail; b=q9uNHPys3Mu5BcTREBJn9TWmhQD56nlZECjcla4ngGHqtICjMfauzsLhDDT5qX3Nx0yW714yZvEhrsOVz5aGr/FdiQia8jH7NLGuLyjErjL/r8YNtXVeiQFhwZ+C6BGvJCvy/OdhODQwdccJ3SDb/UVFn5ifRMc2P0TTnne+92Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728044310; c=relaxed/simple;
	bh=eEpNj65hm43iSi+Cyw5SJlk2e19oNtN9HAto7NCdAx0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=op3i7T0NaNkYG1DEifgiTX3ZhKuetvDGJUmAWVoPLIMSsvGPMWCNvYg6/qPgwt/n/q7TBqqBnA89PSGBq701nhLiVrfy3lSkpo2rj0/U3X0WP3SmpDQdy/ZouMCvR4O03165nrgEhmnIdAqT1AW1qUD4EAnaCBF+1USxODbYyVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gUL+fvj7; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAjb5m7lADzk/8lo9VenOECc2PUNnBQwlNJ/hJcD3T9jZ9tzH8O4o/e3GFwN4PkR61BKE/r8kJpEV7aj8/ic/ydbMrydok/QsR6jDItZHP3G9OoLzP1xMpCS+AAaxlAY7M6ATbu+A37cDVbEeSZ+KEhcNLSn3VPu4LEynVU9TgCsPd9/yFHDzj8rWT9zz/QZkqrF4LDvT8dcKlXQymokAdATyzIyK0lU4xkm+kjrO0US9P2L32qef/upEfv5e7PBUaPY7DzSHAbRUe0EcWSkLn8lObg6nRWLVekixutVMzuxbx9Xalw08QUZPjPKj/QIbvpsxlCa8Ggj/7Nes/6LiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEpNj65hm43iSi+Cyw5SJlk2e19oNtN9HAto7NCdAx0=;
 b=ierXhnQKp39rEQxTQzI2l65nXFHGvD7xo/CSOzZWcCWc9NpqZxecbFri4QKD/qqUKHhmwBYsD6Knz8NXbJIIKdqZdiylujCpv++aQjqOpySwCti+zx6fW9vJa51z9A4KSQeSzIfH4Lo/rQXT7GhHUushX4vM0A698q54JrTPWPTGYOPOIFCqLvGZdWi/5iGhaXfrEO552HfskygMlmzXdyjCVgkAJ3LuqngVZ7CMO6B+ebFrc6AA84vZMMbjLXBxsRN6f9GP0NtWl1n5ldoaLHfMSAe6VvUb1wujL3DlGtm6g8cJxzvwrzyOdxpih3lSQwXs6H2ae6G4Z/0G0a5KlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEpNj65hm43iSi+Cyw5SJlk2e19oNtN9HAto7NCdAx0=;
 b=gUL+fvj77mzEeO6P4FNp93HuL4Kur9wHyaWG8hjw4vIYiGnjAcDpd14FzP7dJTCLnds+BoM7KibbE8XbicaSF/pH/wHC6egtL4JfYqixFZ4R0z521j30etXStFEqcSOJJIQBoMVWOW60dvH8muLVQYu9UdDohaokIuAZyZLrCiU=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS3PR01MB8018.jpnprd01.prod.outlook.com (2603:1096:604:163::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 12:18:22 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%7]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 12:18:21 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v4 1/2] arm64: dts: renesas: rzg2ul-smarc-som: Enable
 serial NOR flash
Thread-Topic: [PATCH v4 1/2] arm64: dts: renesas: rzg2ul-smarc-som: Enable
 serial NOR flash
Thread-Index: AQHa/J2aEx5VOrDL4E6RFbsmvHfM0bJ2YKaAgABUxLA=
Date: Fri, 4 Oct 2024 12:18:21 +0000
Message-ID:
 <TYCPR01MB11332069AFECB040F13C9110686722@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20240901183422.31600-1-biju.das.jz@bp.renesas.com>
 <20240901183422.31600-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdWcZ-pxVkv+phjFv8CvsBpbABVA6_8=OpxQWECuHHS_oQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWcZ-pxVkv+phjFv8CvsBpbABVA6_8=OpxQWECuHHS_oQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS3PR01MB8018:EE_
x-ms-office365-filtering-correlation-id: 040f7aaf-bcdf-424f-bb68-08dce46ea371
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WmxPL0ZBdXA5RkppallGVGpKK1Frb2lSTEZGeW5jTkRSRTJIN1h6K1dUYVlQ?=
 =?utf-8?B?VG8vanNqdW9QM2gyYkVRMG5MdmFSc3djYXRzRWVsOGs2R1pEQW9hY2xwTXF0?=
 =?utf-8?B?MUtpL0N4TWNTWkRCb2FNc0RDRnpWMGI2TGR5c1ByL2VaUEJ3UVJsMjRmTWlW?=
 =?utf-8?B?c0pYRllZUGRRTkJDYkJ2UEduUmdVZVVyOEwyQitKQ2tXclZBN1RhYkdMdmNG?=
 =?utf-8?B?eEVIWnlIOEVYUlFJeUxnNVNKOVFIbnlkUk9QYWRkN054d25PMDIzZmVNNW9z?=
 =?utf-8?B?aytFYitTNVJCRWhDQ1VnZ3N1eXRSQVFTKzVnTW5PSCtrMmhZY0NUVDdRUlR6?=
 =?utf-8?B?MlRRaDArZ3laS3lvbzBuN3RxOU9xMHZSNWFVZnN2RnpjTlNoVnd1UWxtVVo3?=
 =?utf-8?B?NkFNVEh1RUxhNUJRZUl3dExBYXQzNnRyTE1hVnRJZFFCOGJ3bzM3NXlPbTRX?=
 =?utf-8?B?SkVlU0ExWStQZXY0K0dmNkhlY3ZTZ3I2TUlQdm1xalNhdkpSaU5LM3pUMXdQ?=
 =?utf-8?B?QTlKTUh5Rk5vOS9RbXJXNHh6WTZQNnIrcmFmWUZzdEhIaUdsK2t6VnZSeU9C?=
 =?utf-8?B?VnZ5QWY3QVl2OWIzRU1PYkdGbGY0RFB0aHJXRTlsMkJoS3FkSXZjR0xpOS9W?=
 =?utf-8?B?alN4OXBJQi9MajFIQjlsN05XQTl5dGErYStYVnlTTkt2VWZ4Y1JrL1Rlazcw?=
 =?utf-8?B?bVMvZVRBSkNmL3hlNEJlaXVHcklzSmxKNmRmditVMG9ER0VmVElVM2xNUWM2?=
 =?utf-8?B?UDVPeWI3ZDVqZ0EvMkRHT2ZhWWhiOXZDQWpna1p0WWxvNGV2REoxVUVjNmM5?=
 =?utf-8?B?NldTengyZVlqRFJ2UGdVVDlKT3dIeHpYc25aWERUaklPcVF0eXpOeUVWV1h0?=
 =?utf-8?B?WUljUGZhY1VzdzNSY0VhM1pIbjNYaTVDR0lqeEpHSmttQi9ZUUoxaHZDUUJx?=
 =?utf-8?B?TWxhSUY1MU9mYTkrcExDTWlwdkFRQy94NEcvQWlEdmJnMUFKdk11UUdNMzZH?=
 =?utf-8?B?ZHd5cnBqK1lyLzJvbTlzanA3eVNBcVF2K3kzSjdPNXlpeXIxcU1wNGYxRDV2?=
 =?utf-8?B?bXNoWUV0NWpoZm9sOFFsN0tjNkVWSVJtVEd2WTVWWTA1S0lGaGFoM1Z0NHV0?=
 =?utf-8?B?ZHFabGZuVXlIeWROVUxJMGdwblB0dlRHV20ySjZDNDdhZFZjMHh5amovQndU?=
 =?utf-8?B?TFIydjhQM2YvMG5FN0FPTnQvaWNRekdXdXdqTFhLQU9uT0NuLzkxcHhVMW5G?=
 =?utf-8?B?RTJoQ3IzRUpqdS9nL29JSm42TVVrK2I3U0t5SC94THpxQzZMMzNEVitBZ0RG?=
 =?utf-8?B?THg5YlNmNERsK2JiTWFNNUJPNGxwNHFpQXlDK2VEK2pTMzREYU96RmpYRTc2?=
 =?utf-8?B?VU9tc2gyZU9qRjl5cUNwUVRUUFNIWFlXNmEzM0x4dDhXTWh0Skk3elBFWmJC?=
 =?utf-8?B?bmN0cy9SbFFxMlFhMkdoY0plOThNclg2cGhuVkYxeVVWSmNnTll6YW4xUWVx?=
 =?utf-8?B?Mnp2UU5qQ1EyWWJYdEpLQ1lCcjI5NkdiaXhXeVVMZGRxSEpxenViT242U0Yy?=
 =?utf-8?B?TlFKbW1tdU1FTmMxaStmUjBFS2tEYWhiSWlHQStSQ2ozQVlHRFoyNEJTbU5M?=
 =?utf-8?B?VWtnNFNkcTdWUFVuMWZsZkI1akhESkdDWTM0R3dvRWFTbU9saktTNFFtS1ZL?=
 =?utf-8?B?c21UQnE3Ti9ZOC9ZYWZZL1dHNThrUXQvb2tlK1I1bDZXQU9SVlQvQnhFWHdE?=
 =?utf-8?B?ZjVBeUhBekp1RG5JbmN3R2NZYm41NExxK3BhVVRCeS9aTm1qSEk0TE1naFZM?=
 =?utf-8?B?bjkwdXFoUXlvaUUxc2ZXZz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SDVaL0F0dWhlbFBLNTQ5Wk44L3RwOG1iaHFUSGhmTmNmTE9GK2J5Q3pCcHVs?=
 =?utf-8?B?UldsKzlKazVDRHZDNlc3cjVpaDhTZG9KWENBNDkydklFeE5IbDllazFPR21u?=
 =?utf-8?B?L1pnaW5lYTVZak91RjlvSDlPNHA1NjQwZlFKNmNuRzc3cGlxZnRnVWEybzlO?=
 =?utf-8?B?MUxtcis3THlMTWNmSnB6Y3FHMFpFbVBEcndreEE2MTB1aDZWcVRsZU1DaGs5?=
 =?utf-8?B?V0hXNlJ6aG5XbzUxSGlMTlNUbHlVTzBuSGFVZ3F5UVFldzBmY2hOY2tRMk13?=
 =?utf-8?B?QS9jQVl6ZGhJUHhyRm40c2NpWC9FMGpsM2lCQm5pN3NNemNMT0VYWk1Haklj?=
 =?utf-8?B?QVRsQThWRE5KUGNkZC84L2psMjlnZVVrdjZ1VEpsT21hKzlDcTlWK3NnYmpF?=
 =?utf-8?B?b2RyVEZTRGViRC9VbzdCOVhXNkRmcS90OFJtZ1FiUzBoZmVLWmVvWUVsWi90?=
 =?utf-8?B?eWIzUmQzT3BDSlVoL1FoKzlZNWNZOEZKTUFiR21CcVhudVNmWnZkMDZZWks1?=
 =?utf-8?B?ekltVE5XMTdGc0E3cmRJZTZMRzdOejlJUlNYekhQS1MzZjZWUTh3RHdta0Va?=
 =?utf-8?B?QUYydHVmRW5GVDZzM09UbmpUVTlxaUtqTUloWmF6M3l0OXA4K2FSZm9QQlcx?=
 =?utf-8?B?OVk2cWtTQUphZU1BTnAyL0xyby9YSFI3MmI5dFZ1QzEzT255eUhaWU9pNW5w?=
 =?utf-8?B?RmlDd0FtUTlJemw2M3RDN2o0aElPOUp1ZEdTU1VMRGlJa2IydmVTeDB4b3dP?=
 =?utf-8?B?c1FiSjR5b2h1WnVnUUxHNHNjaGoxN1VwTENLQVV1dDhxY1lXWjRiQjJDVXJO?=
 =?utf-8?B?ZXozTkZ3ZmZ4aEpqRVpEeUdRUHRCREpJR2RWQ0RJRU5qZ3UzdXcyd3Q4SVZn?=
 =?utf-8?B?akpTNHJTV25qNnFCYnJBUzRKeHpObVFnSDBMa1BoeS9sNTNXR29wR2F1dldN?=
 =?utf-8?B?cmkrWm9CSUYrMEJFWHk2c3NhWGFxakJKajI0azZ4K1VSUVZESGYyR0c4NDQ1?=
 =?utf-8?B?K0lRNFVmTTJnYSsyMUI4SGtPNWYwczBDOXMrRmR0akFtSDgwVWxZbExETFFR?=
 =?utf-8?B?aHVYZlZUSlEwa09DUk55WDZyVk9peEt5Zm44VkQxeXJDbnBHd21ZMFRrbVpw?=
 =?utf-8?B?dUFSSHBsZFBYYUhmdmRGR3VRNDUyL1cxQXdHc3BnN0g0aFVScUppdElFcmVL?=
 =?utf-8?B?c0sxWlFscXVjR1p3c1FFSVdNL25FZFpCOGlIc2tocndtYUJ0eEhHT2pPYy9k?=
 =?utf-8?B?cDBtQnBCaWFGODlOSmFMRnNac1RUbGUxZUZaQS9uMU5CQ3A1SmpGUUEybUQz?=
 =?utf-8?B?d3Z4M3NpR0NPU3RDTENIV1o3VC9VbkRFeUtTQkVBazFGWEN5WWFmcjZqVWFL?=
 =?utf-8?B?VmcrTldEbEJYNXZkNnZGUERmQUhRdkl5emlDbStVR2NESHdCTEx4cmJ6aHZF?=
 =?utf-8?B?a0hob051RGVRaktGYU0zbHJnQjFPOFViNUltUGpHYVV2RlBYUTA5c3FjemNk?=
 =?utf-8?B?U3FTcXFGbFVQVjloYXZDVktkYktYQjNobUFFbFNLdEd5VTNEUjg0THFXL29a?=
 =?utf-8?B?Tlh1SFc5NWJCZStJcjFqOEw2YVhaZWpCMmU2MlZJZCtVbUI5UXZpOG1BdDlq?=
 =?utf-8?B?WlRmUGdDTjlHcE9JZTNCK0Q2aE5NZm1ta0hxbWg2SmJzM3VaVHhtTmZid3Qv?=
 =?utf-8?B?ZUUwOGhoMzVuOGVRUnNQcmR0blpUakh4Y2FCTzJickVaWlRhZVZuYWdwOWZp?=
 =?utf-8?B?SXl1a2lWSjlGMWRBQ3lDZXFzMzYvckc1bHhGTmR1YnBEd1NHZEVuNDc2cGl5?=
 =?utf-8?B?ckF6Q3RPR29qZ0xhRGgranRRMTRhdHRUY0NDQUxqUUNyWmVDdEpnNFdHbEVI?=
 =?utf-8?B?STVzTC9GY29qNk5Da3FmYTdOTGVDVW1JNndjSzNUUmJrblJITUZ5Nkl0ay8z?=
 =?utf-8?B?UG9YcDJzaHovaC82UzdyV0g5UHFBL1JoMU14OGFpSGhCMjFLRzVyRnJPb3R3?=
 =?utf-8?B?QlVpSC95WWNxUUNpSmFRSTFZT1c3a3dVNnU0V05jdFBJNWNjZlhSYUExQnRs?=
 =?utf-8?B?blVVakxUSVZBTHVWRWRpSmVpWUhkYnBFTis0TGtzalYvdk1BMnY0NW82MVQ0?=
 =?utf-8?B?ajdVRDJBS1RYYm13YnJYdUZjc0pxY3pCUkEvNlRxMm5nTE9wUC9nWTF2N1Y5?=
 =?utf-8?B?Zmc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 040f7aaf-bcdf-424f-bb68-08dce46ea371
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2024 12:18:21.8859
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2IK14lLuLENwXirEV6B0aJ88yEnLKRyWHpyj4brqVji8f3HY+IecodUgpLDC+aq2E0q9hzBbNvqCmUW83wVoYfCcl51LjdUY8FX+UpsAUqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8018

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgT2N0b2JlciA0LCAyMDI0IDg6MTQgQU0NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2NCAxLzJdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6ZzJ1bC1zbWFyYy1z
b206IEVuYWJsZSBzZXJpYWwgTk9SIGZsYXNoDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gU3Vu
LCBTZXAgMSwgMjAyNCBhdCA4OjM04oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPiB3cm90ZToNCj4gPiBFbmFibGUgUmVuZXNhcyBhdDI1cWwxMjhhIGZsYXNoIGNvbm5l
Y3RlZCB0byBRU1BJMC4gQWxzbyBkaXNhYmxlIHRoZQ0KPiA+IG5vZGUgZnJvbSByemZpdmUtc21h
cmMtc29tIGFzIGl0IGlzIHVudGVzdGVkLg0KPiA+DQo+ID4gVGVzdGVkIHRoZSBmbGFzaCBieSBm
bGFzaGluZyBib290bG9hZGVyczoNCj4gPiBmbGFzaF9lcmFzZSAvZGV2L210ZDAgIDAgMA0KPiA+
IGZsYXNoX2VyYXNlIC9kZXYvbXRkMSAgMCAwDQo+ID4gbXRkX2RlYnVnIHdyaXRlIC9kZXYvbXRk
MCAwICR7QkwyX0ZJTEVfU0laRX0gJHtCTDJfSU1BR0V9IG10ZF9kZWJ1Zw0KPiA+IHdyaXRlIC9k
ZXYvbXRkMSA1MTIgJHtGSVBfRklMRV9TSVpFfSAke0ZJUF9JTUFHRX0NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0N
Cj4gPiB2My0+djQ6DQo+ID4gICogVXBkYXRlZCBjb21taXQgZGVzY3JpcHRpb24uDQo+ID4gICog
VXBkYXRlZCBwYXJ0aXRpb24gdGFibGUuDQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhDQo+
IA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcydWwtc21hcmMtc29t
LmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMnVsLXNtYXJj
LXNvbS5kdHNpDQo+ID4gQEAgLTIwMSw2ICsyMDEsMTIgQEAgaXJxIHsNCj4gPiAgICAgICAgICAg
ICAgICAgfTsNCj4gPiAgICAgICAgIH07DQo+ID4NCj4gPiArICAgICAgIHFzcGkwX3BpbnM6IHFz
cGkwIHsNCj4gPiArICAgICAgICAgICAgICAgcGlucyA9ICJRU1BJMF9JTzAiLCAiUVNQSTBfSU8x
IiwgIlFTUEkwX0lPMiIsICJRU1BJMF9JTzMiLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IlFTUEkwX1NQQ0xLIiwgIlFTUEkwX1NTTCI7DQo+ID4gKyAgICAgICAgICAgICAgIHBvd2VyLXNv
dXJjZSA9IDwxODAwPjsNCj4gPiArICAgICAgIH07DQo+ID4gKw0KPiA+ICAgICAgICAgc2RoaTBf
ZW1tY19waW5zOiBzZDBlbW1jIHsNCj4gPiAgICAgICAgICAgICAgICAgc2QwX2VtbWNfZGF0YSB7
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcGlucyA9ICJTRDBfREFUQTAiLCAiU0QwX0RB
VEExIiwgIlNEMF9EQVRBMiIsDQo+ID4gIlNEMF9EQVRBMyIsIEBAIC0yNTIsNiArMjU4LDQ1IEBA
IHNkMF9tdXhfdWhzIHsNCj4gPiAgICAgICAgIH07DQo+ID4gIH07DQo+ID4NCj4gPiArJnNiYyB7
DQo+ID4gKyAgICAgICBwaW5jdHJsLTAgPSA8JnFzcGkwX3BpbnM+Ow0KPiA+ICsgICAgICAgcGlu
Y3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4g
PiArDQo+ID4gKyAgICAgICBmbGFzaEAwIHsNCj4gPiArICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJqZWRlYyxzcGktbm9yIjsNCj4gPiArICAgICAgICAgICAgICAgcmVnID0gPDA+Ow0KPiA+
ICsgICAgICAgICAgICAgICBzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47DQo+ID4gKyAg
ICAgICAgICAgICAgIHNwaS10eC1idXMtd2lkdGggPSA8ND47DQo+ID4gKyAgICAgICAgICAgICAg
IHNwaS1yeC1idXMtd2lkdGggPSA8ND47DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBzcGkt
Y3BvbDsNCj4gPiArICAgICAgICAgICAgICAgc3BpLWNwaGE7DQo+ID4gKyAgICAgICAgICAgICAg
IG0yNXAsZmFzdC1yZWFkOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgcGFydGl0aW9ucyB7
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRp
b25zIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsNCj4gPiArDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcGFydGl0aW9uQDAgew0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbGFiZWwgPSAiYmwyIjsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHJlZyA9IDwweDAwMDAwMDAwIDB4MDAwMWMwMDA+Ow0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IHBhcnRpdGlvbkAxZDAwMCB7IC8qIGZpcCBpcyBhdCBvZmZzZXQgMHgyMDAgKi8NCj4gDQo+IElz
IHRoaXMgNCBLaUIgZ2FwIGJldHdlZW4gdGhlIHR3byBwYXJ0aXRpb25zIGludGVudGlvbmFsPw0K
Tm8uIEkgd2lsbCBmaXggdGhlIGJsMiBzaXplIGFzIDB4MDAwMWQwMDAuDQoNCkNoZWVycywNCkJp
anUNCg0KPiBJZiB5ZXMsIEkgdGhpbmsgaXQgZGVzZXJ2ZXMgYSBjb21tZW50Lg0KDQo+IA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGFiZWwgPSAiZmlwIjsNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAwMDFkMDAwIDB4N2UzMDAwPjsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBwYXJ0aXRpb25AODAwMDAwIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGxhYmVsID0gInVzZXIiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmVnID0gPDB4ODAwMDAwIDB4ODAwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICB9Ow0KPiA+ICsgICAgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAgfTsNCj4gPiArfTsN
Cj4gDQo+IFRoZSByZXN0IExHVE0uDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2
ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02
OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8NCj4g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K

