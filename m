Return-Path: <linux-renesas-soc+bounces-8-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA4F7F2393
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 03:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 318E2282339
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 02:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04946134C6;
	Tue, 21 Nov 2023 02:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="e+/RA8jH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2136.outbound.protection.outlook.com [40.107.114.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D5E883;
	Mon, 20 Nov 2023 18:05:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdmW1o46K13M0L3n163vrAjqu7Il8wDCvyAhn746Yagc9P+1XWf8fSWe/J3y2ia5klt9EYwTkiMvMx+zI8L75/FFmxT0HuteTGSozMe0Xk62JXh93/LgBXLtnNLU2GFNRqx/kl7C1FoE7HVFJ1eehIy2VVcvxLf9cC4HW6N2orDcK8jHrPbzcOhB0tBjM9AklHLlJvl+izQz5AMPSSWxu7/q7vS22T25UuAS30ot0BE/awZNIoFlkAihyat7uqdifYI01xHJNJMjKZK/TyS7DVj3d66mtEetPpxS2dRGa27xHYtULwT85l6qla36rnQSy0ibLvNq/s0tJ4AbF7NDeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTWnMTnCxeH1ufjME++NKJA16TJrDDuNLjYP9pYIRzE=;
 b=AbsdI8SSlM4cf/NO692uXi4TJxPr/im+sMQ1WoaKraDXN5cxnEpkmBqJYJyBC7GR+jhnEi5paFTTBw8Vfd7YoLVws0C290ZRySjILmrpeVlTFxOjSVSfgqJC03LFmsHrBrk6FBrQXbipmKOtHRV9YBAZg9qVV86CxVxqdPzymGw6GgoktzEr+lpNkXi0qnLgt52qAdLkfcl8MoR9/s4LPspy1DwhA3uBGbUgFApSBY/DoH3t1RyLVmdwNepUereurpAqQ8r0qb1zj/hrezEuKMifGPWvJgYmGoOev6870zrDzSdjjkh4+5bRsGRuzaEtMJF3e/QnRBg72aYY2edz8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTWnMTnCxeH1ufjME++NKJA16TJrDDuNLjYP9pYIRzE=;
 b=e+/RA8jHNa7fbUSKs+i1Ghtjfwj33tsbIdyz/enlB5Jy6dCHrOoJJC740sBaIpQckebJFe8//3vVv0ji+rKrocDH5ZI2DHVParSPpildh7ttC4ozsnPtwA6N1raoi1unfvaG/uLOoSQXp97JN2BxuV3PXvRgE5tbLvgI0j8GSOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8610.jpnprd01.prod.outlook.com
 (2603:1096:604:18d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 02:05:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846%6]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 02:05:43 +0000
Message-ID: <87a5r7c13d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 4/4] drivers: clk: renesas: enable all clocks which is assinged to non Linux system
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Frank Rowand <frowand.list@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Aymeric Aillet <aymeric.aillet@iot.bzh>,
	Yusuke Goda <yusuke.goda.sx@renesas.com>
