Return-Path: <linux-renesas-soc+bounces-24162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E33C36864
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 16:59:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D77C7502973
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 15:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91062333751;
	Wed,  5 Nov 2025 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DDfAPcTC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011057.outbound.protection.outlook.com [40.107.74.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5FF330D58;
	Wed,  5 Nov 2025 15:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357272; cv=fail; b=C7XzTxd989NIESnHR1BDq0pEUO0BZ9+lix06Ha2ayPsjZs5Q9W5uZ+QZbIndnRsf1mmJC6QWQj5WgFYIZVpTRuDdKa86+Q4uicGMm3b5TtDvhgPPMu0aNYlWW9kuVciTSRERXl3C3SbVdcnsRM25KoJmNTZzquMfRzX4fD4A2B0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357272; c=relaxed/simple;
	bh=ebhSjFM9eHyyifHFNW3KK9SJWIBn9GRJ4NMZIggVXR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vu8xCTcO9Kp6oe3M11TYvAkoJVsy6B46itrV35RLPth4wljta57J2xrjBgoVo4/nF+W4OrOlsNz8VR0kiTO17uidBfPiQqTqtCxkGE0Xw+7t40xfkmKm86XDwQ03hPHWjhcbvlxS/l9hwNVCt07m7XlSegtP/sjvmqtTDJmnvbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DDfAPcTC; arc=fail smtp.client-ip=40.107.74.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndy1Ublokorsyb86slkT9YVI+77lx4ZHNFpQ6Q/hYHZMiT1X88rwWmWLpwbFOcnLK1t19tPtkL58B/SfPtW7uWxCnfLGRSTosMfnHmTKT2ykKHjouxfI6zZDt181b9OIPJ9dRb97NEHf5XxBGn7FrqxOBPG1WJ0cRTx8is8b0aKWdA932SbHUFvPo2HpYvg51+E19Ok3balKeexCKskcMz8Mrf2HjjnY4K+LwMLdit1/CkDUDutJsjT2VgzrWHrYt6R01fjhvHi3oeumNZ9stTH2kJbBX7hNbAoa0V7cEhd13RF/+HnbQmJ304BMkBoE/QWEbcc1St9BqazMAg734w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOIlX4VJ3NmwUtKM6msU2x9PfO94TT5UTKA6dO4Qfy4=;
 b=jXnhiFmaDeb7TiQt1QlakDopWBMmQ20ZFfDLowQRtrM3AUlpe4uJdtClCiy50FZA1q00Wm+GxZv8jI4YacSAun1jAEpX9BTpMiS/oyHHSaDy9KvHN5WJ8g13Xdfc6eE6RGRb6iB1roRKfW0wTW5fVuCiUk9LDpnRLyIlJBGjU70bGCGJBCpYW97hW6PggCBIsFYB+CwNW1TjnHt1c+maKn1roOuFuPv0J+HMoyYeLDBhn8L0F1Z1oflLIxuCYs0oNvkeNCFrJeUmVeumpcCSuoD7jAt03Bgfj0q7yPJjFVTg7jTYK5HGk2vZotgIiL5bEAPu61fh974U+rOaciziHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jOIlX4VJ3NmwUtKM6msU2x9PfO94TT5UTKA6dO4Qfy4=;
 b=DDfAPcTC34XS5ELkK6sC0Ok8VdTaoT8Z5G1M4BYaizJNjaq0DCDctMw9beLpd2QOX4bcVhyoCghjXO9qgrCVCLLWvYBuUnSh0bifW/JF9mkyKEEGE4qQtIGC6sXGo7se3W5w2zhxrTaW+HmMx9qES+1OEY6N+bWYziwC6oClWd8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11268.jpnprd01.prod.outlook.com (2603:1096:400:3bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Wed, 5 Nov
 2025 15:41:05 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9298.010; Wed, 5 Nov 2025
 15:41:05 +0000
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
Subject: [PATCH v2 09/21] phy: renesas: rcar-gen3-usb2: Add regulator for OTG VBUS control
Date: Wed,  5 Nov 2025 16:39:05 +0100
Message-ID: <4311f9ce5541bbf86310b09e3ed1bfd2479dc32a.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB11268:EE_
X-MS-Office365-Filtering-Correlation-Id: 395c0dc5-3d64-4a3e-9eb6-08de1c81bb7c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bh/EdHF64yJggFzYwwyKPV5m+PCqQh2DxExWJXmgbMHQI4JOGEZ1wFhi3uEi?=
 =?us-ascii?Q?GDKzwhdiBHCgh4Z2alDCxBnScFyhag8avTEk7lCWlYsXCe13KvEPSMmGjRuK?=
 =?us-ascii?Q?YqEGOmz/ZrzPKBGU2YUjQyN1Z8+I1AE0bMECD1A+adSVfDfOQWFgUyGbJYny?=
 =?us-ascii?Q?Aq7YFq1dlWQHP7+XhqWgkXT/LX+GeH0dykqocy+AwXyYDmtEIyyjO4ZP8+gu?=
 =?us-ascii?Q?i1kDXsM95HelEe/9cFtk30rh1k7HPfUcvnL7aQrlRQ86dUNLOfZpyzEnJJt5?=
 =?us-ascii?Q?2eSzkcZZR6R4GTUJ6ZK9xGvnji01THuIdzO8wQ+d2QqLwpPnmsnBi/RIhxmN?=
 =?us-ascii?Q?d4loRHebZaeTOR2FFFdGfCUw3HZeGc/A0IjH4hPbt3xg3eK8LGJnzbIEg9bY?=
 =?us-ascii?Q?x7ydzUtG1G4ObjxrDeTwnZNwDQcjn6lIksmT1t9xcFfRCeuswZDK/HTYdlUe?=
 =?us-ascii?Q?Sr+mGsQxRmvPDEzYiURlVP+cIjDifNg/7fykKK7BO4nwdnUMCCIrRfmeliTv?=
 =?us-ascii?Q?uVBqjTgV7vjh01BIuWguCFMAbNvfQGT69kF53WtB4+jhKT94rsBjRZ9bzcEt?=
 =?us-ascii?Q?t6+glTpBx2wG5STv0JzcjuF1fO0tNKAj9oFtctEA53MBC01AEE0qQUp+WY4I?=
 =?us-ascii?Q?6KyNaaNPicLGFshv+u2R0+hK7WsvQFD2fCZUW5BoWGGuDIPhvD1X2gUcD676?=
 =?us-ascii?Q?dMjInaTC0+13M2YqdpULlxPck/IWq2YiUlcz6GvGi0KW9tX5WNzl4UHWFkGq?=
 =?us-ascii?Q?kBk/Ts+m1ZuSE9rODAEPuv3IyJwvG0xjgIZctiCKu8SmXbCsW9ot0vcZU83A?=
 =?us-ascii?Q?SFYGF2Ju4PiXst/J8nc8dlPYhDdcIoZdlHySiM3DFPf0q3cI6UyFZFh1eQCn?=
 =?us-ascii?Q?6GaS0Ieq1MsEDmGrsfWodAVfBb73jVSXn2cpphJqLxTswsy0L0r8nkZO9Ygo?=
 =?us-ascii?Q?bUrzuFsIRdQEYjEEnux09KAmrC6LOCQo6ZQps6h0wRSryFT+tjbZ/2Dt7APl?=
 =?us-ascii?Q?0GXPvDCjOHbzEWxA0HHukiyzR3vssaA0fijh1vazBv/ibb4j6GtMg3o3nelj?=
 =?us-ascii?Q?/tfWXfRAnd9kKPcqpBvNS0J34E8443wwbOvlX0G21op6jSSy8BGU0DVctvhO?=
 =?us-ascii?Q?QcN/b4tES+LYQXx6rqSUmhfTAbrvEkMnpKz4LWQ5lH/nV6ZlclcyGRsn0vBF?=
 =?us-ascii?Q?i+OVLdA9gR0PKappg4Z2gLTmIMRf1KY91+8Gapkib7L7+Nbl5atjei74jTR7?=
 =?us-ascii?Q?TRE0+9ssWUQo4CKz8BF1CtVTn9xdCWnQou+XaZW5dAzfTOe3GudF0/rbZjef?=
 =?us-ascii?Q?Ovb6dH6nvpNUMIYp7rsvkfYdzDGyk0FikGmwTWF99fWVNZPFb+XdSVHu9U/V?=
 =?us-ascii?Q?8jMQEwXuEdqWrTiSgMFqOd0rstECXO2O2M5IcdC3bCrWSfqwXJDzNBDYZdMe?=
 =?us-ascii?Q?j2j4AqJ2ArQlg32LDxwOVDU4uQD1do4JQEt/gGvf5mXBCoBYajzAOtqCxdgL?=
 =?us-ascii?Q?Gp1rS44j6Gnmrk7EGR7RLaryxFAZK7VFCtW5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VZYY63V/H33oXu6Ca7TjN30P/mmJnN94DK30JnEo81NnS1UlBScrA0wJQzwL?=
 =?us-ascii?Q?glzRYpH7lt9IjYkG1DAxIMIhuKJ8Yg3b0lJXgv+sAWrzZEaI4ViNEgzxe+K7?=
 =?us-ascii?Q?PvuKQ6Adcu4sX5XtwX3IdCkoqZ3djz0/Az7pnwpwNxnquOUVSojw/oTHetNz?=
 =?us-ascii?Q?3E28ZMqyavgJXJXFDZijSSxJuTJzoocY59AEVGaMMbAyxaMGOiV84nf+AG/I?=
 =?us-ascii?Q?UA3/mhFyvd/JIyPZy/vwwPxntYoXLtoBWU9lEFSMLAM3i9jDH4xpUMKQekZc?=
 =?us-ascii?Q?AY1xfbCgEIXtjOdIRXdeWhp8pndojlQ8IlbUwAkGJR3ROarGMILLjeHQEZNz?=
 =?us-ascii?Q?QpcWKoYz5rIBJGvZpRed7M9FfTrXZODNyGw582zFlgkvDM0L87r3JV0bqHYx?=
 =?us-ascii?Q?z+j08IuSavWyP9/3zDaBuxQuKyHFjyo8PEKYwoBvrhoHJr4crFtcbOjeATWw?=
 =?us-ascii?Q?djlpMC6KGSks2bJzmlmJOfXlnDuxP4BkP8K3hOCYl+O62eCuLvbyKmJuC00U?=
 =?us-ascii?Q?fLWPIwqZ1gDElQ85K5fTf85ejm/rMw4pzs86bxwN8KGL+XG+G9t9OKua0xtl?=
 =?us-ascii?Q?qvB71gk8UiPw0B5TXIDjJknr8Q89xs9etoOu2y0ejrRrumRp1KlhKT4O5Gev?=
 =?us-ascii?Q?Ezviqm//9U3sy6jCETg4nluc66+ZuP66sLABuLaGa1ZvO0zJ4sEM8FvUkBkZ?=
 =?us-ascii?Q?2LvNIQD0dfK1NfDhiEzJYbHKhieBeGVNRce3c7XJOo0VUC+Zq8vTfsWzFNjk?=
 =?us-ascii?Q?e8rkwPWcFiSe4/nqaH5oulnK1Xqdl4/kCD60PyxL/K6soapg5m+9MXIOvUtg?=
 =?us-ascii?Q?2Jl6qKEUf2taCpnWrT+mA8a2zGFsqsKWLEv0V/loRKl2hqTnIN5v8vRU97nX?=
 =?us-ascii?Q?xVA9dUJ93khKQ6xmOlmTQFwsZcTL8ACbWglgpd4zUF7SRmP5CaHbNDjnDe5g?=
 =?us-ascii?Q?FwFHMQ84GRtLvxs4txWmxJrrjfg8doAbYxywhYmDZmu7CkBtBAPCw329BDBV?=
 =?us-ascii?Q?3qVUihkHEY+liGCIn6qqMObcfxi4yAyOVThy9/VvjL96kJUrX3XeosTENMqM?=
 =?us-ascii?Q?8FQ60MvMlMCPICjlXVwi5oWyvWVt/RdfDOlXfZnmX6DbGXvOS1BGVwxlxCOM?=
 =?us-ascii?Q?PgE5x0EWT0q6T9Pc77plKrqCq7U8sdfwlrPH02JxfWUkqGWXJW98Owo4g/YG?=
 =?us-ascii?Q?O0pbqDEOethgVrVPjw0v3aVpNCBovk0FzbSUpLsPi9IszgZdU8jOiCRougre?=
 =?us-ascii?Q?Tlav3EfsIWQTEJNG0cC9LOCpvC57ROWRuBuEGgV9xdSIExwrr2vn0UtwHeKB?=
 =?us-ascii?Q?/HakUZhVzAn2U9yyAbSrdGUJa9lqVsCKT9lCLlz0cIr0tVg0zXuEceBrISrm?=
 =?us-ascii?Q?X9MqyVsPyTM+uGzAYDpawXoDFRElGTky+XecJUd0JMGS5qudwoMdUPecu1Bp?=
 =?us-ascii?Q?Mv/QJXftdR1Fq0GFNvV+NVxtu9q69pbOzisjNoifi47SxWq2CC+e2sO/StRT?=
 =?us-ascii?Q?i93Ao9QznSHLPkL679HFLcHdAQ8oOoqmlnwQdAhwvRGRHC9dGvMepvK9XwFV?=
 =?us-ascii?Q?nOAQz0WWbx0cDzO+tZLp6cJZlum+Bs+eTBwJAeMj2DsbskodS3f5YQPtM/oS?=
 =?us-ascii?Q?sWIsOzrRdsfHUijaTynyosM=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395c0dc5-3d64-4a3e-9eb6-08de1c81bb7c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:41:05.8213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKC+j9q6gDLcwBtPpp3KNJt9LICAgTvIFyL45M9njefY4TBqUVdD1eu1UCF0I7hPiUPuJQISnpJpwNM1Q8TetCn+JOzbWXy1lCndGoS6fHfyeoJqLd+VVXd7xphcM9Df
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11268

Enable OTG VBUS control on R-Car Gen3 USB2 PHY by registering a regulator
driver that manages the VBOUT line. This change allows the controller to
handle VBUS output for OTG ports using the regulator framework when the
platform requires hardware-based VBUS control.

Without this, some platforms cannot properly manage VBUS power on OTG-
capable ports, leading to potential USB functionality issues.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - No changes

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 142 ++++++++++++++++++++++-
 1 file changed, 137 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index f6026b3b95e3..6424fce18705 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -22,6 +22,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/regulator/driver.h>
 #include <linux/reset.h>
 #include <linux/string.h>
 #include <linux/usb/of.h>
@@ -140,6 +141,7 @@ struct rcar_gen3_chan {
 	bool extcon_host;
 	bool is_otg_channel;
 	bool uses_otg_pins;
+	bool otg_internal_reg;
 };
 
 struct rcar_gen3_phy_drv_data {
@@ -224,6 +226,11 @@ static void rcar_gen3_phy_usb2_set_vbus(struct rcar_gen3_chan *ch,
 
 static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
 {
+	if (ch->otg_internal_reg) {
+		regulator_hardware_enable(ch->vbus, vbus);
+		return;
+	}
+
 	if (ch->phy_data->no_adp_ctrl || ch->phy_data->vblvl_ctrl) {
 		if (ch->vbus)
 			regulator_hardware_enable(ch->vbus, vbus);
@@ -592,7 +599,7 @@ static int rcar_gen3_phy_usb2_power_on(struct phy *p)
 	u32 val;
 	int ret = 0;
 
-	if (channel->vbus) {
+	if (channel->vbus && !channel->otg_internal_reg) {
 		ret = regulator_enable(channel->vbus);
 		if (ret)
 			return ret;
@@ -633,7 +640,7 @@ static int rcar_gen3_phy_usb2_power_off(struct phy *p)
 		}
 	}
 
-	if (channel->vbus)
+	if (channel->vbus && !channel->otg_internal_reg)
 		ret = regulator_disable(channel->vbus);
 
 	return ret;
@@ -819,6 +826,128 @@ static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
 	return ret;
 }
 
+static int rcar_gen3_phy_usb2_regulator_endisable(struct regulator_dev *rdev,
+						  bool enable)
+{
+	struct rcar_gen3_chan *channel = rdev_get_drvdata(rdev);
+	struct device *dev = channel->dev;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_warn(dev, "pm_runtime_get failed: %i\n", ret);
+		return ret;
+	}
+
+	rcar_gen3_phy_usb2_set_vbus(channel, USB2_VBCTRL,
+				    USB2_VBCTRL_VBOUT, enable);
+	pm_runtime_put_noidle(dev);
+
+	return ret;
+}
+
+static int rcar_gen3_phy_usb2_regulator_enable(struct regulator_dev *rdev)
+{
+	return rcar_gen3_phy_usb2_regulator_endisable(rdev, true);
+}
+
+static int rcar_gen3_phy_usb2_regulator_disable(struct regulator_dev *rdev)
+{
+	return rcar_gen3_phy_usb2_regulator_endisable(rdev, false);
+}
+
+static int rcar_gen3_phy_usb2_regulator_is_enabled(struct regulator_dev *rdev)
+{
+	struct rcar_gen3_chan *channel = rdev_get_drvdata(rdev);
+	void __iomem *usb2_base = channel->base;
+	struct device *dev = channel->dev;
+	u32 vbus_ctrl_reg = USB2_VBCTRL;
+	u32 val;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_warn(dev, "pm_runtime_get failed: %i\n", ret);
+		return ret;
+	}
+
+	val = readl(usb2_base + vbus_ctrl_reg);
+
+	pm_runtime_put_noidle(dev);
+	dev_dbg(channel->dev, "%s: %08x\n", __func__, val);
+
+	return (val & USB2_VBCTRL_VBOUT) ? 1 : 0;
+}
+
+static const struct regulator_ops rcar_gen3_phy_usb2_regulator_ops = {
+	.enable = rcar_gen3_phy_usb2_regulator_enable,
+	.disable = rcar_gen3_phy_usb2_regulator_disable,
+	.is_enabled = rcar_gen3_phy_usb2_regulator_is_enabled,
+};
+
+static const struct regulator_desc rcar_gen3_phy_usb2_regulator = {
+	.name = "otg-vbus-regulator",
+	.of_match = of_match_ptr("vbus-regulator"),
+	.ops = &rcar_gen3_phy_usb2_regulator_ops,
+	.type = REGULATOR_VOLTAGE,
+	.owner = THIS_MODULE,
+	.fixed_uV = 5000000,
+	.n_voltages = 1,
+};
+
+static void rcar_gen3_phy_usb2_vbus_disable_action(void *data)
+{
+	struct regulator *vbus = data;
+
+	regulator_disable(vbus);
+}
+
+static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct rcar_gen3_chan *channel,
+								  bool enable)
+{
+	struct device *dev = channel->dev;
+	int ret;
+
+	channel->vbus = devm_regulator_get_exclusive(dev, "vbus");
+	if (IS_ERR(channel->vbus))
+		return PTR_ERR(channel->vbus);
+
+	if (!enable)
+		return 0;
+
+	ret = regulator_enable(channel->vbus);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_action,
+					channel->vbus);
+}
+
+static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *channel)
+{
+	struct device *dev = channel->dev;
+	struct regulator_config rcfg = { .dev = dev, };
+	struct regulator_dev *rdev;
+	bool enable = false;
+
+	rcfg.of_node = of_get_available_child_by_name(dev->of_node,
+						      "vbus-regulator");
+	if (rcfg.of_node) {
+		rcfg.driver_data = channel;
+		rdev = devm_regulator_register(dev, &rcar_gen3_phy_usb2_regulator,
+					       &rcfg);
+		of_node_put(rcfg.of_node);
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "Failed to create vbus-regulator\n");
+
+		channel->otg_internal_reg = true;
+		enable = true;
+	}
+
+	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(channel, enable);
+}
+
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -890,10 +1019,13 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		phy_set_drvdata(channel->rphys[i].phy, &channel->rphys[i]);
 	}
 
-	if (channel->phy_data->no_adp_ctrl && channel->is_otg_channel)
-		channel->vbus = devm_regulator_get_exclusive(dev, "vbus");
-	else
+	if (channel->phy_data->no_adp_ctrl && channel->is_otg_channel) {
+		ret = rcar_gen3_phy_usb2_vbus_regulator_register(channel);
+		if (ret)
+			return ret;
+	} else {
 		channel->vbus = devm_regulator_get_optional(dev, "vbus");
+	}
 	if (IS_ERR(channel->vbus)) {
 		if (PTR_ERR(channel->vbus) == -EPROBE_DEFER)
 			return PTR_ERR(channel->vbus);
-- 
2.43.0


