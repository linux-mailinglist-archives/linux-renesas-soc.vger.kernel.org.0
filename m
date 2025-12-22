Return-Path: <linux-renesas-soc+bounces-26001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE04CD63E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B2EA3015974
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A02833B6C2;
	Mon, 22 Dec 2025 13:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fr/puT6E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712DF33A03F;
	Mon, 22 Dec 2025 13:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766411166; cv=fail; b=CXjLGGhaRimCtQQuVygrUnCDSNHfPzwanBAtrrFXoETQL8Q5g9+LUe5K4QwOApLGkfrHn0o/vDdY9iJ4iQ+XFelTQpQHcKXiMxtT1POo3DVLGvB7vsFbieZCXZlNGjSnsAx/iDmIEJw1ULg98ZOp0qoah+jPYOKNMx5f6JSjlvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766411166; c=relaxed/simple;
	bh=Er5OAWkDOVbXT5r57henQqTRtH1OnI8mXpwUZFW/kTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zjh5L4BXrXtIy57xZcdMUMcmXpIm9oY0gakVnS7kU0nwGY4/u1hgn99wUEBbFM4VRRkYFws7qKGJfMBJ3lar0ZBVVDyeF5hjCyL/hoJ4yMbMgsdlPpAGuyQce4SDpPRU7Dc/urW5umcKYpazpSFndAbgyfSWuyYiTxjtRiAr2O4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fr/puT6E; arc=fail smtp.client-ip=52.101.125.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQSQ5zRZ9BrF4FX6Aq8fv7JXmw6gaut4a/tGUWwdk0R+kgnF95fzDl9NnJSQIxyz59EF9/uW3PVqIF4SOvsUu+oPr4dSV+8x1H0zJszll3U+perU1HntREJOvswkQ9nWx55o9XNd4eLuypwpbmpwdgBocdgS4Y+CtUXKAaJ1kgm/jy3JdCtgTUBrv3HpCHjiB/ww4xtWEVD6PjjxBbNBFMGHmYxt9uFGyE/L2fiUSGlk5cuZZkNfL5j2Vfvqwl5qqnUkRAUwxdSuAigLY1fdTddZ8PuFx4gjUGvE5llrEvbu8fynI/DWxTaGCHdMa5EyFuWcQcloOhHk+roH1y5fyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuByp8tq4IqSTNGOgl3iyjNy4LUbPgwS5Vo2H6vSPbM=;
 b=ViQjsmf0V7oWX4I6nEGhYoWBtMMRdoJE8RgY7c+0M3eFiq60uubeXViOPL5neh3jRxHPdp/1ZW4woYUMnTNXVm+u7lHI5I/PfD8D6dkimercIjdLSXx9qGIyrffmJ1OP8JmG8sVzbcQfNnJGad8zySwOtXl8uJXqktYXoTlYRrskJdX6/qMyJnueB3wlO1k7JhCxdtvaIhDERECDe6JrZ8miheI1zqkmG3ICYfUeaH/DlNS6b3wrXkzBa260NlfBbjB71tsWgX7nTFFgZttmGjlHvpFf97NBDPK0fq0Wf/S0Es1jEQbjD+i3+i1InBtr1Yda5FgWFatOzrhdSMhmVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuByp8tq4IqSTNGOgl3iyjNy4LUbPgwS5Vo2H6vSPbM=;
 b=fr/puT6E8qHkTMBM2lkGoHONbx0YfSeLDfQYsReGmLCPlXkCLiLC9T9nOdP7gblB6pB6M/mqIAuE2nIsgDuELHAY81Nu9S4lAwQJmV13HIphoHE7rA+nZpIXCEi1uVwm9uBQZu6kBqPcyWOPvVigJp1E7jSZwKXGzFpxVXn0cng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB14304.jpnprd01.prod.outlook.com (2603:1096:604:362::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.10; Mon, 22 Dec
 2025 13:46:02 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9456.008; Mon, 22 Dec 2025
 13:46:02 +0000
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
Subject: [PATCH v6 13/14] phy: renesas: rcar-gen3-usb2: Use mux-state for phyrst management
Date: Mon, 22 Dec 2025 14:43:47 +0100
Message-ID: <80aafdb2367dcada720b0a9ebeea344764e710fb.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3d1f5cd9-cebf-4835-ab86-08de4160722e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EbXy78CLx+fJxbgVL9Shz2wCSf+MyVSABvONlJNSU6Y005baOjg8uHatl+a+?=
 =?us-ascii?Q?G1ylG0Lp80/tB7bDXy6BHG3qAl5z1xotDSgWS/fnojbrEpWyuvprmuUf0Fcc?=
 =?us-ascii?Q?u8Mb5hPgP1BGe/O9YhG3crIcoXKP8pJCq1w7CCz7lwL6JgLR7TzNs7ND+Vss?=
 =?us-ascii?Q?RMvbje+0bbfI02LquXEPWkMfr9tg0rbVkQ4r9frJLYfkekH1uBUqTQVD+lo2?=
 =?us-ascii?Q?t+hJPUMM2sz8XAEdw5eTdzRWXr8coblKbWW53v84ezfu0P0kjy6f122aU2r9?=
 =?us-ascii?Q?yc3NIA/k93njMtJPGJP1JnyX3s/QUxWqQbX5bj+RSjcRNM7UIG1/HnUVcSrd?=
 =?us-ascii?Q?CHJqpur0VjPr4M0crF5wrRP3pMXqJjZbCQLGnF2uKe94BrjAO+mgU5lOOquh?=
 =?us-ascii?Q?OnbwaNswGJwhNBN6QA1gbORM93SPGKTIqVVH0k83RyQF8zukHDQmdP9Z6xRh?=
 =?us-ascii?Q?cqnFk4t+5n8Mb79zj3iKx7sHAJPvi+vYXqZ7GUCHEH9fVsjcZ6Cj15MpXo7N?=
 =?us-ascii?Q?U7dnPNsaT72byy8fePbhH6ySC2mkKAXEk6RkHiblFa6D37UTDvJ5mqDgQTnb?=
 =?us-ascii?Q?N8nags8J5aj1aTVHETVPWMpx7+qhrMMQf0gKWNeNU58GblWC1B2R0JcO5lz8?=
 =?us-ascii?Q?44U6gsL+qkZgQlKCX6BXOKFfCAzpqTzSy3IrpMx9Mv0RZ5gsMDaVcqQPrFM6?=
 =?us-ascii?Q?cH52QOtnJ9oM3XSAD1akDSMRanNVcWp7Qh7u+aONUy3taJY4Ph5oc/uTXelC?=
 =?us-ascii?Q?wS8537/l4jdWLV+tvBImmTWDD/84A4cO7PKE+B5k9WU+297iQmHWXGONyVal?=
 =?us-ascii?Q?gYMbZfna3Add6Bmn3r8OImSG5rkyCYZXtVdB/uHy28GoxfuJN6OIs/BwsNxa?=
 =?us-ascii?Q?9DK3L4wz0J5S8LHza+IPDFEMZofnRzl/bC2lURPnRcah+FwBrKGppB6SfyAx?=
 =?us-ascii?Q?auy65Z/GYJefiW+ZXW24ddj8/GkdZNcAxVTnCyPyLqnIn5HhnGgqGkHeZ/6/?=
 =?us-ascii?Q?VZ3b6a+OlAYdtbJZTqiTszp4ntbqH//hG+PKDgmNt/Tzn0KmPPP83gnRhGcY?=
 =?us-ascii?Q?Z3vsDW0TwdVCbPNqFUwxxVTdv6YH5B21Xs0LbvQ4MoTRhEVLmGXiECu7tNyR?=
 =?us-ascii?Q?LsqbXfmRgnbLn8cs2oqUg6GgyTki0JNNit1DxIS2vA01noZHGs0xWcTm/eQL?=
 =?us-ascii?Q?Z+oJebaM/nZw0vD7kOH2SsYLwNDBsWgF+7qnfeIGVOj2HAgAa6YyZpaSuLTF?=
 =?us-ascii?Q?fSgpDR3iGO/hRqsNfgJ7t09BElha36JKV8jOODpeAhvJjcMEk804CXsjHhET?=
 =?us-ascii?Q?lp/2aXAUQT/P3vTFVYSEeHFrgum5nMJVffAagfrR2d+BrmERlzcfH5ihRTni?=
 =?us-ascii?Q?E7/RubnUlLKP0AoYATyIyhcuviUEmCm/jMTW0A3ZfRXdCGvroruDSmr2oxj+?=
 =?us-ascii?Q?5YrG73yeA8RX9pz8wtuaLfX97BU6GAQLMfCRArqy5gf35NRwJd5PfUy4H9fV?=
 =?us-ascii?Q?DhFERav6oade8aMwD0QNs47lKH0qUE/rYnPi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/J5tcg/W8W0nPLP3RzyuAVHLAfIrBwS//1jIw5qHFKbMnKjryrVWnms3o1Eg?=
 =?us-ascii?Q?bmw4TXDPxH9wDFNGX/vKuechV3TS7enjtn1ZS+MuJhSX5+D4rRWvwsaubvUX?=
 =?us-ascii?Q?0XFPU6zIJVs95osnmURI7FDIRZy8/KxWZGZNXOCFvZ24RDPHKoHVuMpvKpf2?=
 =?us-ascii?Q?ONOBedUUVeiXhqZB16qM6IUrUiOdvidckHf26kfbt1Ku64Syju/ak/4Sdy5U?=
 =?us-ascii?Q?FTRfwZQeDa5h+UXXOvsnV1jADCDFSV2n8LVgM1tuSMNq+7arTsdUr90p5csT?=
 =?us-ascii?Q?A4+PhoSzQhlChnO3gqZ8r6JQ7rm9LEdqZpicTd5TY/acwwugIIVnrcameE87?=
 =?us-ascii?Q?7v7toXAthwoaoFSW/bCRLALhfvmyuNYRyAvP+O9TDdTOcNoonbV/7xKeqsrV?=
 =?us-ascii?Q?8VRzJiM8Z+vCquzrv+1G424+zdzMSpVLdtZ+wWc7c2Y+Grxf/ObUNoLnFsSE?=
 =?us-ascii?Q?AVaFSdR8MOomJjSj+0ApnGNZma7iVMko5rbtPAcapEdldlP2uXo2Ivl82iNP?=
 =?us-ascii?Q?qPxexwACtFFElJ0uaDjkH4NqEbRNGqIpxy9e/DrzEN0rcu26Y3+Na+lYushd?=
 =?us-ascii?Q?mf5SQAmF0cLL3dvV2AlwU8A/H+TeSXBFbP+msbQ173M6YMbpT0UEjdAlIGim?=
 =?us-ascii?Q?XxieZJI7ug9jJukOYJp1yfieZNg8wdLLgsAl6bYaAQIpoVCfbZpaoXDM6I06?=
 =?us-ascii?Q?yWkqnP7kmZQpBXrkbRYo/uEf0umLFGLROw7Y374CHPRl5H5frm/CiMJMZaRz?=
 =?us-ascii?Q?M5kgyEBHYejrTRGxxYrFHQ2Fh6WXS5BTN4YZww36o0qtgTF3hlWVzYVhEWJX?=
 =?us-ascii?Q?ePIDYZJseeSBDTvmlpL3FbYTyeipWYHlJjbQomTj6Eo5sLgZkCqXeTrYe5d1?=
 =?us-ascii?Q?6HNd08hHgYx2zCoxKsjuyQjt8HMJGKgEswgGH+/v+VlY46Mj3DOVcBj5zrER?=
 =?us-ascii?Q?V2ZOWe5nk33q6GFHNXVq7bNOlXcV+k/G+xBA1+eKgd6rne6RDJY98IKUoZiK?=
 =?us-ascii?Q?DUwOuE6ZFruHl8m0sQUfMtuQ870VLphbOrSkn7eX0o4J2pHU7vnyJo2vSAWg?=
 =?us-ascii?Q?uk5yzkwVR3zOZzoxT7AwwcwCKps+dIEZR5EhwCV0ZLGN5l3cjqCHIX2YpjvQ?=
 =?us-ascii?Q?ojLhnN/M2MX0QetGyEURg+HiphzDnwRpZ7pxIDVQrZXCl+HuIW4b/KdiQ8Jc?=
 =?us-ascii?Q?lvZ2SlPPuSyNz9HwPRP/oHBlFd61z63SSX1Qf3naNpwvFFRESFx8MnuWm8xH?=
 =?us-ascii?Q?rjq74q3UYnfPwppaAFjbsoPi7aRelsM2tzTneR8aLAKRTi6mSVWiKA45SVr1?=
 =?us-ascii?Q?ju3cFa2vQsqVYTEZdYJnSMne7GyLjAo9XAHrU4QaJy9mqvjcJV/HkIdy4VqA?=
 =?us-ascii?Q?YASmxxLKJ7uhXbbE5ZBQQn3NOrhig5MHFbYsNXBE25PeSYgPxEE5nDbdLt86?=
 =?us-ascii?Q?5gwE0p4Mlqk/H0SgmEbQCxJ2DmAkYV1iJOUMaQ4A2jh8IfaCkb5oqsC/kKJe?=
 =?us-ascii?Q?vFETYdZoTCl4CIM/Kan3rOPInqqrNbB5FOr/W+mh+EkqB5JiWHEInfIEDXgn?=
 =?us-ascii?Q?vA5O2LtF7VQ/sCcsMT7dnewlnmIV/WeJKacmFhjev49HGdFM2OO/WMYAAKRt?=
 =?us-ascii?Q?trdFD1Lp6JJ6hoMBlUzZeFx3k9WbMwfatGSL6cLI9fbbdiLuRCLX6VwQxJn6?=
 =?us-ascii?Q?EqcT9xHWxnTZyDdvraV6Kv5POjh7Fdc3c6cCRcIE+6R+Hk8Ko3CzfO1BPtJX?=
 =?us-ascii?Q?1zU4P9auFdaeIYkAN04uNOAS0LcfOQqk2VSYcbLfaF7vazai6PS8?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1f5cd9-cebf-4835-ab86-08de4160722e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 13:46:02.4567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QcO00FJnfbs5bmsd2MnwhHZOy6VygMde2nPXHHUO+7V/tnhMgfySECh+A88u9v3xPl60edInQM2N5ZPhW8ZZE6h7bfZnYJGxZpVRmmeMIvwB4B8ORraZnmWR9ZS9IBP4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14304

Add support for selecting the phyrst mux-state using the Linux mux
subsystem in the R-Car Gen3 USB2 PHY driver. This ensures correct hardware
initialization and integration with systems utilizing the mux-state device
tree property.

A temporary wrapper for optional muxes is introduced until native support
is available in the multiplexer subsystem.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - No changes

v4->v5:
 - Fixed if statement for mux_state error check.

v3->v4:
 - Added missing select MULTIPLEXER into Kconfig.

v2->v3:
 - No changes

v1->v2:
 - New patch

 drivers/phy/renesas/Kconfig              |  1 +
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 32 ++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
index 16211072098e..d217c630b2fd 100644
--- a/drivers/phy/renesas/Kconfig
+++ b/drivers/phy/renesas/Kconfig
@@ -30,6 +30,7 @@ config PHY_RCAR_GEN3_USB2
 	depends on EXTCON || !EXTCON # if EXTCON=m, this cannot be built-in
 	depends on USB_SUPPORT
 	select GENERIC_PHY
+	select MULTIPLEXER
 	select USB_COMMON
 	help
 	  Support for USB 2.0 PHY found on Renesas R-Car generation 3 SoCs.
diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index d2c03a846b58..cfc2a8d9028d 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/mux/consumer.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
@@ -938,11 +939,27 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
 	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(channel, enable);
 }
 
