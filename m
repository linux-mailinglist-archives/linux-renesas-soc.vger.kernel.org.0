Return-Path: <linux-renesas-soc+bounces-22003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EFEB831FA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 08:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C3251C27E09
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 06:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740F62D9491;
	Thu, 18 Sep 2025 06:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YGKmTfSt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011038.outbound.protection.outlook.com [52.101.125.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EB22D8799;
	Thu, 18 Sep 2025 06:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758176786; cv=fail; b=kpm2UrhDXoahCBrKRD653i+kISYcvjPva5oOWl7bTjkYUGy28gzKE9mRovplWPA39EvST49GsN5iKs41zdWDhUEHomXCQ8B8p1uGTxGARUmcCdju1ZN1pIwQ0Ygl/Cx2hXfV0W92FcL9CmfpOV+mslZzT1eR+zjfrwDs6opUHPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758176786; c=relaxed/simple;
	bh=n0ziTbziTLw2/Q1ffOHHKQCrLeHLCBLYyeDLrbKFMTA=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=FoPzXc6u4+LcKjEleWoU8/EAKvDFfcmUBJo8rvwcFMcRrUU5DtZq3XbPhPAZi1v1mrMcoTDlrReBo64AlfmZTs0PQPwqHA5JduH47+UK0eTDJRFyKaHpMOpqYbNltbdWRRKQjbfLGvSP9L2zaHTws9F97CS2ZJHmhK7bI3hqvgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YGKmTfSt; arc=fail smtp.client-ip=52.101.125.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmeITIJERc/dH1x6mg0g4vNS/FOFgzALRP5vLmgqPmdA1L+sCA0G4d/yhMKm/6zJK1qjnNmkdvcL7n+VM9VPa1LCRXov+ZzDxjl1dcp412sKNkNgqViG+fBMnQKtEfV6dI6pGP5fC0s2lWDHbTrHXpBl/YPpYxA774O+0lKGEj1kzG+q2rv2RZqvGLk0mCAsS6HW1lpyzvTGIW86wYpKZN/MRbSyhXvY3cGIG7fhaG9tZY728AQfwuvkGYmj3ghU4Rhw6S0RRnK2O9qFcAe9FO86QFUXv2t5eR2ClJRJgDnoALfGkaZi2/keQ6u7rHOcDG1N2mzu2Od7Ay2OJc1LBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=He6U1H0F9yK1WegAFaxsdM2HW6PUhLaxTF7NrQZlDQM=;
 b=qlCa5jCC5I7YUBRFnnvCO3dJ1tZ3jn+K804Y4WZ+yntWK2EJcqh1pqH/S6M/AhDJOxNBBcWoCQAT7ApDJmMpJ6i6kV0y0NNw/xEd5xlLH9zgzQWYCTllnnek7f3Ax1j1ISz0+mv51uWSydC6zoMLMWU8lnKHztUCja49npfxVyI8b5U6rZ+RZb8WVLdr3tcsE0r1ZBHX+rmSxdKEyzxcL/pjNwBWJYKuSmtvwGD2WOEMViYDU9ykJn94jsKUtSyygDTF6izc0MSlNafvTafTg0Zh7JUcYxZkFyh0jiy2IQZN+7BirT3hxoe7BbNqE96EqV5t/DDhYTqwhcDYMJIVeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=He6U1H0F9yK1WegAFaxsdM2HW6PUhLaxTF7NrQZlDQM=;
 b=YGKmTfStfurgstLbA018pg7kDTPIyF5DkpJ6NWMYkdOqmv/MGznxmagXrsfEdGIT+Xb6v2eKLUPtmCRxBb5LCRbiJfAanh0S5QUpeZrBiqaxqoLfQXH42XNrgyTAYCufHGxdoHcX8a5v+W91xrp+uc2SiUp5JHLKqtL6tfWEgN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB16214.jpnprd01.prod.outlook.com
 (2603:1096:604:3ea::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 06:26:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 06:26:21 +0000
Message-ID: <87jz1wnunm.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v5 2/7] dt-bindings: serial: sh-sci: don't required "power-domain"
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Sep 2025 06:26:21 +0000
X-ClientProxiedBy: TYWPR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB16214:EE_
X-MS-Office365-Filtering-Correlation-Id: ad57cbb8-5532-4529-4b7c-08ddf67c48d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yw7rJxRL+T9yideuQHGs64cKA5tthagUuoT+l5Yj4Ksr2jiUvtBOvP3o7zll?=
 =?us-ascii?Q?uyiEd3yRTUY5B0tWErB56MULb4CA8y/RLqfi2RNDaYsI5auP4LAjK+CepPs7?=
 =?us-ascii?Q?k8RmL3lcKwaBQwLD5tTmCMSHYL2APRHL5deseuTvlB9Kb+135Coi4cj+Rjul?=
 =?us-ascii?Q?blImuSxxw9dGwDXYMwl8mQ4FYDOiBEuqBaMBHcfdLzxRT/SlHAEFL2M7UAs9?=
 =?us-ascii?Q?kpKI/ktIk7oAGP13mLOF7EyI7ifv89jaTa5O+BwNHOXTZkI9shgdwUC4GWPS?=
 =?us-ascii?Q?AUDxUyt7SP+ZXe6SoNq4V6hvZT4geD5gCQFCXN6eBO4rArU1YcyZsIYrlSUn?=
 =?us-ascii?Q?8cHNe7t02s+tgp86YZZuP804xOKMCTf5FRMjqSmlYKnkBwwROy+lV4863cjs?=
 =?us-ascii?Q?SEA77sOzZ2ficdRlIFh6TAD6xTE4KStRb+JA66TXX5PCwrkA6hQ7aENrNDch?=
 =?us-ascii?Q?Sin3JdN3nodEnZn+D0xr5E2S1nAfxR747taXNViXj3I5ZgLNh8fHpe10m2xw?=
 =?us-ascii?Q?N88PYXOyEtbpYhuLyH70FGUFaKDpSyuYRLfl35oQaMcUvWCdblLaVa/QEseh?=
 =?us-ascii?Q?kv09BEwI8c5AUF5CT/6WbLf9ch10t0gYJmBeIK+ghyclFk5GSlvR7Yh2EU/T?=
 =?us-ascii?Q?ps3k1fz5CVaPBCVkB19IK6Z0xhBoL38R+lqat6ot7IVrvyIQkchddJOOJkFp?=
 =?us-ascii?Q?8DcjtP386ejRdD1jXvqGSFTCaoKmcrgE/IOr7/sBpYeZTX1Q40zcUSACxji4?=
 =?us-ascii?Q?BZsAjvh4DKJZ5HFOEEVvT543KfNuStejTHjVwQfHv4AHXcMEGYrnOHonOJDw?=
 =?us-ascii?Q?avFjUa6aMl2ZkhL5NMMcBBfqpGw1LOiUyi+58tW9c82wfdbtRNHiwNr3WW/4?=
 =?us-ascii?Q?1ZmyeGM0+Uzt/dIMaqmb6jBBY3ZcMAo8hbmLHmsx+QvZF9jRlklRf8TL01PD?=
 =?us-ascii?Q?l754/KZHCgI0Gk5YZF7N3EM8oFKN+NmsvEuzNcDKI/To1Iy8YDlkw3hMr+cR?=
 =?us-ascii?Q?3AXTjK6ZzXhL4onVoTO+MkNBX0SUrw8jBnGH15/re+7/XO1jWXjjikjalecZ?=
 =?us-ascii?Q?NMw4C4dRqX11nr2ZQYjD7niqfgK35kI/hWWRx8K+DWMD3iZZSek9ZzzGWsxH?=
 =?us-ascii?Q?TKfSiozOAyJ5LMl2X22eGrGHXlJMJwWFTZzEqYu9AGI1rmlvYOncwMlim/kd?=
 =?us-ascii?Q?KVzhrzmHzVkit4xxwZwO6aRO3EA8+psRO0+OKeLhpi7ZAgWvioyORBdLvHSZ?=
 =?us-ascii?Q?FmpiCwajKTQOjT2g/d+vzPZ2nOyMGM9uxwml+Yg0Z+ATQ0dD3PBt4KyAP+3x?=
 =?us-ascii?Q?s0Gz7NKWgDLplxKb6qA6+zCZGlXElGK/AuWYd/PJM2ArgVQOnc1zrSEBsTjj?=
 =?us-ascii?Q?OaYzHM3APLW0gifHR+yZRGUHiKtTgGuLxoEcYK1X2vVqJrZyzaQ+YY5P8Gke?=
 =?us-ascii?Q?RuNcXhc74BNZ0J9NkhFDvafgHME6ctjYlWuGbjJ451IPMgwcfpVtR+HF9+RB?=
 =?us-ascii?Q?HlBvrivL9bYiQ8g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pjh4rrnox/BjQmDxvsshNPxsTlAOWBl8ExQA8w+s/silCFZVdc3Ik6yw2cxl?=
 =?us-ascii?Q?LVwhy+4A3k6ik2wtxqcNf+bjVkPzzcyLYsC9VGuaBCsOzaBM43al4PlFkktV?=
 =?us-ascii?Q?SaTiB01XIKQJfqM6Ld6fUfvRMNDpbpfj3iH9kmjB22aiuqa4dmFgZo5EbXFk?=
 =?us-ascii?Q?4nUPomX7UICIKRK5QDjMo3vAc2l8+bpgAT4LvOfff/Y7NrsIJq5eseo/re7Y?=
 =?us-ascii?Q?GtaVVyHX/9mk85LtMxCh0nw1lv3wJYP1CG4e4BnEfogxEAi2rl3MciTs1jkw?=
 =?us-ascii?Q?Iv1iDF08V0QME/Ng2OOpgCaCEakyi1zelxt/jXc1y87ZDx+YTPaB1JxmsvQX?=
 =?us-ascii?Q?7VnYFPf+bjwHoUOiYWUA1urC1D5Op4uhiPg8OqSqoDyRQ56WsMkwpapPUdCi?=
 =?us-ascii?Q?IcW1P7drfeQ9wZjY2rqKbz7QGVeyGCzGkMUtoJ1EwF2TklshhMLaGbf1ZnUY?=
 =?us-ascii?Q?KbCen06k/LgH7TY+X+hXfTl9exfDzn0Uk1AKcde7iJ/mDDM4qqNH9Conz4KK?=
 =?us-ascii?Q?o22tZm2MHIA86vzcb+5cFlznFbJdii47Ese490Gx7/bJ2onNVt/RRIZ6kYlm?=
 =?us-ascii?Q?CFwPSKqnalsnuO/zwC7aG0jZYQTubbBLVt56Utg6yX81ZlbYDwLVRZVxs1tE?=
 =?us-ascii?Q?GY1tvbxN107u7KnW1Wcn5OlBpnz2l9apZgiYDd6+aWBfbP3j/8+/CeD0GLl1?=
 =?us-ascii?Q?G4Tj0qySRwDVxWCbNZdTfZiiB5jfkFhaH563/v/KmAozzZlo8vEyEkZzLNs2?=
 =?us-ascii?Q?4eBWsMEPCFA2WXDBwxrbnVyvr7cOEvFm7CWpcytEq4pBLTp26FpgO3b+dqW4?=
 =?us-ascii?Q?d5tzd/my9uHvSsATpabxBiZX6fXFT2ZgAsYG/fEqFGqk0O5M70fmICAGFYsc?=
 =?us-ascii?Q?E7PdsdaKeO0KtOzDqqjeKKhKX50b6bG9ZcPB1dWx6lbmcyFldC+hgUyEAlaG?=
 =?us-ascii?Q?SKBCLIXvfwoTQGwZxSDY6wNMdqFgC3DAtCNjKfuy24VAPan62Mqu1Hc/rOwd?=
 =?us-ascii?Q?nXUpgWHYkMX1xvXGuE3q/6sTUQ47+ESdwv4W1QLB4qZZCc7Slnm2sv/7ujhN?=
 =?us-ascii?Q?Z4tFnfHCRDDBHMQiTVVxwsOUv7J4Ioep9E48A+ONMZlWvfv4Z9kx8UDXzkhq?=
 =?us-ascii?Q?a5q61gahoi36GrBaeZuq0uSCuL+c+syJnsezPutP9eBD6K61weyjp5Keqkvt?=
 =?us-ascii?Q?hAp5Jk0FfVxPJnLPHQDy1oGXFl2JXi258RRnmJZDNjk83lOGsFQBAn4suKbv?=
 =?us-ascii?Q?uF6hLi1CrVLAzWPPPjXgC8nP76kJbOfBM+ak5bNcTPUVjembdzWGTB3Timop?=
 =?us-ascii?Q?O2UaiGcyErh+hv+SDRXorVuiYGcywYz/bj5xXSQ3BcqStcVD+ZNnu4NIYXR+?=
 =?us-ascii?Q?O2ux8xZ7W51VFkRmb6Yqi8ARehYKoSitQW5knwKViftFKcM3diaEoJ/r4eHM?=
 =?us-ascii?Q?QKj9Es1T2OTZaugs+faVEpP6fOBstoO2mzixVPPrVlv/7nt0zsVuRBvDQf5K?=
 =?us-ascii?Q?u+yZ35oFkJMKLBbu8Otp+CcmYsN1tDubTRiV6WGkGtsGkrmKVtZLP58/DkvR?=
 =?us-ascii?Q?UbCxiA21WYwBm0ldwZWQAfJMHScdKexf4CiVp8aGQ8nWLvMB7+mL5V1erWHb?=
 =?us-ascii?Q?BbuqZtUgGoPvJCVIwTwRQks=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad57cbb8-5532-4529-4b7c-08ddf67c48d8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 06:26:21.6574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YSHVZUWDU1SZj42xPK4YKTooMOLx5/fjD1T80SCdfLwJ0ZD+VII0FwxQEiUJIcR/e5/YIYD+9ARnQUS4S4qB6pPmOgTRWBJ87dDFXTW7k11fSlWsyC3nuadeNLvXetXn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16214

{H}SCIF is in the always-on power area. "power-domain" property is not
mandatory. Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
I'm not sure this is acceptable patch. This is optional patch.

 Documentation/devicetree/bindings/serial/renesas,hscif.yaml | 1 -
 Documentation/devicetree/bindings/serial/renesas,scif.yaml  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
index d05a83b9513b7..7a7836c1409e9 100644
--- a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
@@ -116,7 +116,6 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - power-domains
 
 if:
   properties:
diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index 47cb99ba03607..5dfcc408455ab 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -168,7 +168,6 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - power-domains
 
 allOf:
   - $ref: serial.yaml#
-- 
2.43.0


