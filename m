Return-Path: <linux-renesas-soc+bounces-21890-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF28B58BEF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 04:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08DA57A1777
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 02:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39250221558;
	Tue, 16 Sep 2025 02:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AfaCb0wL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2071.outbound.protection.outlook.com [40.107.113.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264C8204096;
	Tue, 16 Sep 2025 02:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757990316; cv=fail; b=uC+jkJ3nDgWWnDpXKevfsJeuV4cBem9almbKlO7uR28Ht7B72NofF2n0qqzP/RBDFL7c6krfMCeDxlmxbGLEU0KVYOuqS7EQ+2y0h4JnBI0C665hsl89gM+rSfuIr+3DXGIsCZCE4wqm882yEwy9vEfA5huVp5ZXgFo+CMm/K/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757990316; c=relaxed/simple;
	bh=6zSruGtSaEKZjAIB1y2MZp9K3cYGoAwLPzb0fzB002s=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=a56aOLsT6SiJ2Q135lDtfZfZ5hbsegzZGz4soE3N1WP9FJ5Qi+uWk6RsLrsvqUYuPjJFEbgtO6ghZchMa7N/DobHsVs+XGOm6aSADoab+et3O3QyoT7oLHeEWMXEAw48ZUiq4nYYLDEMawCrqDxQKffdfyfXAcUFc9Fkrb7XM/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AfaCb0wL; arc=fail smtp.client-ip=40.107.113.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bg6SOQk9rzNrsQffAaXm12qYnRynNYzypmLGVbC1fDl2etyu3PQsl+g1rtxY+T7+cLKhfV55X5upU4pREXMCIZVp+rfqnB9Xfw+28N2XKKA5q2KG3QlM0m1OTk/QV9NWdVCJSPxF/HhM9+1i+PXavzVZK+36Dlh6LQF36SIAmjW3drwELYijeUuc2+ZkfC1xHPQwgiOoNC9Exs3hGtmDM0fdJxrSninouT/nRTQBfWbKWDrHJZKsJbKTB0g+R0FXVP1Sc6YOJFjQmCVAfglAecGBWJRnuZ+pco+7LG/qDcBNoalC+hc5GRj2ZVUouvELyV/Xa/YSU+aOq4qW+wHlFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVtx3lpNsRSySuvsRaZB1jBFVs0XDBdNHIZZpmBkOw4=;
 b=gZYbf4eGvRceL6zYREMagPApGTTm2h6vTi6RGe5xt95QWEN/VR2DZl6vAX1q9wAGLvE9A4yAbA9Y2ipNDN5Inhwv0aCOdkdFn1PlhUkfes8hSUTDR7h+aiZtrOxLj2Afa+52+gD5tO44TY1XqVIMaPZus6snJeN81Fc87/FQcFRaDOEFFZdSwYBnL7fE3jphNlmr1vdCtl+gR9JNtxNtnm8s9TcB9dZWlSzgGSZV2lzUS2d7gZTV7Gn9pnhe9F17VPB4jubfTI+ypj/jlGCvk3eLO1zqxZ/+b28P4fNRV3vQ3QJqkNdMZB0JVrJzAuEkD9i0Bfvctw0pinR15rIkgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVtx3lpNsRSySuvsRaZB1jBFVs0XDBdNHIZZpmBkOw4=;
 b=AfaCb0wLqW5cDg7US/72KvdGnZH6SJd4G8I7QywrQTOKq7E17PGkf9FarTERjHH/X9DviQuCaWG5mQHQ9OBj0B88aadqZKvbJmBPt34POnz3RSyPGUJdRpl30BkPQf7nohyems8rQNXy4/IsdrWxyOq8ktx3UVawKSvUT/8KUU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13477.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 02:38:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 02:38:31 +0000
Message-ID: <87qzw7i0k9.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 2/6] soc: renesas: Identify R-Car X5H
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Sep 2025 02:38:31 +0000
X-ClientProxiedBy: TYCPR01CA0089.jpnprd01.prod.outlook.com
 (2603:1096:405:3::29) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13477:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a5bec91-1e0a-4136-38c8-08ddf4ca2006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S1I3h1yA8qHdTKmFazOQJd18R2btvSHxQxijoxD/Lh9r5PKZ80SqNx3EaXGN?=
 =?us-ascii?Q?+k2cDfpju5o5uIiXs+h492Ojcs+9Y3HSCGtkAa9tYN89u2sBxv5MU/Z8/Mb8?=
 =?us-ascii?Q?2W2qK6aOrHpyvV9+KV77Zee3bwINhI14HTQznilJrk9yokV4iUakdbwnxfr8?=
 =?us-ascii?Q?tBGP7SBmXJ0gtu2sB34jOMUH5VNAfz3IJ/6oCVN2qCI582TdIaEyEVFPTC1K?=
 =?us-ascii?Q?Y0A7ep8EIQ/XjILpStHBOEjMsbFJ2+JzFTxMeoTdVu6oojNzBiQaoeg4sA14?=
 =?us-ascii?Q?8e89crDjogUg3aTPA1tcxDj5BvAuVc7PqVAAUiB5UweUymYKTyJYv2RdC0QH?=
 =?us-ascii?Q?kaY0A4BUUlVtl7R9GCO2AEbVHZL46dbaGcLiXxbTo7Yp3tSq/tUtKU1IR7YQ?=
 =?us-ascii?Q?szML7/XrLnp6LQ5loLnsr8cEacJK6sq1AvsiI993VDDfiZwj/hSPVE4J6Ph6?=
 =?us-ascii?Q?2SexdudSZ9BcCgUDoSvF5/jgDoXwQUHbGu76296UbLd6s32KqUKrbdtVMjnW?=
 =?us-ascii?Q?2nU2Bv53+mVTS8Fx2e+hMs5MQm/6XhjCP048fn0lVLAGJvJvehbBnJulbt78?=
 =?us-ascii?Q?Tn05P7fx9lKrsbPNNRLdzlZ9i0XQW9BZcaBxaYOyPqBSDi4bttH6Y4OH5WEn?=
 =?us-ascii?Q?Yd00MIMqcEmH73LzpSgo4AShed+HmEaYVE1QPhIwFBC5/BBBFnCwNS5z6KUw?=
 =?us-ascii?Q?ycClh8msPVp50BlE8FB6Aiav3y1RZHsomvJ7Fw7BZbrAXfp/pnufaZTc089L?=
 =?us-ascii?Q?89TRYEL7WMpbgTqt1yDtOV99l18Vomp4/cVp9Y1CsJyzMICeEPm6RPF3txRW?=
 =?us-ascii?Q?+MrFMR88I7SiXB/Mdx3OEYwVyaejv8m5PFFcLvIDEIOQvZFzkPWOyM2rU5QE?=
 =?us-ascii?Q?DcTUu3RYVmZsoeyn+OQPo2UybFZpKlToWa3ur12UPQzqIiEPkJSkC1LVIl8x?=
 =?us-ascii?Q?pG81tpJt3Sr/bJ9yGLx3SBgKA1g7wlLfimQUqulKhrQC8QHkmxst3FVoutxP?=
 =?us-ascii?Q?dmy2VJ9Mkg11WHgjWyYzwxBd8XmAobZ5dsqlJi/7dKlcozg40h7yNLxjj/Cu?=
 =?us-ascii?Q?HmZ7F4Cyf2nUPqrY5dnyEp6mLM7tJlVw6mYlV1xyPDocDJAOBZNJhuUWnLzA?=
 =?us-ascii?Q?ONJPB9Nd+TtXELoRjo9KPrdtrgCckLJidnImq0L+qtV0eN1gPU3IQG4N0KyV?=
 =?us-ascii?Q?QsbCThkMW4Jr72h1mtFukwkp5NJHmyDUGlR4OJH/BXbUxrJs/0I5ChBbNwFL?=
 =?us-ascii?Q?LPtLQxYzZCdyNEOsSfolMfL8OMPJ2mgsQSXqfJCXBZUfmKuGPczYgf+iJ/r8?=
 =?us-ascii?Q?gZn1C4TKUxJ02xxncmByBz5Xfg2bZB6osyMJ5E9zKq9m4PnFh+ytP5ROrUOR?=
 =?us-ascii?Q?B4VeoVoDdR90xnPtf/Yy4qsdzfiwHeLRspDpNXOCHY6Vhy8MX4tOxcNjmtRr?=
 =?us-ascii?Q?Vs06VbWH60gnv7G761vVjlMz1CbMFexylIL0c/W75aINXYcUTWLQnm7FrGUQ?=
 =?us-ascii?Q?qTTX8aeFk2IH5S8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OZPuADEXeQJLokejjrEiOiQksVBt1LqW+MKd0PwrUnBHySfV+lWBqMKcK7Cx?=
 =?us-ascii?Q?jovu8GkwlxEHo/xVyWxWcdmVONZrrc/Gi8hu5R42ZpGUgZ/9PQ64xX46NOUX?=
 =?us-ascii?Q?kLLYdkVtpqLU3NyFJkaPGj+7NApDD9qpTMH/iUIrpkmIolbolE3tKS5VPi6Q?=
 =?us-ascii?Q?NAxuxzyMrRWJVRGFqzi9kWOXNMiOJdjVX1CWULHHlUYDHE+nWh0rtoQy8Ukz?=
 =?us-ascii?Q?G80gVyo9km8uGJk9plbpE5P6lZdYGlgJMtN8w5hWpVLLo45MEsbZbWK6F5d4?=
 =?us-ascii?Q?KAbdR69Kit9hB0mUMNq7y464k0/Cp9ARygo5n7eI8W2nRkeKRYFUxyimLmT3?=
 =?us-ascii?Q?7qPQkqS1e+NZnpmbzh6g9impLUJWvvr15TWYFKzQSg5LpZ3aAuqJjHrNo1DB?=
 =?us-ascii?Q?421GwzkF9PXzS2z+WYbjDsY2IebRJcqcpYrqmIN+UkT81AgNkWTQLh06IvFu?=
 =?us-ascii?Q?5UP/ROIVxGOqSaa1McC9xRvFkwPw9rFtl8D/hOGCyI+EqRoIN5PUr+SWXDCz?=
 =?us-ascii?Q?6v4kKaagyLKf0c4DrIvL5iDqPZMaSxTa/h8xmw5HWTv035I+DdfcRymdEtC9?=
 =?us-ascii?Q?ku4BUz4ax3GMvL0JDeGWVc8bGzs4LlKlZDBod8r+W9jdSpIcAOunbiu82LTq?=
 =?us-ascii?Q?NN0IckZslN28f8PAg+nxbvBpvC8yoIopO9uP3vKRqLOd+j1wH32A9KgO98HD?=
 =?us-ascii?Q?xiVj0h+2KmWG+jIimK2klnA+VwjpPrOCao+H1weGH9pxx/upP9IBI6gSueTc?=
 =?us-ascii?Q?CaC1nK63Jb0HCiH8ISNmtIw51M3YKwQexU+23Z9QDUHhVBXabYAbOZRhLoSN?=
 =?us-ascii?Q?VVRQISb2SBP6g/CiYJ7eoWCyPp5p1pFMuisGapm8Chv+kvLARPvl+mabbGOW?=
 =?us-ascii?Q?YSmotdo5u9Umy7+5Z4LVMeNB/BSmbeFTrl+/XrfzIbSl3NYcdzc8VvmmN0lo?=
 =?us-ascii?Q?nFT6mNjYuO27xnMqwJPI0ESCssgGqONDAfsTFkRPr5XnDegwAnnrNbTt1T3E?=
 =?us-ascii?Q?knPgYEQ5rjS4iCqWIbUeJg7VQCoxqDAhJ9yVUCc4F3GvyPRlKzcMfpc8NWAV?=
 =?us-ascii?Q?R4OMaM4qNexu11yz2knwxhadvndpQezsNLiJPMPNEPcjkDG7mNAg+oVOkUpI?=
 =?us-ascii?Q?M+WdnpxoJeeme9DKVeMna1hsu8I1i8Kk8NnahWQmm4DpdmAJgRYKqUa64Ni/?=
 =?us-ascii?Q?U0UfGnNibKqrqckozGHZEJn7Wq1fSTIgxvy1zfyhgE5rV2mzp7J34mTwAfje?=
 =?us-ascii?Q?pZpqpbo4RzwHXsYHc4O8O6I6lrQ14HgNb0gpcssvXuSkEkDvavB3vKPnrvBy?=
 =?us-ascii?Q?NrPA5pP0O7ISl0fpNqpisY4YwI77xhRwNbu7iIC3C0Dd2E2NbCoOnfyn6BuL?=
 =?us-ascii?Q?4DS1f+hTbfiptOGUvwwrtyV/m0OYilcxrgXVUuW0y4Jfl7zYvIZpX3vKZChr?=
 =?us-ascii?Q?0OPwLH4KfIt4zT/opKc606QXlcw+tbmLKYM7Kd+8dYUn3pirynDtPbYK7F1+?=
 =?us-ascii?Q?VuPZgT0ov7L6QQMoCCAZPCKb7beebdxlzZ8TljVFhliOiBvVAoUJwOWHkD91?=
 =?us-ascii?Q?T5Y/TX+kMXwC6IQY4YWw4mRdsT9ifZR7oT7g0LvFC3CvG6LBoRCYzlscdVcA?=
 =?us-ascii?Q?dngqD9gQqqMAD2GsAch4psY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5bec91-1e0a-4136-38c8-08ddf4ca2006
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 02:38:31.5605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RCHPHE0gQ4MjTIDzG/AJUH3ZjoVzg+f1YYkCSRwI6PEaOTcwz2ut0yv5RM2HfexJkItGTs0ayApH8hVW8K6p4oKt+yw0v4Mj5+rPr2kZkfca4LxuI2TGX94qwgneR8+7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13477

