Return-Path: <linux-renesas-soc+bounces-444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D837FE698
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 03:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48A6EB20E21
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 02:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513A3101EC;
	Thu, 30 Nov 2023 02:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fP9IxvuL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2130.outbound.protection.outlook.com [40.107.113.130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A5ACD5E;
	Wed, 29 Nov 2023 18:15:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FY4PEA2QMMrodVC0OZIwQyIC3T//ZK8/BbxUPR8sbY9iwde/3iv2Y8LTffFmLkszr2oeoFfjZQbsE6uAWEt8iNzK/cUVphyhuEpQd3tfG2HmOZHSM+0LLrnCMSvDSpOr7vxGWFXEKUOjV7xhS+yFM8N9sjP/6Q+nMtHYa/24GavRXWnLw7TanSue+N1DjJggPnCVFsKyHHYfeKShPqMoJcgqmm3xwqzaeqbJ0nqgKL50oX1I8yaeqk/gOCV3IKbhXRFABps586oobbXC4GRnSkLTGVDphd5duEda7XZHZt9c5tVA4kHvGpWSEgtLtbl8gbgMjDCXyR4URHv518m0lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTWnMTnCxeH1ufjME++NKJA16TJrDDuNLjYP9pYIRzE=;
 b=mYiTew5uJG/pdot0sm4hzK4xvE8177FXDHvrD94XwcXk4MRSI3VGnHq0lKPU3HpeOgBGdYYjvnHXGZmw0xt10iU/24/QB+Q4MCO6443JXYfGtXiONtcZ1be3gDk6ppXcZADqYDIIX2AP0/avgChBSh5xuhLesrOszVaf7uThoQe3i3fkJ74GHeqP+Vp6CplFEVAdrmrjdGD+aE2cdJKocYC4kU5Vh/jeokkTvtsoaCSjZWSHieCPBEepVCXyuJfIXNKVazyKk6rDjtLbwBMKQfHMSE1PDbkaDuATCsjyO9pRTarYATHrbU1KBueqUZBajaGguYCqDZLKrpAbO7yAEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTWnMTnCxeH1ufjME++NKJA16TJrDDuNLjYP9pYIRzE=;
 b=fP9IxvuLxxFdANlqEUUo8q0mqOwXg6W1BkI9gUdD8krQrovkoOcAPWJoiB3UyCVpndj73t1yDgmTlg7JkuqRxuqTgMwL6TEXFldXr3ntb5PPLgIp0m+lRdr51PUO32F5p4ElJyHVeCv0cT9INf9bg6RiiSlkDA1UnMaSA2qVMsI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10743.jpnprd01.prod.outlook.com
 (2603:1096:400:2a7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 02:15:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92%4]) with mapi id 15.20.7046.015; Thu, 30 Nov 2023
 02:15:32 +0000
