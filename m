Return-Path: <linux-renesas-soc+bounces-21892-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B17BFB58BF1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 04:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25B941BC3C33
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 02:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90172239E91;
	Tue, 16 Sep 2025 02:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jQOXrKcO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2079.outbound.protection.outlook.com [40.107.113.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895351E00B4;
	Tue, 16 Sep 2025 02:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757990326; cv=fail; b=owpIYu4snALSJ0LptAZwYG7gr0NZJc7jUw26/HWijfYgAbE+Nn1xt+1BqUfrfeX+RTgfywEE1fA8cRVhmd6qPxR6CH3mGksIprRs2Zi/tbvvrWDwhhDjMOBwY3P1aY4jw/iTY7IabOPvFlKF2G6N+BFM9O0W6h7lO/gLNvB7umQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757990326; c=relaxed/simple;
	bh=TnJzECe+QgIRWyZdRoWph0FjJN0r5YBP4sAJ0ck+zvY=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=D15e2gpfKdiKsDzE9aFVqXmyZW4anDXno+/lMGUM+McL8G7X0Ls1RAax7UMbrl3KWwMz0ukjLLb5xhjSETzQyGFAeMf3TUfHlmnCiViQJemdHi1q4SrAq4FrMgyuDAWH6FIiE+6LWmmjIcHwMbpGtT6GmmIYg0CqGo9qWL3FPVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jQOXrKcO; arc=fail smtp.client-ip=40.107.113.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdxVkLonZvcYRUhoZyk1AOT26E+Eccpr5ccaeROSq7CVHAOIAyCoNcjPIJNFap1d7RNYe1J0ib7WYcjsQnI7g0d47+htuGl0Ue6ACULHElRcrFRwM2ahHJ2kIEV4j1n49TqyyoNWJNn2McHqZw9+Pr+LjNMTxjDiXA4pxgx+UIhHD+BmSkAqoy6hMfhXnbOFe3YzaUFFPe+A56u77XCk4XIeFsKZIrwO0WtqfRoaGVrb+CMVgZm1iUXo6NTOULCSd85p6szk88T2Ih8gjIEEo77AUKSbAxYHr8VQqxY1DYREBdwRa/0r8hnqYe2V7w+0HPeFlc2nnNRGKOD5vw4TtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHLki6PjRy0LQsmNqcPn3CG6o80lQ7Ur6NhAVWcwVLg=;
 b=WMCEfoO42WNL8N+0B0JWjCXkTg74V+YNj9bhWEwTMzrzGl4DRJjVHYhyTO5RR/e8hWVx62kiGznpHop2uZJWdWl+yIUwPCsu4oJNajx85RAs/70AF1LPjltrq7SEfUYOpiGxQgf5VGBqtovV6XMeGrfjk2wolUkcRqvkM4bc9vr9a2B0hnZi75SFK2fAYAnx+M0LouE5mVCldpBpmkCRAhm0lED5Yk/ax8X/i3axM4WtnM53SBdtliCPZHlPBUkI+fkt76zaBAR0jjXWNzFus4STVr7mzFVCeCeA218mxiJeI/auff+3Dz/6HbGWIoa5G/lyV3ijNg+71iE2ornSNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHLki6PjRy0LQsmNqcPn3CG6o80lQ7Ur6NhAVWcwVLg=;
 b=jQOXrKcODss6bnLFDNe1K+uUiJM7yHmXXRh7hAxm1HVq7cGfIiqbfjmapc2Zpc+BQWW24+wutP6Ty6dCwtITvN5HnG2elT69ntoD12zfaXbG1LcB779lecLelcD5iUreDx8kTdxSGoZGse0D4H6CfwiM47QDEwFMeOBGfZwSSNs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13477.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 02:38:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 02:38:42 +0000
Message-ID: <87o6rbi0jy.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 4/6] dt-bindings: arm: cpus: Add Cortex-A720AE
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Sep 2025 02:38:41 +0000
X-ClientProxiedBy: TY4P301CA0062.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13477:EE_
X-MS-Office365-Filtering-Correlation-Id: b71a12b8-ca9d-4155-7c59-08ddf4ca2689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y4VnUHgixWFia80bPnEyPGzEDDyfy2pu3ExDzyocBBpTp8DPlWK1+QP/7AZs?=
 =?us-ascii?Q?pbo75uv0m2plOLp/sviEB7nFgnQGoIuaJaY9LLtL5Ce3fSc/VLcnofKE3VxD?=
 =?us-ascii?Q?fdz+nh+EHkdvnFRYI8YOXkV9zppy3e2NdvJafLyV0ZmW6vQA7TYRekmh71jD?=
 =?us-ascii?Q?kKhQw8Gnq2iOPGEAJMnknEcZ22CZ4qkQiuJT2VpPB188ZFHogJTfoH/osuGN?=
 =?us-ascii?Q?nEHV6sGS3zrnFSrKNpEMSzLS1u4rv6nHyOXjavT3osUGx+N+ifYIWvhvcT7I?=
 =?us-ascii?Q?Gp6zZGJQb6eh3MGcK1FUNjmiApmJzEuNvfKh6jYEbw9svWaGgpUXX7uHor5M?=
 =?us-ascii?Q?4in0X7yuovHhQ5YGttdewD1XZaS6xie5t78EpMtbDTkqVI54kVsP9ZDnvZDc?=
 =?us-ascii?Q?3C8h5vCznXMuGawX9lNy4hOD05BK3kHMl/1BMSchRArSgoRVlcGrDdsoNxM5?=
 =?us-ascii?Q?Z3Tc5XVTucbs3/AdKMFyCD2L7mQMDFmjjf8EW5OZRlOUM1b0STxOk1f0QYkq?=
 =?us-ascii?Q?RbChGQhEKI2fPLdPto8WpVag5Q6trTZ4yfe4O7OKVe6Y/KK1phpEJ+W1YgXK?=
 =?us-ascii?Q?UVOdeFvma9YTY3j2hfKbXPbBNMMpbaQy316sNgNyK2g8b6ShSroCLCy8QTn6?=
 =?us-ascii?Q?XXwLFneqMrCLLYoqO0L5wM1G0aHkEK3E9fPX9CUybMnccjEhCJEC1Oxifxy5?=
 =?us-ascii?Q?lbONoIOPWA+lgt6vg2F/c9COc4MI9BWUTZM426d5TNW9NV1iQ3bQUtVpwhck?=
 =?us-ascii?Q?f4FEmmlq0r2xh59POM+rImIz8st94DfjyngJJlqRFpSCniXuv3N5UPz3lkrc?=
 =?us-ascii?Q?RUmqbcvAaPjwFw+twikkDboJWsmFBknRGkkD03XENkzcDLmZrDCTvyVNxwdp?=
 =?us-ascii?Q?bY+Zn3DEYSkh5VfzduyWIYoyczPSwuKj+etTl/9fdhHP66HqWxiXPrHlrcYR?=
 =?us-ascii?Q?h1uxXb+qzpC4RJjnYeGdRh/gVF42QBY8nLUAsabpXActGexHVuboyG7EMEGV?=
 =?us-ascii?Q?7OWr4wVVaCduJyvOggbv3ZeevqumpSQPeoGjVCDA9zBfvYPZnyh8Qc80LNxT?=
 =?us-ascii?Q?7n7q7oCGlMBZxGxFVzSmODgEtOJ5zQJC7U9XSaqKDEDyhvaI7rvQ2r2RvuBG?=
 =?us-ascii?Q?B1baiOFBljcbuGiTDJWwLSMZt1agmUiFGciY0cOR4SJ82DoGcDkybeH5lHa8?=
 =?us-ascii?Q?zuK+sZYrNsJRrAZIOa8479BuCw0ZWAkKUTIusWAohu7d3fGy4cvKyNT80L8p?=
 =?us-ascii?Q?aa1S+TARMnsECVbz+notsmeCewjZQg1DPtXlY4GYZCjlvI6nBwVAg1lRRPo+?=
 =?us-ascii?Q?u2LH6VMfVDAaskj5ITMX4VW5Z2/JMpjW1CwJaqajpjoT3WCGCOEYJy5G2I5+?=
 =?us-ascii?Q?Iy/VZsEyxSxHRtvACSiw9FaIynVGo8ukipMzLQFX01CqTYcYiN/lpjRKSZtb?=
 =?us-ascii?Q?2tHjyKoQ65tqGXvjRQvFHJ+ElOUQ2R/+3GxFAlZps1IlVHtoJjHdJyUlJ5tk?=
 =?us-ascii?Q?8MjOacLAKdGUqmU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XNPNsZ7LL0RGWu628ejzTtUL+HzwibswLLlSj7YJ43Ccstiqa6OWeJsW46as?=
 =?us-ascii?Q?YRqUBvngfSOvTHBUUn1LdIJJ6Aar6oZUkmNOItkA1mM9sO8w5MZldAp4tqWq?=
 =?us-ascii?Q?ESkAkRi8zIIFb03nhVzs3j7+15v82m8CYBmWNFd2ijgGTKCI2MLCS4qYH7J5?=
 =?us-ascii?Q?IFgx53g3DA7LA8j1jvUzrF9DavI36NVefc+fMUqOdjOY6fStfvcJkZUiU0tQ?=
 =?us-ascii?Q?h0JA9CqAciRsj9COFBuOOv6+Ij5Gh3FlH/Een6bmBHJZxcPRVi5wGq431v6P?=
 =?us-ascii?Q?ppYxS6b3JZL7daZlY3xn6GtcWwnMdzbmWkAolXZcwFJHfdrPm/Yp7KF8Nm7z?=
 =?us-ascii?Q?gb8odWwRzxHe4yoPQqOLstqVdTZnW5+rOVPnRN/p6zWztbBozFsgSS59ivwg?=
 =?us-ascii?Q?qOD1+UsvUmN0qo8hzec8Amkls0BXkozUjfZZs1283TV7LG+P7yGjro/vux9F?=
 =?us-ascii?Q?UvF7j2EgVS+eSieLsd823jgqAIuYmBDdDKBKV8Rq2BmgM0mmHJnczy1E0Qw5?=
 =?us-ascii?Q?ub2kVUqwbFwzHH1FKHf5MPpG6BvLtQZixFN37tsraTKMQIWYMJVaqfH1zhft?=
 =?us-ascii?Q?x0P7DQEdKFc4MslqOWEwizucdGSdrSpXuEmEGDyG/N64ptital2hPtArr2X9?=
 =?us-ascii?Q?O6a/Bi2/bWe+h5wX+Gdy5XIyToBkVSZ8V+5XK2vCyL7KVfD3LHJUhZ3QTKX9?=
 =?us-ascii?Q?X28SRxBREoPj3dOu7f/TGVk1ot7GEkyhTKBuTbAEe6X2VaypcnrEAv8Fi5qs?=
 =?us-ascii?Q?KTV3Q/BpPpxaKIiPfIqPIC+tWimxFEruBfk8tYEOMp+19rTaXXSvBep3IJqn?=
 =?us-ascii?Q?cUzsJVPSnOGPI+oHdpw80AFRapvf5mqjZPkEeak+If05oTSRvbe1+C9Y9gLW?=
 =?us-ascii?Q?+CxiMHU7jLsbjNutJk7DhjkWBVL0VNI+trpG0M5pJ6npuCRiEzjlqsuV8H9A?=
 =?us-ascii?Q?PueMoRbKcDZtUzNjP0/7VP0/L1/GA8B3gfkKlK5WixBNspbFUHBTJcAjQlNW?=
 =?us-ascii?Q?YdsUxYogTabjWlETIWM/UOqnuNnYvEFBwjHzxQFDBsY6vL4Mi6uDqmfkOot9?=
 =?us-ascii?Q?SOEEE359XDYe8YkswdxtpnSuIt1Tjpq6/HWW40zx3Q11LmKO38m0YHURZCw/?=
 =?us-ascii?Q?DVzjMDIu+Enlzett9o4ov9Xdd7FfL/Zj6O3KzrIPnIeAmsEupnaZdLUCqZ4z?=
 =?us-ascii?Q?VtozAcGwtEWq/Y60/TnOTdurPsrbsEn5vHkITgwiJtVhWX1gKJjaUcoGG4eA?=
 =?us-ascii?Q?iOdL/Pidm63ywAXdB8BhLRP7OKgz9MX18YWm3uXtQVTx+QWkAPgS1PaDfD9i?=
 =?us-ascii?Q?rq42hGUIBLz4ofb4//7GGj7h+0BxvuQ68xH28eJZrtzf20WiQYflMbeo0nbm?=
 =?us-ascii?Q?mwWPPnqT0sWqgOIACFBkAjgerWh9tJN7T6GwZV3mmI5bcpVKTNgHMCv0LPdF?=
 =?us-ascii?Q?JuEW+MopZG23Z/wrYBGTqRD4NO0LNwWIiFyNkRk1572Ef4DFGyLgyCzkQ1UW?=
 =?us-ascii?Q?joPy5VGOtk7xkRv+LYbtoFYK8uJ02kkgenetZkSoJjj+KeUMTDEfdDJXhmEu?=
 =?us-ascii?Q?Mr9k9x7SqFFlUyZvf9OC1rbSyK3XVSuA5+uAujlZAJI0iCTHfFpdTlCmPmLz?=
 =?us-ascii?Q?dkk/yXtUiLUygr+B5bNz3t0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b71a12b8-ca9d-4155-7c59-08ddf4ca2689
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 02:38:42.4817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewZprStHULwgNEEtEKfuJQAF09EWqMFIGYN8dRl2b5v6Pjjr4dsAXwsyU34ywd7nPkqNykm7dlIJgj/gRxY/n8ob/VCYEtVt7q6xJND7Kf7i8UVvJdYLuK1meYarSBSb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13477

Renesas R-Car Gen5 X5H uses Cortex-A720AE. Add compatibility for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5bd517befb680..90d8fbb1e1a4e 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -148,6 +148,7 @@ properties:
       - arm,cortex-a710
       - arm,cortex-a715
       - arm,cortex-a720
+      - arm,cortex-a720ae
       - arm,cortex-a725
       - arm,cortex-m0
       - arm,cortex-m0+
-- 
2.43.0


