Return-Path: <linux-renesas-soc+bounces-25261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ED3C8E296
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:58:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C01463AA07E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 11:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A393328E7;
	Thu, 27 Nov 2025 11:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UJbkpwAe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011030.outbound.protection.outlook.com [40.107.74.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50133328F3;
	Thu, 27 Nov 2025 11:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244354; cv=fail; b=Z9tVyp3OcrOleZXplCRpp5cmZ9qj9EB2rBgdxEc/KLAnx2k3saNTaqDY6NZZaUmlvH3ZSQLKbb6QaElwdtazDzkd81d+hOwz4p6sjlBvMHcMmSFUyDJheU8e2aDBfJsArFRxdad0xELbWb5gqP8zUCvSn13mE+wmLVperASKsyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244354; c=relaxed/simple;
	bh=aiHD3bYR/831Tw/uztAoBOZFVZm7MUxOjpXlQpCMNhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ndfS1wkXpFThyo5I9VrZt+lJWe+qp8/+u7QQF0QJDw0H/Q44l1olsTDkVAQZBQNyjGTaMZLR90vfLq8zHttWvQ/TW2Bb4Kg57iZesQq9qxe9+tzv8ODDBCix7diOOB3uWJ/SwJ7KJbDuSitp/B325vcOCOE/I9/J8sWD3adp+3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UJbkpwAe; arc=fail smtp.client-ip=40.107.74.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxEtB/9P7PU7dZE9yWMf/WWSbn+hc52ThHhYqX1myeUUfYmai+D4+ucqcaToTFYgGzuJVS/iI3o/eTWXIfWwkgQQhXEHeSLdPdjsElzz8Fw76w7kmdg/ymAJZTFTrrQIVR5/xPAf4fn5Lrq2+QJP8i1EJxLe1fT7+E1Dl3OSKq4o8i+k7+pU0pA01ahgTkevhj3bBnL5ASKR5zEe6FzMXyoZBJsfQVU72KmuksyxSqgHnIpoq6OVZQHCYTtNxwykj+XTBj5iOqOljR94Y4Ewv2yFfHKV970KiocZCcW0hJQ8NYeu41Uw/WvqFtfiUwevBlHwCLYIo8Vek0620vyaeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qj388G2EnVxEXcnpivjHoxvHJDGHP94q7QxPdSk3opo=;
 b=b8BBBkstgdKCTo6DdSi7A7qeomzEwMNiorpYcGBVbC7xrR2CRRnuW//QTjI491Iu7YiB8mrHA1zXRLQPzMsJGsdH+KUvvQeQ5RV00zlg9PVcdpqCoLHZuHW398yuNzcIeZvFJadmwRBDhzS9+HWwNwFM8dcNVoEFUSAxNnq6LMLQrH732LCf+2Mu6zsqXhKK69hr+lc52blfazcKyMS2BiZy42W+dqnJJy0IlrCYHP21Dt8/vsBzEeoN6w3r79aBj463nqAa1ohiDdDPHj+vXlyopzkNuIYcQaU6As+cCBgAM4jM6+ww94m1Cz6TAOFRIYNIoDNHr11uj7XOgyMROw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qj388G2EnVxEXcnpivjHoxvHJDGHP94q7QxPdSk3opo=;
 b=UJbkpwAeyFyDrazGMsTQCv5l0vhn5/o8PUjXyWY3pSx/w2qBWo/8mYXVW8tnJYwATgAL5bS6Hrhhap0jCZ/hGKvE6MioyS+EpiXvXhPaUmQSK/dL15tCvNBD/FpZk/EfHf1XOqDa+GXFjkM4ie4eQQUNzn5NhrI9GTq0RX/WCrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB15042.jpnprd01.prod.outlook.com (2603:1096:604:38c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 11:52:29 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:52:29 +0000
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
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Mark Brown <broonie@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Georgi Djakov <djakov@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v5 21/22] arm64: dts: renesas: r9a09g047: Add USB2.0 support
Date: Thu, 27 Nov 2025 12:48:48 +0100
Message-ID: <827ffe167a2b41533f403204559250aaf5543034.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::17) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB15042:EE_
X-MS-Office365-Filtering-Correlation-Id: 243b0b07-fc18-4353-999e-08de2dab7112
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MipcJmOxRpmM11Pj1bavdVw+6SwDl02zEKv/asXV2O5DkFHDHckYET1u8eMD?=
 =?us-ascii?Q?UuuuputxSgQ6FuY0dszBa+MZLiJiBDHFQUq7tIylRrWGcAIFxSXRqvjIcOtB?=
 =?us-ascii?Q?oLua3J0DttoItnH9WI+UTxfDZf7M1GiE+rkAr5KX5cCHwYLj9x2wyioNL6Ox?=
 =?us-ascii?Q?fWJ2MdPJqPss3QQEyCZ1yIhD9fGdrVGooglgxPpwGFOK2z52kPMRMiLHmb4s?=
 =?us-ascii?Q?9d8+052Y5XBbMeADHjNa3kkZZvw1CZrKD6HtjuCBwkcq5K67PtX7exwGaVj/?=
 =?us-ascii?Q?6TJ2Apl8Sj11XwNtROn2yBAf0LDs799JFgODPJ9BMicCSc4Oyqh9d/yw9Nnd?=
 =?us-ascii?Q?lG7LFWXHFsdJQBr+PvzBoScbUPVM1CH+w7NPv44lgB3SmO9YFGIMpufGJ4BY?=
 =?us-ascii?Q?PEfeXahshXTyRGd+HBvPstP3uM81QcC4NEvKXtdo9p4OP7ujFRsEj0fnF+qZ?=
 =?us-ascii?Q?KTQfeZcOLvRCCJBgbhLw32W2q662eMFmUjscglJuGdOiBLzHvNVIF0ypi+NE?=
 =?us-ascii?Q?Lkks+bAAG3NDMqR6VM5/WZdR/4P0oGgCvGJ296IXBRiVy7XB6jQNXYvzggfo?=
 =?us-ascii?Q?SUQFe6+Y+LLtNMXtN+XVpbnBwS9mbL3BifbvUo9Uuy3i2STxpbIFlMTtA/Kp?=
 =?us-ascii?Q?VjeVCa0zJGxfNQuCeqL338oMRVWzyxapIcg0gt9VrYN78S++M4vCwIbStTZH?=
 =?us-ascii?Q?Bi2BEDWXsZUwDuhUzg3esujlPI4QTAd3xrALHM4TZqbK+DzDB6UQGqxQs4/A?=
 =?us-ascii?Q?s4mXO+Hw/28eYqDDjukAj0jzkRmaaun0w466eGzXlQw15ZD+T5Vm8Scv/szf?=
 =?us-ascii?Q?hkXvzVjXxlR2TkDM7W5efTly3K0e+vx2JYl2fBuB+gjmHMjdYaEgg3mqT4n6?=
 =?us-ascii?Q?3STnl15PDyeRkkocsdEdqZ4ej85ViVskMLgKbRgMoHXQHVM94o5AEsG0OrHw?=
 =?us-ascii?Q?L3gSZyCtljKOit6YATihNaOJjyg7eAWwAH6DBGB0zGmzI+2Rj49tX7bayd7J?=
 =?us-ascii?Q?6HT7oMNHOE+p9aDvCFtCpdmIm6+o2UDzvNl/RHUuOh1VdFWDY+NDUo1sY+qF?=
 =?us-ascii?Q?yxAVkIsdhEW3oZW/XoMC2KatHRQz98R/tMdsIkgVeoP6k9Goaj3HJ7Fezqsw?=
 =?us-ascii?Q?vFCjVJK19aG0baRuUJN5N/3HrSV/rtAm6uufPMfl+azyFytGUxn5dBFmjjJg?=
 =?us-ascii?Q?gBxQPnkIQUaGn4LJbPFw4TAN5/sqMWLA8htsM5im6Qp5JP3hmw2E+F/1G1N9?=
 =?us-ascii?Q?kTtR+s66wcGBHbqZw0TdzeAmWzGohGomLOMzvSlJHK96O0bN0k/XaonCylrQ?=
 =?us-ascii?Q?qNgICMXzmBwSDHPsUSL0zx0hj84jOLo0t/jH9ypAGPFWEJJp4/DcIZtSl/+z?=
 =?us-ascii?Q?g68c8VwVjXI0+h5WgeZ3KXPybkuQ8/Pz0DBKPlO+VsH0PinIjWQZyhskAC5T?=
 =?us-ascii?Q?A0xSQ869DGp45QAHRd+b6YlCWITQYsPHgyLFkqBnY5H1jQat8NJ5FLSpC5hJ?=
 =?us-ascii?Q?q09ISP8wyMvv7BIaNEc1YSXUZlaeTIPyh90n?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7OsYbMpCaJnjaGd0W8u31DfonBDODKkLupbC5lH1aQmhlgON7sk7i4tDWa7e?=
 =?us-ascii?Q?mOO3kaBQOVdsBTBbgGyenB/MBTCk58AP75g6E4WEH2FZtT3klSmxYL06jPeb?=
 =?us-ascii?Q?dKEG8/7FuqjXZS7Ch7+zNN7tQqzL66iBDJ69LQXOtL+zm1cOT87kCvj4YamJ?=
 =?us-ascii?Q?x98jH+wCFxOTnDDz8Gw7P+fqjcJ9QZypTgsswfyCJXVK4W63W4WQcQForqQR?=
 =?us-ascii?Q?5JKvmTsHVk/7Q8J19fKKEWvvUwzAZJc4AIo1OMAfU5Wd/3iDEif12scmUt2D?=
 =?us-ascii?Q?yffcdfojlHAr8pRyUfPRr2slMOVzgE8PZ58UUYH4/2Ov1G8vexbzNbvlNLek?=
 =?us-ascii?Q?e625iltNDlalWOR+ysnluZNeS+/CtqxxZE0Hb9jW+1nyyr32ac/oFQojf7Fl?=
 =?us-ascii?Q?rZbE3eDuDW0CnUMSAQAUMQ0a9Qz5yQxkdlKRYe5u6D8PoAY4rEdaTZfwiptj?=
 =?us-ascii?Q?RXY00USZ4O4JIY0ZB9lJGTBNNqE8/GayQd+NOnkGjWYdsnfjTWBXrzY4B/+c?=
 =?us-ascii?Q?4D/MagyK+5OVp9tkLkj749LrFQ8IMCGMuAGomg1m2+mCODByqoopXC3v9yhk?=
 =?us-ascii?Q?YzqR67cUoJhV/hVaALNHV8dgHruRdphZoTBV+rJ7aGZKH1sTzn1SyLWhecAs?=
 =?us-ascii?Q?hElbNgL4Sl9MoY7qR63xEoHcRU7tufPsmAbTxfWzrERFtKUWOXPigleo36Ql?=
 =?us-ascii?Q?TwYvwm2LrYzpC4TEXoOQvmmGdV6JbwrcRA285TnqrCINmQREvGdTFykD7I+o?=
 =?us-ascii?Q?k2dAwrJRGkYnNCpsCZqP9TqkWEV94fshHRbmgkxXtlFdpIqTDjXwwO6EYGhw?=
 =?us-ascii?Q?V7PPyguZI2kDZFONxj+nr4h1dSwHaEeYeuezsuwGG98Vxz3gQ2znRfEz2LED?=
 =?us-ascii?Q?C+kudZGaby9rd1vNffEN0jiP755DWqyutAEcvb108wPc0v3aINOEdVEOQFiC?=
 =?us-ascii?Q?915lyD/SXM3k0mZ2QRWhb8WobhZknBhWdlGbZPCpDaEoXuQ7I4/pPqpyd+YF?=
 =?us-ascii?Q?iBEyu5HHw4cm27QABHcBTLyb+tWOatJ6wb/wr5d8pW+OtM0kDmVLJ+f1/Wdr?=
 =?us-ascii?Q?8UBNiK1X2WljdTctjSvj5WSkS8FQPpLmWSHm7kcZ1SPLbmpnr09nKwap0yTd?=
 =?us-ascii?Q?kFup8sYXt/cgWIzHd4tWC3DKWmsGK9U5+8LVjO5SFBOG+dsmeqxaN0d+1yQw?=
 =?us-ascii?Q?Mm+ErcCGVUxjNDTnfHPodEG0Zha8nx0Jy3MV1IrPQZ2TubTTNSAv6Y4OoPe0?=
 =?us-ascii?Q?fe0BxMq1aQm0ljKCQP1Ic8iaNeXXi31tEsbdIvReRzfEzF1FVadGFR2SMvwb?=
 =?us-ascii?Q?sXUHyrCcKNLkEAYwcWOU+Kr3jrlZOzO9BKnOHJaSKzDLFHzIrtjzBlXt4LGN?=
 =?us-ascii?Q?ijMEatLuKBfh0uygnn4GWlWxsZD5omor/hX+Wre/PGnLkephtburLubE9+Sf?=
 =?us-ascii?Q?orW5+UvnzVPjqhp6Mcf+Ia488HN1/7/QzqCMeqq9GWZcByb6zbAjs25+toZz?=
 =?us-ascii?Q?fMB7Spntu9qO/oumcHDxMd7wo+tCUcfOshICeu2ZM/dXofMg3qHoJKftqlEG?=
 =?us-ascii?Q?faVVNW6ZIDa6dXeq2uGHImdTSv55AW9obyKh4x+18gKTx8Z/bUa57P8xZzKr?=
 =?us-ascii?Q?yONeIDZo2CHcjZbe6XhMOQI=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 243b0b07-fc18-4353-999e-08de2dab7112
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:52:29.4127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8PiwHHGm+2evaidwVf0axsX5z2cQ8muVs+4daSF/538zqpINtLDkwYEVQAq4V+xlEbEbpvomSGCHhQomouLM/3ncGXa0HzxuekoztcWJzS5Gu/X2N8TQf7VFVwyS8Dm9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15042

