Return-Path: <linux-renesas-soc+bounces-27763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJirGZKRgGlA/gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Feb 2026 12:59:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2A7CBFCE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Feb 2026 12:59:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0369A30158B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Feb 2026 11:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D16364049;
	Mon,  2 Feb 2026 11:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="irtUpi+k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011066.outbound.protection.outlook.com [52.101.125.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69340364045;
	Mon,  2 Feb 2026 11:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770033544; cv=fail; b=cjmF84M+GsuBSJE+hJxqR2sZeJhZemlzqwO1YJlxg/YWWRsKhzNln2GEg2CSKgPs/+5KooufZTlxyLT7hGhQec5Vh3sWjt44++J0bOsMcEF3H3MmsdW2UIp+BWDEMD1qt4pKBmkg9WSgxioOrQlXa+QdPv4mRKh4meUMOJ4vZII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770033544; c=relaxed/simple;
	bh=B9CwzoECzy2UAuNekpVMh8stWsVdTQLSlEYcDqPLTDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EgGIUjq6SH2ttCoEkuAbzgHsdyE+DDGLymwzz9z2qRM1kFO3Q1WRzLQzyNq0vOPw9Gd4mMe52MB9dV62oEtjkU683KFUW0NGPTdH6hjfCjkmA7wdmKZMJdKdU3giwidfxB9a6eCybbSixptEwwQQRoszh09Oc+5K2sUvz8tt2hQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=irtUpi+k; arc=fail smtp.client-ip=52.101.125.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqHxjPgVNE6uIgJSbIbNSTH5HRvcL3CSSCu0HG1JodqmsxssMbdck20An+aXWFLDKXuenFLdoUV6MmHjwJmxOWVqAKtBiHOOxDrAEoOhi1QJyu2SfCbcWXT1L86dj7Z326Csftrao8XfpA9Nyz+5/eRkjDfAhU04bJoPub9l9wYnBYEda4SQxY4xzWIlLcfhbOb6GWtHW1D5jdaeh940iv4Wc8ToQ+s6EEyKA2spPP6kssJU/J4aHgkEizc6HCT0EEH1AX4taXERc+Qrp6wmtC58u7+6RrwrkL015/2GQMjQ5QLDQjv3tNPZLaqE3wrW5lHF1O3wgr3lJrliiiCPNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMNXmcWnJP0/zzqJ+6k0FbvUr9IGh9XpPli3uUzhTtM=;
 b=pz2uI4Fb1W2RbWjZPiQVWTs0hZoURtCSfVO/DxBM4bdMjDRaCgsY25zEypXt6cdQGupwRNFwMEqNaUXGbwxMZ3ffcLooM3wUi0b2p57p3HBpFu5jK7maMbFepa8MJMoLDQ4jHlGSqmBmQZW2H8pBgU6SloDHiSqXORpgCVOdkTt6fWYtwasxuYVZaKE39gb1hAyI9I1oGJEm/0/2ocBgMTItsaTs4z9vYs8DPDN5X4eKeIV+ZJYxTeOf5eWVz++rBvQxvi5sm8/m85mnFzReoNHHP2JKQf4QWOGuSUTItxQgVI2ATnJwU1HPnnvqqo3Bv3OvSd1zX6ppncuZHk0/hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMNXmcWnJP0/zzqJ+6k0FbvUr9IGh9XpPli3uUzhTtM=;
 b=irtUpi+kfBdmCqb3ppaxv4j96s0kauRislLOn34t5zuiodORMqov2ZS+DHWZR3Al4ejotdoa1zF2lP5J6a2CeQ2xMNF/qxM/QgdNXvRw4DcZoBSrwZMIKgGvtSkj60xZHmfDRXVtAKdeOd5WV07znpy4RLXqBaIb9FE4IMPKNzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB6552.jpnprd01.prod.outlook.com (2603:1096:604:fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 11:58:59 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:58:59 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 03/20] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
