Return-Path: <linux-renesas-soc+bounces-1450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 445658291EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 02:14:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B7301C2158C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 01:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610351373;
	Wed, 10 Jan 2024 01:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kd9xm+WY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2119.outbound.protection.outlook.com [40.107.113.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5D917E4;
	Wed, 10 Jan 2024 01:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzYFtJ8qoW6eMJpnz+lsFBXCwMCufcjCyBHKe64xGG754DzZvN9pMpyrfq6LXmqSUcVhJNuIVHZCvXtoQJ7mgtD+4HzpchWFCYyLQbW9e7BhGYQK0srJnrrsYoG9af/l8CF8D7JfjhJMh8Mt60tokV9HSa5IkZJlYYP0dgFmHqJORV+70UQ212Hdwucq3BXdBiR5yVQhiECkRa+Z9BfxToxENJyOTmBJSyegHQm1JIKb92dsSelB6otmtuxCmL3mOK40VvM4WqwSPid692Z1cjmarsAtETLvJqVS52qoswexU59NoU8r7WcNJc6Pp7lX13myoMqS2BpKxx+i2jJkZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQYO2RCbtijy3ZVuoe8I2Am3bSOnNmNkkPtgt0AW3FU=;
 b=WrI9JY3iuma6kgvgl9AWL7JjAWeW2h3EU0W0uggJh8dUJlj4DrK8at3jaxlfKI39OwJhNLYBImUEg5zvAF3ELuKYhOceK9wtPIOiVS0tTXLf9A+yxRhdlqxbeJuhPBmBaCUgp5EaxGk5rvZ/8dhY4NF6GGFXfMtsyF2WVU/HlJYVQzncG8H7GErMuKySJiuc+hG0uj5JJdnpB8cH+OHmz5AaLuAqE04mridafp2lZQoEIXVrY4/Zb1XeDTRiKMvwtkjrl704si4+Yn1kwGgV9200mUx2OPKd9ggIEklRMaXLPbmj81IuRa/7xhmo7CEARBQeeg/McvweUSI74XUh7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQYO2RCbtijy3ZVuoe8I2Am3bSOnNmNkkPtgt0AW3FU=;
 b=kd9xm+WYrrSAO4banh9wWegMaMwNIdIzHqRf7cP0uEZLXs4I0vjb1lA6jMh5bQTxxPOjc0qIPzf3M+zQJFys9RCQ6BLwl4U64IDyoYOIJRTLN2/wHMV5P1CL9W7K1Syh8j926NByJQ7QAfHaw4zRZ5SDfR3l93izDQTeQgrBf0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8442.jpnprd01.prod.outlook.com
 (2603:1096:604:195::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Wed, 10 Jan
 2024 01:14:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 01:14:50 +0000
Message-ID: <87a5pegfau.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 resend 3/4] of: add for_each_reserved_child_of_node()
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
Date: Wed, 10 Jan 2024 01:14:50 +0000
X-ClientProxiedBy: TY2PR0101CA0038.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::24) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: df0b8b10-d3d7-4c19-e041-08dc11798b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	csbuybNQxkVNBPmS0ok+T5sqJcYzIcMbB1NjEcAKOA2OWM2YRIb54DR+OBjjdKeEif98Py+jnrDiTq6qHxvKOwM6TQisIyZ5A0Dnvzci7/74sx6uk9k/MbzDwAY+cDr2XG01gZh74A8muw4ci9ZFVXJA5gIA6PWsW3MTz23iGIVuT4d3AhQZS6zn+W/AXK2sls6wLakeBNin4trlO5xiAtFeTDGT9cn+yoRS/0LqM4qPs/7JU1SEwwqm49u/xu0mVrALZOf7wGAD9jT6SEX4PHwVyO5VdGVl8GqiqnQ1G/Na8OTsmLWLLVF6uJfLkL5m+M/7I9QqMlZ+RbImBSp8k2d1Ghgfaw6ghHMWVeeuA7RXR+EkF6i11g28u6iSFiOQ89c69HiEOHIDpfwSfrvuEAV63ihI+sqbFyMi7m4asJeoYT1T+yHhQVk/cCfUhjYCzH6HMAEKIOPWcCKXhJ+aOYVj9yD5k8hGDYyGefo4fmQTPpg1GCGZs6JKKk2xLacaZytx8qM9Hqt4EgqlIAU/99UTRoW1wzYiHhJwsGpmRALK8PmZU3lRs44BvO+xM2O0+eLD/FQKKH9EYC32AteVhfAw22exinfjAQKunrqKzGVtULBemUOHab3JzY0qVHUp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(366004)(376002)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(38100700002)(478600001)(6486002)(83380400001)(54906003)(8936002)(8676002)(66556008)(66476007)(4326008)(110136005)(316002)(66946007)(36756003)(52116002)(107886003)(2616005)(26005)(6512007)(86362001)(6506007)(2906002)(38350700005)(5660300002)(7416002)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rg8Iq+/GyWAT85GaR+RhvEUPSdWw8IdUghu3JvhTCYsbM9++pDce7udi/eJ/?=
 =?us-ascii?Q?f9gh5SRIWi7eRFOcEI38k/FM0S6RK9+46RYnXGh7fAdUFtXj1wanQ16NLXKY?=
 =?us-ascii?Q?ZdGSvP8qI3rvIVHngLtWKfHm4aZwLa1GbXX7HKpY1SNAGXqBmkihFbUxLpZw?=
 =?us-ascii?Q?cS6okh9Dj4okCS9YLCgu9u4jdOBMmsE3r/tWcPpxY7X2XIRNiVIcl6abSSzy?=
 =?us-ascii?Q?N88rGtHSEpg8mWvZNbGGZZLCFL4YbA6CxJzthd2VPnQhlyNqu6F+eM/Ls/AX?=
 =?us-ascii?Q?CckQgWB3a9Gz91s3Mc/Qy+FqnUCCw+1C9lG5fe7IlllOdfVWhuwYB6Ddq0a9?=
 =?us-ascii?Q?wLiPcajEpYnHXf7hK4HlT5BewG1QcDpK/z4CJ76Xt3aFxtENnbKSYj7S+AfN?=
 =?us-ascii?Q?eUPdo5UeKOhWJlIejlLGwyM8r7f490KpDXURRqc2Fmp6HHnvuEVcjMjMyDuV?=
 =?us-ascii?Q?qg7HgJuHcgMrLI4sGW8wO8btNVDDX25KnMMQzevzSonZ1HD/p7T6yx4ERsqk?=
 =?us-ascii?Q?851thybVzCXwrU+Tzh1AlWrg8K5X4ThBUUeSmHi/Ic0pMgKs7LebZPF0dT60?=
 =?us-ascii?Q?DgoUAtMx+LAiWr5X72+OAzaNkXyXl1f9RkepCWyhqHUzuPjazJczqjPYMUQo?=
 =?us-ascii?Q?UVKZBQcdEFIpVdFi4oP5Ky8gtlZxRtUBgpsaW+Msqr5OHYPrQXpOGk1JqMi1?=
 =?us-ascii?Q?nxPr6DNUqXqS0nWAdhk96eijLu10cqZg/srSzfmOuZ7D0OOscQi6kYpyduVD?=
 =?us-ascii?Q?UiPKuO0Y8AeXjpxyT77327bhVECoV3Re2dajPAWQWM/wKJfR4LwPSuryAmZy?=
 =?us-ascii?Q?xejwByS1bY6fHYp2u7e+HQSNpkB546Qy7eT+v6YpLowaoU6G6WNKjjKH/tpN?=
 =?us-ascii?Q?8hcWpk0A0qp0+1Q9KtrEDuyfAxGIg9sIgaDAw+Nr+LDCXV6kxtxfgFFKQm6i?=
 =?us-ascii?Q?gHWKbUwzjZcoXoek1wrbJ7+A1YAL1IVPQYp101iGV7BWfDEAjYRBOD2mgAEL?=
 =?us-ascii?Q?pY12bsW9Utpc+O/93zDqyW3nf6vFzShAOfKeTQBGlawme4HHJ6BWJgRjNMV0?=
 =?us-ascii?Q?lNCQZe57gG3+Ox8xIWSfi4JFWq7/vj6GlHDYB3XarM+ZwpUBm/bdEfxWilUA?=
 =?us-ascii?Q?9aFcFPdUQgs5yXcJtbA96GrIk8GSD3yIX4n6mDRf62fWCulwX0R+0D/UkiV2?=
 =?us-ascii?Q?10WZcvhvLgINYy+btAZzUJl20OssmEq12LvFo2yg+vmzE8zKyl4fQLJqxB4c?=
 =?us-ascii?Q?HOIGKHUwPzG+GQ1f43DF2OKmh1pv9uqnTeue/ttQrauRd1vYngxm57GSNudI?=
 =?us-ascii?Q?xjW1GqvhdoQwDviFmQkVZxoYWAnGL6gVa/HMDY7NcEGg52okJJ/BYh2cG4yH?=
 =?us-ascii?Q?8EhwMnV5OaCTetKuWRmgGQ1H4po4zsa3e6cwxpsJ7EBZILB/UPjKsChpvvCS?=
 =?us-ascii?Q?IcQ9Nl5U9YEy0cp/mEPiGgbK8xIa/NhLkOgcLnWbMt22s7oU/K/2XkH//7Gn?=
 =?us-ascii?Q?TGnxnanINE+IYVdxoQH2SJSz9evqWHlytAAwE+0EqEvM8UqchuEvkR4AvtKM?=
 =?us-ascii?Q?PeuCE8A6ld8GPvLZaJ4qN73PQKFVr7VnqhRCjjyt9yggJPbUu02kc7wIC0+0?=
 =?us-ascii?Q?W7WgUIM5xGLiSyN4zVPw3eU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df0b8b10-d3d7-4c19-e041-08dc11798b23
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 01:14:50.3974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GiwSYaPYCpwNhHHYnFzic6wT2FaaELvFYh91dPVFicMdgTMMnM8FTy3K0CWejZUzFT8bfbhi1IvZuh/CEyzvroHlYINWnbtbxDj8r9U6wONpfsjouaeetmL4Wue/e4lk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8442

We would like to use for_each loop for status = "reserved" nodes.
Add for_each_reserved_child_of_node() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
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