From: Duy Nguyen <duy.nguyen.rh@renesas.com>

Add support for identifying the R-Car X5H SoC.

[Kuninori: tidyup for upstreaming]

Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/Kconfig       | 12 ++++++++++++
 drivers/soc/renesas/renesas-soc.c | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 719b7f4f376f0..7229f4afb3fa5 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -39,6 +39,10 @@ config ARCH_RCAR_GEN4
 	bool
 	select ARCH_RCAR_GEN3
 
+config ARCH_RCAR_GEN5
+	bool
+	select ARCH_RCAR_GEN4
+
 config ARCH_RMOBILE
 	bool
 	select PM
@@ -348,6 +352,14 @@ config ARCH_R8A779H0
 	help
 	  This enables support for the Renesas R-Car V4M SoC.
 
+config ARCH_R8A78000
+	bool "ARM64 Platform support for R8A78000 (R-Car X5H)"
+	default y if ARCH_RENESAS
+	default ARCH_RENESAS
+	select ARCH_RCAR_GEN5
+	help
+	  This enables support for the Renesas R-Car X5H SoC.
+
 config ARCH_R9A07G043
 	bool "ARM64 Platform support for R9A07G043U (RZ/G2UL)"
 	default y if ARCH_RENESAS
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index df2b38417b804..1eb52356b996b 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -36,6 +36,10 @@ static const struct renesas_family fam_rcar_gen4 __initconst __maybe_unused = {
 	.name	= "R-Car Gen4",
 };
 
