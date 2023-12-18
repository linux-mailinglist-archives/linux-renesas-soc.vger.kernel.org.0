Return-Path: <linux-renesas-soc+bounces-1182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B30708166BE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Dec 2023 07:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20E9BB21703
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Dec 2023 06:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68FA16FDD;
	Mon, 18 Dec 2023 06:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="b9Fe3Lvm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2135.outbound.protection.outlook.com [40.107.114.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAA86FCB;
	Mon, 18 Dec 2023 06:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABuNqmxWlHPb0Y7nAFhGYxzac2Xa2wsGAReMXUzLrIXvEcKSnAAqvW0jHTl5JxuGk6jLsLgRNq8BLQ2l5l7PDjWuVmv0xAtmJH1aGomosz4er571ImA7nb3XDSy8AYy+0LBIyX4+jmClYbsVL6oXKF88QsOPpYEDrKS3yLKC57pIQXy1IHQGtN2/B+AMhlFwistCUoIsRiBcJUDfYSCUBULrQ2GdHZvXbDUwAT/M628aQ/orrI0hx25dq/vCzV4dqCAo6dZuUIlayZbszkDn4cMoX6QiT7HTzQliFh1RgBrdkHU3GuhSZwqeAbutyPE8GBPWIujfQ/A+n8a/SEcz2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlnzplvKddfmHf9/l66OOIE8xFIgHGzMXbzFgKHljAg=;
 b=D+CVGFp1R+qlZylHCwfHmvEtpD+Ykl/27JpxN1jBRSea9mT58fmErOYjvzxPy45M/zAQg9zmR/XqwAEtMZm7bd0z6agOrqT//BoQsZYiHNBIIR+tGLWkMiBYjjxa5Bh3rY4QQarupFH9EnQq2X42SNtuGXuNKW02yFHE5ylCeE38Y1rKBPFccSRU9UVK3WlecqJSjQSMQQyNdLCStrYpBaAM8QAS5PMwxbjP/Aa0YdxHb99qsdut8juDFVNxQYsU4XmP6xNnF/+WAWiMKNoRPWj/idOB0X35E4mWM75d5o3MUTNa/n2zwLVbq+K0onkbVghdWuJKVVfqgEwCe8Ajow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlnzplvKddfmHf9/l66OOIE8xFIgHGzMXbzFgKHljAg=;
 b=b9Fe3LvmXaFiRxIfu6ocwJfQas8a1sXtzcGWk6/uuS5WMsSeqpGRxrNKOhNVs92Yzc47NKuEI+sHE9oaYXfTZKxHy6kL2pTzopw+Q/iL5JeVyjmj5BjvKisQwpAR0feFWH5khtfz38nV4EaHIB4q6/2214ceMDSSyFbYIcJVC8E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB5852.jpnprd01.prod.outlook.com
 (2603:1096:404:8053::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.16; Mon, 18 Dec
 2023 06:47:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::eadb:ae7b:5fed:8377]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::eadb:ae7b:5fed:8377%5]) with mapi id 15.20.7113.010; Mon, 18 Dec 2023
 06:47:15 +0000
