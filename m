Return-Path: <linux-renesas-soc+bounces-1180-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AD28166B8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Dec 2023 07:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B33681F21149
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Dec 2023 06:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A726FCA;
	Mon, 18 Dec 2023 06:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="D91H3Th8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2098.outbound.protection.outlook.com [40.107.114.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719D57461;
	Mon, 18 Dec 2023 06:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=erCizFCWpLz2aonr3JAn0jmvoReH7sLg4BrxbDsxjdqpY/+u0wZM0WbLbe696mv8kHgPdErMABd6E+Dh5S8b+cpXAUZaU9RcY2If9fgaie+1AZJPhuTpLXmkU8HpJmgw7/UxZ/BcfVTaDx7HfLZtM6tE5TVkClE6rhWGqR4N1mFp2TU0fJxWccKaOZG1i0g3Rqj/SkHjidNbyKNiPydsBjIxa5T5qTxgT83R0/c+7sa8pszfJ2kjIcdjO1YzvEiO0qxu9Qjzi5lQcOQQ+O8/wgKe1xflD+aXLbHSop2Li9hsqoiBm+T5xVCWvmaa51C+ssziIJBEfrLgVId4c8YR8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RgUkUYtygoxiqzMiBVycBlhtPag3tFrU4SqtSRyEFyI=;
 b=THGaBd8pR5sySjnn+pPGMI82Taf9PLRLUNIQ8bqzirp+mDIldnoktBdMVULB3x5VVDKMwBysesWv3u3/s5GFcK9siIm85xddgAhfMUvOrltpqRPevOWvwRqwJcIFzM6LXWWJ8goT9/egG7RBhVLw2oIsyU++2KOrtPJeFvcQjTPR2gyPyPxfpzGOikP0iN0SeKqDSc6uesLJYWl3onIneRZlff91zyUKdKQE32BKttdCD5JyS9wfks3MxcaE1rvdLYvYd/P102YloziA7PXpCPDRbX6pL7fEp4SGGns9VQNHNqspoITLSsT1rlQckrkowJy6nbcZ5rC1N7Nqr5jlfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgUkUYtygoxiqzMiBVycBlhtPag3tFrU4SqtSRyEFyI=;
 b=D91H3Th8KXphSuSnENkHO3IENVCJ2R1S6G5vfDfJihPMIQOKit7sEFLuVU/qa9ZPBv4pFm4HTBakNwl9fUVjAz4SsKCo2vDtI9mLYociHpvbQYVXW92zXLE7OMAwj042YjRp5G+l4A4lSkKXXSyBOSAC7wykPtvNYA/oRuRb39g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB5852.jpnprd01.prod.outlook.com
 (2603:1096:404:8053::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.16; Mon, 18 Dec
 2023 06:46:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::eadb:ae7b:5fed:8377]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::eadb:ae7b:5fed:8377%5]) with mapi id 15.20.7113.010; Mon, 18 Dec 2023
 06:46:52 +0000
