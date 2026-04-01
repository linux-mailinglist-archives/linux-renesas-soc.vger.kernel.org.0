Return-Path: <linux-renesas-soc+bounces-30694-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMuZLmY9zWn5awYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30694-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 17:44:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B85D237D619
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 17:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CDBAD303F665
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 15:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93608466B71;
	Wed,  1 Apr 2026 15:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dUPuz3RU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011053.outbound.protection.outlook.com [40.107.74.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C596E4657C0;
	Wed,  1 Apr 2026 15:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056609; cv=fail; b=qV8LQl2LoXuu0r2SfUq89FObnAzzkNTbWB9P4pXkA1slAVWw/fth0zCJmcqsNejmN24cLeUef0ugkUiPs/T5UuyT93YN0lUpPaH9KGbgwLUb278a3aNnfjRnUddclP7TVzE1qgrAvg69JVVVrasCE3RiWa1xvubKlO9Q030E6vI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056609; c=relaxed/simple;
	bh=QK+KjkgSrah9OtsLby9yqTEekQKj4UdOcmJfR2TJJwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OGmIiu8HREV0QYFSTdTYkgN9TaS4PIupswjFnQKtC0Zz0zTzMyXN6gUTpQ4i2yhBCvFzPuXrNsw5kvk5xccnZp6wDcu8wOrYOrIBg9HnDoxSH2ANJHWT2s31Dtsc0HeQIHo80DFcdJkFfYasHxLKz4yyOLb9oRbkKNIIuRnxfU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dUPuz3RU; arc=fail smtp.client-ip=40.107.74.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNnNx7M1aTTX3KV7E02ydD7tUl8mQbBxnXLJji1T8JRjD61aQfPrCf4h+HX08YDkBx+IeBj0780fLMTDfP7p/4Prkl/ps4fu94H29Y45luAvNwNYH9D0ylAU5XXsHXw0lWlCOEUdRfru2Y5dVfy/yWFHI7qM7To4HfJ9F2+OTzdinIk6PoMVlXGRGZrKch5ZL2qKmtD9n7aRgbMPLKeQFnE/eSrI7kIpRTZzaFrC2RNbmWHQRyfHNMPwe+tSfeGqUoEigmfPsJmgMGfZtNqyTlPhH/5yTvbvHy5LSRnO+XyVmyppYSYIMEe+eMyTixJKuEMGXcp/xQKogbnMRtN2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPjmDAjahNac23VQA7Tq7alBNjSOCCBpAvPlRl46W7U=;
 b=S6+OBwsayL71ZoUfZbkbo7gJ36U2IOqr8lHYiuMnWwOiZtPK6+IQ15Uq+Rphd2kk2Q5QpMVbyGeYrlPQEHOj/BCImM4AtnQ5oBbTtK++ig1sN734GuglS51qAtH+Xelj9uzrVeIL1X5xpJZoseFYSFyukL8g/o/e+g7ie6qcfHLqcYrMC1fufwn+A1AcVidtjPth4y1TQCrvvUQkmJid46pswG4EjgHnzQDQvA/ayyRSfT38PGOr+85+GL7uFcdrdtxtlCTKRl7CvbRyHBW3bXtB+KDphYav/ujXxLjk0TSLvcnd/yPdsGBQVH98ENNH1WMibEJwnfdVwT7fHSNJUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPjmDAjahNac23VQA7Tq7alBNjSOCCBpAvPlRl46W7U=;
 b=dUPuz3RUm77ACxdZHMB3ald6D0dsItYAUhYC864Xz7dOWqoJ7lquuOhsgYtkpemvcAd7O5u34pCDErR5Wf/LXQHgBEbVdmeveq3JIvcaD3XiWG0DK4clrMFFdGH9TVdEoLDqil+5raXp6r/J4xLZYIYD3ct+tN2CcGJpPuK4Juk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB9993.jpnprd01.prod.outlook.com (2603:1096:604:1de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 15:16:44 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 15:16:44 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	peda@axentia.se,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Josua Mayer <josua@solid-run.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 1/5] mux: Add driver for Renesas RZ/V2H USB VBENCTL VBUS_SEL mux
Date: Wed,  1 Apr 2026 17:16:07 +0200
Message-ID: <cda933586ef7ca119dbbcef45a921c29dd517698.1775047175.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775047175.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1775047175.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::13) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS3PR01MB9993:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b0423e3-9aae-40a2-f371-08de9001af60
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|52116014|376014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gROA3aBD+UTuZpAu13cNOpph2xninw6ABkWZ7ZvY3sKZLxM0Q9CPk3sLQvu0+QMXExUsoBJZmOVB4o1eNYWy1dKl03O0ECF5ITJYj0+FlhWmlekthp6kSTAfbtXlu36xnVwalHywxANMyOPZVnkNsbAFLS0ygSI3IYlVBciqLrVOoTYuPKVKDO9IRPleVA6MSNhNuaxBBMmVIwsGZw4UOE3/OsEsKE5tzdOy7kedR+tuWQp9qKKuy70JWsZiCpyMUpLzyN0aJLEw+4DjTF/hEcvdltRbPJsMP3sqWlfAVwsQRXwzYCOmAyESwvWl10bRalFOY085TpOHo959wqQdkZ0A74it/0AayeC/cCeGMnc16VludWuNTByTMiM1iA9sB76n2Op9eKViT3ad3DCNyJ4ED35Un14XD+PZh2HOVd3pWjyFquHuD77gQojyA6+JhHejl0kAzsjgqx7W1vqk0j6z1oy6aHwPpB7xa+6Hgjb26MC5giJnLcKvEXyW3hdoqzVpWXqkcMtGrr4sNgEpQ+VaxfTcUcfka4I50RV9aRb2+WVI7H7Tl5JFZ8G8oxezFPj+/sOmEmto1M1LN2Qt3PDCYQyMtfpmYn6lae0UcnM6Utdh5M0gP2u6FVTrqsWWrbLLizoUg0Xqlzcnxosmu03F08Q0DIwHBlNQdbVrkkLwdMmb8NdHBZJxuh3tIxC8ZgTyvuj9/5OOzt0t5KjD2s6PWjZtmFdeMFVaalWsQ5uv2G4pUa2fnqhsVXUl4YZzjQ3HjOGdHjpAb0nacX8DRp26B/3f40BnIXuklX6Xq+w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(52116014)(376014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dkm9zp1REdEOsqAKKtCJ9pgCnrPOTiCZuLVN+SvdcGtQDaBHFy50cQEMdgFu?=
 =?us-ascii?Q?5Mq0KtLmmgOrAZOK8q7Tzb7lt6jddoG+M2VGXQtCrvo8o20IqCvEbu9Z9lDn?=
 =?us-ascii?Q?YbzlGbj/b39AQDv0nEj17O0pPdhn4OtA+DCndh3pNv8136J99RJROx8N/AAV?=
 =?us-ascii?Q?HXY0ybFGZtO+zKpmwJ5FgAMUSGdtvA0T5Ci4ZUYGMWt+0jY0RbdyExbbyyNO?=
 =?us-ascii?Q?36b17W7HGEmTv9plLlBXtU/Uctv+b/9HcH3jBE5hszsaFI59qHmvGtLnCXUQ?=
 =?us-ascii?Q?E2cbcHXQeHa83eVV3PbXGiM17TohAmXghuPtpx4sOWYRWGEO3OGTCYH3zs3x?=
 =?us-ascii?Q?/CucEhppe86yFbAhoe1xZ6bqx+hSQWzUJ2VHH+q90uZa4CmI6MFinJETUSeB?=
 =?us-ascii?Q?rzy5B5tOOZQUy5KAANJXFgvVy+FxBH9zCaugcqjR6H+PRfYKGVioPo1AUFZL?=
 =?us-ascii?Q?UaCZ7uMvWGH9pqEmAmkLHRBFsIGYopmTrQGtzAFN2Z7zG2McE4FuYptJa79y?=
 =?us-ascii?Q?02xtvYdCiSe1bOdIgRlz3x/w/HKqJslcVxKmog/IywdwzGfDT5KF53i21cRe?=
 =?us-ascii?Q?eDJniK9Fk7E5K43yAkDCAUnMiT1CW65jkUCaEIuqXR7S4cq/TM2w9S6l6yD3?=
 =?us-ascii?Q?Ie2CmjsQgiwvEws7IoH8PVi5yV3fJKkTEkxp9KgVDaA1t+QMLZ6n+c8U+PxW?=
 =?us-ascii?Q?mlvUwINvzOtnw5HSq/M4S/WrlkG9e6IKAZPs3fz2fnOktiGDO9mYAEO0aDpx?=
 =?us-ascii?Q?u2gazR2HAQEkXDujTirGOnSUEISu1dQevIh687j/hp7XYylrrxLPLbDomKrW?=
 =?us-ascii?Q?qS6UxmImmub0TCEbcn2rsurpDgy8SPRnkMjomRHcGXfvu80AdQOld4HBfcQl?=
 =?us-ascii?Q?1E/EK/ILTyjFuKLy6aqdzWpk57sJSujqBPM9z2CWpxZjY7fAFqHbXM8Ympky?=
 =?us-ascii?Q?B0ZMyt+kc30yHbhxeM3Tv6uemCWG6nhUJF7ibTJcmNFs/xXKlbc6mV9VLE5D?=
 =?us-ascii?Q?aVgpj0wHn8Z+0NMDbHQ/GM8ocOsjGBZFn9BOF6KlPSQRV2Vh/4kSv3f1gvKd?=
 =?us-ascii?Q?4jhcnfnIkGe3L1/P+r1uSNqUm79279Jvf1hluT2gYEB0kaUhJF5am8GJN1L6?=
 =?us-ascii?Q?z5/Txj76md4EVGeRnsQROvgWNmxhqcqnxYSch4T4fIWMfB6kMpKsxyromTG1?=
 =?us-ascii?Q?aSifWf4pY8lYHLtGiK5lykAwOXrVKuZ7ywZo48Yg5/873o5J9JM1LeCPRfX9?=
 =?us-ascii?Q?y9hxYiff4KEA1QGEpsYK54b/noEswsl0WR7GGYE6unNBKb+o+Ps7NqZqJ+Mh?=
 =?us-ascii?Q?X6XYkyQxPjH9pMG340/p2u4rBZ+Eu+frLHfYK4GiIskk5nztHGdSPTRUIWWh?=
 =?us-ascii?Q?xMI3oceFMWsZWwYJYGnocWRAGdSxcvMRIklfFSL8ngf9G+3ss8E8lVD2O1ai?=
 =?us-ascii?Q?9IhzC9KcbEQ0dDkYMDEujUdoXjG0PjPmPIqoa6TCoJorNLylWLc6UAffzVJN?=
 =?us-ascii?Q?eonpqxODzZV+2QrtmngehnlLCUVzU8+/YI9/1Xzp9me3fOWR7QDfVx8SCWCI?=
 =?us-ascii?Q?OKhf+iA3qAmpQMQSVw4HZ86e4AkLuZSaMYFmt2QZuHV84GrgCH/luKMyRhgs?=
 =?us-ascii?Q?HB2A/Kd0fD1qJBibp2b0TiVFAHSdzwzTycyPdxo9NDZvCrbUtpm0cQwzT470?=
 =?us-ascii?Q?JRJAx2wr8nVW3kqGk9bp5GzBcrSPfcJ6gKhpEOV/M8m8biBFjK8EVHGXXuGE?=
 =?us-ascii?Q?NEJlj1Xo16/itDbMRrOC+q/4G3pNjaE5K4i3TKzqVxD7dFXQLMhd?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0423e3-9aae-40a2-f371-08de9001af60
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 15:16:44.8280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: daFhX/Ce2p9lEPi92+/BL2F/KVp1tOuNf39nx6GuMvMlrBVT0fGOfHc/hPvM0RvjRNgJXwF4yWk5duqhAloTsqOSCmBpUIKkG3yJ7zeoWVWyLX8Tyirj/XxEZGGjnAye
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9993
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30694-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,arndb.de,linaro.org,solid-run.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:mid,pengutronix.de:email,renesas.com:email]
X-Rspamd-Queue-Id: B85D237D619
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As per the RZ/V2H(P) HW manual, VBUSEN can be controlled by the VBUS_SEL
bit of the VBENCTL Control Register. This register is mapped in the
reset framework. The reset driver expose this register as mux-controller
and instantiates this driver. The consumer will use the mux API to
control the VBUS_SEL bit.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v9->v10:
 - No changes.