Message-ID: <87il4wm2ha.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 4/4] drivers: clk: renesas: ignore all clocks which are assigned to non-Linux system
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
In-Reply-To: <87o7eom2jn.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7eom2jn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 18 Dec 2023 06:47:14 +0000
X-ClientProxiedBy: TY2PR01CA0007.jpnprd01.prod.outlook.com
 (2603:1096:404:a::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB5852:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ef9ea67-138f-41c2-798d-08dbff952b91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SGL8Qwf7fhpZ3SUop3RKvGXYmju7CiIkvsuuta0Ly5LQRcYokVp4Pb6HxYOKJgtJLmzlcTry/V2BXIUKR4T7XmYDQZtGHZhpCkPHKRj+sWqHxwjvWjSHGlRjppxzCTdFn/Swcp3vfNJie17Mb9U8pBxaPnEWQsmyJZE+2vKMRfwj7ZMFxUJAiOjr274i6hpf2f+fS1t8TdYhzApg7BZ8M/TWoIZkhW0iLfDf/T3jPgBxqWCjwSq/7pfhZoQ7IsRVTlAtcUxEcYEteuhZpRlEJQIpqlKCPAqO/tYSft0GdRVE71341RlXIzOzZ/C0gZUDHeEJBd/uyjFT4ZoZ+ERoDeViJpM1RVJNzbwgmlLFPgLMY+X+4tm4S3wStnVAh21gVJ/W3jUjVgb5N7GGNzkzmJ7FgESWaHVO8+0b55nJJO2tkeT8YaODnSuy9OZjK1YkB9Gr90LhjJkx9XtLnEGjPrS2qFZGeYwhBfu51FjaJWuQ+bMKgO8rOT4jb0uzISJqtbyvEd0wJZyv9PA4+4lsrdY0x7blY2fRdxqJAjr811WuMhHaIyU/Src/FlwwIdl6Dbisd2eG7LvvO4t0S8XlZjLOJ0rGOJTMgUz1UsU3NwXpMg7DvlaGSPkBVjopoT+exYwMyo2RFqbIbxK4pPbEi/4J0/XIrfcPTMGEiM+5/pvzC3gc83haLRQFcdb6VFaZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39860400002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(36756003)(38350700005)(316002)(83380400001)(110136005)(66476007)(66946007)(54906003)(66556008)(7416002)(2906002)(4326008)(8676002)(8936002)(5660300002)(52116002)(6512007)(966005)(38100700002)(107886003)(26005)(478600001)(6486002)(2616005)(86362001)(41300700001)(6506007)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Pm+TGVfPT2AHgBRvwIJWR11KZ+p36w6bAv+TG2uP7+nxRQZMMvppQBChP03G?=
 =?us-ascii?Q?3fdKK8VLVS69KD9wNoRH849LmIlC6ORprgKyRCGsQT+nrDV5oesx/jWzCgDf?=
 =?us-ascii?Q?btVPg6h2bSYsqaGb2xr9uof7IiTVlwSoZE2EN3/k3wNfipFLQ5ISSATbQBO8?=
 =?us-ascii?Q?j1BoCMdxmQygWEoriflz+NKwMLhc9wCpU4Ssme8s0+MGckgmQltCi4rs3ba4?=
 =?us-ascii?Q?8sB76DONjnRmSQpXS372PW6bVOBHRF7+HUOO6o+eNpN7i9rayq4MwDzl34cu?=
 =?us-ascii?Q?5gllBH0iHgBGZDMcpWeFCsVXWwg+JmR/vhfy6J5o+yD706B7OVAQ38FetcmQ?=
 =?us-ascii?Q?6vf5Zt+qYFT0gdFeJEkJpx+bByzzR9xRhgoH4Q0N+kYieSP7Sc+AXPy2avch?=
 =?us-ascii?Q?UM1FpFnIAnmoN1LkspdiUVN/RlJ/MMctfttgxjnVcxoU5J5jLAQoDuqqWn0z?=
 =?us-ascii?Q?ofXfMKiwIcQojRiWPuYdFSEtFRFtxspGz4MqVpPmycfUvLScUGqPi1bXGstZ?=
 =?us-ascii?Q?TqjbgHKbqX+XMOSRYSckbkLE0ThHshZk4cAJLjJAm6FWXB7xPMJrbDRzSICQ?=
 =?us-ascii?Q?nPhC8a6WSfcgo22AgXBLBcwN4vPHdcAFWbDkB3IdRPsC1DNTTWJPuHw7BQZy?=
 =?us-ascii?Q?zKGjOj/UP4g+CJHjXkfcSL4GvuMwHLJDI+OIPp4fg81qQEK1AirXzjU3eK/H?=
 =?us-ascii?Q?5bfJaH1qrXTuqHPxnkGkDvB2cJHVnFKKOV7AKft/nHSGlosqSPhRA4jOQxxB?=
 =?us-ascii?Q?k13h2w1OlMOkdO0ZvCBC0aGmydnTG6Ll1xHZjHMXCbcK1Ny/kYQBk3bcCCbS?=
 =?us-ascii?Q?ZciFPOJHnbEKMfREROyMuYa81xJE1eyAz4VyvylybyAgPA7OLUCBjN53B1+o?=
 =?us-ascii?Q?SsLO3sORzvXeP1EJQJWDUFfcFXFA6shG73PH51MGz26ZkNSmQM5exoKje1Bp?=
 =?us-ascii?Q?Qa8MgVbaQbgjYzNACRwvE9O4/ra4/iSKqrbt4Lwp+i8/Wjrc8QPaIayD0Qdv?=
 =?us-ascii?Q?lt9GQs4GC3RU5w62xUy0+dZdQCcPJevXjeXokgJgzvR8ML6qc2eLPk/XNbJM?=
 =?us-ascii?Q?gHQQGzDRHS9vsrldtNifLjdaEK0+zAZNbwJTDbbW5HfXb0eqMHGDM8K0IKGE?=
 =?us-ascii?Q?BvHw4ptkfGn1MSeiuWEynvd1geynvCHcUSg1D1rKOoo8w0E4dHEd3bbySJtR?=
 =?us-ascii?Q?gm73WqcP01taopN18Afh18kSRqikgH78Ds0ap41T0VQPODbqrYRzPp4dKpwp?=
 =?us-ascii?Q?p4Z3ugF6GRKOvbPr0sqH+x+lws129gA2RJaLW1LTBw/aBHcn+VCt/OLsJcva?=
 =?us-ascii?Q?LT/YEAvs4BArn2MJRjb8go5gcHdK1bVTLwlQGTUpX2rSNUVKXZZm39rUU3LV?=
 =?us-ascii?Q?AqLkwBUGsu73Y6iGjOkN9i0prQkQ01lOCj83ZseY3XxiEI3o3NkUmRZ/+n+J?=
 =?us-ascii?Q?c35HYSSJnCJPtcDyslK0XzGUxQMM8olyW052drRUGASjvcbfGFtr0xDB1/Mq?=
 =?us-ascii?Q?Y7D0rUVjqRRwQKEhdrytJWX7R6EpMVfrO6Wfdd6MinE/9F59/+oN6O3yd9BO?=
 =?us-ascii?Q?HVlLpK6zgSiHQKLnY05wZlqHsXuaDpkQEAYHsuQbrlVqQRyB6Z6xN2H1sSB3?=
 =?us-ascii?Q?vqn1EjNJWBP9epUVGIUTIt8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef9ea67-138f-41c2-798d-08dbff952b91
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 06:47:15.0122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W26tTD3fyxGT63XMfg39iybaDFbYCjpnnfki1h546yb5Zp1xZ4MwPuPOF8yEUPXXhAuoymzMv2JcoTlhIwsoOR/C2q+sZuApHKsO92oACVLveBSINexPGad0uOK1CqAw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5852

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
 drivers/clk/renesas/renesas-cpg-mssr.c | 111 +++++++++++++++++++++++--
 1 file changed, 104 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index cb80d1bf6c7c..23e5a2b46ac1 100644
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
@@ -949,6 +967,78 @@ static const struct dev_pm_ops cpg_mssr_pm = {
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
+			if (it.node != priv->np)
+				continue;
+
+			if (of_phandle_iterator_args(&it, args, MAX_PHANDLE_ARGS) != 2)
+				continue;
+
+			if (args[0] != CPG_MOD)
+				continue;
+
+			ids = krealloc_array(ids, (num + 1), sizeof(*ids), GFP_KERNEL);
+			if (!ids) {
+				of_node_put(it.node);
+				return -ENOMEM;
+			}
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
@@ -1003,14 +1093,20 @@ static int __init cpg_mssr_common_init(struct device *dev,
 	for (i = 0; i < nclks; i++)
 		priv->clks[i] = ERR_PTR(-ENOENT);
 
-	error = of_clk_add_provider(np, cpg_mssr_clk_src_twocell_get, priv);
+	error = cpg_mssr_reserved_init(priv, info);
 	if (error)
 		goto out_err;
 
+	error = of_clk_add_provider(np, cpg_mssr_clk_src_twocell_get, priv);
+	if (error)
+		goto reserve_err;
+
 	cpg_mssr_priv = priv;
 
 	return 0;
 
+reserve_err:
+	cpg_mssr_reserved_exit(priv);
 out_err:
 	if (priv->base)
 		iounmap(priv->base);
@@ -1070,22 +1166,23 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
 					 cpg_mssr_del_clk_provider,
 					 np);
 	if (error)
-		return error;
+		goto reserve_exit;
 
 	error = cpg_mssr_add_clk_domain(dev, info->core_pm_clks,
 					info->num_core_pm_clks);
 	if (error)
-		return error;
+		goto reserve_exit;
 
 	/* Reset Controller not supported for Standby Control SoCs */
 	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
-		return 0;
+		goto reserve_exit;
 
 	error = cpg_mssr_reset_controller_register(priv);
-	if (error)
-		return error;
 
-	return 0;
+reserve_exit:
+	cpg_mssr_reserved_exit(priv);
+
+	return error;
 }
 
 static struct platform_driver cpg_mssr_driver = {
-- 
2.25.1


