Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1B577EA73E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Nov 2023 01:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjKNABP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Nov 2023 19:01:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjKNABO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2023 19:01:14 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2131.outbound.protection.outlook.com [40.107.113.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF2BD53;
        Mon, 13 Nov 2023 16:01:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/+T+XBNIOE7Bp4UzLIDvDqveSm285SBnS2rh2ZknQtpW6oS+O546wXN7TiispaPqSbfjnWFOU6Jl58IGlf+17JrSBAn4zLF7drLNLivUBntacWbwzzhK2nO7X6Bj4s3ck99ix9a0KxA1Gpy5tc6a8WIc72wf1A8kV9Cr7j1qyCjrrZmhHplk3c7k4u+YgEb2NojX/u5PoMvGOwo92VRPwv4/MkCRxXlsX8e5MYJrTeVKR4isf03WuAkLRG4UWPV0ZgvxRQ6cSZSEh2iClkQbQHJWGTb3xWkWLro1I7SLCGYQd31daQbECiTVlE3ST4Du43ImgHrrZ7uwaTOj2kenA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OqEDSJLyPuILeooM4pYtHZ6Adusrw5XOEQUy2fm7A8=;
 b=azIQ6XQyrNBf/Asy6BDmaYbKWpVXyMiTnroAi4X4VV1uUhhpoxGViGOFkZoY1cAKvatMFkvOQ8GcqPRRalU1o2j2Zs07xKYvrUAKzEHxnZqYhvGSSRlaaDBdhgTYcis62MEonB///gkdk7EXR18oG+0EERxk5J4/6iO/xAdnDIaO7RvradHKLtSzXTzLWIUnK/BKnvaIkL5HZyMXQts6JYcNNYRX7B9IPXs+XH3Ipq69onUmT5GdOZ/YTrn9eC9FjgiO2pJfgO6MKfDSjk4kCtOpEjEuS8/u/OnCCwMlCPKfisUePMtSLJ1Pg31dAECwPYKLooka8JW6rYL/jt4eTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OqEDSJLyPuILeooM4pYtHZ6Adusrw5XOEQUy2fm7A8=;
 b=DIOwvgMO4YUZEI6eXOMl6NppnMNa+ZS0DE9/EYz6YYQbfSwY8sPsyJIoIhgqLn+ZlUKBBbuTcAkLn2axzoHQZtwuIMXI5dFe4FiLxbcBWgXeWlFY9CALJq4sSLfZTxr5tAc23xYnkxas0kUDhiVMXDEz3K6zydrcvfwpp/QiC4k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com (2603:1096:603:1a::14)
 by TYCPR01MB9273.jpnprd01.prod.outlook.com (2603:1096:400:198::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 00:01:07 +0000
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d]) by OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d%4]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 00:01:07 +0000
Message-ID: <87y1f1rynx.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Frank Rowand <frowand.list@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Aymeric Aillet <aymeric.aillet@iot.bzh>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>
In-Reply-To: <8734x9tda9.wl-kuninori.morimoto.gx@renesas.com>
References: <8734x9tda9.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/4] of: add for_each_reserved_child_of_node()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Nov 2023 00:01:06 +0000
X-ClientProxiedBy: TYCPR01CA0173.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::11) To OSAPR01MB2178.jpnprd01.prod.outlook.com
 (2603:1096:603:1a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSAPR01MB2178:EE_|TYCPR01MB9273:EE_
X-MS-Office365-Filtering-Correlation-Id: 86d3f339-2e34-4040-a6ab-08dbe4a4cd1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IYLIZEsmHeTyLOnkAXMJPktGwOFSjJhnUD6/EARLUWjmPWjf9UroIB448jgM0rEmWMMu2T8V/j8LhMtWaOvIkT1+1VLWFCUipH2meIwLmdcbFIwhe4dT6eIXIPjAj6KZUABT/a6RjdKCoHdc3XpYdoj/GWz+ruzct/ukXs9exJXFaOB4Px4cjPj9apAvIqnRb+q87A33Fa4KA57/czs/5XJdHrjaDgPGsA8ZVzp++J+cQvd83oWz9QIZeoCiLBwCMseUMrWchALLu3O/d6w3Y4vbGwxEmpMeqiXeNCGFDkQjOe6kBLg6Q6Ialk9b1oC9YvPFFIv5jNFypkdAITjh7aNHorBzfz5BzeCNPcStQpm8tFjkxzAJzS28E5D73AvKm630tSxH2b7vVzp2xypUUkkD8h1uJzMXjRE0yvM9SjO0zYaTLxBv16Fe4b/G9dso77iccEOXf9Oo2Dlj6H3vdiJaIozkH71UQDswhz3gnsvib8EPSfh2tYCMmIe8owqFup/xdpCvkuoEdKhVUFyO/PZPQxLjZvlfxDCZQzfwLT86vMct3FVVACZaFPRooV0hDNYzJ0tNwVdARInBKWhUAQajB7aEQLR4Zq120+xS5zDBbsJwVqLLqtoxReYmTBx5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(366004)(346002)(396003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(26005)(107886003)(6506007)(52116002)(6512007)(2616005)(83380400001)(4326008)(7416002)(41300700001)(8936002)(5660300002)(2906002)(8676002)(6486002)(478600001)(316002)(110136005)(66476007)(66556008)(66946007)(54906003)(36756003)(86362001)(38100700002)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oSAUmPgCyqkseuMM/6KJG2IqkJBTTlBFS4p1WRVLd/6k2cPed0W+o95HFAd+?=
 =?us-ascii?Q?NEvPE3FIphjvTpARMDASfcwdx4CY2knLvvBd9iHc75VVYdEN9jhGJtt0pild?=
 =?us-ascii?Q?ym2jn7havwa6qJd2Hr2u3KcbTBRW5VKuaCj7+CV7fdVWcQ0LSuK3OepQBcDa?=
 =?us-ascii?Q?irCaHwAqKmcQ2Z+MmDKtwTp4Ws1qn0/g0gG82hZanaolk8Ue0ew6EmYfCSpi?=
 =?us-ascii?Q?e+fn2ay9PPuyHh0opjjaT6ZN2mO7N5B16/WIpGFdJb2fR99hZOg9qBzjq3OI?=
 =?us-ascii?Q?QrSP5zKBlWsxtNCPOZXvlG6S72SfeyVoQYoqK3vIfTgIQsr1QG9paMxFOXv6?=
 =?us-ascii?Q?ppncPx4Q6HK4fb31ZZy7PLRL1rTztPe00bu3UlQK/rMho80A3JGPblyVRKvV?=
 =?us-ascii?Q?j2sEDl2J4oOyrbcmHh42RCRKbmSfUbLVaFzXXW6vub23JNAqJDkcRJyn363r?=
 =?us-ascii?Q?l0BP1d1S1uTqQqpMXHTq/YQsMGGhXS4/gupmyiUHhSgsD2ZR7KdVPOIdsvRU?=
 =?us-ascii?Q?BAQBAiLyBHAryQxp4m/oXGCN9ErwQs1fWCNIiIx3J8d1VxZhLreZu8ZmfCMT?=
 =?us-ascii?Q?tEQNVztNI5TcR9Py7extSPq1E3T6cMHz6/7nBNTK2NOd0isdAcmFbOh9rXxi?=
 =?us-ascii?Q?El1andWDtN7N9AYGsUlXq7hl4DwVAIuk0Av69IYVsRbUasEi+PmhQWO8ZA8B?=
 =?us-ascii?Q?6t5XA1A62lDlkiRRS9IvGmT5Jfaarno7JYHzy0PPiIn/BE+nOTop51jathZ0?=
 =?us-ascii?Q?vIRSw3PrrbIem5g8ITrYPHyutFkAE/hnYKA90lZXw7Tw0vPdSv6zrbQRkPcc?=
 =?us-ascii?Q?itmqk5DYvnO5SFfRKjx0aiJp4TOVrNyAmG6JsysezJQR3Sl0r1cjDfwSv40z?=
 =?us-ascii?Q?HjQlqlw4VUDP4tOQ+/qwF99vtN1PkBokhGxR7pGMOe9jLY5iIpEXkuUHF875?=
 =?us-ascii?Q?5eSs9eBzuV5WNkzhLolXP3+nXvFItS5Nb15VsrU/u58VSl1xBPNSSjS66iPc?=
 =?us-ascii?Q?GkXAKwyIGPMIBchUWAhFBPxurTHTbnqH1F1athPcJWXZLPug0AXq1kcRGmkk?=
 =?us-ascii?Q?em8N4n4ne4+m73WY21Kl2+HnU8gHIIznJxuEuXXWJ6GaSUgk3J9la7PlKXeB?=
 =?us-ascii?Q?bGFFaXt0H6uILHGlOb5HIOSv/a+Rhpb8xCcS//nuSPAt6KWwXBeGrHo/GGID?=
 =?us-ascii?Q?qUw5lYt9PKxxug2bfcxC9ius6bO7GnRco+2EJ44pA8H3bqtxs4NdzRAvbgWC?=
 =?us-ascii?Q?WTzWXdgYhciK1XpNCJ9g9WprbPZKurypv9Kv6zvBDY/e+NMnIzkLr7MBhNgs?=
 =?us-ascii?Q?1TaSs4Z9yzxygTcpn7Hfucbkf35A5CZC9/PUKWnIYa6AMYWg1u5HoHEIlTo4?=
 =?us-ascii?Q?u48kldbCv1zfuQGAQwwn6suFVQD4/OvbQC6SQsyCWs0FdUeF549MZFQpRnOt?=
 =?us-ascii?Q?rBWAzRE2/vCbX+A9OY9G0nEoO3HjNb6kqoX5Qqr/Ap+fK0zeenn0RdOvqjCw?=
 =?us-ascii?Q?WUTaw40MFedTDId4juPcKgYRulYZZPudnpZM0m9ggp20GqHJXCT+hZ9UmvbZ?=
 =?us-ascii?Q?++cPpV3zXVxci9gwhjejV9wAIWeUUeIcQF/we2v3ZBckV16CQXbsTCzuFEY7?=
 =?us-ascii?Q?aKCewUnh79EBev2iKLuZAGE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d3f339-2e34-4040-a6ab-08dbe4a4cd1a
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 00:01:07.0919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uuMjmnnM+GZXvHPDzMXFzCT09nMerMUhkRyN282oTYeERMBjAjWx4kE6jK3VLqjrONLSwmobcFfFCbll1IjibKPJQ5vlrjiEhIAht5laayJiQwrEgzwiQdVyy3HLTiGQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9273
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We would like to use for_each loop for status = "reserved" nodes.
Add for_each_reserved_child_of_node() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
---
 drivers/of/base.c  | 29 +++++++++++++++++++++++++++++
 include/linux/of.h | 11 +++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index f0b63e195f66..341bc45bef05 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -461,6 +461,20 @@ static bool __of_device_is_available(const struct device_node *device)
 	return __of_device_is_status(device, ok, true);
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
+	return __of_device_is_status(device, reserved, false);
+}
+
 /**
  *  of_device_is_available - check if a device is available for use
  *
@@ -646,6 +660,21 @@ struct device_node *of_get_next_available_child(const struct device_node *node,
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

