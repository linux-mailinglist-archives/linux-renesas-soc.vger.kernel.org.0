Return-Path: <linux-renesas-soc+bounces-21955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 189B0B7E00E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 14:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34A541BC1E5D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 05:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D578C27E076;
	Wed, 17 Sep 2025 05:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HMCkLIJW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2057.outbound.protection.outlook.com [40.107.114.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC28274643;
	Wed, 17 Sep 2025 05:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758087050; cv=fail; b=a0gPw9HMBDhcrjShJahL1d9GKZyJzBRLlZ4u3x20XhkOBFczhjQbg6Yq/SYEp//TbtqIlXStPq6d14T8oTLeyuRdXjhR7GkgRiOQ2Wh1glpOI6Yic+EhOFTOsYBPVJY6HNlR/hYcVqPg0jK7icGdYlmMmxTbnmGCSuRyvko/JSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758087050; c=relaxed/simple;
	bh=zyxR2knSWr8Hx3RWrUA9FLVmBppe8uFZJtQDAPloZRA=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZcRf6Ypem8SxCy92TQJl8p5+lWL81svfJP2O3GnUm9QBaEghWJjav5hmz5kaOFFyHTWFvacgNsctRlN9xdU/ULhb6xPfDPE8/naboGc40rsSbyKYzQ4dqaitwLfrhaIedvacDOv/PS992Cj1f5yu2ECI8TixInlMCtQBnFwvhhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HMCkLIJW; arc=fail smtp.client-ip=40.107.114.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exhgw92bggkn2Ql0Ku3JtoOL44Fcg2oixPDSK9rcbZQP9o+N+vbHds7IhzfA9ir65/oHCgk8QUF7RzyBfzT7jBs7r7kcBLRqNn7wuDhczd05VC98j7K0t8dg+rb+M0Ym50qbxDgeF21FZ6syYGbgmU8qUTJiW4VsFpqzK17qTkTOluygv9SxEVim1fDI1Lm99F39byxplyQtAgKhe+g3aXA4d9pETk+iXy8yNdkNtTTf3ylZ8Iz2X2e0W5lfQt2U6KfivbTaCHuurEDXV7ZZleGVQnJXaaKka3bOQLuAV7LZIdujYNUjkANwe9pClU7uKsTJjhbQVvrU0lSqCFOvQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDw/XhpUjfRnRTWD48TYyY7f6jwS1YdyLGDSXYkB4JU=;
 b=ckI4YGXPe5rZy8JJGPuda+eOc12s6kZkEKX7EZk2xh/Wd359T8anXgQSZQ/3Zfaq6bXwPGFt+SANRbpOoS5gY0WlnYflAe/UxfNoAXtUypxwrzuFjtbSoD2VuSUnu7TerxzX6KtK4AFyt7uVkPn7NWgfF/AUVapayQHi/2eryvHKw8wLSk4MBOJl3JjnABw8CW4gxJU6zp4Wbr9jvVhw7BLPi1xvBH2ee/r6cwBLBDoVQVqZtszSIWxwjyA2lgHn1GKoqiuhLg2a0KS53IZ/yENAJ2QimKo71JQdEVl9uyQc1r0zfVR7eAhHPf+DD7VgESavlZHCJ7P5+8WtYQg3aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDw/XhpUjfRnRTWD48TYyY7f6jwS1YdyLGDSXYkB4JU=;
 b=HMCkLIJW5iNIUkWtbMZJiaPdgrh2c90fuTCyFQTrc5AZiIBvVMEvvrFXxNj+Xd4TyNVIO2zsZ0MA/qvMZSfOlGMvzT/SuSdg+X9DrCV2/weAOX75VWLPjocqnKtnqVOXGz4I+o4QdnPacXjoxt/KDy3PVghh6CI07dRJ5X9s+eg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB10187.jpnprd01.prod.outlook.com
 (2603:1096:604:1e2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 05:30:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 05:30:46 +0000
Message-ID: <87bjn9abne.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 1/5] arm64: cputype: Add Cortex-A725AE definitions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
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
In-Reply-To: <87ecs5abp9.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecs5abp9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 17 Sep 2025 05:30:45 +0000
X-ClientProxiedBy: TYCP286CA0093.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB10187:EE_
X-MS-Office365-Filtering-Correlation-Id: bead479d-6ac0-4508-4afe-08ddf5ab5a2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u4YT0MH9YGFGxmuNG3pSZaElEhTGadt0Rm7aupNqt62u+XgAg/V5OMpXeIB/?=
 =?us-ascii?Q?dDOYg3zArzDk+i65yHqwuLMkKI28aVcaNzYvVQx2TWSRt21CDburbjvK1Mpg?=
 =?us-ascii?Q?0hiXWs6KhhnZuq1xYuJX86eSiiox8WwpafyYd6mF0Y9DJ3CklUYph1O33Xl7?=
 =?us-ascii?Q?T43ZhRCTjDdTiAMUsKpE8tQZuWQ/UiX9Ev7D/JrjoJYCuoII0NDB4OzkZKaf?=
 =?us-ascii?Q?U17kS9zcDnxmx2IXOWrSTf7tQA2VFhn/UBXH3wOsKspIquaUOmsAypJYHxt+?=
 =?us-ascii?Q?upUDlcCEZQQ4TgeN48PJ9bBrRbsrVJQR1Gb3Fl3A3s0XWbbzsMuVSlrKJOO/?=
 =?us-ascii?Q?yQ5MQ1ReJBsfaZaIsFqLH9vHRifGCSgqoQ9LZJdfGzUdLVvNxR+dkqUACPTM?=
 =?us-ascii?Q?fCMkkGtQn9aVhG+8rFkMpXhw/iRSiqez5RLkFbsPmk6Uk8wSXuc72lHAAwP4?=
 =?us-ascii?Q?t7yAz+RYDX4twVtSLiQe9tyQMjhW8H1IyTo0mhrO7VFt+b6WRV14yJPrKg51?=
 =?us-ascii?Q?8tWgJxeCsVFYpfVIQvk5O+10kwQe4dHYmcQ4tE8U4G10SJMqi7TFoDIfITKg?=
 =?us-ascii?Q?ZS5rQLPJcDKaTgy+l6HhZx7BceZsJmSrRnXwnGkgOivYam43sk6xBO5GXiJQ?=
 =?us-ascii?Q?DzcoI2UI9u74EVSe93VfMSt8iiAp0H6CEdp94DJzZnLAfQ1r4aRGXL73s0Qj?=
 =?us-ascii?Q?vLBwrEwq5XR5Ry3V6q4bPkiGtUj5NvW5/TLlsWXHV0sA2MS0OqZj2ozIFr7v?=
 =?us-ascii?Q?hlBO7xGO++rNSp04Z9gcE39+UjQULySYXgOUrDuWJ8SqSvtKa7rgoisJM0UH?=
 =?us-ascii?Q?nYHPiuLzzdBptPvNTCcTv2mzzmGNc2F4A6Y6AJf1hf1uMTmVjbQaPOKPj2cP?=
 =?us-ascii?Q?6Xlr2vx2UqAmKu5qPzzTCi1AYFmMCQMcJbznb9uizMsLM/Ton75n/eCqrgcv?=
 =?us-ascii?Q?ZF0cvmSxsGt88YYnWU1Ije5XsczW5XN8jaIkVvOCV9wtVabcF4Swix1VZB75?=
 =?us-ascii?Q?kacaei05FUeEGPgSuG/6GX33GsVPVSScR/1NEtJtBe/cSqq3lRaLF9zUujRj?=
 =?us-ascii?Q?2o8McJk5XUNEPWIlJTxsww0o6F/1od3n+YgXWJgT3pwn1NfNCW87zo9I/fuS?=
 =?us-ascii?Q?X8Mhh2DwJE+MhILIMdl6pQoAh6myfdHYorNpNxfOECq1XjYRnnV6wqmkVgPW?=
 =?us-ascii?Q?Zltr0xiK1IFN4qK14HPxdiZR1ZG+tGuRTog7DyT/CCZAE7Ga4NBHUWR4RlAo?=
 =?us-ascii?Q?CvYinXKbFxrKap/PFj0Hk4qsKh4nj9Nx2RwDuEFhtEi3b6K0eaS+dK89m0P5?=
 =?us-ascii?Q?uvTh8emgeqhA6rmptXzGoXL+OB9preI2bdpJiQbYc4jge7ynQVPVmK4NNFUX?=
 =?us-ascii?Q?53LY3ISelNmOElog64VAZCAN2DMbd+dnI2O+k2Y30z4ckQLSRGzkSY9qrTCf?=
 =?us-ascii?Q?j7vYpFV/Bxxym4/ZQZ/DSQ4UxvqXYSmR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tT0gHhgcY/lhR8PCaQOZXptomdXabw13Tf+LHS1wOiIPiugiX+Ug6UaSykNR?=
 =?us-ascii?Q?zFAcz6u4KVXHVE61MBpTFwdatY2pApdXOq0CO2o/8/l+MXO6CpU7Kyh3c8Al?=
 =?us-ascii?Q?7oocfHjNBVsXrHg1FM/UKYN5T0uyB5TD+5lSR13cEORmGVH6NmOhqZIWw20u?=
 =?us-ascii?Q?ccuQi+466V/b5GbUbA9z/vwLNj0veks297sZpDy3ek9KaGTbIW0sHbUNkxNE?=
 =?us-ascii?Q?az6kFQpPnrGbozIeXwKx0pOPcSgvEgl1KQP1HXnlNjONtIUr4bIht9zyAaIG?=
 =?us-ascii?Q?nCSi5blQ3FYCCtC4KnBJymhomdp9ufPTXIuGHazcXsm/1eZuH766mIYuRNK4?=
 =?us-ascii?Q?67bFEDCmpbtJ4l+1zPuzwUkYDD6jR3Mumw9+ibvpK+FVA3ZhUGlqsMxNVIGb?=
 =?us-ascii?Q?PhvIE7vPfaoRT1G7adJBn8Xepj6DiYlMBBcNtlZUWK9bSS2JrPMXw8MjKXa3?=
 =?us-ascii?Q?qUcURFr7D5mJH3kT/TFGEeqcryrELQp/nkoGSh2T5YLVJrC+qGtJnomBoqRF?=
 =?us-ascii?Q?lLUtOVRjcf6JWHBaedrdZ1LcBOPCeymTekT/QYBMrH2WYk62aMnCrMDl3k+0?=
 =?us-ascii?Q?ufJXXAGtd3eppdDph4uzBeuK5sb3AExWSGHYwLTsFsZ+ljgLpgIShBo3Or0u?=
 =?us-ascii?Q?kHZ2VhhtgebPSxjbsfggMVFAgbKD1I95/CSE8RsHiWUTy7gpLL8tzZii3fFi?=
 =?us-ascii?Q?GVBLMhrpogyCnsxuWqgSXHVV5Qkais84Hzy2tVYC3sp5o4HUBfjT17ako8Iv?=
 =?us-ascii?Q?6b5XrfUl/9JOMJ86whd41YbDyIrfRTQ7GEwao3++d49Z/5skNE5Zc5ySCQEY?=
 =?us-ascii?Q?Hyx8V0jBJtu4g4c6Y2tJqYX7Q2N5cS4OJOtiWwY/p9VkWg6M/mcwYGn7J6+i?=
 =?us-ascii?Q?9NIRZMttg25qPEc1ezUftbAIkILzpUKhYWO9TmTBHD2iQTeHYnxXyIi4MIEw?=
 =?us-ascii?Q?4VWHCKRp6htCpOVLFnDQeOqocw9KMmHaGBDKOROI1/TlnvOsnySkqt8W//8f?=
 =?us-ascii?Q?GuOmU9epkMuf65x4ulmzWOu5tpVu/S5pxcRvnsCRo2f/9lHkYsy39xXjIwGs?=
 =?us-ascii?Q?Jz80hAaol2z1XEhbqRFKbOjqYk1zpG48zpA3XDsia48NAr/8fEWS0VDG2XzK?=
 =?us-ascii?Q?Yn7PcygjZMS3eog26OmptYPEPPJzBlpKo0Cy2oQancM0ljJI2dnUHTiUVrnB?=
 =?us-ascii?Q?X8dPOLgNjULuyi/139K/9pEISBtzU+ntdeNGxxpY5tL68wDpQn3I0Mq0uZZp?=
 =?us-ascii?Q?SmWtU60i7iwsvT/k0AlowSF27GB56Wdq1904pl//wx8BQAodqXKd1uEMQU6u?=
 =?us-ascii?Q?0DX7e5ESKtzkej5BPD57yh/Coc9Bxezisf+e9lizDFnKgQ5bUtUN52X1eZ63?=
 =?us-ascii?Q?5YmShQFuI8CtgIhSktkXSjR8vZzDzm5wRCeZKplE3ZwmaEb8Oo4OS+SAZfdR?=
 =?us-ascii?Q?Q35K+bNIQ7N/etVA9GkNPYBSHCJLeZbJKv0upAYX+mn53+6mkkDqI8R70p4n?=
 =?us-ascii?Q?7qQzorGkohjxS0tQCd63IHlpSFSXR2AvNBLEu+KsXgbWin1TJ7mu3GpEqEab?=
 =?us-ascii?Q?t4yyQBDvI1lPMTxxzhvZcCs5CNMjxFn9fQ7qLdlq/h14QfdH5CdH7/4wiEYM?=
 =?us-ascii?Q?IJCB+tw8A42sBZmGU6zsjLE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bead479d-6ac0-4508-4afe-08ddf5ab5a2b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 05:30:45.9877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5EqsKhVNNqyW6p4+fCPXAp2+pB9bfuZFWT4hP2rXTtXiYOXXSlo9dwnaRJ68o8yDpCN+ga8As4QY3yanZvCmWF7QK02HMD2ZDvOglsVetLoGov8GwA/aD2wHiY4Y3FwE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10187

Add cputype definitions for Cortex-A725AE. These will be used for errata
detection in subsequent patches.

These values can be found in the Cortex-A725AE TRM:

https://developer.arm.com/documentation/102828/0001/

... in Table A-187

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/include/asm/cputype.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 661735616787e..b10eba7f52476 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -96,6 +96,7 @@
 #define ARM_CPU_PART_NEOVERSE_V3	0xD84
 #define ARM_CPU_PART_CORTEX_X925	0xD85
 #define ARM_CPU_PART_CORTEX_A725	0xD87
+#define ARM_CPU_PART_CORTEX_A720AE	0xD89
 #define ARM_CPU_PART_NEOVERSE_N3	0xD8E
 
 #define APM_CPU_PART_XGENE		0x000
@@ -185,6 +186,7 @@
 #define MIDR_NEOVERSE_V3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_V3)
 #define MIDR_CORTEX_X925 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X925)
 #define MIDR_CORTEX_A725 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A725)
+#define MIDR_CORTEX_A720AE MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A720AE)
 #define MIDR_NEOVERSE_N3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_N3)
 #define MIDR_THUNDERX	MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
 #define MIDR_THUNDERX_81XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_81XX)
-- 
2.43.0