The Renesas RZ/G3E ("R9A09G047") SoC supports 1x channel with OTG/DRD
and 1x channel with host interface.

Add the ECHI, OHCI, USB2.0 PHY and reset control nodes for USB2.0 channels
in R9A09G047 SoC DTSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes

v3->v4:
 - Switch back to v2 implementation for mux controller.

v2->v3:
 - Manipulate the mux controller as an internal node.

v1->v2:
 - No changes

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 125 +++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 7a469de3bb62..90435e5673fb 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -853,6 +853,131 @@ gic: interrupt-controller@14900000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
+		ohci0: usb@15800000 {
+			compatible = "generic-ohci";
+			reg = <0 0x15800000 0 0x100>;
+			interrupts = <GIC_SPI 742 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb6>;
+			resets = <&usb20phyrst>, <&cpg 0xac>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ohci1: usb@15810000 {
+			compatible = "generic-ohci";
+			reg = <0 0x15810000 0 0x100>;
+			interrupts = <GIC_SPI 747 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>, <&cpg CPG_MOD 0xb7>;
+			resets = <&usb21phyrst>, <&cpg 0xad>;
+			phys = <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci0: usb@15800100 {
+			compatible = "generic-ehci";
+			reg = <0 0x15800100 0 0x100>;
+			interrupts = <GIC_SPI 743 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb6>;
+			resets = <&usb20phyrst>, <&cpg 0xac>;
+			phys = <&usb2_phy0 2>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci1: usb@15810100 {
+			compatible = "generic-ehci";
+			reg = <0 0x15810100 0 0x100>;
+			interrupts = <GIC_SPI 748 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>, <&cpg CPG_MOD 0xb7>;
+			resets = <&usb21phyrst>, <&cpg 0xad>;
+			phys = <&usb2_phy1 2>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@15800200 {
+			compatible = "renesas,usb2-phy-r9a09g047",
+				     "renesas,usb2-phy-r9a09g057";
+			reg = <0 0x15800200 0 0x700>;
+			interrupts = <GIC_SPI 745 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>,
+				 <&cpg CPG_CORE R9A09G047_USB2_0_CLK_CORE0>;
+			clock-names = "fck", "usb_x1";
+			resets = <&usb20phyrst>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			mux-states = <&usb20phyrst 1>;
+			status = "disabled";
+
+			usb2_phy0_vbus_otg: vbus-regulator {
+				regulator-name = "USB2PHY0-VBUS-OTG";
+				status = "disabled";
+			};
+		};
+
+		usb2_phy1: usb-phy@15810200 {
+			compatible = "renesas,usb2-phy-r9a09g047",
+				     "renesas,usb2-phy-r9a09g057";
+			reg = <0 0x15810200 0 0x700>;
+			interrupts = <GIC_SPI 750 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>,
+				 <&cpg CPG_CORE R9A09G047_USB2_0_CLK_CORE1>;
+			clock-names = "fck", "usb_x1";
+			resets = <&usb21phyrst>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			mux-states = <&usb21phyrst 0>;
+			status = "disabled";
+		};
+
+		hsusb: usb@15820000 {
+			compatible = "renesas,usbhs-r9a09g047",
+				     "renesas,rzg2l-usbhs";
+			reg = <0 0x15820000 0 0x10000>;
+			interrupts = <GIC_SPI 751 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 753 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 754 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb5>;
+			resets = <&usb20phyrst>, <&cpg 0xae>;
+			phys = <&usb2_phy0 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb20phyrst: reset-controller@15830000 {
+			compatible = "renesas,r9a09g047-usb2phy-reset",
+				     "renesas,r9a09g057-usb2phy-reset";
+			reg = <0 0x15830000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xb6>;
+			resets = <&cpg 0xaf>;
+			power-domains = <&cpg>;
+			#reset-cells = <0>;
+			#mux-state-cells = <1>;
+			status = "disabled";
+		};
+
+		usb21phyrst: reset-controller@15840000 {
+			compatible = "renesas,r9a09g047-usb2phy-reset",
+				     "renesas,r9a09g057-usb2phy-reset";
+			reg = <0 0x15840000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xb7>;
+			resets = <&cpg 0xaf>;
+			power-domains = <&cpg>;
+			#reset-cells = <0>;
+			#mux-state-cells = <1>;
+			status = "disabled";
+		};
+
 		sdhi0: mmc@15c00000  {
 			compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
 			reg = <0x0 0x15c00000 0 0x10000>;
-- 
2.43.0