In-Reply-To: <87fs0zc14m.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs0zc14m.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Nov 2023 02:05:42 +0000
X-ClientProxiedBy: TYCPR01CA0200.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8610:EE_
X-MS-Office365-Filtering-Correlation-Id: ac762b7d-8caf-47c9-cabe-08dbea365e11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m5UGuOQ3u5JWetRggFK5+Ndj8LLY+JDB6KG7CQOIgAwek/z98nZZSBFC/L4BgbKeXx+3y1ZQ2q7JUPizr5Db1CAi2DySJ9oX84u3XBnSi14TlrEmgexhblKhn9FDJ9BemUxCxqBMJBexvBbSu7V9jOL7YidGMGHuecF85ahbKOesYHQ6uZJPLYrnLl6dzusqr8ehno8S3Kcg4GZRYxNQhAmVKVsVeNxwKmDmJCyy/DK5kGeYK6dc6gROsjjcaMpsbCF01/alT2epGJOzzwLU5VqoiKs0sWpZmSUQgD/u0X1K69hicaham0Xj2Mo0gYF3/DPbyE/se4vjEAFyd58GioNdYOPYSEqoNTQuNzueo07iFW0a3BNm1hNtoN661aHt1H2vRdD15h6GfPw7VSm1ErIXDuJorsu6r/tsP+Y6//IRzTR+Xo8gwk6kTH4+fW5Yl5fVl+/fG52rgO3PpiNLDzaewLFz/RsMuCxx9yNbRzW+b83TP6kSH3pBDJ9L92asJbUxe8Ngu4qM/8AJymRbUxE029GjS3mYVLzqMFSh17xfUCWe4yYC6WXyM/rAusBUkQJeB3n39abeBHyI77GcMQEwPlK3Q093DUaeXZVYzxa8TkEDeN9lxJykx1A/0Y0o
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(376002)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(2906002)(4326008)(8676002)(8936002)(86362001)(7416002)(5660300002)(38350700005)(41300700001)(36756003)(26005)(83380400001)(52116002)(6512007)(6506007)(2616005)(107886003)(38100700002)(316002)(66476007)(54906003)(66556008)(66946007)(478600001)(110136005)(966005)(6486002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0vDX296dsJtE75ntnKkks34P5hRBPuQkQoILKGQF6CtT1+kPjk/dvNizki5L?=
 =?us-ascii?Q?jzLgvGk9d7/AyxBapTNtnthYrCSWf3bo/IoKgHGdbri1hxgfhPn8bugWEtUF?=
 =?us-ascii?Q?nc97knSDrhaA6AO4MW330kiaiP06zGEIXIb9pS8l4xpns/Z/++hcKMXQYMo0?=
 =?us-ascii?Q?xufk8pFlk4mX/8N8Tb3h8dN8hs8sjV3ztO8aUde2S86aBsEtmT4V0wtGRVro?=
 =?us-ascii?Q?0ipaLFDZQj64vsKfHJ/cWSFb/h7Tpe5MT7R2/8d/prtwZVOTmSdkPRptaHZF?=
 =?us-ascii?Q?wr2nhx1moLzR8vc9cPEruItagcE8EsdyUmX5bizb4SeRtRQsH1V7LIh1/Oac?=
 =?us-ascii?Q?LnFwUw4nol3jNLJPynrEiM5BUh6e0bHAboNi2k8CDqo3hUTraAJZ8ZmAYbLU?=
 =?us-ascii?Q?k9UL/srIFIe/GtErQua93+mbcwkRQNhnek/2E/oMWlBf8UPkxOtfYffU0Lhn?=
 =?us-ascii?Q?VmLV8tcUZjnKejpqdjnoSCOJuKHglwckpnFJifxM+x1xHMUmAhgZWZZNLibg?=
 =?us-ascii?Q?6cP36uwVIawFmS8NXHfdPhJabpbb9N5qEXdQC5fEg0Hwcsqy9mL+yeFKY49F?=
 =?us-ascii?Q?7+Xp+ASQl/JVf9HHkAJEPVd3EJK0HwtM0CyKemghutanmukrgssXxjiaWugR?=
 =?us-ascii?Q?pU0q4VNUsmJy7GC90IzMXl4bUyqIklk3b92svfV/axjd6ECf+qnOn//mbN0P?=
 =?us-ascii?Q?tuIYzyAAXYvywXSUklNTqYtZjOpA7oo8x6riGY0w2PSdTQNJHbYUAdDv819u?=
 =?us-ascii?Q?BGRdOdGEWSmSAeb8ZJuha3FdQt1AqqGsiBv9MpTO/hfAG8DllcI/Sp63YIvF?=
 =?us-ascii?Q?VGwLiek8+ybPXcwUEa90Fi7/dYo9snlkgjRMYxhTUYfcTdMFTlEwgchthvi7?=
 =?us-ascii?Q?Nw5ALpl2sAy9gyUURSsNSE5q6yOC6/rJfJk5ur/TPlqH58QrqUc16ysY1cu5?=
 =?us-ascii?Q?PQeBnEJ5DISIvHslpwIaPavVz9+A6I8qRqRnOeLo3CvXaB2uTzJR78KOhiNR?=
 =?us-ascii?Q?zvVh6oxzwDdmoIFAWvv+PQHREAH9ZIm8AmXy/HWFl6ldAT5qsFM3ygf8gOYu?=
 =?us-ascii?Q?z4tRxgYz2S6kekWs019YzOngnYghpNV1x3CSsnIi5evBxUeemzKbpBDCILzh?=
 =?us-ascii?Q?ZgljW+YZbyVA5IhLPweZRSJvDzvj7yVSQ45arxPPPsrjhBs7PPCYxIQes9WM?=
 =?us-ascii?Q?i1i1yNUJ7ICRsub9ejhfNQMhHVkfpU13c3ok0D67hz/9vUN8TfXpS7B7X4GF?=
 =?us-ascii?Q?KmJkpNQ6qX8i1HTLi7xIiTY/hR03k+UJIb2t02/6qKBnVdbdRQgcNL4ydaFm?=
 =?us-ascii?Q?wFjdz0Xn1i03s3O7ae2J8603i6Ns188Fm2hrZ0HGo+5R4xaSlg41G+cTg519?=
 =?us-ascii?Q?KqphW4Qb1qrYn3qduN/C9DLeoUpk7mKptEyMHVFAxL9xXNOaKW/NVpAmaeT4?=
 =?us-ascii?Q?cAV1zNPYGZZ/HgNsIptrBrdFc8kkRxSHJDiPW6qhWcLE2K2+Vxkb9W5JzGt7?=
 =?us-ascii?Q?pZK+uBYlZ705dwV7KUhLL/fbFZqo+Yl/YIJaEPyU7ccTkubZdXqSWlaMmZ6i?=
 =?us-ascii?Q?If5XuHbc3Ui30TJvccX5Uv6Q9uVUZYOlMJymS73yUg5HMWw54UZFoGVNHEYX?=
 =?us-ascii?Q?CzK1+MegVdFqkwhAWCBXE7w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac762b7d-8caf-47c9-cabe-08dbea365e11
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 02:05:43.2218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOkesvaM/yGBVlGGDtQS9Ufk+Zra039C4Gdpss0UtChRUR+8Z+VI8d5XR989vIEFRxfkb8bYfatplp3DBqMseIfzid/vM7GwqM1hv68W8rSSxWztx/JEzFXrxGXdLsr/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8610

Some board might use Linux and another OS in the same time. In such
case, current Linux will stop necessary module clock when booting
which is not used on Linux side, but is used on another OS side.

To avoid such situation, renesas-cpg-mssr try to find
status = "reserved" devices (A), and add CLK_IGNORE_UNUSED flag to its
<&cgp CPG_MOD xxx> clock (B).

Table 2.4: Values for status property
https://github.com/devicetree-org/devicetree-specification/releases/download/v0.4/devicetree-specification-v0.4.pdf

"reserved"
	Indicates that the device is operational, but should not be
	used. Typically this is used for devices that are controlled
	by another software component, such as platform firmware.

ex)
	scif5: serial@e6f30000 {
		...
(B)		clocks = <&cpg CPG_MOD 202>,
			 <&cpg CPG_CORE R8A7795_CLK_S3D1>,
			 <&scif_clk>;
		...
(A)		status = "reserved";
	};

