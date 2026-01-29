Return-Path: <linux-renesas-soc+bounces-27623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGOfNJaRe2nOGAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:57:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A6DB28AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80F7F3089453
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 16:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC1C346A05;
	Thu, 29 Jan 2026 16:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="A4uOq4/Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010040.outbound.protection.outlook.com [52.101.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A17346A13;
	Thu, 29 Jan 2026 16:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769705630; cv=fail; b=JxGdIExFIC/PhO4OP8zoi1F/2Nl3I5q7z0DIUJMjagMbOXVrVQSjCVYgtdFsVcLwMBinrpTtCYSz1o9eZkAXyTq+kXCFwACQtLgwwprMXjhDv7mxsoDxpzEuPKeoa/dbaT4jp5vxRzaT8cCQKKaQEqbqbSFm1Q4raKoznSbwCjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769705630; c=relaxed/simple;
	bh=OJ/znJGtMbvTtlEYxYU1sBGJ/He6EK+fRux1sKX0e/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=toN4zFEl1Zc6goxzbmrrXhTys2Lq9QMTBSI49clQak09neJkl8UvctotfQxJxf9Dbeq0h6U0/E+LyxS3kEV3dcSjVba469Wf3rnGVfcNyiZpkOG/3yPWaDw/XD7bAYEwH+TtbWt8UpST4n3I66hgHN4U5vhu/KTLE9hnHHrdt+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=A4uOq4/Z; arc=fail smtp.client-ip=52.101.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UnlPzseAKN68kh2D5W+K9ZSqPwC8fVY2EYRfXjgEkeeYxjGUTNwX2qjgPxjWMs6EinyjEbR5qahgLKCLPWE0As5uSK+4YvccrtPbTBcZpdpZ5fzIfOc3KPhRVTKKbR+3swHmQjdUrefwRQaBvR7gvS2csl/zI37x4gkORX+rn3nOQwCes4c+3iyRB3BTp3JBJ/0yDhCOL14ZCMJ6cGbWKk57M3C2j6Q+Y63pcoDlLuKDF6JBj5bZYJMq8YSSVpgA6CZurozKBI0eG7eSF3in8ZVjA225k/iAqdyO8+sKkWRjQ3dqJcBygsutjVx+GcsvvlVkI2E/7SrkcNoMT3x9YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34DxwtW5cWgMKtbsS7qsNxTrg5cvsPtHx0zHe1aKtsU=;
 b=ac1qj5BAnjuN5pg2+nRiWN+mnMfcmmiVAZaZrec8eglEwBPaptJHJwuNKmEVZRO2SNcpOAGKpRnvM8Ed93fMuOYP2/G7G1V2E3KgoNKz/tPUkksQDMo66kC9EsrqVcRoMfeZDXEOeEAmlcGBCAx3bf/PX7vqHFu/w9HkDQF9NH3PgDNig4YWBBXu5uUSHPQLw5i+NwGcbj3hR3IwRQpbn40+zBWRUZKP+FB/xlC1IlUTzOiBymbyjYGCaWAT4/E8gRo6UynoAS3sVlWXs70T2sCscysDtVboeP4iWnBy+H5XVk7R+bOuLMuuyS7+irjOmy0ydSlciNuvE4eVxCuTMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34DxwtW5cWgMKtbsS7qsNxTrg5cvsPtHx0zHe1aKtsU=;
 b=A4uOq4/Z+XNS2NvW8MpwMH6noJIbfqUlx3JmJe6QrvrQwG7Nllnjbu35lm/qRpQi7VkpJl10lzX5yoSkPBT+jDhqF6mDG6xUkByDUZDyTrdEiaTDtEUaUzUFKRE0C07r3+amj/ALgH4MNVk48A9VwBW4lg1w1GYA3QeMOJhaHzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB13517.jpnprd01.prod.outlook.com (2603:1096:604:332::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 16:53:46 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Thu, 29 Jan 2026
 16:53:46 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/4] reset: rzv2h-usb2phy: Add support for VBUS mux controller registration
