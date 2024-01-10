Return-Path: <linux-renesas-soc+bounces-1451-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A58F8291EE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 02:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 058642847C7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 01:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1125EC7;
	Wed, 10 Jan 2024 01:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IoUdL9Xe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2110.outbound.protection.outlook.com [40.107.113.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FD9184E;
	Wed, 10 Jan 2024 01:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XH2P6PovrdVUEOJshi3rPCFwYmUAl1fMVrlR/LtYWkBJrVWi2ZccU1N/jOwWV1ilWKzhrwHMm2z2hRZ2NEEiapRwsPUX919HGQefBu7MpEDS/0DMGa9I71hUq1S7USwaMMglUTchqIt1u77jxI6ZUH/WXpKuki5EDJECrZxPSI1JqZen5z8mXPo0xRU/4Xl+FiX11O5uXo31AssergLNmw6Y75pjmYAHm2Ah/za9h5ImR7OPIBpcjW8G7mxGx+lL5qVvTpMAPhJICbbMDVG5RVN8jlpuwqAhNsmt0+AkXFkSJGnEwRBWIoS+n5nlsNsTTqpQPnu4N+1U0mx6BsUDbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlnzplvKddfmHf9/l66OOIE8xFIgHGzMXbzFgKHljAg=;
 b=D+UHyRX2mfE028afxXZG5grU/S6GKljzCmRExH36MW3XMaYwzTQEMA5e9zKdmNlRXXItW3Su0Tt0Rt+n5TBS2z7BfWtBGLEMgAqN5smojz9+8W+dQTdZg9xujFLIilD4Yl9PGDpsTnZjR4AjlfOGNk57yCQt79JX+5lQYki7xSOqJmxkvq+5omcHKSYqSakvstdKVHA+8BqixL7BqPcMWSF1EkghWFa7fMRaCHCvwJCoEmKH5xU63jTAgcwfIszsCS3LWE8HWrb59EXbfR/nUv0t5L4DL6OnIGJZytKL5PhifyEWJrH7cHNn16S/3qo9AGL81yD8PiQxKvWdXGGbiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlnzplvKddfmHf9/l66OOIE8xFIgHGzMXbzFgKHljAg=;
 b=IoUdL9XeLICBodZ9J/PWdJYYPsO4Gsh83AJ0H6r5tZh1o4UixKmpxTWMolSwUwQI+hChFPPl5kjuAI2N/qGNfBmyLhbezPNpoTuhmORDUdbxH5oWK7c1sqOy+29wgWwz5yicOj0n1+ZS63XHMusDx4ilaj9uGt7cyPdc1Qse+ok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8442.jpnprd01.prod.outlook.com
 (2603:1096:604:195::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Wed, 10 Jan
 2024 01:14:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 01:14:55 +0000
Message-ID: <878r4ygfap.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 resend 4/4] drivers: clk: renesas: ignore all clocks which are assigned to non-Linux system
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
In-Reply-To: <87edeqgfbu.wl-kuninori.morimoto.gx@renesas.com>
References: <87edeqgfbu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 10 Jan 2024 01:14:55 +0000
X-ClientProxiedBy: TYCP301CA0016.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: 23d7efa8-35be-4f99-9d58-08dc11798e23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CQ+jKd30vp+nfb4kKr29bjRvKwXwRe3HTtvR4adXip934JEEAg793k1+tUjNhXMUG85Ltu7S43dtrfSW1+Tz+wJgvx+j5dnDLvGHm1DNx78kcHHcagIT6U51Gi72mlzkQ5SV1JMZO9NHDFWz3yRNvxCN4wQ1O6dV3V/QXfhK73EPh1uQyDnavQgOrBgtj5dGx0kauKs++N1L8/E/ClxbEg8y/8uEhLfdnYAht2/HOUtS/GHDPkIUHJLqzSXyqWzm5KcPlS1XejLAMUlefwX0pLCsRGsC7afsPRpAJBvjhw3n2QSHargRIpcKBKalLL2Z545Kk7Rehh0CiVxlp5xE424wJe3OSNh65jMXlP7Lok0lhYXNx+pP4CDNqk5zHu57QE91wZZU8skkYrZvzkw6Kj+dq+MCw1X2+bs33OShmxviNoWiR7MFlu+u4SJILD3w3s46RaEeLlyPaN3z9eixj6rW2rsGWeIkkCRImQGdcXJ5wrfa8tHRPsSZV+uZBIXRjkoa1pvrlrS0lIFJ+hgixo+VjrW/glyddpYO9oG9VxBRGZpbaHxe8zwbnK6PwfgvawGd5rQpjbMA/a923izpWjtfm/qm0P11+/FK7LE56MtpW9xGsMxUMETd4uVuPWLs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(366004)(376002)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(38100700002)(478600001)(6486002)(83380400001)(966005)(54906003)(8936002)(8676002)(66556008)(66476007)(4326008)(110136005)(316002)(66946007)(36756003)(52116002)(107886003)(2616005)(26005)(6512007)(86362001)(6506007)(2906002)(38350700005)(5660300002)(7416002)(41300700001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hPykYv94PeTBqcpA20AA7GeRy8kVehxkrmzhLsPoXzA27gZAtNdtixPLcUVn?=
 =?us-ascii?Q?Im18T/QHfrQ9R2k8ahmNswC0o/xyVAHEmOOC0tH5dHp2dDjMwuCpRqFkKqPU?=
 =?us-ascii?Q?7QfJbaVJpQZBbLEtBSB6ZOaYwK/UGDj55Ot1349q9AbSebh1jOgdrOC5FoVo?=
 =?us-ascii?Q?4yGFq8OfbsLM6GP60wJzHwBIU+2r+/0vlVPYjJR3fZXQvIwFlLFR1WW3+fVh?=
 =?us-ascii?Q?hI9SF8f9IgvrsFB29rXyzIL+nqunEC+SQcLl74kWo+tO/pz7jT327NzRJvVb?=
 =?us-ascii?Q?Xx5G3jPKS0R9hYo33sEJJFQ9C59tw4bImyl5Get/sPVsnqELShZl1srzrEqs?=
 =?us-ascii?Q?l8/1faE3mXL2h6IPK+N0uHJoS1Ybu2mObAWZ6p2AKDe9NLqCR1FRSMHPm/Uv?=
 =?us-ascii?Q?sopv+IrgfBP6SpuRI74Gkr6Z/n38vYB9YZsJO9t1oRavaqlOxJeLIhcY9YEi?=
 =?us-ascii?Q?w8r98Qkl/SGHb4FhoeS8SqHNfxIGxrfM3FqWFr8HFrDwKs6NQlXMwrwOMY0c?=
 =?us-ascii?Q?ePDUzs2AO5KhrGOnHlfnCubdHKDumqQCNiEjaTrpM6m1u91GqMfaIAIodis2?=
 =?us-ascii?Q?ytF2hxg2nO37cHCbUg6pkJB2WxExpBLq/myN1b/3LxhzkpGmGKL4yQJqTYIs?=
 =?us-ascii?Q?shgvRaPStiutFQfLSxwgHa8FGxoqWjFYaqFXBzll09Zmh26x39RzF9n7bd9w?=
 =?us-ascii?Q?vKqqyGreGlBsjQalcRL/p6G8OA3vMBuRZWqiKbbwtIwUl77rsOUN+PGQM1gL?=
 =?us-ascii?Q?1N3aWlunKKqatwd+RHNYa3D+eZUBfAUx0cx5DjGY8K15o7B4B5HkPl54OD4N?=
 =?us-ascii?Q?5+D6U/YSlP8e4M8YhNYmoiYxS3c/prmNLIh/LWiQMxq0EtkkkqgwDBTh3yap?=
 =?us-ascii?Q?+vdbA/lffDbdPdxCBPNixwb1fjegtDzeKar97SLfQBGwkrVPMmFGt3Bj6/xy?=
 =?us-ascii?Q?e656M71jJBPwG0qFIuSJ/u74doPOLe9g3RRMS0mUcWM//PnXw/YCTcils7C9?=
 =?us-ascii?Q?b99ykPnGi2ejG5+wYA4pqY93kUY0fhd/x17odjapdDx1OSQ6OGQwygxBwat3?=
 =?us-ascii?Q?GOzg6kQUk8cySPwaTdt46N5P5mwukDXkheJ1+qqJzI+2gPJfqkE38I+Fn7cl?=
 =?us-ascii?Q?uIxVQGSrEaSPDg0Zb7VBykR8IQjd/KQOOy3TSKGpo9+mZcudYwhoHsLFMfA4?=
 =?us-ascii?Q?w2hYt134yGjz/tqa39BqHYkoHIdKKpmNPpFL9HGUwlGseXTx5tX8vV7iWYKC?=
 =?us-ascii?Q?bhL1HRKnIBqhXtTNpSIfD/8xhYTLvaqN9A6kFinmyqY1LW+G3eJjzA7nFssg?=
 =?us-ascii?Q?TwYHjhrnVT9JHKClEzUG4oak6lOPJN8qhzSnxH5X0KpABmxdJFMKVVswSvvM?=
 =?us-ascii?Q?5xXQT2xWVwAOP1SCSmOowxWDe7EXdQxKpfWXeoJYQnTIpv1QBuMHgN+P8fE/?=
 =?us-ascii?Q?G6EPyjwQM0eV8TpSgr93OJBQ2guhsmL3RtXDcanbnSNKNtMP7Zr+eLJJGmEp?=
 =?us-ascii?Q?DqA+pjJuHeuBwEbww+5n5dzTzcDOSFJ0hpUiJy48WuPMgT4F7gahvtnAqh8E?=
 =?us-ascii?Q?/3UNXFpW0cI+SxkqwIS5C0mNDPZH87UKOgqPmvjED+FSmtuK/76IZOimSjrm?=
 =?us-ascii?Q?D2vg4nAhvNwIzevOF00id58=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d7efa8-35be-4f99-9d58-08dc11798e23
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 01:14:55.4697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjCy3WHT7vQdAhx72Oej+Es5S7+LdHKmuvEGlOpvPP+MnFZfM6j/SZPBR4uKd+vi+azVVwxip9xJknCm0m3dHctveyF4chOzpdO9g4hWtb+Azo8JJBbYlXMrttYfT9IY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8442

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


