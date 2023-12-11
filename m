Return-Path: <linux-renesas-soc+bounces-879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB58F80BF8F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 04:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B7D6280C41
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 03:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4032515AE1;
	Mon, 11 Dec 2023 03:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YCWnTDzZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2126.outbound.protection.outlook.com [40.107.113.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D00ACE;
	Sun, 10 Dec 2023 19:03:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CB24vPZOdWpHHkmixmNRv+BRD242/YtwSiy3MAZYwHk8YmygnpwdH7YBBh/qQ/7hcVyBJNcYCC+tHWP9XCQPS5VbWjVwdr6gv+R7IorHD4HfwIcIjT8Ylh7iWH8dFGVJe+Chfg/nBrEJeNoGTJJd7bVwQq8LJVnAdHDoBJkW/FANEvDYAKADLdlnRc9ewYSyQDON+62oOLvyKoYNFB0JdRKIvvyGwGipjqUaNvexnixXXBMYY1ZKScDZGBgog7Wnko02V9IX2SVxyVBiuIpBTu7mGIE7u2n796lV4CnmGh5cJMqMRdmrdTgC0PaWu8UfHPfljzVvSOc+EibmU2txtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r13OWdxPFLvNkCATiQvwBjyKSaerWJzbIouZsgZlUWw=;
 b=Nzl3lWFj/dC5drcirlUqf5F0B/vlESKENhMnQc7ST6qm/BctCv2zOc6Y9QK8pXcD5JFhH5o15wEqmfRilcNgbi3AdGPi7NgE5ZOCMiPuWedvDounYanS4l1gaPDWYhUKa5+4JK1n8hSiUyBDqZ+yRWFnIZx8hwvVYFBQfU5Pi+XvCv0YewKpntYCk8Odk+lARCEjmcAm+txVhjQBucJIN8H7OC1SSiglY9uN74wrRvYzNfA65veEasURwimxUpoNZzPAbkD3ifMHKUwZihTo2VlTG4B5OsiqJqD1y4YWMgOJfZ/MMI7zv+NcqR7DJnhJX1RzCcPEAt2achq2RfKhmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r13OWdxPFLvNkCATiQvwBjyKSaerWJzbIouZsgZlUWw=;
 b=YCWnTDzZ++Su63nfNlM70xLrEX1pL9n9GKZiqAucOIKkb4KPdX544h0ztrdnAT8yirkhGqVBoUR8Nj21lL8De/Chs+uo3+oZEMCeIHwgx+jjGBiYq0sWB30mmudax6q07q2q/RvUOd16k7barFioJv8lFomveywftn/QCiHXCAQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.21; Mon, 11 Dec
 2023 03:03:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92%4]) with mapi id 15.20.7091.020; Mon, 11 Dec 2023
 03:03:18 +0000
