Return-Path: <linux-renesas-soc+bounces-24959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6B3C7A7A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:21:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DE11336284A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6675034F476;
	Fri, 21 Nov 2025 15:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jlSYHutV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133B6348463;
	Fri, 21 Nov 2025 15:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763737995; cv=fail; b=sW+BOYlU2m0aqb4q3rH/Kl8J69ECHEWlk1GpaUlB8T1JI/o/NO1AX7IHYJUxlpkBUghOcWmlueNZmSAh1Qi7lCW0pjTbGxihYrVIWjxofJgf0yCozBLSUQ2EvHRObo+isI29bXdBFv8WS6qn25AktrWuhTSQTchq9BXQTo9NsZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763737995; c=relaxed/simple;
	bh=TQ9u0cNCAqJM25HL0s9MwN9RW0B9tmj2xWPLKx1LENw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bgrLO9QWG/XNop7i/ld19gvCZ9xiwmLRhF3mJprCsq7mPDmiN2d/zd6bx4e3C8vc8LDgD+mLQuHSkhf5Z61av7o6x1ktQVVtIM58eP22Qn3820XC/nFNfTjQhD7reJ+tfmSmeL1pukxBw6SNGFzCG0Vjes5TWDDqWDhNs97uAl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jlSYHutV; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buwmA3T5xEdauUDY95MWFw9CfyxStwq4xNTx8RzBBHsC7oLJtdQm0JF3aCgJEvdU9HumMywjzrc8XQ6MKvrM3sirHITy+2elb4LK7palnFXTz6h8tubQe/cMfKyXQlQyBzc+8rxE246r1pAiIsHqRM4iUT52eY8gjDRoxxGX2khir8ZFDe62G249Zf9IUK99r8RrbGuCs4HJpizUGfgElB9GbXjBCRg8VYlhvu4UZq7feZoBlhGIP4vcMfbzBxwmguilY4pSy7/qrkrjfoeivbDZNgRg7eROPEO70OJ/p9zYvPPDNBlozo32GB6SqjRC2JNf3jzbfRP5o1ja/7yZuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BECKeZGZ8Ao5L4gzPwypoR23h2BNfJY8C56QsfY4Z3c=;
 b=TayztuYVrCvvelG7lGpLdqAGSxIPb/UGsTbYm2gU9R7NwXq1XPRr+DqXAnk4pkKP4Pmyrangji/UozudRPbNOBoL9NocwcxP1lfjSgNn0oeD5TIPBZq5C7Mol1s8doGscza0vugtTwLMm4HX/7T3BToj//coG00HJ+9irlISu+shD5VfHmCZS1hRBMnPb49IQ65Z9ZZmXPyD98iL/8sWYYG2nE+NskxtVUmzp/RXYkwQ9Sma3aBEXym4zyuYtfLQDt1rNYN/OwQ7TsUbaFVeWuqNfGlHmC2kUolOJt6BmMhXSNs6qtMJrHJ448PMXR0Z8j9CPt+X5vQ503J4Ddxr9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BECKeZGZ8Ao5L4gzPwypoR23h2BNfJY8C56QsfY4Z3c=;
 b=jlSYHutV+hJj9kObeGZUVKsFBG4OJrmnZ8r84S4+2c6crOwkLLDngUOqijRGIcrB3QuddttNnxeK9TemPR8K6RWgTsR3Xj1X2x3zx6fFKtU8VdIOjK+zVaSpNQLcmBubGPQZnSCKxBbGHhNfJtFvu/fD6BBftqt/I1pm4G+KU1s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB16954.jpnprd01.prod.outlook.com (2603:1096:604:41e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:13:10 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:13:10 +0000
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
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 03/22] phy: renesas: rcar-gen3-usb2: Factor out VBUS control logic
Date: Fri, 21 Nov 2025 16:11:52 +0100
Message-ID: <4e6b59513ec69cc04e1213df9fee84c65d037cfd.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB16954:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f94bb6-e73e-4207-91d0-08de29107b81
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g2c+UQjtuqS+IYY/2kq0fm3g3T6zdB190SUBMtyCd9IGDL3LUWmGxTdAzRU+?=
 =?us-ascii?Q?ng7RLjnkarwmfyVDLVPF+DJPfxJ6iBb6/qyoRieeAHpiTTFOhBiMysRwFi20?=
 =?us-ascii?Q?9OL+i1u4PLTZknqE6DhyvoyrqqTilFdRb3zZ7n904fl3xcRt+0z/9136XF8L?=
 =?us-ascii?Q?gwPTxO2ZEoK0vxGpTH8uA3q7BG0Uo6QaVi8IVCEVlq+wpdofzDxS2ik9NafB?=
 =?us-ascii?Q?DzlX2pR0jWy34uBROGPr+/S0edFKGri3x697uCKaAyvZhfZINJB8UuGyvzXQ?=
 =?us-ascii?Q?pJS3hdS2R7JitPtFPZTdkc8FcsFrbKsW7fumhQxBBEovTCzNVetAOj2hdvqN?=
 =?us-ascii?Q?ouNTf5aPapW13Ok9lRSz4ytG2yekbaVRP9YN9wmha56MekL3CF3c8V5QeyS6?=
 =?us-ascii?Q?E+fpsY8DJhCKYzBN5imTLxGlDuDcMp1Qfc6bKEWz6PtX6BldSqSKMhNaT42A?=
 =?us-ascii?Q?phQfYh4qJ2028LNBdUFIX7AgeGck6NA688muKkIo7XkJPmKBJEXjEejKOpCV?=
 =?us-ascii?Q?H8MMrJcu2DsbN4QPurFJZEbBEWVz4qxTFPF2K4fs2DmnD3dxJVvkRWPor4A6?=
 =?us-ascii?Q?K32Y7YOsPcFVgbcj82xisFjFtAEjpUIUCH8vMxpBGTOzX9y8BBoCR58MgA2i?=
 =?us-ascii?Q?tIAXr4phTYV9jM0NOcPzA8peEZmSQzZQoZoeUd+asWPxy6q/xSlqlVjuFAlO?=
 =?us-ascii?Q?ZVLK8p4nNiRoXcX3Ie289YXndzfuihLSaTLMznKP8qEW6AXrbWSmkPLLTcVJ?=
 =?us-ascii?Q?1ExNgzmPf2WhXsvkj6diBIcDh6CGarZbhba9lQmIAKGqwsmPL4tlrxpOgyMs?=
 =?us-ascii?Q?YcdwgvcmpIUjUCImMOlH4GaT/KMnXPZ/IU0Oj1eRJ7Bc/FmuVNqQlKARQ/qr?=
 =?us-ascii?Q?12SebjW/EO3B/EXE2HXU7i+xSNAl0pJbubRforX0qufQx0SQOVmejPbhbT1h?=
 =?us-ascii?Q?/DYyM3KWT9ddlzziU4ByjHAKSuf073LjvZeM4SpUOx+G/BE5O4eP4nszrfLr?=
 =?us-ascii?Q?XUIAmJMDU2+aFHxKZnoIuJpJS22RkGxoQKWLRlBmMY+R+/SNH1mKQSaO+Rey?=
 =?us-ascii?Q?BH81pVjUURkFq0lT7+dgOjQUl/gkx3BgXe4QSMfvE1R8HUERy6OOfEMlwT9o?=
 =?us-ascii?Q?YramDahyo/oqnj8p6J8L0UgC3gIgTIcwq8EUisu02PonJNBsolvIK2RuXtpf?=
 =?us-ascii?Q?Cn3HWbiunqWoPZxh9rpRgPnEcgDV8xlkhh/ILwC4guHlpO7J+0lGF4xLsKfS?=
 =?us-ascii?Q?x81jNoBJ8BAOqKkReHWbhDZNPCv7UBjXENGnUkCsKev43l7NQPoTA/5M+upG?=
 =?us-ascii?Q?7jSbQOJwVBu/gzu7VdhruhZH/M/I5FmYslTeBkIOkakucmSrFWDbmbLEOFOe?=
 =?us-ascii?Q?z8EMXFM1JD29xx7+CB5BkfIjSNK7YZcDjwIHU/Kl/ClTovmzsXq6jMWSe1XW?=
 =?us-ascii?Q?OD/M/HVFAJZlSEeDV8IaLrtvlDtHU7E/w3UaOc2ZiKlRDk7SyIGVJMIZmAWp?=
 =?us-ascii?Q?5XkcsMcAspZx7u76A4WLarQzBVX7ewIycbao?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o+wE+NBEZO9lziAEhWG0MeUTxIAqQ7wi2DXm7nSUkbKks7tA0he71Lyzl458?=
 =?us-ascii?Q?GbYiXVkpxB7ufkXFfFyD7wTVJv/pQLjitQG+OQISQTr6t14l4KvL1WFHYNI4?=
 =?us-ascii?Q?XVktAb62mN0LvKA5Rm/rrciIKO0lrs5tdktmsJhvlglwY7sWZoo+SGTS6K65?=
 =?us-ascii?Q?KaEYO3Mq5/i7Gkz8XOKDXmrO3Ka9AVan3s4xne0Y50uHhgO+of4oSVFgkVK6?=
 =?us-ascii?Q?L0gtQU2YyDFbc+GoNfFJl6AJJxdNQVjnvnuQL82OPhROZvw1B96+8jV82zwO?=
 =?us-ascii?Q?KRmuQDodV+WmCHaaOkIXm7TpCvxPEsqNJ2nxSPQ2uXrIHl7TfGJV+LsYaGut?=
 =?us-ascii?Q?9xrM/qZ6FNrYFOiB2K1uECSo0Wvs5c5RujpIye2YkrII14bwD+6yqTEpewKZ?=
 =?us-ascii?Q?q0nKlUJmb6m0OyF3nzxOSYKhrbtsg56U6x5jhCjwM1xtyT0zslbar5w7VsUb?=
 =?us-ascii?Q?k2ydkTdmpLVYzI/PRaoDb4EXRy1HoMXx4y5G4jZ7N0Oy6CsFTfeWBtx6B5+X?=
 =?us-ascii?Q?m6Eebf3k/CqUOWX+iG74pjorHedEYEFf6XHmWW8bVZFN7NzCKgVTF+sEUZjm?=
 =?us-ascii?Q?8QYocVjqoEEFeTLqOQK61IE/00B7ib4UrrWfANEqldKfS/20WAW7wP11U6gF?=
 =?us-ascii?Q?0CnFvzmJKhekcTjFL3yeyoUz+f2E4b3D0PpqbZrMo9vCwXOAFO/e/Wcaeaxg?=
 =?us-ascii?Q?R7MoEhvcBHDzAyp1ZsqXUH1Uj1PGbihBB9DcUcZ3vOLbbSILSJDsxg/yozbw?=
 =?us-ascii?Q?DcaAA7uob5u82lhtDbldtei0VHB5Xk1cc+t579M3petv3HibKh5O1INi3jdg?=
 =?us-ascii?Q?3y5HjGx5oWEUwIkfzVKC7152UeCua4d4AscmofleWFSThzQitEWn8DzilLGe?=
 =?us-ascii?Q?JD9QvB6fthlYYOg0xL3ykwMae6uEFTX4nenZjTkpokBRw1/Dhv9BbNlIQY8n?=
 =?us-ascii?Q?8CrfyjVkteRwif7tyyf9fUQtfjxWg/2C9kzpuFqj+5LwShUFpYuK6u82ULMq?=
 =?us-ascii?Q?oQr30ASOeLn2NYEsC7WTVLmRbQF2hD1xNuDGjglcVsyeoW9kaYS/FSwTSm4T?=
 =?us-ascii?Q?VwLWpLYanQZF5DrZkb1LDmptdckjIItdtbTG/lTexOMeBja93wX1ghX+05IE?=
 =?us-ascii?Q?3cWuMl2CqYWwXY1pHioNTyfXVjaglTu9jGvhgjf5l8jizM5oF5EfxteMc/5W?=
 =?us-ascii?Q?lrDjcReF/s7QcjZ8vWSvhk7DbunBC2oFFMwc7+DqvQCyY7oZPxOn54BuJFY7?=
 =?us-ascii?Q?Ftuo1Rga6JbyLvBzaHyIEzQXFolPZBorVSGFJgQkTf5byUdLcuFmcID/RDmA?=
 =?us-ascii?Q?2AeFxEBmESbRK/ljcazXwHXkNtGp7wU/yIG5nMVVszDRUb7ZPTjngNFgIqQm?=
 =?us-ascii?Q?3G8CWfcDrtwrersSf4efQNzLake2VILxrhIB52SxBhisOKE3JKPYBxWBgiC6?=
 =?us-ascii?Q?Vlsv1oH29FcW7P6/phKF5EQPQ/AsR3yrYk105Qg4BG02c6PUk4jyzyCVFiz1?=
 =?us-ascii?Q?HFsbVvVJqyBKt56eqO+FfnziIqMl9HEUXX1NBENArsywwxMfARPCIGjHkDyk?=
 =?us-ascii?Q?jEvNeC9beULDTHk6TafkTDlKFHsI/2VkobwJeHiiju7aq/Y0JNMS/Ys74Oaq?=
 =?us-ascii?Q?uqNEZoKN8rCLBNh3aVITXOo=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f94bb6-e73e-4207-91d0-08de29107b81
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:13:10.4746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hkAzB1BXmCqbQtoXj6s2a8YgUUI+v0cbiSpMixW5f4jbypSPYuCJnq7/VhW21+puaPoYLR5azT1tIg9rSoDKTJ0mas69HvLzqzexnyxGrNygrm7XnujvfqiB3fWor+VZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16954

