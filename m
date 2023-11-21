Return-Path: <linux-renesas-soc+bounces-7-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6177F2390
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 03:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 056DE1C21561
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 02:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49DB134A8;
	Tue, 21 Nov 2023 02:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZU8FVDFk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2120.outbound.protection.outlook.com [40.107.114.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A11D5C3;
	Mon, 20 Nov 2023 18:05:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGZLxuasXh0e8XCcgp4SbdDqm5FlcnpMoQTSDJ+OdLKzYQu4xVSWLLY3No1Nt0YKRdoULDXbM+BDQquu9StlB7Z+7u4Qh7Y/HNkZ9njkFB8onGzlB0nvlMyZ89T2E5AegZjQJJWRMGptEB2HDxhykshwZGlgBfE32S39QGj/Aot7I4rfTwqLfR4tPGf88udKgiDX2W4TfXKKXQJBuKJ6iZZg8XI7WFBYg8Q6rjIVmSND9zFuMcvAgC5wVO8TDNguE5PYSzEcIrRShXvV9W4KtrSxzX3HlI7rkcQvM3f9pkNQD+VGNqD+Mxal/9RTBfGNfnEO4F0ZrtKy9dJm6MRsNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwjAVtd6oYxbpVDXpHQW7augglxKXi/xbnUU/noBXy8=;
 b=a21A0AAk3sOXy7nw6ip8bqrvsm6K+4OE1ucEXmHzOL/L+S25SAKc7mjpRun+ZxX47KtpmnhhxcKNANkftg6Bpi1CPNXWVX4Q90xp4T3uOw9ARjZscy/UItbTUzy5cjIsoXVE3sOidg26z9TXwcNUo6g8iEDqZoZewTN+URexvEg/WwAbZvWHSm2HGhpEqULF7Rzbm8P8ZBVDKWc/DJpqHpXqR8kwH9hzyyaAe10ZG+nlhQqZ6qNwe9FgrcLDGfb49BUNvMnnjveNYIwal44QdsOyjB1bOcrhZAvCmtae5YCLwvx9PAgSvogEaglqVGoQp4frKxk2croYKBUbiFngJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwjAVtd6oYxbpVDXpHQW7augglxKXi/xbnUU/noBXy8=;
 b=ZU8FVDFkq7y31gNk7NnER4qMSS+tdb5PfqmDIGuLIgNCcPQXqzJqWb3ks8CQkahliEU6YOu4CLlbMsJd86G1uJ30SPLyXS6Vr+0E1oOd4yguv1HhMIqwNtUCA2svn0llvzWE+QqBZMVmlM1Euj8JFwydZwiWwBYY3aF4tZgd1m0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8610.jpnprd01.prod.outlook.com
 (2603:1096:604:18d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 02:05:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846%6]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 02:05:36 +0000
Message-ID: <87bkbnc13j.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/4] of: add for_each_reserved_child_of_node()
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
Date: Tue, 21 Nov 2023 02:05:36 +0000
X-ClientProxiedBy: TYCP286CA0218.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8610:EE_
X-MS-Office365-Filtering-Correlation-Id: f0da3551-89b6-4074-2d7b-08dbea365a40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n3laqpDfVm8i+6mPYvRx5Rjf6mI96b8B/nRQ4ZG5GE8csrR2HMhdLKtn9kSDpBFaDgLzUYEUJxl/prP4g6DhHGiEWqBJqAelapZwh8L4XND8sxC88LviRfM5dcsIIEqTXkQ3xN6u8CwOeBz0LpXt6zxEZmJ04DMZMdn48wDVIjhYlFLdQ8Qvt7Y3tzoYkud4ffqqVrUhUsX1VaKRy+h2g1oMtk4cdnltqccpLhGIyd9f/ayJP/lVf1sYHv3k/MESgWgR4mth0QjWAi4GasDkXBztlyzwfnHoiEBB9+bUhrdvbiFqx83zVzNgiBf4gKJr5MPWb7nJP7UHIJc3oYGwwv2wdwyhDt+udWQC/0ulJY7WMpA0qhlWwKdhfoS/wqCb0Oj2Pk8A6ftZC+jHV117kjnPa1+QH+xIduxqAJhTJwEW4Q33dvRElem92kA5/YUJF/nK2V2dNZs4yvQpO0NRzeAgma7hfBgWUDJaszHBO9N8o/FIOJsPhC7uW4iyQrlxAsesSOJsGG1KgcXClFW0s5v4/FH5tl+fMRQ/WA5J+06uDOx4eYQSl4KK5Kvuqcdf3NXcg2eVXnlJuXREFVUnrU7B3oVN7JKVYK95tvFH/BMUvk4mgmwFdVqMo3k5QcRL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(376002)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(2906002)(4326008)(8676002)(8936002)(86362001)(7416002)(5660300002)(38350700005)(41300700001)(36756003)(26005)(83380400001)(52116002)(6512007)(6506007)(2616005)(107886003)(38100700002)(316002)(66476007)(54906003)(66556008)(66946007)(478600001)(110136005)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VHmWy6+3Bv4hSCzNAcsHEnIFZkQFnwvoBtZ/rnKHV/edqah5PvV0v4qqY7ZH?=
 =?us-ascii?Q?PacaS0nd4Y1usdjwkDdb2LACb3gdAkJEd1qoE1QYlY2r/EiY8/mY+aLUKhSr?=
 =?us-ascii?Q?Gfj8B+sQOSbTmyjAecRPQI49CjTBNXFpHWxx/GCdrY6Gaai6Iswc4+TtwNhw?=
 =?us-ascii?Q?1l1Wqbi7VZFZjmgTH2Vd1MtzFcS9mIMDvBogN8tY72fymVEg1E5MnjlO4N1u?=
 =?us-ascii?Q?UOF4BauVZ0kt7jriC479cHRUUP5UiLeHjI0icxE35QWKMIX8ttIiYs7CWQbJ?=
 =?us-ascii?Q?oD5PHfntUlU2keqchdXgAXfJygOY0kQSQ/23gkp6A6uEPINc4tTI65ffo1pG?=
 =?us-ascii?Q?HyZLnFOT3/X8EGlirHQG/n/WizLtT6GiqoGcD9+Z1XwYrJuDHXoJBk20JCRo?=
 =?us-ascii?Q?yZEzpfpQrj/RngVKrvmrc1mdz7ECS+M4i3nPohxwDL6ffME6N4BxVSG3yfSs?=
 =?us-ascii?Q?IikqZQ310B+0I0Q0uJ+0AYAYXXCTH351uYq/4ek3KfUzJTv0PLHMfC3vyo3X?=
 =?us-ascii?Q?XIZmGGGMsauXodRemNjd/yFcnbYOf7pwzdprrkHrYKZekxtZkSjqFp4I+lBQ?=
 =?us-ascii?Q?4EyCYkscI47HgDwl3oTwJ7Rzw1XTHCoVz0d1aUP1vjA7d1lNNG01SvLcs5AQ?=
 =?us-ascii?Q?pscePs4irN09CqfsULrb680YgFncqhyohH3iKeEqrEwbzqLfkJdJQAlm+u/S?=
 =?us-ascii?Q?dkwBIB1LUZebZimgBU/WSiemDwmz5qZN5uF/vkG2H7gIU1qXgV/ZyDaI8duk?=
 =?us-ascii?Q?5hqSWq4yPe6SrkmILh7+e1i68By0VwujP3VxoF+Ggr6ZWZb8ABNGhBBhXRox?=
 =?us-ascii?Q?/pZsC7VoMRu8ofQGsrcc2KmTHINPRPnzApUTyPtQeL5bqxiR5f5zvclHp4X5?=
 =?us-ascii?Q?tOrE+Ejy8ymCbkfVWSDiTCXhm5OdAeGhZNJ9COWXhjIgx/2+BLNXhMmQgidE?=
 =?us-ascii?Q?yBV7mU+I5mN+8cf5FH/77wEHF2QV59Zd6FffvNB3+JHsWM9CduSSHtu3MkeI?=
 =?us-ascii?Q?pIxUE46w3KEwH6/Psubz7RLbdqOg8bQS08rFESzuIahsgmkBUql/soRpd/6Z?=
 =?us-ascii?Q?yH6bPFSyOT+qwWrHCR8Atar9QiUPjwgOVB8KCmh6g1F0t1Lrnco1TJkPNy1o?=
 =?us-ascii?Q?wNR8IJ2NV/GWarEM8ROQhVPUnmrq3Kire5uyZks76sKn7+goki+sl6ZeFX9V?=
 =?us-ascii?Q?EzGugIdhahn1lFU/oR5VsG6ownsqWZ0ezvBz1XQpvSMSmJjllGSs3U1FFeT3?=
 =?us-ascii?Q?xaqw/DLkKau2Ce5DDgz70gPPJPLWHsOTgWMVBJJFAIzbEuLeUcZHxlbu/p5R?=
 =?us-ascii?Q?6CcPzxqQxxhnxkRy+pjNLBuUR6o7ayUHaaY5qCj0pOoQVXPRcNLIEbJ9cjfp?=
 =?us-ascii?Q?KUwZQBo65FbSIo4Dej9DdauhalNVP0PYE/LeHsfS5Ot27qlfdCfUOAXkFSSd?=
 =?us-ascii?Q?+tPGEq2NkjCw1ZaCXeJdQF73JLyZy01Gc4sahHbuYbHmWgWgy3sZDPHXH1FK?=
 =?us-ascii?Q?5pRaoFjc+dnkI9UOTcBzLcQZ3I7+qOwMhp34lrUd3C1kZ00azYPGkqVqqc/4?=
 =?us-ascii?Q?0Qq19Of58RyUwkxK+5MKJvXN2uPRIMaxHIr0JJS4lDBQIXOjR1u1XbSObSXE?=
 =?us-ascii?Q?sfDtmvp7SaCmkFLjpnD11H4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0da3551-89b6-4074-2d7b-08dbea365a40
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 02:05:36.7527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5bftOAnly5ftbQfT6p0ytQjObgIE36FNSnISxrd77wk+7t4q0d2lrKeEGi+51XtiZVmHGg8n11Pqlv9Oj56dAYwice1rftG1sK251xEREpt+a7gXwQLCEcFVWL9hLz7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8610

