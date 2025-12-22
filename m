Return-Path: <linux-renesas-soc+bounces-25991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DBBCD6394
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:45:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 576FB3055B98
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70387311941;
	Mon, 22 Dec 2025 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="i/77m+27"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011039.outbound.protection.outlook.com [52.101.125.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF22C31A570;
	Mon, 22 Dec 2025 13:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766411088; cv=fail; b=ioRSO/5qn51Rclij/7o9Tpxsp9gpSCwKDdPTQnVXRqBnmymVY7f1hd1E1o1PJBoR2aE+41YizmjF/PS2LBN9POwu9yx708u9UmS10EFGZltk/yTOarxLhsoSE9QrxKbnsC8nAJpIZq5OKu4/NY5fchGFJ+PfHPFxsWwkYFAnkjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766411088; c=relaxed/simple;
	bh=XmhP7hv219/JrVRQzt/wo7GuLstgMoK14faXZHWLPU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gvxqaUDoSVc2SEzQU3lXB2CIcoxm9iAPDcCQ2yyaP52ZRyBxl+77RQhr85n337kt16N6VLiBIz+cuWOhyTvhLolUptiOmHI5DHHky3Kuc+2WumaJ4XaZ3WHj3F7flZHiSttpCSXJILfmRLCdU+aIdjL+d7xvnrsIMLeDplhw9/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=i/77m+27; arc=fail smtp.client-ip=52.101.125.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlAbZkVP0UWWG3g3elPHodYYiAMW7ZSneOcK1ontN2H5tbB855T/zWDpv84ENFW0RbNgQygoicTrfvo8u4xO1ShXwqxDknJb37hc+dusaXTnS5CJMctJv10VNsppE02FeOQbvtsvHLd1zNjF2Dmr3xdibsWGqUqluW40EWcLb+Ovs9WNE7GKDkS2o8AOvKD1EzyTkKks5D49q17jgl/LMbTP6bqKs8ONttV8GkOeeiyMrkO0dnDNdH+ocmlU75EngLq2bYf7WFpu9KPMddH9M2jSiHbRwSbHIhYq8b6aAdd/l+vQAN5ZACmcMhWXtMLLD/HJHbZ1c0a6WFOKvBdjag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9zL/LhK2KHwgagJVicVKCQsP9n5A1H7ojsFSiAHrg0=;
 b=vuW7Hcs4YaJi3vrwhhCaxG0XgtqHb8KD2BlBbk7ynMgaDK9++BzI11UrnfWaBaRsmxF6ubAZia2OZNSl5plaoNCi26f9LR67rqZgQQ98h2i2uBDILRcaUOXmAGSOsgPjSC8WJNCM3bGZjqxeI1yG0O5aCXotOO1ybhn8CS5hu1PMTh27BRomcNM4t84KSoqITqVSt9/MlfjFOi8wddMvYThXRfH+5OAWjPWIx5sTOiqDsHbskgfi779d27myHrOWHP98zSbthIuXSzrgPWV3jNX4GnaJFBWi9EytbgvEE04Qi+daUjd/xrcTOrPsyHAIfSUvlBxg9aW9KMrgDuDP7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9zL/LhK2KHwgagJVicVKCQsP9n5A1H7ojsFSiAHrg0=;
 b=i/77m+27P1On/ga+jp89C5WWxVSPfTttGbEUBxt/LEjvU2W9HBHR/6iqLABAqryOZIPqtGdAt4gby2Ichkwz1Vz4O4SPKqIJInboiiRXS0OpYVRx9hpf/CYV8xAv6GxfU8MKw81eBRdwig+b95AK5YJyPM/4sWNzU0OChLRnyYQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB14304.jpnprd01.prod.outlook.com (2603:1096:604:362::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.10; Mon, 22 Dec
 2025 13:44:43 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9456.008; Mon, 22 Dec 2025
 13:44:43 +0000
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
	linux-phy@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 03/14] dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells' property
Date: Mon, 22 Dec 2025 14:43:37 +0100
Message-ID: <d37670a6c5ace61ce9e9cbf79100960de44e7551.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 319fd1b1-f969-46f2-7b21-08de41604342
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8Y80+EzUBhbv/WGifUixH4ggWGNeg/d9+XI+eC+JPuOG/6RgC8tVFt18NLME?=
 =?us-ascii?Q?WtCNkgoDAj0+GY7U4ygUXo31fY+v08o+8Jgp2J0E3PmmhOQP2vsPzATS/UsK?=
 =?us-ascii?Q?N82c2DTWESA7lHHuMtz6+Nrtl9ERvmNilkJKo9q3HgCLRwpkGIg/T0sKTtDD?=
 =?us-ascii?Q?yus5Qu5q0gcy0xtQCs4VCAwyWfcV9PZHAuNThP/SpvHlhM0/7YCMh7EMEIQk?=
 =?us-ascii?Q?QxMeasgMTSdrFzCHO2USWkDjFro9LKTf7sSFsTFOjeB/EOlXVQn208ban0RU?=
 =?us-ascii?Q?nziItBpRCP1VoeSnEDoj/J8YDZ+poWZOTMsuxEbvMsA4DVL2VIW56hXTbmqu?=
 =?us-ascii?Q?n/ikRJtU35bRVP8HkqE0m4LwGvazWWNsdhqMIlV6A6mfWN7fXRGkz04AyFsE?=
 =?us-ascii?Q?/gknfMPI9l9aU7IwZ9HBZsvy6tL/wwb8+ncGHLy9ziCZKJCviPQP7j+VWBbl?=
 =?us-ascii?Q?qUrxGfirrkqmB0z677Gkrkb0x6UFqenRN2uHzP/+TawmOMIimRDZ+L4hkZVY?=
 =?us-ascii?Q?Tfk9sBJ2N9/1XOzvvJyt4hiuTzfpVlYd+kQkwSvry4K4af+rJJrV4JXNfsiI?=
 =?us-ascii?Q?l8QQgQfEic0q95RhKytsf3k+MNHru2BaSgByPQZlXqJXOv97F2k8OEUY6Tfo?=
 =?us-ascii?Q?38LmZKeOnm5LNrOFG+mAqsbpNwbfo3ukRtFktvvACcGj3ZcAacIJPfTaE9eK?=
 =?us-ascii?Q?OTEnx0jjgBHXiFYaqoCuBHuEyNXZSlx5mpb4OF4H4Xb5wo6wSFvWyqRySxj9?=
 =?us-ascii?Q?Vl3RwkVAWNzhJCAAGYkQAvz8jY2zlRkLhYtwrjhsoE/TPh4QLF7h10z3t21s?=
 =?us-ascii?Q?0XqM2yDPMc8wEZ6arKKk6+TLyjIGL+yEzSS4gmVp4PeGWn12K30dtuW5cO2p?=
 =?us-ascii?Q?rztQZXkjZZaOnf1BS4XFZw1X6QZIaaCeATyMtwa7wYqhqD6t1tC4J31Cp47B?=
 =?us-ascii?Q?0EdDwqArB4W0PEVDCx0J0OithtxVDJkKOdBbNqN5uPfmyl9M0UtHwlDcm238?=
 =?us-ascii?Q?BYYMKFXrlIFOV1OIsE4Muln/L0RbAdAVeG4kZlb08r9lj0Hp5Lrqw2G1vX1x?=
 =?us-ascii?Q?/U32woVpBRVx9PRkzvNXnIU0E1DkYAvEy3yAKkplwQhWPaiITKSfNG1K/FHK?=
 =?us-ascii?Q?wDiS53YgpBu+b/8bO//qkEcq5xBJrdxdwER88FIerFTOCHalKvvpCO+c49TU?=
 =?us-ascii?Q?80LA/AeALNwleGO9Y6dOn6JpyQ4ys6D62Ch7u4dUKhxs70gVeZ4NHX9cNlip?=
 =?us-ascii?Q?AKqkdlhtslkyBjxYWFB0TXWwO5jP0FLE87u4nDcKf6H4RG7OunWt3QwHLKra?=
 =?us-ascii?Q?0hl55xUx9fb1watHIGFu2uRB6MHOojBZTVS0SV2qAgBFlY2T9APaeyJh23AO?=
 =?us-ascii?Q?DvdPPznT8q9u5ZIDqWJfgy014wGDNvNFmJr2/0dnEC9sZpGXcIEzwjd2Z09l?=
 =?us-ascii?Q?QuWgeaUP4WEjLAg9FUjXE8b3jJiFw7P/y0IKAROT/QZ5Lbh0qEikXgG7GeE8?=
 =?us-ascii?Q?uk18Lv/SFXhcrCsIJa5eEMmtlfytX9M23wz2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vvPfBC6+LtPL2rwVf/SFt5ErlmRJyTnAloY8xHijaBnNWGC8RA9wgZLcqFt9?=
 =?us-ascii?Q?vFesBj0fbrFtxM1QGi+szJNY2DFmue/z9RJLyWtkHMaRvllJamUuGXIkL3Vd?=
 =?us-ascii?Q?gwyY4qNi1bwtgQpe+5UJdtX+c6TeMWxYtvfttyE8Z1Wu5QrclaLHJe6ugjbZ?=
 =?us-ascii?Q?3xCGhAiwzzNvwFIJpI/iLQg2bStIksugkcV0SEQZ8Ua/dL5hQP1IoiRjm1EU?=
 =?us-ascii?Q?oV5mqdT23AoxJ68xYAtcuhL0uqjc7rGW2yIAXB3Ta+qAQp7b74tR06v2sIqy?=
 =?us-ascii?Q?y4yEyLy4OpEqUd92lGjdzTw88GsUJQeBGaZSS3caPB/wom769VeMulVR7Yxw?=
 =?us-ascii?Q?hiM6fez1w5yjYus4Qb+YFhdDXT9IFu9bQ02IXJwcSCAKa1NR+AnxNzbfBPIK?=
 =?us-ascii?Q?0a1DEJ9LeJcClFrnfaWW9ICFJo9iRfr9Qjfz/d+uFa3xlArF0ItgIvf7X/9q?=
 =?us-ascii?Q?ERGp9suIcVu6RGpMqbqYrBjwPQVI8YklzFzLb+U2dmfBadXc2/Dx1DPRI4+u?=
 =?us-ascii?Q?sUXxTwGvk+Bqul14i9TqAnQbRRr4garEv6zeGy9loa63Ma9eeNQfBe2B1cyk?=
 =?us-ascii?Q?Adp/QqdR/QvOtPKvspua5l4ISsRgMQxqylTeSnzOXUFyISuMBTEWBsAX8kvp?=
 =?us-ascii?Q?djWIZLW9Oe/QQyMbsEVrlrPVzVJtnPhPvPfeaNuHgaiVGPMoXsdTWcayeldd?=
 =?us-ascii?Q?YntplaJrn0VdyZT02+7714EOSENO0A5daLDaHZ7SQO4enhu0MJvlipD/6OJj?=
 =?us-ascii?Q?80w6XwQGad0aZZ/zz8TTq8jnpvXFMyqHSZ33vzeaFvnd/xBeR8M6tslOPuga?=
 =?us-ascii?Q?EjC1p/7c0n/hJscLkWDagUNN8c38g2jTzZb+isAAHfmD2xd8bIQ2p35fYoAT?=
 =?us-ascii?Q?QX6cAlfZ68+r7lEP/u8GPvQaAElk2suvVxtQK1lleIfi9oFOM9JwDUVV60nY?=
 =?us-ascii?Q?UJC1Q17y9lTRxGtqNRgPb0YA8bkS2rAfjelifw8isD9AX9qG86POjomyBXPi?=
 =?us-ascii?Q?8UM+GRlTqluM1o7VHVSixDLcPXFZMfOjgFN4BIMFPKmPsp4H57dt8KImtTqO?=
 =?us-ascii?Q?YCpdH7Mv38MB5lGWP8l+H2S8oW+nAJ77KuRnarBjYS/BvnJ5GPRuF0GOK9h6?=
 =?us-ascii?Q?XX1CPw5CCZLpT7dViT+Sgxs2NSqT87kDRy8/h3Pt3SZF+/1iRHZkiFsSznNj?=
 =?us-ascii?Q?8IDpzw8lf7tAON2BAXYtQW0Rsi18DDTp2rAPKVC8quLrRsLwHd/GKbennOsZ?=
 =?us-ascii?Q?Xk+JQPgTUHyxZoZTHbhcvRrEVR3pn8W4z3aMF+WRGjsdNFnTUpr/pUR4RmT1?=
 =?us-ascii?Q?f0tldbIe4aP0cinxQl/nnO9RcfAxdissTLzMbD5Jh0DV/RMdl0wemYOWFvja?=
 =?us-ascii?Q?kDX6bBHjYIueFMJWE/DHX94wiPbvH1MQQxbEtFNpbhkni2/9tDct/nU9oZcl?=
 =?us-ascii?Q?FbdVKgXjvKbML7KAhn/kV8eVG0yxYjoegVqk3kLVJfyMeXkF+HVche5FjCom?=
 =?us-ascii?Q?ghSWH37TtYMwtXWNeSTFxl8nNgz7MI7PvGX99COUXZdMQgO6uu9ut99FRaft?=
 =?us-ascii?Q?8jxsoT+mdgvv80BTljNjLa4Kw6qgZHbfkD6gVRxTtAv8BJ/jQbEezvw/phGw?=
 =?us-ascii?Q?r/pNUGKAJrcRTaMUg8zwklCN435SWj0YiV3xYeHeYwTiIVPnIhsaBXksQ+QS?=
 =?us-ascii?Q?ytUuLpZAGJ7X+y9Jgy54hEmtQQyzYbcn2bqFDi2hgtxbAbDig4EZQ+5yd+jT?=
 =?us-ascii?Q?uJhcEzk8QYXgrGKuoO1SE6Gs6y/Mwk7Y0YaFTvWG23Z8OuOLooyX?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 319fd1b1-f969-46f2-7b21-08de41604342
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 13:44:43.7711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fYWYXL1hy8veZK/7FFTBnXJgvi5oH4e+kX/Znf34nd/kwqyEFOFi3DaQ3BIcJOZTTX9tTWpOQ0k7IFuclIyk0E7oxbGSpWwA9uqeDIBhzBoa8VTBvKDu/XWKnAkY0XP2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14304

Add the '#mux-state-cells' property to support describing the USB VBUS_SEL
multiplexer as a mux-controller in the Renesas RZ/V2H(P) USB2PHY binding.

The mux-controller cannot be integrated into the parent USB2PHY node
because the VBUS source selector is part of a separate hardware block,
not the USB2PHY block itself.

This is required to properly configure USB PHY power selection on
RZ/V2H(P) and RZ/G3E SoCs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - Collected KKrzysztof tag

v4->v5:
 - No changes

v3->v4:
 - Switch back to v2 implementation.
 - Improve commit body.

v2->v3:
 - Manipulate mux-controller as an internal node.
 - Improved commit body.

v1->v2:
 - New patch

 .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
index c1b800a10b53..7ed0980b9ee1 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
@@ -37,6 +37,9 @@ properties:
   '#reset-cells':
     const: 0
 
+  '#mux-state-cells':
+    const: 1
+
 required:
   - compatible
   - reg
@@ -44,6 +47,7 @@ required:
   - resets
   - power-domains
   - '#reset-cells'
+  - '#mux-state-cells'
 
 additionalProperties: false
 
@@ -58,4 +62,5 @@ examples:
         resets = <&cpg 0xaf>;
         power-domains = <&cpg>;
         #reset-cells = <0>;
+        #mux-state-cells = <1>;
     };
-- 
2.43.0


