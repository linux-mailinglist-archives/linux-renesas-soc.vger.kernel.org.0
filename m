Return-Path: <linux-renesas-soc+bounces-9722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA16F99C740
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 12:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 797D8283FEF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 10:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17DE175D2D;
	Mon, 14 Oct 2024 10:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ReKfApJM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011061.outbound.protection.outlook.com [52.101.125.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4574F1714BC;
	Mon, 14 Oct 2024 10:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728902223; cv=fail; b=o05wbCO7cgCvrTwCHeNLMqgCeSyPrQcTZyCK9Oouevad+hb4eiC0GCdcsXCUZ2zRxtjK+hm910x+IoL/LT5/S6jnGRdVF7ght5qr12X/Ebal1+8khlk0inB+cvt6TicswcMnE7OCpMOqzCv+OoyQdqyxi3pIQ1BTTO4XaGH01QQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728902223; c=relaxed/simple;
	bh=n/TG6b1NnUwi3UPwiD3a/LGGxCuQpnDH+XDoYIVwL8c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ucPRpdwsrutNqnxeFR30fl5EMddnPBSfBFLWuO5EbVenejptn7qLjfQj+vrcK2vnWKlPPaZtrMcMaCs4FifN6djjACpZvkVuPcNW/8qG5Vfc29rVsnaAWYQXOIB96jSgvUoe/MtIM+75oxify8DAtBEXDyDI9NwXDUqKVit0HJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ReKfApJM; arc=fail smtp.client-ip=52.101.125.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oc1VLxe6Xwvs9wPJ4b8UVX5lG84XSbXCgQ7MmTtbPS1pAwkD6Ay7MQ55HkPFr5z1g+PJs1BXj6TbUrG9V56M5lheOaFULpmNQCMAuVqT+LPnoqsb3LvvFCBecJt/0vQBJssPO13mMiIZgx6gj/r7N8PHhewEwgAtbcOxchq0UhtvDGlAN2Wtd+4DsywHk9zPMqG0vfcJSK7GNuppwKsqnn2YQQ3mI6rb5dKkof5x2yrBaY9LcA599pqwKUyfHD1nPb6gSguY56y3LuXpKV5U6cy0SB04YXW6pKisfUmeIziGLdKt2Z0hi1h7knldVkBN/yS9UZ3lFb++hBcUpfsK0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/TG6b1NnUwi3UPwiD3a/LGGxCuQpnDH+XDoYIVwL8c=;
 b=RjYbeLXQnf5pUyo3ByCYEXCwgEA/8EAvIAl/gYxHQJbHwLq/05u8BkD8VFzXqIbIMnjYJ1ccRleRTz+BbMi8xSeTBO3wMrmv07aEb09B0iVrzJ7zskl/X7rdbmdLGGvLUY0Ji73LBJKkO/onYYiYXwuRQ8RdjY4j1q+i49t7a/YoLoXsLuVik84T02DDis7FLQDFHAP+F/9dzkzrOBmwurFsqb+59lW2HNC4wCTAHzhOex0mgZIFNEc5Xpd95NyRi0z/eKe9f/hnR5eKggqMq2QpFvb+vJx10d1uwc5S2/97L2Eie5JfyRdzXSVIf9sRqG+gypK+4XGxefRAXtXVXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/TG6b1NnUwi3UPwiD3a/LGGxCuQpnDH+XDoYIVwL8c=;
 b=ReKfApJMwriXSBkSvwgI5bUYpJjpMJC7+3Yqgqn75bA4ggKuVBkFkM0bWBc8QhF3TZYZ7Xla+KuhglkdV4obNJQioLb4UA0kX57BdXRtQyeRgE6iA5PIk51g9SnPxli8iFWyo8kgauADx0jYCixxzWd7Gxhuj+DFQ1prYTNpLkc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB12838.jpnprd01.prod.outlook.com (2603:1096:405:1ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 10:36:56 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 10:36:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Hien Huynh <hien.huynh.px@renesas.com>
Subject: RE: [PATCH v2] clk: renesas: rzg2l: Fix FOUTPOSTDIV clk
Thread-Topic: [PATCH v2] clk: renesas: rzg2l: Fix FOUTPOSTDIV clk
Thread-Index: AQHbG/mHKVM27/WiLEqb195bZnu0obKF4ZgAgAAhcpCAAAp3AIAAAOSA
Date: Mon, 14 Oct 2024 10:36:56 +0000
Message-ID:
 <TY3PR01MB113461894D98B0DEDC86FB81786442@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241011162030.104489-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXM8KCd7Fi9dzQt=YUEu_bdwfZGEkaRS1_PaN7ECNFEGA@mail.gmail.com>
 <TY3PR01MB11346125FF19898F34BD7137F86442@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUii5NfFWOC-4KNMq5Hz-DXnUtYZNuu+=BDDBgNtTq40Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUii5NfFWOC-4KNMq5Hz-DXnUtYZNuu+=BDDBgNtTq40Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB12838:EE_
x-ms-office365-filtering-correlation-id: 4e5a8dc1-b3ce-493b-5128-08dcec3c203d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WTNsNTZxOVpjcFNPbkV0NjZxS1B3aERoZWJvKzBRendleHh0aVlWNmdKbjQ3?=
 =?utf-8?B?NVZlWXNmN3dqenhQNHQxOVFwVndINDQycGpGbjBJZklGOC9Sd0VSSXhKaUtu?=
 =?utf-8?B?OUptUG91dUluM2sxOTY2MFptU0R3K3hyUXlhMm1mUFBVR2k3OGNxdjczMUhp?=
 =?utf-8?B?YTEyREZTWnpiNjhnODdkbXJ4MjJOejhmM2lyeHRpL3k5K3hZaGU0YTI4Y1d3?=
 =?utf-8?B?RHJTUEE4aGhFbWd2bkFnWmpXSHVRcGF4MXpSNzdjVVk4LzNjd3lGM1ptcjJ1?=
 =?utf-8?B?UmNtSitKdEdkb1hoUWRsRFczdkNRaXhOMFVMTVdmMzJ5SlJCWCsyaCtIVWZv?=
 =?utf-8?B?TG03RGU2QW5zaVNuaEY5dTRCWkd2NXNHc2dYYnRrYk5BdFZiTEV5MmpMN2Qx?=
 =?utf-8?B?V2RDTkNPWjRreVpPOThVTkIwdVJTamltNTlST2pHWVBmQXZIbFJUQkhJblR3?=
 =?utf-8?B?bWwzYzNLNDlsWGJ2c3kxdFFhNnVXSUFxNVg0TCtzYms5ajJoSjNuV29Dem9o?=
 =?utf-8?B?NEh1TXM5em5FTU0wc3d4Nk4yZTArTlJOVi83UFE3Q0xBUkpZQnc5WkVHZWw1?=
 =?utf-8?B?cWE0cnFoOEExT2UyVWVEWlYyWHQ1cU5YcWdmQTRBbnNVVlpXQXYxdVpJZTdI?=
 =?utf-8?B?LzgvaXFFN3A2cnhwTGZWeXZ2WmdaRXh3NEJXNXlSNE5NditYc2VwbjhoVFp2?=
 =?utf-8?B?TzR0ZWEzZ1pxVk5GYnhTUFJUZ0dMTkNLQkJzd0NVd241SndvOUtxajNvRSth?=
 =?utf-8?B?ZnFkYy85clVDWlJZSXo4a09WYlZrQVpSS0poVnJlUFhZaUg0SVI1RG0xU3hX?=
 =?utf-8?B?dzJ4QlhFY081cW5SbXAxVVBWbXZqOVJiWk52bXN2ZFByaVhHc0lvNUplU0VJ?=
 =?utf-8?B?NkVFbHFFS1NtWURNTHVTRC9PNVQ5Ly9PZW1yZFNMamp4QXYwUnR4b2JYVXRt?=
 =?utf-8?B?ZC9PSEtNQ1RmRVZDT1phTFVjMkF4RkQyOXpUZUtxd1ovRnkyamRHR0Erd0NJ?=
 =?utf-8?B?ZDdIUmJSWkwyTkkvME1UR3FudnhKRFhkTGRWTDl1RkJaU3hEVjY0SktacVNB?=
 =?utf-8?B?eHB1QVVuSnVKdkJJOGNmUDRZdXo3b1FGN3BuVlA2QjJhUEFWMDUvWDcveWhF?=
 =?utf-8?B?Qzg4bytwbTN2SlMzcVBlSkpaZkNLdTN3Q2oyZ3RraUsrWEdzbWJMUlZYWFVa?=
 =?utf-8?B?SE5jWGMyMEtHQk9xSzNFaUlCcW9INUFBMWdCSHNheTlFWjJwcG16RC9Vd1lO?=
 =?utf-8?B?R0ZUcEFjRHNWalN5ZDNNSFhzTGxpMGpJcE5la3hKaWNQR2pUb01QRGFnUkN4?=
 =?utf-8?B?TnhtNlNEb1U0M1RTRklFOFM0dm9qakZSc0ZrTU91eThwUjQ1UGl4bW5iSzdh?=
 =?utf-8?B?N0c0bE5DbjJ5WGV5N1U2MzZxOW1JWm4vZGRBeUVyMndsYUU5b0V6STZyNVA0?=
 =?utf-8?B?WWdZVkc4YjM2S1N6d0dwbjV4MGxsek9oRzRERitQWHNmQzBXa2ZoS3NrTVFD?=
 =?utf-8?B?WVNKNzFHaC9kU2lyL2J6Z0JtUkc5cHhySXdVU1dndVFpSGRIQXlqK0g5akFZ?=
 =?utf-8?B?N2hub04rMWVFc2pxSWtncjN4MTJ2QVU4bVc2K3ZBZFVMaldET2k3cHZZZXp0?=
 =?utf-8?B?bHYxYVZnVlQyU0l4UXZGajJvaDFmMVN3d295WHo3OVp6QlZMVFE3OTZCeTV0?=
 =?utf-8?B?OHo4VXFhT2h5UUcyVU55WDJBdE5MS3hYOEc1a2Y4ZGE2YkFieXVoSGtMZzFO?=
 =?utf-8?Q?VtmXaF3Ebm1v/bgDQQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Tkhwb2RKSlFaTmYrZEJQMmFLVmwwbjRxOHQ5YVlMbmZIa3psQnRVc2Q4K0xa?=
 =?utf-8?B?RmtiOE12Qm45ems5aDFETWpqNXZSS3AyYjl1eW5PTGNZelJFUHBkM1Vnems5?=
 =?utf-8?B?S091MDZEWlJqYTJXM3ozUHJ1aTdzTXNkbkM0ak5Ha1NySkRuNUJPQnZBL2xN?=
 =?utf-8?B?ME1ETXcxMjkrdmdhYSs3UVRJNE4wYUtFaG4yY0VzMEdRcG9NY2E0aFExR0NT?=
 =?utf-8?B?YkcxbGx5L29RaVlhREkrTkVXMVNzV2QrSmwxemtObTRraTI4M2laWTVpWkJj?=
 =?utf-8?B?bnl1Y2pBWUowVDQreWttdTVqZlVFWWhoNGU3bjRmRTRaK2kvYUpEQXVUQzV5?=
 =?utf-8?B?b0h5Vk9ZaE55TE9iZVcyamdRMkl4MCtYMGdpcnA3MnkrVVBmUXZzQzBZU0R2?=
 =?utf-8?B?YTNVTElSZ2N2ZURXVnU5aXNMUkYxdm9OTllqbXRGSTlMSFJFR25qQ0RHWlRR?=
 =?utf-8?B?N0Y5YUlzazVRRExKSDhrK245Sm8xQVBwZmRFT2Rwa2I5YmU5R2hTTmtCNFA0?=
 =?utf-8?B?TGIwZmMyZFUwcUJKYVYramd2M3gvYVd6MlllZVpac3Q4RGVoaDNjMkRkeVdq?=
 =?utf-8?B?b1BISENCYWl3dk0rWFhwQzlxdkl4dTdoQUhXNTFGRElCVXZsWGVTRzhlQjdI?=
 =?utf-8?B?eDY0d0hwbWVBdVNVejNvRWNuOXdQLzJ1U2U0d25wM3ZkajdXZmhwS29oOWds?=
 =?utf-8?B?NzFncDF6WlJOVXZjWEZHNjh1YVo4WW1WYnRINFVXOUJqWkdhS3N3ZnpmaEE0?=
 =?utf-8?B?QVpUcy82a0pjbm5KdTlPeTZFRUxPLy9RcU9qN0pvc3ZTRFBPdTBvM0hhWEsr?=
 =?utf-8?B?bFBoR2hVSm13MklpU2ZMNjBRRnFXRUtKWGJ1RGFkak5oWW9ZUVFmVTFUUTVn?=
 =?utf-8?B?cTVNTm5haDV3N3IrWGlPUVRleDFVRmVZUGdrZGJyL1JvamlWV09aZlZ3bWE4?=
 =?utf-8?B?MWVBQUJIc3pOSmtjUnh5cGlVZkRGWUhaREwrMGw4MGVQdjIvUWJvUnlGNTZk?=
 =?utf-8?B?QVFKbjNxZDlVcFlwSmZPUmFuaTlUM1YrZ25xVjgxN1dmTnZ3M2JtbXBMa1No?=
 =?utf-8?B?Yng3aEFJaVpHVlFyUGhMNXgrcktkZFR2TDluNTZJSGt5UVI3cHlZMEFIdW9r?=
 =?utf-8?B?RGQvanJ2Q0J1MlBUY0FQS21XaVFianJKWmRkOGtYY2V1QnYzYkR4V1luZU9z?=
 =?utf-8?B?ZHZmRUF5NWJWV1BpcUpISGpKaUpNa01xTDFrY0h4VmszdkY1ZzU5OC9OTmhG?=
 =?utf-8?B?SloyREZLODY0NWJ1Z0xOWHU3ZlAzTVFTNTlGK1BmWEN5OHpzVGxkeVhmUmd2?=
 =?utf-8?B?OTlxZmpIOHA1dzVwYkYvb2I4REpjSmJ6d2ZINnJjL2FmUWcxRnJDeVExQTV2?=
 =?utf-8?B?T1dNZktUV2tNTHhVU1U3RjMwQVBaUjBobW1EOTNka1BMc1JmSnFJQmJiMDg5?=
 =?utf-8?B?U0lPNkVXRFJMckxmNUVMOUl5NSs3aWNmeG1tYWlvTFdqMUlaZjhnbEswTDg0?=
 =?utf-8?B?TTVXc0lLUUlYZ0oxNmxlRHlvZDdwYTJPemlWVXJNR3hqa29zSUVGa0ZuK2V1?=
 =?utf-8?B?cVIrQjVOaWkyZlVoRXQvcGhXOEViZTBySFNuNHZ4Y2R2aCs5YU9TenZZQ2ZJ?=
 =?utf-8?B?WVExN1VMcVlGRCsxRVcrKzYyRVA0V2dGaUxYNWZWSE9OejFYU0lEckMxZWs2?=
 =?utf-8?B?U3pVazYwMm12WE5IbzhiVDZuNUpFOW5CNWZLN2tvMTkvbDE4b2tMaHE5MWpX?=
 =?utf-8?B?NjRFWEVzVk9TRy9tdStjd3M0a1U3QU9pY0tIWUFzd3NvYXloZjR0Z2NMcjVN?=
 =?utf-8?B?aTQzeXBVdGJ4NitQckVYcU1sSDI4aWpJakM3REtndHIwTHdWQUpiRmVxeGt0?=
 =?utf-8?B?ZXFZbkYvdUJZU0ZucjFXWEppdW1PcmQvcEZMRm1WWk1VaEhzZ1E2c1pLK3lS?=
 =?utf-8?B?WVZBcjBZdHRZcy9Pa09GdnV0M2VuRzdxRTVPcWxUdFVkYzFTWElRQXJZd3c2?=
 =?utf-8?B?WXBUZzBvYk9xcnpobGZxdURtdjBKUCtydXlJa01RbVlUa0xvdm1TVDJ3TWEw?=
 =?utf-8?B?OUxTanF2cS9UVHU4eHRWRnAwL004QzBDdGdIZGQ2dHNnVmZ2bmg1YW9UR1Zs?=
 =?utf-8?B?dTdxVXNIZWp4cDV2RU5RdXJpbnRGOGZtNldjbVlvZmIxb1BELy8reXRTQmNX?=
 =?utf-8?B?V3c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5a8dc1-b3ce-493b-5128-08dcec3c203d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 10:36:56.2297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LuT/tjTdGiZ7vQjuEkwLxsnoQKd1gXv1TYFkxyq3xWp74nTyZZYr/gcqVgVlxOeMFhlgs70LU32bcJAc+b7lCJJ+iLqXjPCUjbCF8OHsL2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12838

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogTW9uZGF5LCBPY3Rv
YmVyIDE0LCAyMDI0IDExOjIxIEFNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIGNsazogcmVu
ZXNhczogcnpnMmw6IEZpeCBGT1VUUE9TVERJViBjbGsNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBP
biBNb24sIE9jdCAxNCwgMjAyNCBhdCAxMTo1NeKAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPiBPbiBGcmksIE9jdCAxMSwgMjAyNA0KPiA+ID4gYXQgNjoyMOKA
r1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+
IFdoaWxlIGNvbXB1dGluZyBmb3V0cG9zdGRpdl9yYXRlLCB0aGUgdmFsdWUgb2YgcGFyYW1zLT5w
bDVfZnJhY2luDQo+ID4gPiA+IGlzIGRpc2NhcmRlZCwgd2hpY2ggcmVzdWx0cyBpbiB0aGUgd3Jv
bmcgcmVmcmVzaCByYXRlLiBGaXggdGhlDQo+ID4gPiA+IGZvcm11bGEgZm9yIGNvbXB1dGluZyBm
b3V0cG9zdGRpdl9yYXRlLg0KPiA+ID4gPg0KPiA+ID4gPiBGaXhlczogMTU2MTM4MGVlNzJmICgi
Y2xrOiByZW5lc2FzOiByemcybDogQWRkIEZPVVRQT1NURElWIGNsaw0KPiA+ID4gPiBzdXBwb3J0
IikNCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSGllbiBIdXluaCA8aGllbi5odXluaC5weEByZW5l
c2FzLmNvbT4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gdjEtPnYyOg0KPiA+ID4gPiAgKiBJ
bXByb3ZlZCB0aGUgcHJlY2lzaW9uIGJ5IGRpdmlzaW9uIG9mIHBhcmFtcy0+cGw1X3JlZmRpdg0K
PiA+ID4gPiAgICBkb25lIGFmdGVyIGFsbCBtdWx0aXBsaWNhdGlvbi4NCj4gPiA+ID4gLS0tDQo+
ID4gPiA+ICBkcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5jIHwgMTIgKysrKysrKy0tLS0t
DQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcy
bC1jcGcuYw0KPiA+ID4gPiBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMgaW5kZXgg
ODhiZjM5ZThjNzljLi5hMWUyMmQzNTM2ODkNCj4gPiA+ID4gMTAwNjQ0DQo+ID4gPiA+IC0tLSBh
L2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9j
bGsvcmVuZXNhcy9yemcybC1jcGcuYw0KPiA+ID4gPiBAQCAtNTQ4LDcgKzU0OCw3IEBAIHN0YXRp
YyB1bnNpZ25lZCBsb25nDQo+ID4gPiA+IHJ6ZzJsX2NwZ19nZXRfZm91dHBvc3RkaXZfcmF0ZShz
dHJ1Y3QgcnpnMmxfcGxsNV9wYXJhbSAqcGFyYW1zLA0KPiA+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyByYXRlKSAgew0KPiA+ID4gPiAtICAgICAgIHVu
c2lnbmVkIGxvbmcgZm91dHBvc3RkaXZfcmF0ZTsNCj4gPiA+ID4gKyAgICAgICB1bnNpZ25lZCBs
b25nIGZvdXRwb3N0ZGl2X3JhdGUsIGZvdXR2Y29fcmF0ZTsNCj4gPiA+DQo+ID4gPiBXaGlsZSB0
aGUgcmVzdWx0aW5nIDY0LWJpdCB2YWx1ZSBmaXRzIGluIGZvdXR2Y29fcmF0ZSBiZWNhdXNlDQo+
ID4gPiB1bnNpZ25lZCBsb25nIGlzIDY0LWJpdCBvbiB0aGUgdGFyZ2V0IHBsYXRmb3JtLCBJJ2Qg
cmF0aGVyIHBsYXkgaXQNCj4gPiA+IHNhZmUNCj4gPiA+IChyZXVzZSEpIGFuZCB1c2UgdTY0IGV4
cGxpY2l0bHkuDQo+ID4NCj4gPiBPSyB3aWxsIHVzZSB1NjQuDQo+ID4NCj4gPiA+DQo+ID4gPiA+
DQo+ID4gPiA+ICAgICAgICAgcGFyYW1zLT5wbDVfaW50aW4gPSByYXRlIC8gTUVHQTsNCj4gPiA+
ID4gICAgICAgICBwYXJhbXMtPnBsNV9mcmFjaW4gPSBkaXZfdTY0KCgodTY0KXJhdGUgJSBNRUdB
KSA8PCAyNCwNCj4gPiA+ID4gTUVHQSk7IEBAIC01NTcsMTAgKzU1NywxMiBAQCByemcybF9jcGdf
Z2V0X2ZvdXRwb3N0ZGl2X3JhdGUoc3RydWN0IHJ6ZzJsX3BsbDVfcGFyYW0gKnBhcmFtcywNCj4g
PiA+ID4gICAgICAgICBwYXJhbXMtPnBsNV9wb3N0ZGl2MiA9IDE7DQo+ID4gPiA+ICAgICAgICAg
cGFyYW1zLT5wbDVfc3ByZWFkID0gMHgxNjsNCj4gPiA+ID4NCj4gPiA+ID4gLSAgICAgICBmb3V0
cG9zdGRpdl9yYXRlID0NCj4gPiA+ID4gLSAgICAgICAgICAgICAgIEVYVEFMX0ZSRVFfSU5fTUVH
QV9IWiAqIE1FR0EgLyBwYXJhbXMtPnBsNV9yZWZkaXYgKg0KPiA+ID4gPiAtICAgICAgICAgICAg
ICAgKCgoKHBhcmFtcy0+cGw1X2ludGluIDw8IDI0KSArIHBhcmFtcy0+cGw1X2ZyYWNpbikpID4+
IDI0KSAvDQo+ID4gPiA+IC0gICAgICAgICAgICAgICAocGFyYW1zLT5wbDVfcG9zdGRpdjEgKiBw
YXJhbXMtPnBsNV9wb3N0ZGl2Mik7DQo+ID4gPiA+ICsgICAgICAgZm91dHZjb19yYXRlID0NCj4g
PiA+ID4gKyAgICAgICAgICAgICAgIChFWFRBTF9GUkVRX0lOX01FR0FfSFogKiBNRUdBICoNCj4g
PiA+ID4gKyAgICAgICAgICAgICAgICgocGFyYW1zLT5wbDVfaW50aW4gPDwgMjQpICsgcGFyYW1z
LT5wbDVfZnJhY2luKSAvDQo+ID4gPiA+ICsgICAgICAgICAgICAgICBwYXJhbXMtPnBsNV9yZWZk
aXYpID4+IDI0Ow0KPiA+ID4NCj4gPiA+IFNob3VsZG4ndCB0aGlzIHVzZSBtdWxfdTMyX3UzMihF
WFRBTF9GUkVRX0lOX01FR0FfSFogKiBNRUdBLA0KPiA+ID4gKChwYXJhbXMtPnBsNV9pbnRpbiA8
PCAyNCkgKyBwYXJhbXMtPnBsNV9mcmFjaW4pKSBpbnN0ZWFkIG9mIGEgcGxhaW4NCj4gPiA+IG11
bHRpcGxpY2F0aW9uPw0KPiA+ID4gU2VlIGFsc28gdGhlIGNvbW1lbnQgZm9yIG11bF91MzJfdTMy
KCkgaW4gPGxpbnV4L21hdGg2NC5oPi4NCj4gPg0KPiA+IE9LLiBXaWxsIHVzZSBtdWxfdTMyX3Uz
MigpLg0KPiA+DQo+ID4gPg0KPiA+ID4gPiArICAgICAgIGZvdXRwb3N0ZGl2X3JhdGUgPSBESVZf
Uk9VTkRfQ0xPU0VTVF9VTEwoZm91dHZjb19yYXRlLA0KPiA+ID4gPiArDQo+ID4gPiA+ICsgcGFy
YW1zLT5wbDVfcG9zdGRpdjEgKiBwYXJhbXMtPnBsNV9wb3N0ZGl2Mik7DQo+ID4gPg0KPiA+ID4g
VW5mb3J0dW5hdGVseSB3ZSBkb24ndCBoYXZlIGEgaGVscGVyIG1hY3JvIHlldCB0byByb3VuZCB0
aGUgcmVzdWx0DQo+ID4gPiBvZiBkaXZfdTY0KCksIHNvIHlvdSB3aWxsIGhhdmUgdG8gb3Blbi1j
b2RlIHRoYXQgKGZvciBub3cpLg0KPiA+DQo+ID4gQXMgcGVyIFsxXSwgcm91bmRfY2xvc2VzdCh4
LHkpIHdoZXJlIHggaXMgdTY0IGFuZCB5IGlzIHUzMg0KPiA+DQo+ID4gSW4gdGhpcyBjYXNlIG1h
eCB2YWx1ZSBvZiB4IGlzIDMwMDBNSHogPCAyXjMyDQo+IA0KPiBCdXQgdGhhdCBpcyBub3Qgb2J2
aW91cyBmcm9tIHRoZSBjb2RlIChhbmQgZm91dHZjb19yYXRlIGlzIHU2NCBzb29uPykuDQo+IEFs
c28sIGlzIHRoYXQgZ3VhcmFudGVlZD8gV2hhdCBpZiB0aGUgdXNlciBwbHVncyBpbiBhIDRLIG9y
IDhLIEhETUkgZGlzcGxheT8NCg0KMTA4MHBANjBIei0tPjE0OC41TUh6IC0tPiB0aGlzIGlzIHRo
ZSBtYXggZG90IGNsb2NrIGZyZXF1ZW5jeSBzdXBwb3J0ZWRbMV0uDQoNCjMwMDBNSHogaXMgdGhl
IHJlc2V0IHZhbHVlcyBvZiB0aGUgcGxsLg0KDQo0a0A2MC0tPjU5NCBNSHogYW5kIDhrQDYwLS0+
Mjg1Nk1Ieg0KDQpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC90cmVlL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwt
Y3BnLmM/aD1uZXh0LTIwMjQxMDE0I242MDgNCg0KPiANCj4gPg0KPiA+IGFuZA0KPiA+DQo+ID4g
eSA8IDUwDQo+ID4NCj4gPg0KPiA+IFNvLCBkbyB3ZSBuZWVkIG9wZW4tY29kZT8gQW0gSSBtaXNz
aW5nIGFueXRoaW5nIGhlcmU/DQo+ID4NCj4gPg0KPiA+IFsxXQ0KPiA+IGh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L3Y2LjAtcmM0L3NvdXJjZS9pbmNsdWRlL2xpbnV4L21hdGguaCMN
Cj4gPiBMMTAxDQo+IA0KPiBZb3UgbWVhbg0KPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9s
aW51eC92Ni4wLXJjNC9zb3VyY2UvZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1pbWFnZS1jb252ZXJ0
LmMjTDQ3Nw0KPiA/DQo+IA0KPiAgICAgI2RlZmluZSByb3VuZF9jbG9zZXN0KHgsIHkpIHJvdW5k
X2Rvd24oKHgpICsgKHkpLzIsICh5KSkNCj4gDQo+IEFuZCByb3VuZF9kb3duKCkiDQo+ICBodHRw
czovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4wLXJjNC9zb3VyY2UvaW5jbHVkZS9saW51
eC9tYXRoLmgjTDM1DQo+IA0KPiB3aGljaCBzdGF0ZXMgdGhhdCBAeSBtdXN0IGJlIGEgcG93ZXIg
b2YgMjoNCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMC1yYzQvc291cmNl
L2luY2x1ZGUvbGludXgvbWF0aC5oI0wzMA0KDQpGb3IgRElWX1JPVU5EX0NMT1NFU1RfVUxMLCBA
eSBuZWVkIG5vdCBiZSBwb3dlciBvZiAyLg0KDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9s
aW51eC92Ni4wLXJjNC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jI0w4MjYNCg0K
Q2hlZXJzLA0KQmlqdQ0K

