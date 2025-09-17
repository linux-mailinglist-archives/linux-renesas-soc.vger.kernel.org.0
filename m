Return-Path: <linux-renesas-soc+bounces-21956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 596D1B7DFB1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 14:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3D797AD3FB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 05:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC9026E6EA;
	Wed, 17 Sep 2025 05:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iTimnPhX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2078.outbound.protection.outlook.com [40.107.114.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462E91D7E4A;
	Wed, 17 Sep 2025 05:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758087059; cv=fail; b=V9+qmwJSl343T7soPbBkTrBsY4UVxDUJ+4PaT+gbpgjT9kwhYdQjCIvXw66XsWOqS8F45kl60kAE/RGbmoUpmU4CwvaYNYEdriib1ZJyqxam81VAF+TksPOS6RFN9exKtTGuwL1qTVfRatMpWxIuBLXZlq4hy3MjB1/+IpjM0qE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758087059; c=relaxed/simple;
	bh=h9ftSWAGb7/LX6hE2GSwZfCJ4hyPwShn0thju3l/U1k=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GPqGjrogbHy1TJlZMbg48JcRPeUSMEbcMLEXueYOw0X3m8JuCQ2R6xLkARR3OIRJmF5YHVzt+s1MYInx+oFkeXfbd+NVibRPf4AwGlY0dxhJILUvhOfwC549HNFHp/OAD+AkxlTPV9L8symNlMIuKOXAdBnCK3FINhr3GpUFCuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iTimnPhX; arc=fail smtp.client-ip=40.107.114.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APzsqoblTdcwBrnhzvmgXmANl8lfbvyUAv4vzxxEslgcF9vA4GsJTCXOa/75dhOyZPZu/CRX+xaPvdeyERX0fFT9RTlWGhdZ3vVRNKBIsTZ4WJI+UEEEViJS+TSiabpXmDW7f7OepDryrqDn3hJdo/E5M5ikE35DimJdZIXMMnmy2M8yE/UqgsQgIm1ww2aIxhX9RF938TUBYqBM3d/7zxdRDTm0Lj9tEIYyAsFU3o0MiMUupjx6wVnS0RXa3S74JT2AW+T+/gaxk/RS4oxl3X46lYoPiJ2iKWfo7Fk3VrylLK9kRb2ZowGsgaTFGhVic6F+eLHxV+c4s4uVJJw/XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxLdMXaFmS6Iqgty3C2KmKE2akdUOKUflaOMYpOz7QA=;
 b=YWO1FumNuYH+SIVbhzSwb49788Tmg/4IFNP5JFqzVbrtVl7w/PEsDg/XEL2gMMVJES/mU44361Y9XSsIeRafhOxRCyQI9w1H8xSaRVh75EV904AhnBlWHsD6ZNfst7r8htbEXyVPhRDUKuejsgywFwpvpKpfq9LRw4oQBgYTpXlM3nRviVTAgLAyA4FA87f3p/F2JJtmc30lRX0BIG4Xen3S6TlWIJxlAmzfYA08gJnYOpR2ZpTcQoDkWsoYjPUgmyNnMtZPPnPF5DnclTKhoLMcQscvlK/5BkrWtlNgsIFJ3hL23ROCLZ39tDgOuN1bvEw9Wz+I00W5R2F+ZR4Z6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxLdMXaFmS6Iqgty3C2KmKE2akdUOKUflaOMYpOz7QA=;
 b=iTimnPhXHIJ8c8dPQ4dRa8PT4Iop6VJxUsXkThn2ACHauuvUMKoO8iLpLOkw8FvMNISFrv6wSgluqnFbMPKArPQ7pvbsyzX+2icFeFuNGWajVvMF6tXPauUxz6+lU9CO/Qw+XsnRDKrmXrUPcdRSKNaAPkDSGdCOxBKVVKGHaXw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB10187.jpnprd01.prod.outlook.com
 (2603:1096:604:1e2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 05:30:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 05:30:54 +0000
Message-ID: <87a52tabn6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 2/5] arm64: errata: Expand speculative SSBS workaround for Cortex-A725AE
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
Date: Wed, 17 Sep 2025 05:30:53 +0000
X-ClientProxiedBy: TYWP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB10187:EE_
X-MS-Office365-Filtering-Correlation-Id: 9144ac17-6f1e-4d72-a5ff-08ddf5ab5ef5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tjz2A8Q6SjOHUVyl3hNOxu/zCxxO3XFIF4qav8Z1NLmb+yvPMHxzQN7UY1Cc?=
 =?us-ascii?Q?OgQC0h0PYoJzFrfKoJC42njr1tkIrPhsnMy3tKrED4dXI6wPFxkKM/2PBYBd?=
 =?us-ascii?Q?nq3Gki4V3WkyrGbPFzxBn7+zdfozofhUTcEbA2a6XY+H8PdZhKU72ajXILsf?=
 =?us-ascii?Q?UVcoYOJOejlxPtxvOT3cYWdVQWA3s3ZY+lPW+HGBXkndWt2vpmSAIkFqk6sJ?=
 =?us-ascii?Q?oiRJD4eCpXBCgOlKfZN4rXWRmTS+6Q8aSW+PHGQNwwk8wC7WNbDb9mtfklnG?=
 =?us-ascii?Q?pzX3yS50dRQ3IICFPYqXRFbMT7pSfI+cohmfDeWqxXqE1LV7/q1qe/X2TQtO?=
 =?us-ascii?Q?SZxEPulnu5OEP2P9Zl2mwfLGKCm+SobKT2J57NqypCCsEuEWZUYMoe7Emfje?=
 =?us-ascii?Q?Yn0c2N4Ea6/H2Of+2cdj8YC1tjcLNF4ozpxSofSF21Y1naE3P0fC9EpGnNW1?=
 =?us-ascii?Q?BECygfQQnEnbQKFr29KTbe1gr2tbXSqBxA8GYhMkVGN0aT7PquUe51BL4UXv?=
 =?us-ascii?Q?bgHL5+OGqnU/Gt0DTQSgAnoFm8QTN6WFStvVqS0UW64J+b6JcJ5nzzhx7H5z?=
 =?us-ascii?Q?EAKVMr2XGq82qLt/hmCD+7cCL3u9o8uSCvLzBW3VAKBNK3kgBNn3vpOZC3tE?=
 =?us-ascii?Q?DnEbU1mJhUrMxtR9DygzHzz0QxjAT+IG2kzCah82Uu3JL4uNAj5EAOk8D2ZH?=
 =?us-ascii?Q?jqf4Vk0Kwa1m1iaVO3hJQwa4nioVRLxt60IwXtiVDx5nGi3B1CU7INmo4OUg?=
 =?us-ascii?Q?aCSkSUs6Bi4mlhOi/zYOuxFwu0uWNigLj23upHwx7ggXKtcIeZ/c/OFrMLRl?=
 =?us-ascii?Q?zTvl+UlTr1Nnx1SabbzPpGeVZwr0VGb2+4leNLmYvJ0QWuSUdALILEHK9aU6?=
 =?us-ascii?Q?mERZKo096uU5DOSCj4NkQrVeNUJb2UbZAP1xdpp1JWu9WOIEH5+8tnGl4PGW?=
 =?us-ascii?Q?Wr2mnDBO2eZJBWZdclbnQ8Z6bFchc4bmCECh+Y4uVfUx5gb80tvQI7wlZkLE?=
 =?us-ascii?Q?IWgBTPDHd1ibXgSZ3O+KnMjqeQ9hS2VvUBTC/JBzpya7fcqqfWlaqa/J130w?=
 =?us-ascii?Q?dU8nt4qBjhxbZjE7LfY7H9m0iJMiJxTQgc1wNv1gNBOWlCJ75Lrr023s4BBp?=
 =?us-ascii?Q?miU5C7R9a+CUjTiUZQs8eVEuqPhoslLZVeXKDQd9CaizRdz2u1KrGHgf/EEX?=
 =?us-ascii?Q?JOlKazW2XRby/NiVKfr9NjFo1UmeBqoAUuaY6XFBE6Suuhddzj79lfjPZk16?=
 =?us-ascii?Q?vgbBfzuUJZ2Up9FJVuP4hvEOctcfgDJgb5nSUFdCkNI5P0ISO3vBHlnVWabS?=
 =?us-ascii?Q?LerXfNZE1nz0T6drKnIiA0DUUPyTcwMyVAk+f74yuh7vlqT9GGqWLA3Fbocr?=
 =?us-ascii?Q?A3ht+AtrpH8gv4B54g/G4Hhx2QQCyBLheNjrYHfjjiLQIY0XBAOGHH0OYSp0?=
 =?us-ascii?Q?4CClyspurNEcFNQpmdcytyHAa2r3QPEJG8M13x3576WIpiwyvSEuCn8DPGy7?=
 =?us-ascii?Q?EOxbsdvugara0MQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+mVBd9ieCbIBXU7HeyYiagH4o0inw5JCvbrvA0semQHzw5jHoDggsoqy+sAz?=
 =?us-ascii?Q?BDXkNKOEJMMuEx3GiUQLrLvLl+uKy9SBtmP8gDMAEytQgID0f07UHbDU/Lo/?=
 =?us-ascii?Q?7lXUGqMLNH2p1O/L6AqZjvDtP/cyCcXE3E8qffhwr8pJQvRLbl2Z56toftmb?=
 =?us-ascii?Q?O4J6D6M/x5IZL8ZorcllflZzNH+xvi7wpWXWI86wrBA2rgl5YBdZHkJUWhIF?=
 =?us-ascii?Q?Z9eX2GY4cAZ8q/ZjuDgbVb2JjYYsQY2iuvUtWGNEqJwm85HZa7Ki7co2E4qb?=
 =?us-ascii?Q?8NDGz+O6eU2okmtM9db0ATx8cjNdLaFfKHglfpmPDFUtVK/wtoOck5X/GXej?=
 =?us-ascii?Q?xQmMfGC9TrWGdOx7OdI/bI84t/mheASso+j2uGodi/97Bik1Qt+rQU/Dvk43?=
 =?us-ascii?Q?PCo7f5aS2qyKvOLRiLdcZoCuA221cZw4v3W114Qh1BXFT0ZJEzuDTmcUX0HU?=
 =?us-ascii?Q?vFNaHit5D0bBRhdeJOE/+T09KSMxS7r3OFjCNf2tkxUdfd5OWGIzMJuvjHX9?=
 =?us-ascii?Q?0sTB8/ATD3ahytALXV+BWpCSUWhMq+2ktth9VvZekYmLIZkUiOCe38AKVoe0?=
 =?us-ascii?Q?8fRSKCckhRMQF5CKigXYyxoFNxuvyHzcIqOIeYP9t0Rt+L5tZ5EaftBvuv2e?=
 =?us-ascii?Q?foN1S7HuYMkzwup4RWuSGXRMxEcVMwE0+Q+6mZlT7EJK+XNhLn3OZTeyqj3/?=
 =?us-ascii?Q?kNYFneoPobF8XvM3Q/28lrv8sapjjiQSFCSZRm8Nno1NDsL3l9+QR/nAseCJ?=
 =?us-ascii?Q?TQ/SgfYCT47WNDE75wRAYoMdr9hzv5L+eKQ2f32cRWTDQ5d6vJbfi75y8I1e?=
 =?us-ascii?Q?Xy4pcxb9c2EFe3qWE3+O5dSw0g0APrb02vf3AKdrZStm6sUI/qlgl6TKzQ6E?=
 =?us-ascii?Q?dlzU6S79ZKZuTsCLB+PEH2IXu6/Pv7LZ3bT+2GIGVEWMaq4tfK/IySipzCRy?=
 =?us-ascii?Q?rv6oaUzpPWaloekeNY5wvg08gtzQRF1HZBSYyChPsGst5d+saf0MU5Y23sCc?=
 =?us-ascii?Q?0JsG5zteWzIgpBjMOrDVuE5XrC8BREtZEC+ikW8O2Qtg0iBv+p6ushOJ589Y?=
 =?us-ascii?Q?nmYU67+T8iBmDoC7UHiI4hCiizVWe7c3tlzDA0fEC3BGJXKu47y5Gbxr92hZ?=
 =?us-ascii?Q?Spf9Axyepn/g5bnwYtI8S/JyGhVHd4VLn6RwNOYZWQwuwDV/0WBrmaH8fVAZ?=
 =?us-ascii?Q?wpSWgJ1AEeTZmc95L6W8F2dY1OvVwsFX2JB4nhAmBf8o7HofyFUuU1jKSwcF?=
 =?us-ascii?Q?jwa67Fz0woArjDrNl7Pbs+dJFrzEM2md+fLm2sSNAx4WU1jPD8uHqR7zqCSE?=
 =?us-ascii?Q?70ae/TBKF9tPdYr6FlVZrfFeKQWWkiiSZv1TrPAFL/MtSJ4BjTmITumg6XhB?=
 =?us-ascii?Q?H8UZ9eRTXB/zcKhd7vNCATEL2muwzpYpcpx5Ed2As8TIcFVQDHubYiojupYb?=
 =?us-ascii?Q?gEn+hpydRqqn9gEr0zc7/6hsGNx99xlujpYBWW//kQk3gFQ3h6pMEMWq5slA?=
 =?us-ascii?Q?GrR+dVSannWqUcD0QBu1DcCpWujoj6dvWqI338tphbUkF58dUCq2wYZMTh8h?=
 =?us-ascii?Q?5XA169e3q+kfUmsjXJU5r41i4YkaKcZAj9IJO+QaNKn0CKqg45mXxbfk6hyV?=
 =?us-ascii?Q?oBqndSNV5SN8SQ3djTouftg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9144ac17-6f1e-4d72-a5ff-08ddf5ab5ef5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 05:30:54.1644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLz9U/r8ireK+0IgkyY7sHA8bKCkhFgFek/lXK1YZ5xJzuUCDlEKqpOhqRdiE+WOOxKXeQpJX5f5axL9xEI3HTaUEVToJWhfXkU3yexHoQRGpA73dK91nUNfEFNpAoF8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10187

It is same as Cortex-A725.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/kernel/cpu_errata.c  | 1 +
 arch/arm64/kernel/proton-pack.c | 1 +
 2 files changed, 2 insertions(+)

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
-- 
2.43.0


