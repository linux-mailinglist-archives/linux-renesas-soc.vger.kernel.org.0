Return-Path: <linux-renesas-soc+bounces-21891-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21746B58BF0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 04:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB7733AF896
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 02:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7208221FA4;
	Tue, 16 Sep 2025 02:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="I2BXadfF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2066.outbound.protection.outlook.com [40.107.114.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACB91E00B4;
	Tue, 16 Sep 2025 02:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757990321; cv=fail; b=A74oe9cRnvV0LB42ZkR2Hp/PO0SgR9K/WAlOG9MClBgjZk/d+BPs70+YgYjE+LJsCQWpJE93hWDoNNSTZB5/cYAEgqp5YvaFTZ/wh0l8VB5HDEiuCWTxHks+p2mJpTWQmfIBx9Ll3DIYQ2n51wIXaP6j1lPWs0fOxuurMY2L43w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757990321; c=relaxed/simple;
	bh=bLeq1foK1vms9cUzH4tt2Lelr3XYpi18AgFzWzgn6+k=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=Yru8dUZ6fnvGipwHIt+Z9peZl8Z2eWoErmQP8AtfJ3E5Uxam03PeCrOVqcHdlFSzwdkUaCUZ0BdKL0rEFlKJczCR+NFUimefJK+86tDoFX3iJAfMk4SibsoIdST8OY7wcq5yD5aDDCEtacX8u5F8KhDJncJmCa7v6D89kfwTqFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=I2BXadfF; arc=fail smtp.client-ip=40.107.114.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLxiT+VXtB0mNYs45bYFyRtxh6jUyS8vCv+yX1Ekt/VkT+C2YTQFjFtnKRZoDd0vYsVmm8wnr2NCLHh01mzBEu2vL0fFJLfqmg1hcc7zfejvm1QXQBg7zrsyOAn1C246FIn9bt96iVlYg5RdeymJHHWHWJLRH5RuE7dlsFOUEw5Gh6K3g4RVNmFQvE1iHIWEO0b+W+xsfveBaa4U/keVMeK7g8MASt7D9SCi312c3T/UWpyYeVl3V6DezptfNW1j1UtDZmo2im+ZWxqE/i0H01acrTbh0OOlKKDDyjT1P24SusBk4dAesPmfXKGL6OQ4FH8lKbufVP4lp4a2UidjYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNkhP9rIAfNv0HWyjEUa+kz0NHRRqqjEyvL5EktUqmA=;
 b=waI8M84TTlBU9vi4yeByEyWBGCxOz6zL8ZjizxvXrxiDbHKkT4scXG/VWrHa3HN5rMkM19kVIZ9mvntGR6rinaVcG3TIHYG23b64XaskpAXX5gmlUCTTbZaFyrqSU9DTT9a5FyngyW3OVn0pusW5Mwn3A7fv0/dKaK3ITP2NRpps0ERQvxKXPKUmWp8mVI0xLOVH1CX+W6NJcPe0MgcXOzJhNpGW1OVF4tdXEhqqbgat2gVogwMTC6hLGpIg06xbCdee5D7sh0p+wR/5EVWbc54dWWttlc3VvwP48Ir3J8QR/mk4noIQPLXCfCvbrBk/FVtjgLqWPUIZ07XVE3vV4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNkhP9rIAfNv0HWyjEUa+kz0NHRRqqjEyvL5EktUqmA=;
 b=I2BXadfFzRcXg/vipYs71BDwbQyriXaard6GWtYNPoKaoxcBJzexi8Y/mkH9Y+98TZxJxsd1BE9IskajlQOHrQG8XdVJ88kTR12bjfRBoOu0KNFq1mi7rJfJWI6E61F6hYdv7lFrGHTxPUdk/GJHfnq/RPDu9GS1lcgvyhdS1xQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13477.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 02:38:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 02:38:37 +0000
