Return-Path: <linux-renesas-soc+bounces-24383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B2AC467A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9DC424EA41D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 12:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FC530DEB8;
	Mon, 10 Nov 2025 12:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YY3358tc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010035.outbound.protection.outlook.com [52.101.229.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFF830DEC8;
	Mon, 10 Nov 2025 12:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776565; cv=fail; b=R/ncEMUGjtQOuQKIVMhEA7uJ0CelE4zHjXILWnbDFsI/0u8q/+lH1flzIyyTREiTlM2w+bLp0ug3js8F4RbL2gMXFXPEoNaHsXmKKBaens0t+bOdRd/xZFyPuVlljrrWO8tmzOjCkWYAKY8bqHxBZcinEz8Mo1FqMM6N+JHzfC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776565; c=relaxed/simple;
	bh=sOTxHpmsXXQkWlOZ6S6G50uG7s6QFhRplI8I4JeApp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lzfpHqoldjXNk8Y1JvlplPMo8vLbypb5IVROJqZP6mwvc6NeY1WXwObYpja3bzgaVC6qqXdpC8RC5l1WlXiOGLFDEauzGXrHNDEiOMwFOEDRunX6gwsFtQzeWP15zam68vz0GmbAfjxipTITtTNfnzlGxRVFcjodumCuY7L3gV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=YY3358tc; arc=fail smtp.client-ip=52.101.229.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpAAiW14mCM8Ndma/BCkoIxr1vZRlc+oDX1ivRTVcoin5twoIfNA0/K0LGS3Up6RWPciVg2oW5D9rgYHY2oC4ffMx50OFszakDm7ll9TKcn7Y+G5MVD8qID0crhG3AWKLzmYapeqH7UXSYh+xLVu3cldbrTd/+3Zlu7dnI48SQ/vHeoInTVJBKyKtRWYdHPXRQbHZv05alEFc6+fwMIMRhX2DjgahaZ807p2Cwtapddct4Ie5MIgWNC1/sQ34ZCYpsYbEV/9ASqzRVN31dJka9yCnQXT08uI4acSYQVOMqyx1rb8PxenWks9eQhlV6iKJXLId+baWs7XmOaRDQ+e4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cweb2uHkp1JUitLFOH2or8AYh0fMcvfDMMWfB70zdUI=;
 b=K6MPIUYmlE/DDA5lUgWNjH4A9yx8O1btjbKYOiZ4o3eP4DYuS6SxxKjqTTBUDf/wmH7e5LsoHWft9Edt1q5SqPHZfQVctj79t9zNxevoS7OTCRndnL846of1pomX8UXM0I5sOPmQ0ZEPDVSvXNRw+ClCN52hQuFKoVfPn/wBM7+OpAT/0vSVIAAt1DviS3qSjuUI6A4kjlYQTNwRK7oLwDQC9vEh1StIdCspUdEic2Mkl2tl1983CEX/JMJ5GPXba2LY3bDac1zZlY8zc+MkKMEZ7BQoW49if5nRdGlAsMzE+fb+FFabVCNuSwNI7KmYFog9lIc1GTzGQs2os/lO3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cweb2uHkp1JUitLFOH2or8AYh0fMcvfDMMWfB70zdUI=;
 b=YY3358tc0Di3WChvyhS4pmpuusrQyNCqU0c7Q9Lly0OcJoKQhA1bEmCXRlP+06+yXzlVzU6Y2nuz39uhPYW6P4QtLyY5CkBmg6foARCbxBMfee4tui8MHdhJtq4Wrq2RrlSxEWGAn5OOY4w0BJyQTCZr+xwiCH6pU4afurhTWg4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8436.jpnprd01.prod.outlook.com (2603:1096:604:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.14; Mon, 10 Nov
 2025 12:09:19 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9320.013; Mon, 10 Nov 2025
 12:09:19 +0000
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
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 03/21] reset: rzv2h-usb2phy: Keep PHY clock enabled for entire device lifetime
Date: Mon, 10 Nov 2025 13:08:03 +0100
Message-ID: <0a7ae11d4f1a7d0b69cfdeacca024c35dbce0272.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 17e283ae-cede-4639-8006-08de2051f9e4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OOLf3VL41bvAqVnZOMpNIWSMthYancWaQdKUqlGOTRNC5DDkVSqOOoBeA1hM?=
 =?us-ascii?Q?ZoAWuL0d4NByMukjxnbSnA3nCaL6G3WMoD1fq8irJwsaKOxZJJJ1gBSgT7VN?=
 =?us-ascii?Q?L62E1HiKfujTQhcA1Vz6vVJz7x6iiduKlcD4OrTAOCKU81LkiDJU+FYsUJp7?=
 =?us-ascii?Q?LfpwCsswwo+aNtGh7AjoKGeLvlUpYWZ2MMk88S65Px+rXFD+iZgC9AsJVXJ1?=
 =?us-ascii?Q?AkZMbehye4ApWAyTnFJpIhphcj8n4XReL76XWgDS1A8HiTf6UriSzVqEzCrF?=
 =?us-ascii?Q?d8Patsacv5P70w6B/5WDOVGtRscXE0a1aESvczrAVYXIq5PBpSd4OGKuP/z8?=
 =?us-ascii?Q?HeBf9qTN5MtIRzzA6vmiuGnMlx4YYy+uJv7OfIFcRIRGaeQQHFotJjq807mQ?=
 =?us-ascii?Q?SjyG91z34GqWYVmYGl1yudCBsmK5I4WddEyTw5eqVTvQfwOzN9tZrN7Yrsd9?=
 =?us-ascii?Q?X0vKsD6N//RkEqARoBtL7kGnbNBylbnwClY+j70ciwQmb7BFjd02koZxmp+U?=
 =?us-ascii?Q?hHD6oXFq3cGeSY34hS3Qv32xEaqua6Q1qlKLFUpIpdLmYqHQs89SrDKZylek?=
 =?us-ascii?Q?6/4Lk79jhw0SIbFjr0RBXBkqxVlnsc5X2dP2tqV8FFrqvfkBmFaYULW984Wx?=
 =?us-ascii?Q?f4+PhAkVQEjxQ/hgdwcsMKcSlKUwP77zTHgdEVonwEV03WbWKvEbm/cHGQan?=
 =?us-ascii?Q?LAk79A0THD5E1jvASncQnQ30RSyxGqAxdpPgk6s/jxae7VsMQpA7cdBgHBCS?=
 =?us-ascii?Q?CyIpymCC/1jCGm31gc4CyeExpxClnqVvcderuUjXi5n8ce9S0gMrdxzMtnvn?=
 =?us-ascii?Q?GmBh69j92r5FLUyPVMPYgwpXOKNUdQUBi5Ix1LpstZNR/65TFu4S1/Z6J3Fb?=
 =?us-ascii?Q?1qWC+3k+f8xqMjP2XngIhnwPxZZd3/1GPvTcQiMEVl9wCc/AMwwhoqBchfQJ?=
 =?us-ascii?Q?JY5+s1z7YX6xAQXszfesf5wiUDp/NIC6IRA5SDqO7Ud0FPjvWyrRoYHa0mNm?=
 =?us-ascii?Q?gJDBzRPvHSqIiU3lEQFQUv/tKQwG+tifGEQ+28fOQKD3R0n06NuuDQLlYPp+?=
 =?us-ascii?Q?UT4D6mSVSW6Ymr9+OxW7OaoJZlmfmejn872iQ6YRh4f9Nz+Ki5BMTEP7Rn6o?=
 =?us-ascii?Q?SxCP/PKkaa+M8pToMw/R1Th5cbGhr8SyDpa5HRgQcnXI+hNXhUOaHH3zJzLc?=
 =?us-ascii?Q?NH5vlMlMJCJ6XwRX1XO2lKaRbgr0Le5AgUAqRry/4CPiBQIF+e+wtCsvdTXK?=
 =?us-ascii?Q?6NdhxuXAQ4pjoupR7I6x4Oo2BnPZiVgLLLRp5p86VH5BMJjUmTifoVaEdmIJ?=
 =?us-ascii?Q?CnwDiMm8b73c0+hzKMtrtvG9mf0HpIKhLGW09Lw5bnTxxv+S3yCLZiu2Q57K?=
 =?us-ascii?Q?c7mcP4bFA/rpvFByBW4T8tJdVMJMqMs+oKIj568JD5GyTl4KzcRv6b4MM5NY?=
 =?us-ascii?Q?WUNB1/ghQcZ1NtHxzdbPCnTKSTqDOHeHIo8aBRHtLXAAJHfuM32hWIcilMsM?=
 =?us-ascii?Q?hv1o/G3C+Id7mE00NXsiOI4ozr4m1Xdn2DXd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jAxl+r6X6yPZnQBZW12hkp6RLWBeuVl4JGTi6xnGAjuv6ucqNf7A1e30lrIR?=
 =?us-ascii?Q?G9Qsfvbpdh4bHGRB5FTAitxv8W6P1IkgWhZxttpRDx/k6Poea/r6Ai2SKUIT?=
 =?us-ascii?Q?P+77MpnpO2/dGmGVaTeoQ+M4Hhd2Ca6e44RGa0CyGWiTYgWSGdl5yW0dznKA?=
 =?us-ascii?Q?ACqxK4obD9tj8cktPlPjXWhFLXJB3Ai055JTJu2FvdVniAFWop4U29fvVe/W?=
 =?us-ascii?Q?CoDLZpDyOP9F6G8OByjZ5e01qsyqUkYi/jFBNG6LLzJUxV/lOao64TlALaoG?=
 =?us-ascii?Q?Q5S5e0nJQ4DqgW+ScUB+HzKfm/fL424f5LIYxJJAbQdomu7R5QQnqU/56iKA?=
 =?us-ascii?Q?S6nMQikeg2Mt1QAzD2Hz5dkjo/alRvwoNte23ezny9cIhMV4tmhBjszCQInl?=
 =?us-ascii?Q?0tgTvA2sBBcRoRjNv+7l96TDYOLzug7W1KFTn0hI+F5zMjcluYEqxmNYNNLG?=
 =?us-ascii?Q?d267JyoYzwTNuoyi4wjOBII2ttoxImSWbynSrpgNeLRa0EwhiPMQjzR0bAqP?=
 =?us-ascii?Q?LngWNpRbnz9TTFiDp4LWDXC5vMOov3uurwx06hPtYjYEsneelf9J6j/pz2lA?=
 =?us-ascii?Q?9VwEbSZNZqU2WuxL/c1UxGKPs+ZjhFt5zKkjtv/CAWVAYbbpCtZ8uxVb5MdU?=
 =?us-ascii?Q?Adv+d/9kio0X3wJ0Dav6UIlJDNhK+TIIkBlmIpNFi1F+GUMx0A3gsA7m2kKH?=
 =?us-ascii?Q?J8wVoU3FuzChauJTcoYzqpMv2cBNwsgq5k/TueQwYFj1hZw8RQfScknzq2hU?=
 =?us-ascii?Q?wN5WjailIE4piLPQ5WAhnOs2d9ov+4LxPP/BRhENP7biAZLsyMWKMx5GAsWv?=
 =?us-ascii?Q?Cly2yO8DfvPCvpa4u4oFQXZzlkOO1+ZmtzLH+q7HMRUfYUD1iJEjznP6WHQq?=
 =?us-ascii?Q?H28f1VCaw4u4YEMpTljFhoiyaYOFW6tSfyZMuQBGvwiW58MF6SxSVlCHfEJN?=
 =?us-ascii?Q?UBVUgpaZoBansz03VgDoygeo4QOhHzYFoWC+Knu3+FG2idz3RNC2yY2adZD3?=
 =?us-ascii?Q?mvWW6W0VjvCqs/xuETlMxlP2LNbS90GAkPR4Q38qJl26xO9U120q0oT+KpPh?=
 =?us-ascii?Q?uqJftli2+lNyuU2IL2UUfoIlIApMZFthzY+uEAusf4rdzvhVlKdxtD2lhkOd?=
 =?us-ascii?Q?MMEjHHcdO0zxA3HOjcH1T7oBo+65j6+DLh+8+vosejXIfd+qpsaloMSaJFxm?=
 =?us-ascii?Q?46Vp/hB4pLpt9L8lVCkYF1ChTspvpBVq/wunPTkbfRZNwhVUP79Mj4cLMiKb?=
 =?us-ascii?Q?95AtrtKS2OOgmJB+zPAvQkqm6kvAGM6h1eckUjtTPEqATp2NsGW8RYNyGnu4?=
 =?us-ascii?Q?6s4pPMchomUXSKxZBFTow3sU89vryQOZRZKCVdmuH6qyOdamUqxtb4Fv0FVa?=
 =?us-ascii?Q?BEaIgWRuNoQdfsCGsILRGHtDdgdErtHq3iIEyLPe7HMc37xI6mIImP/ZqvVj?=
 =?us-ascii?Q?jED4jbDyY4XG6Ja3Q0+8YABJfXEEAaAwCJ//6pYkmUkeBw7Vc87goiuQ5agv?=
 =?us-ascii?Q?BHT0HWi4rDl9Czss+rYQB6O3BEww59ektGEOlDuj2swT17JM+TQ4v/ZqRCkW?=
 =?us-ascii?Q?hyw0ALQnFooA3iaKgCDg8kpo2jixfhizAvPF2Lx6Q9h70d3/P/HEWOKB9Ezj?=
 =?us-ascii?Q?K1gL/6fYjgG2IKN1udPwjrU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e283ae-cede-4639-8006-08de2051f9e4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 12:09:19.4096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +F9yXIRUwNwUV5LEOGQVY+Z7w0EZQ1+MHRD435vNNEn7hWnY0Nym4n1+KM8bt1baOeyornl8mw+KzO/xaQfnqsarI7pXuGVGDeOeBd5gs/Ah7tCBIRFaTU97P2ZhdlLl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8436

The driver was disabling the USB2 PHY clock immediately after register
initialization in probe() and after each reset operation. This left the
PHY unclocked even though it must remain active for USB functionality.

The behavior appeared to work only when another driver
(e.g., USB controller) had already enabled the clock, making operation
unreliable and hardware-dependent. In configurations where this driver
is the sole clock user, USB functionality would fail.

Fix this by:
- Enabling the clock once in probe() via pm_runtime_resume_and_get()
- Removing all pm_runtime_put() calls from assert/deassert/status
- Registering a devm cleanup action to release the clock at removal
- Removed rzv2h_usbphy_assert_helper() and its call in
  rzv2h_usb2phy_reset_probe()

This ensures the PHY clock remains enabled for the entire device lifetime,
preventing instability and aligning with hardware requirements.

Cc: stable@vger.kernel.org
Fixes: e3911d7f865b ("reset: Add USB2PHY port reset driver for Renesas RZ/V2H(P)")
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - Added missing Cc: stable@vger.kernel.org
 - Improved commit body describing the removal of rzv2h_usbphy_assert_helper()
   from rzv2h_usb2phy_reset_probe().

v1->v2:
 - Improve commit body and commit msg
 - Added Fixes tag
 - Dropped unnecessary rzv2h_usbphy_assert_helper() function

 drivers/reset/reset-rzv2h-usb2phy.c | 64 ++++++++---------------------
 1 file changed, 18 insertions(+), 46 deletions(-)

diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index ae643575b067..5bdd39274612 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -49,9 +49,10 @@ static inline struct rzv2h_usb2phy_reset_priv
 	return container_of(rcdev, struct rzv2h_usb2phy_reset_priv, rcdev);
 }
 
