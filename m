Return-Path: <linux-renesas-soc+bounces-26346-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CC3CFD3B5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 11:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDA2F30ABEC2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 10:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859203002A5;
	Wed,  7 Jan 2026 10:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="etWr8185"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8D61A256E;
	Wed,  7 Jan 2026 10:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767782093; cv=fail; b=AEs9TqdgRN4tPf30sYGNEhGCq18vKl898wiwVug/s9U1BHMU5950fX+7d2q3g2IabGr8PDotTG+qP4kScQ6XvnbtPU5YzTIfHTNiAcELN/h4DpdLFZ9U1oFeaaJUt9uZ473Db3RM6E0FDAq4dplHNN4wYggJm3EQ0AloDF5p32I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767782093; c=relaxed/simple;
	bh=gYi521Y2ib8r59qiwyoNzwvhoPMxFuRamTelej3LE2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sU0E0pBKIxFoP3pw6hpdH0+mLHuI3mRiU3kxgbJO5QG9lpx2UgFZrErLnUbSDjMfrp0Id847/nYUsQPQQ7xzEMxfOx4vYU1k9NwgQGzN65rYyvgeAE0HiJ6WyPNhPi49v+iWRMECKijGqyEEIJDrtMpp32FDf32W6xQWbCrBk3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=etWr8185; arc=fail smtp.client-ip=52.101.229.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hz9u+b0uplVzzuXI3StG0mjcq3bYOfqQklc9tSd+HS97AbSPTqmyaWNCzMuRkc9Nwkf40/qXQ0rMWxW8dVqS7wFKZWZR9VE3GAC4T+q0uZ5EYDC0nthas0fK4Rl8OJ8eTI76vvIkzLQU3X/nbM9cXa5alyL1cwqKjkjiKImTRZ7+dQ6p6axmERfYMW8bBJCM+0ZtD0gciIRhWMpAe5ipqFmVW4u1oHfjblobAUpWTvAlINAf3+BrBJBlE5h4y9EC/3OkI8mjR67Mou29KMphP97zsJ2BpvLD9w8sTq64bwleTTHlpmjO89dUubJuEWTAHATg6zm+yA4GJHBbJouJGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RT2F1+tmDqxWqccHVmPz5K0W2ecEnES8A2ATbQLdDy4=;
 b=xPF6XSMtawigzssOFHuZuAsKc4DvNymyCMGua+x/UONQDbbtuM4jwCLs+0048tdA9Nd0odafeqHYJyVD/BLjsRJ4ZLYQh19LOelLgTlOCjAhwaFgbfY73zKqO3YIvO/DrOMjPO4LhwawyvFLtoHRJ8ae26N+gzP1BMjvifMj04Ls4Br7BCcjZSaZXccpL2XaB0pgTxKezySNoCktlcVM5ufj+9oGGtb/LVEiLQf9ILqLFIg/QABAuw0/K0wy8DlveIzFNjLBL8mDAVnhudzkpiuLuRgK8jFbYduQmxbYZ18EfvABmfH9XG0gTZXfvggqfe+gzEpMUHUxl8Q88h4nYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RT2F1+tmDqxWqccHVmPz5K0W2ecEnES8A2ATbQLdDy4=;
 b=etWr8185+95S/qRVDsxIbnnKbWrwDh/0ljPs1b6f8p+nc08wl1cPT05dWuzl9jbKtMVsaD7R0R81IMX8xAnS/b9f9w2EPceyloccifinHOsH2TYPNAx83Hp+ezx4z0gTve6N1z/vwbOzIB4tEEUYVo3EqO7BX+P/0r5qe7d1Uu0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB13558.jpnprd01.prod.outlook.com (2603:1096:405:18c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Wed, 7 Jan
 2026 10:34:39 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 10:34:39 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/4] i3c: renesas: Add suspend/resume support