Date: Thu, 29 Jan 2026 17:52:58 +0100
Message-ID: <75f618320237ff62f7c5965568d530a6716bf574.1769704000.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769704000.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769704000.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB13517:EE_
X-MS-Office365-Filtering-Correlation-Id: fed7fa23-2e97-4c8b-d71d-08de5f56f7a0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KeDNx/jKeqWmczn3LOg4+IzPrDQ7cYe3vQK/N+THeJSUIikG1pgVexl2DsSy?=
 =?us-ascii?Q?/nCUgNr3QITHHu0Y+a5sogyW0HkAmUTFkGJH+AxqKP7mYOY1y9j34hPS4Of/?=
 =?us-ascii?Q?ocPm78qi9smbAR2mbzGJPQztS9FIibciqB0tIX+WIJortK8ZdTxXASeTgBjx?=
 =?us-ascii?Q?DL3b99er7QqP+vBr7zKPXnUZe5Gn8Ng2nYQJ93rhBJGDBXM1xiHVqeOJ/emB?=
 =?us-ascii?Q?na4GAxEtJvmCmnH+TdQ9EhbEaHBlsUfvrQlaRuPOiJUUG1+rJ3xUWKXaEvy9?=
 =?us-ascii?Q?fy8TnZM0x2ihrr8/cJQ2wSE9/7EwQE7+BUlAHGG2SmjqDWQzSwTfYHMhpiEc?=
 =?us-ascii?Q?KHSxrlwkzvQa2iIlXotnvkfjFB6Z06Y/ogZJypOLQ5/qt0QaUA1f6LkeizO1?=
 =?us-ascii?Q?D8gjwyMgdW3tga57sCeEbpuCgzQMjUbHWP4z1iRA+mze1CDUB4lyeRgBg/54?=
 =?us-ascii?Q?+gzEiXhR2ask+OW9DtmqJK9a6ZMx3BAerWALie2ap9ChrLojEPWQAzEKQ09U?=
 =?us-ascii?Q?wZa7S8XAgHU6MpSBQPvoeWW3k15ToopvMDBz8xv01P/OpegqZ3RBqUSX1uww?=
 =?us-ascii?Q?xi90VGl3CjhqGOgJ4zZMJKT8W+gm8X4+QHVC5j4kYZOWGlVZWSf7YOXVG3qa?=
 =?us-ascii?Q?kAbtLQi7hz0nOiuO+CIESmN+6afViOup6EWMZrO8yCINVkLTVOB6d8832BtG?=
 =?us-ascii?Q?0BQM4hTSDb/A9i6NMtb90Wv3pT7AL7BDinQM5GMF5wLBpJqUIQS15/JDDiC2?=
 =?us-ascii?Q?+pDzz8CHQ/A2laPA5bgLAVPvWzlpkJQXw6tbVwNKZTvb6pR6/aZr2oWxEkOO?=
 =?us-ascii?Q?EY+UfJQ/p9iHHj/aFSjXmtEVBzjTOt1AhOYA10zOaRzkrhceYWnwdjhAM6e/?=
 =?us-ascii?Q?N6e9aqYy8l50fHr0m66dxZLzltUp8sEnW5UMAWym3suGRck2ULLbNNVnYNdq?=
 =?us-ascii?Q?yNw2A91/qq+UFhT6c/N0b9u0ESqin0tS5Mcplgm1QI0lfc5DZz4emm6euMjA?=
 =?us-ascii?Q?KffG6xzycxIlCSzQtQFbv/U61rh1Vtdr4ovuf4VwpMj8+rlaDXXtXmlwdW3f?=
 =?us-ascii?Q?7iDGhcJ0C0CsbHJq/pxFGzwkRlzbTljvGSdP/ggRxEE2iLPwr2pna5ohcjdl?=
 =?us-ascii?Q?nSjh/1lyap1SJIUxfuHOo8RuDq1SqFcsOFIZZLb3wR3ey7q3iRo6GDiJKYvU?=
 =?us-ascii?Q?g2i4Q1RpY3y25fSm05JLO+rtBT0ae3yJPSPOxk5Ec5E84i0uC9O9u6ceQ8tc?=
 =?us-ascii?Q?fusRURLN1zbNd/UZlubIFLJDJLMr9EKmViTDldCDS5QB9qv81bmMq5d0XZwD?=
 =?us-ascii?Q?QenQtL7baZKILQ+X4BkO2FAKSXQjfUz0H0IyoN31hjMrStBpSCY27r1FHwyT?=
 =?us-ascii?Q?TaAJkcrsZkUWoNtAM9VDijuLGq2yk9k73cxrPswuLdvQbtZiE3Z/tSNLVOPq?=
 =?us-ascii?Q?1W7sg8kVysNo0+pmS2HnUzPiIV/T2MDj7OFojyMM3X2YamFKni0vnNUVOFnZ?=
 =?us-ascii?Q?SHvDQO2G8oLU/Mvqq6h2mkYpDcOc5z9VartCm4lgYFUsEnJVqgnI6J2PZome?=
 =?us-ascii?Q?x5CwK+8BmM0Otw0xFF3t7OhMeOPpTZTWwYweXfOa7hgesC8GVVZK26ZkMJ3D?=
 =?us-ascii?Q?3O4ZFulTGUdnQLjqCqsGL6g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w/bnQB7P1yZECz1Yo/5snk99W1m7HWuu147f6FgLTll/gSO5n+Njx5Xjgyha?=
 =?us-ascii?Q?PN6KNd3ahfveyJeECbu3sShVos7uGDxmJSs0MqaT+RSKO6xqHY/5leYI0JAO?=
 =?us-ascii?Q?+JqE1xms6ph1isCvEuMkxVMhmgG7a3uQza1o3ZuDJt9mI/Asjxvo0GfOleP8?=
 =?us-ascii?Q?9kLIv/UflwPOIxOURk6KzGKoYrPV7XMBuOhnpwDOSP2gGPcPdhk68ZRM7bIq?=
 =?us-ascii?Q?lJnhETinf8hlVHW36Exwhs82JswUSBXx8X8/OuW50Bm286JBdWhVT4ohAd5H?=
 =?us-ascii?Q?Mc4JGGDPh9ck+ZQYQ1KVlfu1vjj3eA5uQCyjm6PaQZlXx/51yD7cO5xZGhub?=
 =?us-ascii?Q?RAtB6FvbwFf5X8hHAJxMp2kFCQ968FqRYFndeDk7D28QJjnHml1LVqDoelXg?=
 =?us-ascii?Q?36Z3+PcHY97qULxBeb9mlf7tNzFrS/4Fn15KyQSoSX25K8dHOvBn+Mt7OqxK?=
 =?us-ascii?Q?NSwew876uAG21FhkthtJ2FDef70jb8MUA8EjUw1GSD12cg8moigWzqPEP8cW?=
 =?us-ascii?Q?YNtCeZ+zAIOTb5U9brWp7+F0GmpGaXtjoFoUTIjpp2+oOp0sZ8leqPGCG8gc?=
 =?us-ascii?Q?S4IbvqVsZRxGOVo+97EJBXB4OeAQE0xAMS2fS8K6NJ9gn+RNSQ9ZCn8h7+jJ?=
 =?us-ascii?Q?Thp1YNxOl3OkTrufsygOlhTUBGpPE1ZyC1BKS020gcatmRYifQBPlD38P5PH?=
 =?us-ascii?Q?VbgVUHvYwCMx9OhY9IglRo0/bqjcLNC1sR/OFbs8pKCFRIOuBlEj46tGHb0w?=
 =?us-ascii?Q?pxo+wUVP447KqIGqzeeywz5fSPFHIf7Vr2ukG3v3FQQWg1MkprvJgkKlTmmn?=
 =?us-ascii?Q?R6STz9lT5ZVwt1/4/3X2hZXpl7Om5C7Vn8zxKYNsgx1w3Bh61qah55u/+P06?=
 =?us-ascii?Q?YdQ7a4RyEcBaWOnCH/96ch5L5fao1STGIa+xXFkb+AYAvVp4+cctIMnqOdaw?=
 =?us-ascii?Q?/OUxS4xuFcs7V4aV78lkaNpPSOk/lCCjgpHZniZao+xoN+9cSt5GYEZb3m7S?=
 =?us-ascii?Q?Cp044kI3M+0oMaoqtyEpfDZUnH5msXRBQ1NIq+EZEibPqyEh3H81W5U1hAZm?=
 =?us-ascii?Q?ErICJSvLNKeTILDA6dMIKYcXJbk791i26mhe3xysvyf8D4xrSF9UvWgCM4vu?=
 =?us-ascii?Q?rLTbOYDDvpZSJ2F//QhbZwUTyGK7aAth9/6cE/CapI58GuEE7PVm8GU9jHmh?=
 =?us-ascii?Q?bfOe/6Ip+U1delVxsHTg+1+lNZdW1i4L3xSA6jUYuhy+W6Z2MF64+t/pJWpF?=
 =?us-ascii?Q?mmZtQ3crJ26g8OSCwqn9j/xeDS0kou0GE2xcaVRPKaXaDzPB/OzQCKtqr3mI?=
 =?us-ascii?Q?os4lK0DDMXXYihixqc3PFQmmO2FXi2QZYyzm4x8cP41WYXNfYVGcv/ILCPoR?=
 =?us-ascii?Q?4R+oi65IKToKCOxp8ugHr6uuDDFbU8xKjB0KQ14tNHuB43I/vRoKj/PkOQOF?=
 =?us-ascii?Q?IfN8L3SlHPzOPPrZIpkXdQfLTiTTqYb/zoasHZ4fv9XusTlDzM+RmW2Cvyfw?=
 =?us-ascii?Q?hX/TnT+Hy5D1CH+RrW1Xhcp3jAyXi6gemx/H4pVWyPmmmgrbTuozvcb14YP5?=
 =?us-ascii?Q?xTnjrDCiI0ZXYI/BbYLzebv0Dl/owxE4CB+bZBleYN0Qg1myNW1mPZZLmZPB?=
 =?us-ascii?Q?kGXvLhGV+53WSKT1RIPcDpolKalO+pYfF5tpaeO4YzrnCfiqV8vVSz77ezRK?=
 =?us-ascii?Q?6m9UYh8yaezmsnxH2gEIqaDxjOVUTlbu9EnKWZmOqCkzsT5JjvsnNxNw8gOU?=
 =?us-ascii?Q?/dQyao2xHM3Uj/LS+5I7r5tHM8v05A1NXuSOQEhLTow4j3J5NgW3?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fed7fa23-2e97-4c8b-d71d-08de5f56f7a0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:53:46.0339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hdq9lxmO6JRIyEyaHy0D0D2o/QIQjLqzYao1wdFl7eGgdlL521W1CFAsUqByBNO5BL+e4gBYo5Vf6Mue9W2rgLMww0BoEnZbDt2+WYBY7lR8Yx7j45bVx7QCbRcM3aeD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13517
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27623-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,pengutronix.de,kernel.org,glider.be,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 34A6DB28AF
X-Rspamd-Action: no action