Cc: Aymeric Aillet <aymeric.aillet@iot.bzh>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 118 +++++++++++++++++++++++--
 1 file changed, 109 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index cb80d1bf6c7c..26098b7f4323 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -142,6 +142,8 @@ static const u16 srstclr_for_gen4[] = {
  * @reset_clear_regs:  Pointer to reset clearing registers array
  * @smstpcr_saved: [].mask: Mask of SMSTPCR[] bits under our control
  *                 [].val: Saved values of SMSTPCR[]
+ * @reserved_ids: Temporary used, reserved id list
+ * @num_reserved_ids: Temporary used, number of reserved id list
  * @clks: Array containing all Core and Module Clocks
  */
 struct cpg_mssr_priv {
@@ -168,6 +170,9 @@ struct cpg_mssr_priv {
 		u32 val;
 	} smstpcr_saved[ARRAY_SIZE(mstpsr_for_gen4)];
 
+	unsigned int *reserved_ids;
+	unsigned int num_reserved_ids;
+
 	struct clk *clks[];
 };
 
@@ -453,6 +458,19 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
 			break;
 		}
 
+	/*
+	 * Ignore reserved device.
+	 * see
+	 *	cpg_mssr_reserved_init()
+	 */
+	for (i = 0; i < priv->num_reserved_ids; i++) {
+		if (id == priv->reserved_ids[i]) {
+			dev_info(dev, "Ignore Linux non-assigned mod (%s)\n", mod->name);
+			init.flags |= CLK_IGNORE_UNUSED;
+			break;
+		}
+	}
+
 	clk = clk_register(NULL, &clock->hw);
 	if (IS_ERR(clk))
 		goto fail;
