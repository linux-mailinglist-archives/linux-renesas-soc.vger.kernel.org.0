Return-Path: <linux-renesas-soc+bounces-21888-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 756ACB58BEB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 04:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BB817B1219
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 02:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02EB225A2C9;
	Tue, 16 Sep 2025 02:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZiPQR4A9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2074.outbound.protection.outlook.com [40.107.113.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E7B24DD00;
	Tue, 16 Sep 2025 02:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757990278; cv=fail; b=kpcMH+eql/ZFYQLoDuSGpP0jSTnlfImocwyfWICmXML1XpHrhjNC0MMZZqWIYOphgmF9xYiV7giYNBdn0AW5gO+NdFogH8yGRtdKzb4jKMLISlWtgzeeQdGMxvVl9S/y46qLUYvFlAlMR0JzAb+g8LagZckTQSD7irva+CbbaTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757990278; c=relaxed/simple;
	bh=qGR2Rq5i03WAz6ITExyDSAWzKm1QeiAAcd1UFIDYrVY=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=IxaY+z6Bd1lJ4j85DJnJdCdnbPjypnEQCwdTY4pEDsS/wsIj2+qh4SmZ/gozzsNtX3K/GIww56CAWjtyKa9DWcKj5hd4xtRW2E419vBmB0uwPGybmbnJ3bekZD8Tuf7ujih0aoZB1gMmwV/ANYPQc1q0Gk4e9p9lisf1El6bvvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZiPQR4A9; arc=fail smtp.client-ip=40.107.113.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7J0u3G7Odkh03aT7fGgkUU+eZyRXhgZhL9SyVfEWDD90rQFUFGN4D/X8/eY9fVWvMkULqZPKc0mZ/M40j4WAZu0SFjrYeZQnb0/3cRffA82jxlmi5+TG26J/uK25WnlmLaDP63yATvN/USKZPUpKnS3iubH7Ol2+EwJoUNhHEI9A4sX2/FqW5pOBjgCoLZMolxjSeP3g5F2Q9K97X5x2T9xL3IJ5Hs/GRc5Zan1vJfYIHoFvm+eT60UGAWQevtad/ClkZiFP+5iaV9EZCigFRCzLkwhJdr3S5RsJaNH/TL1jQf3T1XLN1bO9ED7AQTnNKj8tx0M01wyBR0eW+nrjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4DaACvVY9ADbiczstFJibHvEmsXMmg3pZMpZ1RTIfY=;
 b=bpDjFNjscrMtnqT8HfxQEG93qDi+dRwPTlQTLR2ItGtTKdFLaHTvgkqYbdehUily/oYHNBJOVbml8c4QUcumIa+LzEAcGECJcCO+hfRGCDHvN0mptuhYG4oeMjQZsnycc8m09KhAEccZ94Nb+nYj62zx2FbAqEWTpgTNuXLERnqCGQizUIylWX5Lz16NO3G+ej9GRFNxQSIOb8pz9efbPyjy3r3xL/xzyDN68INedOPMJFlF/0uzHMhePx8L0JeQpqW88rQHJPGTGfK81mIfXzPKRtaY1z8fjCv3e5AlbS+BJfLCtcxOMgK7sn5i61NAdU8NS7Gq01BM5pSPOle0Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4DaACvVY9ADbiczstFJibHvEmsXMmg3pZMpZ1RTIfY=;
 b=ZiPQR4A9EuxOByscvfqncYB7MWxddkM136N31qqs/t1NL56+HQ+KD/RGWFiY6Q/EuDDdrrfKWSQxo5XTzKhKFGq6USmEBQxTLw81ZUsTK+izB/OYNF8yPS4KvCviBf9oLkpkyR8RG08J66eXsMSOy/XNOPM4ixGrriNldJUNVYA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13477.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 02:37:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 02:37:51 +0000
Message-ID: <87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com>
To: "Liang,  Kan" <kan.liang@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@redhat.com>, James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Leo Yan <leo.yan@linux.dev>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mike Leach <mike.leach@linaro.org>, Namhyung Kim <namhyung@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.
 infradead.org, linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 0/6] arm64: add R8A78000 support
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Sep 2025 02:37:50 +0000
X-ClientProxiedBy: TYCP286CA0094.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13477:EE_
X-MS-Office365-Filtering-Correlation-Id: bc876507-3f51-49ae-4579-08ddf4ca0801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?otzT1xMUnDVurxS0sl6ZAPq8JDKEYzypJrAcl9tAbiL6XKS6cTrhEPmgCcnC?=
 =?us-ascii?Q?aT16jQd9fo2i2ES5J61VHXjRKp9G+ZV7Of+JPj42VPZ8JmlR1nf1FzoUXXmC?=
 =?us-ascii?Q?WLJTXhJWqilCJMImIdznnBK0mwz4R775jEGo3Ep+TMtZVCmWblZVcIzwAXQp?=
 =?us-ascii?Q?ksfJTJ/5j9R8WLe/GDwASxM72oP9V1euTdS75lgSgN+LDAcepqJtIzA596Ch?=
 =?us-ascii?Q?OpQFxl2R4IplCzB2RW8r7tR0J/WXhAPC2toMTkOpFmPoGWsjE0BuVsX4PTMn?=
 =?us-ascii?Q?FL0GDWy4gwrEyB2QFivcTaFT7haIoi9NuZJB/cXuWeHsxWjlIAt/LWAe4e53?=
 =?us-ascii?Q?jjpXd9YCXWIMchNDifBkbYeOP+nhR5OgqkBC7iGlA9mnPHuw3SRHZg7Y0a/E?=
 =?us-ascii?Q?4X7qJs0zuEJY6w68eNO63pHrauBwtJwWYcKb7M7JJSDulSLLfgN44eSRVYda?=
 =?us-ascii?Q?cXM8EoD+gyP1mDnEzqKeoTKVYHxgqWZfQEKePG4lmHCElN0i0YP3TFwQtpoV?=
 =?us-ascii?Q?UWZlQjInNOb8L8OT9N+3X6DqU7B51US6+o1czqbk4JALxKtxK8g81mnpi19u?=
 =?us-ascii?Q?xUzB/UDJUz0DM9ZM27MUSIsH7VjEAEu3emfvG033u0ZdiZctFG1qjjQXfAKz?=
 =?us-ascii?Q?JgjZMxdmkmu3PB9+lweXd5T+e2GEws+Whk0C/nGG51mamh63ZV/VXxXan3Hj?=
 =?us-ascii?Q?cxv4IT6eKPzXZKbi90Spkq76m5nUFo9dZtC0jzm5sMQJxYsactVAihfxyhTT?=
 =?us-ascii?Q?WJXqzdTELMQYzg3CfaOASc0FobNcweq/yMRuSkNvjbyeehbsszxQHNk8PvQm?=
 =?us-ascii?Q?uG5AJ2XYixpApSPhTImQHloJ3kzKrYt+gwWLUTzS/hZv1aG+6OvM1d/U/N/Y?=
 =?us-ascii?Q?BEEZjTR5DzwFhznn38n3rfsNi7jyzsyu8IcTOW+jS4wuDPwNQF24d4aECfbx?=
 =?us-ascii?Q?vgp3CWs0+Mrs7DFDRCzPI+bR/GZSESfsMAQAFVOfAvDzYDlp65vUn2PbFO2X?=
 =?us-ascii?Q?785l55nAuheS7aCy4F8ir1aWsdyzDBWXTzhJ/yhMGDtxQodnBZfDi9sL15q0?=
 =?us-ascii?Q?QHZzMOQO1X+y//e1D3rFqyf+yqwj9zELSsc4IjJVMlsJCzr8ndGmSb6Ox1yy?=
 =?us-ascii?Q?xYPWdZJdK+bNeKtIVf3D0PtsegYbxaso8AoVlrj5VY1tW2Ze8sH9l5sqrrSJ?=
 =?us-ascii?Q?0cOZ/kXZlSJMBG20rcQq5i64sU7RZEeUPL1Dq31877+qEGsmHimdUohNqxj4?=
 =?us-ascii?Q?KPSe/uTZTxA+jmHdsFsaQGWgxbNBkRmTdVx6m/Q0ceSUbHsez7X4mn+sGJuP?=
 =?us-ascii?Q?2ZDUQPHYa3tMwjgKtT66Ule0rqQt87D3jZ+bd3eqH9XgfxW6S7FlW4djep5v?=
 =?us-ascii?Q?w7UvKtq3ZVtIToAJLsUpy7gsop8KTnf+N739VRbrdE2BDzbFItLkCvBAWBS3?=
 =?us-ascii?Q?HlsBHfiW8V+hpEpKKTTKXIwJ5WYt5v8vepzBiCbgejMkgDp18S66Nw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NntEiWUK8PD5tHK4NVaK4J89WiRNeeXXBrEdElfDdXqsOVbCpiJV2q2sy+py?=
 =?us-ascii?Q?5OIEsLi7opX/1wUR2WtB+kiB0ycznZTq0467SWqEq1HiT0JnTxc5Yx7cOTy9?=
 =?us-ascii?Q?hidKP5jfZmBegNWCREg+7FqX9LBiLfkr/ncvZxSYso7yjl/hTWuVwlvdzTXP?=
 =?us-ascii?Q?7Hz+JfTWwEegVqYOXtaXHULMxoo6+s6gezfMB08jqwSxlzhDcno4hHCmAkcU?=
 =?us-ascii?Q?iCKQ/Le4ZhuVCmjhqPL+GFHfb83qBonXKswrjQJTnsiu232byR545yE4/n94?=
 =?us-ascii?Q?iEvlfrZQWKtM6yoZ1KTpxBmzgz6R0yzKDy4dSdhSL/KlXsL53OrpIpNBjpLJ?=
 =?us-ascii?Q?TtinMlPogTOmJaTS8poQHV+CWQqdrYY1R7qZ+Jodb+DfEAro+4TweZegTfNA?=
 =?us-ascii?Q?LBE+REWXngKMiUZdbzbhuALC2/cqLzwhEN+SceQAi8XaUIeYQs/8z2CJgdh6?=
 =?us-ascii?Q?4gwFDNw2u0qq4KnuZ5IR5X4YuxeVnhldQ0HiKyfBoTCpP4TjNm0RQfmmO7MT?=
 =?us-ascii?Q?2L2n3fJjU64jauH9u2PgL8orvdFQZ7eS3xTs7p/fHXggZr5bIlguJL/IzuiH?=
 =?us-ascii?Q?PA9qTpyyfeKgSCHW1rZpEyJYkl/0LfPg+pQjd35itCC7f6mr2Ro7B4Y+v82u?=
 =?us-ascii?Q?Cg1yBeu0OpJgqKZHKhNxwY1L48vjAMF66vb4gqII3TBB328rpmhvfSPGEiyk?=
 =?us-ascii?Q?pvlvBXTM235vpM+/amOm2zw/vjU2yYsLxMc8icov4sVWyohK2lE/PaW+8VqW?=
 =?us-ascii?Q?FWwSsWrN3VKAAvXm2NF0BEi6vrqlu46HbJiqlPRgp0UAXrQoViWQowWpceAM?=
 =?us-ascii?Q?nOjBMFjHVkeNCXGuZgHSBWr2+ERk0Hli4zfh43kzEoS2pU0aagr1bSaci1e/?=
 =?us-ascii?Q?y710Jk6pR9H1OHb3RVVJaJmpLpTEMyTwUlukbTbfsqbJvjnZCqnzwnHVnozx?=
 =?us-ascii?Q?etMOC/fr4Jr8IuWhQ+EWDAw+nU710/zjU+WT/mbuTgDbhNuKnTutDpe+9jR0?=
 =?us-ascii?Q?lXQG+lfGkstRHH+tKVKWynRmWcOsECdQoaupye26JuNuGNv35JPZBoUxHqD7?=
 =?us-ascii?Q?L2u/qW6AowKLlpI6YTjhBmDZdofJspoRd26qPWvkEff8x77DfPWPD+kQCBFc?=
 =?us-ascii?Q?UPtyJSb8Zl2CUWYE31UF+8YTKVtqaB/wFz3iiwO5QnsAvAEzrKh4LkVvh1Nf?=
 =?us-ascii?Q?XaH+pEPN9KZBLagSLwY4uimQQxZJQZSzJt0v3becyaCp8RVhzu6l+2ECw6/p?=
 =?us-ascii?Q?7Zsx5CNA4OHOHJMgMkw31lcKrX4c7GaZ8ZmhAb2RF5Li36my9v8R+TKHc4qE?=
 =?us-ascii?Q?YVYxKfrbMz26F3LjvmbBTcUsc5W/zsqMOxF5T3vLACaR8SqowpZmGNvikGv0?=
 =?us-ascii?Q?9uTHbIxs8rF0NBI+Vq9RbnB+LD8dwq6CzN6VnOR/TNgHjBHw9waMsKbrjfE+?=
 =?us-ascii?Q?FU0unJrwaluw31UZhlzbaV09c1T/lgWPDdWAOO6uEY1zIxfQ85eDBskb+zUb?=
 =?us-ascii?Q?DS6CQ/NZGB+RGp+BoaLT7b5Vu9+sWYFpqdyAMOrliS3RslzTzNmRus2XQSjx?=
 =?us-ascii?Q?PObrCE5e/UN9lVA6CBk6jG/Fidba6FFnEI4wRu+8N4nsrZ4i5NlanHosPoNl?=
 =?us-ascii?Q?0oCfFO0ZNzE5SHudjG5nq3U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc876507-3f51-49ae-4579-08ddf4ca0801
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 02:37:51.2691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AuAkaN3vm+KTALOKt/2tKj8uNi7GuXdTa+HqCtZ6+vJniBZWy+XSq6MfEB+QASkuRGboTSlDAYB6ljd6hX8rF4SZe06YO+dQriOqAd8BrVroOHn6DL9ZEortsxaobVVF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13477