The RZ/V2H USB2 PHY requires control of the VBUS selection line
(VBENCTL) through a mux controller described in the device tree as
"mux-controller". This change adds support for registering the
rzv2h-usb-vbenctl auxiliary driver during probe.

This enables proper management of USB2.0 VBUS source selection on
platforms using the RZ/V2H SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v6->v7:
 - No changes

v5->v6:
 - No changes

v4->v5:
 - Update mux_name to "vbenctl" to match the driver name.
 - Updated commit message.

v3->v4:
 - No changes.

v2->v3:
 - Use __devm_auxiliary_device_create() to create the auxiliary device.

v1->v2:
 - New patch

 drivers/reset/Kconfig               |  1 +
 drivers/reset/reset-rzv2h-usb2phy.c | 44 +++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 7ce151f6a7e4..0b656a56462d 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -257,6 +257,7 @@ config RESET_RZG2L_USBPHY_CTRL
 config RESET_RZV2H_USB2PHY
 	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY Reset driver"
 	depends on ARCH_RENESAS || COMPILE_TEST
+	select AUXILIARY_BUS
 	help
 	  Support for USB2PHY Port reset Control found on the RZ/V2H(P) SoC
 	  (and similar SoCs).
diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index 5bdd39274612..15447a4f091f 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -5,8 +5,10 @@
  * Copyright (C) 2025 Renesas Electronics Corporation
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/cleanup.h>
 #include <linux/delay.h>
