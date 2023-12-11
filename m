Return-Path: <linux-renesas-soc+bounces-878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E4580BF8C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 04:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D09B280CC3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 03:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFF515E8B;
	Mon, 11 Dec 2023 03:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YIx1Ykod"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2090.outbound.protection.outlook.com [40.107.113.90])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77370CE;
	Sun, 10 Dec 2023 19:03:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JiuqkiFgC53ir1KLH3wy3NMZ4nyMGi6MbZE5hho2JMiSQo/cOvAmbmRoM33J63ry5iUp2XFsap/V2GFwErATBINmcsLeuTh9BclVtlZBu7jTRb2lptc9+5SP5TvmmmxNbKk0RmGHf+Eg4pSuWnUBf7nKnKx5PeMB4AlD08mTYUZEaB1OCsdrvakG7lXP5QteEmrOL038NUKNxYZ1okyYPzg0AXz5MddjU31JTiZKc4r22QasUsdpe9ehjY3bhf8KBugdOc9MzG8KLMX92Ft9nNwyJx43lwA1Z+jKpfavbdyK/LgS9VVs1yujgGarUDW3XbKuzXnzq8HLkpIKF+0jOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RgUkUYtygoxiqzMiBVycBlhtPag3tFrU4SqtSRyEFyI=;
 b=E34D5280JIHs71lgEWIdWkZ9YlmvzrXQQL0whSCY1sTrsqUuTn1Ztewn63gNyfSMaEJF+6wzG3iT4BY1q5KkTW9vkXRD+nRcfQ3G4+/2YVT0gjg9rLSQy/joYyZfYjW4xrvGqVp2gfEZpfs3VDggQJm1iL18hdf2NtW2MQGo0viA9uRzL2J52zDPav+cBQdaIPQjcgahtbFAgLGYwyk3RL2iNgBN6qqMm/qpqxxxSexRy3MoqDiN0lD7btuWr7/Cs5CI4FXmw/hKsd7iUfDcKMs8wrKvnMFeiWUIs85SSMUED2hq6EPbzGHGN58eA6xHReyRYhqLJsYEiIQGaCyXqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgUkUYtygoxiqzMiBVycBlhtPag3tFrU4SqtSRyEFyI=;
 b=YIx1YkodZ66RJ83czVEFP+VhadOXwfHD7zwQ3pmbt7u1XX8uo91dSrTuRC/cOYSg63j7MCY290AHDsZLRquU3ARhAp4EcOdBiYNYpB0ubH6M1QKBtG/xzHnR0BhPodN89WOW9AP2VEk2qVA+5fkrCByVxHd59c62CpRVFNijFKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.21; Mon, 11 Dec
 2023 03:03:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92%4]) with mapi id 15.20.7091.020; Mon, 11 Dec 2023
 03:03:13 +0000
