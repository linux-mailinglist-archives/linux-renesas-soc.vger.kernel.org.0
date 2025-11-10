Return-Path: <linux-renesas-soc+bounces-24394-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 661A4C46855
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 769291887637
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 12:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE8F3128CE;
	Mon, 10 Nov 2025 12:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mJm17wLX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010023.outbound.protection.outlook.com [52.101.228.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958FC3128B9;
	Mon, 10 Nov 2025 12:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776642; cv=fail; b=NIJxDYZi+KKsOLCAPkg+xrTGVjA1P8GxkjSgorRWQhV/NVYWaUk94shpWgeOD8X0Bbmwbi0L1CvmzQ7YNpmG/PNFQq/y1BTCsSJsC7NkhrZ6T3OcJGYyvQB+9i/anijTWyeLj9ENjO9z5Rn2zWmVmQu67H2X32rcNOU9PFZYzGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776642; c=relaxed/simple;
	bh=nHiRyeFMuSZNvbrfgEvPHz5TpTDNn9a2GzJrxWDbua4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SpM2t+HcrjcObOp9TQEZe6eRY1U7Jbt6m+XtT2fHRlrAjP+Pik48Ar17Pwybdmd9YK0ANwAc6GPv11iVmywCDhGO/4CqvcDyayX4w5udUBrPL73wnnkodELKtcjEiZCB/b0BL0mnswaXEa/uly+HbW8ohd+BIOxCaf0rD3keFbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mJm17wLX; arc=fail smtp.client-ip=52.101.228.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iozgQfUQuHY/s2KCsIX5vgh8cHred7t8lwd7nPZQiB8mdwXInqZi0GSkGMxlTi6xAcxxL0H/QN4w8UIS5hWnZZpdMmLg40cKuHjOR7lsP7z6wUpKQh3e8pHJ1romQi7YZUMTlIRJmkSIMDQ4JGqw5Zj/kjOTNUxHyDzp5IByK4Je1yD3a46q5quyLGdiOqtFB4BOOWDyW4pTtxg6Un7iPoC0Ge02KpYQmVKtAsp63rdxWB86M7G3Xt51RXiY5EvqFX7n9rrlDRiLYHdU+WdNaCbwnJxkhq8i1q1AZT2kDmCqzjdx1YuEJtDU9htEbCII2qQxBprPoiSAQ7tqjKpi6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/g0yZ4yK+jgBs1e6/LNGmJltLeAa7CqaDMU4PyOhbUM=;
 b=W0MiFn7dssvm0RjJe/24+pvzcun3+s+2pzgz/PT5boBcZoFYP3lC8YAGa32V6retgaVjaYD2Z7hPqGKIFLhLGY6omVumy69QK4jyqVYANvs2NIE8XCtI2+0sBjHsG432spUKfoyc98XuiicVvISFmRU6VyyvoRylKWFUOUWe3LQxG2da+8I6vvnlUi9Y8YMPR3ruEK7mOkvsJHEKgfGqtcl67NNVW78RfEHgEYZfVOW2eE0xFSnzYZm3KJgvGTCLpXIis1Xg009DwsPR4yGDPEKWKcmF4ENj9eKnPSM6FbtRl56T7GaEQuJhYLZcyD+WJGjXlNFnRMU7v73Rn+oYLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/g0yZ4yK+jgBs1e6/LNGmJltLeAa7CqaDMU4PyOhbUM=;
 b=mJm17wLXyBG7hGUdOb336ghjOnm5eiWu1qeCz+ELJpB+nuRNXs2KVoLaeMO7LMjUvahZl0qv3fHHZzfxlHjW4Eoc8K6QyFpAiqnscmneNOV8ss9viUJnwvAX6dTuCKy6W45/t7N3XziZ36kmxowwmZMs7JvY2ebzSBZZEhPGO2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11558.jpnprd01.prod.outlook.com (2603:1096:400:37e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.14; Mon, 10 Nov
 2025 12:10:38 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9320.013; Mon, 10 Nov 2025
 12:10:38 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 14/21] arm64: dts: renesas: r9a09g057: Add USB2.0 VBUS_SEL mux-controller support
Date: Mon, 10 Nov 2025 13:08:14 +0100
Message-ID: <87cbbf6fe755b28978fe4c1775bdaf1f475083c4.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR2P264CA0176.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::15)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB11558:EE_
X-MS-Office365-Filtering-Correlation-Id: c665ee58-8b24-428f-93ba-08de20522909
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xSNzdGRzfpDQBBd2aEg2xpDuZHfSRmiIsZTdXnvIkkiwWF8w6rEnZv4sHoUZ?=
 =?us-ascii?Q?gjiv3hVg8sDGNzhbg88UdDUdGLAg+kib9jGR8BXEzsLQT9rrAivwb7Ue3Q3p?=
 =?us-ascii?Q?BD4pA6YPBaMRV28sJQ7jZZYYBcCa61SzCgXSrgF6zLRm4BidNdAb+rimD7aJ?=
 =?us-ascii?Q?uBVEQsPjQbt6gDcYeK7+DDf7s6slbVaUCkdzFhTrXvI7l4HqOYGsdI+uOoBc?=
 =?us-ascii?Q?BHeQqgk+fBLXbxo4mtZ/bUhL79xNQOcsw1w+COQ7l3COXNlHtj3k2/Qnvsa8?=
 =?us-ascii?Q?aNYuW4WCGYR70f1DOtlJiE7RoKYxsn9cHGKe2OlEoR3vAsGRPwk9NCb4Vsqy?=
 =?us-ascii?Q?ULnqnWxevJz3bjbAUTUR5ZWL5PZDpvTRbEBjT9HHGRM+1QTmY6FTCaQQyJel?=
 =?us-ascii?Q?1vET3wCRI8uMqbQEFYHyFHvsE7tqGOGc+oKreHVVbFw/wekPm9ShjnfGUI+a?=
 =?us-ascii?Q?OVOfFdWObj3dKya8m2FJ4EVNLTAbBEDmdNV6IfKqtN47ekdxhglV9m0CryX9?=
 =?us-ascii?Q?PPzFk8RQQE8rinL0J8+gzcJM2XBd7wJlXndu1rqPU7n0q2Fq7dh08+tWxyYn?=
 =?us-ascii?Q?YIa+ACFqPy50GyOwb9FihOqYUrKk4jdJ5d83y4Bp/9kkkl7FuRLwhoGqpDrN?=
 =?us-ascii?Q?3C7sX60ngEDH+uM/2/Mr+NJdXnJ9gTGEBTfaRRi3Ic6xxVN8HbOoq05M+O1y?=
 =?us-ascii?Q?5YUcUTf+Tpd8FT+OZ4sehUUtLen9ynpZ7uOtuMYrGqEqDYRU/m7XYNt+x8Jc?=
 =?us-ascii?Q?h33Bq+1do5PD55o8GoP9F7SRoNem6kH/KPnvDqW1hgUyMV4J27IreAK34UMR?=
 =?us-ascii?Q?qcp42LLXlLjhwgAekPPKTDph/pJYf8TmeMLWQD3inb16NjDtqKmBAJ9uPi3l?=
 =?us-ascii?Q?21h96bKev7bUTVZ/Zm1azUK3QwyDV2BjSA4THDpMsXvZQU09P5H0QXDpQKMD?=
 =?us-ascii?Q?Fn9QqN5kc1PqZfliSiqRr/n2TAWkxvv/Zms52XYB1us9Wuiahwo8b8m6SELe?=
 =?us-ascii?Q?75vxa6ZdP6G+CXukf5FeTzDNBdyKqOlMZVTjrfgRNVPKgG+8g7CsPAOgs4Ci?=
 =?us-ascii?Q?XTRGRCi0/WuYs64DAmWWRTyduONGbPCGmqiSVosJitTJsJhPi/FqlJECr3JT?=
 =?us-ascii?Q?plqcfkBXIVGbH360eqLljgTrG48JrxW0Lervtc0e09RrceU4Chc0jbC23ZQE?=
 =?us-ascii?Q?luRPQOKxsEP0evO/a2HM5RuYiFjh5jrEr85W02jBwvWooJbPDKIk9w0xAL/u?=
 =?us-ascii?Q?V+MIKT7m11Qo15m4YPUmFkUJPhRFHTB2yv5GBWkEA7KCCiGiSm9RGBruew2i?=
 =?us-ascii?Q?CgMu51/vqeAYuWuGNSfNd9Dscmbz4+KISMOy9oRa9EWqMkxkbirs5OQbW/E0?=
 =?us-ascii?Q?cQGyj4soF81nxMCesleOThhURGYQP87+iFyi2xipxvSPuJfubXLNlSholvZX?=
 =?us-ascii?Q?qODMoH1X3IVWyqh1gfAnlTOBu9+JxtqGGtJTX2tJFsETTdK58FbHSeUUlV6e?=
 =?us-ascii?Q?mhXb5dv479YmpJfBooBC0swHQ60a2nemMPnd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U+rfnilC/lCr75IM3C6sRSggmV5zsOOnu+Ybe/gbCWp3AAbz+MAv9Kgbgp6e?=
 =?us-ascii?Q?4bnrnzrq+OVb6FigMyS2bO/FJ2Z35mJrT2s2cHhf1EgYpxmDXkobvj4kOoiZ?=
 =?us-ascii?Q?ySt1xa0L7hIQtTxDXgheJAtyy0W5sDE5Nk78JkMQnMTUDYNqbR6YLqz5VsFY?=
 =?us-ascii?Q?20OC4o/ndKo+NBEsHjzdOAhGgzm5OXa00ceG3ULpygynsuYINgkzaRLg6aQr?=
 =?us-ascii?Q?+bLoajpTe7GYKvfUdeHNWd8bm8dTWpe4BN12glmUrOOsx6veQKz9GKXNPpdQ?=
 =?us-ascii?Q?Ge10AAn+khh6nGgzIw4Klq2UpVn7/lvoZElawDrrKucb2dB02zA0nOlqWvKO?=
 =?us-ascii?Q?SLH4X54+oehawWDY9JFQcTf0z8luqNrx/nqfEyq2eCZfpck87/lZYpb+fm4O?=
 =?us-ascii?Q?LJK20SJr7A2SHG4e+to5J7btEvNNTcg0T3RXHY9vKahrzgGhhShhhQmU1BIp?=
 =?us-ascii?Q?39i1l1RsaAOBjuQiyYdQ40fclCi/cu7ArhTKNCiwXpHbvWiNaBs/cyytLAkb?=
 =?us-ascii?Q?8RMZvWYYpABkPEMUsxYaP2B5iVU22ZJ1aJfzyahRZm514NICRGnIqSwV1EBD?=
 =?us-ascii?Q?wlykk+YnvMXDKy1bnh4GI5xLhCmIAOrfOO7sTbZY74ibqHEM1o09fL91jrDt?=
 =?us-ascii?Q?xpCL4tizTfo7ayEG5LPvkYZaAbBiQ+xS7afKc5oZIovpo5E3UjFuZiJLl++N?=
 =?us-ascii?Q?gauTLL5i2XQqvpxWNvbwnkhLixrWS3UJHLw4Gy3aw0H9MiSr6Pb2xPGQbbkV?=
 =?us-ascii?Q?HS5LLYV/1FbhmqOkVWqTbhPo8djwgpVNktDaHvp3qgauZxpFIaeK3SLAtD+z?=
 =?us-ascii?Q?rKZvN0XEJ2GNjOOBKC6e1qOT5+MbNQ4uMzhMLGIO9frzCy7GAf2PdVM98PA3?=
 =?us-ascii?Q?Jq2rp62Uz3T70NJnBviiTxQ87dfeGEfQWbsoKWdyNfkFF0S+GQls+IAQf+fv?=
 =?us-ascii?Q?dVs2ef/GMOi+0YSgOquvVbFQaRWBP28qtyhy+xO+IUhPtlofIvyKriNtEg+h?=
 =?us-ascii?Q?jk4Pgj/hp7hqKXhbhYdGKKuYwZjeWddn+xMBfT2i78TjBQYQa0PAxWxKWKsS?=
 =?us-ascii?Q?gmP7ZjmOs/dNdNGGUzn/dhScf0Qbk2oZC6uBj6OPrEuQnru/mSx37AJeCD+Y?=
 =?us-ascii?Q?NjzSn8vX1FkPxopipuTJdqeWjBYY/2Wbctf40nmjLi3q7U+YtJ3oHK5n6Fft?=
 =?us-ascii?Q?RCE9kiUJVriNVJzJCI66tCRWQkn0buvUGZqIk2BeyQwvpMjHPfitA7XBgSF8?=
 =?us-ascii?Q?QkLO536XlbuNT26mO1lLQDgSrO92/59BJ+TGUrF5J0PXsag1aCD3vLLt0Fim?=
 =?us-ascii?Q?fpgsEYzM5+xpNAZLMUvJvhivfedDiaky2GZJcHf8uGwMnQN5BhSFPBfHUkV3?=
 =?us-ascii?Q?unS2PZt/CVHHAAdnqn2HA+JeTvigjLa/BSKkP5Ly/qXWOv9ZVcMGIzpkzRyq?=
 =?us-ascii?Q?aGxQhrUn7mplWv+gBJZg730Io5F596EEsMp7zaxb9wnfmH6UTf2z6W9IqSN6?=
 =?us-ascii?Q?fgp9GSJzXwtntXYbnSlYgJS1mQY52A0WU5VKbvGHx5HcbOmys1ntRZIHoO2B?=
 =?us-ascii?Q?ki+sl3foQcvSiy8BbkjSf0dQdYTa479pJePcr53NWMVH7z17sGPUHs4TwIWQ?=
 =?us-ascii?Q?1FlT3M6i1cDazZTOGtgsDh4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c665ee58-8b24-428f-93ba-08de20522909
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 12:10:38.4405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0GVcE3dPGLVGB28k3WhKqTXkFYJzG4LGxEIRm+Y0RbQYltf1+YznkhZlIlZ+Xb6IFH2512dhx7bBhvrV7PfiIx2l3EAEkkNbyPwQjO5XfMLoxFp/fAiiasfU7GGtK7yx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11558