+#include <linux/idr.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -14,6 +16,9 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
+#include <linux/reset/reset_rzv2h_usb2phy.h>
+
+static DEFINE_IDA(auxiliary_ids);
 
 struct rzv2h_usb2phy_regval {
 	u16 reg;
@@ -104,6 +109,41 @@ static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
+static void rzv2h_usb2phy_reset_ida_free(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	ida_free(&auxiliary_ids, adev->id);
+}
+
+static int rzv2h_usb2phy_reset_mux_register(struct device *dev,
+					    void __iomem *base,
+					    const char *mux_name)
+{
+	struct reset_rzv2h_usb2phy_adev *rdev;
+	struct auxiliary_device *adev;
+	int id;
+
+	rdev = devm_kzalloc(dev, sizeof(*rdev), GFP_KERNEL);
+	if (!rdev)
+		return -ENOMEM;
+
+	rdev->base = base;
+
+	id = ida_alloc(&auxiliary_ids, GFP_KERNEL);
+	if (id < 0)
+		return id;
+
+	adev = __devm_auxiliary_device_create(dev, dev->driver->name,
+					      mux_name, rdev, id);
+	if (!adev) {
+		ida_free(&auxiliary_ids, id);
+		return -ENOMEM;
+	}
+
+	return devm_add_action_or_reset(dev, rzv2h_usb2phy_reset_ida_free, adev);
+}
+
 static void rzv2h_usb2phy_reset_pm_runtime_put(void *data)
 {
 	pm_runtime_put(data);
@@ -162,6 +202,10 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	if (error)
 		return dev_err_probe(dev, error, "could not register reset controller\n");
 
+	error = rzv2h_usb2phy_reset_mux_register(dev, priv->base, "vbenctl");
+	if (error)
+		return dev_err_probe(dev, error, "could not register aux mux\n");
+
 	return 0;
 }
 
-- 
2.43.0