Message-ID: <87ttopo2z2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 2/4] of: add of_get_next_status_child() and makes more generic of_get_next
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
Date: Mon, 11 Dec 2023 03:03:13 +0000
X-ClientProxiedBy: TYCPR01CA0122.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11269:EE_
X-MS-Office365-Filtering-Correlation-Id: 7136e5bd-c198-4154-3ec6-08dbf9f5b6e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5/vK3RGKRGh9+VUq/6lkABbJh72pAs+uB+EsYvuVyEmWP80PIlDY1pmLbKlnJ9qcYIH0FLZGEeSpJozb0G2x6u62FZWmI+//U1PCSDGNi5RyksA4DLY6VdZqJDJdsT4/NQoMK4sVDfJnpjjEsJcbVjVElxnMBarRsyqAYiqrLinELoESWZwAmRYMFpYLELR7rZ1rnZFwCUUvK4MGdRLtBQ4QaFDDYuT5EZ8Fun1C8Rv0VIn6rcKEWV6ggYYy5OocityxeiT1SRM8JUsKf/YrbsjiCVQqdlMEWqNxWJUpxt9WNSEQHpWXiVHtOfp6wEjM47W3ELP5KryFUE6n/UdkLCg6zJcBdOwFRwwCaqhH4ln42F7qa/9mKfiaAIA6IOTFh0v05NDLJrt4b7cAKct2uYOvCbChL00r92R/Jwf7ngzJgHrD2JPYgEueB58TxTD7WWhhnvMRkSpQRKPddIT9WzV8NhdwICDn7BEuNWRqdYCmQyVQ9WBDjWyKB6U+a4rtnGPLjhXbAQbTKpYavy3gZNkOQsPNxCHf22OdT+MTPDb+VkiChiEJ0cq8jbJC7Q7/1KYwN0dU7vHNkAKMPnmrzz4cbBSAOyaLD6w/QZVG+h2G411PZGO8A9ipaRR+QZWdC0wnyjgYxXFMa/GT0ibwOw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(376002)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(6512007)(6506007)(5660300002)(26005)(2616005)(107886003)(36756003)(7416002)(54906003)(66476007)(66556008)(66946007)(6486002)(2906002)(83380400001)(41300700001)(38350700005)(478600001)(86362001)(8676002)(8936002)(4326008)(52116002)(110136005)(316002)(38100700002)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FvGi/+xvX+oANquMatNSLCoeOodglxwPF4BmlHq9pIlKuxd3VwNj14ubvcPe?=
 =?us-ascii?Q?ul+Q4QL2q/pO7EOlMgf9dIkM30hCU0mMaLSiY+zaPU+ik3iuSkyA44c2zJ6K?=
 =?us-ascii?Q?VARs2G9Q7npGbsOh8FtoRkms1Y1X1MTYsK4CHQrHDKvANh8hSswx8L+ab0go?=
 =?us-ascii?Q?OJwEQHKVvaWTeNxIg+NfJk8Bm77MQQatiM81/4UC8Ryy/Erp4+fbRFI1kiLT?=
 =?us-ascii?Q?UFipanxfAUu5/YSkP1Ok65NJWwr9gss45AQIIgnugrsB6YjUJf2cUm2rgtSN?=
 =?us-ascii?Q?EAYgY4XuM3gQvE1zxnq5hTpc7SxaIU61+4CDX4Ai0NRFWa2Sbafxoighpifv?=
 =?us-ascii?Q?MT9C3Ye2zjKuzqB76z6yHF8oP1Y99DXil6n/XNhx2CSx5hYAVtGY3rMwhmlU?=
 =?us-ascii?Q?LXq1WB+0ziSXmzKNi+i1mmH0mhWToVaNee13b0I0pzMVE8UdrjHLG/C/y7FQ?=
 =?us-ascii?Q?cRRrKFV32Q0zD0r8+USM+BuFywdoSa1ps5sl9yBwBuhSiQHHToq0EYI7hk3a?=
 =?us-ascii?Q?ko8kZWPDz5ZhSzCUskNb8A+LfcOdpA4z637PQs59+cNCC4/zoEDO2Q04iJR5?=
 =?us-ascii?Q?YOoI4l4poz47QP6k4jyZINVMzpL36fsn+9Sd/2+z+vrbH0CcDvxu3phW/Rmf?=
 =?us-ascii?Q?gf/x++w6CwmRgwSsc3pyetrVrGyAxM/0QwmW4HJ29dTMNZugGzpEtJOszYG9?=
 =?us-ascii?Q?Sewhr4yMWfw1tEAK+VYATsCAfqouHxiPMSHIjG42qoCJfsEOgpIOzLH/qT1T?=
 =?us-ascii?Q?QIXovpwI6AeIyFMFefsm0pX+LoZkAkc8p5uLDG77kCbmbCxBky5+g8/Eb12Z?=
 =?us-ascii?Q?2memMTo/pxEH9IHV6UtNQGIiYg+iNyMQmQav4ZJf7k4GwUtlgBoP4woMm1yx?=
 =?us-ascii?Q?9HCivuLmGlWysvMIgM5nsIHPUnqdf+1zs7pAteJ8BkZEyawXx0y0yzZLYjEM?=
 =?us-ascii?Q?S64F3FUIxejKu6hgH5JIRV09gRlgyF0z8RX7E4LI9DojH/i18ymd7uU3FHlZ?=
 =?us-ascii?Q?r39EjYDNTlgADZlih3Ig3psvzBJRCV0EoXxLRswK5c1zDVKgJmh3dsHv+021?=
 =?us-ascii?Q?hvpk5LZrNyvDiZpkEn3j8R/4xituvP7XlgQNAHuamPcBPLxPvrTFbdflYd6U?=
 =?us-ascii?Q?bnWWYS6L3A2++OgCak+jvj16hYnPRN5UKPyqLBOtn7tgQqW34B33uT1yvbwa?=
 =?us-ascii?Q?8I5CF7kxtT3ZCHHsmwE1L/NWW34EfdmrNpj1rGKPoq4/4dHuVetlkcX4Qa9c?=
 =?us-ascii?Q?GTSkb/ftA/+t5VeF5ioKCl1LibLKCT+H8L5Yw35OcIjJvDcsdQDZ0jZsG2NH?=
 =?us-ascii?Q?UgEadoAIE7IDvStGtkuOUimaNXT03vKvIDXeYDY3oBLd5cjwPvFZnYDZ0H96?=
 =?us-ascii?Q?TySoBna3RNUpf8IRgOyHZLN5NTSEGma7uPtAz/UJWcJsma7OF+LI7RUKyR9l?=
 =?us-ascii?Q?WAjbvFk14To0feZrQAXqyFFv2Cmq9IB0Mw/Z12uJvDg8rKsUvvH0/biWua53?=
 =?us-ascii?Q?jDonejkN+/Tw373KH+sDN9hSAFGdFiCmrCxDuORgdjCKUBuApKPJhIScqcMj?=
 =?us-ascii?Q?e5TSollD4vSmeO3ZeGg9Yvd3GUOY4CCsZNuIyCU3RVtAiwJk/5PgUyKhdEI4?=
 =?us-ascii?Q?DjxF59XkclbvOnZgluUZGnw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7136e5bd-c198-4154-3ec6-08dbf9f5b6e9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 03:03:13.5153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++Udblxw6TjYuyEqDaLX6p6Sq+LujbcaYFnl1wz2gU8c6BObF29mc+qGZQbXamSm5X5DzS73TT4npTR7hgD7+JyCiuyfh9f6CEOvd3SHcVgWSQrCjAxn7mbuWMDg1NiX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11269

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


