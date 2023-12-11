Return-Path: <linux-renesas-soc+bounces-880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B8B80BF92
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 04:03:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FC851F20F5E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 03:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC2315AF0;
	Mon, 11 Dec 2023 03:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="B1Ea8Ibn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2138.outbound.protection.outlook.com [40.107.113.138])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B796ACE;
	Sun, 10 Dec 2023 19:03:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJd8js0NjI1Vs73wu9QvSCHBnsHF85z7KUB4cMdopAvj8cK4S0J9vYbBhkTM9Lk0ufw0ryKmvVsYTOeW3lzD6aVE3NmjkXZ+yYlOFGTToOEGz0jbPtqLeh9LZWNz9T6UmoZhqi2H5cP7FZBK1iGf5IwE/Ow05L/U3z5+/NAIyDEIWTIiDCuD+pLrg0gI8qSvCIPgkd+zjTKyt7cxmdIE4i0U+XJtyW1MSC8d1ddkzf/4rekGMHykXZ+ivxGb2AZIgkOz+UhARU+U9fwUFP/IjRrq653jLgr200o/gkR+1nsjQ2Fx47Wi7oNw3Luoxo+rkeQKdmbYDCU2WtD/bq+SDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ioM8yS16w1RnxT4vNqh/GEBFRKyqI5PFJ/PkXKgyhI=;
 b=ZgpN1Sk/9SX2kcU4yc334JyoI17jPerkeOsxij48ekKVk2g1/Dwrws7LMtwrnkLMgvrOmAvsbsN/640J2CTJHhlblD6d1OK6B+Fs93MoT9h/wKxihCNZPJ5bC5I2qU3m4iiXwqZu3DDmiNFpVo/bHfOcR6SYAFTuwdUHnOCDxeF3NbaNeZoW7rckiXz2ONWmtcsR1676CSCbgQPziuB4/m9K1Oh3uAJVcf8XavxpIh2ZUV722UTPec5DEbWpNpITzdNbfgAyBUWSUIRE2x0q7xh6pPX0FO5RSTpLRB7pxS+35vL0ZSt1wzwxM+/tGCmtiD+R7eDgmR+SPeWJz8PDBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ioM8yS16w1RnxT4vNqh/GEBFRKyqI5PFJ/PkXKgyhI=;
 b=B1Ea8IbnX0SGGyvwFBrLRJcc83K10qAPLTrYxliGYmSyeQyzeHRD6b6axIkWrJFIhL8QfJ4IEFuPVLl35YKLOaSoUYBGlMu2O6oZE8H5JdWc3j6W/ucnaq6clAhYaZGkUbNpgQFZbYdGiBt0q/hZZem0nc1+DFmDIbENbhPbMfA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.21; Mon, 11 Dec
 2023 03:03:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92%4]) with mapi id 15.20.7091.020; Mon, 11 Dec 2023
 03:03:25 +0000
