Return-Path: <linux-renesas-soc+bounces-21998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 567D0B82E9B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 06:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E184D1BC03B3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 04:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF39A258EEA;
	Thu, 18 Sep 2025 04:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oKbjFMyd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9271172A;
	Thu, 18 Sep 2025 04:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758171257; cv=fail; b=P0eTFn5LA7vZsSS4U+aYLxMgEOgOB65xPC6U6dwbux8kOhV3fbOF86VhTtTKnF4/4dvEMk2VDb90ezFOBpQ+T+8XZ8cIk7K76uhYrQPiubzGKAh6Tk7TgLxGfT9izkWTHyyst6ACEYFisTIAxeFKSlZlYEOy28lu2SwdEVmcUc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758171257; c=relaxed/simple;
	bh=yXypC68ohr7O0KRuMg8tzR95vwnaCG5mtSAGp0fBr8U=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Bu8iZlTC8DmHeTUztJ8vpZhfB1VtQOuC4YRDPAgeC/cvtSLQj9OuERVcSKHVphQvJVtO3HHjWjierA2uE2aKsW9tP+PUfwpWx3N337RtP7yhzEhncXEJszgE/HmoijHS77FgMUz3T1ltZ29yhwMCF/VvmvhpoCufk4lKXnF2RNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oKbjFMyd; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5QzAvozFidlDQjnntiboAO8GfvgrTWrJ9xvnhrCCrYFdcRUc1USsn9C4+ewNLJPLXeUrRa8K4+3EtodxT7JYwE2GC0dIaw7R7QjHn96ENwlWegoKqTUt53Jov2m/Oly+wm9qK3pg9cRmmxfCuXhBAb6uQrhSt3V411CGa1rXXK00EQCLt5FoCgImeCM7Y8rA8VzINogiIs1TP5j+U45+DiEwK7jtpbXXLHHiDqp/kOYnnNWpKG0sQC51DZceX9veA9DgdZGGQV8Va26Y3esVs5gaJCo1EF1C2ItRY8wJjRoA/5lUwBn2OG+rpXeXuaLpFitTAaNvV4T8+Agvk2a/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjoYwSVJGH/4/3CIz33XQWk4DFhebgSGIEqkF/S4CfM=;
 b=JIN1KcKyypaPpC0SW5GJjCHQfNC6xXG7O3FTTSbfeWZw6TmJygrkimxYE0o534Ovdo95Reuz4HmQS57qCNjjyYyExkiIpfATjODjfjkZFftmCGWDCskh+hitXd0cpStcmeuYEBsFOl+iY0FoyL/JFUNoWTLnMG5rbmdz9sBTH7VApbR2lHCehZuBbPWPVGGmBZGjnAZXvi0/JL2MhdJ+kyPyo5iJl8XOUOyiVAddcUSspJyvKu8FZVrIjZdou//+RQ3doQDDJ0Bz2Jf3cckw5eVsiVl1nRwOgx45uZy2JaoTBjXTcS3xYw2scqp+YNBd6Cmwo1g57n6EJXHDh2cSTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjoYwSVJGH/4/3CIz33XQWk4DFhebgSGIEqkF/S4CfM=;
 b=oKbjFMydlNdpU1ItiG/DWiSD6k+RmmxN4VRBgf7wfXV6KOqwksSHbt3TA6c5RjpANuh4Mmwqf4MNVR5iAlE9w1Ro8uJ/NNHOSZLaxye5meEcvCZVLyHuLsYAPacRve0Qti8LdnMuSHj8MEfZz7mmtXlgfztV42/3I/yAJMMAZWA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB13965.jpnprd01.prod.outlook.com
 (2603:1096:405:220::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 04:54:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 04:54:11 +0000
Message-ID: <87tt10nyx9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Will Deacon <will@kernel.org>
Cc: "Liang,  Kan" <kan.liang@linux.intel.com>,
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
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v4 1/5] arm64: cputype: Add Cortex-A725AE definitions
In-Reply-To: <aMqitjILn1GomkXt@willie-the-truck>
References: <87ecs5abp9.wl-kuninori.morimoto.gx@renesas.com>
	<87bjn9abne.wl-kuninori.morimoto.gx@renesas.com>
	<aMqitjILn1GomkXt@willie-the-truck>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Sep 2025 04:54:10 +0000
