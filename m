Return-Path: <linux-renesas-soc+bounces-24381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA65C46783
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 603144E9702
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 12:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C88830DEA9;
	Mon, 10 Nov 2025 12:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AdIvmjuk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011069.outbound.protection.outlook.com [40.107.74.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D047530CD8E;
	Mon, 10 Nov 2025 12:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776549; cv=fail; b=JYTO+yzrC0wep9pnafvv/FtgV3magfMmH/bDMu0qG9FHh8gEn4IfjBh40/oa9SZW6DnIRcdnMvxVcbrZ9wWwoqCAN8VL85ynfOzSdlcEIu2FZnBFRnSmXFWx29xbdmfmoNAm9kahQwN/beLHP0eOhmqcGQ8UZ6SwrvxYqSl1sLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776549; c=relaxed/simple;
	bh=TKPpuVnUezrl/eYme54lZrwuheAF6TB+4mFutlh8WUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cVUUgDYAnoODpZG7Yu03PR7j32r8RJeAfrpcjQxayC0xu7CsbkQRvmDmVHYpkqxQRTpEy4HCM4jrPcXSIzt7eT5ibpEm2mpfvyAh/aQeNPlnQHfen5p9qCx+vN6gAqxGReyuymUrapwP9MuJUg8AnxBgXIkdL113t/W1L5JWtk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AdIvmjuk; arc=fail smtp.client-ip=40.107.74.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAdSguA2Vtw0mEJRWS36OB3l7TTg5AIkRRoKmpQMgrN9HKXmZUut8oIBvU/szHzjvJelpw9oggBosZNpw1MnuzikClxCQl5HbyLiq8UB3LFiE5HB2sVE+54WBi8vG9mWKwMWG3GBXSd0VsHFYtxLQYkVUUi75PVOr7u/Oqk6xV6ud9tuSAl9SN2vLLfuvkxMevpLkZPFmZqLOexhHQeBe0hvVPTCktlzwLnXjHh1Vhi8fjEnoWdl/Gw3bCfnEogdFsQHn497vNGPwz1LFW/ZRNhvFsFN94QvSPqUX3Ugbt07zxVJ8XJPmMLMR1Uj3/m2G9A8Us8hAz4IdeBIyISZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ydqlq1UUT5ysj4bsFQ49jeIy7ipcUMDIhXHqylTeMMQ=;
 b=C/ESsrCiSKVUJGriy0N9LNi6am6wcGSNlve1bgdX62yaGl7TiVWxN7Ghu3jqVm/DnfxrZGQMpV6sA01KGnKeYRr/bzpPDJg1gmmL5jcUK85MMwnmkM6WsqYXwFemn08cqL1gY3iemU5CpLipTfybGh9h6SrN42+B60HRIcXoFniZnEl41ehcrdO371JJvTwOZgpFURP7g1u2YRuJkrEYc9PG4pQpEgA4VAhkrgjFBQFutnuCGTVElPHW1i2P3sHFitY5DYjDhan/f37sU7Fai4uIVEtdyl2RBlJDfBESkIpkMwCLow8EF7213BPEA0c3HzOAMk+XEZvHOFp4FBueAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ydqlq1UUT5ysj4bsFQ49jeIy7ipcUMDIhXHqylTeMMQ=;
 b=AdIvmjukxUzfLlWCyACDjfk8CbSnJE5uBT7UAXrKrVqe7xurDV30V9VslRH4VP9zHQxBV9MCJeeXq28OAA3unhXBxqwKBxD5WNaGi3peLLFYVmcZOW7zxCTRbnM3x/U9KHvHy13xobS93uuHZP9beBsYUohVup3ms2LfY28cSbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8436.jpnprd01.prod.outlook.com (2603:1096:604:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.14; Mon, 10 Nov
 2025 12:09:05 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9320.013; Mon, 10 Nov 2025
 12:09:05 +0000
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
Subject: [PATCH v3 01/21] phy: renesas: rcar-gen3-usb2: Use devm_pm_runtime_enable()
Date: Mon, 10 Nov 2025 13:08:01 +0100
Message-ID: <e2271e27ee8e7939972000c7ef6c04ca558ec70f.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 26265d21-9a04-42e4-017d-08de2051f14b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V4SbhHCLWXIAcMgTvV/uNikXhQwn+eqGUS/1BzDXsoGBrjNLmNFcWOkm7eXK?=
 =?us-ascii?Q?e512uKoa+RtZhjuWEbYmOAtlAYRZtYYUoya7+m4KC0W8btOVad6sGHBNhrQG?=
 =?us-ascii?Q?7bIQVApscbf2gkUmtcJhZgk7oiWSLPJ4yO5+Np+1VM9f3k/i2EM7bhB9JrXt?=
 =?us-ascii?Q?dXk9crd/1cxkNgzR/fv0gs+4K0yRAcMcBwifDF0irgEqxuLgfPIVLEm+RBw/?=
 =?us-ascii?Q?UmeH8IK7xtWQGORGD5ETmiHYqHAYPQP/7bkmHlsJMAbEA91C30fnxtLuAxm4?=
 =?us-ascii?Q?2qhq5EEgk049f5bHAC7RFFLr4BLEQsMh5iBB1cYjRTLPopNRWY3Nipqx9nOI?=
 =?us-ascii?Q?cpLuavOwcv9OBXTYztF9/nNQkl6h5JgZZHl8KlE9WP/IQBabyP3YHHSNRKjg?=
 =?us-ascii?Q?YjOXxAmU+Mhi1RqXeuawQLBW7WgJOe/Mw6OGY21xmf04fXrzRMz2cdLP3gzI?=
 =?us-ascii?Q?3jo1EfWSMJKxAEbcii0xLLHBE7Fv6TNeXSuJkNl908NDjay8BPYd4cye+avB?=
 =?us-ascii?Q?2lRmCVxOXuhQhPcxbYOVw1Xa3HhjMeROlEVPkJ2yZ/1LeMkPtdKGkTOh2HnN?=
 =?us-ascii?Q?C5Xffbn54/rb4oKFwbC7zj2kWfzQyzCL9JYTP5OrP40iOY8xpIyw9LKj0Lgs?=
 =?us-ascii?Q?XbulVnwM40bIyS5NK9FUzI4GSTfecdwdsiinrfnjx44n3AJ97ceLDH6VQduG?=
 =?us-ascii?Q?738BlrlF+HX+6xX80dchuHdY3Xs7J9SFKqo7nQEBP8uDrT9Dfo8WD42J7oTU?=
 =?us-ascii?Q?s2OT9mFJL2M4Yfd8RPEgF5jCRGpjufJpiysozH2g8EwqWzyARjJNRbb6es2P?=
 =?us-ascii?Q?AFp7O7ARmmyA8f+XZ/g9Qf+o60oF8XoAnzaoGk+vAN3koQzRwjKKxKYuSu5t?=
 =?us-ascii?Q?IGX422TTlaAS8Yyq9tsJvnIkAx9P943w0IUEETwN8r8MpNT3QnXD3++9e/K3?=
 =?us-ascii?Q?65IjuXACZ2n1UZk8HYCrb3oD7YnIDPHq1zXyi+B4seL3X4CjFwR6LDl8NxTu?=
 =?us-ascii?Q?7ewP77IbvK+U8kXXO1NaiZHFMNcHGUBJ2jJAvlWfCFIEpy+QWSaaQi4/wh1Z?=
 =?us-ascii?Q?c/0C7s/+AU57HHWnShaDJl+wSDy1T1VrOJqAdAOkmKm8DT5eMfvfrr40nkol?=
 =?us-ascii?Q?LgKzOEFYenuGLdtfpG3CvB8qqklqJvgak7HSqKMRW9foq5+jtUXSJHkzbC45?=
 =?us-ascii?Q?Xvnsmongt7h0KpR4H23R422B1tHmsUNm48LsnISWWk/YnvLaNL1sgBhwDtjw?=
 =?us-ascii?Q?FnmenMu3oyiid3+l49fiu33qRBC3iFLslnkmtuZJk72owfBDdnTkZe9keBhS?=
 =?us-ascii?Q?tcjRunYtkfTEncnW0MxspVMCV/26aDMb6yUKsna6QTa0kPX850FY5PrjVnFq?=
 =?us-ascii?Q?1J4P0WNqboSpUErhzFJWIMksW63Akk73dLOd6vZaXiS+0BoQRQXx0GsMIvx4?=
 =?us-ascii?Q?1XhG5Wp4gYZ4BfuPLx38uhSV7sSht5fTSSXMB53tz03Z8PiKWaETcLbMdcha?=
 =?us-ascii?Q?W/KN5+BHeW3/Al8aoD4/hMcLA2vkiHnKpeuP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0wMflxa5RmzcskHqEP1e1ws3S2cgQEZWi7IR+qoHFIn90lIFU+Trwb7c4XGj?=
 =?us-ascii?Q?lz4zvp1odNmmde0ZJ/kwyV7s4/S5RKVRGLT266MbpjK9TAN6xt8S6+/qnToE?=
 =?us-ascii?Q?7EDHE0MFSoaVQipepfyfvn9Iid05QtdOTrgBjRyH3bq39DFco29hRZH5Kx23?=
 =?us-ascii?Q?PYjZenwuampzXAKSGCa4KgH+XO9u5QjdsxDbrhKBzC4X9bLPGyyK5tzXIZMK?=
 =?us-ascii?Q?icIrzUntyG8tKBamYIVLvG1OJOHjEZUNKgt9mztTJT4+HlKcfatzTDjbV/kv?=
 =?us-ascii?Q?3IvKVnvvkL3ju5lfOUHCUA72F5i3ERrrkB9GDUOkGdqwHfhBPfEt1Eolb7yM?=
 =?us-ascii?Q?rthZdJqA54XBeR20iDHXCL05t3F2gYkHMhBBpvLhdNuH7lqE+53CO9+rH8Y6?=
 =?us-ascii?Q?3hxg052rB9qTZ0E6aEOSratw01b70qN3RgWMU3OkXLOSEi3UA8Y3yuoPQEOM?=
 =?us-ascii?Q?QbjIyEtN4YDi4+x2U9qj+TF57NodYlof6b9FKXCGk74HpAURFXCZPgT5xmyc?=
 =?us-ascii?Q?M7FrSoeF7YBtAAUmO959/rvORLGx11AOUsajNJvgDC0t16e/n3p7uqAS4Mta?=
 =?us-ascii?Q?cKC9ZloYsjpE7T5AXlpjsFow/UJXfJucEY5ZnQfX1KPJhf+AWGmtxNZ0NuTn?=
 =?us-ascii?Q?BppyUhN8dFsTzkH/5KiAYsM3Oy6sJgpjIShHKJHgyna7NmksuwTKEo/3RxPR?=
 =?us-ascii?Q?Xhb+MFUzdp0GJGGcKnGLJ0iWZnm5iuGTWkMOkvmUFGZdzD/NIFqPQnFme8Bl?=
 =?us-ascii?Q?a7yOfjld14qgvG4+fT0wwTuqqQms4iaB9soS9NPaBeBlQgMHR581/Y533E75?=
 =?us-ascii?Q?skTBv9oozGWw0JeIa5F2JnTuiPygTGLka3o70xccBrkrLqJtJNdYvD/oeXaA?=
 =?us-ascii?Q?auY7UZZt3/9Mt7LLLs32sT6UcwmWCBrChopaFqbGESD84HQ0Wkl426NO+SVt?=
 =?us-ascii?Q?to/ne5WtIJLTuCtppYXQez++7102OPl666Y8bpo5n1fsbH4BXIYTE3AKvwr9?=
 =?us-ascii?Q?S75SGZQnixibsQyASuZa81ODd8SMiiRs+nZTvStGXk4diJU7K9tXpJLFfLr7?=
 =?us-ascii?Q?gfve9sfjJ9MO1BCNpUS5J9Mo7YZeH+udN/A1r/ZpxIUlQBpBHXPxpOJiJs2h?=
 =?us-ascii?Q?sfs3fTXS26mzxPuLGEPxgLtwUXBfWtK+FBDk17rvmi9GSp30NWaWsYgnO9LM?=
 =?us-ascii?Q?DIJiU9xLknffPl410B7Uz5CL8Sl6dWuUb7ZZt7aH+wzfJXQmKs6xfo84frLh?=
 =?us-ascii?Q?yq34umKWg95rP70GrqQ2hM11ZffEHWyYhrF/scgpnKkhWF9B9/yGtm1hw6e5?=
 =?us-ascii?Q?wY0mjCaeS/AD+XeSSk8dH5XzGsA/aigJHWNBBab+CMM3AJp1kb5ToehDISUM?=
 =?us-ascii?Q?z7/cGj+9EpqDZEDMqFfobBK/u7J5GQ+YqAAytke3bDQVOJxgsdw+P/OgI//N?=
 =?us-ascii?Q?fk6+Ch56LI80TVz3Bsg5jG1lsL/CM4hB1lKBqLiWpDtRDxlctjHC/V+vRCDX?=
 =?us-ascii?Q?orZNfccQ7sOwuah22/U7WXwwd2g9IiLMPrenwOcfQc3QY4fApCuvcM3N1GeQ?=
 =?us-ascii?Q?IIZ1nj0LUivXfhCgWFSPG7Nl1yXH9GQh93EIrQleUFeMf/MAcrKrsh4YMBjf?=
 =?us-ascii?Q?ayp//xivX9mCS/kWZPCfM8o=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26265d21-9a04-42e4-017d-08de2051f14b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 12:09:04.9071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0szynqGW0YsOQF1K2EDaxdeqLMbbzGJNa1Rm3nuBGY3UiwtfmsKn90Xb6DpXc2j+1AvCWFD40uKkmytVtMuv+GkcXMsWYx6/3EoDC3F3Bbjc+qJe9fMuO10RQD6hyCw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8436

Replace pm_runtime_enable() with devm_pm_runtime_enable() to ensure proper
cleanup if the probe fails. This change enhances driver reliability by
avoiding resource leaks, as the devm-managed version automatically handles
disabling at probe failure or device removal.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - No changes

v1->v2:
 - No changes

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


