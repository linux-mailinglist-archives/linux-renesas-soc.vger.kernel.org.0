Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2CF7EA739
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Nov 2023 01:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbjKNABG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Nov 2023 19:01:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjKNABF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2023 19:01:05 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2116.outbound.protection.outlook.com [40.107.113.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE99519E;
        Mon, 13 Nov 2023 16:01:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=erV4aNeomo1hrOBIzA3VBtpU9S88VVGXewuZ5PvjsAE8qYKWJPzl0Z2jEGTS14KD0KP9Td+4//vFN1qVAuTJtjx999PSptuuN1jA4JeEkCjq7JKNgLMRH82GAsYnE6CVql1CvBMzptGjvfAU8/u/hEnm+wHSPq1fvfKkjX5I/XckHZRko2WOgt55RYpNuJtE9j29b04BGB1YKFebyiqQRQs+BsXktKhsNs6XniN8wgC3BZcAGrz+JNqQlmGYEqhyR7hpaYmC7gKd2vTp6vMEutKBj6VZbmj7GLp/QLREj02eXIEWASi3bR79Wc1UOApl/cQTBVhK5X+uiy7zxyCHWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLWjkKQoXYGsPpMNV2hSaxo7RxLYAnl30h7J7U6Rneg=;
 b=aJA/vXYr8uLseajweX90RxVEIBF94PSpR6yIQgvWAzzJihms7iO2am+8SMzkZUK2YTG2a4j/BK2pBDkHNRaJyqPKGMQkRelcexkx8IYgtLSwHOcbpYifCmA3FQgSmerpLcKr6VC4TEYZaf7zm958SfeoKAQj6AGL78+Fv0IrmmOtxDVbrc8VgA0UCoa4Y51Q43P8svv9qvaWYMrI7n89fzQznAUn908QXlk6E+89H/p5sEYrNWfvzCdhCWVAjbjvEXSX3+3PfMNlw1hr0sCez4UDp/RJPh7J6/sWxMvVyQAt72YHWNtxr3k2vjSaFAGpO3ciK1TRfHalZ4G2vBQ0sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLWjkKQoXYGsPpMNV2hSaxo7RxLYAnl30h7J7U6Rneg=;
 b=cgT1oSVRP8WIXVPwW+3yRckKHcdTsl+iFP7kao7JeIdEf3rEp4ir8iwOoYwGVIjgtoiAEp2z3FG69iYUwM3dc8TxlkMTbDat+/wBYlCH8KVWm4xkFH9jraIsWAQqBP4fNFF6t8uX2vsy9cBH23vzlIVFO6Y6Z/VaUw5Wb037hGE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com (2603:1096:603:1a::14)
 by TYCPR01MB9273.jpnprd01.prod.outlook.com (2603:1096:400:198::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 00:00:58 +0000
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d]) by OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d%4]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 00:00:57 +0000
Message-ID: <87zfzhryo7.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 2/4] of: add __of_get_next_status_child() and makes more generic of_get_next
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Nov 2023 00:00:56 +0000
X-ClientProxiedBy: TYCP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::15) To OSAPR01MB2178.jpnprd01.prod.outlook.com
 (2603:1096:603:1a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSAPR01MB2178:EE_|TYCPR01MB9273:EE_
X-MS-Office365-Filtering-Correlation-Id: 449dbbe6-908e-4df3-76be-08dbe4a4c735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zQWerdLcJURadBxGTi1lW63lhpK42k6j/HrfZrqHI49sfXeJYz0xJ650AKAm1GokqY79GvCGeVi/rSXJZyDDmdGlvdE5qwccBKNXmmRe3DQScN2PQCs0DMeINrGchxETB+v9VUMnHl4Vg294BifyMK5G8G9xAW63ukzkFvmJfLqY2wPTtteOKivNFHS6BARqR8JN2w/B+H+64fVuNVAr3ky+wqMRzejR6AMXsnqLFQBGjLDC5at9TAoYVVn/kDrXwF5HouS/+/hB2ResFcCs2KCri83XdGnO5aVJmFHs89M/PtstHAXOFL0Qelwey+nxzfCoMNgaWnct3iKPfCgFp0vbnUlePAER6JhZ4V+L3LbQlKKYO4PIrRAUgpDO6QdvbPSQh8oG7806AFYYKVISsEZBLxXKLBBq8jsGegrAfx+3QJSLV+ZNx0aq5L6sZea5K9cMzdxgBAasOouobuV6RlnaB4dCP9KGRhU8C+4jyUgNI5SuSf0ZxEvEkgp+ppl9A4tL4M4x2lGPrT4jKMhfm0GCW9XRhDcJbUikIK7ObioutLfwWXPyptptuhNNRPsbQiTmqDTt34t4Uq0GROHzPxin71JulU3UFHezAwEW+BlSzidkEy+dgFq5z720yrlgT4KX/UD4QhKf3Eo7XVvN+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(366004)(346002)(396003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(26005)(107886003)(6506007)(52116002)(6512007)(2616005)(83380400001)(4326008)(7416002)(41300700001)(8936002)(5660300002)(2906002)(8676002)(6486002)(478600001)(316002)(110136005)(66476007)(66556008)(66946007)(54906003)(36756003)(86362001)(38100700002)(38350700005)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?42yFSKAw/15zR2NnhB5kYJHBhnuV2KoG1VfCCO96pOareYF3prR1z4gpg89a?=
 =?us-ascii?Q?/OP1jViP76NpUId+JfE0dcrED7PqPPiMn101hVEvATgrwIySUv3iYDeWDHIw?=
 =?us-ascii?Q?8uEm0yl2bv+YIYhMUzi9lWjJ3sshQfun+Ocl6LPephgBvoxA+aZ1cPlFoG9c?=
 =?us-ascii?Q?R2fRFawjz/PsUuSOqwrctuK5DAzVHlUDV7ljz8mWTEFaGPUR9m49GpbUnTzQ?=
 =?us-ascii?Q?y98mq1PFzlYdc5Fz8weNSXXxRppFc6LHGuk5qjfw1O6p0ODpIsjyDSfdmRHo?=
 =?us-ascii?Q?xcnFZYuIQTnphZQTidvj9NHUWbib872JhmKoNzZD9pSvBgajeYBNIzi2BGjF?=
 =?us-ascii?Q?kwS66nAReWdX+L1Sn9U3JFrN35mQg0NEjnyH9SC54SlNONIyv7AwPXDGjrNB?=
 =?us-ascii?Q?OzhoYG5QSY71kQomZwxp1dTwpKZa+uHeyv1/Te4oQo83s47IX2pNBRfXHQZ0?=
 =?us-ascii?Q?C8RLscIQ8ACGtWDjrDdV8GttyjLLczq5Qv03iUkruJrbX5Ex17LwYoWzZ7ZJ?=
 =?us-ascii?Q?T57rGEtyXjpbj7twceUNLLlQZY3wmMODbNMn3mWkbhjQYn61yDgZLK/+n1cu?=
 =?us-ascii?Q?lYBDGpX/RNNOA/75ytxy7somSxyNDiqS3jBOjhnb4aeJq4Aere7VYKgqOCzm?=
 =?us-ascii?Q?qlsrJwB/UIylOf8/lOQVZuLrC8NkwngKdlO02TB6UDgCntdtnP6hayzHzWbi?=
 =?us-ascii?Q?F3uhvz0AH/q8TD/AMGjqOIwMsvdjOBJE/X6YhyNWd2mY6wAP7l7QBGKnEnvA?=
 =?us-ascii?Q?rOzDVIIbeg2HyG8oGO4LwEbDE/FN7wM//6s/Z9xj8JUjY8z3luQBp36W6cMf?=
 =?us-ascii?Q?iJHHfxhKlJhEF0ua8Tt47nru4VosL2OWpxhoccfeMtGDsTOxd4wsYkK4a+Eq?=
 =?us-ascii?Q?7pFxxjhDsA354+bmKjo+WVgj6nGVGvXgbL9xcv6P5oOZeqawOLtNHurmMsaN?=
 =?us-ascii?Q?3SqglgiDe1FoZklxxIY5nkBrAzv6iIX+aDZ31tkkSktytDAmU+r272SfyPL8?=
 =?us-ascii?Q?/5x6fp/qVAYPvqgTiyi49UCKNMmn9ssBxhB0xBtVo7hivjxgVGC1JiQ9thBH?=
 =?us-ascii?Q?bmPbW61b5z20WqZCaD+iuJ2+4F4fwgRT45jj6MG5Yz+Ij5pzIJlUnKklc3Q4?=
 =?us-ascii?Q?SaLtm8i0vTiuc+oIJLfvYBGf0U8aBb8wEqG3Ixd9Tlwn72P8kQUy9XyUC2C1?=
 =?us-ascii?Q?WB5pPLqqfxSDrhJnWvxGFdb1b9TVsjSR2rTUyx/2OVi3fEiknJS2HbIbiuRz?=
 =?us-ascii?Q?e/3NupJ25cTbxCn1tjn0EF+ThEGizSpgwcl7BiQxD0tnn7+MVvWse95n1hPO?=
 =?us-ascii?Q?HCrGdBajwSXkOuAIJ5kfluk8w0L14g4TuXGl7zU0brkc2N1SVZBKCspdVP2r?=
 =?us-ascii?Q?5mGQxvPb8UJ875Hhj/7r0dWcF+v7DSEnrFD9Rv30j8nwNH3SophU0kVjR8uT?=
 =?us-ascii?Q?SPvBVN6VWIcgKhBYRNv6XY2I/4YASFqTNMD1ct7ED3qxXcWxuwAkiL+ehrqx?=
 =?us-ascii?Q?LXaLtEOLRvL76AnHe0gzvhBJ1rgRtvj2lEmKbQV0+5GkgJ2iDkGZ+0edAjKQ?=
 =?us-ascii?Q?waafQNTUldUu0Fkd/sfxAO7oWDResoVBRXuAg5WJ8bU5iD0AyhJBGL/WagIm?=
 =?us-ascii?Q?3HYC6xbowZDXM47Yhra2AM0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 449dbbe6-908e-4df3-76be-08dbe4a4c735
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 00:00:57.2506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NB+H3h5dHl82GTVT6EAfsn1PVwEYq/yTzgRZciyduG1Q7BFm0nNPNrtLWa+7cUHsWsyh+H2j9zmBBQomPh7JMMDFGu9ROuEql16MUTILCuGGjMGh0dZBcA7Cw+ptmvk2
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

Linux Kernel has of_get_next_available_child().
Add more generic __of_get_next_status_child() to enable to use same
logic for other status.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
---
 drivers/of/base.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d67cb650dcd6..f0b63e195f66 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -608,16 +608,9 @@ struct device_node *of_get_next_child(const struct device_node *node,
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
@@ -628,7 +621,7 @@ struct device_node *of_get_next_available_child(const struct device_node *node,
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 	next = prev ? prev->sibling : node->child;
 	for (; next; next = next->sibling) {
-		if (!__of_device_is_available(next))
+		if (!checker(next))
 			continue;
 		if (of_node_get(next))
 			break;
@@ -637,6 +630,20 @@ struct device_node *of_get_next_available_child(const struct device_node *node,
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

