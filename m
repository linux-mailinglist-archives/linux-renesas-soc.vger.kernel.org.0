Return-Path: <linux-renesas-soc+bounces-25653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2302CAD33A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 13:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D35630184D1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 12:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C8131064B;
	Mon,  8 Dec 2025 12:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TZOVx7Nc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011040.outbound.protection.outlook.com [52.101.125.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B71225775;
	Mon,  8 Dec 2025 12:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765198452; cv=fail; b=kekDMCFXzIdXX6IhaCqoeI/e3LGbAvy0rm9BV69Rulkkxd2p/m+P1OV2PlKCOxgsAwvE3vxqhX52KbdNklk6TgZZPoSv+aqulh5PZK4RcT+1xY0vWQO4GUu8gEHJEzQeWovJgluM9F36DubhveW7TgHqf5psUrbQNv2/rd6gGdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765198452; c=relaxed/simple;
	bh=KwlzKsAXkEZFT3NoHzCzSGvZ3Iy3txkO1AlAqP16bCQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n8zloAIMLIwoD0RFVAn7SySlqjN/QR2mXKiMFyiD4u4Lr3/iCy3n+CihNbdY1hpYcLyYtx+E7T6KLyP2hAvaMgSNhjfRrCzV6Au6D8FgWXe0aJzNVelH5HaNi8hQ4I1YuQodWpsTRUXvHil0cLLG9XNfawo/MB3Z13Y5qUBWDrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TZOVx7Nc; arc=fail smtp.client-ip=52.101.125.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHhhoSqAOGR/MpAFyQxpoiksCfJ3S8Fvc0ltKye5CXMTZcr/KgJ8tsKx5PprcnbtyKedhvhBwccV6M98t/7LwTwS0SyxhJusKTgoIImra0/r0iHvQ/3pTn9PN+SHuRetA9VnnPS3REtLEc4oT/m3pHfSAiK38AWC41UsvkB8sPokriJwMfErxtF4f3vtHDHzk8XnF6KLwnh1etpz137OB+eNqgxiApCcshwZglX/AMDxo0sVCr31WWz88SxdhXAhK/X4Dc+WAubmCRS161+95eopEN561Jzz02iJFmHG8gh6F65ifpxLOsw0q4DXh7EtJJ6RD1QYTN1590+PCcRjaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwlzKsAXkEZFT3NoHzCzSGvZ3Iy3txkO1AlAqP16bCQ=;
 b=FRCV22636D9cNX38jeb7lDfI53FwZE2eV8r1NpyKaQug77V6/ZQRQTXF/cEPS27ngGkAQ/1EKXo3+nCT4b3WCu25Wi/6FB20hkOPkM3wVQFe8x8diwfS9tQDJUfJud7O+ruRV6nq/vL3moWo1b9pq313/civlgA89DnOSqbpKfrC+MeZrvMUwia1fbHqmIbS2cBWzcndLK0WnFLlxMtZKqSICDKI3ZxJT6gcj5ll3pk7CBsYSnokx+wurb8ccdjVTI6tZe+mijWwBnnneEP3vzxcQjMed5h0pAOC8bnzd0W+9RFHC+lqZbNgTYP+kIXGNZ8z5tZKEKnrxsuTqxNQwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwlzKsAXkEZFT3NoHzCzSGvZ3Iy3txkO1AlAqP16bCQ=;
 b=TZOVx7NcqkmYwyH6HhQ4DDLk/DupXjtyDx1mLPk01tmmemTQoQVrBK3UDnPth4e2ZrRFjdC5WsoiB34ki+72ac1V3rdGVoBkStQLDGArF0S5+TDGVp4WRbSwXjQY/4gIdDS52fABnMl2A0BJFstmR1QfWzgxA/7SX9bwKUBdwOM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12418.jpnprd01.prod.outlook.com (2603:1096:405:f8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Mon, 8 Dec
 2025 12:54:03 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9412.005; Mon, 8 Dec 2025
 12:54:03 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, biju.das.au
	<biju.das.au@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 2/2] clk: renesas: rzv2h: Deassert reset on assert timeout
Thread-Topic: [PATCH 2/2] clk: renesas: rzv2h: Deassert reset on assert
 timeout
Thread-Index: AQHcaCtibMJqsnntuUOEg2wJmjZhwrUXmU2AgAAFEgA=
Date: Mon, 8 Dec 2025 12:54:03 +0000
Message-ID:
 <TY3PR01MB11346F15E5E8B79E52640FA0986A2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251208101356.101379-1-biju.das.jz@bp.renesas.com>
	 <20251208101356.101379-3-biju.das.jz@bp.renesas.com>
 <88cdf9195a8bf397ff631d316d9f6560f2cbab5c.camel@pengutronix.de>
In-Reply-To: <88cdf9195a8bf397ff631d316d9f6560f2cbab5c.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12418:EE_
x-ms-office365-filtering-correlation-id: c17e0abb-3b5b-4a30-f88a-08de3658dda2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?eHdJbUhkYkZYZ3VTVko3TGZtM1phM2pHa29qZldiZTEzdHVWVTFRbmVJcCtq?=
 =?utf-8?B?cjh2MzlnOTh2VFhRYTN6YzhhY3hNVzJWT29qNzZyZnZUeTVodGltdldwWUxp?=
 =?utf-8?B?bndZbGhqMWViNGM3OGlvdE1BUmJybitBMVJQeWlGRFp3N0t5djdQeWd6YlV1?=
 =?utf-8?B?K0FpMGFlTk5mLzgrRTJubmJ6b3ErdHR0OUNsbHpYKzl4T0RHY05Mb1BJSmpx?=
 =?utf-8?B?MnpVMmZ5b1QwSnVVNlkrTi83cEF2YW1UQ2hUR1FnRTNrdmUvNGE5NFI0aU12?=
 =?utf-8?B?aSszNXZUTmtGR0pVQkdUaWZkaXVhMjFzV3g0cS9kaXhRcTgyN3czSkV6cjY0?=
 =?utf-8?B?R0ZZRzdqWisrZXg5QnhWNEpHQVpLWWxHYk5uTkZOMUVQOHMxVVNxaXFIUFhy?=
 =?utf-8?B?TkNhVzYrc3BnaklLZWFpMkYzQUpXN3E4LzBDR1dTV3BGRUFHUGN3MXVJYVBr?=
 =?utf-8?B?U2FpTnpCWmgxRmdKN0s0dWJKdzRXN0VXWUxzRGZXSzQ0cW5kUFZwbXFDTjcw?=
 =?utf-8?B?V2l4a0ZkLzQwQ0QyaTRkS0xBVEMxY1FZSTR4cXpCMWFlbVpNK0VKdVpBRzhT?=
 =?utf-8?B?YmExTE1TYlF4NFNwZFNQUzRJdHpKZnlSc2JXblJQa254RlAwNE5GNFhOb0tN?=
 =?utf-8?B?Sm4ranhScHQ5WHdTYkdMcngybnFtb3ExQjdWUThuVXZlRzlZc0VuNVZGUlJX?=
 =?utf-8?B?UGpXNFJFZ3FNV2JnOGZnMDdDbDJnTHUyVlJxQlZ0aktmNy9ZVHZLQk1MbXR2?=
 =?utf-8?B?OTR6UWFZM010VWVycEJkY3dzUXhzbGUxQllwWkJPWWc0VW0yUG5HUU01OFEz?=
 =?utf-8?B?cjA0QXp2VmwzTHl2UGlOTjBKdGZrZkFIUXE3b2J2aytXYUdCSzBHQ3NvT1c5?=
 =?utf-8?B?RWtHaVBicXR2UDJXd2tXek03RUZyc1UwZERpYW5sR3phdUlaU3JYaFErZEM5?=
 =?utf-8?B?YTNkblV5UkJTZFE0cCtOZGJraEUzMS9qM3pvK2xDRDh4eXRIUW85WjY0QlBw?=
 =?utf-8?B?ZFFTVkh4SURZR3k3RG5LV0RFVjIxeHNyaG51WnFtNS9wWmo5TVdBcHY2dW5i?=
 =?utf-8?B?MEpscmZwTkFlQkN5QjM0UTFoR0FuRTdwWnFQYUVmN0VOcWtVR05mMnlXMW9Q?=
 =?utf-8?B?cjZUUFZXbk0rRHRWaHluNzMxVElrR1ZubzJGTHZsVm5IeFJraG5uUkdQNWlG?=
 =?utf-8?B?azY1di9CMUdLSEN2ZFRMNzJGekY4YXVEaWNSQWFIaU5zc1J3a3Nnb0RaaGVN?=
 =?utf-8?B?ZXY1UEpielRKS1lSS0xsWmRUQjVnN3FEOFhUaGRPL2FBZDhqeFI2N2xQd21T?=
 =?utf-8?B?K1cvcEQ5dDh1ZmhSZ0M1Nk5Gb2t4WTlHK2ViTVdIeCtBZDdUeDI3SnozbWE1?=
 =?utf-8?B?U3B3Wjc1STlpUlBVaUZIMTMrUGNUTHJNMlpJbHJCellEeWZkcCtBODJVOVZV?=
 =?utf-8?B?MTJvWXcxcG8yTC9KektBVjhLWGY5Q2pWT2MydUgzM2Y4ZWJCbnpxYnlwWUlQ?=
 =?utf-8?B?V1FyRnNObVlpTUR2Yi9JK3kxVFlKbXpVV2RjMW15dGYweGJSZzBoaFZSWW1k?=
 =?utf-8?B?cnhEMCt3dUhrdnIyK1BTQm1NUnE0N3F4Ny9kUUlmeGVaakZHOXBCYzkwdWh5?=
 =?utf-8?B?bEpLV1ZXMUZCa01kL2VNZVNxY2owOEtHS2l1Rk9neWNsc3NzeUhCWUNUVFgr?=
 =?utf-8?B?cVNBbnkycnFNaGNjemM5d1BCTVBjV295bk5XSFFlUXlqT2M3aDVFTnA3ZFYr?=
 =?utf-8?B?ZjR2eGQ5UEt6eXAvUnVOV2lLMHF6K1NPeW9sNUd1ai90L1d5NXgrZzZYY1Y3?=
 =?utf-8?B?eGxwQVA2eTd3N2J2V0JUN3ZuQTRPV242RFB6UzNseUtOOHU2b3A4bW8vaElJ?=
 =?utf-8?B?bzVFdTBSNXZ5cXk0eW9SRm5xdWR4T2d4a0ZSenFDRjlyR3RVWC9ST3ZQRk5j?=
 =?utf-8?B?NUMrQjE3blZYaGNYL0JNWHZ3RWl0UTJNM1NuSEVlYmhaZUpZMWxuK1hYOTlx?=
 =?utf-8?B?NGY0SVE2VnZlY0JPVDFFSTVFMFNPbEg0T1FKeUhhWVEwVkhlQmF5dFdaRW1u?=
 =?utf-8?Q?N7xV+n?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QVZrcFoxbXBIN3BPcFRDTFJHNjBzazZtTkVBcjVGS1ZPMHRpY1JsZFVYVkRz?=
 =?utf-8?B?akErSU0zWk5wUDNST0VzaWx1VVI5TlpmRE5xNlZqZ1ZiRzBjcVgxL3VPRm55?=
 =?utf-8?B?MVlDQVc4ZktKUXh6dm5PTFJpSFhLWHFEcGY1UFVGQjhVblV2Rjhtb21zN3BC?=
 =?utf-8?B?SjRtU0tjcGpIRFZ5Ny95WnA2SGJiSDRxeUMzSXp6Q2VJSGRzUFkza2tDU20y?=
 =?utf-8?B?cVVuM3JnMDFpNjlZeUlKQXRZbUxlL0tUWHU4WmJ0UkhDTDBZd2RxU21IMVVp?=
 =?utf-8?B?dTdHVGcxMlVPd1dBeDBpNUtQdW9RT1VNaklnbGFxUVh0dzJqeXJFS00vRHNs?=
 =?utf-8?B?N3prZVNkeklFbHNicHpya2RKL1Fwa3ZHQ3ZSOE43VEVWZnZIR0cwR2Jicis1?=
 =?utf-8?B?SmpYS1d0U05hdzh2S2ZIcUVwK1ZWSXVGN1J4d1VwVVQ3N0VQYU91UTlXVXUx?=
 =?utf-8?B?NndvZXBidzBGMEZKVUJhVGVOWFl6Smh4OVV2SzJWZzRPdXQxVENhVVViNWxQ?=
 =?utf-8?B?aS8vYkRlSEFvcWw2ZzB3eGVhTC9iaHI2R1FuRjJuTWpxS0xrZlBVZVBWNVBv?=
 =?utf-8?B?aXo1aUVGV1pFSmtUVGpGdXo0Yi9wa29XUk5HQVQ1WDhxSGpQY05wUjUvaXE5?=
 =?utf-8?B?K1R2TmVWckRmYVN6WmsxVys0TkRiVXBDcVBOcGhoVGxFUGJxMDhxNzdEWENi?=
 =?utf-8?B?dkcyNUI2NkFSRXVsM0VybkRyTml0eGhEOEZON2NwMXJhMXJZV3dUd1JOTFZK?=
 =?utf-8?B?cFhvWUpiclQ4bHo3MC8ycnVLN2hsUm9aWitVamFuTUtYNExHM2FZZFZwbHJ3?=
 =?utf-8?B?Q3g5SlFCaC9WWG9DYmtiOWNtcVlNQUxEdHRKUUl5aEowOFZzRjNIZXBOSXFw?=
 =?utf-8?B?Zzl1TzUxUytPckhYOFlJeDdoaDNMMW1hRTBnZVlKeEpmSVN3NFV3RktjMFZJ?=
 =?utf-8?B?c29jZHdqOGpWaXpDaWpBSyt6Yk5tV1ZGbWFxeFg4VFlHWmwraXF2dVpTYUVE?=
 =?utf-8?B?SVdZNWFNZy9MeWpoS0YvRG1xaU5Gejk5dDVyWlNXdlBaVVBzUC8rVHRuMXJv?=
 =?utf-8?B?bmFHcHVOMU1RNUxyaEt3UVcrbUFJdm9kL0U2T0c4L0tBTllNeVJUbjJyN3la?=
 =?utf-8?B?T1VNZGNGSFh3TFFKN3BjR1RibGJzVWxFMmxtdk9SUkxPUmtNb3ZUNXR5bzh6?=
 =?utf-8?B?WUNvYkhDRktEOTZ1bVl2bjAyQ0VrVjhxaGlCSzdFUGdoZmg2amdaYkw5dVM2?=
 =?utf-8?B?NExtOCtvdUYzaHpmeXBIMzFMMUx1MlZQeThKaHJ4MVlJdHZIcDRTMDZuQVhH?=
 =?utf-8?B?RGNIem1GbENuVWlZZlJvS2J1NDlqK1c0QUJKaklrdWZPR0ZOK0Q0NnByb25t?=
 =?utf-8?B?VnJjdllwSEhzRE5ncmJDMlBEamViZld4azZrYnVzNlNCYTE3QmhuNlR0S2V3?=
 =?utf-8?B?QWJDakhlV1lsc2lERmZHTlNXRkpqR2xUTVdBNWRWUmxiRmdwUGNmSHptS0lZ?=
 =?utf-8?B?ZHFrRFdjZHpIeHZUQjhLWFA0YzE0SG1YaXoxWWFVZ0dDdDg1MnNjbG0xL2VJ?=
 =?utf-8?B?SGx2Uk5VbTc4T0FHc1hDZkx1dGJ3ZVNCTVQ1Y3h1TFloR1Vub2tMUVJ3cGY4?=
 =?utf-8?B?Tmdmb29SdU10NmNUZkFpWjB0WHI2djNkdktaWTFHZXRMNFJEOGlMNXhvSXBO?=
 =?utf-8?B?cXUvb1FnWlVoL1hVT3ZEQWM5YmxGTDRkbHM2WWkrdjJsWXlYenZGbGZLcnNp?=
 =?utf-8?B?ZDJ4YnFHVVJ2TVJGWDhzTnllS1dZeCtjakpoUDVMUFJpQW5YZmpJNko5cTJk?=
 =?utf-8?B?S3AxQm9GMFExdmNaRnBWY2dVKzI4dkJuTkt3UStrMmhHcGQvR2xQeitxdStq?=
 =?utf-8?B?NGVhQVNZblRhSUlma25kNmVzTXJpRSt6YkdZQmxUT0J3L3l0aS8xblZhb21O?=
 =?utf-8?B?QXBOamNQcER6R2lmSDFNRnJlTXFjRlp1UW1xTzZuYUZWNDg4NEdzSk45RHdM?=
 =?utf-8?B?VmlhTFA4MjR5U1dIN0hxb3VvMS9xTG4rc1NPejdKcGRkSHdRL0FBejZCbmEv?=
 =?utf-8?B?T2VSZlZNVzlzeTc2ZkFIMzY3NWVnRWkrRHdWVVljQUxXUlRVS2k3THVLWmRS?=
 =?utf-8?B?OUoxc1p5YzBFc0VDSmFMTFhaSmRuR1hDTC9IeTR4WTNkRy9OUDlXcklza01x?=
 =?utf-8?B?cGc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c17e0abb-3b5b-4a30-f88a-08de3658dda2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2025 12:54:03.6053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZMuLcTcPZIzW3SUELv8rxmixg3IQLe2dV8nhPQSrBaChFTzQxECBBLUKwWDNK6lrPb4CT99wHkNNT/30tf9YLGZFxwZu5OYcQs0FWa+rbCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12418

SGkgUGhpbGlwcCBaYWJlbCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPg0KPiBTZW50OiAwOCBEZWNl
bWJlciAyMDI1IDExOjIyDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBjbGs6IHJlbmVzYXM6
IHJ6djJoOiBEZWFzc2VydCByZXNldCBvbiBhc3NlcnQgdGltZW91dA0KPiANCj4gT24gTW8sIDIw
MjUtMTItMDggYXQgMTA6MTMgKzAwMDAsIEJpanUgd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gSWYgdGhlIGFzc2VydCgpIGZh
aWxzIGR1ZSB0byB0aW1lb3V0IGVycm9yLCBzZXQgdGhlIHJlc2V0IHJlZ2lzdGVyIGJpdA0KPiA+
IGJhY2sgdG8gZGVhc3NlcnRlZCBzdGF0ZS4gVGhpcyBjaGFuZ2UgaXMgbmVlZGVkIGVzcGVjaWFs
bHkgZm9yDQo+ID4gaGFuZGxpbmcgYXNzZXJ0IGVycm9yIGluIHN1c3BlbmQoKSBjYWxsYmFjayB0
aGF0IGV4cGVjdCB0aGUgZGV2aWNlIHRvDQo+ID4gYmUgaW4gb3BlcmF0aW9uYWwgc3RhdGUgaW4g
Y2FzZSBvZiBmYWlsdXJlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2Nsay9yZW5lc2Fz
L3J6djJoLWNwZy5jIHwgNSArKysrLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvcmVu
ZXNhcy9yenYyaC1jcGcuYw0KPiA+IGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yenYyaC1jcGcuYyBp
bmRleCAzZjYyOTliOWZlYzAuLmMwZWUyZGNjODU4Yw0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvY2xrL3JlbmVzYXMvcnp2MmgtY3BnLmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5l
c2FzL3J6djJoLWNwZy5jDQo+ID4gQEAgLTEzNjYsOCArMTM2NiwxMSBAQCBzdGF0aWMgaW50IF9f
cnp2MmhfY3BnX2Fzc2VydChzdHJ1Y3QNCj4gPiByZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYs
DQo+ID4NCj4gPiAgCXJldCA9IHJlYWRsX3BvbGxfdGltZW91dF9hdG9taWMocHJpdi0+YmFzZSAr
IHJlZywgdmFsdWUsDQo+ID4gIAkJCQkJYXNzZXJ0ID09ICEhKHZhbHVlICYgbWFzayksIDEwLCAy
MDApOw0KPiA+IC0JaWYgKHJldCAmJiAhYXNzZXJ0KSB7DQo+ID4gKwlpZiAocmV0KSB7DQo+ID4g
IAkJdmFsdWUgPSBtYXNrIDw8IDE2Ow0KPiA+ICsJCWlmIChhc3NlcnQpDQo+ID4gKwkJCXZhbHVl
IHw9IG1hc2s7DQo+ID4gKw0KPiA+ICAJCXdyaXRlbCh2YWx1ZSwgcHJpdi0+YmFzZSArDQo+ID4g
R0VUX1JTVF9PRkZTRVQocHJpdi0+cmVzZXRzW2lkXS5yZXNldF9pbmRleCkpOw0KPiANCj4gVGhp
cyB3cml0ZWwoKSBjb3VsZCByZXVzZQ0KPiANCj4gCXVuc2lnbmVkIGludCByZWcgPSBHRVRfUlNU
X09GRlNFVChwcml2LT5yZXNldHNbaWRdLnJlc2V0X2luZGV4KTsNCg0KRm9yIHRoYXQgSSBuZWVk
IHRvIGRlY2xhcmUgcnN0X21vbiBmb3IgaGFuZGxpbmcgR0VUX1JTVF9NT05fT0ZGU0VUKHByaXYt
PnJlc2V0c1tpZF0ubW9uX2luZGV4KSBhbmQNCnJldXNlIHRoZSByZWcgdmFyaWFibGUgaGVyZS4N
Cg0KPiANCj4gPiAgCX0NCj4gDQo+IEhvdyBkb2VzIHRoZSBoYXJkd2FyZSBiZWhhdmUgd2hlbiBf
X3J6djJoX2NwZ19hc3NlcnQoKSBpcyBjYWxsZWQgb24gYW4gYWxyZWFkeSBhc3NlcnRlZCByZXNl
dD8gSXMgaXQNCj4gcG9zc2libGUgZm9yIHRoZQ0KPiByZWFkbF9wb2xsX3RpbWVvdXRfYXRvbWlj
KCkgdGltZW91dCB0byB0cmlnZ2VyLCBvciBjYW4gdGhpcyBvbmx5IGV2ZXIgaGFwcGVuIGZvciBh
c3NlcnRlZCA8LT4NCj4gZGVhc3NlcnRlZCB0cmFuc2l0aW9ucz8gDQoNCkJhc2ljYWxseSwgdGhl
cmUgYXJlIDIgc2VwYXJhdGUgcmVnaXN0ZXJzDQoNClJlc2V0IENvbnRyb2wgUmVnaXN0ZXJzIChD
UEdfUlNUX20pOg0KMGI6IFJlc2V0IG9uIChyZXNldCBhc3NlcnQpDQoxYjogUmVzZXQgb2ZmIChy
ZXNldF9kZWFzc2VydCkNCg0KUmVzZXQgTW9uaXRvciBSZWdpc3RlcnMgKENQR19SU1RNT05fbSk6
DQowYjogVGhlIHRhcmdldCB1bml0IGlzIHJlbGVhc2VkIGZyb20gdGhlIHJlc2V0IHN0YXRlLg0K
MWI6IFRoZSB0YXJnZXQgdW5pdCBpcyBpbiB0aGUgcmVzZXQgc3RhdGUuDQoNClRoZSBtb25pdG9y
IHRyYW5zaXRpb24gaGFwcGVucywgb25seSBpZiB0aGVyZSBpcyBjaGFuZ2UgaXMgQ1BHX1JTVF9t
IHJlZ2lzdGVyLg0KDQpJZiB0aGUgX19yenYyaF9jcGdfYXNzZXJ0KCkgaXMgY2FsbGVkIG9uIGFu
IGFscmVhZHkgYXNzZXJ0ZWQgcmVzZXQsIHJlYWRsX3BvbGxfdGltZW91dF9hdG9taWMoKSB3aWxs
IHJldHVybg0KaW1tZWRpYXRlbHkuDQoNClRoZSByZWFkbF9wb2xsX3RpbWVvdXRfYXRvbWljKCkg
dGltZW91dCB0byB0cmlnZ2VyIGNhbiBvbmx5IGhhcHBlbiBkdXJpbmcgdHJhbnNpdGlvbnMuDQoN
Cj4gSGF2aW5nIGEgZmFpbGVkDQo+IHJlc2V0X2NvbnRyb2xfYXNzZXJ0KCkgZGVhc3NlcnQgdGhl
IHJlc2V0IGlmIGl0IHdhcyBwcmV2aW91c2x5IGFzc2VydGVkIHdvdWxkIGJlIHN1cnByaXNpbmcu
DQoNCkkgYWdyZWUuDQoNCkNoZWVycywNCkJpanUNCg==