Message-ID: <87sf49o2yx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 3/4] of: add for_each_reserved_child_of_node()
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
Date: Mon, 11 Dec 2023 03:03:18 +0000
X-ClientProxiedBy: TYAPR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:404:15::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11269:EE_
X-MS-Office365-Filtering-Correlation-Id: e891d529-ed1c-44f7-1b91-08dbf9f5b9fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DX/mSaTq8aX2XDf6fcIYo+8AqvcHgQ3SeEnmi3rh2n6Amg6LHlt4cKCJdz3xEDu/zc0RE3Rs/+FmruNIxUJyodcsBBZVRjJZq4PB9UaC0B+7l9PVF/YevK+P/EkziDuIPc4lRlgaMLa6eNgvKNUPtiMp6DPYmwE8FteXTVDpUO2P2aVOYmsTYuTwLDU5rgW4FQE9mx7oEk5hagI9i0GTbwRPaG8SEUW8GA2y53SwwDOghbdEV79vKUHRl3DukMWsJQJ5TDm9illeGx0UVrDtFvUgXN7gW9kUi3U0fnrcUlp0ORhPJ0KHULGjwsDRKC/W4PXQPKd7LEbzKRw3NGjeP7hgU7XelVWFVhwAZz2Vdolt5hK0jLVx5I40DPGazawnPg+9tm9D29aB7IFct3sP37Uc5XSWWJO8AaWriSwAfUYOxlsKJs7AqWDgYW2VqYcy9/IRb/kjYMT8cYD9wAw+xs1EUMmt9IW06NCak95dzYykokugf9FXhx0DXy3PLX+kPnBT13dx5efViKk/7ItbyF7ZGqyDrNrv/HQ8vtvHIxUDXfm78LCLjo5Pr3tt8aOqKafuW4uZiytO5IDE9McSGFyCzicHk8yvc/f3gK7yCcsjF85tIPDYHAy6uzesW00Y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(376002)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(6512007)(6506007)(5660300002)(26005)(2616005)(107886003)(36756003)(7416002)(54906003)(66476007)(66556008)(66946007)(6486002)(2906002)(83380400001)(41300700001)(38350700005)(478600001)(86362001)(8676002)(8936002)(4326008)(52116002)(110136005)(316002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zmpCW2w0SAHhCwX7HXLOBkmmlSJoyQXJ752HqN9LaVyCDzRjn+SD/bX2DoCt?=
 =?us-ascii?Q?WcWhQ19nh/N+2MyTshGsb4D3kd0Z68sasFROxRWBo32Pxwnx+cZ+IAiqHOnW?=
 =?us-ascii?Q?RoXZPVyZchTqmsSyhzv+yV8WjTiivkVaZGtpj0E6ySJG54l93mMpGcj9oir3?=
 =?us-ascii?Q?vGfEV6hq/gzByfOIOYBG8sKCsWcuONEpN4Vuigghf9xYAT8FgFgD3UleTkZk?=
 =?us-ascii?Q?ReDFBFJvwZl3m7KU5iBOVAv/xPgLJfUjE21Rhi3jTneULEwYIDFXfQGbFm7k?=
 =?us-ascii?Q?R3/kmFMNEHE7XoQf5yzXKmTJDq0tG6ezdsm22ctParkPpnSsHSHs9RTv8fws?=
 =?us-ascii?Q?NvHZWj9Y5WX2p2/nea4t7eXLpqHcQitKoduIooo1OWNUNJov/20YbSj9I/Ci?=
 =?us-ascii?Q?zYQjLkzUAHyFrRwF9bCTbsPdD/W7aRh4q3ipP9/lNbf1zFI0wZua+shCw43f?=
 =?us-ascii?Q?NsB5GjWVPn5Vm+Hj2pdd2Rie/lON5THceh9cY46DAUMWcepQG0s4szU1Z1oi?=
 =?us-ascii?Q?GtwPi23HWz0iOZGAuclX1UiV/hn6BCusvPpYkODwpk/tVLl8h1hKBVBUa679?=
 =?us-ascii?Q?jUQdif1s81e/+G64WjLEd6IgUHOoWGyTOfXPXL1/s0RAix5TJPCXHQIu2jka?=
 =?us-ascii?Q?X5mwu+nG4q8zMlnb9FBhN5fPeQ9Hi0k115JwnPXPyL1GocmSW1w1W9uKAMcF?=
 =?us-ascii?Q?Puw7evmLcagNBNgEcY6aJpakw8fiq/cRTA8vpcRxFlPLeSSyOONkHYMr9HID?=
 =?us-ascii?Q?Ek+W+CnvS0cvIFG8vY5+7KliNhbWDBcVHwj6tosnmvSkISF16FH1Y+zhkJsW?=
 =?us-ascii?Q?3bhndpfujXgXPsRAbxbxA+p9m6hDhkJhCcegI96/4rNIbJeeIg/tYSimJpMP?=
 =?us-ascii?Q?5NooEaIWOri5H5CM4GGSzIoD+HevDIaLpS0jkyYAqoi3qx2EtHiCsDSsuObM?=
 =?us-ascii?Q?7hALv/b0mTiqTjgDOl/0xZvIgiZT54KpHdspsfnMX0o6zgDxqGJf/tHR5qaP?=
 =?us-ascii?Q?NPIKTyqSZXg2aZxwDSwwv+7heaYr5I47jI+0FQ9zoofOro4jzMXiawlzM4U0?=
 =?us-ascii?Q?gI71Rnat6k/lhsEvc9GFd4IHUu4TraFQXLG+K6GBV01UHCrBNanJ4a7QWpbK?=
 =?us-ascii?Q?BDde+mK8SvIkDtXSc7OFDBEmrwK8UyYdhSfZZ4ICoVa1Uk75zVpkpFpVUNoi?=
 =?us-ascii?Q?xHhG/4mEfbtYG7DvOKhqp6hBwCS/EJqc7rtU12kzq6d4Q0DsPVnTv3dfPaap?=
 =?us-ascii?Q?dFk2BsLxDzrbl6mJpPvlJeY/LP6ehuQuq3j0j6SRY3RStlIedCt5/6llSBXR?=
 =?us-ascii?Q?pw7mhAELNJeYdB/euDjykBotmHMBJNA6ZECa6ZGKq+f5y8YiJ0ujHrpLDMye?=
 =?us-ascii?Q?V3ISbg07DBTPQgPZzEXswIG1otm8aS+4ZQuS1hDH5UnMFt0OpwVuUpXPc4O9?=
 =?us-ascii?Q?+VJJbioGUyWxONqRkiHEiLZfLb7sKnz7Nj//cvQ/twUG6a3nLPRK0RoQtCmq?=
 =?us-ascii?Q?bOsW/Twd3m2WBSU7spsz+KpAWDAEMI3tguNMigLvfYuXmNkICVxyhMLhpVbB?=
 =?us-ascii?Q?g6MdYCW46JNMzE0YY/SfZUyb92LQxJMF2aF+p6HFsGau5m782NOzR6q3qiQ9?=
 =?us-ascii?Q?feiyiTjxcSFWsOE5NHW99jo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e891d529-ed1c-44f7-1b91-08dbf9f5b9fc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 03:03:18.6724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eRo4NuRH0tT15hxqFx3gafRh8J4P4yTOvnbC3yajre0euzLOhvKeuqDiQMDr10v1/BV3VBmIfY9J/iT1jXj0W9DbYGl7rHKQuBpk6O2GLi2dmLvyBG0OaSdVZny9pJUv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11269

We would like to use for_each loop for status = "reserved" nodes.
Add for_each_reserved_child_of_node() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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


