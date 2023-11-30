Return-Path: <linux-renesas-soc+bounces-443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5627FE691
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 03:15:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A9AB1C20CAF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 02:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850441079A;
	Thu, 30 Nov 2023 02:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hQQM9pTE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2120.outbound.protection.outlook.com [40.107.113.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5939AD67;
	Wed, 29 Nov 2023 18:15:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UY+4TsQeuFpGVNrgK7L12p47P7rVagmfTzPEuQMo3Jxu5pTflOXAwBvsqHSNNQ35ALMiKfBJRVod0WjjBD77EL36scRCOncmGMEDFaHinaAE+B8VY8j4V0YRoGUDF1doHh1ZUdpB6v3wqvKFBLhKOyoZm1Z+bwDThFUe3+Nyi//C+kTzP9DDmHXgWUtH/3nGG23s3t2/beXNaKGmNfSJXMFhgMYb1LwcHD7LBvMfpqXr38PRTxUyGXqyeJ2ebHNbgUMg5md0mA+k+hWi+c8yOdkaJxNbJaGjvvg27reshBrIdi54CDzYXp7wZe13SR8qeLI+Bjv0hxC5goNVtuld3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZI9xPtKOgr8eof7JFG0cBtJx1+MubVm25jpG7g5dWY0=;
 b=drwAB/OJHavz4EjM9GiNOcUP0yy5KaMWTVprQWLwjPtEsSrFLzVge24a0vOOEI2fQR7dWYARLibLUYVDvyfl0dKAcGF1G/68M8n+CpKtlhRtTrkI3P89hJc2+iW8ccJjvt/IGZe84Aq6qmuhRHF0hoJa/zvNVGj/GAQUvQkX5cuUJi5y9hPRhlCM40xsdhFSeDLgR9KbwpqrR+/apFL8uQVikLy6BYfmmEhLJZaw+bLesItmVpTOIiFU/in+ecD20Mha4WiFqZ22iURWr26WBpbKeVM53yfwJWFY16NvroHgzc2YhNe8Ypq1xH1A8D1Y8yWaDTGsoue+xEBQESCOcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZI9xPtKOgr8eof7JFG0cBtJx1+MubVm25jpG7g5dWY0=;
 b=hQQM9pTEo4TeDpYyTys59RCtnyv3zI5DdT3tguyAfKFUgIqMFZwFDDKF6j5fynieLf/DeH9V92vGPkmGdicLwJGJ5xMHMQ/ryxtapm+a1R51mhdjgE2ERp/iCCTg1KwI819aaFBiA/hJi0YB8sH/urus/8HMWO1eGiAOhi0Iaa8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10743.jpnprd01.prod.outlook.com
 (2603:1096:400:2a7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 02:15:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92%4]) with mapi id 15.20.7046.015; Thu, 30 Nov 2023
 02:15:25 +0000
