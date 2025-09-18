Return-Path: <linux-renesas-soc+bounces-22004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E693B83203
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 08:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C49BE487DED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 06:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7095D2D9491;
	Thu, 18 Sep 2025 06:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jVZO8G9O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010032.outbound.protection.outlook.com [52.101.228.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9BA2D8DBB;
	Thu, 18 Sep 2025 06:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758176804; cv=fail; b=ULTfVZY82Te/rK6G0gzk3Q5U+8bBit1ZSFvX8odRupygKhdzwcf/H0cWIJpxgS7+5E7YhH07J2InEGYJ/kCIQP+nE1tYDqXaY+Y0UpMG98nqrL0gig4oRJSwmdHVfcrVbSPiAHuXnmVoaj8kzjsEYiIkJDXGHlEJ9oEOAt+ziNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758176804; c=relaxed/simple;
	bh=S0FBYw/gtO2A1dCviX7YgqNLHCUaf/2d/TLJ6k9eM24=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=t+ujEfF2V7M3W6igsCI8Bfsm1WS577DTEAr7Cl50nvl+JSLorrqEA63RcppDcbiO3ZXtLwwI49TH8dMW24NVK85e7voR4UGXI56NOCwR7XJdzQH0IlB3q36Ruu1rdcOujC9YplLD6/ObV1vfUBXKH2rSsDrBxbOOR2vWZ9UVyKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jVZO8G9O; arc=fail smtp.client-ip=52.101.228.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmEzFqoMWvLdW7A3F3m8p58XGl7ZOMf1gUFqrkbLE0dW9u+QLTsLdo9xpjITrHp1Zqd7yKYxz/FE5KccfaU9mq6XDz8yBrqTtqTVSkB3SilK5V8S/d3b2yR6dY3TTDj/oi3gN7b0oaAttkI9Wg+uDw1xz/QLFfsBsPpd5dzDH5h1A/c31CR1fB8pWk5wx2qZopZ1pG7PMEtQTSDWg/bQFa534VV74gpBnhprAWNpZr8u+pG89VnyKUtNIvSFrzc2ITLkW2R9Sgs4YtDRnV+dbgqef7P4Sjb0A6A8t6dqeQ3+//PjNdsRwCe7K0xW3eEeH+kYB/3npQvJnRIH2sSgTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/WAL0tnQkN6D4s0B6+iV0fsnUor2Rargk7JqlAZY9c=;
 b=Oz61oPve4Hnex2fRNAJRHCRm/M8KawJYNbS86rRq4Myz3TefoouRse1goe7MECB5DY9fpI8xNvm0ch3pNE82JZnmrWD7PcYPCTJB+vQjJZ9he9BbNvL1F0LJBxoixEuK54yfCYuBkXH3zcNC4JrBMQh6u4d2S/YpaI29lsAXZ2qdnHK1wAvaOt06V5kY3k/DA/uJT7YoZB8Bn96tfV6igP/VtjmqoGW/Qyrv5WDyiG78pL6DaU2QsyBLdl8wB/r6FdYUfhAWSFVzxZINh9Kc8V8Xf9sYoJ6Q4tV4b0GhABCwlpbBVJtTaId4BqgyB/vD9zq3jp4HutZEbR9qPSw50Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/WAL0tnQkN6D4s0B6+iV0fsnUor2Rargk7JqlAZY9c=;
 b=jVZO8G9OyrkNv6tYjb+TYQiZ+WTM/m40MqmhZLU8V7brumwKf0ltYBWIp/w/+G7bI6mpbotSk2TMarClRutYdl4j3BXKm6hyd2oM5AhgxSVxnOYr/erc30ydI9awZzBEGg6OdlfzRS4ZQuB+ghJDBG4DXvs0bne553zE/q0ul8E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB16214.jpnprd01.prod.outlook.com
 (2603:1096:604:3ea::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 06:26:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 06:26:40 +0000
Message-ID: <87ikhgnun4.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v5 3/7] tools: arm64: Add Cortex-A720AE definitions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Sep 2025 06:26:39 +0000
X-ClientProxiedBy: TYCP286CA0286.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB16214:EE_
X-MS-Office365-Filtering-Correlation-Id: 23071f3b-759e-4b31-4cbd-08ddf67c53d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iELUOUo5xcHfzunShcJY4Pl8xFiPPBpImO+Hng4Vsat/evYmfqBdIJOmpuxM?=
 =?us-ascii?Q?cU425jGL4EXMkc0fWSG7iFylCVCa+gJubup6Qmua70QJnax7DDcMuuj+pyjr?=
 =?us-ascii?Q?Rj1DCBSmr6/nKoyKmL6cbNhKoVShMJ1jEDiqixhcF2lJq+pz0wKDzj7YIrfj?=
 =?us-ascii?Q?iOTGAoZuoUyX7Jobhz+yTQVIKHsHF3sWD8uQ7rriVxKS25kYFYAgxKGIKjEY?=
 =?us-ascii?Q?vt/BoUnCvRpSHmDrPi+942Gd7Y7sX6zVHTBJ89iwICPS55iFZnsR8eg4emYS?=
 =?us-ascii?Q?TWthil0StG4WEETt5IIClUsMuRl0ZAhVHuvPWJ6IYYzwac4cgBVrzm3VG1uZ?=
 =?us-ascii?Q?L2oASPu29JDWhsAsuN9OYWFI5fHiFIKY0uuZAuvw4jEzexbGSczJq4TKmDO2?=
 =?us-ascii?Q?0y8YpSOl9tyDrDx4X05IiYlRvdlLVN4LpY3qo7nhJqHvLkKRn1S9P7EMkAhD?=
 =?us-ascii?Q?PQ3P+3bDDnMrHTqTcqn6OqZFgPirZYiYcQGeAOh5dzgYdzRwsYPTwPpsTjIh?=
 =?us-ascii?Q?N0XIer3V/aorY/5YheZI86bKNm2H3vmPIOuZHrA46RPMjGmo/WFYPMGg1+rI?=
 =?us-ascii?Q?wOfuP5mcKzzC6UB+7zeTgbdKtnLpgZOv82YCimCFhrtyciPLKl2Nk8oSz15U?=
 =?us-ascii?Q?SefuwnhimAKkMNcopL8xTYH5JuzaS5SRFmtJX+qPITT3kIN1gEVNuBo4YiWH?=
 =?us-ascii?Q?q8iiqCKa5Rfrh6jOCU1iSLzke1391laUzxkTeaFiGoiSx64J1Suvyy+JcHmd?=
 =?us-ascii?Q?I1A1PEQr9LCPMVIYFugkYkjXiiojbFxwupA3kEJ8Ud4IT0KkjZqbAwpwY5gf?=
 =?us-ascii?Q?d2mSE24NksrvxahEoxuRBcfHQqw+j9S0ntdDwww7PDv8jzJQt3C+NK8x9/jW?=
 =?us-ascii?Q?3r/S98+EyDfwxmLptClWHxwHc5lR0gX3fTUBTb979gBCF4YAB10fOgfD4W/a?=
 =?us-ascii?Q?DD+/+UqJ7Kg/tRLDeYUF6T+8Q+satPDXH9OUWaFPO28pWuLptKZCt6+XIXCT?=
 =?us-ascii?Q?wey10azp9wiwqzC6LdS8tzr/JmHXR3qKD5WV/X+s76HqeNMO653CJhaCSD+H?=
 =?us-ascii?Q?sJkAK9Q2Cjl3KQUhoOn0S0qsghkw6qFX/A91nzh2OqC6YkxPSIcldW2fo8WX?=
 =?us-ascii?Q?JnOH7hZdS4/NXnrxKb3/6x+3lKgdeNo1VzIEEwupmXVJ/Bju39pZ0vxlQgjz?=
 =?us-ascii?Q?SrJHbAIHtTb5CH4CJM8TN0qwSCFEQrT/HgiD6tXNCJg6Hoffl+JcgzBqXuVG?=
 =?us-ascii?Q?45ezbIlzx5N9q4E6bR7zoixNoM9V61KNYTIhXWrRQcc2OCQ/GQwsOBMqiwsa?=
 =?us-ascii?Q?0zfyQH8EDFV/1rj3/Ht5N3pLYXbrtfiVhZLDBt8duKOQMuO0Xk9XNMx8gg95?=
 =?us-ascii?Q?G1SFyTdjpn5ezCTKyxIvRya2ZjxKoiK1/wccqS8BXPbmjFgdKFmBXyYV9or3?=
 =?us-ascii?Q?hJPOscXJz/2LmOV0RlCz+cyrW2ZeVQk/Rf7Ef22rLzQA4Fu58Y79zlr/c+Lg?=
 =?us-ascii?Q?HslJ9P/Ky/fZOsA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CodN0nwndGpEnGVAi6JNtxVjNXAAy9qeYPj/lTw3CiXIoI68KeIcbaUDj0Vn?=
 =?us-ascii?Q?n+d0DTAi65rNvB4iY2YWxyHu9OQPPBA7dPEWoMgTKNfRdS2apjdtUuBaKH+J?=
 =?us-ascii?Q?I0Js/4GEXLMMZeLUEI8f988LfteZRkYG8RFtP9dYdvVT7xIRbTcoumeVJdt9?=
 =?us-ascii?Q?JbyhqfuvWIv/OMrwf2cn47at2aOuTKEhYg9VqqIOIG35JXd44arNKNLgSHJ5?=
 =?us-ascii?Q?lB0Wec8iOr4vZpbduYSXuX5rOSGJPOxRdLMa2nCw64PDfYTKO62TfoAywgzx?=
 =?us-ascii?Q?FAMfl9p0CHQyw2IAGLN2/XAmo42kMEcX3zZH6iIxdeLAt64p6xNQauGZjw37?=
 =?us-ascii?Q?ydfqd0qt04kS47OXrYsNxWSLrrcYreCoWSlfVi6BdYhaDp/v5V7l3L4rTHKX?=
 =?us-ascii?Q?IbOBcuZxpuB/LYpqbRaO7D3GgPhebXyXef+m7RhUB7hkxkItJ0YfSGkH7T1r?=
 =?us-ascii?Q?mjKjWg1b68KnpmHanr1isHRO52BSuQ4MbgL8Rr+rusvaIwCuaDEEpO+PDH95?=
 =?us-ascii?Q?amThdRATJ7mbk4K/Xv45dJHtUavjyGTAYP1ndkymgyGlLZuPyMpVNyYoy52s?=
 =?us-ascii?Q?q6/ac+56Z/eAJQ8kLb/dlSfbnTTgoDue6/I14+iXd8C3VF3i2WUbFcxr8tno?=
 =?us-ascii?Q?DnRUpRpZR6fRBGlJs1mzYavMoEY6PzUdbpBX3OWNO45ZQHcBB2fdIxX0KJX6?=
 =?us-ascii?Q?yJuCU37nDzqQdxDc20eL5GAozTffHgjHKNBaM7vsL6S3etZ6LxC9PLFQgnFz?=
 =?us-ascii?Q?EkaKwoFYDm9nBH00VYSbAdjSMGLEYnuMBTw9/IJFRynjsZBEH60hzmccJvUE?=
 =?us-ascii?Q?ozjZAPHz5sX9PGOhUdFskWILhHWn3k35o8oTDWJXElTCrG+ZyjbuonA0jpPi?=
 =?us-ascii?Q?bz08IWQO6IqcBCAsSorU+1QtgulwdsZ44RPbsfCrnzUtt8TQRZSM5aXi8xfK?=
 =?us-ascii?Q?bsU5TYiZRAMrls43MgrJuO4t8rQIdJcAGDsGPvHhqJXs4K0fx7J4745JuUM5?=
 =?us-ascii?Q?1FcdVynDSvMHitBdB3cTsAkcIMrN8KpC0/YQFahg6TKPIPpNOQ3mbY4BaZYW?=
 =?us-ascii?Q?7oxDDIIMtXgoNDkveHAZtoe3CtxMaQJ/thW0Fn81k1v9rQstXYBp2Bs3QnCs?=
 =?us-ascii?Q?8ZVW5pkO8RLeMxPhu5tr11Jmt3clH7+y/BQD7n6SXUxRpUR6AvSYS8R4isrT?=
 =?us-ascii?Q?tiIdNgEl1WJabRAJ8DdBO1Tj4oAVhKpsGik5ErlvNkq1AldKpDDYGWL+R9hm?=
 =?us-ascii?Q?XS7bIs18a3T23+tkYY4NVYEJneU/Xu9BgQHQw8sjAZzjXfjCMxNfJG/DK+cu?=
 =?us-ascii?Q?sLF0vxDr0EwPjM2OwZ4vKegiG3Iot8i9Wi0PviV/vyLf5ZDodQSc8/+iZt35?=
 =?us-ascii?Q?RrclX9R+VO+D4BOpWkAhPVcSURMcOP3S8n8TDxb1dQK5CCIHDAyfbDmqFaM0?=
 =?us-ascii?Q?4ZpU+5yv6H+0z52vrMLD/qZ6mdE5L8vGGvp1LSyYoKeTBwzCl34crLXzoZ/L?=
 =?us-ascii?Q?Q887AJSPjMqFCyHjuJbvMT1T6knCZQ5TfN14qZlko68rdpNQHhw2t8/ZqjPV?=
 =?us-ascii?Q?GD/bvcptM2IRsR8aFBZ2JK2tx19S7iGtpL+U0sAwvOyMnRrBs2NReH5ppWbX?=
 =?us-ascii?Q?S8h6dkECq8ewMJgLGd8E+2U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23071f3b-759e-4b31-4cbd-08ddf67c53d7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 06:26:40.0951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JcOluCj730yjBuA8tMncnJJrDiGkOx8DEl2b+Hj5H2gdu4YZQXpPS/AuDIyG9OQA+xvcMtf7TsI74KwxHaFUbK1EoN5selRIs9RVy9zeBMQ/nPbDb6tpkOgiDMBwbFf2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16214

Add cputype definitions for Cortex-A720AE. These will be used for errata
detection in subsequent patches.

These values can be found in the Cortex-A720AE TRM:

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