Refactor the VBUS control logic into a new helper function to improve
code clarity and reduce duplication. This makes it easier to handle
different VBUS control register cases and aids future maintenance.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - No changes

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 34 +++++++++++++++---------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 41e0c818ae34..94a4521d7187 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -204,28 +204,38 @@ static void rcar_gen3_set_linectrl(struct rcar_gen3_chan *ch, int dp, int dm)
 	writel(val, usb2_base + USB2_LINECTRL1);
 }
 
-static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
+static void rcar_gen3_phy_usb2_set_vbus(struct rcar_gen3_chan *ch,
+					u32 vbus_ctrl_reg,
+					u32 vbus_ctrl_val,
+					bool enable)
 {
 	void __iomem *usb2_base = ch->base;
-	u32 vbus_ctrl_reg = USB2_ADPCTRL;
-	u32 vbus_ctrl_val = USB2_ADPCTRL_DRVVBUS;
 	u32 val;
 
+	val = readl(usb2_base + vbus_ctrl_reg);
+	if (enable)
+		val |= vbus_ctrl_val;
+	else
+		val &= ~vbus_ctrl_val;
+	writel(val, usb2_base + vbus_ctrl_reg);
+
+	dev_vdbg(ch->dev, "%s: reg=0x%08x, val=%08x, enable=%d\n",
+		 __func__, vbus_ctrl_reg, val, enable);
+}
+
+static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
+{
 	if (ch->phy_data->no_adp_ctrl || ch->phy_data->vblvl_ctrl) {
 		if (ch->vbus)
 			regulator_hardware_enable(ch->vbus, vbus);
 
-		vbus_ctrl_reg = USB2_VBCTRL;
-		vbus_ctrl_val = USB2_VBCTRL_VBOUT;
+		rcar_gen3_phy_usb2_set_vbus(ch, USB2_VBCTRL,
+					    USB2_VBCTRL_VBOUT, vbus);
+		return;
 	}
 
-	val = readl(usb2_base + vbus_ctrl_reg);
-	if (vbus)
-		val |= vbus_ctrl_val;
-	else
-		val &= ~vbus_ctrl_val;
-	dev_vdbg(ch->dev, "%s: %08x, %d\n", __func__, val, vbus);
-	writel(val, usb2_base + vbus_ctrl_reg);
+	rcar_gen3_phy_usb2_set_vbus(ch, USB2_ADPCTRL,
+				    USB2_ADPCTRL_DRVVBUS, vbus);
 }
 
 static void rcar_gen3_control_otg_irq(struct rcar_gen3_chan *ch, int enable)
-- 
2.43.0