Message-ID: <87r0k80ywy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 3/4] of: add for_each_reserved_child_of_node()
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
Date: Thu, 30 Nov 2023 02:15:25 +0000
X-ClientProxiedBy: TYWPR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10743:EE_
X-MS-Office365-Filtering-Correlation-Id: 95daab44-bf31-4b7f-606a-08dbf14a36fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hqF0qXWk8f25z64gCOvTufgeAYvAwNXHRN/qqNZae/20B3JviauynRko91qMi5WqlQTsVTJV4FlNUvrKXgGinZP1xiisg6l6p4emmIfzAHpNmxf6ykgzG5qfSC4MBkGOhfzVgokX7MLr2ZJR5PgnDyoWPLx0EqnkX05uM02hF4OZjT6W240Mc8Evh6te3iQXDfgMK73ffb9onZRc95THspQZ7I3tEqHXP9tPhvTyiH3J0PhOzG4vuRBmiTBQ+5OMMsqOTVLJ0IBj1SaoNh+8EZ5dlhszqBQG0F4PB0iS7XC+nKlzIDyyNt0uxdQNA9N99HANOk6V8GLg+8foXlXgj1PMmVSV8Ez1BURRc6ksYeSr6lG8e6m7U8SdvUuHwpEW6kklJ4cjtkfaPGcbBnj4Ic/pYvupbJaniSbkSv50A60W63jO+UYRbmMSJGDWSzxqWwwxc83J8EEELnH2vhZl/5BSOg2md8YUKStEecMhPFv4ekpgLW8lsT6huJ2UfImL6FOJGbZM8fg1NLn2MaLhwhLtDJCwe+w7La2q4yJzl1mH6I3z1zz1laaLWmZuVBob/q5JbiRcDLiX/AhWYR54QxGlXs4N03p5PeGldWeQ1t4V58gvwK3HkGwojatWR1CiDo0iQHgxgZVF5AmJ0h6uM+CpG4BcInrxZ1o7Ej7hcaA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(39860400002)(366004)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38350700005)(202311291699003)(66476007)(66946007)(54906003)(66556008)(38100700002)(86362001)(36756003)(83380400001)(6506007)(26005)(2616005)(6512007)(107886003)(52116002)(6486002)(2906002)(110136005)(316002)(478600001)(5660300002)(4326008)(8676002)(41300700001)(7416002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Need05WfrXLdMNPnl9z2zmzeOlxYqpM2FHxHPZ0Bb79juayxYJx+V+dGfKsY?=
 =?us-ascii?Q?xecQ+StqKtj511DxSWeQvtBoEbEZcpb4KY90T2k+PWxNC2PJbhTqxBEVotcL?=
 =?us-ascii?Q?s37FIk4uA+8FavQ4+obNEquXdVBk+JVml0KtHZE0astY1xhz7O7gjaUDq5bU?=
 =?us-ascii?Q?POeqCF9tdABQgEi1QK9at8BcP2We8uMh6Vr/X9jLPX/uhg/mg7PMottIUjC+?=
 =?us-ascii?Q?O3ZV6+J9hKHdysQiENjsV+ybwPhcTLqjrFc/XaLfR8HK9lD84rCMi4vFhiAn?=
 =?us-ascii?Q?/7NGVLRYEkoOMA7Rv7DFZ1BAbujqUSolRU8RIZKBGh4lNZw0Q85wxdmpnVgw?=
 =?us-ascii?Q?gm1QnEu+7LH66bMVz6pfJaznm8QVil03J6XrrRl7YDhtEvhw+Tjs3axXYSc8?=
 =?us-ascii?Q?PLuJxoH/7mhd+K+2GQoHEbc+r4RJ5p16cJlX22uiPGwHvMVwg1IgdXGHcHet?=
 =?us-ascii?Q?nGU6fzwtv1+DNgwyuoRjCDFOmwkDSqdTUWycB7wEB1g5FS+uwFbxTvK5V+sQ?=
 =?us-ascii?Q?wb3FpWfvqTFxxT8bq3n9TUV4mit/NYbhJw7K13UhSL7fJb4mRmpwgghJE1lw?=
 =?us-ascii?Q?bi0Kzu7guarKW1ko9Xf04rkaRw9yxbNOT3mhjK+9roQ1WGXsbZw8yy+j4Xf9?=
 =?us-ascii?Q?ld1pZZtS7FGT30+mJDEKASiyJzG9DhcBuFoCnpf9f51pZ+o2my+CGprkRnW7?=
 =?us-ascii?Q?H76Jwp0THci+Fy4hD1ZyOIYrL0Oi8Q7zDuXp35grnaHOt5nmTxGHRILc9Yxt?=
 =?us-ascii?Q?Rz3b7wM+TgN8xQW3AlrCoINtNgtQ+OSW+qI3OOyKaol6IqmHLSP+I2qfV+lv?=
 =?us-ascii?Q?NbXO5OvWgXgUPPJUhwgtpASG0EnNyujKhFTLiWWi1QGOLCEAT+1k33JNpfmA?=
 =?us-ascii?Q?T5WIWl8q0ittC9c5/MkYj/u4qNLfYrveFkEqaiZZy22KhXec78rKGQQkD642?=
 =?us-ascii?Q?6ol9F1zwuP3gVW12pfktTCzAY3/7vr9DLH12OmlWk1w+H5bZNPunAajpTmTR?=
 =?us-ascii?Q?k90O4bS22rzrXgZYDkUAnAu0/zrxt1MazWCN5XVFF764/jgW6YgQ/g8Y8YcY?=
 =?us-ascii?Q?fDaBIU8Ji5PxLYb8hA6gjHjKy3CX1fBTd4lmuhmN5xqp5lZa9U4Bre+wi7N6?=
 =?us-ascii?Q?GRLJkj4DFtZS1AzQTq0zomJF7sQmXglyJI3feGybrEmkb3kfSeqozjcwh817?=
 =?us-ascii?Q?aWdtpWNTBLfWClO2eV9ARLbtjmpS2nwpAInLW2EiiGCrpuaT7kyAkEBL/Bmk?=
 =?us-ascii?Q?V2ee0Me1TSXG98sNH827clH5HTqXIFC14JdL9zg/nkTDM9fqwH6mDmytAyms?=
 =?us-ascii?Q?ZRJodm4bF7Sw5sAC/fU2gkCIsASomMO1yck+IDPNcw+XbPFIfz1wz+1HFnV0?=
 =?us-ascii?Q?1htWTDMQBHusac3i7jqfc+ThhNWPHU1GNwcJMRx+Dk1C0uuCHIfCbgvp5G3o?=
 =?us-ascii?Q?WuAe+FA4Lvq9egfV1pq8soCvxEPowZp7GkZc7QFUErRQQydk8eeguF1Obkiy?=
 =?us-ascii?Q?VP+2Gr0MyTqS+uOhp7vQoiTVrSTlzjhdprAU5JEWvKZY1vQCmbTQyl6CanZE?=
 =?us-ascii?Q?QcaCDZEiEIMa5hibY1wDV6Nanv/O2cRuBm8wIAb6S511l/DkyXKntKGlx3hO?=
 =?us-ascii?Q?tmOo/gfTCkdQI2KYMGclRAQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95daab44-bf31-4b7f-606a-08dbf14a36fa
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 02:15:25.6146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6417LTeKS/SC2GAlZ+GH/OKQigF81WoM7ucXr3kKyPANDHLcEi8Tf6qDsRAvUH5HK+sHO6mUEIgsiwb8RL3jWrn5jvnv6rMlNNKeQckTtlVs5NTJsUiofOmDHiGlH5mb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10743

We would like to use for_each loop for status = "reserved" nodes.
Add for_each_reserved_child_of_node() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
---
 drivers/of/base.c  | 29 +++++++++++++++++++++++++++++
 include/linux/of.h | 11 +++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 25c841a3882f..b1ecfcfbb90f 100644
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
+	return of_get_next_status_child(node, prev, __of_device_is_reserved);
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