Message-ID: <87plzs0ywr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 4/4] drivers: clk: renesas: ignore all clocks which is assinged to non Linux system
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
In-Reply-To: <87v89k0yyj.wl-kuninori.morimoto.gx@renesas.com>
References: <87v89k0yyj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 Nov 2023 02:15:32 +0000
X-ClientProxiedBy: TY2PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:404:a6::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10743:EE_
X-MS-Office365-Filtering-Correlation-Id: fdb729e6-66de-44a8-db18-08dbf14a3b3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P/mJL3NbMuvbXWv4whPUiO9WVUcB5awHE2lK/c0d2VCCtQHwiwsjve9uwVt0W1h9pxvbazz0pFSbUSacXrzULspnLiepmE507Qo5fvb7yOLrgoxt3q0L3Kbn9PwOlweJxZxZUtrfIRfwDdRvMlEbJL2NecKC4poec81vOd/gdogVbGYkYXifyfbE9wlk3NeDW+lauoMQdMmcVsmWfSwG9ZbB44mzZ3eZTf/PVG3SfIevpeVsqmHWF0fVQb8pBxj7UGB7NYp3B3t63yD+bYUc9vrUnaOUzBfQErSZLbCaEGXX7EZlKd8uCdlaUgtZcNErXn3adiZHBUHfidCfUi/eLLBMlp/nXnfaV+PBj856gx4ghVYwsRFR4idkjHmvzEbvre2YMqccfS84rVfH4aXXIcZ1Nq8gkxiXrWOdLTSsnSyLNAqqvkioncmPhZjv+3R11A4gSXvgY0qeZnCbkXxY5zMCY/hq9lHKY57TBqbJILKRYdkIV2Hvu6YeFkEOQmd8frDMNooYpAaT+Vb62xjVNy3BKMpRJhKfbzMsOwm5XPBqTw/ZqFJNCKEWkh98znm+P/Mva4rcLzevCwMLJQNhljphA52FLTNKqQPfYUYirD9RquCr77dHUfUOjcEfzRqqPZLL7NCK2I9EfpF67FwNFcozo6LI/ZCBbN8f3gZUQdM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(39860400002)(366004)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38350700005)(202311291699003)(66476007)(66946007)(54906003)(66556008)(38100700002)(86362001)(36756003)(83380400001)(6506007)(26005)(2616005)(6512007)(107886003)(52116002)(6486002)(2906002)(966005)(110136005)(316002)(478600001)(5660300002)(4326008)(8676002)(41300700001)(7416002)(8936002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S3Q8ZsVn6lFGf8g9YvFooakiIo6LatKicvEN+p2wgp8G6Ox7y6+MMxYYrfX3?=
 =?us-ascii?Q?7TSfNPE4QGsOFT4VpZuB2jREWEBrEvkXXQS/wZWzFIqJcJzcYeW+PgzZv7dt?=
 =?us-ascii?Q?iSn/pMPA3pX+TC6+p2lUC2bHHu7DH/nAc08c3qAVObC1dwUEnJv7BkkZtw+F?=
 =?us-ascii?Q?nNBHRfceeQ49DnAZ0w2+DKE2ss/p6TKHeGQVWK/ZfQfv7Bie5Wuy4OctKMlw?=
 =?us-ascii?Q?0OXmLi6MzN62o1dYUtz+RAwqVsiVKQiMLS0+fkJH7gCeZps6knMPIzpmTK6D?=
 =?us-ascii?Q?hHSiT2/xn9dSkB9Z2HppR7/+IA77aK6PqKBTubfSjchp+sUYYF6a8DJ9QZih?=
 =?us-ascii?Q?uGuTKImfn/rOsgsBnMhObXtDgKcsZdvRDzIRg4fqgT8XMZ/hF6ZJFaL1uR0C?=
 =?us-ascii?Q?9Xwj9ttJkWhbfb0dANI7bmOCQ9A1KliY9kiT2WcEgNyFR8KdXP6TFdY5qKET?=
 =?us-ascii?Q?0FW0dC9Pa/YqXrGbkjqcDiws4VsOB+TpOHxEDpk3aVTyGCR9I0OZqX5V0n0A?=
 =?us-ascii?Q?r/hdGNnbEIbfZW34t7H1mBBgbBdoZIJFu0oz1Zwtf0J54FIo+DH5Sc70+vxn?=
 =?us-ascii?Q?xrob/NsH0NdOLwrCCZ8Rla5AtSHOJ9I6QcZfpCLepyKnC01gy+Nun3T42ADj?=
 =?us-ascii?Q?1vwT5VmwkLBV9+j/qqIgXpNOHjpc3UC3Hg8L4FpbmHW+LCHWE21LSXYb8jWU?=
 =?us-ascii?Q?nPO/A9rb42wKQfEeVnQn2WJGrYjRbgosi6SlAUoAn3b1u84wY+1SJkBnfN8L?=
 =?us-ascii?Q?zPsbYjZc1wO8K1eByUcR8H2vHw2Xjb5zLnlEA/AUuJUfGRcTpk85teC3oieE?=
 =?us-ascii?Q?rlvLyPB32dFpk3xRLF8HxlihxuvGcJfuddIeLdG6PTmRvxmD/j3hu3FDj7eh?=
 =?us-ascii?Q?dFj+W+an9INFFJh3P/WXFkdrMSr3uSuQr4p5YB+ILU2smD0QqnkEWCEiz/r6?=
 =?us-ascii?Q?fSoS5YwKTllrNhkwZk75YldwffYLa3fZV7v65LrFR/egjQqLdXK9IzJFzD78?=
 =?us-ascii?Q?F6jAFBr8qicCr8NIqmc2moQXd3vg8NwOA9CI4FIBVzjfDX2mmk9yaG7/0nem?=
 =?us-ascii?Q?OjgrKz+Wm9LuOVrVlqxdnKW80bVB0UbXMozXcBNgLWgMMggbdqNWeK/Dud1u?=
 =?us-ascii?Q?reVNrHvUFs52Gfe7bVvjJXTkOlqF3wea7mVo2+LyopE5+1i/Jdi403lZSmeE?=
 =?us-ascii?Q?JpJ7paT4XAoqcXH8d+1TXkVn9beFkcXH1TRGbM6rp5z1e+jiXjye787ilYuV?=
 =?us-ascii?Q?ZI0ebWYYKGnG8XwAvnU/LaWvpjOrtcxDocqVEGikiVnDUnB6YRstNVfFbuPI?=
 =?us-ascii?Q?YBp7gI7V/RFUAZR0C0hBMUT24GPeJ3kThmS1/GMHELtWW4WD41puuJkK4Gxt?=
 =?us-ascii?Q?ikDoFm3LyCa+dOm43/U8O5/K40CwnDJW6Kgvjb54+4ZVC4xzd4RuiC9aAG6T?=
 =?us-ascii?Q?ymOxFCcB6R/Wd3tNZHBoKzAc+v42b0x51Njfwt5hwlgxQN55jR9pzcvFRJjH?=
 =?us-ascii?Q?3Ckb40WQhr+FoRbDYVO0bx+1PTRN7l9MEP+nNI+qUA4+RJA/0ljDWj9qf0ql?=
 =?us-ascii?Q?kkpfokiLVbdbFS4qxe67cU3+rHUKBgPlWY13dKSpuOKr+Z35a/+9QAOlcAf2?=
 =?us-ascii?Q?ltkG7MQMe0XXNgzO+al4QEQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb729e6-66de-44a8-db18-08dbf14a3b3c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 02:15:32.8758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: elX8ogcFAcSnPoqkrDRT0/UvHfwbYpTY2yvcxMU9Mcm8mZ6TJSnswBhw+sQwJ4Zv/ldLCwF1ay3qfBh5pISuxQkvAlwImbId9wIQmjKWPuK/xHI7UiteTw8ix8uurFTB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10743

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


