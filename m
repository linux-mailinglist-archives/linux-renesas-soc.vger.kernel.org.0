Return-Path: <linux-renesas-soc+bounces-22006-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA2BB8322D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 08:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5108721CA4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 06:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3EE2D97BF;
	Thu, 18 Sep 2025 06:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UYkMplLx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011016.outbound.protection.outlook.com [52.101.125.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161502D94B6;
	Thu, 18 Sep 2025 06:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758176836; cv=fail; b=tCA9LYcomviEbz104deMP/5EsKLsGmyYLcLYzhXrVl7BfOlD/IUDZJprM5IrTVOlO2VsqGV7f3WaYoUEYz3tUIErWJJXDRN+/vjTFrYvXQkVZfuKVhG940FvTv12/pWp5AJq4S03lbiL6cA+KWyZC+hDCfDsnPGdDQTlBJzL3VQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758176836; c=relaxed/simple;
	bh=VO1S66kKSSDd4eOEFtgL3L29Ln0R6vCjDTlfkRbymL8=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=pjMA/sS9dCZqKuv8PB0FmojqgYzUIUPH6pkJjfXCo6Dw2XhBEZcc3VILaztLCD2dqXkHH+xKDgf0Z90+AW2T7zluHltkjTc86xkzXxLyZLM2pwM5adIGmNKHcDv7wAK9QRNZDIuXZviNjPcBPR428rZtiYs5Ku7fDYc4iG6Qz28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UYkMplLx; arc=fail smtp.client-ip=52.101.125.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2RtawGtQZwCbvd9JAmIbyybsBEWfwfQGwIQtrMSbmIXuRwLtHelec7HfJB9VlLjWMGlg7DDBPjS8Blx574EvESbB9Xl4cG8nnztCXVL2pgiRNg+tK8Ie+mFrtulSnIPkqPBtds2Q2tApI+7QnhF/xfmEcAe4ZiMZeZnrJBuOgOXFmqP8YKYZaVc5RpTD74WMUofNjosTR5mm7ZEy9HOGWefcQA5QWXOC3UIcb7mhxC802TBOQyYQQsb2AcqGjTP6678yXXgp9k1ebU3OqY1SmwyDa5ltwl1nMzXh64sNk19/Jzl+wnydYa6e3TjURSQGiyuPH0TmumH/DraO0FbJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VUoCK/tF4rKhbX7DRyeRGBAdLHIwSADVygK49A8V8vI=;
 b=uo6RkXeUoAr18we0TNPZUIQc6NZwUtWt7OeQk98g9FTk07BAljrTCeLk6kr5GxDvIFC6Cv45sjPbOpeTi39dCnR5hJ0Hd7eDlcQ34g+WTIo+lfmz1Xdl0qQkmDaN8IJ+foGmkhkzTKLe5SLUd8YfgwlY50XjlmzF/0mpwMtf7JL2RPIOzXXPGYvn3naMOOGG5BNnpBYpEzAL3Rmd8NfcYZeo1chj/9bhQSAxo+XawSg43CrQePqjQYgzGPWog8XHZM4bxdVCSa0Lkt3LgvcMGmlJizgNqv/iBTDlv/rD/cDQ+5VsQVNqwVgNOw5mmBnG/y4Rr+DUXxSyOT8LXPA0Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUoCK/tF4rKhbX7DRyeRGBAdLHIwSADVygK49A8V8vI=;
 b=UYkMplLxpQmzS/3jSeSldAKR4VVyTDWeVcEPuW9rbMhLxAOgeqDPLY40BdhWsDE9ldi3DA9JNqd3IQkAc7veS27ovEtjarxExnIwh8KKGRFezmgwABA9Ghn1iifsHX6Ob+rhZGC3kO34FkmNRZRH7Y8iaVMN4DH3LJSJ+vbzXBg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB16214.jpnprd01.prod.outlook.com
 (2603:1096:604:3ea::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 06:27:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 06:27:12 +0000
Message-ID: <87frcknum8.wl-kuninori.morimoto.gx@renesas.com>
To: "Liang,  Kan" <kan.liang@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>,
	Jiri Olsa <jolsa@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Leo Yan <leo.yan@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
In-Reply-To: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 5/7] arm64: errata: Expand speculative SSBS workaround for Cortex-A720AE
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Sep 2025 06:27:12 +0000
X-ClientProxiedBy: TYCP286CA0292.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB16214:EE_
X-MS-Office365-Filtering-Correlation-Id: 96423299-1a80-44ca-4e72-08ddf67c6749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dk/O3QZIq8f7qRFMpalbG7AdtqEaamP240LdZ6XpRa44X9fzGt2ic4hi2I3Z?=
 =?us-ascii?Q?houTK3OL4DW//PxVE2dKg2QSEJXqFUCpyNPDST1BitT9uhm5buKt4hT3wDfB?=
 =?us-ascii?Q?NAI76Wu72w4IiqjJI63lg4OHpFhXuhUlF9EQDTV672PP5iST7wCd/Eup4Gaa?=
 =?us-ascii?Q?2GKaO20MrXOf8SD6xCdPOxsEsIAm8oWvUqr2Hjg3VBYcBXqlyekHbDKFnGaI?=
 =?us-ascii?Q?EmIDOiF9j8SjF0R3ionUIZ//9YOdy3Q//VNqqnIKljxTGtwUSWFZxJ4T1kym?=
 =?us-ascii?Q?6qQ/WvMGb/dtI+qokyX8pziCUN9ga+pTrSxS3hgpF/oigd0gvFQCKGS4/sgs?=
 =?us-ascii?Q?QbAwpetzYifUoUe6e5HSxX4aG22yXTDZRhttgSa6gvJJrPl6vtnBrTDr5/fJ?=
 =?us-ascii?Q?qExflerSIT0U1wNG6TV3Z5H7Lcj6QVL9vxQ7m9YEmIoav/jiF+MdfkcEX+8Q?=
 =?us-ascii?Q?lFJTyTuGb5RN24eObuI7GolfV5GHA0mbm0SQVbnp2/u7toOnQaYsEoqKPoNt?=
 =?us-ascii?Q?VGvhMkizhuc+CbtoUc7FwVZgVhTBiM5+MwZW7iwJIBtMWjzapWquh0McY7nd?=
 =?us-ascii?Q?1WRdAWPd9gIaKA6tpgaBmTVVqOCEstSDaclb+u3E7Io2neK4Q4FDuKT/D2yb?=
 =?us-ascii?Q?bcoXb3XqyTc1SbnEV10imKHnbimm6lzscB11fo4Sk9eMcqX9siGZxBUvrBYr?=
 =?us-ascii?Q?dBEDojzNI6DKNCfZD8r6FYmJLAUBVssg0MHowpqgjaOivm1vEJG+7uvtrPu2?=
 =?us-ascii?Q?c9yl+HJvkZd1JD7D65zncOdN4QIDyB6lU8QTet74os3kB30MOU1yfGm1I+N4?=
 =?us-ascii?Q?uyZEP0CPg7V3Uhkz3F2lIgMeQcn2fsII1vqRXZdbBYXY5qHi16110YKbM9bp?=
 =?us-ascii?Q?o8PEfURWSZ7jbEmtSMg8d4aJ+Qr3Lm53PV+blt7g9SRRPUQc0zhVK2sdHCYG?=
 =?us-ascii?Q?w1bi41sdOMpriB7sKHEe8wmO8DJKlsFqT9QmP5YiOPZeAC7pb0yjrxB66qKo?=
 =?us-ascii?Q?05yTqv5h7Bd4VIkUDtxkJtnHhvCYgp6RexJiDKLQQHDw3BVqQFRjw1i8WCpy?=
 =?us-ascii?Q?P++VIqlxP9ycm/vEEbPLNyGPXOzzydiElwkclj/+LpAY/beqG/xuf/QymEGh?=
 =?us-ascii?Q?QkE2427toKd8hAgTL1Vot+/jOdSXwv1/zL669k/+Y01B5JN1mNfcegs1ke4P?=
 =?us-ascii?Q?BbPsYYiYfT8klnpOBwdo/FLEwZvBtf87zLskh61zseTob4qswa23+GaigUIc?=
 =?us-ascii?Q?XGBeqcQ0h8xzh9oQrl1k0jiQ+ZCQEjv5pK8xu02QjXPUH3EPNxKTv4Fo+0XK?=
 =?us-ascii?Q?gFGFKkRUf08v/FfLgJGtDeHpLzxWxPMCqRdripskNt3UXItDCZssaMM1cLYk?=
 =?us-ascii?Q?Aj+/JEABoiPfpHQ/s8/fDK8vDncYi1ZslIt1ZEYWb4EZ6YZ+s4WjoH6k8BEK?=
 =?us-ascii?Q?MJiNrQ4QBZFcn3p0cPy2cBjADaOuHYuJO3Y/EzwZ6DcG2wVqqz9xIaYAOtQ5?=
 =?us-ascii?Q?BH8mRd5SZ+KllMc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g7CzGPNbYYKjbe52dftzoYWiIEIKPOxhlqHcZG9mMfYJARTdUm2mfV/q9lsK?=
 =?us-ascii?Q?K15fabWqBYRr7KmLYe+Tr4cIDv6YejN2SXPOJlJdKqFdFfMA6ji5Isy26EuX?=
 =?us-ascii?Q?fJS7tXpiXuBSseagvxhefKx73M59hcD4X0QyaYPC6352KITrnfCO8KqmkO79?=
 =?us-ascii?Q?2b75D+iJ447T3p1LKxwv37hWMxbizp9hFjXRNfDhDbEKLuPI84hboQE8tggU?=
 =?us-ascii?Q?donhFyLYqZKXOigLR4U74n18K2eKJUMitJw6ny4Oa5rtQ9/V8aIgZ2ZeYWj2?=
 =?us-ascii?Q?CufuvKXvYxwwwLZwPFyf+OgT8X43rcfuV3oqxiNm01rZ0+pyKLBPWUkhdr/a?=
 =?us-ascii?Q?99A4SHmrhV0A5Ued+lxnqHPJjjhWq8segBFqbrZZ0qFvTlsdVwuowAkE8YaZ?=
 =?us-ascii?Q?0f59F6fpbWY/K30wRoFQbR3c4ud2bFAVviey7Nyg50gyyb++DM1y/QwznBZe?=
 =?us-ascii?Q?3g8dzF+6N9wY6b01xORSDS1cyNhknSi3DtEbDJOEQVP9dammJHOm2ywFMzuy?=
 =?us-ascii?Q?Ho/fdLwD5rD85wdboOmIRSnUprVP8wakoVoV3JgZyCC9wVdHr0sYZ0BKvaR4?=
 =?us-ascii?Q?6imgzJUryuNQGyqpbAITL7KoBRT74r463EF0R/qrifvh/CRNRyOpBMOiJFHg?=
 =?us-ascii?Q?dH/04kBQINn3FZH8ftQDmJlhGQ45oKtY+Zeg9qQhuX919oNYnJiVDrW7KFGl?=
 =?us-ascii?Q?K1+TJPY63Fyhxmb8qkARLJ3lsKZiIv5qZ1WjKB9hpWcJ03W7NcW0HCanlPh3?=
 =?us-ascii?Q?aiL64iB3c7AwazL7/SoNXZCqBemanU6Wn8NRsgqerZXxovRQWBHTl7FLPkih?=
 =?us-ascii?Q?qD8+FipVHzI4T+9/317Qy4d751chnZQBKVb/QxbwPAwZu6hkGJt9/E3KP/Pn?=
 =?us-ascii?Q?5K4SkJrZdj6swSWuXPKJPs9hQzz147MpkWAvehbBug5ye+lzeuJawtxrsCXj?=
 =?us-ascii?Q?+LAdwuLwqeKk3TCwIBlYRd8LWtlFfJfKtD4hh9unOzviaYKUwAABa21QKv9d?=
 =?us-ascii?Q?nLI5vEhYn31dHaQs/Q5SIS1IKfFPJ5pg8RtzDd7ZUijuOhSaDSmI+F2H3T7T?=
 =?us-ascii?Q?wg2j90bHRhXFfSO/ZKEP3tvvqEYgIo0fZLhZrEUNj6g3f8ZChcwn6sNXSDO4?=
 =?us-ascii?Q?NTgtVXWJlUnjaz8MRNSBZetA6CXLCVvoxQNWzNcXm7oTVtTvu3sgVytVzX+b?=
 =?us-ascii?Q?w3gZClOgCn10iIlZ51TViUuFBNvrDezJFoomRGgUeWj+C1BkPLGjIiwt1gz0?=
 =?us-ascii?Q?aRn2sw9DityiChEQBvz1QtKaPyMieVa9bkyEqJDKi9dRbhGsf4Uq+5aSF2dM?=
 =?us-ascii?Q?Pk/FnSkJqeyJeRLWNyp511iiGFz4moyd0BQABiIS86REXadcxX164GN9dH//?=
 =?us-ascii?Q?k6FEg5rrY2R8tynsntLUc+W1Njzn4xoznP/n5Qt335fR/46eJPQmfrRyHBHx?=
 =?us-ascii?Q?9Z5c7nJQGiAfz8qXT56yIY1D5KQPRFrRVT9P33dBvEJFU3hOfDGn5CB80KNQ?=
 =?us-ascii?Q?yMJZHkzzf7phm87Ybo/dZKah/kBedMoPjB+ivjtISsrJKe882DJio9XiZjkZ?=
 =?us-ascii?Q?i1nRN3mFkIJvjM+yPnEde6yZY5aC3P3QqW1MB8bEhTiEl1B/iH786LzB/8li?=
 =?us-ascii?Q?VmZSCviaUSyHmxitaYUxgTM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96423299-1a80-44ca-4e72-08ddf67c6749
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 06:27:12.7616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqDYtEJaCWya4cHSsnu46ZtdNdfoafM8oYT+UN8X5jh7RX6L2N/LQ7ggUYz8MeSO7M302eZU8xLA6mOnTYcgmmfakT5mY41Bng2M4WWyBSvTU0XMKUxhndoJMlaZmYGJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16214

It is same as Cortex-A720.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/kernel/cpu_errata.c  | 1 +
 arch/arm64/kernel/proton-pack.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 59d723c9ab8f5..7ff6b49beaaff 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -531,6 +531,7 @@ static const struct midr_range erratum_spec_ssbs_list[] = {
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
+	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_X1C),
diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index edf1783ffc817..f9a32dfde0067 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -884,6 +884,7 @@ static u8 spectre_bhb_loop_affected(void)
 	static const struct midr_range spectre_bhb_k38_list[] = {
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
 		{},
 	};
 	static const struct midr_range spectre_bhb_k32_list[] = {
-- 
2.43.0