v8->v9:
 - Fixed driver comment year (2025 -> 2026)
 - Switch from devm_regmap_init_mmio() to dev_get_regmap().
 - Drop unnecessasry include bitops.h, of.h, property.h and
   drivers/reset/reset-rzv2h-usb2phy.h headers, driver is now based on regmap.
 - Collected PZabel tag.

v7->v8:
 - No changes.

v6->v7:
 - No changes.

v5->v6:
 - No changes.

v4->v5:
 - Changed file name to rzv2h-usb-vbenctl.c and Fixed
   Makefile, Kconfig, function names accordingly.
 - Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
 - Updated commit msg.

v3->v4:
 - Removed mux_chip->dev.of_node not needed.

v2->v3:
 - Added mux_chip->dev.of_node = dev->of_node->child as the mux-controller
   is an internal node.
 - Fixed auxiliary_device_id name.
 - Get rdev using from platform_data.
 - Drop struct auxiliary_device adev from reset_rzv2h_usb2phy_adev
   as it is needed.
 - Drop to_reset_rzv2h_usb2phy_adev() as it is not needed.

v1->v2:
 - New patch

 drivers/mux/Kconfig             | 11 +++++
 drivers/mux/Makefile            |  2 +
 drivers/mux/rzv2h-usb-vbenctl.c | 85 +++++++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c

diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
index 6d17dfa25dad..7f334540c189 100644
--- a/drivers/mux/Kconfig
+++ b/drivers/mux/Kconfig
@@ -70,6 +70,17 @@ config MUX_MMIO
 	  To compile the driver as a module, choose M here: the module will
 	  be called mux-mmio.
 
+config MUX_RZV2H_USB_VBENCTL
+	tristate "Renesas RZ/V2H USB VBENCTL VBUS_SEL mux driver"
+	depends on RESET_RZV2H_USB2PHY || COMPILE_TEST
+	depends on OF
+	select REGMAP
+	select AUXILIARY_BUS
+	default RESET_RZV2H_USB2PHY
+	help
+	  Support for USB VBENCTL VBUS_SEL mux implemented on Renesas
+	  RZ/V2H SoCs.
+
 endmenu
 
 endif # MULTIPLEXER
diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
index 6e9fa47daf56..3bd9b3846835 100644
--- a/drivers/mux/Makefile
+++ b/drivers/mux/Makefile
@@ -8,9 +8,11 @@ mux-adg792a-objs		:= adg792a.o
 mux-adgs1408-objs		:= adgs1408.o
 mux-gpio-objs			:= gpio.o
 mux-mmio-objs			:= mmio.o
+mux-rzv2h-usb-vbenctl-objs	:= rzv2h-usb-vbenctl.o
 
 obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
 obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
 obj-$(CONFIG_MUX_ADGS1408)	+= mux-adgs1408.o
 obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
 obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
