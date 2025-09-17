Return-Path: <linux-renesas-soc+bounces-21954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80611B7DE5A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 14:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2FB7326AFC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 05:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E056A263F32;
	Wed, 17 Sep 2025 05:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JFi0IZqf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2048.outbound.protection.outlook.com [40.107.114.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9159C1D7E4A;
	Wed, 17 Sep 2025 05:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758087041; cv=fail; b=BK2EJfTT0anv485LIoijHCOWO9RrHXIhgr8ejhEmwtUbO8Uoe28npiC+n/gNUbmdSl6FA3BD9U1+jndHrnOxjHL/hLn4KIOK0CHpBiMrZWVucKfoqkXa8d5jPDW+GFAMOmRuZ1+4HRf0ceZFF63pC7Za/sGhkRvNlAfFUev/s8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758087041; c=relaxed/simple;
	bh=zyxR2knSWr8Hx3RWrUA9FLVmBppe8uFZJtQDAPloZRA=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DdLBtS59HtOLemiiS1m+jM3/PS8Cp47hg4iqAmFPjOvdFdCgF0cSk+MIAMqMaJPpu6g48zImsZyfl9Lq69csTJ0mOqH2k6d5pNusfVV4emAzlXGKNP5BjkZs1+DIhj9tFsbO9wB2ykybqX2ezwmB7bBCLhjXUQqilyu3p1oo8D0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JFi0IZqf; arc=fail smtp.client-ip=40.107.114.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UaOGsjrGEFwVZ7+7rRMAEUXuzf1eDDPHmQRtRT86uVblucs6dX0NSqiOPf8YPTB37XKEOv4NDo9jW4BpOtyFlOsD3mrFcNQ7HdW93CzuwqOfHDHAPpiUbCyvRxRwsmVuT4NCXjgKbN37mNDucIeWbCcbw1dJPnsyA6nQbqeGEaDViSAnXYu8vEB1ycdFuKsCA08R019y4pJXVtxBS4RRDxSS98b+4ZByvfqPHVQwXiyahLLQnihK/gG7zbpif5BtvrYWbC1OdLqzhxqaA6BvyCWyn+l/BlYOw28zudrT0KTwukWLYm8sME0L3YI7A4506837p0qXc65qar1mczGePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDw/XhpUjfRnRTWD48TYyY7f6jwS1YdyLGDSXYkB4JU=;
 b=JwhItwbFhKVn2czXeuRoY/aDG/Tx6YoeE8v3RewL3WbAvDBR6v+j6Or14AmYrjqBk/mEsMPYfEwAxS3vG4yhw/xB1RIldgaETz18Rq//Iddd8zSPwx5DIZZHV1ONZYIt4GmXDp51aEEuT0Te50Bx1nSVOTjaSGp6FL1ovmNF/H+W3uJtS+WpAUYW881CNlOv/e6hasmnKDmO/vtr5rutjuPA/Fiq2u5yPgiV2PTbB4y7uTd48xOdX/54xyfeg35vlEa3DkZVhOuHIvbvbBHsNS256wAO1xpV5RYJi8NKQvvwJUh9Y95zfEsRyBjUIMrp649emz6rnVoDXt6UVQ5stA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDw/XhpUjfRnRTWD48TYyY7f6jwS1YdyLGDSXYkB4JU=;
 b=JFi0IZqfPckjDHtX3f56qHw30QiBXrguNdLZt/YkxyLd+017oZ0Oa6SrnaNqr4ud0DzJ1myxxwmFCnuw6P7v1zzyAbjkzOMtTIYWlQsGGqZOaGnzfys7SRfs/JbLda5/sJiP0XA9Czv84bmKx7oKIah1/0sTqys3bOebAA1jhn0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB10187.jpnprd01.prod.outlook.com
 (2603:1096:604:1e2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 05:30:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 05:30:35 +0000
Message-ID: <87cy7pabnp.wl-kuninori.morimoto.gx@renesas.com>
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
Date: Wed, 17 Sep 2025 05:30:34 +0000
X-ClientProxiedBy: TYWP286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB10187:EE_
X-MS-Office365-Filtering-Correlation-Id: 3edb4cf8-f35c-4e18-d0f3-08ddf5ab5428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?arGk8HlyTW7fQkeG0NJPxx6KknOijcIoVVJ3jIW0USTSLPKb00lQ6tzGuU/p?=
 =?us-ascii?Q?ffxpud446Nc0P+jQHDCaqdCzbvBFfpoa2Dzv12Jp6aCBy6yDA52BDhxoswmq?=
 =?us-ascii?Q?hnuU6bsUfrqiOWMC88ZzMbYT0dyyFaZkLFqu3WJzd464Wm9g44QKLQ9Trt32?=
 =?us-ascii?Q?agOd6Mp1Y/ipI9s1tP9T/8KcRlBHqQjeTqSN4o+mSgpozr+rpQUB7PHZhOgq?=
 =?us-ascii?Q?ysLjzWOwG4kyuLQlQJKrqwyMG+eSdDjnpzrZCtFHoENeYtQ0gdOfRHjOyLm/?=
 =?us-ascii?Q?aq3speK/pWdQCgvHnoM5Z+a4LkLwF8P4eiGqi4R6O2UPEu2SC7KqpiFB8orL?=
 =?us-ascii?Q?Z9ulzbr7AnVam0EQC8tlomViHcB5qlhmCMbf30kBdkepU8CUFwF9qXzi2Jz0?=
 =?us-ascii?Q?IqpPabnVM6culmYdOHonu/e6yXM47++j3YJGohdYgpHIL0v2RN3OAysEpuwd?=
 =?us-ascii?Q?BVe0eKoy6IDbDt7++8wusKymgIvwTLY8S4wVe/igY+XKxLDuZZiWsK/anH9I?=
 =?us-ascii?Q?tDGm2QfVEKgFlDYftjqxbGeJZy1UVtpzaPYXGBBUePmmX4sGA20EHa+xHZO1?=
 =?us-ascii?Q?BBYDSdGt/W29p+6lGUMq8W7IQWwksFl9Uef/SdNCu1ByVxKxRdqPgXM9Ym5n?=
 =?us-ascii?Q?aF6NkIWR4laQQHc/jMft0c0M/56ftISfewwuC8LeZqxxykuwzmSY93OzB36t?=
 =?us-ascii?Q?SHBiQPTcOk0lPMlb6Mq+NPGyswS6P5Uu0cAPG5zuUGieJwdGwNV2qj1aZRLV?=
 =?us-ascii?Q?V6chzuxE/kGJKkB/b4yhSY5mXKgkUNxgKyE0Ro9PJJkbbZpGXQ28w3UtGpHT?=
 =?us-ascii?Q?ogojBm8mE86T1Q9o3MefKuNibJlYhX2W7Zq9Se5cktC3rPrtTx/x/qru8tWA?=
 =?us-ascii?Q?4bpLT7NoqveQSTgGmX0BuivDBw71Bg2hgMYTZSBRdW0lAO1CdT5VMfuid31Q?=
 =?us-ascii?Q?iWu2sOUfpA7mrrik98rshhr4kdmCaOES75DUmaIs5teabGkB5Yvlrem2nu/q?=
 =?us-ascii?Q?PoC7plZ7yinj1Ss+lrsuwcKn1g2OQIcK6X3T6pRGc7mMyuj39hFYA0AZ5MKT?=
 =?us-ascii?Q?fcRZf5+dIGAfRDwm4yZr4uHVY5t1ienqW1HfVvBJWo+0gO9HnvKDa8VbpfTP?=
 =?us-ascii?Q?XtmQSsGPIxFZ6P+k/kYzNMisbgMc9kjYhRwTBvx386/0kSWMkaejp2qWJ1Wm?=
 =?us-ascii?Q?caJBP0yUULvNr3xzG5YqKsWQDw/uUk2WA9Mb/UM2eEOpqZbrEkcDQ58KjttT?=
 =?us-ascii?Q?IcVZwJMc4iyT/g4NizRwryP/JBDtkUK9ajvb2mZ0mEigQTdFgTTztxUDUlZV?=
 =?us-ascii?Q?NRYmO3N5VluRpclpNzdWL5fEX2DPe3m/MejLPZZh1aLVFnNRWNNqa8BcWtPg?=
 =?us-ascii?Q?SDyZqgV8YznsK6MLkFIvWn1woaKvyqq+FZlFDIjl7ZIbBg93D8Aq8ocnuEju?=
 =?us-ascii?Q?6C6LLeIs6FF8eCBoYFHYNopcJqtX+Xnf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?01YSoW3XZ7ILGlwWB57C2rfUXo3w4JEE4AhmZdaI0qLG0rZ66AuFOJ99dqJ6?=
 =?us-ascii?Q?d5CahW9Z/z49IrkJDCKKfC/j6xVJG0p/GbX4pzsqgEHGFU+rn6TUP2yNdSWo?=
 =?us-ascii?Q?xDiWSTkMygn7E2eytxr/gTLsCEAZCNyCaOjFybEt3/9MZHawnmDAN3joKtU1?=
 =?us-ascii?Q?cV29oFLq8XMu3oDDirajUH8IMnlPDzNk+VQ2iQ2Slu5Fh5JxwMpI2dgUfG7E?=
 =?us-ascii?Q?HYN6OCg3LQdRi3qbfIxiv2DhHIJi48QwxsXTqfqvaCxeAEjCR5KAVX79EmC6?=
 =?us-ascii?Q?lhd0n4zcI5xuk2D6PiS6NAjOQ8Sqfgy0Lx+PLcaz0NmFu1jUa4yxWBBgRDSL?=
 =?us-ascii?Q?UY5nm4YF/seu427OwiV+PEQugrAKI73ihjt6+ggET1hTvyHIBu+fWUgzGt9c?=
 =?us-ascii?Q?h4uttTsRriZnW0739VI8PP+dZikih7560fGonfeuWHYENlAV1gKDH84GY5/K?=
 =?us-ascii?Q?LAHtwWZxY7nHFmxqigeiwF/FWC7pefo1liuk0Z3udbhqSiFWSMgjAKvrdctX?=
 =?us-ascii?Q?4N65qlAC/PtM943Nuv7Ok/GB4X6EHxKpjKEu0Bb+195540MLD7M7MGvErCwM?=
 =?us-ascii?Q?r5hM6z1aac0Q83C6iE6JIxVkdURd41E6nEDyixyvMsbNQxbQzdFCBCU+uxwm?=
 =?us-ascii?Q?RwW6MMLh+wfoOsjWXvbV/W7/7GTtno8h+EKG59B1DI1DkLXWZ1y6MU6NvyLq?=
 =?us-ascii?Q?mceKLR/ylw93KFRe/AKs9a1zbNof1hCSNUXudTjF+qG7IKTtiqcIu1jvjtpa?=
 =?us-ascii?Q?O9VqtZMom4WRoxILWguz3bAwtqBqkcl0lEnWaW46vCE+r/cJqxKqP/7b6qKM?=
 =?us-ascii?Q?JmGfalycOOr8fK1FwapEgUpLU9RpmfVJTdEQInSbqMUa84wriVtt4eW7x4hO?=
 =?us-ascii?Q?pPAS4YeFzD7dwIF+F/CpXx3oMtUJlYXh8Ld2aioxRmoD5DreturceovyfQMW?=
 =?us-ascii?Q?RDZ/zvJo9Myh4dPMazkQiVjglrFa/R8B0hKVBiivrf73m7qt7HEl5EM2RRd5?=
 =?us-ascii?Q?XPeHQCBcAZPZX2AtLR5p4oFqgaAQfUJtr2GlEHdrcpEFwZgrhBYMEiY2gvXh?=
 =?us-ascii?Q?mZNT8C/EGirGHclx/aAmnoNw69HEGmw5XObq38pHP2pJ319/KzJsabkF6hQ4?=
 =?us-ascii?Q?tKdWw/JwOH2ULQoWgWEA+P/QEBFGd5btiVJQuq5QqKN/FgNkKDJPvXlpJ3Vq?=
 =?us-ascii?Q?JIsyKJ9wZzCZj7bX+Tq4cqOLY6eel4z189VDOWrRugJkaEvmm+JAkEKzAxpl?=
 =?us-ascii?Q?bQRhHS12XJuSCTVDMup5g6Lf0oOg27j+Htyf7DPIH0ZCwjpYfqxpNF5q4lEP?=
 =?us-ascii?Q?2reb/bh3RpBQQORS+7KOQDNER/7q6OiCvAZeZNTWQcxxuV5gyKAbEcc+01Ze?=
 =?us-ascii?Q?mG4XIlE76p17fKXIECZZfW6HMQmN6sjnyw0gIjQKVcxrn915RO1SzDmn+7NM?=
 =?us-ascii?Q?EQWmtjmG8sAGcyJJlVe1iNHEzuwE2AYy7ga+lmQn5JmCJbB4ej7mSmfqGOsS?=
 =?us-ascii?Q?Hr4QHIm/uH9ip1Omrnup37i/2+MK32uGw/TjCxtyx13LCrkGWwn+1aOnyISY?=
 =?us-ascii?Q?/QKiE9hrEUG20syHLGpU0xfvLJD/st3bKi7XsRFR6z0eHlVL3RY4NjVXgQ6r?=
 =?us-ascii?Q?aLoW0uGC1xJnIPDKBMJFwDo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3edb4cf8-f35c-4e18-d0f3-08ddf5ab5428
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 05:30:35.8789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9cT9PpcEPvjVg2Xnp3ieLCbifv3fJU+yNu0OwEPXrQfCOzgF1YVwHXzqPp+4oJ4zqUqdf0rUGARI4I27/VSSjdI6c+bBM0DG1kVl5d7mAlB/z4eR3VN5gGz1a4leKuRv
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