-/* This function must be called only after pm_runtime_resume_and_get() has been called */
-static void rzv2h_usbphy_assert_helper(struct rzv2h_usb2phy_reset_priv *priv)
+static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
+				     unsigned long id)
 {
+	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
 	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
 
 	scoped_guard(spinlock, &priv->lock) {
@@ -60,24 +61,6 @@ static void rzv2h_usbphy_assert_helper(struct rzv2h_usb2phy_reset_priv *priv)
 	}
 
 	usleep_range(11, 20);
-}
-
-static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
-				     unsigned long id)
-{
-	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
-	struct device *dev = priv->dev;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		return ret;
-	}
-
-	rzv2h_usbphy_assert_helper(priv);
-
-	pm_runtime_put(dev);
 
 	return 0;
 }
@@ -87,14 +70,6 @@ static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcdev,
 {
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
 	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
-	struct device *dev = priv->dev;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		return ret;
-	}
 
 	scoped_guard(spinlock, &priv->lock) {
 		writel(data->reset_deassert_val, priv->base + data->reset_reg);
@@ -102,8 +77,6 @@ static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcdev,
 		writel(data->reset_release_val, priv->base + data->reset_reg);
 	}
 
-	pm_runtime_put(dev);
-
 	return 0;
 }
 
@@ -111,20 +84,10 @@ static int rzv2h_usbphy_reset_status(struct reset_controller_dev *rcdev,
 				     unsigned long id)
 {
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
-	struct device *dev = priv->dev;
-	int ret;
 	u32 reg;
 
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		return ret;
-	}
-
 	reg = readl(priv->base + priv->data->reset_reg);
 
