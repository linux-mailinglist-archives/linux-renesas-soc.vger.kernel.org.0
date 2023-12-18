Return-Path: <linux-renesas-soc+bounces-1181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 145928166BA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Dec 2023 07:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38B7D1C213F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Dec 2023 06:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50C56FD1;
	Mon, 18 Dec 2023 06:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pH/g3Nfb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2106.outbound.protection.outlook.com [40.107.114.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84B56FC9;
	Mon, 18 Dec 2023 06:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vh9fvJoJjaXYJQhpUY762bio+68IBifqMVMbh3OtewoeIqKocsoxy7At2HqQPimdwXfepO3XQYly3voQASf9/GsDzU/P68Tjf2v5MMn6AMq+DmyRMcFwBDVYqqDcKlJTcNPugcdWsvOhzgG1rfJRk6o+pwx57sV2CJTXhx8AOJ8nM9y+lgH+rLRnGJTDXUV4DgIiltcrIAl/lGCF2kFeaac5Dr2TstgdxNgdNVXONC0LkK2fwXs8pd8a2SEp59UXXuugy9Ud36F835EF2UZwYDE13UHKu+NvNuj4S4kiDxV77WR2c199KDm0I3fo7yNg37PJmy7/1liVJa10KTEL/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r13OWdxPFLvNkCATiQvwBjyKSaerWJzbIouZsgZlUWw=;
 b=E/YbKFMch9m1xtSxAD/LiN0FMfqT7q3lL43HJogW9YatHV++jDI1C5GI2Sey4jaS7sl3QSi+03n8IaCv0jtC4ejP7EHQVjRcqVBaYyxQrcwYbt3WEtlQHxOm3jCGP3j4CWpb84NH+W1S3d/huggQLKt7V/mP+ZJR8vWdDq1xDie18ienI5IxT4+fHgVMaL7KQuLRbJH1hit6omW8qwv0aHY6/EfPE+aerfRwDxWZEaBnUPCpFp0MOXlWxsCChVgwhnDd1uXQrLefmJTpmiErO/s8xO7Fy0m3W9zMoNFhCp8XEjuBEPw2EavA1xub9UuASUyotYNEsdMvLNC+qAMK0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r13OWdxPFLvNkCATiQvwBjyKSaerWJzbIouZsgZlUWw=;
 b=pH/g3Nfb6aJT8jofQQ1BzO8xXvCCby7QMp76JwAKSWF8Oa1BN3RsdzV8QIZwDGd51RB7dlOoRbjxBhWEXj7dHVPz0gLKwg+8Py3yqtSx8s66Ms8+Nauk7dMsHcn1Ptzgxc0L1glzANRMnZ7qDfuiNC8W+4lGgJ1JQET9wRyJcys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB5852.jpnprd01.prod.outlook.com
 (2603:1096:404:8053::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.16; Mon, 18 Dec
 2023 06:47:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::eadb:ae7b:5fed:8377]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::eadb:ae7b:5fed:8377%5]) with mapi id 15.20.7113.010; Mon, 18 Dec 2023
 06:47:02 +0000
Message-ID: <87jzpcm2ho.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 3/4] of: add for_each_reserved_child_of_node()
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
Date: Mon, 18 Dec 2023 06:47:01 +0000
X-ClientProxiedBy: TY2PR06CA0042.apcprd06.prod.outlook.com
 (2603:1096:404:2e::30) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB5852:EE_
