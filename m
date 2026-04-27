Return-Path: <linux-renesas-soc+bounces-31682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KI7pLQ1g72mHAwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 15:09:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB794732B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 15:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43E7F3047E55
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 13:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F178A3101D4;
	Mon, 27 Apr 2026 13:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ITavioOt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010060.outbound.protection.outlook.com [52.101.229.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3CE318140;
	Mon, 27 Apr 2026 13:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777295071; cv=fail; b=TwLiJyW2J9IQQeHAnp5BjRt2+7JLMgo9CXuZ4fdeNQpuuVImd4d1kaX4IL+y5vsX2jhIcf8AESHUjJzB1pj5Yl788QZELiJi+W5uFFXcg5QIPx1Eqo1qKf2P0zrPOnGtF9wKeikAM2d2lTXGCRCK+Bvsp91HeCu9USwRBDZJvrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777295071; c=relaxed/simple;
	bh=Q2SzmV+4+kYsBjdyimdPK4FacLveTyOcHz2KN+tDduA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=npC0TnvuGUPzhViiA4bNEYAbyqa0QzFMToA6WVqOXbH4oKkY2VU638rzfV2xSDpB/S0NdOU7pgEu9ggXlTBy9ebiZuEGXES5gwNrnGiiNif2xH5Om80klY5hz4aSAimcmUo34iVNFa1uaSuQUoyJz2ubSVGLpSDo6PQjGSLM8Uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ITavioOt; arc=fail smtp.client-ip=52.101.229.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IU3WdoaDOSlcOVrJUbK8dCxub2RPm+KM+WHO8QlWGp3zdYkuH+iJ52khFZDj6ZWZmMjY2ON/lBpyBs/GImAePlls6SUG1FPTx7g0cvKMWRlTyqy3TO9H+t1XrP2gz1sLLjP+8Asl8gxqiFrNWGLmvRZ7qK5AriYrbiaWWnZNqvdVYra4+p9M6EBFqyuy5GUa75owIS/eaPpKLSSj4J367o8fTGNkXzxOpcSrOTrid5jsPRUj5bFgOLFyrZD09pqVU4Yi2roZga7cQmq2QEZ98Ulg67o4eu741ZOFQBLsUJZKrjhpZXJkMVYhzOi8lAwmA4baGoWffwLcarM3Rc5Y6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o75KMLAd+qmDSbGZxWrUTmzdULAM/2OGX68VAPtHiBY=;
 b=eRa+Xr4t7VMNWqh9QeEOUjxmssjH/5hnfnN4XFpPLKXpJ3YwnFtt/DW8DYrNxIQ+QUDWYmufTGRik1zuAWXsf0lUD5mOxHGIXb2k1bdK4A2kR+kiW6EJJEdXeVQ9tGD2wsV/7C8tFJJOo8fqFL0N7bY3m6nNjMVYO49v6+6ThSsMXrjRMAIZhjFTF77d9Yv3ES8bhR0OdPMK78wPUWRzicorOBrvSgU/Umb62wsTuKiV4MoFHlTCr/6eRKsjo0Oz/il3VxeZh1rbIePIgWiVS/YIhJYZv+pLLuXJI3djQObD5rWHBv+fQJAj3nJYfTfUbU2/Ge1k8Eu91yB4uBxivg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o75KMLAd+qmDSbGZxWrUTmzdULAM/2OGX68VAPtHiBY=;
 b=ITavioOtBYSjpkcJxKMdVOF1aaMrmNQLV1pfy6eqEps6YXP2TMz9wryHmXlJshckGlALvePHnkOAkKnDhve2G4Fxrx5Brw5WQrRl854OIJ+79PvYNJ468kO2XtfvfcB35G82aP0ZN9k2JuvrBbCTlR/9KZwQ+CMc2Rhl9h1jVmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB9376.jpnprd01.prod.outlook.com (2603:1096:604:1d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 13:04:26 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 13:04:26 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	peda@axentia.se,
	p.zabel@pengutronix.de,
	ulf.hansson@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Josua Mayer <josua@solid-run.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 0/1] Add USB2.0 VBUS mux driver for RZ/G3E
Date: Mon, 27 Apr 2026 15:03:36 +0200
Message-ID: <cover.1777294876.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB9376:EE_
X-MS-Office365-Filtering-Correlation-Id: 99aea0a4-f1e7-4eae-61fb-08dea45d8282
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	seUAVoTzq8o4trd9e2gSPNCkLMWOO5CSH2vHC4/O2Es3tUBRWOmMiPiaxlKWFjDrd8voa+mof0MgU+82wvPexMaYbnowuSz0PTxks7K/JsnU0X0kCJFny4unetwhvJaNY81Y0PrLsWVFZSDxL6OnIHlgA7tKqAzhnS3jTX9f/8b/Aw/jYIfJLG1OWNHQDtirhI0XYx5pfNOpGOD/CevXuNjjOG9m/gw6HMFMX54ncGEOmSThEDPm3n/u826yj2+5F6K4GoeX/T8GfALJ8YaHPmkqp4Bd2JU/vhAecVfY0+4MH/g3xW/ryi5ryz3HrYVqeblBB1vAdKKiBkMKN7WC6o7K4M3YmNYaPpHYrEt6o/toVpXGDxxzlrU4ON6WfQpFIjp2uCK1QQZuP6zbc8z0deidUnAb8vfzckmuRPXufaafl29OChJRxGBbZvEmfEsL4m1F6AQ/WtC6Z9hAA9s0iJyo8CWNPd52KqtaWhytVavnzB/A2KWjldbBnsIDFimBsC1dUaV1LB/JlDJVotKJ1xgG76mCx9Kn63i0OEKPsBeWFRD4yOr9q8rpnENzoz0Cgqnrk4f9HqYb6pRYtvXDgJryIGntQnKkEXDBTX0SeRQTGX013eluoIG/2o/PAJ4iSuqJkigTA++zVKmdJYvo+B8aWny1ytOvjUlGMN88+TIJ+GCrIUNpmSpM1RgkDa7N1uWA16SsOVQxX3fQsdBtrtzMgzw0L04jK30KVlwcL7U7KSvZgTWzcVioyOH3csh+7vkUUuJsl4iDqJnut62lcKwWmEF13JtgQwgUBrgLuIM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dI4eBX1mXeBWNjySU0W5voJpC80bMJIO65RvsjmV13uIlTIRqoTAbQF83fX0?=
 =?us-ascii?Q?J3mq9TWVpdZW6lUXToFOJSBYmgjRhwAJTLPxKrkp2ZuABikvWsPY7tnwfyRs?=
 =?us-ascii?Q?NJh0uHB3LKor/08CA9X/bv/luYw7LryKWunde1ISmDiUlAd4+4EXLNbupV+U?=
 =?us-ascii?Q?IUuzr3R0ibF8hGuIFckKEP/9nS+Yt7EXKvUHt56GL4S6KbalG7nlKYOXOiZ6?=
 =?us-ascii?Q?TLAG3zJRsiWQVMkdQhxxs6YQ5V6AvBzcnytjDobpmXS4s4Y8FaaFSvlo/pA8?=
 =?us-ascii?Q?crqSGii1cz3gtv5WD1oQ1wRIGfgVBWPjcrwcFJFbkSFHOTq5fThvikGc6bl/?=
 =?us-ascii?Q?Go9TdwMXmz0wN5JJMxCG9lU6oR4jCFu3p5STIkzw98JLooE/Pz1T0Kgetilv?=
 =?us-ascii?Q?Ld19xlX/xoXuyqmnmRPNIcz5EeBHnPHgmF57LO0rXSlrF6IV6SGSjQ/umc3D?=
 =?us-ascii?Q?ktijt9JaNOhQhhfIqWMwf4PWGRUPCcHfNhCPVAO798xK7tLlCfj3IreCiyg6?=
 =?us-ascii?Q?8ytXh7GaYH1u8HdrAsM63PSGOnYizpVC/fOJGB9q8SWLa3UAapwd7sPNTyyc?=
 =?us-ascii?Q?o45KtLjDOLMbYMJNkeDyPLsqWeee4ZBHvJE8Mre5caJbR9qRQpb+1LM3Jb1h?=
 =?us-ascii?Q?K/vTaItQ65lwyeA+50pSmn43dDB9hvIgzwt9Q2FfV/4tM+28WReFxG5MugkX?=
 =?us-ascii?Q?96DrSsoJPfZPyABVUi1YPr4KAAWuoEPYLmsJuSaGW9t7DZDq/TGAwzJ8/Ho1?=
 =?us-ascii?Q?KtPEXowoUx37J1UBJhnUivuTWD/N4H+pIXDWCwlm8aCS44/DebHhRjz9YVzP?=
 =?us-ascii?Q?4GTnfQLbWBZe+T8ysIZNCSKecco1/zcX+tk4pfr+PQYB35h6bpWxlpTNbtNJ?=
 =?us-ascii?Q?R5dQbmrmukaaEtL5tvaQ8HSUv1xr83P7eJqSVDhyU/RlPpmSa7YGVhC8S/Xk?=
 =?us-ascii?Q?4UyADt63eHSTDMPI5h7G+h1rT7ZQ6aGb0ZpYWAJxM09fBnIaV/AU6ST1TBT8?=
 =?us-ascii?Q?KZnbc5DBM9srOjkMql2xPO3+7XT3+icc0kquLYGJqHtXl11qzA4MtfGw9TEI?=
 =?us-ascii?Q?EuBuA/5wVdk1gp4kNFq2bQvsWKp1kFL+lmKWQHNNMlZNUgZIgeduWrZrAkTP?=
 =?us-ascii?Q?xISiOEVLAioqZlXqR/yhJe7JkCYzzcSp1s7B4bbnvMmt5nnAopZJ9oMkE27T?=
 =?us-ascii?Q?UVHlH4N+QkfJQnpgVRfpZEQkbqPQtGX0MEkXT6YCOoyKrrsz6qn87ay5KkBz?=
 =?us-ascii?Q?p2GTJBboBSwilOuyOvJrlYHJaOx5/v/e19TgZpueSJ8Rfrmp8OFzHS9TRs4x?=
 =?us-ascii?Q?WISG4Qpj1KZu8PSrKoDhmTryAlpzLi2cPZ8CuatuS1f21mhP5oxy+cUpvQGC?=
 =?us-ascii?Q?8Hf2HlhxAZLjx5n+1z0tZIYwImfelZEktLkSI6H7jzveypp3mxS+GRjR1O4Z?=
 =?us-ascii?Q?Eqe+Ntox6VdCpp+k3ylUU0Uy7moydh3jb4WxfKvh0uSjCRd2IU+EzbA1+H+C?=
 =?us-ascii?Q?0086hX/984rrMPq0//ASyUG2teuuapVqFV3jj3jtCODJL23ri5+mbmsQpO9y?=
 =?us-ascii?Q?5QxccNXHQAEgoEB69JzLNDH5xITOxkMBSVRSW/iUeT2hEhQiBr0gn3s58BiM?=
 =?us-ascii?Q?Tm88d+Sn/KH/3k/JnOtmXcqJ69LPHRCfjwvRGHP1mt7kTM2h9rzPFM+fGYUi?=
 =?us-ascii?Q?jbQEH2g0E/8EcJJQ4zwVboVKl7gLvCfpgLJPfljmt2rltXq3OhpDpgDHwldU?=
 =?us-ascii?Q?uwib1kDicsuV0VIAl7qioxmtS63Fi12iY8Xz3gfL/Opx2GKS+RJ6?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99aea0a4-f1e7-4eae-61fb-08dea45d8282
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 13:04:26.6627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KtjlH67+U2OQ5aYFAPSKdrdCqEiXbT8kDe8oCtPOgeMOGgOa6bwDdXzl3++DcHMJ6CSFZZWqdLabkHG8SjzMVKo9EUMxzAA07E0z1kFrn/yJQKvEM4uXrw5hFkUN425M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9376
X-Rspamd-Queue-Id: 1CB794732B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31682-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Dear All,

This patch adds a new mux driver for RZ/V2H USB VBENCTL VBUS_SEL.

All patches in the original series ([0]) have been merged except this one,
so this is just a follow-up patch to add the mux driver.

[0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/cover.1775047175.git.tommaso.merciai.xr@bp.renesas.com/

Thanks & Regards,
Tommaso

v10->v11:
 - Rebased on top of next-20260424
 - PATCHES 2,3,4,5 of [0] have been merged except this one,
   so this is just a follow-up patch to add the mux driver.

v9->v10:
 - Rebased on top of next-20260331
 - PATCH 4/5: Use struct reg_sequence and regmap_multi_reg_write()
   to handle initialization, assert and deassert sequences and drop
   custom struct rzv2h_usb2phy_regval.

v8->v9
 - Rebased on top of next-20260326
 - PATCH 1/6: Fixed driver comment year (2025 -> 2026)
     - Switch from devm_regmap_init_mmio() to dev_get_regmap().
     - Drop unnecessasry include bitops.h, of.h, property.h and
       drivers/reset/reset-rzv2h-usb2phy.h headers, driver is now based on
       regmap.
     - Collected PZabel tag.
 - PATCH 4/6: Collected PZabel tag.
 - PATCH 5/6: New patch.
 - PATCH 6/6: Drop linux/reset/reset_rzv2h_usb2phy.h dependecy as the
              driver is now based on regmap and does not need the
              reset driver's private header, update driver accordingly.
     - Collected PZabel tag.
 - Update cover letter.

v7->v8:
 - Rebased on top of next-20260311
 - Updated series cover letter as part of the series was already merged.

v6->v7:
  - Rebased on top of next-20260128
  - Split series into per subsystem series, no changes.

v5->v6:
 - Rebased on top of next-20251219
 - Re-arranged series order per subsystem patches.
 - Patch: 3/14: Collected tag.
 - Patch: 4/14: Fixed commit message.
 - Split from dts patches will send separate series.
 - Added merge strategy in cover letter.

v4->v5:
 - Rebased on top of next-20251127
 - Patch 01/22: Added Reviewed-by tag from Conor Dooley.
 - Patch 06/22: Changed file name to rzv2h-usb-vbenctl.c and Fixed
   Makefile, Kconfig, function names accordingly.
   Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
   Updated commit msg.
 - Patch 07/22: Update mux_name to "vbenctl" to match the driver name.
   Updated commit message.
 - Patch 11/22: Fixed if statement for mux_state error check.

v3->v4:
 - Rebased on top of next-20251121
 - Added patch 01/22 to remove nodename pattern from mux-controller schema.
 - Switch back to v2 implementation for mux controller in patches
   5/22, 15/22, 16/22, 21/22.
 - Improved commit bodies for patches 5/22, 15/22, 16/22, 21/22.
 - Removed mux_chip->dev.of_node not needed in patch 06/22.
 - Collected CDooley tag in patch 09/22.
 - Added missing select MULTIPLEXER into Kconfig in patch 11/22.

v2->v3:
 - Rebased on top of next-20251110 + [1] + [2]
 - Add missing Cc: stable@vger.kernel.org in patch 03/21
 - Patch 03/21: Added missing Cc: stable@vger.kernel.org.
   Improved commit body describing the removal of rzv2h_usbphy_assert_helper()
   from rzv2h_usb2phy_reset_probe().
 - Patch 04/21: Manipulate mux-controller as an internal node.
   Improved commit body.
 - Patch 05/21: The main driver is using now __devm_auxiliary_device_create()
   then update the aux driver accordingly.
 - Patch 06/21: Use __devm_auxiliary_device_create() to create the aux device.
 - Patch 08/21: Improved commit body and mux-states description.
 - Patch 14/21: Manipulate the mux controller as an internal node,
   and update commit body accordingly.
 - Patch 15/21: Manipulate the mux controller as an internal node,
   and update commit body accordingly.
 - Patch 20/21: Manipulate the mux controller as an internal node.

v1->v2:
 - Rebased on top of next-20251103 + [1] + [2]
 - Reworked series to use mux-state for controlling VBUS_SEL
   as suggested by PZabel added also mux bindings documentation
   on phy and rst side.
 - Collected Conor Dooley tags
 - Dropped unnecessary rzv2h_usbphy_assert_helper() function from
   rzv2h_usb2phy_reset_probe()

Tommaso Merciai (1):
  mux: Add driver for Renesas RZ/V2H USB VBENCTL VBUS_SEL mux

 drivers/mux/Kconfig             | 11 +++++
 drivers/mux/Makefile            |  2 +
 drivers/mux/rzv2h-usb-vbenctl.c | 85 +++++++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c

-- 
2.54.0