-	pm_runtime_put(dev);
-
 	return (reg & priv->data->reset_status_bits) == priv->data->reset_status_bits;
 }
 
@@ -141,6 +104,11 @@ static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
+static void rzv2h_usb2phy_reset_pm_runtime_put(void *data)
+{
+	pm_runtime_put(data);
+}
+
 static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 {
 	const struct rzv2h_usb2phy_reset_of_data *data;
@@ -175,14 +143,14 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	if (error)
 		return dev_err_probe(dev, error, "pm_runtime_resume_and_get failed\n");
 
+	error = devm_add_action_or_reset(dev, rzv2h_usb2phy_reset_pm_runtime_put,
+					 dev);
+	if (error)
+		return dev_err_probe(dev, error, "unable to register cleanup action\n");
+
 	for (unsigned int i = 0; i < data->init_val_count; i++)
 		writel(data->init_vals[i].val, priv->base + data->init_vals[i].reg);
 
-	/* keep usb2phy in asserted state */
-	rzv2h_usbphy_assert_helper(priv);
-
-	pm_runtime_put(dev);
-
 	priv->rcdev.ops = &rzv2h_usbphy_reset_ops;
 	priv->rcdev.of_reset_n_cells = 0;
 	priv->rcdev.nr_resets = 1;
@@ -190,7 +158,11 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	priv->rcdev.of_node = dev->of_node;
 	priv->rcdev.dev = dev;
 
-	return devm_reset_controller_register(dev, &priv->rcdev);
+	error = devm_reset_controller_register(dev, &priv->rcdev);
+	if (error)
+		return dev_err_probe(dev, error, "could not register reset controller\n");
+
+	return 0;
 }
 
 /*
-- 
2.43.0