X-ClientProxiedBy: TYWPR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB13965:EE_
X-MS-Office365-Filtering-Correlation-Id: c2dc150a-8722-444b-95fc-08ddf66f6888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4BHfNPS6NAwDH30pWJLU8Lds77px/NBmhGJe8pFGOQ7UABCepnHQYkVsiU/m?=
 =?us-ascii?Q?BUpfyn/UTHWewxnVHnCB+RNFwEPtxEcl4WDeqW3pLu+yxmeznOPt5G4hHWGO?=
 =?us-ascii?Q?q/8rTc1eB6N0G3KzY4rpI6WzdZo+cVzLZqhVPhPZ+GkxAAUbjwF0n4UnBsFt?=
 =?us-ascii?Q?hmA9IufhXIuc2MIY9GC104uH6Q7RsGtixKKtSxQVGGbnHF97oFCZr69Prh8t?=
 =?us-ascii?Q?+rUTh8cqQrdnwDk78bkVYAEmNqQwfMUmj/aulEdq+fxaKj5Emi+j1W9SOmqL?=
 =?us-ascii?Q?1MuqOqFpTpZ4R4hWcrYTBxTPEQkF/dxtaYJFysfjZn3zD8I8vB4rAFMtvMVr?=
 =?us-ascii?Q?atZN4Z1dEjuHWt5xdJ8EfXDW/v3VyIAEBTwMfwSyrbJiZGJufIW5gmQ+LPWZ?=
 =?us-ascii?Q?sXMM56LkMqNwt+7ih/y4atg7Pl1IAWL8nb4wED5HeU+vBmQ3EO7yVVMocSUG?=
 =?us-ascii?Q?HJb54bS50hjTlQ3Kh7JqAwxAif1TrLk8eboQKiOQgx8qJeWY55acMKbff3K9?=
 =?us-ascii?Q?atsxN7ZEy/CE+UNcm9jxCH2qw3x3m68StKxJzDz31BSt0WsmI8PhZ6DqEbsH?=
 =?us-ascii?Q?YHFfnXcElMTgX3r5nHai9gGmKT27CNi/zQ6ETJrD1OtpkPcU4RcWslx1JkO7?=
 =?us-ascii?Q?QI9r2hDp8v0TgBR6ISMNx4SulC9C/Ca7pVkt682qum+O4R30L1z+E4Ufzfc6?=
 =?us-ascii?Q?kKPz7d6vl12aDI+jUibYRVnIVpzX7d3wZkZdcke4e3chRe4bCXH7x0AoXrLe?=
 =?us-ascii?Q?1c+xZCtrPEfqUTUzg54hCznsDhgVGvn/1uxKCjV9dbm0+pJljkJU4nToeKV/?=
 =?us-ascii?Q?PQEDWBEqIHxgBXLiyvMgKBAw8FZUpOMyTWmFeDU9z5w4atja1U+q+nVhtfP4?=
 =?us-ascii?Q?nO+dJ4Vi3DPVBxs+HeZ+vwbqACdzrQ2L7UsMPK2bZgDyWvbC+m439Ct+78hY?=
 =?us-ascii?Q?wZeFMr+46IZObFDsNkJBEV73C2rzFyTMk7bfcNQFigTkeBhNIrg2eo9Nin7c?=
 =?us-ascii?Q?81qNf510aBz9R7xdovr4sM+bc+dhPTFzn7wbQIptlkQ+aTUb/4D4coBPgTIk?=
 =?us-ascii?Q?R9fTmY58t8N2jFQn6A7cS3pGNjG5GgvC0W1Z6D+w5Oh9T1JZT4OXPp6+Nq1I?=
 =?us-ascii?Q?1ZQkqmGGstJLx5Gr5DU3quIAins4+OFvkAteksC/uM/qk2Bw+ml9YCib4Vff?=
 =?us-ascii?Q?Plpatr634H4xJN1G/OXdSb/7gaWgcgYIdVJLkRQTclRiv6cTHfRtPO/PzPHP?=
 =?us-ascii?Q?s5rJZt+R9U+vF+xSB7JCSDYKaqRAxumYWlkdJTonIQ2sZNykC5ODgncm8Sg4?=
 =?us-ascii?Q?k4c2x6W8s77IC0ZsdQM5IlD6zTol8HMcqTni2yWq3GALlsWbYdhIPMB2wHkQ?=
 =?us-ascii?Q?3VyTF17fbnhHy8+nf8in2nfp30SQ2jXz0zr/dLoair5COAyhyDui/XXXYwaq?=
 =?us-ascii?Q?4/WH8J4T1HYgAz1HxayBKy/WJNnqwPd66Opg9HcouGKY0EjhNydvWGarC7M8?=
 =?us-ascii?Q?uBedrl/uiWetQj8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?24y/N2E+thzbqrrAZKlRoy/adiw1eHwyVUtNPDTOuSDpp/3Zi/lMkKIqUbws?=
 =?us-ascii?Q?3zqywGO5S9IfcEARaH6h0H0HuLIsVwcLMG4kzLMu8CU7Xeo1Nzd3e5tOAY8R?=
 =?us-ascii?Q?gZEUYz4M62BXQ3naV5WuSgZDTSCeTYoDhHX4jtGEwaUSCJRLkq4/YeTaIKKP?=
 =?us-ascii?Q?+p8aca1m5OpHOQ661NLkTDJxXrQlHj0iXRUFnMLAbTSlE3o6zvC46z7Tyc2G?=
 =?us-ascii?Q?ib0UygJ2wMC/f9ihAbIscDqQjA+ZNMBjyN8aTPtYzAm4jRjQ1mjsLlJgcEyC?=
 =?us-ascii?Q?1j5Wg5FbkfJIwjnK/12mmG1zPqNyYfUa4VDG66tz6DjbnWGDtuo2xA0VIZmQ?=
 =?us-ascii?Q?RbnY2wL1lwmQZXaSubUqr0r43ahEe2TG2fUO5MjX8lN1DgJVP1O+Wb2ZA9Il?=
 =?us-ascii?Q?2+CVLMiyWZMqzxnxYXpWVWRIUOA1biMGdhy/7Q2nO8YlQ4+JPQ3nHd4fCFpS?=
 =?us-ascii?Q?W71FqwedlG/mVTyLSbWIyPRnMdl18M7y8bStkfGzsIpOdjHNEC/N4VPgCCZh?=
 =?us-ascii?Q?9H0DpxhJleowh2KKjsNW/AM85rYKuNtK4O54SllyOBAKZBIiGGik1TfByt+b?=
 =?us-ascii?Q?H78nQgZ+I5AB9lznG1+pgdL6SaUKTshYQG0BB3wpIfXjxTWmOWUqSDYVaLFt?=
 =?us-ascii?Q?TKABfGrNS2sf3RaCfb0X3SenyOd6Vp8ry0qDPGxwZl0zc7kN3d/51pjz30GD?=
 =?us-ascii?Q?KEmY+vaqPaV0SkszZW0wuKMhSz5SsHL0CAwPkLkl+B2L7C38GYcZgInbvzUR?=
 =?us-ascii?Q?8lfYcgKa1aS5nluIMrKLLmCHzdIZ7jr1ueqjcWF8Si2jr27oBQrtS6JbsiKv?=
 =?us-ascii?Q?S9/4wKQA+omdlNGfRwtpBcw+/C86t9rCkB9I0oC5qJtJ0Ps0WPw5WaToprSf?=
 =?us-ascii?Q?cMkd5Keh2cAoKQ+z/F9T1Pn18NUTjI6ksRx5EEBfiDesm/kYKDU0Uk6y6/Pw?=
 =?us-ascii?Q?IFQ8Xx26J60OBRIrA8JrouROwhjHqcTmIADRPsFGfBMmN1HDp9YImm/GiCOz?=
 =?us-ascii?Q?jh0VqFJMZ5Tb5Q3NaJNQHP1owkqEtQYl4oI0/ovi6IquqXKt4uXdla8ipFfp?=
 =?us-ascii?Q?/R3DRU8SCZ6lLQ/iRuEWxSI5i2L/w5/Sh9JBJQv+Vw0AWCG0CGdvHVvnUr5C?=
 =?us-ascii?Q?3ditiCtg0nOTXcyz7mbM1RxXYpmUTtnSjm8NCim8BoAfrl5gjHb39WFL01FU?=
 =?us-ascii?Q?6NdD434BmgKdO1eCpNh3LnqqRSHChWRjYYmg7bRKq6PAL9n0JGR8Sp3/RzDs?=
 =?us-ascii?Q?MsqWd1DIdrNjSuPIf1a6eNCubbSfDz7jwkQptQqzT5Oc9tefOaXW1v8U4w3+?=
 =?us-ascii?Q?3A4YPo4Vm9J71NHYlhFYrEhXcD1jjkyFkwOuWKTtl0B9d+csekOSL4szBrle?=
 =?us-ascii?Q?a34WLndFP1hS7/NVe4AGxA+nPi48VSQVSGClZX5sNfJveEeHeXA7ZWAGP4CN?=
 =?us-ascii?Q?q2KMcHzDyVXCoAsvMEMIXBemcNZtAX5u03pKEbXiY+Q2HRClYsEnMfOl9dN9?=
 =?us-ascii?Q?n4JEeWW1/q5yfme9SCff+Q/f+Ta8Em92GjfFIHG5ERoROXVBffy+QvvN/w61?=
 =?us-ascii?Q?KRUK41NS+f6mz6/shMt1a1dThqaiMrs3RWjWjz4di1aTcOapQkgijsvTgtiY?=
 =?us-ascii?Q?JXF2iVl66d6zOmR5Ih9Q6rY=3D?=
Content-Transfer-Encoding: 7bit
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2dc150a-8722-444b-95fc-08ddf66f6888
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 04:54:11.3661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/z0iV0+vk/xTJNfuWsLtw51afXIWY1cWQjO5uUzcjBirE/cNkSALY/9WVsUEXLhFTpoE1/7kSUS+wC4LKWDV7QHZOHIKXQhiSMdwME+UOf5VshT1M9jxkTwzDZWRznQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13965


Hi Will

Thank you for your feedback

> > Add cputype definitions for Cortex-A725AE. These will be used for errata
> > detection in subsequent patches.
> > 
> > These values can be found in the Cortex-A725AE TRM:
> > 
> > https://developer.arm.com/documentation/102828/0001/
> > 
> > ... in Table A-187
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
(snip)
> You seem to have sent the same patch twice but in both cases you're adding
> A720AE whereas the commit message says A725AE.

Grr indeed.
Thank you for pointing it. Will fix in v5


Thank you for your help !!

Best regards
---
Kuninori Morimoto

