Return-Path: <linux-renesas-soc+bounces-1449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 258E48291E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 02:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C0561F26AC0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 01:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A1A15C0;
	Wed, 10 Jan 2024 01:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jETWwvwz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2119.outbound.protection.outlook.com [40.107.113.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729A21373;
	Wed, 10 Jan 2024 01:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnanZp2/flt/tfEubJcX8UB+kqbk+2eTpUAQgEmi612QjHpxzQySo+YL7MUKNZhjXe1Ss0bMv0ZHWPEfr163eYk1WegmM/gCnr5Ofu5raTMUfgg7szx6UVJNPaNqVeevfEZ2D0wDNEl3YG2fCxcnBm6IaEhQWUzDiCfziI0q3jc0WSRrEgl2lViuP/sZlV3H4ZnIz0Qhi3jz8nRi443BvKNhmE2B6k8JeGKKR42padL3POjD7QxdfeQjkksmVMOO+0ZLi/NNDrMxl0d+TrJUqfBsFd6ZxdWN1AeQ3sPV9smzGoCIxx4FJzKVSumPS6OzvTnPGj63D58Ldcxk+x1M1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RgUkUYtygoxiqzMiBVycBlhtPag3tFrU4SqtSRyEFyI=;
 b=lxPPm72hfeBTx0T9x0VrOIyzf6McPLkZw7NStWHrWFniZhbK3Fb49bUVZbCFWkneIIxJIS5IIMqJAWAdAD/LJVXSNd4jifGJSoP1sLn04pQn5ec5PQs2Bf+chSY6TVPkD9rGLzkAyK9M+Y7XM2GgBrlHWWw2w0TwX5KWYTaXOu/nx2Q+yYHX7WzhjT9ilG9l6RzSZs8L5v+XzjIUloODvUskN5+af+GLQ+rCOzIuaZAwojAVKYZtayolr9zCEDIAV0ugEpeEFkr0xUSETtbUMj4BSrhhptAa3k9lC03uxokPJs4lyDk89s/4PGlmMOd2GszG0EjldtEEPUY6fbPmog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgUkUYtygoxiqzMiBVycBlhtPag3tFrU4SqtSRyEFyI=;
 b=jETWwvwzizK5X4RfNSRYxFmz7NsJy3dBjWxjpD7L8c1/XFfjP/ElOSeEkMnHjsMPiYWe2zKutVPM9uG1q5Ok/tgDbjE5fEtYxq4Yx3qKaMF1AkQ7vP2vG3PMXD5jaIojNVrmr9BJ952RPTbmHGznJxvMUFVXs6snW3r1oJwdPFI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8442.jpnprd01.prod.outlook.com
 (2603:1096:604:195::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Wed, 10 Jan
 2024 01:14:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 01:14:43 +0000
Message-ID: <87bk9ugfb0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 resend 2/4] of: add of_get_next_status_child() and makes more generic of_get_next
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
Date: Wed, 10 Jan 2024 01:14:43 +0000
X-ClientProxiedBy: TY2PR0101CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: a4dc6906-47ef-40cb-03d8-08dc11798744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FtOehzZ4Kx6XKhbP6FTAniIU9TpVXT9oNJZWiQ2Vg6OXjv9qE7oftWq5WvDIEgiXDDd/f/NJsxknKrnYkdXhQ91c+I6Gspi1tewbPJeOaTrMGKsZf8eWOA4ef4wsQkIUFJehuNxSsVmry4/IE4+zThDdNFuTwFmHL7urgvW8+iGS7odox7ScpTV0FiwZO7K4WjVw8nEf1/MXWbBPS5k92XhA7U2/6kBNYrMLXZtXdI5r6rUwPflZogWqxEKAMP+S6S7FTS2V707lLvKI3RdZta6/y1EyIrJzhoUKXKnkfL3hoVLR86R4zI+tZcH+ZmxTdJo/uoxkEGpcApaAhLftfFDc1a5b8lV3NxTmZ7kj6GDdQ7wL2/fNhssoSznYU2oJAq2G69j/TCj2ngJuaoWQNqXXtIU2rf2F6Zc/Xz1K7OgfstEinRJDHK4xWDIc64mIrJD/6p6JAEzh59KtJxdHUyY1Qnozi7SssGsLHTFRQUgqkj7uZ1d0XHBIEo/X3K7ZfDkm3YKsj48UgvQ6H3LvKKx13kLw8xBrOPd3ZVLZ7NBxffrmsPgpCCrijs3/vJxGRYJFkp618ukst0X4JoC5X4YDvHRSjlf6PoiwPXCqbr7aoWZW6KphEx9BbkJTWq8r5eK+XRTwcTSkyi/WmIARKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(366004)(376002)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(38100700002)(478600001)(6486002)(83380400001)(54906003)(8936002)(8676002)(66556008)(66476007)(4326008)(110136005)(316002)(66946007)(36756003)(52116002)(107886003)(2616005)(26005)(6512007)(86362001)(6506007)(2906002)(38350700005)(5660300002)(7416002)(41300700001)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hLgyfoyQzfCxxwaVjEZwYoq7kSH2UdskB1jCpqRT/pjkgW1jRJZcG7nWlGig?=
 =?us-ascii?Q?MRHD87fhdYp5ZWFklLDuiqF+6cCaKruxqieK0MAlk8X3FPmR26CMl5EEoY7N?=
 =?us-ascii?Q?ZyEggd0gpShXaIH+rHA1+KhinFleXvRpi9Vh7HuYUSooE72FJnYPg1tq0zcW?=
 =?us-ascii?Q?km4G84BLAJ9iaPnh/TPjxmCpackwXOqDVo2sNKsHrlyq9Jl/+CszTIGwdBdU?=
 =?us-ascii?Q?Aufq8PTXtntDfizqExyw0ub0qfE2AybOxlLB/t/YkyD/WYFU6VszUFx02T+r?=
 =?us-ascii?Q?iqALxNn7Cp387Ld3k0ARvb2P4zrdMUyw5VRBz3EbablBV8FmgXo7QdnFbw9v?=
 =?us-ascii?Q?UUo60e6lfCczpso69jwk2+azaooiy5I9C9I+jW567s9OgtKiJ8YdDKELlNaQ?=
 =?us-ascii?Q?VmT76fDthHR0nQPYskBWqEgDHYoir0Qg1dc1FWahOmq+oL9gJ7b/jaVHjJxJ?=
 =?us-ascii?Q?Km6brIZ/cU1SBRWJaxgbjRvqOdvtjUYYRAG3RlKqBT4GjzKVDUtOVQuEDuGU?=
 =?us-ascii?Q?zcEpEvrekp1t65Wd52fV1A4H8XM6ANEH1pGa72tVz3p3Z5VgQqaLrnvZqRBO?=
 =?us-ascii?Q?4almYXk/zDAsKjzYWXSCNuzI2oTt9Nka/oU9BBBP0EN+UgLcNfM36QedLthg?=
 =?us-ascii?Q?dhNbp6CtbJVH7RzFpafweWJ/9oUlp/21JZg0BxCuRKHw3bYnbJwGht2PIG9b?=
 =?us-ascii?Q?HEOLw53ncky4PG14r+QgHLsB18AmmkfD+NhQtC1RBsug+xT/9u94LBkr2eJF?=
 =?us-ascii?Q?DwsU34oD/09/xD/bF4ZIIPcsPco1ScA9QbMHUrQhbsZQgsa3/xZy8MJbizEy?=
 =?us-ascii?Q?m3DVvixRTTnCf44nuopEicJXlfQD3RNYXWuxTpIv4k3Tp3ueSOLgybKaI3Kf?=
 =?us-ascii?Q?c36I7iS6SsoEqU33d9q4RDQKGWpC5ER4mSRF6vfwk+nrhE+Fsxq5UrfINUcp?=
 =?us-ascii?Q?L2r3BK/GelUTr7FVmHn7S1MniwMo1HDh490bGLupnozws9mEB98bF+uYC7Bi?=
 =?us-ascii?Q?efaezWPpCmp4b5l4G3jbdn+bj9xy+gf9u6V1ibhcCe0HBmgCHXptzbdt3xy8?=
 =?us-ascii?Q?oT4HbemBGGr5H0C8JfdSe5bfLS9juzc/VDZnnS9W4Mwbn9dJUK1ltgY83b2O?=
 =?us-ascii?Q?vxmSHbSX1as6XHlrAprdW1dd5ZKOFJZQMg6Ohg/kO6ZDKJaqMBSn4kjOQQg5?=
 =?us-ascii?Q?pbp7W5lah4n7ovLJNeCcJkua3KVf+5AXOkyNmyddCEMcjq0hFRAUQz1YzFw4?=
 =?us-ascii?Q?3zBkRE8TlCxQ+dCOCzl9tQGxnW2llLa63mTsN/8n13Ima0jpr4g+B09tD+Y1?=
 =?us-ascii?Q?/ae3Ipw98GiW8TjT1JP9pV3Qs9qAuGqsVaI9RmAR4CU7u7P3QF5dqWJBzCpP?=
 =?us-ascii?Q?Z/PR60TYhG2bgVGb6oE5KyBFZyWny4O7qr8prfZqUn07GHxn95ZfVTXP2bEP?=
 =?us-ascii?Q?ZzjPB7Tdj5fn4Fx9W5eeQ6sfZ6jyVNClfiwQYMaupJLRFtTPg5qCT7fLamvK?=
 =?us-ascii?Q?mrcY66RjnbXa9QEZDWSn0R8V0vxrTBkbeLEOjlAiBJYUji5WFdC/t44gkcWQ?=
 =?us-ascii?Q?83aQ/LW1Z+nSt68dt1UCgPfSYTvNz1DiW8exGmBDMjOqGtQQaEg3x2MTeBQJ?=
 =?us-ascii?Q?mI/93F4uQokkAlRoOWOEA5M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4dc6906-47ef-40cb-03d8-08dc11798744
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 01:14:43.8915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SA/LYqSBIYKj32YLBKjwoVy/0NOSTN7wQI5l+0X9Yc3iDHaJW+Oqq5e1QYGZa86eESDaqayQKqN8GRiksFPaY19bags+GMhG6lWmXgxGR0EgO313S51Fqgsn+TTUWEHM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8442

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