Enable control of USB2.0 VBUSEN via the VBUS_SEL bit in the VBENCTL
register. According to the RZ/V2H(P) SoC hardware manual, OTG channels
require VBUS_SEL set, while HOST-only channels require it cleared.

Add the internal mux-controller node to the usb20phyrst and usb21phyrst
reset nodes.

Set the required mux-states in usb2_phy0 (OTG: state 1) and usb2_phy1
(HOST: state 0) nodes.

This enables proper VBUSEN management for OTG and HOST-only USB2.0
channels.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - Manipulate the mux controller as an internal node, and update
   commit body accordingly.

v1->v2:
 - New patch

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 40b15f1db930..6c6ef5967bc0 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -989,6 +989,7 @@ usb2_phy0: usb-phy@15800200 {
 			resets = <&usb20phyrst>;
 			#phy-cells = <1>;
 			power-domains = <&cpg>;
+			mux-states = <&usb20phyrst_mux 1>;
 			status = "disabled";
 		};
 
@@ -1002,6 +1003,7 @@ usb2_phy1: usb-phy@15810200 {
 			resets = <&usb21phyrst>;
 			#phy-cells = <1>;
 			power-domains = <&cpg>;
+			mux-states = <&usb21phyrst_mux 0>;
 			status = "disabled";
 		};
 
@@ -1030,6 +1032,10 @@ usb20phyrst: usb20phy-reset@15830000 {
 			power-domains = <&cpg>;
 			#reset-cells = <0>;
 			status = "disabled";
+
+			usb20phyrst_mux: mux-controller {
+				#mux-state-cells = <1>;
+			};
 		};
 
 		usb21phyrst: usb21phy-reset@15840000 {
@@ -1040,6 +1046,10 @@ usb21phyrst: usb21phy-reset@15840000 {
 			power-domains = <&cpg>;
 			#reset-cells = <0>;
 			status = "disabled";
+
+			usb21phyrst_mux: mux-controller {
+				#mux-state-cells = <1>;
+			};
 		};
 
 		sdhi0: mmc@15c00000  {
-- 
2.43.0


