Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F33C07EA741
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Nov 2023 01:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbjKNABY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Nov 2023 19:01:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjKNABW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2023 19:01:22 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2119.outbound.protection.outlook.com [40.107.113.119])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F41B8F;
        Mon, 13 Nov 2023 16:01:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cncPCWvngDc7vRqcZrxDDrkkUOpuGHAJxk6Myr2dxFIpsgDjLsep9hUx3gg2nOB2pXOAeBexy+Izl7fsp0yKYovhh7RDYFHToJUI5e6G9H4LZ44TbzuFxvEciySRFEtPZqFhNCCeEOqh1+oPm0e6qVg0HLpX+Gsz6DJhOWz0BI/rozH9hRkebprwYVEnIy9WAqafrnb/uTQ+qVCv3ah7ccXr+KwYPTyPyiLD+tPMoZ0aMfL4RdJOHvE6fcuwQTb2+QQuG/BMXaA4gCMWyTFU7j0i4OyO+mRUdxHIe3kFoja1jmQoP2Ae4sqUzSpmTrqXkBXthOCcdCoXWh13y9VUbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdktfjz2lJH/KxhVkiMrCFUDnis51AP2tx175npcUpg=;
 b=HWgEVgfl25vq8pZDZGCopmv6ELK1coWxsOsv1iBwvy7OzLX9GDRWtASLMFzNDueURbCZk3JDSE6K+M9K3Swy17LD/Pxw+TTGXiO8sToyF7uoPJWm0iIBsXia4I0tG9cVmIbQmazYLI7vSjsS3xrR8oS6e2b22evVeQj8kKJBiAp5BBWu3nnCK2c5XAIjpBGtZ7Uz630OahF8A+J0plblQX8xOD033YiNqSptZNGz3mjBeqsQsFp8MxWyRBbj0QWmy1cny1UCB4qjmn7A2G6aW4JvTj+aWhnNy+kAGo0gWXtio/l/cgAs5ncFH0W90/UFTCDTiEVtiVFHB8QKyCIOjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdktfjz2lJH/KxhVkiMrCFUDnis51AP2tx175npcUpg=;
 b=O1VRsLahGEA/TA9i8DyJpjN3hcDot0QGXy2ajeXDoAYw39HdVBcs9rhrM0ubaTPAqsMlFJhmCb9eKgZOrwsP/Ymtm3fMN4d8Vo+kJqMoEESG/d9E2lmcQkEAzvHNluP1Kl+bzqocWLUsx4xF/njHsYCjtAao3KnBaOXnUkP/DPM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com (2603:1096:603:1a::14)
 by TYVPR01MB11169.jpnprd01.prod.outlook.com (2603:1096:400:36b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 00:01:15 +0000
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d]) by OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d%4]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 00:01:14 +0000
Message-ID: <87wmulrynq.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Frank Rowand <frowand.list@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Aymeric Aillet <aymeric.aillet@iot.bzh>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>
In-Reply-To: <8734x9tda9.wl-kuninori.morimoto.gx@renesas.com>
References: <8734x9tda9.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/4] drivers: clk: renesas: enable all clocks which is assinged to non Linux system
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Nov 2023 00:01:14 +0000
X-ClientProxiedBy: TY2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:404:42::29) To OSAPR01MB2178.jpnprd01.prod.outlook.com
 (2603:1096:603:1a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSAPR01MB2178:EE_|TYVPR01MB11169:EE_
X-MS-Office365-Filtering-Correlation-Id: 17b303c6-1fee-4bfb-8590-08dbe4a4d189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5EjSx4GrJnXno+gDpY/fkdtsaUhh7o1NCUojJH9jTjLdYs3VqhzjSw6II7CylPz+TwIYbk1iP6xw4ua7gmRUe3c/d73HR1stSAIagOZNzvByNPx0AGTd/qbpp//gewxibOr6nR+Oo9lFxjO6nwoSW97RAZU4FLgJT2WUnZX6URamSHrWTTzeJJhgzlHcQg7GSowgTVzCcP2N4qKAaKkOHqOGdg6DBi6/+K49K35fD7vaDPmqA9FYWKxI5c+cwJK7H44VGDvGEwWyQMdtKSp+R1tAWbfKPSzfYnUeHd1AVQhN+9LZZBF7j3bo7cDm7jdjgtpLK0doGkGXcpJ9VD3LuAqTkrV291DR+yyvRtCXFtXnxWdeu5gMz8zSONsHFnY4Cm3a58jHZWmiubCFpRJAoyrxEqLG1VVlPAcFcdPv/iWnqgt3Ov7b3CmXuQHdLUvuE4wVio6ybeuDIJCXIrov4LCbS4t4TWnsW06ac/YrIfgSwN+8wihCURj2OeYLEWCNxIj+sg8rXYN80ihBqz6kUtusPWRG6YZwkgt8yPMqtH/Rz+ULoKHUvAmOJaI4Bmurzm3enMC5Zdsiy274dXtSGYcqZ82skQK0KQ2klZ5b5jH/fcAF+YbT3/shvMZ8M/9L
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(366004)(376002)(396003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(38350700005)(66946007)(66476007)(66556008)(110136005)(54906003)(38100700002)(26005)(316002)(36756003)(86362001)(6512007)(83380400001)(52116002)(107886003)(2616005)(6506007)(6486002)(2906002)(478600001)(966005)(5660300002)(4326008)(41300700001)(8676002)(8936002)(7416002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bIISJLYh6cCMPAyQv2ttcJj/FiZvw1DzIgojQFXkGv/tujMDPQQSGzPezLXB?=
 =?us-ascii?Q?l6r5PgrMAdPseEMi0J0KWiKqoSqbVwS/fy6TYGk1Hfl1mzd1D/fsuj37nHLt?=
 =?us-ascii?Q?zn9DDPzvLdXaAzMAgl+EmzD4MgKgvmap0Va/h6Qb8smXgNS1V+jT0lboUFAp?=
 =?us-ascii?Q?pLNKRuQVav4Uxl6ae9hzD6CTFYTuz1EPvDe84QOhNqWTIXIdm9vnNgK7sI8d?=
 =?us-ascii?Q?FzJO6TkVTFWuV4DwxglIVQZqRT44Mee+fcAnOYmbOKV/u6elHsA3UPi+WG5+?=
 =?us-ascii?Q?FFyAS+WxJ5RZje5Z8nIltCxb7scut4kbqbeiOT03ieAPRsRKG4vU2B+pFPor?=
 =?us-ascii?Q?+evaeaKlcKdXUajlplbM5m2n/EklNocaUP1jdJe81Fd1fWQuJsedwujE9ZBv?=
 =?us-ascii?Q?Qe2BdRyOBEmr+uwnhghP2MCi5o2CVJNtB9xLIXTybRToGcJTsditlmHz5gm+?=
 =?us-ascii?Q?NCPIinj6lMiMmMA4KQoklh57S3c92hK0DJLV+RM6P+gBdw9xJHtQ5LqAwYXz?=
 =?us-ascii?Q?WNdQlczP92IkzTWTIaFeHu4U12PnqM9craBnvyE1DX5udMuu3IA6DvSqDp7r?=
 =?us-ascii?Q?RUdbRfpSgQ+N0c2hGBXy61dLOis8C7yafzuyOlL6OVOWbMsU3tufeOHC+9tp?=
 =?us-ascii?Q?wa2X6Xyzi2TjGS8S0i9m5X1Ob4S/w/7BsCqNYbipc61fjqqMPZyBiXZ70/Kn?=
 =?us-ascii?Q?Sws6nTz0NVOo/VVA3rWQoFuCM2T56IC/k0aDuJarC3mqrXx4U1RkLzW/BbqL?=
 =?us-ascii?Q?qr/OyMY3ZI8HsFYcsJRMhcDZdroIeG8GmGrkTAiveCGlxJgDw/JGKJkfKcyt?=
 =?us-ascii?Q?ZYMGIgKefMeUEcHz6CucjyA4pIMR9nEDyPn6yFLMDTJmKz3dw9SUbwPqLfix?=
 =?us-ascii?Q?7jKokTQz0CX7nQpf7h1UOBJcBymXo6Uvv9V/osSvdwomZtdy0za3sfGhlLFz?=
 =?us-ascii?Q?irLoCksZ20LuU7I6y93wqduhVfvgdvkdx+EijEFKIlEKfawvM2PY4foRGWS3?=
 =?us-ascii?Q?lA2rqVnG0xQILE2FdtZDqWX5apOjqqvn/3BEHds/GOCLOlAXPC7QbBN33Goe?=
 =?us-ascii?Q?ufjJYkII4mNc7LBe5LanxBXG4LWQfjqlwJqFOuev/rE2E1EQcQaAwl0vrX5U?=
 =?us-ascii?Q?zr98ipDb6ipd20/42OSFLYUJhae5kcUh/xTKaYFCMBjrvL2t6tyPUNZOEoGv?=
 =?us-ascii?Q?94f3gNezz05VoiK+MYJZh6mHMxj3uw34r7IWc7gYsz++M0Qessvo1nLzJf0m?=
 =?us-ascii?Q?IyVpBHIDg7h1tj1sHX/nqzMFSZcJyr84+r0aymg0sNqjblxhu9448EsN63Ec?=
 =?us-ascii?Q?i8Z4z+jJiulvZlrdQGkFZgD5dixoA1+aiT6hz4CqypjUfgrkFt+YdDkHf0ui?=
 =?us-ascii?Q?8U6q9SJQoTjRuKfvW+FCiuVFhk74dvMTauIo+naXB+SB4gBcomkZ93hGbxH1?=
 =?us-ascii?Q?+nQcVlFLZxD4QMpBnZ+U96WhbOwTrarWCTLmKydZM7TD44toCapaw24geZL6?=
 =?us-ascii?Q?UNACjKE2j1rJdfal6+xnzVfZXWqmgsR2mLfA04lV+67G6Z4dxqr3VhoFrDv9?=
 =?us-ascii?Q?X5yfac2NxlbvURueo8PzZJUwZexh3sva/+Wg1hL8T+BYVbOa7K7qMkH+QiL7?=
 =?us-ascii?Q?Xrb4hkV3w9lWpaZBfltynB8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b303c6-1fee-4bfb-8590-08dbe4a4d189
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 00:01:14.7529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DlME/BV1WIcgIab6qOkSDPr7dhB2ukkAmZe34z7nW2GtOX6AZK0pEs6T0F6FOroLxQriK0xpcrHbIdzxWRTZL35Mdiexj/77NiNWjAiqWhhZoOW3N/0MHV78YRsH7U6g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11169
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

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
 drivers/clk/renesas/renesas-cpg-mssr.c | 116 +++++++++++++++++++++++--
 1 file changed, 107 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index cb80d1bf6c7c..3781861bdfa0 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -168,6 +168,9 @@ struct cpg_mssr_priv {
 		u32 val;
 	} smstpcr_saved[ARRAY_SIZE(mstpsr_for_gen4)];
 
+	unsigned int *reserved_ids;
+	unsigned int num_reserved_ids;
+
 	struct clk *clks[];
 };
 
@@ -453,6 +456,19 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
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
@@ -949,6 +965,75 @@ static const struct dev_pm_ops cpg_mssr_pm = {
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
@@ -1012,9 +1097,7 @@ static int __init cpg_mssr_common_init(struct device *dev,
 	return 0;
 
 out_err:
-	if (priv->base)
-		iounmap(priv->base);
-	kfree(priv);
+	cpg_mssr_common_exit(priv);
 
 	return error;
 }
@@ -1029,6 +1112,10 @@ void __init cpg_mssr_early_init(struct device_node *np,
 	if (error)
 		return;
 
+	error = cpg_mssr_reserved_init(cpg_mssr_priv, info);
+	if (error)
+		goto err;
+
 	for (i = 0; i < info->num_early_core_clks; i++)
 		cpg_mssr_register_core_clk(&info->early_core_clks[i], info,
 					   cpg_mssr_priv);
@@ -1037,6 +1124,12 @@ void __init cpg_mssr_early_init(struct device_node *np,
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
@@ -1060,6 +1153,10 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
 	priv->dev = dev;
 	dev_set_drvdata(dev, priv);
 
+	error = cpg_mssr_reserved_init(priv, info);
+	if (error)
+		return error;
+
 	for (i = 0; i < info->num_core_clks; i++)
 		cpg_mssr_register_core_clk(&info->core_clks[i], info, priv);
 
@@ -1070,22 +1167,23 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
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