Date: Wed,  7 Jan 2026 11:33:50 +0100
Message-ID: <c469ef89e0156d37746a85bfc314232847d1185a.1767781092.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767781092.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1767781092.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0368.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::15) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB13558:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ecf8fc9-17ab-4bbd-89e7-08de4dd85c5c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B7nu3M9juECMp4q+Auy7+jbbdabTVlCWwnWv2wjOdWqV8tCKrLvR/d4ykLoG?=
 =?us-ascii?Q?/mHrtqTG4UPQwExoQu9Ec81V1XKImeahD1sbAq2/Lgz8rMAPcQbRQBmZy6rW?=
 =?us-ascii?Q?Vfcdlxt2VKmBa2Enh3/Rj7hUVMGHOfXKCdHrKE7XFgIX9YCafUZWQxBBrqtX?=
 =?us-ascii?Q?7Ncx1Z+CSYPs1GCdd+3DfqERXTcCNuEoKBQwb41cjUTBUncoVT/63qE1n1WE?=
 =?us-ascii?Q?Cu+sr5BY72++wW75JjmK0QK7IEFTf6R6jZq6Ni6hl4HByYzh9pElCKpTMNsf?=
 =?us-ascii?Q?ba1gRihg8AAP3Z1714L+UjQ7Da+KKPh9wN1O+OtPkVAGPZ2lMRQOT4ukF+Z0?=
 =?us-ascii?Q?NuUdRAG9LNLPIbh60NbP4o41xmO3XaTRXy8N14eVD1uBbVFLpQTnGkKjltcZ?=
 =?us-ascii?Q?3wEJ9X7hljm8AV5FwFs8EO5orfTCHjXvKk730skmYlER/xdVEy6DcXLHg77J?=
 =?us-ascii?Q?WWvYZaOEPN6gj4lugX4VI5Ts+PIg6UgccUGY1E8O2sPnV30toVO+CgaowmfG?=
 =?us-ascii?Q?uNQj53bnpDdOFyivXtmN+Uzu0R0LwWQxo6Rbbr9On9IhEVzu7bvYyY/Qc+hf?=
 =?us-ascii?Q?spjKSTsW8LPpsdX8LNVZx6YQKN3ncBg35CRqiqbEjyGE+HwOZ4n9LXOzxmz7?=
 =?us-ascii?Q?KwTEmnZM7mYgTvJBIXpjglb/D64hbfzV8/zmf8gIFm1APlhU+jnm3m/hxx0Y?=
 =?us-ascii?Q?9k2q5tN6CBNxrK8q3hDSBsyXbyylW7VnUspy751PHFPZdPZiHdZ6+/1KUJqb?=
 =?us-ascii?Q?OB+kBc1wKEI1QPa3O3f4yXQmOpAsoCKCnXHonZP6FEoEH95dNcMDOLI9i7bu?=
 =?us-ascii?Q?MHzvtnwxXWfbtFfw5x7tJGoXVci2wMRT2aaTN2C9ol4O3Zj9a7SCYluOx3Y4?=
 =?us-ascii?Q?uqtCkAO/3QT+gtKUSXfgj9SCUoZHePZGi98PbS4vwUBFexjo/tR2ZFfyAoUV?=
 =?us-ascii?Q?h4v/ySOlatZWVLmrz0CECRZOoc9X5NzRP15k3pxAIFilRQ3N6tsNoMHEdFTi?=
 =?us-ascii?Q?AEUkTH3bU4wNZZAqcG9PZ6ZETw8cmBtUXKFG7cnGhJQZBtIe3/BYc0Jbl/OX?=
 =?us-ascii?Q?cMuV7pQAKWOkNsI502cP+4FHfeCe2EGYZ+BAG89LS5IDBUwahz7lzdBJS9lg?=
 =?us-ascii?Q?uOR/+60MJXvWEEqodliFd+xKaw5K6ZQ4YFJp5bKIccBSOy9s3kYijI7zp/zN?=
 =?us-ascii?Q?GOcg9Ad5YV0w+Udgit2QFo0E06SmEhw2gTn+z3gQelx/i2CBI0tpfcUIglfc?=
 =?us-ascii?Q?6EHaHwk7lu4bs2vB46fyMDZsvl9ibB0K/0vLC3PRneU53UkJTk6i6kPoYjFA?=
 =?us-ascii?Q?DqqazC87gMJ1YK3nSdR0H0KVloqvDaePdU09GTjL0tY8MNGw1oHOCmGkp+PZ?=
 =?us-ascii?Q?RHiLKG2tffXxG+ZPoJsBGVYR8j/2VwVmxxmh2RgKW9X009V5vtHYh8ZqAsld?=
 =?us-ascii?Q?TdzrYIVpBrAf9Qz5ltpFQOF3y/jQO6KZs86EFo7NyZxCWxcfdU66WUsp3zwW?=
 =?us-ascii?Q?vErdcevcz+wctmO6wXHAt4WbFcARwtjsxxVC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ycrtvYwysWWXVIatyIuFg64TENv3/HafSl2MGGaDiVW0h2eAgji9PmtQ0w45?=
 =?us-ascii?Q?UisQmOm3So7ykGcMFvJbzIf+3GnBw7Sr2OYvk8oc0tEksLFnyfCK5NOIJxPK?=
 =?us-ascii?Q?jFzQuEbkKFy+Id7bK/SdrhTpBIZwFHkzMUX0Pe5ddEmzexZcyTPONxw40d7U?=
 =?us-ascii?Q?lXdaWeKInj7LwbU/L8NgggAyTAWood5ldPkMInBwW01qrZHeWqeU2lyFTUkm?=
 =?us-ascii?Q?yymQpP7EMln+7dMoQ28vHBG60wNWFBEmY1FsY4ygavwooqhOutDwQ0+1LRFg?=
 =?us-ascii?Q?wiwthNqkvcPpQLOM0+TJA8jz6XosqQsW902NO+/kPATAlzdcbYHJtA1Z935+?=
 =?us-ascii?Q?olB6lnZ0o04D6h2FOMlQEr08Zbn7rCjPIxpAW/b5ZkB+8Pk+UbgkioA5Tz9f?=
 =?us-ascii?Q?5tDWsX4QlKq4SmtZoBSKsTjzuhs+qV/AmZoMb128eOJGdaTaDnVBOKKKdDJz?=
 =?us-ascii?Q?lzDrzii2g3rmkUHXnQQYmEUCyMV4T06neYFUYIvi4jpCt/oNIpZZKCU8wRNH?=
 =?us-ascii?Q?3m8p+1H+6mRy74bit4sFp6fXmwNWr5a0v6+pBjhDlKEvScXYqA3zDU3M5rJy?=
 =?us-ascii?Q?d7YHrF99PagQmClrkX8OgpzwFTZqXDUklxS5wiQ/jSzMKAm6jlHIcBgWsN0v?=
 =?us-ascii?Q?QbfBslvDZlyYezaf3PUlWL2/41vHbMBqythy8tOlksbBvRrxfU6iRVBrj681?=
 =?us-ascii?Q?jnw2mTCKWbMdsRjsOL4aDJVjt1ONtqv1hMSmxJnpoOg9b/ZGbRjWWKmwlzYb?=
 =?us-ascii?Q?xs2STuEyk4YWyXe3mMvurXMa1nNrDQICcOITK+d6fDqTAg5GO6zSXyV6RKBS?=
 =?us-ascii?Q?mRLYD3ScRKIAIWx4jhd+bAdEAtXintetQrcxdKATjc3IY4UcON1jVsyVZs/L?=
 =?us-ascii?Q?YvXYoem2PV8LKDnJKLvXvhb3mF1tp2MvW40BxjZN3mZVrCluJ8rY17jzEYGE?=
 =?us-ascii?Q?XGrZMJ/J/4SVMkLeZhboFOah7yP4iLOKzRytRb71XT+hnKTU+lzeXmrpey6p?=
 =?us-ascii?Q?Ij0Gk7/038AAqlKEz5szpaGSlZuMp+h7isyoumlm02xQfovgmNPQEWsILiRt?=
 =?us-ascii?Q?LIvIAuKrS7HNVYNPyEfTW9jSrF7Q4XaWtZGklk7MPcVBVIAjJp5KINqL8wp2?=
 =?us-ascii?Q?4JIw2Qw/uW3k7QILg/MFSkA2whdY/OfO570iNDLqB0G6DlarKrFkq2HVZZOE?=
 =?us-ascii?Q?aNCgFah0LREotbjwE6Sl64xQsO6b8bMlZrGbABwgjS5ObiTpotsNywlJsA5T?=
 =?us-ascii?Q?M6AQ9LqPPCdeHEVaxdf1QSFUvEa6EJk9GJwwVdBuyWDTdrgIKJKOkH0BwFIX?=
 =?us-ascii?Q?PYL7PCwL2Blvk95Dae5zUiDruXJ0T5Y8rRPiyTwD3k/viLGAZYCCqK/3HNN4?=
 =?us-ascii?Q?932EnB9jzWq4nHia+fc+QJcCtkoM5OsppdaPIU6IJL8a4uEhSO7+PpoR6Meb?=
 =?us-ascii?Q?U+I7asXX4DheVWj2sf4c95NqPt6yc+zE1gTXswkSsf3TWOZSv9fGDns0ljtW?=
 =?us-ascii?Q?9cbwkgUeLCMOgiFdkxxACm625+2s0cxyvBvYuzidbMD/xCADxlns78MJ7mkB?=
 =?us-ascii?Q?x9Bmq3NtE0HwxAbf6u7BBAND9QUp1pUgf5sMm3id9l4auJDb40BOWaO80NZu?=
 =?us-ascii?Q?vu+gd27RmxhUCZj9r4mk0dSYfXiVWKgpL+tj7ZlIYVz7lB9obav234bSjGFt?=
 =?us-ascii?Q?nAZ1kXAToO9zvfo9zvWbTwEYAKQGGoWF8OeERgi8bOtQo2X4i+HgMMJuHDPq?=
 =?us-ascii?Q?w3imc1ajrCH+VLqV0PnbDEAk6LxPSuRupSgBrY9jPa53PMXb1O0U?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ecf8fc9-17ab-4bbd-89e7-08de4dd85c5c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 10:34:39.4427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6RPWy+vPCq6FnNV3HduJsB6S63E0J7GDD3+gW8BVan/OP4MUh9pD6B3+WRLSPgdtRI4OO6vKhSyLRrcNLKRwsQD9Jj0QCVVPp62OX1ugqpkua8EJctjXjhgn6/oc3KaG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13558

