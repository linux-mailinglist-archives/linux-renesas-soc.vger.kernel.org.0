Return-Path: <linux-renesas-soc+bounces-20754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E133B2D9A5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 12:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0265E4E59DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 10:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12BC82E040D;
	Wed, 20 Aug 2025 10:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="p4QYTo0X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011023.outbound.protection.outlook.com [52.101.125.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674682DECCE;
	Wed, 20 Aug 2025 10:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755684305; cv=fail; b=PPn85ThjmrxfG34iu/LvHUB3pq9H+OFTahbOKw7GB+VXoPeEelnOiGoEA4uzRND7KXkKPQ6c3UnBYXTkv2HcxkEAK8rMnzCPOSDnarmvm3QK2+JPMXrAuwOQMHhPZ/YCqsjgFKfXHENW2iqU48TY714hkjn24kiw9RYw6M01Voc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755684305; c=relaxed/simple;
	bh=gjGvUhl57ujm3+pXkulVmpvBfaofITbLzMHhBUuznM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ph2M4lfkXzNCBVfDgUQIllbhsfaFpMtg596jXH2VkU2FWnRy4Z9VEUg+cwXdEvPQOhjt8iwPcCf9OaRv4Sz09mBJA3kPL8cO6WM1e0RtLAN+x1ipeYgLSzaf4oXWQAr0r6RSmeaBDMbvkevI6zCYsbu4BDZgfTDGlydyv5RzIFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=p4QYTo0X; arc=fail smtp.client-ip=52.101.125.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=feiv+zZ9BgfslzJGCfpBZanq1jrQ9yzdzwiHpl2XEQ11sW+moHcZ8OCA0y7xdvxm+e9Sp0nxZo01EVV+wwmXQdROt9dC2arTackx7D4YOvPC2xAxBbiyaMOgT8crcrt13h+L3lShcqAhbWei6w9LFIRjqawRu2K6IBkMqVqjXAP9G2g2XT9JxyZp/MYFYR0tKbZf7K3HdZQxVRDxEjgEEwfpIbp7+rtc81csLTBLX2ubvYIzxsck1CsY0p23c+umjQsV6Mm08fASBi3S1TBDqeq6sIAGIkQZybRjMJ6DDV3zssTcbY3qnAtjiO9WgIastyM+g+MYK3lOZh20Tsoc2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJzfe4NoJGfLX9McnGX0inxGLkZsxS6oyZFh1AQz9OI=;
 b=aJx+0P+oSrbBmngT1q2uDU4MDIlNz5mhjSCWUVwEoCZ8DewE8+Tl0V9EiPoa8mrcV3ys6C3ACeTBZ573x7049I9MiR2Lwq2xy8ZYh4kl2BzM4KM1dmLbajpmSLbzEI6NTyBUJrZ9gFDBLXJ7Y8C4/tONdgzWmwl2lrfPX5bD+6OoeM+/gkQw8WomtwlJJuKr5xSbfE3ryVSWd5nTjmo8AYMGOHRqsDN4vjG+DwNhwcd+YR/06uPxE7k/AzZDl+vR1QyPWMJR0wm6q1Y19jqYIw9atOVviA0QCCd7DGqrG8jmRLxl8ZfHD0qpGiQCJe+4Fu7AffNkRfYtHKlrB19wEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJzfe4NoJGfLX9McnGX0inxGLkZsxS6oyZFh1AQz9OI=;
 b=p4QYTo0XirTg0g2vLybwCtFeAA5vBMF8gZcnfESEqwhO/C6N7tRnZJJKRKuzxBZuwfMx/b1K0In4Q4FTwtD4lQTZ8ierU5eLfkCExTAN+sFg8yh6Ctd4cn3Ui5/LBznERvZJep8Pnbrh0dzY46F06rn7HzaapZ+olTUv77f/HaE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB8109.jpnprd01.prod.outlook.com (2603:1096:400:11e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 10:05:00 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%5]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 10:05:00 +0000
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
Subject: [PATCH 1/4] clk: renesas: rzg2l: Simplify rzg2l_cpg_assert() and rzg2l_cpg_deassert()
Date: Wed, 20 Aug 2025 12:04:22 +0200
Message-ID: <20250820100428.233913-2-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820100428.233913-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250820100428.233913-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0182.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: c8732884-09f2-49d7-e45e-08dddfd10646
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F/UJCWDNs0anPNiUB+XmPMFzRUxc+MolJme/nmPeVPOCv0EYzd0t6pA8XTvo?=
 =?us-ascii?Q?4HOdlEI12D8l07ZjzqzcVSUhaOV4hFQtve41ibcW+6nKflQExgShSh16G67D?=
 =?us-ascii?Q?ENM6UY+wzvrTCzaX3RevPIU/SiLHDNIkFy8UAIk4eQpNJFjvTsspp0gzr7AX?=
 =?us-ascii?Q?FTILW1Na3VKiykPiIKfIEOUVVfBWgAcXBRElrM9AEzkMq1mXQuZ33s9cGiih?=
 =?us-ascii?Q?zPIHh9e7Cts2nK/7xiJBFQqUnJBDqTGHrAXpwZbjdlvNIUM5m6MxUoxrngEF?=
 =?us-ascii?Q?yDnxlc6QL8+umX0n8rh7Kik81EM9rm9UI0W7FgMdyvM7casc7kjolHj05cu2?=
 =?us-ascii?Q?UI3D2IlZgqL7XL6HOXcFlj6Gqq0Z+9BgBdhXaBjAzztERzgn+UIOFeXLx1Th?=
 =?us-ascii?Q?q/19b/5ppYl8Uk7C+oyPtIrxNEdEbfQBarexjNqkjULymNmrR81ErVv8mNE2?=
 =?us-ascii?Q?zMnpbpsiPfWcNJzPBDV6Ii7MmXolG0ekebCRVI4MQIaYPaw97bK23DGFxZJE?=
 =?us-ascii?Q?Sx0jTsxyCDGdNdYfDDS3N09LmVKITMOLOKgbHSLHBNTG4hBbwZrEVqt+Iy/F?=
 =?us-ascii?Q?kbrKbzNM6DONUysMDtjsp9ZA6bs3iXcjvTbOZ74Enq2ArwWrUjYNOM5jqey4?=
 =?us-ascii?Q?stcY/atgF33QAGjmmsoOEOD1oJFDQvkXDoCdmS+XFhX+tqQTYLV3OfJOX2w2?=
 =?us-ascii?Q?rSyO4LUUDACiaJpYHsHL079ctAAe2OAbgfAkc+yAuhs5FdEH6MSh/iFQ6/E0?=
 =?us-ascii?Q?btbtQc+aEpHL9GNhsOgJzBbkhGN3OzjxxRxxIvirzHkU0sNbslLLzmcdOHWV?=
 =?us-ascii?Q?FI5HvPe7TzNNzJgQsNwekqzV6qV1rik2eB7y0GX9kEaS2FEIrRyOGiKyfgZa?=
 =?us-ascii?Q?J/XlIJ+hmJADSpcmcOGXI+DiAMYtD5QRF1ksmCvu18j2lYg4L4xpxTS7tAKw?=
 =?us-ascii?Q?HqzYtjffvXVWVxCVXhP/krtZ4KnfrMyd5w73mKpq4S5uhaOg6CnEYkM/G0YB?=
 =?us-ascii?Q?kj93cHo+bxKZLotmKENZSB9/cDqiBXxGygHOcg+BiVxFPb4XI/9uzwiW8jYV?=
 =?us-ascii?Q?W1inDQ1BgFNscy/S5qDp2iTXr1vHJP9wRdc3vFc0kgVIyxGsV56FX1X9uD0R?=
 =?us-ascii?Q?0g3y8oqokLmzdpczQOVvuL+2B7QMkxUCxv7IOxxAyEWxPFKPwLbMa2Xt73sd?=
 =?us-ascii?Q?rFXYD20Joq1wfv0JJMggvqc2zp3Xg0XXAGUnQFUGx8LVUkzqg/ol3ljssPrZ?=
 =?us-ascii?Q?m2QkWb25gikzHKCvRIs6GlRadrP+7rIP3TiTbCHSwX3VSzxD1P41LkGfLvvf?=
 =?us-ascii?Q?9zJboeIWwxObvpBLz43et0g8W3j3h1LP9grhct+zX8xPm6RhwkAZunVbax0S?=
 =?us-ascii?Q?qY2JBZMUE3x2O9mX60pd5RT+Bk2kNT0pk8FQlXBJtDZuFN81VT5/ZyZZDo51?=
 =?us-ascii?Q?blzmHI5d9F/piKtgsR1BAGt9HPT3wwhyPkAmkJx5j+FZXI36/4XQcg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yEg2lWnnBlVTbUpbvnNyF1OMDhyAoh37laE/LsbJsATcGoGBKsXHeXcgzPb9?=
 =?us-ascii?Q?ye6pnUTS6JyucxTpt6ki1a8ucMRLX9c7H/7NGFZ4n1Y/UUepDiJCHEUHUwRh?=
 =?us-ascii?Q?QKOGZb8F8Uj18N641qZXbwBUnkmGj8VHuwsWfQYZ4hGXumilbsc/0e4p3iWq?=
 =?us-ascii?Q?vunw5TyMh0bp7a9EKrYibf0hzeLd6CG3M3cuxp+NiT3eWyJzKpcRiBbd64P5?=
 =?us-ascii?Q?NmDoV2KPFuQlzx3QdkKvz9TQPQhZoIRDD02/kO6yuaS653Ru++ptNLcqH5Jp?=
 =?us-ascii?Q?+WrAugXHQxs5YtUOQWHDyFT1t5+9L2WZPbF6/yZn2vypG/aRiGzO6uGSR3Y1?=
 =?us-ascii?Q?do+UPGQjRkoPonCMFXNu5YRcU2byO5Ox9qWNIUavpJ+xpupFMkcwGP30rupA?=
 =?us-ascii?Q?eU7tza4UApeOyS6G0LgwVSijwYgveqbninP6p+yjtrjaT4UX9Adjc5eQFJ4a?=
 =?us-ascii?Q?0Pn99yRls0Dy9xwsd6sQN6FAhwM4b0p0XtduUv1j/wpvU/fV8k3or7IBzYEh?=
 =?us-ascii?Q?cWnQAwiZHCCP6R0hVoZbGrjmCzwZ41jmYSROeiYkIeDNX0UFc8W03FLbIDpE?=
 =?us-ascii?Q?N16RNio/YYXES9BIhqz3mzbqHkke2U5QePxrBiJavBl82TYMeakSBG4jlgfV?=
 =?us-ascii?Q?ggGf/Mp0wznS24HwH9UCmw6gJSChQfn38PnFW5s6dm2kgniCpvSvahtr4TDQ?=
 =?us-ascii?Q?j/iZ53crI2WA/eD3WAfHSgViG5jbMLWfEW/78VojxAh6kicEBg1W8dKyY5HJ?=
 =?us-ascii?Q?okJSCb66v1NK09T3pOdrpqakRHVJMuPiizPeJqZha+svuXjNaB4sqa1Dg7W0?=
 =?us-ascii?Q?NbzQ0csO5SRDduGv/GhvDDHdjv+dVe/4ygGzlw7hRvYFe4OJSlBYHDQwkMDC?=
 =?us-ascii?Q?rtHWvKrv9kADoeGxO9fAB8gCxnOgtMFdcISv3rgQbutgjHeOkzxw2kTd9jQL?=
 =?us-ascii?Q?Fzqpjey2AzKYhw9AXpf0+1vzoojiJUnaehPJCEGm6KrcHwQ0a+dJhaSEJBEb?=
 =?us-ascii?Q?o639BFz/DeXJiwN9m+dh/+/QOIoWuNEHlwOAU4WiZ7gVGU2u5tq/nA2FC8TT?=
 =?us-ascii?Q?IDWi45yE0o2o5699jPYVLxpSsO4sYyABo+bmUvZBdNat//qpx4kIknvFjN7a?=
 =?us-ascii?Q?Wp194pm0cI+F7P/7Dy/V9U3WgIjVyEY7LJxK6quoha+UseD1UK4Pnvbuv8bJ?=
 =?us-ascii?Q?l6TQpQQTnY4GHsR3r7HQBb1Sj00NUzwrYmZvDM6afawVJYkgsRwYmCNSj2f8?=
 =?us-ascii?Q?gZihokyxttuxafPwy+m3sdB+wJNwmWncvl68214nfWHFUvO+m/tdKinncdEx?=
 =?us-ascii?Q?NOPmrmHbgULjHv+rugh/64/UH8jkQtJ0KubyPZH+nErMX0EtW17mbb+0vhrS?=
 =?us-ascii?Q?/w4Mbjka8l7vIyPMkI47Qwcu+UgaU3ljjlc0PAg63qFwZxGzTOp6n2yg/Y2v?=
 =?us-ascii?Q?D6hbX5DaIRDLm22qAZSfTjiYdgzZy/AB7KAdGjrmBnkmUaBfajVh2Hjc0I1B?=
 =?us-ascii?Q?LFF5IyelkS1aH8VSt1wV9VA8ud9AMtxmjdeDOnR127KMzJhMNFX7wXrvUBaS?=
 =?us-ascii?Q?QMjNevxKJmWkIREx2XZiTOQbNx3uwonjcL4KKRo8/FsscDlu4v1zGoBv1RNY?=
 =?us-ascii?Q?6NG+jfwSTndrFIlOfJ5GdPY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8732884-09f2-49d7-e45e-08dddfd10646
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 10:05:00.6106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4HGGc19z1UY3nh/QzGRp+20Ql+1LxriooNpCO8CsBnx6xgom+Q2dpMWc/FN7Pb+fREVW5XY9IDSUEmMINIKrSIAZEGEXaAJkcUKpvjQjWeg5hnHlDGXqcka+LNVx0QDw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8109

Combine common code from rzg2l_cpg_assert() and rzg2l_cpg_deassert() into a
new __rzg2l_cpg_assert() helper to avoid code duplication. This reduces
maintenance effort and improves code clarity.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 45 ++++++++++++---------------------
 1 file changed, 16 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index b508823f9723..1c648c0baf7c 100644
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
+					 assert ? (value & mask) : !(value & mask),
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