We would like to use for_each loop for status = "reserved" nodes.
Add for_each_reserved_child_of_node() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
---
 drivers/of/base.c  | 29 +++++++++++++++++++++++++++++
 include/linux/of.h | 11 +++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d0f7e7c890f1..9406775f159d 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -465,6 +465,20 @@ static bool __of_device_is_available(const struct device_node *device)
 		__of_device_is_status(device, ok);
 }
 
+/**
+ *  __of_device_is_reserved - check if a device is reserved
+ *
+ *  @device: Node to check for availability, with locks already held
+ *
+ *  Return: True if the status property is set to "reserved", false otherwise
+ */
+static bool __of_device_is_reserved(const struct device_node *device)
+{
+	static const char * const reserved[] = {"reserved", NULL};
+
+	return __of_device_is_status(device, reserved);
+}
+
 /**
  *  of_device_is_available - check if a device is available for use
  *
@@ -650,6 +664,21 @@ struct device_node *of_get_next_available_child(const struct device_node *node,
 }
 EXPORT_SYMBOL(of_get_next_available_child);
 
+/**
+ * of_get_next_reserved_child - Find the next reserved child node
+ * @node:	parent node
+ * @prev:	previous child of the parent node, or NULL to get first
+ *
+ * This function is like of_get_next_child(), except that it
+ * automatically skips any disabled nodes (i.e. status = "disabled").
+ */
+struct device_node *of_get_next_reserved_child(const struct device_node *node,
+						struct device_node *prev)
+{
+	return __of_get_next_status_child(node, prev, __of_device_is_reserved);
+}
+EXPORT_SYMBOL(of_get_next_reserved_child);
+
 /**
  * of_get_next_cpu_node - Iterate on cpu nodes
  * @prev:	previous child of the /cpus node, or NULL to get first
diff --git a/include/linux/of.h b/include/linux/of.h
index 6a9ddf20e79a..331e05918f11 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -294,6 +294,8 @@ extern struct device_node *of_get_next_child(const struct device_node *node,
 					     struct device_node *prev);
 extern struct device_node *of_get_next_available_child(
 	const struct device_node *node, struct device_node *prev);
+extern struct device_node *of_get_next_reserved_child(
+	const struct device_node *node, struct device_node *prev);
 
 extern struct device_node *of_get_compatible_child(const struct device_node *parent,
 					const char *compatible);
@@ -541,6 +543,12 @@ static inline struct device_node *of_get_next_available_child(
 	return NULL;
 }
 
+static inline struct device_node *of_get_next_reserved_child(
+	const struct device_node *node, struct device_node *prev)
+{
+	return NULL;
+}
+
 static inline struct device_node *of_find_node_with_property(
 	struct device_node *from, const char *prop_name)
 {
@@ -1431,6 +1439,9 @@ static inline int of_property_read_s32(const struct device_node *np,
 #define for_each_available_child_of_node(parent, child) \
 	for (child = of_get_next_available_child(parent, NULL); child != NULL; \
 	     child = of_get_next_available_child(parent, child))
+#define for_each_reserved_child_of_node(parent, child)			\
+	for (child = of_get_next_reserved_child(parent, NULL); child != NULL; \
+	     child = of_get_next_reserved_child(parent, child))
 
 #define for_each_of_cpu_node(cpu) \
 	for (cpu = of_get_next_cpu_node(NULL); cpu != NULL; \
-- 
2.25.1