@@ -949,6 +967,75 @@ static const struct dev_pm_ops cpg_mssr_pm = {
 #define DEV_PM_OPS	NULL
 #endif /* CONFIG_PM_SLEEP && CONFIG_ARM_PSCI_FW */
 
+static void __init cpg_mssr_reserved_exit(struct cpg_mssr_priv *priv)
+{
+	kfree(priv->reserved_ids);
+}
+
+static int __init cpg_mssr_reserved_init(struct cpg_mssr_priv *priv,
+					 const struct cpg_mssr_info *info)
+{
+	struct device_node *root = of_find_node_by_path("/soc");
+	struct device_node *node = NULL;
+	struct of_phandle_args clkspec;
+	unsigned int *ids = NULL;
+	unsigned int num = 0;
+
+	/*
+	 * Because cpg_mssr_info has .num_hw_mod_clks which indicates number of all Module Clocks,
+	 * and clk_disable_unused() will disable all unused clocks, the device which is assigned to
+	 * non-Linux system will be disabled when Linux was booted.
+	 *
+	 * To avoid such situation, renesas-cpg-mssr assumes the device which has
+	 * status = "reserved" is assigned to non-Linux system, and add CLK_IGNORE_UNUSED flag
+	 * to its clocks if it was CPG_MOD.
+	 * see also
+	 *	cpg_mssr_register_mod_clk()
+	 *
+	 *	scif5: serial@e6f30000 {
+	 *		...
+	 * =>		clocks = <&cpg CPG_MOD 202>,
+	 *			 <&cpg CPG_CORE R8A7795_CLK_S3D1>,
+	 *			 <&scif_clk>;
+	 *			 ...
+	 *		 status = "reserved";
+	 *	};
+	 */
+	for_each_reserved_child_of_node(root, node) {
+		unsigned int i = 0;
+
+		while (!of_parse_phandle_with_args(node, "clocks", "#clock-cells", i++, &clkspec)) {
+
+			of_node_put(clkspec.np);
+
+			if (clkspec.np == priv->dev->of_node &&
+			    clkspec.args[0] == CPG_MOD) {
+
+				ids = krealloc_array(ids, (num + 1), sizeof(*ids), GFP_KERNEL);
+				if (!ids)
+					return -ENOMEM;
+
+				ids[num] = info->num_total_core_clks +
+						MOD_CLK_PACK(clkspec.args[1]);
+
+				num++;
+			}
+		}
+	}
+
+	priv->num_reserved_ids	= num;
+	priv->reserved_ids	= ids;
+
+	return 0;
+}
+
+static void __init cpg_mssr_common_exit(struct cpg_mssr_priv *priv)
+{
+	if (priv->base)
+		iounmap(priv->base);
+	kfree(priv);
+}
+
 static int __init cpg_mssr_common_init(struct device *dev,
 				       struct device_node *np,
 				       const struct cpg_mssr_info *info)
@@ -1012,9 +1099,7 @@ static int __init cpg_mssr_common_init(struct device *dev,
 	return 0;
 
 out_err:
-	if (priv->base)
-		iounmap(priv->base);
-	kfree(priv);
+	cpg_mssr_common_exit(priv);
 
 	return error;
 }
@@ -1029,6 +1114,10 @@ void __init cpg_mssr_early_init(struct device_node *np,
 	if (error)
 		return;
 
+	error = cpg_mssr_reserved_init(cpg_mssr_priv, info);
+	if (error)
+		goto err;
+
 	for (i = 0; i < info->num_early_core_clks; i++)
 		cpg_mssr_register_core_clk(&info->early_core_clks[i], info,
 					   cpg_mssr_priv);
@@ -1037,6 +1126,12 @@ void __init cpg_mssr_early_init(struct device_node *np,
 		cpg_mssr_register_mod_clk(&info->early_mod_clks[i], info,
 					  cpg_mssr_priv);
 
+	cpg_mssr_reserved_exit(cpg_mssr_priv);
+
+	return;
+
+err:
+	cpg_mssr_common_exit(cpg_mssr_priv);
 }
 
 static int __init cpg_mssr_probe(struct platform_device *pdev)
@@ -1060,6 +1155,10 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
 	priv->dev = dev;
 	dev_set_drvdata(dev, priv);
 
+	error = cpg_mssr_reserved_init(priv, info);
+	if (error)
+		return error;
+
 	for (i = 0; i < info->num_core_clks; i++)
 		cpg_mssr_register_core_clk(&info->core_clks[i], info, priv);
 
@@ -1070,22 +1169,23 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
 					 cpg_mssr_del_clk_provider,
 					 np);
 	if (error)
-		return error;
+		goto reserve_err;
 
 	error = cpg_mssr_add_clk_domain(dev, info->core_pm_clks,
 					info->num_core_pm_clks);
 	if (error)
-		return error;
+		goto reserve_err;
 
 	/* Reset Controller not supported for Standby Control SoCs */
 	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
-		return 0;
+		goto reserve_err;
 
 	error = cpg_mssr_reset_controller_register(priv);
-	if (error)
-		return error;
 
-	return 0;
+reserve_err:
+	cpg_mssr_reserved_exit(priv);
+
+	return error;
 }
 
 static struct platform_driver cpg_mssr_driver = {
-- 
2.25.1