Hi Geert

This is v3 of R8A78000 support for Renesas.

This patch-set adds R8A78000 and Ironhide board support.
It is based on SDK v4.28.0 or later. It will be released at end of Oct.

Link: https://lore.kernel.org/r/87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com

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


Duy Nguyen (1):
  soc: renesas: Identify R-Car X5H

Hai Pham (2):
  arm64: dts: renesas: Add R8A78000 X5H DTs
  arm64: dts: renesas: R8A78000: Add initial Ironhide support

Kuninori Morimoto (3):
  dt-bindings: soc: renesas: Document R-Car X5H Ironhide
  arm64: cputype: Add Cortex-A720AE definitions
  dt-bindings: arm: cpus: Add Cortex-A720AE

 .../devicetree/bindings/arm/cpus.yaml         |   1 +
 .../bindings/soc/renesas/renesas.yaml         |   6 +
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 .../boot/dts/renesas/r8a78000-ironhide.dts    |  92 +++
 arch/arm64/boot/dts/renesas/r8a78000.dtsi     | 756 ++++++++++++++++++
 arch/arm64/include/asm/cputype.h              |   2 +
 arch/arm64/kernel/cpu_errata.c                |   1 +
 arch/arm64/kernel/proton-pack.c               |   1 +
 drivers/soc/renesas/Kconfig                   |  12 +
 drivers/soc/renesas/renesas-soc.c             |  12 +
 tools/arch/arm64/include/asm/cputype.h        |   2 +
 tools/perf/util/arm-spe.c                     |   1 +
 12 files changed, 888 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000.dtsi

-- 
2.43.0


