Return-Path: <linux-renesas-soc+bounces-22537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 785ABBB1CE7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 23:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FF4A4A8368
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 21:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01611311977;
	Wed,  1 Oct 2025 21:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="GpsvwBXL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011063.outbound.protection.outlook.com [40.107.74.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290BE31195D;
	Wed,  1 Oct 2025 21:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759354077; cv=fail; b=dZPMB4rQgUzh0Qu/DYUc6IHZ+mB+CkyNFE4r8pTsU3Kmo1pEVvL3omoSIc6bhS41fIYQmSAvSUmBh2BWMG+1Zg8uQdLablvQ4Erfxmp1qBDs5saQ9wiv3zzq51AH71hmI1GZK5UjHea15Xju1b3yQJiyqbJ6fZ/YSgjTEWZPHhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759354077; c=relaxed/simple;
	bh=pEtVzoU8tAreTbDVmp9bCpguqdPkc2pMRLUl9ASIzS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jc2A6b+m9p4g+VdyfUKsATAK24o0DUwrG5q4xC2Sus7FJkK1DjkprrY9y38+jtISstsWaLNFSZfKIC8A0y79gMHAQtJ5StZ580E7VbGlZpDGJ0LS9FzDyNy7LM34APdqMajiPeB1n7xewoPBP6O8N9GLLr14ZmOwfX+hck5ytXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GpsvwBXL; arc=fail smtp.client-ip=40.107.74.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hcd3qoNmAHc2wMSp598MEKivHaT+BNUbYlu4w+3bMLxVRjN6MisG4Ac+G+9n+4SfNmJ4sF2UW8W1+cORe1HEztywoJFEuUaiMTO327kt9/hQgNrV8Kg9qkS4RQVaJ9IxrqXAVLjADujLV6Utri97fb6z6FGd8GbgtDHL0ggCjX+aaqj83eUaqarnJE7mLUYKxk+pmlYjhnWa5O2aznefSACBqezj0o+pHwJ6qvTlWUXSJluYRSoX3MTrq5AnPCjgCk59930yIdubzKYlZ5TxIe1RSU2nZ5ixdS/kktsTfDVo7IfY1+dE68SvwWQoiCdnJggojIZ9CL1v/z3BFUaJJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VafCPFSpuyQINg35tNC6g3FL37XyugFSHuyV832Avg=;
 b=Hk0xmOqabsPM6x1pbFEZOZa/nleW7Feu6AY+2ghAdCjgTilJPJADt6oQy1Lxhe38W8onj9qVVlmvBg17kCxf/8gvMT4PuvWNDSAu5kGWzVycs6AURO3kh0/4w5XgPjWXpBWe+BmSsh0mowomLH98G1XaKnqbVQ0bAOABPCIWML/IXP4KxjcdYqwQNdPA/UtGxSxsnmBTdqLi/hJlP630P4QpTk/9rD7ibyIPvHcrFD2ybLnY6Ps12RCJN5IxMsEjmujoV9Ym2RZmBewJvxCVj506g5CzS1DHsCfHiTHylfBgvOfHmU7HQQfR4fAJQpTdaZPFKo0AJ0DEOKtJw3dIwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VafCPFSpuyQINg35tNC6g3FL37XyugFSHuyV832Avg=;
 b=GpsvwBXL5iMxDsfCuD7eQHgG8yRaKOaUpZVWRb8QUPLsZykvOKV1ptqse1va2s4lwA4u/qpapwYrb1jtvPzX5BO1IMnpWP1p6TC5dydXyRWrkCTARHsbX7YjCVjt9Cedtr8OAFYN4imguGB3WufsRHrLWdliE8ur60J6frQ5LEI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB8332.jpnprd01.prod.outlook.com (2603:1096:400:161::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 21:27:52 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 21:27:52 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/18] phy: renesas: rcar-gen3-usb2: Use devm_pm_runtime_enable()
