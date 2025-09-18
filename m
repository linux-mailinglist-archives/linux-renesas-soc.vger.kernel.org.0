Return-Path: <linux-renesas-soc+bounces-22001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2AFB831EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 08:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 371C41C21CBD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 06:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4BA2D879F;
	Thu, 18 Sep 2025 06:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WCBSeRwM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010065.outbound.protection.outlook.com [52.101.228.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476632D63E8;
	Thu, 18 Sep 2025 06:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758176594; cv=fail; b=Z7Eb9fiCIyom+OYXo2uoBLLS6zDMkQ1rUpQw7B8brs9WoNQbjeuCqyGOBp859q0/nY+ityoDJf8pWJ/nVg4mgBoP1QKHPodEItB4D1WONeYPcBeMXmhV8665s4hyEGL9aKPt3LbXEd24gaKUT5vyuz+I1ZWPWsDyxh7A5XnVZ7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758176594; c=relaxed/simple;
	bh=7ernMnsACb50o0r+6+tbFqo9ajSqL+ntP0wqmW5ysyw=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=HUcZIZ+MHu8L4+SBLza0nL1EN7lD0VyzMDqPz8HRr9A/oi8e5oGPGnZCBXeXiTt04qKeilNbBkAPkfkZFDl/puZI8alOBeY45pIH07Bc7HsqRQkyEV4oRkvB4BOwUQHpvK45npOOEH2QFw6+Lu6jOn90El4PUV0U3OXeVICWSXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WCBSeRwM; arc=fail smtp.client-ip=52.101.228.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYmffnZiKrxZQp51+z/r7wHKtiSD56406KoS5GV/wbRFALjvh60I0eqcc7kHlNpJw3q/MWVpWbbTCDyu6gNhnP61oomTOjFi2YS1KWe2xpTAYZqvrEG8BhLdS4qKzYvnV/yoYtL5c5cCrBR+kk37pEqhgA/Sl0KRuNa+crl83aSHpXlXG+ji4sQMydcOF7ifxDpHv3DKzMPyxA5rZ/Fqm+5FECkegHqjnFZFIgq2e4hR2HYKT8isFacLLbicJ3xyZrSpTOWa5dLwXK3T08+qGaFSNglDzVsd0BzwxpitHcLIvVjenhCXFpGgo2mGM/CIUTGDXf/1CvZ04EQfPW4fCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yoH6cXC3Osa46Uc7UVy2E0U9zOtCd3652utCmq63Gk=;
 b=FMSbF6/0m9VY18HaSHOibbNhgPTBsTEGVlU/Q+NYAha2tKY/2/ZtzPirnAoSs80IGO/fv2YewA13QcKBlTrPMzcwvulV2bd+/nDuS9Hz44Y9Pqwp7E/i22sZhJR3HXyu5RViXfKv+S4XH/Y0sXt78Q7hNINRbK80FdNHRc5YTBqreDYXhjz0Bcf/DypNUCV4C6c/ZGFeqLY+cz+ZZSYv/UUwpzm7qeyJ3VMM8SYk4voFOqG0z/qzVKudQhj0yHDqQ9dWNZFnTUU/QHi5xjAsqi0O114SSxRpBgItxEzQG9AnPbdtJR5GEbmiy8HeiUF5B2q98fwKyWo7q9DvrsEBCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yoH6cXC3Osa46Uc7UVy2E0U9zOtCd3652utCmq63Gk=;
 b=WCBSeRwMT8mRT5RQ2+xfTH4hc77xxAmVCBkFb+TazXTjYe3IEj9MWz0NWQnTa+UjXnyMMc/2FxOvlLxCxt7Q8T8dPgyfcZf5XtmG8SGKUwnKziWQ8x8zBL2ybnQtem1Em5GXnAks8WJ04lQUBu5mk4TiLpciOJyWpUnOpc9+5oI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9517.jpnprd01.prod.outlook.com
 (2603:1096:604:1d2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Thu, 18 Sep
 2025 06:23:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 06:23:08 +0000
Message-ID: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Liang,  Kan" <kan.liang@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@redhat.com>, James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>, John Garry <john.g.garry@oracle.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Leo Yan <leo.yan@linux.dev>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mike Leach <mike.leach@linaro.org>, Namhyung Kim <namhyung@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.
 infradead.org, linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Subject: [PATCH v5 0/7] arm64: add R8A78000 support
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Sep 2025 06:23:07 +0000
X-ClientProxiedBy: TYCP286CA0147.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9517:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d1fd394-f079-47a8-c8e8-08ddf67bd570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CJNiz5D6QMVJqcDEODrZra1DxXfx40DK1K/Z8AImBMss+TL+1Az9TItiIUiw?=
 =?us-ascii?Q?Hak0HhoHbfJLHuQrVYy8bYuG23Vqm/I9eQg9HLszvJSTvapo1+0TGg2v97fc?=
 =?us-ascii?Q?RDg23bCvtiz9CJfqT3DDaTOEnKGAKJUtQoa6hkoGliKPA9d7BFYIimkdVZhR?=
 =?us-ascii?Q?3X7/TLC4XCwVczA70jHBAqv3820HHD0+8ebvt9uh1zVMV6/JpkMPxl5AkxDR?=
 =?us-ascii?Q?PPeArQgmozYRcxpGfHfIT87gNuFnJyePjDFew9lcGJQgTIX3fntlCIoqtT6K?=
 =?us-ascii?Q?52fZgXjwKREZ1Nv2q0UERBbEZcRSvrfUqbJRlnNjkVke5Wy6TW15iEaPBFMP?=
 =?us-ascii?Q?f5fu/WOiE7LznkNbh2Mlt2JtEmlgRwybPCBQe7gQyHY00Hb0+59cve436eDS?=
 =?us-ascii?Q?13R7svYWFd1Yhzu5MtXVLSZFFFx5Qm9XZz5I+ujq6x7eZmZbFZxcsNzJP03/?=
 =?us-ascii?Q?6fKGTwOSAh9oa4CLRYJ7s7RECoPGQNAwW1HSbx4XLgiP6K8rGA1vTryJgTB2?=
 =?us-ascii?Q?aEWfQEmIjfd0OnMVFX2IcrWZgM+vIRNSoU3ZGRgMXjNMNtNUJT7KBIhoZR0c?=
 =?us-ascii?Q?K7NfRSClUSKObxK9kg6/zNwaNvIYqB7e9gqI92Z7m1n7GL6aT5uXuOhd5673?=
 =?us-ascii?Q?tlFwjhMXpfLo1KJmYtYS/61zsqhPex2RNMdOvyXDQVxS3lpSlTzVlGxN4K78?=
 =?us-ascii?Q?nCf4HKFbuR4zf825ZdcyYFNd38NSu3ivVdd8EACttk5Edlc8vjgHJGIKhyRd?=
 =?us-ascii?Q?+QjwciADx0OIz+C2va/vpiLgaolb6f71H04hK/aiSyKYlPh7qAZ+0Ny8AeHX?=
 =?us-ascii?Q?96Erqn3+9HtweCcaGYYp9QTMWJfPK1ChmqIp1c4RgKdNd+n5pGnWvDLwcp04?=
 =?us-ascii?Q?4YN5mrOmvdnQDKy/uyA9GEslZ3Yvji9807+CtbdvZaxMh/cjmQtRmBuxp/qi?=
 =?us-ascii?Q?HZlUY3RZu7SNxC5K2o+69mT6EbMm+M7Cl3Ns7VO7Oc74SZun1iT6viDZ5n2O?=
 =?us-ascii?Q?K58C6TKh5tSxXAW82WZG8vybFldYYBaNBOT1opHqSe/njv384TZneH3d/tiI?=
 =?us-ascii?Q?XpDQvuDEBWnBsCnvFRkL/SxYWJGn64cH+7nWMPgciyevDWRby2gh2UWvBu4H?=
 =?us-ascii?Q?mLYOlLxuDCwmqjngUmpvKdn8kJo9AG74HHlCbU/tekigSfsnik5KN4Ph678h?=
 =?us-ascii?Q?NpWm4XGQd4CaB0cqkpTx9pvqgXFdYbbCOPTe3rxEDjYFSqW81vGFv4jweIPr?=
 =?us-ascii?Q?qjj9HiGNRoblNNqLKg9+pg4Vstb4+LjjunA6LNtlZrGycpbnicvS8hZ9giEB?=
 =?us-ascii?Q?Uvo80mo5PSiFn781fia1eQHhDwZoY+3aH0PdciyrSKoyljr8356m6UPuNke4?=
 =?us-ascii?Q?NRIZEK0ydpgK3enLIBTp9mSOKbIoOYed54AjTm7wjgvCFgyi6dXaRS3L41Zv?=
 =?us-ascii?Q?oID3szvWHMZtA0AZFW3azJhQXs5dCaROjbHIsaYZZ8hTQ2uREPjTlg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zs2mxEd1KsEUnJt3WNP+MgvAKc+JWfnU4R2KGPOsRdJBrucAhBFHHShfK5eB?=
 =?us-ascii?Q?mCq++eHlEfvFkR9aC6hg7eNmlIUmgJDgQmYYareFuxquJJwFRMxiHTxz8M0m?=
 =?us-ascii?Q?rL+y86y2mh/cGWfdTamGYn6Gw3PNRrWYmxczo27ifNo55Wk43ciM7GMABaKM?=
 =?us-ascii?Q?kv4AFkDmO1Cg6dC8amHOg6mLJ8b98DmDHXnYZ024hsAQ3ILqxlkQqoziJHtj?=
 =?us-ascii?Q?flYlU1WVb8uYcoyGrg9NwT3cyn5C8OMg0xE0uxzSIo9E8yAirj5W9pKIbnCY?=
 =?us-ascii?Q?K2d5tUDpQ/e/sswfXJtghdu4NtGW6ZQUx4rPqW0ka6ZremKgUlLOstFz9ARH?=
 =?us-ascii?Q?wQhTeKEomZHFnlJ7agIvD6LHNGVbFeNLXVSyhoP6t5nI6qYUqbXZT04wkdPG?=
 =?us-ascii?Q?yAU2TmLJhbZCVEz23z1K6NYRpYRJonoWBb/233wtORgMAHIbjcFNscpomQHE?=
 =?us-ascii?Q?ce6g5avwgQY+dHjd5b3jTAk99VaurPMBGWLjlZrIKm9lQk4gHJJ45o75Vr39?=
 =?us-ascii?Q?iceAPXSPXTwwF5VR90NtqOFWg84jxpdRCvBPn8E9JQuNk1znO5DHe2L4K8Xz?=
 =?us-ascii?Q?FO+2gU/riG23/4EzUmfT09V199jxSV9nfaJJMlgU9OMpbSRjs2PRMz7Q4uNO?=
 =?us-ascii?Q?CeXTgOMUBwhdubCgC8Yfj6rw4mS2kWzOPsv6OnBMLauMXEkT7LNeqdrdPsqy?=
 =?us-ascii?Q?oJkiix8JAj6byuVP61GzAnSahXUuRVepl4Oo/I3mPaKdGSW+/uNpBR7kWYi9?=
 =?us-ascii?Q?YokC321z00ie9Ix9KnowUqF90btjqsF7VyyftlSirgsm0/3Y+bjY+jXsa6iH?=
 =?us-ascii?Q?A6bzyglNW6lIAjwf0/Udtvuugs0SxzX3kUzXA1p5f78zoLGkIzdAwX8gYVtS?=
 =?us-ascii?Q?c4eJtZEtqHPYYL8QejgrH++8AOKnVHWn0cHpdnI5bUpci+QzeWmO7JxCI2D5?=
 =?us-ascii?Q?4exJSog82t1v+bBS+px9/03ipWCAK43kqLWuApACJJfKvnwsdLiCKVvNsKFa?=
 =?us-ascii?Q?Ui0tARkx7+UZSyd8MPy+Z/tJWRRYi3zJT4PBPDL4j3GX6exByS9EvsKKAEIF?=
 =?us-ascii?Q?qOJA9ceybXQRScW8LIYTJ4iW645R68J/Rli3Ptt5Wp6CnlKcuaBXC3pZJoPt?=
 =?us-ascii?Q?od52e4m2mjmmVDazfkW+a4h8f5/UmrzOd7VYCKpPanwaIj3lv2MncmkZRP5H?=
 =?us-ascii?Q?zXbzjbnJ4GMxJPCXkvppFKcSWX5pi7abLmRPD5lpX5F/LlCVHeidj/RYWzWP?=
 =?us-ascii?Q?y+8FajRSGXawubdajnagq7dGbpgvNa8Y3Oz8uCLTb0i4vOPEPWwsTjHzuKyZ?=
 =?us-ascii?Q?yDs3NAlb70UfXVdsPhyAXyW/TNamSX5CCUzrJsevA/crxOPezpvTGKYpvKDb?=
 =?us-ascii?Q?krhA/4TFs9fNGogX9n3bLL+z7LylsYnsjCPUv8gl+bLakfm4dlSnxZH9vyZ+?=
 =?us-ascii?Q?yen6EYLgoYEZ4WsUGPKQfMZrVF4P/MXiJ2sFHq3N02iybTbQPjWRCZyii0bk?=
 =?us-ascii?Q?sxXTNcNtiKfI3PZVKNXQRHtI8Xt4YJkX/GK5TWxwy1ayAcp3EDRBI/mM3kMe?=
 =?us-ascii?Q?tcFnHQf18MEPxxFx3xtvECZepI6vinwYYY4A99Jy1KUvJTFcVeIoaxJ8khiC?=
 =?us-ascii?Q?HG0Q84Ad1zuXMu8YdkYr7U0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d1fd394-f079-47a8-c8e8-08ddf67bd570
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 06:23:08.1482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2lD801pNJnIDXjNjlhlwOoVImqTGQJo5S4T31xkXpsMX/bqLPxftd6ZhYkzMgvBPOgons7YSUUuqpssmfISC4RYXNNIdv9jUU/Au9t9f3NpAw9o9FB96+I35gN43LNGY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9517


Hi Geert

This is v5 of R8A78000 support for Renesas.

This patch-set adds R8A78000 and Ironhide board support.
It is based on SDK v4.28.0 or later. It will be released at end of Oct.

Link: https://lore.kernel.org/r/87ecs5abp9.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com

v4 -> v5
	- Add new dt-binding patch to remove "resets" and "power-domain" [1/7][2/7]
	 - I'm not sure this is acceptable, especially [2/7]. These are optional patch.
	- A725AE -> A720AE in git-log [3/7][4/7][5/7]
	- move "interrupt-parent = <&gic>" one level up [6/7]
	- move back timer out of soc [6/7]
	- move L2_CA720_x to out of cpu@xx node [6/7]
	- rename L2/L3 cache-controller-xxx node name [6/7]
	- add "cache-unified" on L2 cache [6/7]
	- add "renesas,rcar-gen5-scif" for {h}scif nodes [6/7]
	- remove bootargs = "maxcpus=1" [7/7]

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

Kuninori Morimoto (5):
  dt-bindings: serial: sh-sci: don't required "reset" for r8a78000
  dt-bindings: serial: sh-sci: don't required "power-domain"
  tools: arm64: Add Cortex-A720AE definitions
  arm64: cputype: Add Cortex-A720AE definitions
  arm64: errata: Expand speculative SSBS workaround for Cortex-A720AE

 .../bindings/serial/renesas,hscif.yaml        |   2 -
 .../bindings/serial/renesas,scif.yaml         |   2 -
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 .../boot/dts/renesas/r8a78000-ironhide.dts    |  85 ++
 arch/arm64/boot/dts/renesas/r8a78000.dtsi     | 787 ++++++++++++++++++
 arch/arm64/include/asm/cputype.h              |   2 +
 arch/arm64/kernel/cpu_errata.c                |   1 +
 arch/arm64/kernel/proton-pack.c               |   1 +
 tools/arch/arm64/include/asm/cputype.h        |   2 +
 tools/perf/util/arm-spe.c                     |   1 +
 10 files changed, 881 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000.dtsi

-- 
2.43.0