+obj-$(CONFIG_MUX_RZV2H_USB_VBENCTL)	+= mux-rzv2h-usb-vbenctl.o
diff --git a/drivers/mux/rzv2h-usb-vbenctl.c b/drivers/mux/rzv2h-usb-vbenctl.c
new file mode 100644
index 000000000000..79197fddbf74
--- /dev/null
+++ b/drivers/mux/rzv2h-usb-vbenctl.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2H(P) USB VBENCTL VBUS_SEL mux driver
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/mux/driver.h>
+#include <linux/regmap.h>
+
+#define RZV2H_VBENCTL		0xf0c
+
+struct mux_rzv2h_usb_vbenctl_priv {
+	struct regmap_field *field;
+};
+
+static int mux_rzv2h_usb_vbenctl_set(struct mux_control *mux, int state)
+{
+	struct mux_rzv2h_usb_vbenctl_priv *priv = mux_chip_priv(mux->chip);
+
+	return regmap_field_write(priv->field, state);
+}
+
+static const struct mux_control_ops mux_rzv2h_usb_vbenctl_ops = {
+	.set = mux_rzv2h_usb_vbenctl_set,
+};
+
+static int mux_rzv2h_usb_vbenctl_probe(struct auxiliary_device *adev,
+				       const struct auxiliary_device_id *id)
+{
+	struct mux_rzv2h_usb_vbenctl_priv *priv;
+	struct device *dev = &adev->dev;
+	struct mux_chip *mux_chip;
+	struct regmap *regmap;
+	struct reg_field reg_field = {
+		.reg = RZV2H_VBENCTL,
+		.lsb = 0,
+		.msb = 0,
+	};
+	int ret;
+
+	regmap = dev_get_regmap(adev->dev.parent, NULL);
+	if (!regmap)
+		return -ENODEV;
+
+	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*priv));
+	if (IS_ERR(mux_chip))
+		return PTR_ERR(mux_chip);
+
+	priv = mux_chip_priv(mux_chip);
+
+	priv->field = devm_regmap_field_alloc(dev, regmap, reg_field);
+	if (IS_ERR(priv->field))
+		return PTR_ERR(priv->field);
+
+	mux_chip->ops = &mux_rzv2h_usb_vbenctl_ops;
+	mux_chip->mux[0].states = 2;
+	mux_chip->mux[0].idle_state = MUX_IDLE_AS_IS;
+
+	ret = devm_mux_chip_register(dev, mux_chip);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to register mux chip\n");
+
+	return 0;
+}
+
+static const struct auxiliary_device_id mux_rzv2h_usb_vbenctl_ids[] = {
+	{ .name = "rzv2h_usb2phy_reset.vbenctl" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, mux_rzv2h_usb_vbenctl_ids);
+
+static struct auxiliary_driver mux_rzv2h_usb_vbenctl_driver = {
+	.name		= "vbenctl",
+	.probe		= mux_rzv2h_usb_vbenctl_probe,
+	.id_table	= mux_rzv2h_usb_vbenctl_ids,
+};
+module_auxiliary_driver(mux_rzv2h_usb_vbenctl_driver);
+
+MODULE_DESCRIPTION("RZ/V2H USB VBENCTL VBUS_SEL mux driver");
+MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
+MODULE_LICENSE("GPL");
-- 
2.43.0


