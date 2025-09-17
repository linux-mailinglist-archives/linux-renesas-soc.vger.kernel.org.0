Return-Path: <linux-renesas-soc+bounces-21953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E84B7DE85
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 14:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5439E326ACC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 05:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC1025FA3B;
	Wed, 17 Sep 2025 05:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mvTCYlMX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2064.outbound.protection.outlook.com [40.107.113.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32F421578F;
	Wed, 17 Sep 2025 05:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758086986; cv=fail; b=hqvjZdTq4euia/fni/p2e+HWgFURbOALaI2cr1UPsG+dJRHDTVdChYlVDoqixVQACeSsN5kUoeO4il5xC+92mufSy1Lhk9JVwiZBPlMJE+WQ5Q2SkA4J6RpMgj2AD+B+Xrxia9LkXRNO438yrqGNMr5oODVRH0bkaJC+k3kOg44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758086986; c=relaxed/simple;
	bh=VXrx2nJh6Y+keiS/7DR4O28/s5ns6MZCL14S2AMbPV0=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=RIvD4D+jEjlpcnWPmQNiCQ9wdBtR6bREkiJE4+MLXW9IhUy+Dnw4qS/Atj2rjBB1P3DaGLhROx6FpC3yhW1vNujI8qHKR47bpi+jmSDGXEAcf7XKbNwRmVpIPFl9woQkQuELNort6ASGbD4D2SZKPWw/iRsaPW1y79I4luWHK/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mvTCYlMX; arc=fail smtp.client-ip=40.107.113.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VHdIQ8h1xHNqPNitLte5AK7nYiWqtJ8z/oOoQ1dOFE8Cjt40DgQyS2n2SLYJgqapUn73QGVCXlI9YBqMFtC/cos0URdwN5NA7ppy1IrYh8vSlafebacocrhMRU/AzkfzyBa1YxXYSf1RAaMUhZ7X1tJv5ObSqIht2F0gsz65TMpPSRzON/KQ0jxWfjt4G3CXaIs2Yj1nffAy2zncKpBIxrCd4avRaDaCFosCN+5nYasEqXqgU+vdjiCxlCdhp+cRwO0ix2ISy6uArkBE6gBxd8PWpedKMxTz3Fcil/buUhCAO7WmdC+UABuPG2I27iHh5eMq36ELIpi8BfERwAiVBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGghn2va/MtDafMpwh1hLgooRH+JnKDLytrNbix5QXE=;
 b=ADvKopy+ZF9ROdTyzifsHBf8zbdmzgxCkR/qkXzNBMt+RGr1aLF/9850kklZ9EdLsxHMkRJdX/d5Lu7t2NByNE5SQy+ClKK3cmcWfM6NqZqpaielllbmSW9i0kjhffJpyWeeQdLoMadCIABVyZLEfXNQr749AqHWkZ1NDGpZOq4Rle/3b9S6x7xIrkyyWP+vHeVKEmTDsQUbO78YngarNcBqtXOLYS56+rvDQPKSx6i5wjte2Eh1oFhcbHoeMMN3Jkbbt2xDYden1Cuk1+1Y6Tbnz2EZAaEjrhp8MmakCT39BULCW8UsPwSverjSfAizAkKz6k8Z+dJh7uxNvrQVzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGghn2va/MtDafMpwh1hLgooRH+JnKDLytrNbix5QXE=;
 b=mvTCYlMXTSjV6kP9QNrHrjeiq/WOi3pVO9uGKScKNxMi0ttJjHfETRxdiuB1jpeNxZ8ffyjgFm79JIzNWc5dc2cOp+DMIXoaKwmhH/bwPI7BgBSTA0lu3JexXuRk96fSrdAQc8u96XBCBdxMlrj4BLPXwjoba1n2US6xSLzW2Rg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB15745.jpnprd01.prod.outlook.com
 (2603:1096:405:28f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 05:29:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 05:29:39 +0000
Message-ID: <87ecs5abp9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Liang,  Kan" <kan.liang@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@redhat.com>, James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Leo Yan <leo.yan@linux.dev>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mike Leach <mike.leach@linaro.org>, Namhyung Kim <namhyung@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.
 infradead.org, linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Subject: [PATCH v4 0/5] arm64: add R8A78000 support
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 17 Sep 2025 05:29:39 +0000
X-ClientProxiedBy: TYCP286CA0074.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB15745:EE_
X-MS-Office365-Filtering-Correlation-Id: ef193eb8-043d-4a31-124d-08ddf5ab32ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JiT0GfP+1mdBIXROYQMtRhM1cQ4npMD4/YKGe7j4eC2NfE/Yn8iIxUqELQbN?=
 =?us-ascii?Q?sAlpnjN9fbrrgUTi2RIqaLYf8MK8Ty0NehORf+/Q6ccIleoWDnd0KkAsaZQr?=
 =?us-ascii?Q?E5bqgr4CWlPv42b8XCipoeLt5ZYhWJmEU2JHLiOWI3t0jPIWe7xana1Q7eXF?=
 =?us-ascii?Q?SaIWNHIcZ507d8T+dttAnDlT6W7swJaVSLBPD0Hz2vt3wXbpP9SCkq46wotQ?=
 =?us-ascii?Q?4RFyZjdrrZzqByzSR3tK46eIZhckXmlQOvNB9W62hcLm6bKPjevUPydgyipQ?=
 =?us-ascii?Q?XjlwVY1Eczek0j52wOFiw682Dx2jWec27I5ZGcCda6minqUHaH9fIK/21NZw?=
 =?us-ascii?Q?gMxMcyvJNddRXNd8dLJtNBaVdOQVbFDzDFk4WCVHateM2IL/u6sIpKFJOwgJ?=
 =?us-ascii?Q?be6BvxyQOrSPNVfiFUt0ljp6ukrqkhgYgp/X2wpKIoy5iBrmdR5dT5NJm3s8?=
 =?us-ascii?Q?osDOtoQZcD84gI/Wo9IyDuCzrohrOgkTemucgeLsY6uKhEpmlXnb1HdGSKf0?=
 =?us-ascii?Q?3r6pPl5rWy+xb2K9tyZTuhzYr3Og33+6ROl+H6+ZTOnexuKy8NkGvyIj67d6?=
 =?us-ascii?Q?qsUXz2saYtbZ3WcZy1Nh0Pbg9KSCjLzgY8+eaIe1LA7zGjcq0zcvuFKKCJ4Q?=
 =?us-ascii?Q?r5froTMyqdUFaxYlbji0V17AQ8tebXsLBmqHJF25sWHBbuJElVJEPFztg1Ts?=
 =?us-ascii?Q?wu129YkD+GiZAqMIm+yAvgUoMnBs2AFvaeyaoCYNL7yYRaaTy6Wpd/Uh0lnb?=
 =?us-ascii?Q?BvvWr0f8wen+PyQc/HNrcYF5GnIMXY7eHVysjP4oqpExo3rD15ku/NQa7Lin?=
 =?us-ascii?Q?zq1SnN2ID2SXLI01E+fIPbgySO+KxP+DBJ05eDkNE4xkLoqQytzH18g58JeU?=
 =?us-ascii?Q?/FkZVW9kxoyQGgUAi7hQ+Om7gmhqIhp6LArrvx7QQeQwqUdxkKA2lyFFaGad?=
 =?us-ascii?Q?QoNHOSjUCUFj/FFByOgiyIQeREemHoF+pvBeMsp+NmCbgV3ka2mxWVRWNdWy?=
 =?us-ascii?Q?RvW0r+FythYQMyWa2DQeHTDDJrYJOYa9EjHkr4uXSFHn5gRfNDP2Brb+3fxS?=
 =?us-ascii?Q?EsW5yMhXOQEOmXf809FthJxaejpFWZSilGgwAjdKKHCm6WQozsh3FaP9Wm3l?=
 =?us-ascii?Q?aFe/TRs3+TtOu9I940cVUERd+6XQeaExYEvMoRXjzLXfS0SKVcfINlirTUpN?=
 =?us-ascii?Q?AvjJikWPSqC9eWM0mZIiwvk5zLN5PO4Gi/BSR9wHe4IlBhak5oYX5gfAdsWi?=
 =?us-ascii?Q?A7+jhBtwr8uDKBO0zWtz3S0iGo5AT45vcPSc+YJkAru/R1IYnbKUKr7gtRti?=
 =?us-ascii?Q?jOk3hNfAKhaMO9w21Xt43tZdrPsOIHLmKyJ7qvSzDk4uUZrj4egsKUdnwwPO?=
 =?us-ascii?Q?Q7llDufOnvHWcu40qT+SH6J3PlA9PxoSRMxGg4m4/45D41cnRXwVMa9qvNDw?=
 =?us-ascii?Q?WUwvZ/ZrOrJkmx68aWcMAIoO0W2Z38eVPCmm0gZxirFBe9hjslhu9g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BenPj0xWG5er5nLht6ef/OYSRx9bW0ZtsAJJ2zsdZMNGU81RxL/T/LEKUTDH?=
 =?us-ascii?Q?qItRNq38BRFA99VM9p+smJNOwASHeFn75bRwSZrkx/rb28DNsXK6wOk4mHcY?=
 =?us-ascii?Q?ajJhD7QFaRgyb4k78UBuY73qx3FYtqoU2xR10FN+9WuZFrzmLzq1WxPA6rp2?=
 =?us-ascii?Q?bJTJVO4hxDSH2iLcCM3OVUBwR2ebNMpB0MKLCnPWv9tHEWxUxl7biqDiT68h?=
 =?us-ascii?Q?ICn9qYguf13FC4vscanF4DfnIXlT/kvvmDA2Dz30V8xYA5x6xOgbhHaZ/sRc?=
 =?us-ascii?Q?LQ+o0R1YLvdnufIi34fg6D8/M2QLLhRcxJT6/G4Lzn2f7bDEtm/RNcv+jT7u?=
 =?us-ascii?Q?uAuyZeVc/8d89FtAflkr/uLEQGhDpIzGh+VksZtrz8Dk4Z9M9TEjAOOqwZGU?=
 =?us-ascii?Q?2udBDLt21hN5XGHLjedDNqXp5jMzYuAxx6mMHigVBIr0/z52csk9CuOneFVx?=
 =?us-ascii?Q?PPFUb1YET4IsFf1fKSEa0CTaD38lpMHsJcKAxlCmWKnSnsZJ02TpJW5CJFs4?=
 =?us-ascii?Q?BaNBb0UQcC9ILNtZa4/L7DGU89tj0Y83KUkU1N3uHisKyj95oqcz0OhPLbzv?=
 =?us-ascii?Q?gFc0/fBxjwyxpt84p+V0lZRSvH4PMDcPK3nda472aWV046VFmGk9rryT9zC8?=
 =?us-ascii?Q?zPl7ZLOi0zJ/T/VMYswd+EtLm03TJjusX0gtizF7EXX5itZ7orEgeTrUFu+l?=
 =?us-ascii?Q?8O1+nCEIjN7eCgFnMGGB6f8XmtC9vvk0lDiTKzWwm4/bjD4+U/IOEAeG/bCq?=
 =?us-ascii?Q?V813V5+9m3CfG1rP4sYs5Q7OMffXRaDZxYwfIfGMZnp9mEvl7cDVhoBNDFa7?=
 =?us-ascii?Q?QREo0mwF2TFrDAA0w8pSnn7pEyTaep6rQbACgvN79huyX2NZOG6Kwl6OJYtr?=
 =?us-ascii?Q?A6jH+RpiYDgZJvDzeorZe0lzA0pBxfZ6y4NoAvlQyGB+s+5NiWOXUy3OOtbo?=
 =?us-ascii?Q?uJYzzahxAjjd5Yamgw8iBAbHrLXL3UsP/Jn1jom6IDHqXJFuLmI8iu4OsMNG?=
 =?us-ascii?Q?vvM6IQFzaKay7TX4Nyv8tFuVf9zAls9/kiYunjeF0ErnUAdX0+qXelWmHAMp?=
 =?us-ascii?Q?F100T8rjSfSVqsrZonOmTe29ifgHRFsELHfjg5Zx2HBHPEPjH7RyI1cuI7Gg?=
 =?us-ascii?Q?9aSC5gtz0rVcyi0oEKsoQK5UnxepejnAHJ8TrWjSotNMlKgug1mJZs2lAbhA?=
 =?us-ascii?Q?DJdPUwehMIEHmiQX1on938m4ZW4J4Uoene2N8C3Cr65Ij9LedPq9hkHkdjq2?=
 =?us-ascii?Q?loHgiOxKD0sY1jt+24PlnZ9wgGuXbG7dfwrChBhvj53a8rTWLXhCz54uHVhc?=
 =?us-ascii?Q?06ved9P27vY5N0/NVsVS4ilTNHDQqcQZzKCvfwpnDQm273nlnH7i4CxPQNNI?=
 =?us-ascii?Q?deyAIXNQB7+r8r5Nrama72p3wyXsqaQ007eIfHSSK0gKswkw/HCOUIu9nX4v?=
 =?us-ascii?Q?QrTRGajNokQ8R/daHyo9dlYoXM9Oz9AlXK7rohHtDSe7t88YppxRU2K09WvQ?=
 =?us-ascii?Q?J24f7y/+zIFmQrRmFyKeBApv+VdweoXJaLYTMdy2rEJ+KqyCrWwSBqchSOoq?=
 =?us-ascii?Q?qiMZ7zE/bAF3c1v4omHEw+kyOtLPgdHLqIeSDfaNqvhTscyW6L8/AErp5/FI?=
 =?us-ascii?Q?rbQuhP4Y57WCuWdGQDhilng=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef193eb8-043d-4a31-124d-08ddf5ab32ac
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 05:29:39.7897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0GYwop+fjdf9emBOw5EXevhe1e0St8nvkOWWlaQqbimZUrfwYjHKmEWMZ2z+EKX1xDpkLNtCSkVqXfSGfqpYPXavIaVG6/nDSk8Hc3j2vIc25zQlRsfeM8oef5L1S+Lc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB15745

Hi Geert

This is v4 of R8A78000 support for Renesas.

This patch-set adds R8A78000 and Ironhide board support.
It is based on SDK v4.28.0 or later. It will be released at end of Oct.

Link: https://lore.kernel.org/r/87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com

v3 -> v4
	- Don't include already applied patches
	- separate Cortex-A725AE patch into tools/ID/errata [1/5][2/5][3/5]
	- fixup gic reg [4/5]
	- move timer node into soc [4/5]

v2 -> v3
	- Add Reviewed-by from Geert [1/6]
	- Add cortex-a720ae patches [3/6][4/6]
	- Drop enable-method = "pcsi" [5/6]
	- Tidyup node name controller -> cache-controller [5/6]
	- Remove cache-unified from L2 [5/6]
	- add dummy-clk-sgasyncd16 for scif [5/6]
	- re-add clock-frequency on scif_clk [5/6]
	- Tidyup GIC comments [5/6]
	- Tidyup GIC regs [5/6]
	- use "renesas,scif-r8a78000" instead of "renesas,rcar-gen5-scif" [5/6]
	- Tidyup Subject [6/6]
	- Tidyup Makefile position [6/6]
	- Add explanation why it needs "maxcpus=1" [6/6]
	- 518MB -> 518MiB on memory [6/6]
	- 16666666 -> 16666600 on extal_clk [6/6]
	- Drop comment from hscif0 [6/6]

v1 -> v2
	- Add Krzysztof's Acked-by on [1/4]
	- Tidyup "cache" properties on [3/4]
	- Add "clock-" prefix on fixed-clock [3/4]
	- remove un-needed clock-frequency [3/4]
	- use "-" instead of "_" on dummy-clk-sgasyncd4 [3/4]
	- use "0" instead of "0x0" for gic [3/4]
	- cleanup "bootargs" [4/4]

Hai Pham (2):
  arm64: dts: renesas: Add R8A78000 X5H DTs
  arm64: dts: renesas: R8A78000: Add initial Ironhide support

Kuninori Morimoto (3):
  arm64: cputype: Add Cortex-A725AE definitions
  arm64: errata: Expand speculative SSBS workaround for Cortex-A725AE
  tools: arm64: Add Cortex-A725AE definitions

 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 .../boot/dts/renesas/r8a78000-ironhide.dts    |  92 +++
 arch/arm64/boot/dts/renesas/r8a78000.dtsi     | 756 ++++++++++++++++++
 arch/arm64/include/asm/cputype.h              |   2 +
 arch/arm64/kernel/cpu_errata.c                |   1 +
 arch/arm64/kernel/proton-pack.c               |   1 +
 tools/arch/arm64/include/asm/cputype.h        |   2 +
 tools/perf/util/arm-spe.c                     |   1 +
 8 files changed, 857 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000.dtsi

-- 
2.43.0