+/* Temporary wrapper until the multiplexer subsystem supports optional muxes */
+static inline struct mux_state *
+devm_mux_state_get_optional(struct device *dev, const char *mux_name)
+{
+	if (!of_property_present(dev->of_node, "mux-states"))
+		return NULL;
+
+	return devm_mux_state_get(dev, mux_name);
+}
+
+static void rcar_gen3_phy_mux_state_deselect(void *data)
+{
+	mux_state_deselect(data);
+}
+
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rcar_gen3_chan *channel;
 	struct phy_provider *provider;
+	struct mux_state *mux_state;
 	int ret = 0, i, irq;
 
 	if (!dev->of_node) {
@@ -1019,6 +1036,21 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		phy_set_drvdata(channel->rphys[i].phy, &channel->rphys[i]);
 	}
 
+	mux_state = devm_mux_state_get_optional(dev, NULL);
+	if (IS_ERR(mux_state))
+		return PTR_ERR(mux_state);
+	if (mux_state) {
+		ret = mux_state_select(mux_state);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to select USB mux\n");
+
+		ret = devm_add_action_or_reset(dev, rcar_gen3_phy_mux_state_deselect,
+					       mux_state);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to register USB mux state deselect\n");
+	}
+
 	if (channel->phy_data->no_adp_ctrl && channel->is_otg_channel) {
 		ret = rcar_gen3_phy_usb2_vbus_regulator_register(channel);
 		if (ret)
-- 
2.43.0