Date: Wed,  1 Oct 2025 23:26:45 +0200
Message-ID: <20251001212709.579080-2-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cdabab4-72b2-4c21-1c9e-08de01316090
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ed+Ox9wJNYKXvR3GaMjrl3NoKaGCadoWThltL4O/FRFgfep7OuLDeGifJ8c1?=
 =?us-ascii?Q?6Zq2LHV9AQhVSrXvPS61vr9lfcUft+2JNSl6vral09rBw04bJVL9xXSpN0dZ?=
 =?us-ascii?Q?Uvhj173d0N3XYoCPuy2oalNQcZEFsgL3MCkB8sb11TCE44c1N+K1nFIq7r+d?=
 =?us-ascii?Q?u0ADzyYozo9yvXoC9I8VqAXVJweJh7ocbdFMYZw2OyRw7fe5XGibBn32FUHL?=
 =?us-ascii?Q?LkS3lf3x22t1+WtlEYDAvt7zRroZuSTzZLiBZpvD7eU7H12MShtBH2lczzJ5?=
 =?us-ascii?Q?Qn148/vvrPSn32sbu5XGhplMp4dKaDkRG/f0mlp4YwQp0ik+S0U+lBaYetK+?=
 =?us-ascii?Q?cNHHinCxoBCUFfKol3I53tN4zdr2y2ljbxzzde2QuUUprFxtx6KUF1IGV5HB?=
 =?us-ascii?Q?eRWDr5iTTRtgXaQyzPKlm14h7HMMi90S7AHqDHjWgKFlNaltaBfE7/eNREiD?=
 =?us-ascii?Q?YLts0XFCmBTJ37plU7m9zHXT4JGxp8QYjot0Kjdal6weX7mvvqP4kBbXDlG1?=
 =?us-ascii?Q?6DmAw3hW1cGsuU68k4sjMNy6U2zH5b9mOMhEEj7pTckHXOeQwa3CSjELV5Lz?=
 =?us-ascii?Q?uw+zbDaSxrawUY3szEobzQ3j8vfzMnGsJkbITmmAkhMZ2zR5wsja64XSZ37g?=
 =?us-ascii?Q?a9TNHuqU+69NVEcjTTjgBh/rMcbKAfqE4HCVxKPXt373shQjxrrna6wbTlxY?=
 =?us-ascii?Q?Fm0GMfcrxYBs1BtJ2/8Fzfs09Ul//t6ejctsig3qFHxO5BptkMyghfiUcIRI?=
 =?us-ascii?Q?07qhRwYTdPWPuYlELpODTM8Euk57DoxBaX8BnJcq5OAPFYr9G0JUOr11bmn1?=
 =?us-ascii?Q?cObQ5OgGw+KdPSoKYGCjvAXRSfKYeUHjLRiedX9Pd1+TYFG3n1lwMEohTsd+?=
 =?us-ascii?Q?gXNioqED+/MrAXE2zMDE7i4nXsYqybI+9W6h7PLsu6cogve/cRRhfMvTKiD8?=
 =?us-ascii?Q?BEXmBvKBYwBb40ha3oX+gmbWgjdXMV4KLskQwWKX0hNud0YWWfzbrl80FhT5?=
 =?us-ascii?Q?qyR4ct+dY/H68MYYKTppuE/Y2vg4sj0soj/j3kbtRZdpBbH14H3/oOI/EwQr?=
 =?us-ascii?Q?iQf7222KAFWrLDjIrsuNSmuh7MDlZ/l+fkkpWQ7Dl4pXDh8fNFp3apONbqFE?=
 =?us-ascii?Q?+TWX5HFNAzYed9PutCvSxrLZWSzY21ISfJzo4kqduRVNMIW/5qcPSestdH36?=
 =?us-ascii?Q?s6ZP01BrzykN98hleK8DvDb7G2N5kb2ipmRlcpLV7LM14fpD0JTYbzzC5DyL?=
 =?us-ascii?Q?1330WcXETOe9ILh37vA5s2mSmcX6rfxkrcuzxwjhDaFvjoQrlZ7ejor3NIE2?=
 =?us-ascii?Q?BPHbuozd2T3lwHoYPaCsd/y7idpIgt7CtpwFcBi5X8iTlbkjCDTPYn2l7B9g?=
 =?us-ascii?Q?6eqflT14yjG1tHhadHCL6C0gnLewH1kjA5embcVjYrcsAx6lDl51d+9/OddT?=
 =?us-ascii?Q?tFjIEOr+p1yIyzNpTQJnO4l4wOplnoKA/r9shwMAwzoKBeOYJD9fOOlEdRIh?=
 =?us-ascii?Q?obsBQPimX5P7GMHccVlC+M3kUTm/WnCMNHLU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zvB1T3n1liXQ3QENP5or7CzONhJUq1pRs+0zY5Oxzl/d3+sWsD/r/DvjsUa6?=
 =?us-ascii?Q?fMGKj6CrwULXlcOEcuir6ntGQUa0T+wQpFxKsPbyTPVwHVE/raZxO57YklKW?=
 =?us-ascii?Q?IdVjOZknQDwcs/qXyw6ru8Ywub7e9r6PHWWdr4GfpP8p9PHhdWRXKe9j58Mm?=
 =?us-ascii?Q?S+U9Dx+crZVGD7ysgkzOPsO+UCQqBwwmT604WJZtkAg3O3cj6D5FjozN7ZtB?=
 =?us-ascii?Q?9SP2wM7b65+y59PmeV/9SIzrpX+fw4k4iraFguRw2s1GW3Mej6mM1psfbcgg?=
 =?us-ascii?Q?MGjO8YGXnI20hXiZ5RX3bwMC9AOUJAM2Yvc0EOuFTzdTm4Efus/ZGvCX7ke9?=
 =?us-ascii?Q?ZDIxRGJchHhRENxbHpbtiuxOnkFtm6EYO+5OQ+Fm/RBSjkow/3occkU/edBR?=
 =?us-ascii?Q?G26StSpwKrOrscYV7Y1zw1XuHsPHTEsZUB3+uNg+nNeLpWXp+nWzgz/qtzZ8?=
 =?us-ascii?Q?WaQXsttIxB5ULcusJUI7w8c442iw1LIMs1pGsJxEutNPQ14yIlkeDmEn9ArZ?=
 =?us-ascii?Q?ny3ON/B4r1Md8nq591kpnG8brMePmm2YkscR6Y/5H/Q+g1jEuvoJIXNJJ5Mo?=
 =?us-ascii?Q?aXKRVhHVLQORtho/Xyry4Onj7XaDvizahRyZgfkFH7tayVdFTmPFurTnuW3v?=
 =?us-ascii?Q?eCpFEg5Zk963fRRaIvRa20CttcdMIpFpPV0jMtCu4/FqFwoy/z9/y/wontPN?=
 =?us-ascii?Q?MLByrT0zSt83DE8ijnWUpv7euQenbKo1H0KaJYRBWE+EXnu8G3dWiA5W4WcL?=
 =?us-ascii?Q?7dbfJiZrR7n1dU4r4WJVkjCttgjIM56dmixugHMoxuNE1g9ARNTGCgTjGiHu?=
 =?us-ascii?Q?QacbKW+czl1QLhA7SCfhIvp8LC1CHFX3jiH9EGSeZSbV9lITxsZ+uKeYik7v?=
 =?us-ascii?Q?tv/j7Top0TKZebyqdqsbn00+i4E5Ia4MN8udgAH+UpiVeFlc5YHFiUvA2sh8?=
 =?us-ascii?Q?bNwCYg0EnEiPD5WM/6/10q0u3xNVrYWneFK0Du3QedxS28ej5YXGWpidXRYO?=
 =?us-ascii?Q?I3D6IKTHdadivPCDNkXOm/kmFgK4Z5F5Pw2jstk94IzKdQ4MZGWMsndoX8hf?=
 =?us-ascii?Q?Izog3rv5r3x8CeFgY9xwGkZDMa7QF6qiXiP6FluZ4Ta7a89ylUT4w0HM8vHt?=
 =?us-ascii?Q?wXjCiBWFHJXc+Of19/bxXtuyvUh/0xlI2U/32PgQIgx8Sd/SYrq0XrNFFLll?=
 =?us-ascii?Q?kE7ocQwMUjllsYb08UVue0GD2LHyNZWAjPSHXDa55w0MvAIhG4ZrBkpF2nTJ?=
 =?us-ascii?Q?x+AKWEUhgqBaM0hhtYSGmeM6v2ckxYSjZqIcAstLyRjW+aiczrwLDWLsSRWc?=
 =?us-ascii?Q?Ad7lFVUdNjWBk77NgKW8oBm0bYtvjB9e4jVrI0DU/5/VoL9UJk8iy0Z0ooUn?=
 =?us-ascii?Q?niObH1PeJZuUu98HdZdS0Hf8SoO+GCFShRuKG+f/JO4BozKCaLlad98JC29Q?=
 =?us-ascii?Q?oQSOS3oCJFXOQw2FJaMNFX5Z/AIenpC4QL9713c+3xe7UcSeEwcKkvKVFTwT?=
 =?us-ascii?Q?r3O+wJNhyvE8sSFkQn6CD+QD1i4ZMn+kS/0bSScy5JlhE6dXp2oxj07xSd7+?=
 =?us-ascii?Q?j6NZJB2DJ07ghfi+t/q+Z2SvqrqGb7uqZxiRx5l4XCUV201B0mSm/e/QbKHu?=
 =?us-ascii?Q?eytxMDCDkgABMTVoM+Jfpy0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cdabab4-72b2-4c21-1c9e-08de01316090
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 21:27:52.1693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5m1fNsSjoaI7dbUbGbPgnU3j9UCwBH3VriluOIbTKGH0jOwNlU58qFen1R/WA59a2obfVLjXfYKLa6kxQtAOVLGz/CbnLGTNoghJZ3xuvPg+PTjhVcgCF79nWENOBYBz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8332

Replace pm_runtime_enable() with devm_pm_runtime_enable() to ensure proper
cleanup if the probe fails. This change enhances driver reliability by
avoiding resource leaks, as the devm-managed version automatically handles
disabling at probe failure or device removal.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 53 ++++++++++--------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 150423dbb1f2..38b49ceb5ff3 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -850,13 +850,13 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
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
@@ -864,18 +864,17 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	if (channel->phy_data->init_bus) {
 		ret = rcar_gen3_phy_usb2_init_bus(channel);
 		if (ret)
-			goto error;
+			return ret;
 	}
 
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
@@ -886,44 +885,36 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
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
@@ -932,8 +923,6 @@ static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
 
 	if (channel->is_otg_channel)
 		device_remove_file(&pdev->dev, &dev_attr_role);
-
-	pm_runtime_disable(&pdev->dev);
 }
 
 static struct platform_driver rcar_gen3_phy_usb2_driver = {
-- 
2.43.0