Message-ID: <87le9sm2hx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 2/4] of: add of_get_next_status_child() and makes more generic of_get_next
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
Date: Mon, 18 Dec 2023 06:46:51 +0000
X-ClientProxiedBy: TYWPR01CA0018.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB5852:EE_
X-MS-Office365-Filtering-Correlation-Id: 459888ce-7567-4b14-72b9-08dbff951dd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W/zPpI+Z1IXFEFtYytcfSMFxY46Z6UvSTyHwIG3uBMO6nNPUvRM2FpwCPkv9v+wDJf7xQdTyGoOeFhNfsxouWVhwPgkGzCLzP4QX5ImLMihxSaW9NJWQ3RqYFMeDVN8AFmrtcd0jxE98vwUgsMjS5QCmXl2+jYsQeewuuRpB3bSmVZma4yxOQUp14kdgApEGUokFR4ATXwhyn15nullngekOJPp01WFcahQJLUtH89eX84T5655/FLYd5h6mfkE+Z/PtwE9hvCSm5qZWBpzuI7+dx39wJY0BT6cJO2/iwh/F8eDm30yf64AqdsqF4WPQBqGHapTZVhACGGs4mMq07UoaZ9SKB3OQQVTbIUHovgvD2Nw2m3aSC4vYTjpU80H9ZzE1eDA1IhzyPqAkVLz04parXFM4hflFyiqm7FfLwAWhf4MBm6QTOCCUa+a+3HxebiIBbSc/1YWG7Z6Fr7wa0/WIhbZ7jNo+zKa3rgI55aCdmyDimr7akfASLy0BVxvdPaDkR2w0eThI+vGVUzVNYHg9ijz6pnPtprHTRCNRRH2Hrg2RmMTyZUWCqh78QN8T0eHmWNZoaQZqOz8rSgGfYT0cqcBvcUUCUNyZuPrbD9gdN8fG0SuYALfip8AtBefT5KlpwX/uT91c5fG2wD969P9Fjscf4WR9ABpbFypZgGa0LIPFAl7NdvutcAbC2Txu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39860400002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(36756003)(38350700005)(316002)(83380400001)(110136005)(66476007)(66946007)(54906003)(66556008)(7416002)(2906002)(4326008)(8676002)(8936002)(5660300002)(52116002)(6512007)(38100700002)(107886003)(26005)(478600001)(6486002)(2616005)(86362001)(41300700001)(6506007)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F3Un4D3GnHwjrLrtDgsUqj2nXuWAqF83KsABvuYWyXnLbNivX1PEDQHPEEwP?=
 =?us-ascii?Q?t5AVarEsyNUaAHTo0Qjsym8Y7iSTWo+2bLXpc55u0kZrNcnMT897nzsQX4ic?=
 =?us-ascii?Q?OsJqLtPh883KR2cgSSoL2JlapByJiKIfOmqT6dPx7535EKAdGWKKA0+iO9r9?=
 =?us-ascii?Q?Nj6ZMDv4ZVBYNynV6go2HVuVlHdo4e0cAGwkc/mUMpni4xBd8hIgPIcWYrBV?=
 =?us-ascii?Q?ySSvm2v+acrebaPhwmfb+puzG+10mCG7gPWJ9B4RXjtg37K7s3aQTWaPvhkZ?=
 =?us-ascii?Q?L9p13TY/bFrF2CvhFCG49kspjzSDHCe4MTJ14sS1tW22Eu1Mz+guZxqCre2T?=
 =?us-ascii?Q?WFq9KVf/iB/+JyGrXOKM4Rp9+UGv+KKVZH5dvobJH0dZHq9gOgtImyR1Y13O?=
 =?us-ascii?Q?d2+z1djaF/pEq1bkAhenn3F50Cx3U+fMMRx6M37RrM+Pgj1W5sTzS/zqYDq3?=
 =?us-ascii?Q?onqmzPTaqS7/BNMrTYaAaD8vdqYtuiD9PpuhvAtzzkPDE/He4LImzq4mAwjl?=
 =?us-ascii?Q?ewUt6vek2baIBB6w02rM+U6AUxO1WXxQfJgYjDm4AmK+pGxGitqZ1roL3hDT?=
 =?us-ascii?Q?TXEoOu43NCXuXW8BNYetbbvnN+4508DlxE90ycNy0o59clbq1uz2zDLsATdD?=
 =?us-ascii?Q?ZT2MP5yFZ9aBHZwy3knMOgf/1jsQVc0v/JULPClD3iEsedWpusxrTQg4IGJT?=
 =?us-ascii?Q?40wbtd8ynOLwCsi60RIEMwgaLhxg01a2dgULd8Wo5r8Xlb5X3QoBMR4dNSwm?=
 =?us-ascii?Q?tFa2Dr9xsgR5haJae/POSyOc7c6er8Mz6jlHBiyPYVjWyFZRySk1OC00cuq8?=
 =?us-ascii?Q?qiCayumTviubIaDjsbGo9tlHW/BYQrotZuiztBkH6Hrk2QVoqoM2UKaKZve6?=
 =?us-ascii?Q?BHiGy+sqlqHqmQPPGSjkhUvz9btw7qtjIoU97zx30yLDaWz8aUb34xKrFtrz?=
 =?us-ascii?Q?51DBjddVtGBN218+Y+ldJpzhhsJhc4STySEFjygsgJY3E0n6KuTZLw1eQV+3?=
 =?us-ascii?Q?Y4b68GLps2vdGu0xbZuXSwfgat+OZQcWRmnmqxsAOJyoAejU3STVs4SFoPz4?=
 =?us-ascii?Q?ApNWW8d3zI1WgsFiNRnBuj429ZewBUlJm+AWTxJHuPZRRYu/bGonGJ2lePtw?=
 =?us-ascii?Q?eWbQARipNw2il+NrEouA2WPe0/H8M7F6BiW4rC7Wc2s8MUGAxQOWsoT+SoUC?=
 =?us-ascii?Q?w/RaISnFXHBixHtIWsFeQ8EMOhM9nfZ8neZk2NjyfPezVYuQ2pfZqkrYl9XS?=
 =?us-ascii?Q?kGBz8Wpm6WW1hFMYNGMN7heBZf8PVqRT3CFQaexG2eLbGYBctxOfWQocw3Jn?=
 =?us-ascii?Q?cKLbO/esuo/a3vx2CbriTyNVfiXiDs2WRo4v6OjYFocSy6FNGNHucBKs4SZO?=
 =?us-ascii?Q?5HHiyQOFWGVEyX+j5HE+9ktN/MuhY091//33SFkhZkkW8TlPTVT2TZeYWFNZ?=
 =?us-ascii?Q?eXdunG7iCVz49YlWgpAo2zGtjcpjp21NvIz3lDGTxoacsUmvAcT9qIowsleF?=
 =?us-ascii?Q?7vNMZ3pKX1+F8IwcRHJWbInc0sdQc0pwtWLLH1HIao5vuiUpZxuZuF70yCua?=
 =?us-ascii?Q?8rydj72MwBe2SUfMNqt6EA1nBn8uX75MFm4+v+5sHbFVspWRkBgF74ZE76/2?=
 =?us-ascii?Q?pFXCI5zHuf4EoZYNfUavRZM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 459888ce-7567-4b14-72b9-08dbff951dd4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 06:46:51.9851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ExfKObXlAYDhcMFCNSsa9sXKrTGRmrmqIQ/1Lw2l2zTU7HgjOyzwreE7rUPfhOaSSwnDmFETjcorBkmSgcqLWcq6pSynKcYM8mCxPHZxcJgg9kcl8XqnDbMC33ngms+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5852

