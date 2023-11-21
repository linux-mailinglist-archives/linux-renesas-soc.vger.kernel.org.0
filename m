Return-Path: <linux-renesas-soc+bounces-6-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A51607F238D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 03:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6081C28289A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 02:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28AD13AC8;
	Tue, 21 Nov 2023 02:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UOrmnmEO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2134.outbound.protection.outlook.com [40.107.114.134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7856F85;
	Mon, 20 Nov 2023 18:05:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpsOc9MoxDj25IDnBDKaDnGq0NkEgTaDxw41zj6abUMoZ1JNp2SJCYYkUKHrAJ8UwXMuAaL+CszyI/cGgiH2n/hv5EU9XhFqi7Px5Wry6JhwGV4p0T38UOyvTGHnVVPdeiq4XJnm6adQt7+S7cGkA6WRyWU3KQ3iohz3fyQRTeZbLq3/VtSCyyHyrvZWd/8tEzU0kEJrPsFOHQuqZNpIfx4BdxRzTFafseuhiH8/hhMFG442InZYhycD0N05HFcN0yW7O8/mLTdrxrwO3wEgHIjf24zy33kIzM/1YoYsuPKqj2wqSafD7akEyBl7tN+7ZY7HcMi5HZKK1R/EJtix0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJ9np3T+wOYwhmN8Vc0TSzIL7szs5pjdyC+crr80IMA=;
 b=GYd87EpwiIfnm48HwqocMrxW5CMSv03AI+u2lJFHUbbLRTrct4cgceu4qleVF7RkJuoXeFqW8V5Zrd98q4BJL54vBhspQQ84YSYfC8I+pJerPnwtsnVisQfvCasIdzDODRGAQ2SGyLB9/jf5o7zd4aY4qDnScBG3pQs9ckkDqNNilaB/ybKMhLfk4nfYK1U/FXVArjpLnSD9I8Xsnvo1AXX2XfR3AuXNzx5r579Si7e1a8+r6gfW1jCgTg7Bu7ntMphV7SWJsEQVbCyj0XIauyWUvtfVzjiE/G/8/luYf1DWFmTWUfhIiOiBBNFVfgfCoOkXV7Wn6WgdAZ1XtCyOWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJ9np3T+wOYwhmN8Vc0TSzIL7szs5pjdyC+crr80IMA=;
 b=UOrmnmEOvUO2yoPJlfKYjzJOzxwioSkC4DtPMbtvawSvxpR5JdymfyYAuEvIwf95EGrCQpEm9MOFjrVGV3ERr6crZ3KgAKUttedo/KKAa87V0GfQPOdBlNO/huH3UhlmYfLIVD0Rt+RQ89eSEtjkCsm8gE/7/PiABWqJtz31G4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8610.jpnprd01.prod.outlook.com
 (2603:1096:604:18d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 02:05:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846%6]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 02:05:30 +0000
Message-ID: <87cyw3c13p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/4] of: add __of_get_next_status_child() and makes more generic of_get_next
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
Date: Tue, 21 Nov 2023 02:05:30 +0000
X-ClientProxiedBy: TYCP286CA0221.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8610:EE_
X-MS-Office365-Filtering-Correlation-Id: caceef08-ad15-44a8-8ecc-08dbea3656ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ObcR/TxCYhRbDgNJWiIVSuKpk7mJqWNs82/rAu/gVtKR6ic8tn6dixgXGS8afM/u6iEijalTk+FPoymT2//cnpkekLoN+mgGZILZXPAUXloo6L1VnwpUN3FYg1IH8JQ+PYUwi1iBpLoYFi+kyh6/5iv875mYmsY1UeXqmHyxw7WNtM4jErwGp2V8NdniJVldpu2p4f0jb4jjf5eLZVh+/zoNMC6oOya86CgoTMZN5keONae4W8SPidMdi0757IU2p8QL0lKh4ddiG2oldOy3ybxtHtNoUXIdBtasucJtPKpRhFoXivR+qe6OzXJyRHsfCGgwIiNtVvpxsfa2lgbFQPHP4tgAywpe1TEkeYllwkHVYx2YtpTJOun+F5jDfKG3fW4YOjAa43WojvhudJs/w5YMjYYrWctkjglt1CmOxaG1u6NYLhhGZ7PtdZu6YK62AmP1y/ikTAZXBHYQCbHfDamSQoj5EYpbuvQmz1l22OWUWatznqdTlupZ9MuWxXUMMjB8AHZBWM3tLxPBpddRgAwsN9uFbLyhmjWWm2MmN5SYAvNeD4mZpSSUcyjmzfjLGvvzdg7I/6d2Onx/nLH1gGWZXmrQPLdry3T0E9KdnkUK4I6YVcEzwOqZ4g1z3OOe1heFsfeLmFMy+uyrAXPo0Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(376002)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(2906002)(4326008)(8676002)(8936002)(86362001)(7416002)(5660300002)(38350700005)(41300700001)(36756003)(26005)(83380400001)(52116002)(6512007)(6506007)(2616005)(107886003)(38100700002)(316002)(66476007)(54906003)(66556008)(66946007)(478600001)(110136005)(6486002)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yb6UwgCjmB1/nTe+X8wxtE/IZ2gxcx+Y/mGOyafg1Sk4YyaIXrn+tgJVOSiT?=
 =?us-ascii?Q?58sQR5XGuxJ9k6tFS/cNCozrW82/daI3GStFw5Yg5ehIzCGYijLDKe4l2asX?=
 =?us-ascii?Q?1leYqlsKvw/VYxrlP9iaBBVRXDzwspFrKzdPX1JXK6JEsUCsJ8GceRWiUXXN?=
 =?us-ascii?Q?G8FOyCqgTxeM7egBt9YemQ4FPMa6fZP+XySzrRBhD+4bA5oUG3I+H+C1SSn2?=
 =?us-ascii?Q?FuYOAIdNyW4BmpRNVNQd+GXK2ZiqqnLnJhTNcNcnp20NBjWpOqxWwHgJJ757?=
 =?us-ascii?Q?o/hAzUdvIp6wbvaF4vZdqmBPNhYvYRyhw+M7756OHunDfwRZX3hjms5KPEpb?=
 =?us-ascii?Q?JpQLCNc3TT8Ld0eqDE629Sbz3FzPOdS1qeo5uEgZjmtQWGbye+Wa2crxqh1q?=
 =?us-ascii?Q?XzJhkjadAi+v21PDtYwLKO+TxmVVfTUmED+oxg1xYrXHNpY2f+pJNxP9gcsI?=
 =?us-ascii?Q?L5men3nS1KJOi5Fp3gQV/XfMGz/YY/k/J52P921rcfAe0AS9up8Jz57RRkqh?=
 =?us-ascii?Q?+H+VNENIQbcWPAYw74x0sG90Okt2+HVMg1arjz+ClVgSiSqHkgun0NMX9XiC?=
 =?us-ascii?Q?65nsJZ+TKdXh4nUeqeaj4pL14xEiN9F4W0N13UgdYY5UEhlHuXKNJ8T6u33B?=
 =?us-ascii?Q?p/oa+P0/7r0xgE3KBz0UKXkAoR7IFKQLWqkOVOnzl7l7rz0KkS37x+z22uGT?=
 =?us-ascii?Q?Eo7cL7Ny0Q5f1QllNPeToGqhrzBriY6M9YQG861wEDbgpnfnaIb2RiyJR+7/?=
 =?us-ascii?Q?r/bUzKHpfcxxpdLvTwMD4ydNNnNWr20VBe6tpvsnKFzCpfeATUYwzr3cm6A7?=
 =?us-ascii?Q?QSZsYf4c3CYk0RSA9MMVlP5KzauV4j0H6Zn8B7KtqRxmY0cR2qubCRn8HKIz?=
 =?us-ascii?Q?vzRBNIsdHlrBS6IpMIGeSVgGgNZCO4LEj8Eegv/rdFpPDJCbTtYLjfzhCFCe?=
 =?us-ascii?Q?O78COu8/oeRCo88ZttTjOe4aNpg+6Q0XgFeW7JhDTQetxbMk0wRE9Vqz0sat?=
 =?us-ascii?Q?j++BQupalyUjYxJxR9GRjV0b7T9B/Di32dOPXyiF/SGhwMg8q0uzesoYHRUO?=
 =?us-ascii?Q?tfxgxoVelAHoXODN0MqO3x7Idjr7YjG0S9Q9eziyLFlDzP1QHmaYLtVKuwzM?=
 =?us-ascii?Q?g92uBd1OVK5aeEP7pAZgiHdy+yWTFh55uevNTE1tbygZzC9hGX0QeJtdOSbM?=
 =?us-ascii?Q?vA4lkRckCA53sPjAhCJHgLrfJshVQowsMhjuyfvNj7B1vRF9gnk1odJCqvJn?=
 =?us-ascii?Q?dqK2KO4/ii5o4bFpSNxvXM2oaORoYzIy/GY44AesH21tE/kQcAnVjBii4M4E?=
 =?us-ascii?Q?HbYGRo4RFNQRfXj9GNSFx5Rds1Ph1PE0q1AXBMtEdlumDLo8WjZnltok5097?=
 =?us-ascii?Q?+3FKfzbrhaqp8QOx2vACPnlx8sbt7KcjHqGS33AXcXmGS4Tnrh5Bciy1SYDu?=
 =?us-ascii?Q?nkIbpKOzQ22boEl/pE7P7X9c/e9PzZf2HBYsFh30dcA06WGEZCog5iYA81u9?=
 =?us-ascii?Q?nkpprmhlXo+sOTczRTmKRuBo0tE9n6HVMwy+l+6ri0TDEiasteMYBVStNbTH?=
 =?us-ascii?Q?dJJvYvSuWBNdoK44dWyVwIvJYbWF5OdvyUJTxsmdF7Xyb5+Q/A4kNFvpmOY3?=
 =?us-ascii?Q?4dzUb5iEyaQuyMGaT2f+EYU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caceef08-ad15-44a8-8ecc-08dbea3656ac
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 02:05:30.7390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ODwub1ftPtt+pEQZmXiOEAuu7eOoyG5LZAvy8cvsICrbhAPe1jUO+qbIYJuKMGJmnl8ih2AIEPS1AkHAwJbYM95Mzw2VMSAUF8mOrrpxGesM0TDN/Kj9YDBue2NX3N8e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8610

Linux Kernel has of_get_next_available_child().
Add more generic __of_get_next_status_child() to enable to use same
logic for other status.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
---
 drivers/of/base.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 3cb467a7e747..d0f7e7c890f1 100644
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
+static struct device_node *__of_get_next_status_child(const struct device_node *node,
+						      struct device_node *prev,
+						      bool (*checker)(const struct device_node *))
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
+	return __of_get_next_status_child(node, prev, __of_device_is_available);
+}
 EXPORT_SYMBOL(of_get_next_available_child);
 
 /**
-- 
2.25.1


