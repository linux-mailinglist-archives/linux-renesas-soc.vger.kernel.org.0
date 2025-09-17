Return-Path: <linux-renesas-soc+bounces-21957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B9224B7DF92
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 14:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BDF07AD153
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 05:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B4F26FA4E;
	Wed, 17 Sep 2025 05:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="b2l/KYBf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2064.outbound.protection.outlook.com [40.107.113.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3B221CA02;
	Wed, 17 Sep 2025 05:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758087067; cv=fail; b=FgGDfIvDXQxULyB6z8Jb+CMcdsUZcoqaGHU+UsTYnNZ59/yGe/hkKDQMTekdUyy60ng3E3aY8LY89QloCsFJ8yNyX/1YEyUtyxe+LLdR+J4/1fywEnVOlPYihVDNxR6xhoEWyAXXKsCbJFX5xGULDn+fJWK6YFRL0lnB7hjEeFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758087067; c=relaxed/simple;
	bh=wLAmWfMFoT2TG+200A/SCYigvZ8UeAC6/XRhUeuqaCM=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=QUBjXGRGrb20yAAHfeaT5vq4XRbhHcqmix3P9AtQZ+5GLHgB7ADg3CLwSHh1OTeQIx9ZZlKo0Pg/8A+T0VebUc1b1DAldsXBmLOEnMaqCdv0BybyCk0egioQlcw9+Cs0wYqQ7VDZgrhgbkpu+t0ZMtF5t4EDV02LoNO8FZMS/20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=b2l/KYBf; arc=fail smtp.client-ip=40.107.113.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7Obh/L9mr8V0RjqWilAcd24sGyimP1va3RTneurY5UK9u8LvDJWkNTjEBfiQZEqQuKIts9POp7YXyPFMQ5xsSVcFU0DbaTPz0hD0vj+84YJ1QNodO8/9cn3YWrZS2kKkMtzlf2vnfs6lwqhGym5+VxKQy94DHDfbfKvPY9jf6Ij6FCuQ17cwgurjMI28ze2lbTWSz2Psn4cH9LYHhv2cXgybAqwutBGHI4IvbPxAFWtOqUOp2vEN9BK4feD/szFjsiFTbFeOdkKGgV+uxwNfKiXaCzTOq+8MHNR3La0bnWJ3tdY79mn3CilGhHrFb+3XcFX7Vs9S1QOvmiH640nnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDzlEc681wrSK8WzV505zuSvd59wZqFwpcv2LxhxgRU=;
 b=SLWTAQn5zgQKClOv6MrY2ifo6LGt6sT946lFcfF7niVbJFrAzAMkbsOV6bmZcymh4XkuKSnek/cPd2LRBnOhfZtptDjSFwlBmT3ncuMf3UPOLLS/JSQ+BK+T3cUSiZVhj2cT8isfh4NjV6d+Vu0FBraKVite2s4d53a015B/+T+dTJqSpG3tjYmyCJvkQ920ExIGN3qVyZX4e0Bm9a5E994PS3YBF05iiE+adkstL9/+JqU3AlbQIBxI2ZgfGUl/Hg/WsKbmThg4hPm/2/CKUlPAFnp7AefXzEjTIzltqSAcuumrGGFbjdbvvaP+0u7QP88URrG+3CFbL9apOIjcjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDzlEc681wrSK8WzV505zuSvd59wZqFwpcv2LxhxgRU=;
 b=b2l/KYBfXOApBx5nWyJqWO87vP89SrfsVZeMCWMHjAIdqcMMVfvNLLBGBv1SaB2JN0rr7kiRow2x77Y25rC3MfcqgYB2/z7GBXs0iIiPMX0fyDV+I3lBUzUIDy0HOOw8UBR9G3sQ158Kn3iiyCCRMaYyult2hgAi3cQ0qGBzAeY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB10187.jpnprd01.prod.outlook.com
 (2603:1096:604:1e2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 05:31:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 05:31:03 +0000
Message-ID: <878qidabmy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 3/5] tools: arm64: Add Cortex-A725AE definitions
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
Date: Wed, 17 Sep 2025 05:31:02 +0000
X-ClientProxiedBy: TYWP286CA0003.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::22) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB10187:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa98c4e-dc1a-4b8f-e9ab-08ddf5ab6452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oBrFqIyQ5QiNcgXNI2T1ykYn2aeoIif7TQhlPqEDNGxSr6B5D8jFNAb4RLVh?=
 =?us-ascii?Q?CYve3Uo2hDEDekPTtN9QkeJWAbvxx/UCgFdi/8cXl69jVDXaCTdEfznIWhSG?=
 =?us-ascii?Q?+Msmi6y22rWjfrTwCFjXJSG0pACRvjWzPFtCmuxVpBNB6YjiVqCC1che+KVO?=
 =?us-ascii?Q?wCAPZGN2nl/NQ/PeM5SgOKqs+/uqLs7NwaoAMJv2ZXMh4SSQ3tZH681JMkQJ?=
 =?us-ascii?Q?9ocPBXp7soFgOVr4PTV+STAl5cqShXpLvxqdYqmKm0i9IRsDzo4wTCq+m+jn?=
 =?us-ascii?Q?MIg0PxvG31kSS18Prv03TqsqudCEURBPW+9FrbU/oFKuEtiHsZn8I4BeqVXj?=
 =?us-ascii?Q?GcRHIu1SvIX513IC2IzUrDMMF2XrBeVny/xvkLY2YDt/W93eV4798m2Ju1jj?=
 =?us-ascii?Q?FsC4+Am7zrfu1K/PI7cm81uucH3+tJQ5lqO2hMvpX9MGek0U6kuq4nuUABA4?=
 =?us-ascii?Q?XE1LvoS3/lwhhu+GYqLoZLmpd7tqV4i9DbfWlquZOkH7ngcL7/tZyMROjddg?=
 =?us-ascii?Q?WN6yuZCuNxziVvIezQIYTThmb2awiTmVJA4PaJuDf8kziyuCwztsoNRSQ32x?=
 =?us-ascii?Q?2MobF8MdynL/MMbbxOSzdyuKXoivvgvzHsrYT4OfpQ6No6NgFYm4Ny9I8Aw7?=
 =?us-ascii?Q?0ALsHOMGWRXGffmnQHYC/2c4LA9Iq5RWi9qRrJ1pUdgMjVXwow4y5giMhVcP?=
 =?us-ascii?Q?RxwgvWET976+aCht4rg3VlqqjJhPC82t/XjZEm06FFEzfeJgyhoowieNzJZe?=
 =?us-ascii?Q?STm92qmEzUvFxK6vSoErY2ZhMu0E/7UdNnXOuxVqufIA55zv5V0YElrF7fft?=
 =?us-ascii?Q?PQTkZ6suPVHeCkA9WJ1TebEyvQSCG43vXKHMs3oal5yWHmyn/HewNF5qbA6U?=
 =?us-ascii?Q?MRjs77vkh3OPWLbSBArtssxwE0T0i+H6/Krh9lE3CTOoMnFM4Bdw0xWjtdOJ?=
 =?us-ascii?Q?JHnMg/LGcpwSs5mY2pMa7oUplhqNuOJtGDcH/fsNRNFcOIXXfvA92XIYi99u?=
 =?us-ascii?Q?Zn3ImYOj0jyJnKNwhPocktKEknp+8h6IY1Sj755r69AuVp6LkAD5VcyzKErE?=
 =?us-ascii?Q?9rWKpTC76la0EkpgklO6amk8YiEMgZKHx6CmoBWgJlwtNaqUeK319qe5jH+5?=
 =?us-ascii?Q?3NxYnYTX+0ggHHTgRXu+VR2LRhamYfJ81AubKOhhkirXdS+GWKSB9tRQX5Mu?=
 =?us-ascii?Q?h8onZXjOj8CbIKu/Gs4uBJnoIvu9OvXPQJp78Cd+2WarLylG+xb36WjAZng7?=
 =?us-ascii?Q?1Hwd9j2XOzbPNX6j+e1SCCuPgd5VBCMKXmWY+bIYcV7cqJIGkOSwa9zTuU6w?=
 =?us-ascii?Q?VR8mIHhAD0c73eBdAlVx1ajJ6eMgpZqsuL8hpkXA8ksWqfJPkNaRKoFQZ3no?=
 =?us-ascii?Q?QI7d8Kr+YTBFExPHCd+fWMBnlkE3yGUdiErKqflnLEBrnrRDYjHx822r23P/?=
 =?us-ascii?Q?kqNcSh39fiBTaCZs6oidXJdhDaAUQ6f9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FmYT5XoK/P+rq6rVaffY/MqPlHv8y//BtFcNVs9ScTuc5gbivnCO2gMbxsfX?=
 =?us-ascii?Q?0elc7Xk48WNSrIaK8ME697wTD5sm33SGa3Dp8flurI633ApuHSYY12QOqzCI?=
 =?us-ascii?Q?ra6yZg3+mKgZjUjKfzaZxr+t1aNnVZgT1ZCCgyV1x/PlKZQhOKTuJSbeCCXp?=
 =?us-ascii?Q?WDJ0QBPxsjTgDVZng5tm6aMSm8umjxT+9aJ6Bd8GlFdUctEnTfuqkxV69e+e?=
 =?us-ascii?Q?qmPDrABie3AdfQyr6yVEJZxtNI4bNiprWc5g6lJyTP3omsWJ/FNjbIkC4c4K?=
 =?us-ascii?Q?/f9G7X1m6j5RulMp/PRcxeZ538rsGzC0t40OnBE6HBASl1Mh0ClsdopW15u9?=
 =?us-ascii?Q?PjJR4NzQDA8IOLYvgJWd5mxNpJ5AxsWNLRiT5DcHm6JLD92AXzo2rP+yWZgD?=
 =?us-ascii?Q?OEh6Z+K7xXjgXgifWIJqBh7NVXtf5ULtq/kQlKVE6xXXsh5SiOLpB35Oude/?=
 =?us-ascii?Q?Ckmh4FMepPbO3oYGT4W4pHNYISwpbtp0XJI11Hq6+J4pvpqZzcoP1jMOXzIc?=
 =?us-ascii?Q?OkPKt3NaBRRoInudTGUP9O7JX2uu37Z6MrNewHH+1Uz7VJRbUZOMp6i/tdZX?=
 =?us-ascii?Q?aXM/noMXtFQ98lmQlQ+VUlK0GN+5IoMvs/uxzZ1TJNqv53UR821pkNoUp2k0?=
 =?us-ascii?Q?K8Y436XLm7hLlEEb+DIisLoy9SbZ4PO065XoNbrToiTgfF/BZQobAd3r3xzw?=
 =?us-ascii?Q?p7cnAroc84FX++ZOtKPRKg9iRsNTgJ/Fu61lOIzzrseawHUozjvFJWUuYyhZ?=
 =?us-ascii?Q?aW5zuhdG8zRKtVDDCgniQatNtwEgfXRd2jE+YcRqTl7PTtfLciziOZhsAEfe?=
 =?us-ascii?Q?wh2Ji8dsUUIp64cMt1p7M2XrXEA7aiOlX2yOlIGYkEuRPGF/ME5sGL2LRhI3?=
 =?us-ascii?Q?GbWxv9LmFopPk2Dp0OTeusnUp8GTfafhM0F63D8tIhT8El3a5VkkiklcnD5b?=
 =?us-ascii?Q?VR0bzYK+NiAszs6f7ZMMFPAD0EGdhXV+SwC3wrGvSO4MkIObzuzhgRYKemi4?=
 =?us-ascii?Q?aXptLgxzGp7Y4QlRIJwPkwqNi2ZLcbxPwXMXZJHF/H9NNXov+Ps2wmTZDip0?=
 =?us-ascii?Q?xx+YXATTEJR+8YJtoK1oT7FL35J9njVQKgU9RC/XojtKyu3A2ZxMe7Xgip3T?=
 =?us-ascii?Q?aXy7hrG0ig9luUjfAbfVEspRf3X7H8Kb9kct4dOVaFfON8DTU2gY2tldZk4f?=
 =?us-ascii?Q?B1AB3RypMCIts+iXDYR8vZuBuqNR1EaEbkOtGxR0P0BwuZTfbe5F34LNGwrl?=
 =?us-ascii?Q?crRl7xU6TNW+zFFj1a2GDAFCipuK+SL7gyDLgVekriMkgHT25Kgmzgl0yjS2?=
 =?us-ascii?Q?xsg6JlEa0yse5ZIr5uMPJKXNOVXhmht6jXac+J9xMQ5+nbCRY2s/Xirir577?=
 =?us-ascii?Q?Ja3eTZRk1pc/t3+UlvHr6DqKeGBzKcEJNjXrCw9zySjkXQZM/xQbLnt46sxo?=
 =?us-ascii?Q?bWCmpIegKy6bVSHkaboYx/61o7aOe3D+cYOGIHABjmXSm4XkysudbJwaLgUC?=
 =?us-ascii?Q?6GRzeGfdFp8N63sv8SrAbDr7je7vDi4YDIjf9tzipN24sHWs2yj1BO40wod6?=
 =?us-ascii?Q?8ptdWXWo/btXfgXfhpkk6zUlpkyePXtxL7UhG9XhPokvVl5KXWDOAD2wvpKk?=
 =?us-ascii?Q?RTCNghjMPUfR7h9dD+eK+GM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa98c4e-dc1a-4b8f-e9ab-08ddf5ab6452
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 05:31:03.0946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cOaimy1Cy3jEKMTR7P/fIfsNDtFAPN7363tHMpK/1Q/axnskkFwAjzrUfuNssmp1d2MVS+9hkJH7bGNLJgQN+WphCEmheMkZKLnf0xWjtxUuDESWxhzvi37FP64RGyZI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10187

Add cputype definitions for Cortex-A725AE. These will be used for errata
detection in subsequent patches.

These values can be found in the Cortex-A725AE TRM:

https://developer.arm.com/documentation/102828/0001/

... in Table A-187

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 tools/arch/arm64/include/asm/cputype.h | 2 ++
 tools/perf/util/arm-spe.c              | 1 +
 2 files changed, 3 insertions(+)

diff --git a/tools/arch/arm64/include/asm/cputype.h b/tools/arch/arm64/include/asm/cputype.h
index 139d5e87dc959..0192dc7ec9ca9 100644
--- a/tools/arch/arm64/include/asm/cputype.h
+++ b/tools/arch/arm64/include/asm/cputype.h
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
diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 228ed52e653d7..8acb4bdad0fb5 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -544,6 +544,7 @@ static int arm_spe__synth_instruction_sample(struct arm_spe_queue *speq,
 
 static const struct midr_range common_ds_encoding_cpus[] = {
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
+	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_X1C),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_X3),
-- 
2.43.0