Date: Mon,  2 Feb 2026 12:57:34 +0100
Message-ID: <df571c2190cceff4caf094a1504ace08fd57e4f8.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: 36124b7f-24cf-45e4-b2b9-08de62527379
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?uxa4TsBOoiDWuegy+24vEH1xAf3fco0uFzZrvvk1WEsL3jRpJQbZfzWiaE/U?=
 =?us-ascii?Q?EUSlren1m0nPN+PStwosGvtP9ryb9FbmxWk0pbDejfNo8S1vqv1ymlf3HMkf?=
 =?us-ascii?Q?5Fx3VMxYbxdZgbEfGOjwESrA0CsO3y1dFMxD3GWbMsRWm32u7PJjX1lFMbTu?=
 =?us-ascii?Q?SbPnM+j66rDBKCM5qD1W+30ydZ9aG38+A9JQSPEj+/wMpvXklTPxbMJUSavC?=
 =?us-ascii?Q?51kzFeQTyp29yJaIHA9JuZGAFxyAvUtPLtvoCT+A9UGPDydtmxCCkG2nQEBp?=
 =?us-ascii?Q?q/AggdIibX15JusnDihgKkufJx2sCBLcW/PX1WLIdMBib1jKdcNYrOXTHln3?=
 =?us-ascii?Q?28ZoPCw3sezSPu6oLiaWFdhc7O8NKOB6V4Izh3so3ROxzT4/Z1rUw7sJooHP?=
 =?us-ascii?Q?dA9AY8Q8FHO8Xue7KwmOF/g+9Ys4rUOoXplqffvt+S8ywBRE9vkIusGtWI30?=
 =?us-ascii?Q?uBx9hPPabWYf8RBjG6Z6zV7gh8J/h8v1ryi9p9ande6N35aT5ShTKPsmvXTB?=
 =?us-ascii?Q?U8eGB92QBSjTrfiDUFZU6sz4FvBUWkjgveJXFiABP2niW4fwpy70hv5Akmqk?=
 =?us-ascii?Q?8aHBStTPY+u4PExipnejFbgVV6DIbMMvFLJMoiHEnEzgPvOyfvr6C83OitMI?=
 =?us-ascii?Q?UQiRqZFpmuT66YB4sI8wPunZzetKw+huLoNCYIO6LAXoOsM5W7kwWf15gaOn?=
 =?us-ascii?Q?k0WV9lx6lIoaV4hiCwRXbau7J0Zsacu0QxN3tgONI0Tcrnkp9QW7u0RPW2z+?=
 =?us-ascii?Q?W1QjBUdHgS/bNt5ZPtb5GOyxL9AQ3T+AVFlrIzQayJrGWH9pEcWHeZmASexi?=
 =?us-ascii?Q?RK6s9JEhKn2KBc7leKLqfDRPsEetsIzNJo5Pz5xhRVNVhNLFZFC9JqFh0RQc?=
 =?us-ascii?Q?zSox7gyEoQb+Sj/hPNVfkhaf3CvYzGsqh1hCQ752wiT2DhdbE6p3VzdtK+Ya?=
 =?us-ascii?Q?eCVOhjRLHWHMW1bV4LotafzKizkBQflrDKSTcqlIWLpKBmR3vTWx0CpLHcx6?=
 =?us-ascii?Q?gDQnelpSsED980Ku32/y2+akUfO+Wl0Ufjd4cw7Grq7++gaOOpq4ck+qNuOY?=
 =?us-ascii?Q?MuaTxxZnGWcrK0kA/1maxUyNifZ/KeCgRDSN/e6MbOu325kde61ltVAkfaac?=
 =?us-ascii?Q?Elvg2WPLsowsdcXafcSxnEnsXn0BsF8TKst9GImM/W/YcJPGDmRjj2iDNryF?=
 =?us-ascii?Q?Pcy1UZV+5dj3b7ASYeXeIHVGrJ6yMibGVGObU/hJYdEz6QoHwOnRg6OK/SZa?=
 =?us-ascii?Q?cNaOmKF9H1uB3JBzwjsvwn9Tlx4qzFwRFTAAfTomKh+zbghB+Ysv+8UjaMNa?=
 =?us-ascii?Q?h+SZy1qWQvcXyM1ZNlnZ8Pbgujb2td8knzxnazzJjVpIYqk66TL+5V2zm5J+?=
 =?us-ascii?Q?KJjc4HBrzhWbLawtgzq6VjV7i5X4j09xFCeEr0xkz5MQa1cCZC8IPyoNa3va?=
 =?us-ascii?Q?yZL9fsrh0t7xB9mvtgJTuIeFxxR5WYMpddHevobFGFwjWoS85n09Y94gBSHo?=
 =?us-ascii?Q?AWZUGbyRA7zQfJE3r0ISUhLTzx0Qmyq2dG5/cfxmEMnWTg5GvnDtPBQkFVPB?=
 =?us-ascii?Q?4yKSILkqFf9aMn0QDr1Ex1YpUF9gj/yRA/94p5Q9S6SsVzhRh4ZbdiX6qpoE?=
 =?us-ascii?Q?GD1/pN+qR8/3R75wRz3mBTM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?AcYgL4B+8Bt/HsYNoiIla/sC9m7qAyw3uXUvzw5/zTchbtk+WzkGYM3ziy0j?=
 =?us-ascii?Q?PzCZ2cWYVkXTe+ShKkCDtm+EJ3JpWzwGFKxVfT8fjSoxsRs9umAOQEMZ1oDu?=
 =?us-ascii?Q?EVIFfs373td1AUcvk6/l2NxN7jf5f0coo6fHi3a+rrT+KGsl4Bz+Gn20RDfh?=
 =?us-ascii?Q?jtZXD6Xs1M3TRRop098hMc34GzKz0FfrQ2lfsCZi6Yb5ubMbrytWDtHPYvKt?=
 =?us-ascii?Q?dk7NJJv7Qv9Sb5820b+Jp4mtBBWesippjQ/zqaoXssAvDw3fxurZ3qvW5sw3?=
 =?us-ascii?Q?6ye1JM3boGEDAYfH7DFoX/NOkfBBpAcHBm4D3nYdh1NrknbZk2ROzgzOaa7Z?=
 =?us-ascii?Q?PL1Uw31AYaSPnssGoffQue1hXm/0JAEqmFMo5qWEws484FxIvZMMZR0acpQQ?=
 =?us-ascii?Q?8h1vxz4iEwBkdZg3hYhE9Pmb9ZhJfMMbeNswHRhQBmqwd5JmpovsWR/F8yTM?=
 =?us-ascii?Q?xc2GYi/FKDcj5WkSLMC8quJj3RYhAHHakfSaFtgd1ZATfpsD0VAMCGvPUzAP?=
 =?us-ascii?Q?vfMX/V1ofgxTrUPN+3crZsnB+0FKPJXaqlnI4cBOSswtDx5Hy5eI/ku9FUh9?=
 =?us-ascii?Q?/pclJHSziQSrgwszF7OVKVFuU0dhDNNsL293urlZ8Wsc+WAleDYzz7iDR9zO?=
 =?us-ascii?Q?ffjZ/SzeXs87l9YjTfC/1KIMqc13N+ejHWk8QS/2ZgLnE9XlajEPOSrdZv8j?=
 =?us-ascii?Q?hTK+aR8+7Vrdq3iPtJcrB0iOomDHUGq7lAHGRFD3puOG7gPn2Jxh+YTXTgna?=
 =?us-ascii?Q?8+PiBTW/+uycO59fE7GHGMXPthF6rymTZPypuBZudxdre3yIg9RILbzGjcNd?=
 =?us-ascii?Q?ysK8KGGS1C3DTj2qP3FSK60GYLgs6cOHiKEi6dK5ujxZPbty3LLB5m0VypVL?=
 =?us-ascii?Q?MJfeygs7X83wIx8mlXwKaEZqPjGj4j4Gf/C+GAWcgzTRSvDynzySTL2LOJZr?=
 =?us-ascii?Q?ESSTgoZlaXw6Er4+GJmzjcJhcAlI1Fe2rQ6xnumKdKwNSsqhH8qRqKsIwD/U?=
 =?us-ascii?Q?sNS66GulCaoznLsVzqkWAbpfOv1bhnA5LS8ew4KLRT2V7TRq43Xnsdmzatbm?=
 =?us-ascii?Q?9MDiiuHcXyShoXlE37Ow/M6p+zpd65sVt6hcV4CFvPbSpI2n41JKaHJLp6Fq?=
 =?us-ascii?Q?YG8YCpf5DJcdnAJ1IaozyfmSoJAdsMrucjKWE1ubM0krPLpV7o6xxsYKoLX5?=
 =?us-ascii?Q?yzCHDoljzqr/A2LhULg8PFMn2dlD2BnLiCjxClHU3fylDE4EW61awcGR2Z+n?=
 =?us-ascii?Q?12XI8Z0vcvvncSqJ0nKYrIgX9pbgLR9ssGLnQ0hqPJMIRh/IzOmNI0NLxLcC?=
 =?us-ascii?Q?PvheuCS7ypEsYzO9aWHm6L8WdAsJbEsL70ce0NlPCs+ZcSbKgST5jaLFiZ+l?=
 =?us-ascii?Q?MUa3EShN0O6dk8G8hNcNaz8+tnRCG2WQiBrSs+x/3n07Gck4kOSX4pVWxL9F?=
 =?us-ascii?Q?gIrC5bkeYOfTDImS48Ij6gzcsmv+xHxsglYwnsre7SrZ8a2CdKmA4RIT0zo6?=
 =?us-ascii?Q?jXtZnXWPoTJxpVHPjlt3BjApUj8J4SLC7AiGxaA/YKV3eFO6gCmWArFPRL0f?=
 =?us-ascii?Q?iV2genxGzmU8aBFhA3yP+8hcbBeOqLRyjskjYBfN9afx8Wxn4Hq/TJlgpIxh?=
 =?us-ascii?Q?GdpA7p34bdX0wvoMRq1twHHx2a/J/qAJaVxD13GIHy2BZ5i9yc27i13JCKNo?=
 =?us-ascii?Q?E++IEqU4TFigP/mHy2JvmqKfGXcw7tDKvvnbSgva3yqN8xoQP1dXw0y6Db5s?=
 =?us-ascii?Q?Fwj97bCzRmAIzdwn5OK0cdeVNR3I1e7gv4F+dBJ493KJm8RXdwdx?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36124b7f-24cf-45e4-b2b9-08de62527379
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:58:59.8505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vS/98YRDJYW6wc2gpaVYHK4XNT2CWsuqwd5UHbQYOu+9Bq3/QKzUg5PVBH7HnuFVa02fIGsWYckZ629avBUCvjP/rwhGLMLiZGATShG3FfenKgs8g7z0OZL74dcX4Pew
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6552
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27763-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: EB2A7CBFCE
X-Rspamd-Action: no action