X-MS-Office365-Filtering-Correlation-Id: e35fa12a-04e2-4d20-65c1-08dbff952414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9ER5vJn8FcYZd8qgR0R9KbXIq/t8btMTs2kT9kXhH8ouIgJ9mnH+pbpmMKTTPWSRU6P1M4Zgr55v52KkU2ojk2I/ewaQ6zMAIS6hVPfmFjXaFpTbCCKX3vwHYKsTtk2ZFWGBoOBU96QzzDmfBH8en0MMlwJZfvckSFjilIo2q2CPp5TKidpfZXaAJFUeJhXVo2RNBqMmBgtfZBSJhQ4Nz2WMKj25BPp8r0/csakj/InRlfWra3vHpPsw2PJxYoW6C783U+yjGOTwHX97Dvm6npsigz/qkdFH1a93zwS/RFg/LH3O+v9t8cBSRfyC1QEPLmLRF2HP0R8V8EW8mEmHXHflNo9kAGbaITv+wh2UenLl8+r37HNceUE66m4hf4GNvwgaJlLpe68YpCcsIdPBLMAm98IUnna3a96WZGfxGHOkjRK1JonxdHkAvfzbd+BaLW8NbpVkRHApYVdhuAy00jhg27CvdisPH7vnET0OSzC6JdwpMnvBpzDaFvvIAzKTHWA2IFwHrAcKlKgEUJblutGPaE6Akwuqu3DxEDkz/c49hAdHlPtJP2i+/aAUqJUcuqssktklwso/IlG+uG2x4fgwfZUg14SEGQNUYX/DcRhwwZnpMUdmxrLM3nur5c0qcM3miGbBtOmuiXk5CLSH9TKc1mRWgmB6+pvQpVDOe1E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39860400002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(36756003)(38350700005)(316002)(83380400001)(110136005)(66476007)(66946007)(54906003)(66556008)(7416002)(2906002)(4326008)(8676002)(8936002)(5660300002)(52116002)(6512007)(38100700002)(107886003)(26005)(478600001)(6486002)(2616005)(86362001)(41300700001)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k5CwRckzIZH/L1kZUm29DHyBC4gJh/lqSfMloet2Lz0HRruIRc/JyFb/u6M6?=
 =?us-ascii?Q?HxsGYI2QmPK4CreQCgCJJ8fePcY9oSOFz6hK5KQrDlLwF+4U8l4tUqC86lBK?=
 =?us-ascii?Q?Bq2m0tUippatmFOESgjtD4D6KOZtcSd1lMXzUiYplhX2h7YSb4QF2wBnZ/Cr?=
 =?us-ascii?Q?WKYE3ZKM2jcf9n4paoTXHjJq0Zk+b1EzyIbOtiCxUcNemZulKN+Q8ToWABAh?=
 =?us-ascii?Q?WYiYQRsyVZoBk1pwTos0YZBonRXZO/KxtG7zP0n93EuvIon9AEWfdF79CmiQ?=
 =?us-ascii?Q?j4nFPdkllL9WluAyf5Esabwzod7Ko4ezkbg9MFkV360CdYAvGFOnXBXbZeho?=
 =?us-ascii?Q?FagNUAyVPE2hp2a2x6f3UajxN/HyHrzxQQcXe9QwanJVMkm2i18tQUVNifW6?=
 =?us-ascii?Q?wtwKJlFd8j1piM6cyexHQyk5iatNJ08awaMs8g7NfYFkX9gn1+uontR0fUhk?=
 =?us-ascii?Q?kBVC/Dk4aNUouZxZq4vTAwZVLkXGzRDDMdYAPtLDfO9A9fK1YAqaS9ClB9Ys?=
 =?us-ascii?Q?4a/Ks8tcAHnuwewjlacHJuUpUPBOgaXzFte8vFYOSB+ohpYj9Q/sFnCebwFT?=
 =?us-ascii?Q?Ir6zMBpjgPLPVk4pdOprk2axb8s1kfHxzZO6oUZ2IX72YrEGMb3Lza05EOdI?=
 =?us-ascii?Q?8Ll/FpHwtiG1ii5omDjeu/GvlZSV5MqAIzqhSzRnvSTRTabZ749g/WoOFI9b?=
 =?us-ascii?Q?dmhZKjt0V9ZDulgmko4n1fIokWBz7ovTat+5dqFEu7MmI4HsmOVUp2Ub52ae?=
 =?us-ascii?Q?UjG4tpRckdhoqtFqOYiUFbmCTcSzCkTy29MxpN+LpMtd2N4rnOudVuofB7ZQ?=
 =?us-ascii?Q?6JJk+pEOhVFGKwmH2BxtxmwwkUjxcPwa0k6B6F79PKLOhl2yuYS/7YyvK+19?=
 =?us-ascii?Q?SNoDzrp0WI8I5WATBpCE3Fjn7KYLqlZcDR7wml9/N2qk/yWcAgrY1ICso23Z?=
 =?us-ascii?Q?ysFuqFXVtxfMEkhvEkjQbZWv44DY8pi6a8ayWV9PBOKOYKowmq8Px1gHtVeC?=
 =?us-ascii?Q?6Zr57pRnhK3cyPbMkq8FUqGLwFnxrSOTBfdPDrKM7deDgS+ZQXcLG9o4zJsN?=
 =?us-ascii?Q?ybsq51HAuGq7BYkMwl+vAtTKk2EYMilqeVsWjOsbnsaG5WJFGn44aSL5D3UQ?=
 =?us-ascii?Q?CVtfmutRdhiagmmJIgyI3Ce50bgLEJaVROxQzEpzIT1I7P/H0AvOsL9sriYQ?=
 =?us-ascii?Q?7tWZG0GIn1cFc5/BWcQGOQcL4mvY2ggWIuzVZO8bccNosz54Rrc9fX6R58B7?=
 =?us-ascii?Q?yGodOpeHKDlRwR8DhtrBXfjuOPEU9qc0bwQH0X0d1lfkodseCPLRYguAKvoB?=
 =?us-ascii?Q?XrNQB++22tLSosF+BCrX3xAxvv1hfRAYdZ+eKZmxd3Y/aNUNQgAUejjQWT73?=
 =?us-ascii?Q?LW9MjJ0rzDSqjAGpCfssmD7/LeT+NsR2Ewq05C4j14kmyBpw245l3Os24jZ1?=
 =?us-ascii?Q?dP8mk/0XouD9Txe2okPy12e7tgTa8mAyJqgftH8VX8l351b0IulMJvmUouoU?=
 =?us-ascii?Q?GJ/2C9k+YO/5SVOO/gbVKliZ+7F0h9+lFON809NbVMBgs1bNE+btjLuSEo5P?=
 =?us-ascii?Q?/uS8nF81JYRu4/QPhaCYaE9CInRJXIWjDmXSIpPGM5TTIjoBaTlpddnQqr/l?=
 =?us-ascii?Q?QK5KYiuomw4Si+RQMXqBBPA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e35fa12a-04e2-4d20-65c1-08dbff952414
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 06:47:02.5171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9L3S43eI3JpHWi3elEXxuFvPyhNoNZ1BVz9ii6NbPQUud4wSkoih/gFepob2aj11i4fMcq4oOxTEGYYBDqeqD+7GzwOqtabHFYI5JjKH0mMujTEoclb1s0p1JbNpYYSN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5852

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


