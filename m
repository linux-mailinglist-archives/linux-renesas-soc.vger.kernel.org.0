Return-Path: <linux-renesas-soc+bounces-25610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 913F5CA7E83
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Dec 2025 15:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 666553020C5A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Dec 2025 14:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F9325A645;
	Fri,  5 Dec 2025 14:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hP5NyDqO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956D12F3626;
	Fri,  5 Dec 2025 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764944119; cv=fail; b=AnpxDsXjnxZpEc8C1hVVzUbM/y79NHYnK7PJuyngBqDR+8EVyUx/mIsLP/Lzp3KJJDk4D2e/pWamEps4gZcWHm9IxvA5m3twZW8KX2QDPW6+ZNz/0LvKhDTHDEIf4HeTvCimppK15fqibuGK4pgt4jVPRuaSLtVh49NhTFrQA1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764944119; c=relaxed/simple;
	bh=g850czlD5GVobCTJ+ym7KO2tAGbl8qMyUvqAPMznpvE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CGLsJKIaGM2/xkZVb8copqgGRbQOm4LDGxtScEPWv9DiAd8raKjBzTkFWgP8eu+w/qH4JixfDPO7lhWlSeEghKUMjpu/VLL5/IY+znpwZGn8C1Q5d5y8Tb/7IRpYkbfcmTxqlV8+NRhNG85b3EOMiEMnM5geKYNYlLvmZJjYhd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hP5NyDqO; arc=fail smtp.client-ip=40.107.74.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EgjB8ydj0FEwgkhgBfK8jXuzj5/xTSkx5K1g4u6brwk2o0UcGhPOCyG+sC7fCjF7Uo+lp9+MLXnAvIPCcEu7M+1Cl0DBTQWqHTkeADNQBG6F6xU2ZmPtG6K0OBnyPxJG5R4kiKz2GJ7vVGIKYCF5FIi8RqhfLMM9NypL63SgNyA71d1t79a0CxhCP56V1554igbmnhu2vFKon4zE/aTyhW6uTv6uIlsV1PkFus5X0BUsdNiOQ9dpmV2Z9cs36JCr6kEgFfrUCHrCsLYOn/eeE9CdRUWW2dRH6OCiIqvUYZJAVZqQzCShJHCHGxhhW/ZVUxZX4WsmX9Y4lPZIDE2Dcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g850czlD5GVobCTJ+ym7KO2tAGbl8qMyUvqAPMznpvE=;
 b=DX+VUgW7PI4zGZcOTtmL1j9PCzLbJBovT1dbD9pwK8E6rVVU8stp5i0OqGfXfBuZcCYrH+rnAt8luJJgnE/7fbi7tEU1Rf0JSoARuZ0+G2f4BAMDdg1qeb4FhUsINKFh83hXWkBoc7KvB6Y9rBZhadFNYMnuEBfr+akJCsZFJiOhg17soS5P3Pd7lPVHCCfoIAGGcLQqevQf+DcWE8B5OKRZ+NObBfPY6iXDKspOq27axQTCEG4DPd5XD7ZEp12DOvR/BSR0mf58b7lsZtO8L08eBU7gMtQw7vd1rQgQphhGTKzbol3o3NIyEe1SvYElaxLcFzkB2YWwgQfPqlCUBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g850czlD5GVobCTJ+ym7KO2tAGbl8qMyUvqAPMznpvE=;
 b=hP5NyDqO6PPi7NpBKYyVYj9+8sR+soNq10PkjU53nAeoXoaCNRkQQ+prR9CnMBubHzta3QquzCGt5uCWYqc3s8y/m6o/5dhKkQ4yDjEvqfqy7uQcKnmre4XF1ZYjpqV9fhWBYmiG8u9zbyWjPmBFToB3Y1bxNo+d/SxIUU9f6Ys=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB14644.jpnprd01.prod.outlook.com (2603:1096:604:3a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.3; Fri, 5 Dec
 2025 14:15:09 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 14:15:09 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM
 support
Thread-Topic: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM
 support
Thread-Index:
 AQHcUkXayA+E33hY1EmsX/GuWX+dybUR8j8AgADxDfCAABPzgIAAA2hggAAJoQCAAABcgIAAEgTwgAAbNYCAAAHegIAAByGAgAABGOA=
Date: Fri, 5 Dec 2025 14:15:08 +0000
Message-ID:
 <TY3PR01MB11346478F338B7CDF1F683BA786A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251110132715.724084-1-claudiu.beznea.uj@bp.renesas.com>
 <19fda177-6c11-45d6-9dab-3f75edceda4e@tuxon.dev>
 <TY3PR01MB11346F5E49BF172AE78C55EAE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <50937606-46fd-4202-ad4b-9ede5bff76fc@tuxon.dev>
 <TY3PR01MB11346625CD598704CC36C63AE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <da64005a-e6fb-4bbb-a97c-e6c3ada8aff1@tuxon.dev>
 <TY3PR01MB11346820489C604B63A315E8486A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346E629B11BC5F812D32E0086A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <52bf094a-a656-4bef-bb22-f903578ecf9b@tuxon.dev>
 <TY3PR01MB11346C5EDDE82E779C69566BB86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <562eda90-6ca2-40b5-b1f8-fcc4034dd122@tuxon.dev>
In-Reply-To: <562eda90-6ca2-40b5-b1f8-fcc4034dd122@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB14644:EE_
x-ms-office365-filtering-correlation-id: 60084864-a2fc-4ea4-97ea-08de3408b257
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?a20wU2lOZlpSTndsVzlBajZrVW9aMjlTb3pHcWRMNmFIcGQ3UlYvc1dwd0hG?=
 =?utf-8?B?QkFXakcxYkk4M2cvNm1CRWJjNGoyOWMyM05SYmN1d1luUHdvZkJaOGMwNjBU?=
 =?utf-8?B?TVNoejFLZHFpbHVWS1diWXhydGZpUlZjaDRoNHBvRWUyMGN5bGRYL1czMEk1?=
 =?utf-8?B?aVAxaFNVTk90NFpoM1dMNU56TXU4c0ZuNmkrb0gxWGlseFlmbWp5UTNUY0tP?=
 =?utf-8?B?SWhTSndCWEM3dUY1a2lqYnpMZ0g0VmV3VmZqcUNCTW9GTERNL00wMWt1c29j?=
 =?utf-8?B?d29HQk1sUy84S3dGSEduaHJxR2Ird2U5ZEFYb2JkM09waEgvVlVmWUxZcS8y?=
 =?utf-8?B?dFhkRWIvSFlQejhOWm1NQW5wRHgvMWtqZ0pFeVgybDk5OC9SQm80c2xrUGxK?=
 =?utf-8?B?ZXRHbDN1TTZjYm5SRlhZMFFESi9wSmdlM09Gb0F3Q0J6MWhEcXR3bWlJSDdq?=
 =?utf-8?B?N2ZpR0JoRnRyZnBwSGVzbEppQWovMkJuSE02RVFNaXJXeDJINmlDcUFWNWdU?=
 =?utf-8?B?eHU0L1J4bldwUlJJNmZ6bSswVlJWU3JrdTFkQmRNM2J2RWgwckpacVFaYUk5?=
 =?utf-8?B?WXh6Z0tEeW1oZ1VHcnpsM2xmdS8wUTU1RUZDeHl4SVBxT05xOFpWemFXb3JP?=
 =?utf-8?B?QXhGVFQ3cjdpREZTQVc2cVZERHo5V3RNSkxGdE8rK3ZWVjROUWY3ZW5xUngv?=
 =?utf-8?B?dW9LTDViVXB1dnBaQ2xHQUs5cnk4Yyt4WnRPWG1CVXpHY0VtYzgvNUJBOS9n?=
 =?utf-8?B?dTIvTmVqbHJMZlFkZkNvcEgycHJLT284cVVVM1VqeDJRYjhOc2tURGNIQ0NE?=
 =?utf-8?B?UnZ4S3gydDhRNzRRSmNtVWFPWUNCY2YxWFhTcTFHZlV0M2xYV1p1RE5XbHhZ?=
 =?utf-8?B?Wm5TcUpXMlB1NXlnOVlYcGREdm9vQmZ3MG4yRVJybDR0RFVvSUJ2RUVONVhp?=
 =?utf-8?B?U0NoNHR0WU0waUY5S3Jld1JqZWlQVlRweDhKRVFMMmhLM3krU3dRcVpvK1FF?=
 =?utf-8?B?WVFWS25lTUNmaHVwSG8wMmF0U3VBZUQrb1RmazR4RThQa2htb2l4NFZNd0wr?=
 =?utf-8?B?c21uajFGRmRoK25KemFzQkxCUWlYVTVieTNUcjQxcXVVb1ZFak9vUnYwTnh2?=
 =?utf-8?B?VTBGdVpOQ1pWbE8wRW0xUzFZaUpnR0JYUkVERFFyaWxWTUlobEE4K1JwUkpa?=
 =?utf-8?B?RlpGZVp5Z0dwMGVxRnEyRHF2dWUwNUloMkRqVnIrZ0xpZXJyMVJjMUhCWlRr?=
 =?utf-8?B?UzZKcTZPM05zd3dUOHJUNDMvL2VXNUx6alNtMDNuWHI4R1BuRHdOOStBenhu?=
 =?utf-8?B?SkJDQXlrSlY0R0d6S3JiN3htSURxcWFhOU82M2ZDSzN0c0VrL2pza0xRMmFV?=
 =?utf-8?B?Q1U5QWgyTmRHNlVSL2taTUFQY1g4OEgzbWlxN0k1cyt4UC9WdURkc2NhbUFP?=
 =?utf-8?B?aHFMeW9lNnU1bklQeXkwZXY1OEs4U0UvcnorMmJYK0FUSEc3QlFmVHRlMlUr?=
 =?utf-8?B?Q1FLYjkzdzNPdWdHd1B1SnNlWUlJYVpkN2w4THQ3U3BHZXBzMnUzdmcxL3VR?=
 =?utf-8?B?YVVkd3d4M1QxTmZMMmFZVUs5aHhlRmxRMUlsd3FZL3Rzak9JRTJqZVhodmc0?=
 =?utf-8?B?bmVmZG5sZDNhQ3JaYzIrbW9OUEtWUjJOeGRyTllMQUk4NSs2VTFWT2lEem1R?=
 =?utf-8?B?VzBUdXRmeWpoWE5XQlV4VUFCaDRsbVJJNHgyT2xXMXZxSlBiTjc5MWVjSVhE?=
 =?utf-8?B?cEFaU1RTc3VaUjByckJySXFXeXdqaXdjZmtubW1ENVV2emhvZGxjdkV1K3Q1?=
 =?utf-8?B?elpYSzRReEppanBFZ3NDVEFXUlp5Ukg1Ri8yc2RlOU1RQTk1aFlZaHdka3VC?=
 =?utf-8?B?YnR4dzJDaTg4clAvK0VWbFpQdHBKTEJ1dW9vRmN3MGlxSDJadTNlUWJlTnJC?=
 =?utf-8?B?S3psM2doUWprelNxcmpPMGlReWIrMVBDTG1ESFFsVnhaWTRuWFNvRmNxYTlI?=
 =?utf-8?B?TlYzdFNlUkNZKzRCSWVhSHNJcHRnaGpyU2FYTzB1UitnVlk2dzA5YlMrRFM5?=
 =?utf-8?Q?9rWZTJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bjJHT1hDTXRkSzA2bWtjdE13SGxGeCt6STFLMlR0OXl5Y0pjUk8wRisyTlZu?=
 =?utf-8?B?NTFXSEpkUXU0Y1BRQTZzdWp3dnVHY1JUWVhQSW40WVM3ejJvVnE1Y05zQkQ3?=
 =?utf-8?B?eFhQVXd1RDFwK1dtcHR2ZlJJQkhRUDNmamROMXhBQWtSY0t3eEEzZy9QZzBk?=
 =?utf-8?B?RlVDdGFQOUlwK3psOWdqUzRrUXNaK2pBUjRZUExKNXVEZUZVK3ZPVjdDczlr?=
 =?utf-8?B?Ny9tU1BPYXg1N3N1U0p4Q0VuUDMycm1nbGN1SlQzRVNhRkc5OEI1ek0vdDVG?=
 =?utf-8?B?aklBUlVmckFOVlJzekNpNVVIRVNFN1Y0OXVGYUY5QmlwWW16amlLcjJpYkhH?=
 =?utf-8?B?eWtFU2psYU1kc3V5YXljMjNEMjNiRGE1S1FrTjRLRW5XR1ZNRkZwRGlpOEND?=
 =?utf-8?B?NzNkcUtrNkxkYitueWV6QXdIeXY1OGRiME82d2kySTZRQTFzQzNYT2V6dGFs?=
 =?utf-8?B?aVNSbmdMdGtwaFAvUGo3Z0p4VTJCaUtncEpablhwNSs2MGJCUzdXc0VJdDZo?=
 =?utf-8?B?SXNVdGRTNmEzcjkxWjBPZ1JNRlhhcG8xZnRKdy9pYzM4NUNTdkx3VXVjV0Rs?=
 =?utf-8?B?VzYxeGtqMVJrbWxCMmRTYkhYOWI0WjBIbG5YeFVURjlNNWVmTm8xQVVyVlVY?=
 =?utf-8?B?dUtzSkMyakN3UHRiak5xa1Qzek1rbDcwa3liT3ptd2dzTDhCUTM4R3FMZ3R2?=
 =?utf-8?B?Tkk3TFRpamR0N1VTcXF1MUNtN3NKcFhMUFlRSml2SmtZYXF3TGxzWmNNelRa?=
 =?utf-8?B?TWNydkZ5aHI1d0E3aTFobHNqS3dSMTB1a0k2SDFsTXVxWDRBV3JrRy9kQ1hl?=
 =?utf-8?B?OWJVb0xUQmRmVTVEQitHamZCVHh6a3lqak1SRTVyYW0xVGR4Uk5aQWMyd0gv?=
 =?utf-8?B?K3RHa0Y5VVA3U0ZFeGxsT002UWdycERZU3VpR3JJSGRKTlVGM1lHNFFmdFYv?=
 =?utf-8?B?aWJLb1paVkZYZWQ5Y0tXMTdQbkUyQ1JVbEN2MWFNMTBqcXBrZnAyOU1VY25z?=
 =?utf-8?B?NFdpbGl0SElZay9QTEI4RG96SnFjMXV0TyszcDErdVk3UXhuUU8vSXJ3Tkph?=
 =?utf-8?B?alJzSlJrd2ZPZy9oL3pWb0hyNndRYXlBeEFCN0NUbEJGRmNianpPQjNMdmto?=
 =?utf-8?B?bUZ3TUhDb1prTjZmSlU2b0FsaVg0RjVXcGxXTWpZVGY5VjBqWU9TLzRBRFQ1?=
 =?utf-8?B?Z1NHZHZKWlJZQmJpNlFrQnYxaXNMVSsrV05reStFVXNwK0hnYUt2NDR1QnR0?=
 =?utf-8?B?WlVtWm9UUmc1NXJHY3F2OFc2NkZ0UzdMTXZLclV5S291UGxldDFlRDNTdTkz?=
 =?utf-8?B?aUt6UE1iRmF5R1BVOUlkMGtQOExtVGlFbUZJQldISVBmMTVKb3JKcElJZ2xu?=
 =?utf-8?B?TGlZb05KNUd5RlBnWEhDZWJqREdSYk8vblFBVUxjYmhOZ2dpSmY3OStMYTd4?=
 =?utf-8?B?M2RtZDllZmhTQkZYV3Vsb3BnbW05ZkNjQVdsNW40VFBoMGZEUFBLY2pvQVpl?=
 =?utf-8?B?QkczK3Q4LzFsVHltamc2UmlSVmFPVEdSUmFJMXBydjhGV0xBbEgzR1pDcXY2?=
 =?utf-8?B?bTQrR0V2RzF2djdPcUpDV2l1Uy9jVzRoSkJWWmk5WmNETm5UcWgyV1EweHVl?=
 =?utf-8?B?ajlCeVNOQ3JrZmliNEQrendjTzBIWGdjbm9TdnZ1RDZkTGZPbkpNQWdrblJB?=
 =?utf-8?B?M052WWRTeDRkVFcyRVNldDdBQ0UzV1pVT2lRekpRck0yV3JLSWpLeTc5dit4?=
 =?utf-8?B?ZjBGMHZMcmRjN1F0alJKYXc5dVduOFZZZkh2RkNCMU1SemlGdGJCSzlwKytr?=
 =?utf-8?B?V3B1MHdrRW1HVTV5bzJDekhEWWZCY2NCZldIUFdsaW5lNE9BS0xibjVoS1Z6?=
 =?utf-8?B?bDRQVFJBSHBaREkrSW5CYTNJaitlUWdjMnc5Um1qNVZrNytlUUlRcmJHaEda?=
 =?utf-8?B?aUxVcnJoNXVLNTRHNTJXTUQrTHNubFZvQWJ1OEJHcTNtM1Z1NWdPTnMwUENu?=
 =?utf-8?B?YStHSU5zV0tVeGRuT3RlbTdORmhjQmNOZzQzd0NNQ2xUeXpiSXB3cGc3a0VK?=
 =?utf-8?B?TkVVK3oxYXZNcStCcE9MSVhKQXR4dVhQZ2ltQ3N3aXBuR3hOV1NLUERBb2ln?=
 =?utf-8?B?bVluSXc3N2h2MlV5cXE3TDFPVWR1amdIZGc2MDVLaXp3bmExZHdFejN0ampF?=
 =?utf-8?B?R0E9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60084864-a2fc-4ea4-97ea-08de3408b257
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 14:15:08.9131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cN/NZRlCe/uAtE8ZH+zfWdsPoE0/whnXyvYhQFeASz73534zqdFhcT8ZAj9ecE4DurJWWdnFau8LgEjieHMjx1DIMVHa5XUATPtm2AUsnh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14644

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDbGF1
ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiAwNSBEZWNlbWJl
ciAyMDI1IDE0OjAyDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMC8yXSByZXNldDogcnpnMmwt
dXNicGh5LWN0cmw6IEFkZCBzdXNwZW5kIHRvIFJBTSBzdXBwb3J0DQo+IA0KPiANCj4gDQo+IE9u
IDEyLzUvMjUgMTU6NDUsIEJpanUgRGFzIHdyb3RlOg0KPiA+DQo+ID4NCj4gPj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6
bmVhQHR1eG9uLmRldj4NCj4gPj4gU2VudDogMDUgRGVjZW1iZXIgMjAyNSAxMzozMA0KPiA+PiBU
bzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPjsgcC56YWJlbEBwZW5ndXRy
b25peC5kZQ0KPiA+PiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtcmVu
ZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOw0KPiA+PiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5i
ZXpuZWEudWpAYnAucmVuZXNhcy5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMC8y
XSByZXNldDogcnpnMmwtdXNicGh5LWN0cmw6IEFkZCBzdXNwZW5kIHRvDQo+ID4+IFJBTSBzdXBw
b3J0DQo+ID4+DQo+ID4+DQo+ID4+DQo+ID4+IE9uIDEyLzUvMjUgMTM6NTUsIEJpanUgRGFzIHdy
b3RlOg0KPiA+Pj4gSGkgQ2xhdWRpdSwNCj4gPj4+DQo+ID4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPj4+PiBGcm9tOiBCaWp1IERhcw0KPiA+Pj4+IFNlbnQ6IDA1IERlY2VtYmVy
IDIwMjUgMTA6NTcNCj4gPj4+PiBTdWJqZWN0OiBSRTogW1BBVENIIHYyIDAvMl0gcmVzZXQ6IHJ6
ZzJsLXVzYnBoeS1jdHJsOiBBZGQgc3VzcGVuZA0KPiA+Pj4+IHRvIFJBTSBzdXBwb3J0DQo+ID4+
Pj4NCj4gPj4+Pg0KPiA+Pj4+IEhpIENsYXVkaXUsDQo+ID4+Pj4NCj4gPj4+Pj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+Pj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUu
YmV6bmVhQHR1eG9uLmRldj4NCj4gPj4+Pj4gU2VudDogMDUgRGVjZW1iZXIgMjAyNSAxMDo0Nw0K
PiA+Pj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAvMl0gcmVzZXQ6IHJ6ZzJsLXVzYnBoeS1j
dHJsOiBBZGQgc3VzcGVuZA0KPiA+Pj4+PiB0byBSQU0gc3VwcG9ydA0KPiA+Pj4+Pg0KPiA+Pj4+
Pg0KPiA+Pj4+Pg0KPiA+Pj4+PiBPbiAxMi81LzI1IDEyOjE3LCBCaWp1IERhcyB3cm90ZToNCj4g
Pj4+Pj4+DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4+Pj4+Pj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4N
Cj4gPj4+Pj4+PiBTZW50OiAwNSBEZWNlbWJlciAyMDI1IDEwOjAwDQo+ID4+Pj4+Pj4gVG86IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT47DQo+ID4+Pj4+Pj4gcC56YWJlbEBw
ZW5ndXRyb25peC5kZQ0KPiA+Pj4+Pj4+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
Ow0KPiA+Pj4+Pj4+IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZzsNCj4gPj4+Pj4+
PiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+DQo+ID4+
Pj4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwLzJdIHJlc2V0OiByemcybC11c2JwaHktY3Ry
bDogQWRkDQo+ID4+Pj4+Pj4gc3VzcGVuZCB0byBSQU0gc3VwcG9ydA0KPiA+Pj4+Pj4+DQo+ID4+
Pj4+Pj4gSGksIEJpanUsDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBPbiAxMi81LzI1IDEwOjUzLCBC
aWp1IERhcyB3cm90ZToNCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gSGkgQ2xh
dWRpdSwNCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4+Pj4+Pj4+PiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24u
ZGV2Pg0KPiA+Pj4+Pj4+Pj4gU2VudDogMDQgRGVjZW1iZXIgMjAyNSAxODoyNg0KPiA+Pj4+Pj4+
Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwLzJdIHJlc2V0OiByemcybC11c2JwaHktY3RybDog
QWRkDQo+ID4+Pj4+Pj4+PiBzdXNwZW5kIHRvIFJBTSBzdXBwb3J0DQo+ID4+Pj4+Pj4+Pg0KPiA+
Pj4+Pg0KPiA+Pj4+PiBGcm9tIG15IHByZXZpb3VzIGV4cGVyaWVuY2Ugd2l0aCBzdXNwZW5kL3Jl
c3VtZSBpbXBsZW1lbnRhdGlvbnMsIEkNCj4gPj4+Pj4gY2FuIHNheSByZXN0b3JpbmcgdGhlIHN5
c3RlbSBpbiBmYWlsdXJlIGNhc2VzIGluIHN1c3BlbmQvcmVzdW1lIG9yDQo+ID4+Pj4+IG5vdCwg
aXMgdXAgdG8gdGhlIHN1YnN5c3RlbSBtYWludGFpbmVyLiBTbywgSSdsbCBsZXQgUGhpbGlwcCB0
bw0KPiA+Pj4+PiBkZWNpZGUgaG93IGhlIHdhbnRzIHRvIGdvIHdpdGggaXQgaW4gdGhpcw0KPiA+
Pj4+IGRyaXZlci4NCj4gPj4+Pj4NCj4gPj4+Pg0KPiA+Pj4+IEFncmVlZC4NCj4gPj4+Pg0KPiA+
Pj4+PiBUaGV5IGFyZSBzdGlsbCBzdXBwb3J0aW5nIHN1c3BlbmQgdG8gaWRsZSwgd2hlcmUgcG93
ZXIgaXMNCj4gPj4+Pj4gbWFpbnRhaW5lZCwgcmlnaHQ/IFNob3VsZG4ndCB3ZSBjb3ZlciB0aGlz
IGNhc2U/DQo+ID4+Pj4NCj4gPj4+PiBZZXMsIEkgYWdyZWUuIFByb2JhYmx5IGJlc3QgdGhpbmcg
aXMgemVybyBmYWlsdXJlcywgaWYgdGhlcmUgaXMgYQ0KPiA+Pj4+IGZhaWx1cmUgaW4gc3VzcGVu
ZCBwYXRoLCB0aGUgc2FtZSBkZXZpY2Ugd2lsbCBmYWlsIGluIHNpbWlsYXINCj4gPj4+PiBmYXNo
aW9uLCBhbmQgdGhlIHN5c3RlbSBuZXZlciBlbnRlcnMNCj4gPj4gc3VzcGVuZCBzdGF0ZS4NCj4g
Pj4+Pg0KPiA+Pj4+IFNvLCByZXBvcnQgdGhlIGZhaWx1cmUgYW5kIGRlYnVnIGFuZCBmaXggdGhl
IGlzc3VlLg0KPiA+Pj4NCj4gPj4+IEZZSSwgT24geW91ciByZXN1bWUgcGF0aCwgaWYgdGhlIGJl
bG93IGNhbGwgZmFpbHMsIHRoZW4gdGhlcmUgaXMgYSBwbSBpbWJhbGFuY2UgZm9yIG5leHQNCj4g
c3VzcGVuZCgpLg0KPiA+Pj4NCj4gPj4+IHJldCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQo
ZGV2KTsNCj4gPj4+DQo+ID4+PiBTaW1pbGFybHksIGlmIHJlc2V0X2Fzc2VydCgpIGZhaWxzIGZv
ciBhIHNoYXJlZCByZXNldC4NCj4gPj4NCj4gPj4gV291bGRuJ3QgYmUgdGhlIHNhbWUgaWYgdGhl
cmUgd2lsbCBiZSBubyBmYWlsdXJlIHBhdGggY29kZT8NCj4gDQo+IENvdWxkIHlvdSBwbGVhc2Ug
cmVwbHkgdG8gdGhpcyBxdWVzdGlvbiBhcyBJIG1heSBiZSB3cm9uZz8NCj4gDQo+ID4NCj4gPg0K
PiA+IEVnOg0KPiA+IHJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQocHJpdi0+cnN0Yyk7DQo+
ID4gKwlpZiAocmV0KQ0KPiA+ICsJCWdvdG8gcHdycmR5X29mZjsNCj4gPg0KPiA+IEhlcmUgeW91
IGFyZSBza2lwcGluZyBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCksIFRoZSBzdWJzZXF1ZW50
DQo+ID4gc3VzcGVuZCgpIFdpbGwgbGVhZCB0byBwbSB1bmRlcmZsb3cgZXJyb3IuDQo+ID4NCj4g
PiBTaW1pbGFybHksIG9uIHN1c3BlbmQoKSB5b3UgYXJlIGNoZWNraW5nIHRoZSBlcnJvciBjb2Rl
IG9mDQo+ID4gcmVzZXRfYXNzZXJ0KCksIElmIGl0IGZhaWxzLCB5b3UgZGVhc3NlcnQgaXQuIFN1
cnByaXNpbmdseSwgdGhlcmUgaXMNCj4gPiBubyBkZWFzc2VydCBvcGVyYXRpb24gT24gcmVzdW1l
KCkuDQo+IENvdWxkIHlvdSBwbGVhc2Ugc2hhcmUgaG93IHdvdWxkIHlvdSBsaWtlIHRvIGxvb2sg
dGhlc2UgZnVuY3Rpb25zPyBJdCBsb29rcyB0byBtZSB0aGF0IHlvdSB3YW50IHRvDQo+IGlnbm9y
ZSBhbnkgb3BlcmF0aW9uIHRoYXQgbWlnaHQgZmFpbCAoYXMgeW91IHByb3Bvc2VkIGluIHRoZSBj
YXNlIG9mIHJlc3VtZSBmcm9tIHBvd2VyIG9mZikgYW5kIGp1c3QNCj4gcmUtZW5hYmxlIGV2ZXJ5
dGhpbmcsIHVuY29uZGl0aW9uYWxseS4gSWYgdGhhdCdzIHRoZSBjYXNlIGl0IHdvdWxkbid0IGNv
dmVyIGFsbCB0aGUgY2FzZXMsIGVpdGhlci4NCj4gRS5nLiwgaWYgcmVzdW1lIGxvb2tzIGxpa2Ug
dGhpczoNCj4gDQo+IHN0YXRpYyBpbnQgcnpnMmxfdXNicGh5X2N0cmxfcmVzdW1lKHN0cnVjdCBk
ZXZpY2UgKmRldikgew0KPiAJc3RydWN0IHJ6ZzJsX3VzYnBoeV9jdHJsX3ByaXYgKnByaXYgPSBk
ZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gDQo+IAlyemcybF91c2JwaHlfY3RybF9zZXRfcHdycmR5
KHByaXYtPnB3cnJkeSwgdHJ1ZSk7DQo+IAlyZXNldF9jb250cm9sX2RlYXNzZXJ0KHByaXYtPnJz
dGMpOw0KPiAJcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChkZXYpOw0KPiAJcnpnMmxfdXNicGh5
X2N0cmxfaW5pdChwcml2KTsNCj4gDQo+IAlyZXR1cm4gMDsNCj4gfQ0KPiANCj4gdGhlIHJ6ZzJs
X3VzYnBoeV9jdHJsX3NldF9wd3JyZHkoKSwgcmVzZXRfY29udHJvbF9kZWFzc2VydCgpLA0KPiBw
bV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCkgbWF5IHN0aWxsIGZhaWwgYW5kIG1heSBzdGlsbCBs
ZWFkIHRvIGltYmFsYW5jZSByZWZjb3VudGVycyBmb3IgdGhlIG5leHQNCj4gc3VzcGVuZCBleGVj
dXRpb24gb3Igb3RoZXIgc2NlbmFyaW9zLg0KDQpUaGVyZSBpcyBubyBwZXJmZWN0IHNvbHV0aW9u
IGZvciByZXN1bWUoKS4gRm9yIHN1c3BlbmQoKSwgd2UgY2FuIHB1dCBiYWNrIHRoZSBzdGF0ZSB0
byBwcmV2aW91cyBzdGF0ZS4NCkJ1dCByZXN1bWUgZG9uJ3Qga25vdyBmb3IgdGhlIGZhaWx1cmUg
Y2FzZXMuDQoNCkNoZWVycywNCkJpanUNCg==