Linux Kernel has of_get_next_available_child().
Add more generic of_get_next_status_child() to enable to use same
logic for other status.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/of/base.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 3cb467a7e747..25c841a3882f 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -612,16 +612,9 @@ struct device_node *of_get_next_child(const struct device_node *node,
 }
 EXPORT_SYMBOL(of_get_next_child);
 
-/**
- * of_get_next_available_child - Find the next available child node
- * @node:	parent node
- * @prev:	previous child of the parent node, or NULL to get first
- *
- * This function is like of_get_next_child(), except that it
- * automatically skips any disabled nodes (i.e. status = "disabled").
- */
-struct device_node *of_get_next_available_child(const struct device_node *node,
-	struct device_node *prev)
+static struct device_node *of_get_next_status_child(const struct device_node *node,
+						    struct device_node *prev,
+						    bool (*checker)(const struct device_node *))
 {
 	struct device_node *next;
 	unsigned long flags;
@@ -632,7 +625,7 @@ struct device_node *of_get_next_available_child(const struct device_node *node,
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 	next = prev ? prev->sibling : node->child;
 	for (; next; next = next->sibling) {
-		if (!__of_device_is_available(next))
+		if (!checker(next))
 			continue;
 		if (of_node_get(next))
 			break;
@@ -641,6 +634,20 @@ struct device_node *of_get_next_available_child(const struct device_node *node,
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 	return next;
 }
+
+/**
+ * of_get_next_available_child - Find the next available child node
+ * @node:	parent node
+ * @prev:	previous child of the parent node, or NULL to get first
+ *
+ * This function is like of_get_next_child(), except that it
+ * automatically skips any disabled nodes (i.e. status = "disabled").
+ */
+struct device_node *of_get_next_available_child(const struct device_node *node,
+	struct device_node *prev)
+{
+	return of_get_next_status_child(node, prev, __of_device_is_available);
+}
 EXPORT_SYMBOL(of_get_next_available_child);
 
 /**
-- 
2.25.1


