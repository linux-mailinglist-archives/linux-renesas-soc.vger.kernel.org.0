Return-Path: <linux-renesas-soc+bounces-25999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B62EBCD6405
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3436E3019BFA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1068A331A40;
	Mon, 22 Dec 2025 13:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hgD7yPW7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011042.outbound.protection.outlook.com [40.107.74.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28EE332913;
	Mon, 22 Dec 2025 13:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766411154; cv=fail; b=j6cBiqByg5BcOmiKSY1d0QMBct1Da4diDACdTRT/MgtHZQHJ3zEtQG3SviE8NTV6lYJKVwiY2/E62yrDoAPd0ex9HVA83PdpVIxT+Q4v8ocpjA7qjxRgbUbQ73qJ/KZSN+Kxu2L328S6esg1vQ6ZrcwNgjc6/iqFY8z1EHHZzEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766411154; c=relaxed/simple;
	bh=lubH7uXL/PWRg5WVP5EkQ+mPi8hwwXSG8rIHr8gATa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cK64zUTov6Sggc87jeGqF9xAB18zjkk0Xjf+AWlz+lS0crRUkvicpQXFwX220A0akI5tab5Ea7/eBTWaLWaiFalg+iK1jNzFgUqXK0pTq2KOu2GVWmQQcFkBBr/BBRbkpn18fNyL3FCO80OaKBJLQkwwsjt4+7RFq51AFnI+8Pw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hgD7yPW7; arc=fail smtp.client-ip=40.107.74.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qsbe/KcvFN2UMbl5CiJhCeRBXdBKT04P2QdeVhqmqButehcYyczTzyTKlbzpRu7SM1ULYJO0TGurPR7NnJA2aeMn9RVqGAWqn6jE8vROjFZFURgF6+Q5ODwHXXGxvAatnh1Z8CYrAJK9jS4q75wiB0ehd5W9i4b4Zzs1WjZrfsG8P/bO9eknVTOwe0+dGFwbJcSmpqZG7ncyPqabqCoPTPzaYpD6Z5LrcYKO4TiJ/cgv2x9nEazxDE1R4WNH6j27GPcqjsq7nhXFyzxLO10+MgvZSMbpTXSmX1ZndUxiX8atx6NB6UUzVB9r3a0MDcW8JNzr73IQ/GwTl0THpjjGdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyiY08NN/mhR7QYUQbY8niCaXcs7BvFZJwErhFfAMrs=;
 b=BjCukdVsmy8k2Fp4YBp72Jp0ho5vMoHYfqkuz5jTprcLkxJXA/OHVfwy6+UIQ4+R2vW8hZHWq96Xsvxeu040Gb3PVJvB9f1qlqD1305DmPIFEKZBeKtZ1gj5V8GDlYdqF4fSESsOLyLW4WpsCc6/8cPr7CP1fLRmqlwN8XZQ/6ppUaHKy2BxANLBko89gOqIxfYc3251pZ12twAeeUoukY6ZkB2HSo0LEbjyyJORc7+rmCcsRhUSuteMYlSCv8o03T0JN9xKsWRq1lnsmzrrRamnWCywfqnLvuQpSclcDTgqJtJszsx6bgrdlt083UPbNcZbNEjDHQUy9cggwWAfQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AyiY08NN/mhR7QYUQbY8niCaXcs7BvFZJwErhFfAMrs=;
 b=hgD7yPW7UCM4P1XUc/ACFfnWqdgScftr6q5GPhBlQ9SRpRnWZmot8OCPiqEJaGedsIRk6S4Bzfwt+DBPLXccakgEDOHjsyQatJ2EJZw9u9oK65ed+t/910E5Ab122404kV5ZExMRa1cxE50s7h72UnGqYG8xZwlY6CvA3qMYRH4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB14304.jpnprd01.prod.outlook.com (2603:1096:604:362::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.10; Mon, 22 Dec
 2025 13:45:47 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9456.008; Mon, 22 Dec 2025
 13:45:46 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Georgi Djakov <djakov@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v6 11/14] phy: renesas: rcar-gen3-usb2: Use devm_pm_runtime_enable()
Date: Mon, 22 Dec 2025 14:43:45 +0100
Message-ID: <ca028d41f84227efeccb0cbdff22fbf16e5cf6ab.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0324.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB14304:EE_
X-MS-Office365-Filtering-Correlation-Id: da82612f-43f1-4ba5-9c51-08de416068e1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wvJsxb+Xr1DXwA2tREuGNb6JcUrsFDrcYV9k6+jREMkNpX9szpQCoNabHb1E?=
 =?us-ascii?Q?1uz71PKmaoDjzFGiKdJqfwUSZRHKOaXh64NH2FjAhsWG9lgUd4hmG+I5FnGX?=
 =?us-ascii?Q?dtrxPWehRDrMoOvegbD1TLf/886cABODA/ApkBD173wONCgq0QbNhmc0bCO+?=
 =?us-ascii?Q?Eqx1emsaQ1zex9Sn/S2zfAQ0WK10sKtrEDaSrxS9qQTujjqCo962Q9Ui6Dkr?=
 =?us-ascii?Q?WXcqdbRZ6BQUNGYKCkwKqkn6T4QAFgPl0riLPJFEfMYMRBTeITdsra0WTDp/?=
 =?us-ascii?Q?2YwfghK42NA1i4v3uSF6U9qiZAZFyvjkzDCzZCRgY3lNDrdnCAKZ7cZXT15m?=
 =?us-ascii?Q?2wwws23+k0xi13nrPtA4jH+P7AwHvVFYUQHB/iUGqTDsH1Q70buUdFIius2U?=
 =?us-ascii?Q?8h9P4x2OVh3V8ta6J5zH39raaVAhGDX75gyPwlp5QXFiko7IuP7NkXkZ8xFf?=
 =?us-ascii?Q?8mP9BZZowJm9M9w95/Q/4RB3lWucdC3DJ8iGvbd4uBAGq1Pe0jzIpUDbc6Ct?=
 =?us-ascii?Q?2JbpYZtWgtCaEvorAOzdDXN0t+IlXdAIbm2i0il5FzjrRnh2y8h2G8YH2uUI?=
 =?us-ascii?Q?gK9wq24VsuY2SKdnA/qd6zWo8avfULp4I8oO33QXjJjh+6us0eh7CvYBdoYX?=
 =?us-ascii?Q?abb2okY4YlVPQmZAuFhQohEW3kLXt7IKP2WM6xx/hDtMkvPP4C2hGwx/CFn6?=
 =?us-ascii?Q?SdJZZ/XoL6St6f2DIsj9DsWG3W2XodBBo5uAARvIom5/3VKcSECRYunYo3dg?=
 =?us-ascii?Q?lASLuU8c23x35RW0D4RA4hk95ZzL6yMFmZBSnbjdPB5nHKsWWCtjAIPsa6bp?=
 =?us-ascii?Q?JG88DI+dvL7eMDwgnSgR+7JskGgGXK+UIKTdxyC9HSmOAPh7WkxdDTT5JsbB?=
 =?us-ascii?Q?P1wqjo5Tls+v7TAAzWZQ7RtomPTEcH40gfSLQVa2IQ8TX8BbRLReVVBLCV4I?=
 =?us-ascii?Q?QH9PksGJZp8SUALPRH2QFOtI9VXkAT/E+bczZPeoIWHCt9vz3GjAQnNGjNhz?=
 =?us-ascii?Q?SZTb2ffNGAU9IMdLFppLRtfberxWdV1jep87YrvX2dhl+6W1mGotoc3rKbkF?=
 =?us-ascii?Q?tJ73tc9N3lnrOQKHaBtrO35YBAYGI809Bkodm/kKQNEuQ65UgqledUeZNKDi?=
 =?us-ascii?Q?eYctTwYCpyi4yjRFFCiysuSwwGkUcncVrEnB2cLreFdWi2uw1MWSNFr/9/4L?=
 =?us-ascii?Q?b212esiBHIB7Kf+v0qD6aBvaWse1qDDSfbwyaWS65DMg4V8/jklLz8cuirHS?=
 =?us-ascii?Q?x4ataiYgCaaaQbxafM7xp7t5sh1TtGCTESqTMw2wLYd3IBWL+2NKyVLynDmZ?=
 =?us-ascii?Q?br/kqdhUw0frdXSWvr2Ru6BucZgBhOnZoEGYqOgVi/mNmFzblLNAUo01cnCw?=
 =?us-ascii?Q?iGVZSiuruRhhzak62/HKytVGrQrlZUiLoCl6Iss3UljTlipsHn6sAt5G+m0n?=
 =?us-ascii?Q?3FNZ47JmQN0Jbx4gr5IEwFfIqwDvFIzCRB6AY8SpwAD7N3M468u4TkBOXL9n?=
 =?us-ascii?Q?i3LwhcWYYTsBDGCioceSarhoBIdpi0yh703d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cRIo6XdyTe0X/WXVE1XegkzBT0UVJK9zBfYKWeAhx4Y9a/CTI2OpE8gbiU4s?=
 =?us-ascii?Q?AVjA1LzN0+nLPTLLVkSPdYusiQzhJ0F27n52Vfxaw1GW9IkvWdsC8lqZYRPO?=
 =?us-ascii?Q?K/RvRzfHWeZjcONz+d67qLTbzozBd/u6/iGhTLTXLqSUBynBAevdCNumYspJ?=
 =?us-ascii?Q?IBQTY2ClcEYkLVeEWKUv8hmGRA1uXHGgY7aSkU8Gylo0KKRg34MP9luPgTeF?=
 =?us-ascii?Q?rWTEbT93RBss6ueVJZTSoEmyprazxy9EnLAMxNk3sAR0iTlOEATACaQq2p6K?=
 =?us-ascii?Q?9V4h1S+HqmizMvYWFN6KLe0+tP8+JLkRdGPFX4wQpi2lO94K9AdunQySxOrG?=
 =?us-ascii?Q?n1exBX5g/YPXNVoH9sOMrump0EyrXon6JaQDQOufN4+fmqy5ObX0xNArALK8?=
 =?us-ascii?Q?fVxJ3DuH1XEuD7ynvzwNDcANkAr3ur/Hm4Evnd2jDThJolOAFPPgvZ24tUCZ?=
 =?us-ascii?Q?W4J4S7Bm2WMwD2aM2XP0m5eGKKWcbUZYupAxtErHXeXC8qR6LsW+0ywz5NhI?=
 =?us-ascii?Q?oDeD1LbecYabjTopFqiJbdq7fDWv5NPnlT/lRpktsHLIqoycj2WV2UFgDstU?=
 =?us-ascii?Q?fxmnvt6RrCTR9+cSgbhCLvlLwQ1joRovNVgQFSY+QZGAFg9R11jo+W8WL8G8?=
 =?us-ascii?Q?1kDPX0BNImpHcf9F3Sm5t/FeLCYMTQf2T7JAfCCqpLrhv9BaybOE3Bs3PS2y?=
 =?us-ascii?Q?g4KbriXEn7W27J7RUvehCUNKGK6rEmapP/1UmJDGdH36B9TxLOZwHr+og9h3?=
 =?us-ascii?Q?RTJTp6wC3wD2zeI9Hnh+WP/3mRFWUarlSK+Efjb5pFA2a0bhn8O/v5m520/q?=
 =?us-ascii?Q?z8mq2ckYCcsgdYr2tiSGlJvAVKME1/pa/8TwSBZ13JK7thdufZ3Xeqluv26j?=
 =?us-ascii?Q?do5pzXbC/RxjhdVUxcXGvT7kdAc6AjKpxuSaNK/n1ej+7FPGU+yVZr46jZ/c?=
 =?us-ascii?Q?93fplZuRf6UjPQgKAyZk6JlAXdvVQWh+cs3IQiaXazhaoh1+Y1Hl4fmDrKBU?=
 =?us-ascii?Q?F7ezfP7+WybWDHNY13E4X8YAz6aYuIwzDbYj0S0t45RG4E4l2y0URvl26Hk3?=
 =?us-ascii?Q?FAlnkkbUZVVYR2olgL6az8IDiaAlFCAGnBm/a81UqENihGhEYpHoNgYsBvU9?=
 =?us-ascii?Q?iJnGA58d8XAwmucjNEMMwWTKd+B4zwZPdF3emBZ5X6Jr0NKxb1YpkboZNmo8?=
 =?us-ascii?Q?J8MOddbYSZO2QKhRviWgyMSaUjk0RdQGHENoLEytRuEWBbcszl485/QttZJl?=
 =?us-ascii?Q?mpj2Fu9DYOvxFs758rAQXxHIZ3JiZmezDWKo1pRrkbCVMyBr5bHYIiTz1U3W?=
 =?us-ascii?Q?5fU2rIomFNEvJPPoSVyD979zeTBg1Q41UOPT6jowaiuPPY7EDwyp3imT5HZX?=
 =?us-ascii?Q?hq+n1fOE4Fg8pxfsXwwbI5KVECvO8O2MCGlPBbMuyNp8q+hceiM5ZXdT+Gwz?=
 =?us-ascii?Q?B3a6IXbHzyTyZYoMeq9+2cLVhcAttXlr7kh6AytuKR7CuvR66f2xAw5uDEKj?=
 =?us-ascii?Q?qsYsx6dH5io/eikT+5vHMFGqSwUVgk/AGNG4hYp+Kjeq+y3FDsuwx20Qnz8n?=
 =?us-ascii?Q?FCpnVTEIGOPXN3lnGIPKniEwF5739tEE8Od3t333XLk39jkCordYgmxAV6yD?=
 =?us-ascii?Q?RR3nN6zUKWT5pQApK9ZHuYsqDJ5NBubGDxASPFRfGsq3HGjTHA+GYCgIMXgp?=
 =?us-ascii?Q?6SzCXKrULcDxAyJYl9gnT5Qv8zqI/NdQd5kvRdqUESXPeXppQ974LDDNyZm/?=
 =?us-ascii?Q?UAsHc8n/TaVSf14Btt4kLWrY74Im9oH4ZYB2AnoosoQlpJH7y9b8?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da82612f-43f1-4ba5-9c51-08de416068e1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 13:45:46.8898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1UHvmNEXIQa9u87G1w+bBlSq7EA/p2Te9jZivFE7s8hNQzwc920QV2PrUJ9aeoEUHAgcSqvbnkCiuWgXGcQ6+j2zMDH3MnlYoCveIr0E6Q1jPDXTHHjNyx2zaP7xxspx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14304

Replace pm_runtime_enable() with devm_pm_runtime_enable() to ensure proper
cleanup if the probe fails. This change enhances driver reliability by
avoiding resource leaks, as the devm-managed version automatically handles
disabling at probe failure or device removal.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - No changes

v4->v5:
 - No changes

v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - No changes

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 53 ++++++++++--------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 4c7a46f1f16b..94a4521d7187 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -862,30 +862,29 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
 	 * And then, phy-core will manage runtime pm for this device.
 	 */
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable pm_runtime\n");
 
 	channel->phy_data = of_device_get_match_data(dev);
-	if (!channel->phy_data) {
-		ret = -EINVAL;
-		goto error;
-	}
+	if (!channel->phy_data)
+		return -EINVAL;
 
 	platform_set_drvdata(pdev, channel);
 	channel->dev = dev;
 
 	ret = rcar_gen3_phy_usb2_init_bus(channel);
 	if (ret)
-		goto error;
+		return ret;
 
 	spin_lock_init(&channel->lock);
 	for (i = 0; i < NUM_OF_PHYS; i++) {
 		channel->rphys[i].phy = devm_phy_create(dev, NULL,
 							channel->phy_data->phy_usb2_ops);
-		if (IS_ERR(channel->rphys[i].phy)) {
-			dev_err(dev, "Failed to create USB2 PHY\n");
-			ret = PTR_ERR(channel->rphys[i].phy);
-			goto error;
-		}
+		if (IS_ERR(channel->rphys[i].phy))
+			return dev_err_probe(dev, PTR_ERR(channel->rphys[i].phy),
+					     "Failed to create USB2 PHY\n");
+
 		channel->rphys[i].ch = channel;
 		channel->rphys[i].int_enable_bits = rcar_gen3_int_enable[i];
 		phy_set_drvdata(channel->rphys[i].phy, &channel->rphys[i]);
@@ -896,44 +895,36 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	else
 		channel->vbus = devm_regulator_get_optional(dev, "vbus");
 	if (IS_ERR(channel->vbus)) {
-		if (PTR_ERR(channel->vbus) == -EPROBE_DEFER) {
-			ret = PTR_ERR(channel->vbus);
-			goto error;
-		}
+		if (PTR_ERR(channel->vbus) == -EPROBE_DEFER)
+			return PTR_ERR(channel->vbus);
+
 		channel->vbus = NULL;
 	}
 
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq < 0 && irq != -ENXIO) {
-		ret = irq;
-		goto error;
+		return irq;
 	} else if (irq > 0) {
 		INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
 		ret = devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq,
 				       IRQF_SHARED, dev_name(dev), channel);
-		if (ret < 0) {
-			dev_err(dev, "Failed to request irq (%d)\n", irq);
-			goto error;
-		}
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "Failed to request irq (%d)\n",
+					     irq);
 	}
 
 	provider = devm_of_phy_provider_register(dev, rcar_gen3_phy_usb2_xlate);
 	if (IS_ERR(provider)) {
-		dev_err(dev, "Failed to register PHY provider\n");
-		ret = PTR_ERR(provider);
-		goto error;
+		return dev_err_probe(dev, PTR_ERR(provider),
+				     "Failed to register PHY provider\n");
 	} else if (channel->is_otg_channel) {
 		ret = device_create_file(dev, &dev_attr_role);
 		if (ret < 0)
-			goto error;
+			return ret;
 	}
 
 	return 0;
-
-error:
-	pm_runtime_disable(dev);
-
-	return ret;
 }
 
 static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
@@ -942,8 +933,6 @@ static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
 
 	if (channel->is_otg_channel)
 		device_remove_file(&pdev->dev, &dev_attr_role);
-
-	pm_runtime_disable(&pdev->dev);
 }
 
 static int rcar_gen3_phy_usb2_suspend(struct device *dev)
-- 
2.43.0


