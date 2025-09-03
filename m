Return-Path: <linux-renesas-soc+bounces-21238-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E57A7B41874
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 10:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A27D53AA75D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 08:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD632EC08E;
	Wed,  3 Sep 2025 08:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cUs4k13u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010003.outbound.protection.outlook.com [52.101.228.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB932EBDDE;
	Wed,  3 Sep 2025 08:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756888116; cv=fail; b=Ikgf8CPNDc2g8esMp0ghSFgYtRylOmiOAMpooPQ7WmWJDx6qjQSlxqKs/JPmrSnj9HdsRSLTEQc19EqDcXLps74CJT+EWmMtN0639+0KLr7q+QtsM2GlBCpbzBnezZgM2DnK7spH+w4dzsFv21D12cf8Phv0palWt4ISBTeFy3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756888116; c=relaxed/simple;
	bh=bjrh8H472uFl71DY0cjpnpnWSyGXEPjO2viCs9T5ZNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A23nepJb0WGIdEYQpSbx7AjlUNF45r7BVgglNclvsS99y2NZCNR2nFhbPU51a1OVBCDhEKtA4Oi+oe977VDFqD05DnyOICVFH+YpGwdTVOnwXu1jmC3cITTjx7MoP/PbGDXG4Nti9PpzRc1CZjfrYmC8ezIEE+7ikI3EaqKBZvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cUs4k13u; arc=fail smtp.client-ip=52.101.228.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJ8GXA8+dXxvKJPV0nK7gidCisby1XYpnrs/7XHsv8COmYjyeF2GWN2m2TKwDM0e2j+DOVIOYaRxe6uinlx9uvTgjBlEvRGKjkiuP+zYbTPQMtD2mlqFVxoACWUDgnX3sKMs99LQMebf7f2L2wEiua+b20Qq+MGT5gvAjsOxg84DEw8x3LGJ2b8XQZiy0lWYK63IDxrN62QXwMHZxb2XWhGIvYIZ86wqTa0ehbHsTlVt2arH1CNXGdZv8oXjB4GE0MYiZcSOxhDJTHBNX8FRX3az9AtmdYeaTpP4xPMt7TlPHe4/AxfLEJMy8LBLRwQwKNHUPAlg5SBoN9+DOZCuww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJ9cdDJC9XlrXrpcduxhMhx1O4RqqbvdEYIj0qAlBfA=;
 b=R/6glz+2Mjr1xA3zeGlUFRSxUTDpcW6AyvhKMz3G0G7uH6jgdpgCR7Tmd2CQCWTasMfFFk8LrQLJcasq6ONAS0rAhg33aJgbX0vGHJCsqBN29OpOIZ4CtMBtdnoeP4O9KKW1WQWwWZcod1hZYh8oDYRb2n8A8Wc7PtKT1ekkxgv9X/KnaFIaAkZ41nt0+cFv7xFjxmm5NZT0DX3v0Ko7srVSubPWxrgnM1xGX1ud9jAqUZKKDwY5ghYyHZjz4XUflUYqANPquuQ/hnhyDvtxOqPsYrNshkJ/BbmAzNdII6+j2VPTuHMRsM16V+nkp9vRSK5J1Kq13y+Ip24Igs6JqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJ9cdDJC9XlrXrpcduxhMhx1O4RqqbvdEYIj0qAlBfA=;
 b=cUs4k13uyycFjeca25Lb3E61Y5srwIUFHvBENcAneSSJvGkjzOppF5dkVDqAGc9EdrPNEh17xt7SPowXwGP/EW9JtvVt8PZfqq2Z5A4vv+uytg6qVwQ82h+YW6AZG1Fs1pC9oVP9G7G9hMP4xk76nVeYVl+5KP38YHIp1j/k2bg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB14678.jpnprd01.prod.outlook.com (2603:1096:604:39f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 08:28:32 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 08:28:32 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] clk: renesas: rzg2l: Simplify rzg2l_cpg_assert() and rzg2l_cpg_deassert()
Date: Wed,  3 Sep 2025 10:27:50 +0200
Message-ID: <20250903082757.115778-2-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903082757.115778-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250903082757.115778-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB14678:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b12d9a1-9527-48ca-140d-08ddeac3ddc6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4iVacUxz7bj1rydFy3wrBkYhNjs6JJp82H6J5nGzBM3PAmU9NYPP6KjDe5j1?=
 =?us-ascii?Q?yowtBDdf7xjQQ7az2X7QqJN8CuPVRRddwmxh2fdGL+QNZkuv1FutbGoR0282?=
 =?us-ascii?Q?Gyvkpo1BTnonqH2k1rG9mrp16vLKj/j2Y8nsPpQ+DS4QWIJN9JZpnDqKIOPU?=
 =?us-ascii?Q?hqA5GKcivf+yx6+4e0meIJ4Ij10Xzlwzb+9SDdl2tAKropW2jhxajNgcq72I?=
 =?us-ascii?Q?/qHr0LItUS/YAzhsjDcRJ909in/+QIEPIPfuaCHB9N7fH3Gc6PFsVN0w9Tmm?=
 =?us-ascii?Q?AHNHDUeTcRNQ8iCZ6Krr4eOGWzpaQ+TNzmjkII3gfcczP1EG2BwGXT1aejyP?=
 =?us-ascii?Q?gkaqRM1G8iv6w2M5Zf6XDkW8pbUqYNIB8CgEtbFp67kcFtFbMk5QBLhCBEof?=
 =?us-ascii?Q?Ol7x6oFfl4SSb2LGCGIPV7eTkABUMp8KDfQ+RarCBkvMgP1gUtBY99uKr4Wp?=
 =?us-ascii?Q?XFlWr2u6H7JeEFg6/YTQwZ0sjmJRfBkg4vc5U9Khrd+GC1VYLd4henwi3WAo?=
 =?us-ascii?Q?TWHvpZ26IliBESyNm735R+EVwfNZJjXityeRo/wcZ9RxwBTRip5XfT0lzPLX?=
 =?us-ascii?Q?dBmPz+Jnqs03HF8D+4wUnT6xB4hFHSHHxl7+Fybv/9D77hSwTbKAyWM8gIWL?=
 =?us-ascii?Q?5lLNfv/9KvkllLCHkRGxkjiA9hOJNswX/EsgVYu4XjimT+o5U6/mMBfHz3KI?=
 =?us-ascii?Q?obQxxECfCX/Ffqb5+/fWIRHwceeJ/BKydFkJWPSnzAQ/ClwGdLkK7UtQjnsM?=
 =?us-ascii?Q?3CvlVZAWFogTi6DG2W7rDDL71u5oNULT5h7t81VoT/6qqrtu7R3gAD1EpupM?=
 =?us-ascii?Q?wvyW5rC91lD4r1gIzWDjbMePCtomMX3hf3INLBpfZjm9X5xXffqAsOxUpbTV?=
 =?us-ascii?Q?I6wIb+PpaNUQPzxRTTViUrfFy9SscHko9GAFhoX+8sfkRoomFASBrjea+jCp?=
 =?us-ascii?Q?IlFN9Q5kBxFjks70IquOC4v58ppsbsMUVaT+NWmvHqxAOnjDeJpo3fpVfJUu?=
 =?us-ascii?Q?iPy4q+rBpm/3PSWw4It1KwbynMxKRUnXvoFXZCdLAN8lCtX+pdQxrAARYxVJ?=
 =?us-ascii?Q?GbO52TGRU38K43UnzkQrfdgaSlerFVqS8P7xgYa2tpT2sKNJepZJEfAp2HLt?=
 =?us-ascii?Q?NHdYmuER0MEZ+uuGHOSKRWmH+PJp6K6d2T6Trnb2WMxqH2BoIw8fnBibyb72?=
 =?us-ascii?Q?rmaqxutOVJmVZYD25MFpEirSfz8IBsVdU467j4SGwa5z5DfQ4hrvw3XXeBFN?=
 =?us-ascii?Q?ydi/7pVyPCcAq6vzqTaI/sq2EM2G3cwqhWguckl09edARHnz1fZTqHxf0ydW?=
 =?us-ascii?Q?l7zUHGDGGyjmd2Y0I5cwY11PzFqBM7aP/2WoTNtSusX4XcPYhLkGxcLsf/Ut?=
 =?us-ascii?Q?8S0yYG73mMkp7mEdjNmCbmGU0vNCG1atuHkJ1hGkElEyGtLINMjMkzMer+GQ?=
 =?us-ascii?Q?vW48VbC5fWdhb+UNMzBXIEcW7309bEjyxz/wnlKtanYaPE1xhxyvRg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gvhZ+JItXPIm/Tm42eORk0yFHIbAhgpoAxW2xvUvM3bQ31OIvhscTkP087Ss?=
 =?us-ascii?Q?LVppV358gdWKNbr47cmBEI4FhF3aqFx6BHZ314vltD3ct2yNZMaaSE5NYhR0?=
 =?us-ascii?Q?rgwTjg+RueAtbfBCJkTHZLiF0PIJ+g5j9pFJF0mzhigGVz8+29D9n7apKMT3?=
 =?us-ascii?Q?LB1KQerrKMhLRPHq4+FYK4JZfMEfdFUFGGPBFiZpqoWtslPkL6DBWCUPt6Vl?=
 =?us-ascii?Q?gMox5wEPbz9b+ZNAS3sCqFJotMNUyLKtCSis4+gLYo3iCkT+1hlsyw4vcuom?=
 =?us-ascii?Q?7k3Iwpg2GK/tgmqTiSozr1YNCLWILauETQwLyuY/9GVxZdQzP+XPz3ch1Rg8?=
 =?us-ascii?Q?6cko2EBusxZ9tPuxpwXUYnqA1Qi865LrGMmJjA7gtQj8ufAY5ksZjRnIS1+L?=
 =?us-ascii?Q?QE91iRf49iFzvJbzGIN/27uU/ao0UJO9s9114FiKvI79K3xpQhDYPzbu7jLo?=
 =?us-ascii?Q?YEl66y0CUgFVbQ6J76FGkkKemN6th+FHKerHeA3q6mqNKQS6f1BnUw4oFio7?=
 =?us-ascii?Q?bp0GuXyXNhLZ2DSdni51nGs0Tegftgpelmgp/0+sexGhGFLCSexOgk+XdOhU?=
 =?us-ascii?Q?l3fYA4LGUhp8GT589mRyNERhEiQNzITjwYDUs5HELeBonLuE6e+V6RT52Zco?=
 =?us-ascii?Q?lJQ8p50TgHn9NMC5mKleACgHwvhkBemV2qASLnSFpC+nChQWpMJqJqo3EW1v?=
 =?us-ascii?Q?jQcjF6rzEnLHkhC1IBsbF8pyYhisqsxBcFbAj4leiEldz48zqEGqKhHMQFfm?=
 =?us-ascii?Q?oqh7k/N7xv4hmLYj+8e/S0jAJ+ZaUDMe8RSylQ9nC/VdUkh03WntgqAQGfT/?=
 =?us-ascii?Q?XOJEw5Dg+yO+qpQDSVAA60QXGaEbvvsd7Km83z/r8z8FuHd4G5zSaVufOze+?=
 =?us-ascii?Q?yt6qwtEGKGSJBds/jB8s+p+7RCAdjESsBvS4jdUjSU2vRC/dTS6StfQlkWlj?=
 =?us-ascii?Q?4FGAV+97cz370FYu1VVg6Y3qYdtJk9EIQgrSTzxh8kZ9vkOzohtG/IUNH9b5?=
 =?us-ascii?Q?OtPvS/2fPicbn1TCps3OJSpRTrQy6C/JRAp+mITuQJBxxJ/Vb9NmMW/4lxam?=
 =?us-ascii?Q?js9QYurjQTC9qfBzC1F7xoAaHhp7As9lYfzPEwA3HZKHMC29d9iDzmQ7P0rN?=
 =?us-ascii?Q?y6mfAYBac1CZznSK/gdEFeNhiZON9jJj9Wykql2Vg85t5kjdr2hDPfpuE6Ae?=
 =?us-ascii?Q?7I8HhYn3m8bM4iMAWzROhf+YAc/YFXgxnd3TCL5UDk2tmPSRZ2Jr9IBO9i1I?=
 =?us-ascii?Q?tgiZGU4rWYOFzW3izNIzKobb0YLT+58jiNRzs1SM/zqhjy7NimfC9ld1VMCt?=
 =?us-ascii?Q?TpWCjg0aqYT5h3JiTieNZrJX25z0hV1yLW+pjH7m8kwZKdAUpbhw/vHlgN6Q?=
 =?us-ascii?Q?ScrANHaCXP0MHAEZrWjFJSjn5MDdAYWklaiGs+RZTp1KmPrzyc7buU3SLdQ3?=
 =?us-ascii?Q?OR4rMLxBLAQKl4L2snU1jJa/RtG3XVajgLcVFa1E9gDfxKeggqjBXF47kqFq?=
 =?us-ascii?Q?nRcPvEV/JvxmkG/X2a/X01B6c4d4nbWgSEFOY3/CCD/NX91KrGng4PTh1S7B?=
 =?us-ascii?Q?4qhMjdo4ZJpGCiGCi+X4Ius0lX0kiFkdb2MHJ4acwEo8HHsZ/RHvkEZZqLdo?=
 =?us-ascii?Q?ebbDlxwENCY6DXiSeXRn8Ak=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b12d9a1-9527-48ca-140d-08ddeac3ddc6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 08:28:32.1179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyMakHNKIQTKHNa1o9zWCC2OcNirwRiMW5QNREEu6UmXUarOk2UhSGfgISFUBeVZkHxsT02w3QMFH5nef1AcYqKtUNGOvOjAZNzvpfprCtqHFKXTBjW44vnhHMXNYSPs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14678

Combine common code from rzg2l_cpg_assert() and rzg2l_cpg_deassert() into a
new __rzg2l_cpg_assert() helper to avoid code duplication. This reduces
maintenance effort and improves code clarity.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected GUytterhoeven tag
 - Simplify polling condition in __rzg2l_cpg_assert()

 drivers/clk/renesas/rzg2l-cpg.c | 45 ++++++++++++---------------------
 1 file changed, 16 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index b508823f9723c..1143ce0afed47 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1638,8 +1638,8 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 
 #define rcdev_to_priv(x)	container_of(x, struct rzg2l_cpg_priv, rcdev)
 
-static int rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
-			    unsigned long id)
+static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
+			      unsigned long id, bool assert)
 {
 	struct rzg2l_cpg_priv *priv = rcdev_to_priv(rcdev);
 	const struct rzg2l_cpg_info *info = priv->info;
@@ -1647,9 +1647,13 @@ static int rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
 	u32 mask = BIT(info->resets[id].bit);
 	s8 monbit = info->resets[id].monbit;
 	u32 value = mask << 16;
+	int ret;
 
-	dev_dbg(rcdev->dev, "assert id:%ld offset:0x%x\n", id, CLK_RST_R(reg));
+	dev_dbg(rcdev->dev, "%s id:%ld offset:0x%x\n",
+		assert ? "assert" : "deassert", id, CLK_RST_R(reg));
 
+	if (!assert)
+		value |= mask;
 	writel(value, priv->base + CLK_RST_R(reg));
 
 	if (info->has_clk_mon_regs) {
@@ -1664,37 +1668,20 @@ static int rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
 	}
 
 	return readl_poll_timeout_atomic(priv->base + reg, value,
-					 value & mask, 10, 200);
+					 assert == !!(value & mask),
+					 10, 200);
+}
+
+static int rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
+			    unsigned long id)
+{
+	return __rzg2l_cpg_assert(rcdev, id, true);
 }
 
 static int rzg2l_cpg_deassert(struct reset_controller_dev *rcdev,
 			      unsigned long id)
 {
-	struct rzg2l_cpg_priv *priv = rcdev_to_priv(rcdev);
-	const struct rzg2l_cpg_info *info = priv->info;
-	unsigned int reg = info->resets[id].off;
-	u32 mask = BIT(info->resets[id].bit);
-	s8 monbit = info->resets[id].monbit;
-	u32 value = (mask << 16) | mask;
-
-	dev_dbg(rcdev->dev, "deassert id:%ld offset:0x%x\n", id,
-		CLK_RST_R(reg));
-
-	writel(value, priv->base + CLK_RST_R(reg));
-
-	if (info->has_clk_mon_regs) {
-		reg = CLK_MRST_R(reg);
-	} else if (monbit >= 0) {
-		reg = CPG_RST_MON;
-		mask = BIT(monbit);
-	} else {
-		/* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
-		udelay(35);
-		return 0;
-	}
-
-	return readl_poll_timeout_atomic(priv->base + reg, value,
-					 !(value & mask), 10, 200);
+	return __rzg2l_cpg_assert(rcdev, id, false);
 }
 
 static int rzg2l_cpg_reset(struct reset_controller_dev *rcdev,
-- 
2.43.0