+static const struct renesas_family fam_rcar_gen5 __initconst __maybe_unused = {
+	.name   = "R-Car Gen5",
+};
+
 static const struct renesas_family fam_rmobile __initconst __maybe_unused = {
 	.name	= "R-Mobile",
 	.reg	= 0xe600101c,		/* CCCR (Common Chip Code Register) */
@@ -266,6 +270,11 @@ static const struct renesas_soc soc_rcar_v4m __initconst __maybe_unused = {
 	.id     = 0x5d,
 };
 
+static const struct renesas_soc soc_rcar_x5h __initconst __maybe_unused = {
+	.family = &fam_rcar_gen5,
+	.id     = 0x60,
+};
+
 static const struct renesas_soc soc_shmobile_ag5 __initconst __maybe_unused = {
 	.family	= &fam_shmobile,
 	.id	= 0x37,
@@ -378,6 +387,9 @@ static const struct of_device_id renesas_socs[] __initconst __maybe_unused = {
 #ifdef CONFIG_ARCH_R8A779H0
 	{ .compatible = "renesas,r8a779h0",	.data = &soc_rcar_v4m },
 #endif
+#ifdef CONFIG_ARCH_R8A78000
+	{ .compatible = "renesas,r8a78000",	.data = &soc_rcar_x5h },
+#endif
 #ifdef CONFIG_ARCH_R9A07G043
 #ifdef CONFIG_RISCV
 	{ .compatible = "renesas,r9a07g043",	.data = &soc_rz_five },
-- 
2.43.0