Message-ID: <87plbri0k3.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com>
References: <87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 3/6] arm64: cputype: Add Cortex-A720AE definitions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Sep 2025 02:38:36 +0000
X-ClientProxiedBy: TYCPR01CA0191.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13477:EE_
X-MS-Office365-Filtering-Correlation-Id: 61b33be2-d3a0-4b42-682b-08ddf4ca233f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xnZkE5J9ApeIATP2+qTmx6Rz4/9lWvgnn2CGWbpBxTlj62Z6Sw2ZLyXCJCJu?=
 =?us-ascii?Q?DP29ITf2La/nqT7r8DFdLfxD+VWFNk6gX1YkD8cFFxjIRkdtXuHTkmYhMDU0?=
 =?us-ascii?Q?PRROil2AHQVHQpgCOZkxE3gpwQ3jOnaF1MMLlydXcaf2yd0P3d4Aa2MxrDow?=
 =?us-ascii?Q?Pycy+uPy7PrhoilOx9EQXDwWpoBIiM+pCLSmRFw/8oIysGGuJypz7EXZBNJF?=
 =?us-ascii?Q?TSdBYaQBHvczRjKvOnIOsQ4+L7+Zlq+haE9XZIivBEEeVI7SXx6YSNCf3cnW?=
 =?us-ascii?Q?E77wr2huYAvRu9AcejiKS/pB6oKkhMn1HdnaBhaQTpZXEV84EA5kH7VdWZcg?=
 =?us-ascii?Q?xVR9/Re+EwNZtMqFR8q3D2DVRkNSuNsSHQz5/PSsako9QAhi9PXTTdp4/gIv?=
 =?us-ascii?Q?0RUaDLOsrs8PimYxd59mtw5UdO/mcuVRvIgkkjxk7DvjaCBoCzP+wmkj6dmC?=
 =?us-ascii?Q?Q7TYgidTNQ/Kx9I0oQ0EjDsrn+dC/qAoy/3gOOTkSn9qyYtWG727VihLaDTN?=
 =?us-ascii?Q?eRRLruCvgBB4bVrzlfHuq6gzBY74imd0+CDO/bNrBxdzN1xpS5LFy+WsjHrU?=
 =?us-ascii?Q?QWI2II0nwtfRrLX+uMyv9RDkWaZXIbSCzp1mAdvYmJTs9DzRI7TgXC/gQGtx?=
 =?us-ascii?Q?GYiTPu23aRyAG05r0qWQGzrJQM92csE8TCedmgpVpnDBk930CPXaOGgvlaUl?=
 =?us-ascii?Q?beRjNhQ7NuVHIlx4Z76U96ceTbHmI4h2uNwN3wr0v6xRZVNrr3CkdVwU18B6?=
 =?us-ascii?Q?qtudxbK1laCpzJcpiUqhXOSompPmHymafi37yajeUtBZ0QFLzUO7zy9P+J0R?=
 =?us-ascii?Q?Vdl/zNWxIbtzv55IRNkTXaIxoOIjeWuOzOrgF+BfXilr3YyuYvanetrbeohg?=
 =?us-ascii?Q?wNqPlSZ6I2PU/solqWyB26ETT5F8BGG3Y6+iERaqnGYwxyuaY55pnKrT4SKU?=
 =?us-ascii?Q?Q0gMCRaSSaYP+j8MhVeFxQSaeP6+6A7yUMKfb763bj9ddjjCgvknFsXqEnt+?=
 =?us-ascii?Q?GbgpLFC20xgWOHpCBip9LeaiMIn6IMlz4WdVVpmdkXpopIo2/ZgxUQGiK+7f?=
 =?us-ascii?Q?HDx+YCBZdc/qHTnuUPWnpB0q4V1ZeXWUSF0/vQRDOJ26LBtdaIJUXHmBF/60?=
 =?us-ascii?Q?ErDcG6ephdsl/CkmjYSlBlYuk2E1iwOfX0GxNHQzsFu7slW7fuII0nFsrd79?=
 =?us-ascii?Q?On7e7ww6y2bEbaCk/LWYgK0UH2t00COJaSUWs80+nbI9VmwZFKLC10oSDOWl?=
 =?us-ascii?Q?c6I58TVd/oIUILz7GFN9foyHpxhdVWlvONFk2HS6ohqb3E7ENZAC48gVZRNL?=
 =?us-ascii?Q?yt1db5AG/srt4ikd1SctM5dRpR+TMmLBSDtgtHVSCbQ0lw4kRxfO22ClrmC9?=
 =?us-ascii?Q?oMcwR6n+nPYZcoyI8HJJl1LxLSmM6E2r7ubASrwfyfCYLwDeWwlJ1IbkPan/?=
 =?us-ascii?Q?978vzV3V9q6IAiVX1slek4JLEpFN6qHlzJPIh60DIjpyGDSfOkBbDTGpW5lq?=
 =?us-ascii?Q?wtBgQP+Cjbuvbpw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/pjbYGPpYvS2RYpbogB+GDNEslJENzodl6lICx6g9OUjaXwpdGyp8h128hfh?=
 =?us-ascii?Q?wA7XHRFPQWBkEs8n9UFrEKHHgn8LlpK+3KJMb33R8m8RmSOBVc5v2RQXeLhr?=
 =?us-ascii?Q?uSYhKf/IWDQJGt9FJgYyQThGyZnJBcBLTUgF1IFppWZham2sTvsaBlL/GJlw?=
 =?us-ascii?Q?wAGTBApo/5yu7wUGt12tYWjF3s3dB9WcQqicFND9cwBIPn8DzBZwuKoQJnaI?=
 =?us-ascii?Q?4XdXUAA1+ZJMjfrKuA6bvyEEbI+untKxIR4LDnyPb2iyWMWXIqeam/6rgjDy?=
 =?us-ascii?Q?M1ldA/O4OT75hF9RQ+M3cv8ozgS8pZIepiIKuCj3lOtXFwJOMPphHwBxVYaB?=
 =?us-ascii?Q?d0jY2vaVGQC7XeB7v6rdZ8hwa3IBLzDbm7mpJ5UauRbT+xDTrb9D200/yFwy?=
 =?us-ascii?Q?FYPZnAjvmhEe2qkksb9GmVD5qqBrRdWy6JPNtQLH9h3UZT9zr59ftJHZsien?=
 =?us-ascii?Q?xPnMhqJwaIrwp6EvJBw6ZZAndbCFdC/q0S7OilPEEcPwoQ/sR/6YmyOgGfV/?=
 =?us-ascii?Q?qj+G26c4CT/3Ny9NSw+nI/SsJ492jDKEffLr8LchlmtO54iymphtIv/SDqZ9?=
 =?us-ascii?Q?DDw1OjJCTHYds07vbOeRYlKyJPi+ndolOh39BBwc82BrH9deZ+L+jde19gT2?=
 =?us-ascii?Q?jNr8y8+uZcLtba/65Z+NCgdEycInCpiNadR8oLXGjU/UnI8UxliVgcwk9SZ8?=
 =?us-ascii?Q?hEcjB5KR6n5UZf2Ue0WswNPMbHAZMS15pg+qO2PeBC0NRo/lxj/MDwi0kLeV?=
 =?us-ascii?Q?mdVTwGGS1ChFuAZypx2lAyCmwRWBwnpa3q89QG7ZGnXbNTxP1MYwrEQX6Ei6?=
 =?us-ascii?Q?rmMuDtW4JsK+TVswijmD3YiuJJKqb3gFAi/lcQ96R7it7dt9WeXZMmtQFkmv?=
 =?us-ascii?Q?3Iq64RcXvWjRbW8Qafj83NGy2zoMUktvfIv4TncDMfNU8gImc7bfcQp3s0HY?=
 =?us-ascii?Q?r+m+B8H6fXZK+Xh8ya1Ue9vNNNieheBlu+JUSOJZrUlmXvBt420q5bv+Pm/Q?=
 =?us-ascii?Q?+LtmWBSZ35D0fo2XOcSZ/fZ8Y7emXCjuwuELK3/RVd1IIiq3H3KK4QM8lsLr?=
 =?us-ascii?Q?glPlO6asAWN+lSmY47w4EnQcD4aa/VptNcwPsL0xzU8uiWJdEh1INfuiEF8W?=
 =?us-ascii?Q?LvMyfzU190HnybbIDF4sI9p1DIqgv5PhiEMxUvF4yEXTVBIDnDRkN3joVvKm?=
 =?us-ascii?Q?vZF+NJE0yYZduTSCp6lerJy77BI+c8SYBH2BZOolD7oTCXFjC0aWrAvOw8Qc?=
 =?us-ascii?Q?UDK8hr1Y3SECyHtJ7pySD1Uwry0GrEL7CRIx9Fvtyc3yNM4QqtvG1L/bLDgW?=
 =?us-ascii?Q?yZVqAu/TjpZMLf5mwUm0uaGtLqTmZM5fZyvhzM9qYgeM7UA4qn9jzapBqHyd?=
 =?us-ascii?Q?uJBozsh++FNH4tw0wCg9o5wEBsy9afoDxWnoweV80i/gFBg6Ipakon4JfVRi?=
 =?us-ascii?Q?VCsIataA06BkmEJHDa0tUPaJSWZ/CldQ+7l3W516bM33+B6oyrdE0XHwTCHg?=
 =?us-ascii?Q?g44fEd9O4WWT2sxLDwGUpCd9iIFYbtAHcrh6XBLgwB7KQcbd1UPayNZdWs6r?=
 =?us-ascii?Q?35B8nlY0NMxqLSWgoEdmvBncBksCaSzwxU2W9mw9JFJwjML0PqEgAM4XIoON?=
 =?us-ascii?Q?7hsc0M7YbXIqCZh1/pu0SlA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b33be2-d3a0-4b42-682b-08ddf4ca233f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 02:38:36.9868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZuKzqsxsdNraTRItjFndaJNLKvTBlBtgSViYS423XBIcPhC8HU62FME/gMAZQsjJnpoIBAco1oP0H/PegHLjvXIP4Jfoj6Zt9tdVQHxPbwzMXVawoB+Mz807ei3g9/T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13477

Add cputype definitions for Cortex-A720AE.
This patch is assuming A720AE feature is same as A720.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/include/asm/cputype.h       | 2 ++
 arch/arm64/kernel/cpu_errata.c         | 1 +
 arch/arm64/kernel/proton-pack.c        | 1 +
 tools/arch/arm64/include/asm/cputype.h | 2 ++
 tools/perf/util/arm-spe.c              | 1 +
 5 files changed, 7 insertions(+)

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
index 8942fa598a84f..bda6f3554f7e6 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -555,6 +555,7 @@ static int arm_spe__synth_instruction_sample(struct arm_spe_queue *speq,
 
 static const struct midr_range common_ds_encoding_cpus[] = {
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
+	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_X1C),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_X3),
-- 
2.43.0