Message-ID: <87r0jto2yq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 4/4] drivers: clk: renesas: ignore all clocks which are assinged to non-Linux system
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
In-Reply-To: <87wmtlo2zs.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmtlo2zs.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Dec 2023 03:03:25 +0000
X-ClientProxiedBy: TYCP286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11269:EE_
X-MS-Office365-Filtering-Correlation-Id: b66398f7-8121-440c-191b-08dbf9f5be4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qlpHa/TOGnGT4bIzKnR1xSDaYRh0kgl2gdq94vy4BAoBGgWEaHzdbhWB0hGCP2euuoQQ3dmonrlneH/kpVs4pVOVpP+k3/1iwTC5iKN+N40MVxd3I1CCxzq7VeiohrHv3LLZQfsoSxXb7dmvVBVR9PXTFWSyTzgsdvPl0S26iaBURUVaFo0LEba/h6za5+zTVRvFIIcW1ohe8b+vcBsK/g9S51SSKGmFMjCk6Gc+S3BQUJ+MB3lUhh6bLGY07V6qBBBfgsGxPz0jE8ces8HNITNTdxUDgOha1JW/S8I1FTl6DCscJx+EAPuqwABrZ/mWnGwPgpQjbXDzyWkONm1QkuirYl5UpirmyqbepsREWnaobJkEtgdSyaFnzkaoDsOx0dFFU/7Hq2Vz7L6PNj5EfkEf6xLSJDcLVvg5vHLST9yo2fTZFUjZrk0o8Kc7zLAm2YQU3TaLUGl0QKSwH+5XlNtlygMCEqsTypf9PajCTj2G7cfQBUhtEfZoU9h2MWZksVuPVI8kAmspaqDayPUzNYnBqj2ro6Wtc7uuR5PRQnFDsWFkNqM5mOTyjtLPDIfiRb2s3aOBMm8pWsYZYHik3SBZjWMhgk1rTUAjoFWi1J84Ze8FkY0Xm0AXbdX9pFef
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(376002)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(6512007)(6506007)(5660300002)(26005)(2616005)(107886003)(36756003)(7416002)(54906003)(66476007)(66556008)(66946007)(6486002)(966005)(2906002)(83380400001)(41300700001)(38350700005)(478600001)(86362001)(8676002)(8936002)(4326008)(52116002)(110136005)(316002)(38100700002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nsMLr08h5M1t6w2aOfN0yBxMSrLp8aTZuINU+BQ2BxKqxr6dpM6P0CBNfIvQ?=
 =?us-ascii?Q?is0rjToDKGl2JT4TbXIO3jGHAC4W59A9FuWd/cHBa5Vem5637lAxuX9XE+mm?=
 =?us-ascii?Q?RqwSw0htSsbgIl6+XC3YxwamosBRVaYHCqXAi3+KN9qJdLJsuXHvzWOuoJeQ?=
 =?us-ascii?Q?0o5oXG2X8sqvpf6JOZV+5UM0hGY0fbE/40czncx4NddpfyzV7uEneX/bQO3/?=
 =?us-ascii?Q?Kev+DTrcj+nH97119CrWgXYmXYjdxs0et49Y6OQDp5sfjEpnjJ3wZDi00kCL?=
 =?us-ascii?Q?CC1cDuIH/ovXe8e0AQnFpd9HAQ0E4N5hYMX5YlG9FRTdT5I9WEUbBYU1PSKb?=
 =?us-ascii?Q?+kkMxq3MJu8F+tJzE7M2JfJbywPgoRdLR2meJL81gVADTIOT2lL4xvmSUWNl?=
 =?us-ascii?Q?avSsRQoi51rZYplzdkRMI59fdGzguSnickZop3gwO5i+tYSTUSP1td1ZhqBg?=
 =?us-ascii?Q?0/JzYl6V76hYvqHp3vYon5UkLiFeA46+Byg+aMdv3I2ZwJwNRl7Avlt7s930?=
 =?us-ascii?Q?0DGt9nxWQtUN+2YtffcnsYkiC2osUSPE6fWffWbJr7UoLuAd9OwHza5u7JSr?=
 =?us-ascii?Q?VJETyVU9QlCgISBCD7hlzM8uTwl/O/j23qafLeWty0vMyExJ564PYDDP2HjL?=
 =?us-ascii?Q?RiPNmNIEnZQPtMZkOMItsbSgt+XMC8VKV+Pi8W0KWUYe6wF6+TSUHBwpUuBW?=
 =?us-ascii?Q?EpYNyuB8nHnZIP8Dt03znhPG8ttRu1bpat6jA+nY/4cbkTxfWK8zT1PzG0Y2?=
 =?us-ascii?Q?Gy/qYIUlGdleizG/Ndym75hLNuBhQT7OLiqm9kSQpcMI8R3mz5JiMRceGxka?=
 =?us-ascii?Q?72djBNnlLxu4kZ5z2JXROn6YaRC6fNIVw3KTcRfCH6TtYZft3o9F/2kr/6Qw?=
 =?us-ascii?Q?8GWNw4GbkZqfZWQTN672WCfPwTiH8xcepD3qgMn25OGJv6UHcL08hrFNUjjT?=
 =?us-ascii?Q?TW1mSj1IOuLf0un8m/LVt3ofGndiNSmAsPu0gg3K3UsY3TPnDsAadUeZWclC?=
 =?us-ascii?Q?m2WFmuHnLQfFUnemy1X6GvaTiTJTMHVF4Z9pBXGrzTcL2nj37yzJZ/GbcXdl?=
 =?us-ascii?Q?KSycsHd688drHuJ5yCk3YY5iI6M6kZIAiOGndEXiLwMZXZ0bNXXQ9khzMY6T?=
 =?us-ascii?Q?ANg5LoelE0LAm2pdNqYXvfqu5fYwKwbG/zdwv0VsfVZ9OvAOeIPZTmPAfz0A?=
 =?us-ascii?Q?X0rAwQo+8JSyarokCx04ufnsNmc8MqG9uhnfdXWEdSW5bfWxD8G7n5Iqij++?=
 =?us-ascii?Q?xHhq3cAyeaQvuMpyMP4RmK/nMP61mbUpHw4MEQ5K8fXbxG7B4wv1NY9+ePmq?=
 =?us-ascii?Q?R1wMot8ERNQRh7dVvcgjOISWu4NM6vHuJLGpreiwYqF5iPuJjhs7bNZVMjIX?=
 =?us-ascii?Q?xaHbFzXaY1+UNBRxRjVBHt/sk4Ax9/toG8urlItQs1Vf8Hc415lp35eusDIu?=
 =?us-ascii?Q?m/wo08jTQWXjHsxA77zmB+PpHQNp2EBpNSpX96tNAXQ9POpWAqh3z347O2R+?=
 =?us-ascii?Q?E3RugVWGSfC1jwQrPvXbr2Ag6oh2i01zrRGDaonJRgDKEVm/UN2deRlrHSjU?=
 =?us-ascii?Q?faOWeO/GyyB3y241hiSF28Lt+bOs9nb4DN/bXOfkWzXEg0bRzSUSl2PhjGb+?=
 =?us-ascii?Q?Tac7MpdHnDs91XZuVM/Gib0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b66398f7-8121-440c-191b-08dbf9f5be4c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 03:03:25.8930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2z1kwuRSStW6SRMeM69iXbZbksSptYAj1XEqFIQfRuRM4XLRBnlt04WPGhDWd2tqcnJfKt8OoOlN5ZVxoWz3FFzdKrY+X/E8/RDAPHHCX9CBAwT3Y7JVV6JxpJVNMjvV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11269

Some boards might use Linux and another OS at the same time. In such
case, currently, during booting, Linux will stop necessary module clocks
which are not used on the Linux side, but are used by another OS.

To avoid such situation, renesas-cpg-mssr tries to find
status = "reserved" devices (A), and adds CLK_IGNORE_UNUSED flag to its
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
 drivers/clk/renesas/renesas-cpg-mssr.c | 101 +++++++++++++++++++++++--
 1 file changed, 95 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index cb80d1bf6c7c..0db2aec00d10 100644
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
@@ -949,6 +967,72 @@ static const struct dev_pm_ops cpg_mssr_pm = {
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
+	struct device_node *soc = of_find_node_by_path("/soc");
+	struct device_node *node;
+	uint32_t args[MAX_PHANDLE_ARGS];
+	unsigned int *ids = NULL;
+	unsigned int num = 0;
+
+	/*
+	 * Because clk_disable_unused() will disable all unused clocks, the device which is assigned
+	 * to a non-Linux system will be disabled when Linux is booted.
+	 *
+	 * To avoid such situation, renesas-cpg-mssr assumes the device which has
+	 * status = "reserved" is assigned to a non-Linux system, and adds CLK_IGNORE_UNUSED flag
+	 * to its CPG_MOD clocks.
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
+	for_each_reserved_child_of_node(soc, node) {
+		struct of_phandle_iterator it;
+		int rc;
+
+		of_for_each_phandle(&it, rc, node, "clocks", "#clock-cells", -1) {
+			int idx;
+
+			of_phandle_iterator_args(&it, args, MAX_PHANDLE_ARGS);
+
+			if (!(it.node == priv->np && args[0] == CPG_MOD))
+				continue;
+
+			ids = krealloc_array(ids, (num + 1), sizeof(*ids), GFP_KERNEL);
+			if (!ids)
+				return -ENOMEM;
+
+			if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
+				idx = MOD_CLK_PACK_10(args[1]);	/* for DEF_MOD_STB() */
+			else
+				idx = MOD_CLK_PACK(args[1]);	/* for DEF_MOD() */
+
+			ids[num] = info->num_total_core_clks + idx;
+
+			num++;
+		}
+	}
+
+	priv->num_reserved_ids	= num;
+	priv->reserved_ids	= ids;
+
+	return 0;
+}
+
 static int __init cpg_mssr_common_init(struct device *dev,
 				       struct device_node *np,
 				       const struct cpg_mssr_info *info)
@@ -1007,6 +1091,10 @@ static int __init cpg_mssr_common_init(struct device *dev,
 	if (error)
 		goto out_err;
 
+	error = cpg_mssr_reserved_init(priv, info);
+	if (error)
+		goto out_err;
+
 	cpg_mssr_priv = priv;
 
 	return 0;
@@ -1070,22 +1158,23 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
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