The Renesas I3C controller does not retain its register state across system
suspend, requiring the driver to explicitly save and restore hardware
configuration.

Add suspend and resume NOIRQ callbacks to handle system sleep transitions.

During suspend, save the Device Address Table (DAT) entries, assert reset
lines, and disable all related clocks to allow the controller to enter a
low-power state.

On resume, re-enable clocks and reset lines in the proper order. Restore
the REFCKCTL register, master dynamic address, and all DAT entries, then
reinitialize the controller.

Store the REFCLK divider value, and the master dynamic address to restore
timing and addressing configuration after resume.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - Collected tag.

v3->v4:
 - Use clk_bulk_disable/enable() into renesas_i3c_suspend/resume_noirq()
   instead of clk_bulk_prepare_enable()/clk_bulk_disable_unprepare()

v2->v3:
 - Fixed error path into renesas_i3c_resume_noirq() and
   renesas_i3c_suspend_noirq() function.
 - Moved up one line sizeof(u32) * i3c->maxdevs into devm_kzalloc() call.

v1->v2:
 - Updated commit as v1 has been split into smaller patches.
 - Use clock bulk API into renesas_i3c_suspend_noirq() and
   renesas_i3c_resume_noirq().

 drivers/i3c/master/renesas-i3c.c | 89 ++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 008b6ee60e26..528bccc2c68e 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -256,16 +256,19 @@ struct renesas_i3c {
 	enum i3c_internal_state internal_state;
 	u16 maxdevs;
 	u32 free_pos;
+	u32 dyn_addr;
 	u32 i2c_STDBR;
 	u32 i3c_STDBR;
 	unsigned long rate;
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
 	struct renesas_i3c_xferqueue xferqueue;
 	void __iomem *regs;
+	u32 *DATBASn;
 	struct clk_bulk_data *clks;
 	struct reset_control *presetn;
 	struct reset_control *tresetn;
 	u8 num_clks;
+	u8 refclk_div;
 };
 
 struct renesas_i3c_i2c_dev_data {
@@ -609,6 +612,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 					   EXTBR_EBRHP(pp_high_ticks));
 
 	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