Add support for the PLLDSI{0,1} clocks in the r9a09g047 CPG driver.

Introduce CLK_PLLDSI{0,1} also, introduce the
rzg3e_cpg_pll_dsi{0,1}_limits structures to describe the frequency
constraints specific to the RZ/G3E SoC.

On Renesas RZ/G3E:

 - PLLDSI0 maximum output frequency: 1218 MHz
 - PLLDSI1 maximum output frequency: 609 MHz

These limits are enforced through the newly added
RZG3E_CPG_PLL_DSI{0,1}_LIMITS().

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected GUytterhoeven tag.

v2->v3:
 - No changes.

v3->v4:
 - No changes.

 drivers/clk/renesas/r9a09g047-cpg.c | 11 +++++++++++
 include/linux/clk/renesas.h         | 20 ++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index a73d12d4964a..8d4c70533a79 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk/renesas.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -30,6 +31,8 @@ enum clk_ids {
 	CLK_PLLCA55,
 	CLK_PLLVDO,
 	CLK_PLLETH,
+	CLK_PLLDSI0,
+	CLK_PLLDSI1,
 
 	/* Internal Core Clocks */
 	CLK_PLLCM33_DIV3,
@@ -117,6 +120,12 @@ static const struct clk_div_table dtable_16_128[] = {
 	{0, 0},
 };
 
+RZG3E_CPG_PLL_DSI0_LIMITS(rzg3e_cpg_pll_dsi0_limits);
+RZG3E_CPG_PLL_DSI1_LIMITS(rzg3e_cpg_pll_dsi1_limits);
+
+#define PLLDSI0		PLL_PACK_LIMITS(0xc0, 1, 0, &rzg3e_cpg_pll_dsi0_limits)
+#define PLLDSI1		PLL_PACK_LIMITS(0x160, 1, 1, &rzg3e_cpg_pll_dsi1_limits)
+
 /* Mux clock tables */
 static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
@@ -138,6 +147,8 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
 	DEF_FIXED(".plleth", CLK_PLLETH, CLK_QEXTAL, 125, 3),
 	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
+	DEF_PLLDSI(".plldsi0", CLK_PLLDSI0, CLK_QEXTAL, PLLDSI0),
+	DEF_PLLDSI(".plldsi1", CLK_PLLDSI1, CLK_QEXTAL, PLLDSI1),
 
 	/* Internal Core Clocks */
 	DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3),
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index c360df9fa735..0949400f44de 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -164,6 +164,26 @@ struct rzv2h_pll_div_pars {
 		.k = { .min = -32768, .max = 32767 },			\
 	}								\
 
+#define RZG3E_CPG_PLL_DSI0_LIMITS(name)					\
+	static const struct rzv2h_pll_limits (name) = {			\
+		.fout = { .min = 25 * MEGA, .max = 1218 * MEGA },	\
+		.fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },	\
+		.m = { .min = 64, .max = 533 },				\
+		.p = { .min = 1, .max = 4 },				\
+		.s = { .min = 0, .max = 6 },				\
+		.k = { .min = -32768, .max = 32767 },			\
+	}								\
+
+#define RZG3E_CPG_PLL_DSI1_LIMITS(name)					\
+	static const struct rzv2h_pll_limits (name) = {			\
+		.fout = { .min = 25 * MEGA, .max = 609 * MEGA },	\
+		.fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },	\
+		.m = { .min = 64, .max = 533 },				\
+		.p = { .min = 1, .max = 4 },				\
+		.s = { .min = 0, .max = 6 },				\
+		.k = { .min = -32768, .max = 32767 },			\
+	}								\
+
 #ifdef CONFIG_CLK_RZV2H
 bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
 			struct rzv2h_pll_pars *pars, u64 freq_millihz);
-- 
2.43.0