+	i3c->refclk_div = cks;
 
 	/* I3C hw init*/
 	renesas_i3c_hw_init(i3c);
@@ -617,6 +621,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	if (ret < 0)
 		return ret;
 
+	i3c->dyn_addr = ret;
 	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
 
 	memset(&info, 0, sizeof(info));
@@ -1363,6 +1368,12 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 	i3c->maxdevs = RENESAS_I3C_MAX_DEVS;
 	i3c->free_pos = GENMASK(i3c->maxdevs - 1, 0);
 
+	/* Allocate dynamic Device Address Table backup. */
+	i3c->DATBASn = devm_kzalloc(&pdev->dev, sizeof(u32) * i3c->maxdevs,
+				    GFP_KERNEL);
+	if (!i3c->DATBASn)
+		return -ENOMEM;
+
 	return i3c_master_register(&i3c->base, &pdev->dev, &renesas_i3c_ops, false);
 }
 
@@ -1373,6 +1384,83 @@ static void renesas_i3c_remove(struct platform_device *pdev)
 	i3c_master_unregister(&i3c->base);
 }
 
+static int renesas_i3c_suspend_noirq(struct device *dev)
+{
+	struct renesas_i3c *i3c = dev_get_drvdata(dev);
+	int i, ret;
+
+	i2c_mark_adapter_suspended(&i3c->base.i2c);
+
+	/* Store Device Address Table values. */
+	for (i = 0; i < i3c->maxdevs; i++)
+		i3c->DATBASn[i] = renesas_readl(i3c->regs, DATBAS(i));
+
+	ret = reset_control_assert(i3c->presetn);
+	if (ret)
+		goto err_mark_resumed;
+
+	ret = reset_control_assert(i3c->tresetn);
+	if (ret)
+		goto err_presetn;
+
+	clk_bulk_disable(i3c->num_clks, i3c->clks);
+
+	return 0;
+
+err_presetn:
+	reset_control_deassert(i3c->presetn);
+err_mark_resumed:
+	i2c_mark_adapter_resumed(&i3c->base.i2c);
+
+	return ret;
+}
+
+static int renesas_i3c_resume_noirq(struct device *dev)
+{
+	struct renesas_i3c *i3c = dev_get_drvdata(dev);
+	int i, ret;
+
+	ret = reset_control_deassert(i3c->presetn);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(i3c->tresetn);
+	if (ret)
+		goto err_presetn;
+
+	ret = clk_bulk_enable(i3c->num_clks, i3c->clks);
+	if (ret)
+		goto err_tresetn;
+
+	/* Re-store I3C registers value. */
+	renesas_writel(i3c->regs, REFCKCTL,
+		       REFCKCTL_IREFCKS(i3c->refclk_div));
+	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
+		       MSDVAD_MDYAD(i3c->dyn_addr));
+
+	/* Restore Device Address Table values. */
+	for (i = 0; i < i3c->maxdevs; i++)
+		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
+
+	/* I3C hw init. */
+	renesas_i3c_hw_init(i3c);
+
+	i2c_mark_adapter_resumed(&i3c->base.i2c);
+
+	return 0;
+
+err_tresetn:
+	reset_control_assert(i3c->tresetn);
+err_presetn:
+	reset_control_assert(i3c->presetn);
+	return ret;
+}
+
+static const struct dev_pm_ops renesas_i3c_pm_ops = {
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend_noirq,
+				  renesas_i3c_resume_noirq)
+};
+
 static const struct of_device_id renesas_i3c_of_ids[] = {
 	{ .compatible = "renesas,r9a08g045-i3c" },
 	{ .compatible = "renesas,r9a09g047-i3c" },
@@ -1386,6 +1474,7 @@ static struct platform_driver renesas_i3c = {
 	.driver = {
 		.name = "renesas-i3c",
 		.of_match_table = renesas_i3c_of_ids,
+		.pm = pm_sleep_ptr(&renesas_i3c_pm_ops),
 	},
 };
 module_platform_driver(renesas_i3c);
-- 
2.43.0


