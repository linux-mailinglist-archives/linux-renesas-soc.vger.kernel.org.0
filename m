Return-Path: <linux-renesas-soc+bounces-442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 510307FE690
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 03:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 740C51C20AE0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 02:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721BDF9D3;
	Thu, 30 Nov 2023 02:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Tt/HbjtQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2113.outbound.protection.outlook.com [40.107.113.113])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB9BD5E;
	Wed, 29 Nov 2023 18:15:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXR7rxzlIbZaNifKOmrLWwO4jo4ONO4Ud08drzyM7mgbk3v1Lcdwd0om0r1AX6MpfK2q5vUFYm88Mu7pbAZrFggQ5R2Y9MEZOiI0dnpT+sfuS51ig+qRuYCX34DqkLr6oH1u6gR8iNwAfY43njnWTVahHrHNstT82u9PsEtOfitWHIXu00TFOjbvAPmVqygHFz6celVrIDTW744bB51kcSEsayzI0vDJ2fZ8RgV/MGZYo97dMeRK9RFFQ2r8aChIk/P51Dbj6XjBd3eUYsSyOK7RZz63owPpMuBhRHorru/elh10FUfY0dr7hnMx7XplLLRKfbLsR8SFdVEYBj7Jhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23BgSzNETCaiwng3und09gmFw66dLZ/Ypszr/Sqb+Tw=;
 b=bkpwUW4+V0kEqqW7aKEqxLoWt37szWzv4oiT2juc1WZFe8sdthN/8LxI+LiOjAvPpoAD38JYOkSsTND9TRKk+QrgweSX2SAzGzG18j05ovHUF6M5gGQSZ27zS8UQpD125f3iQVy5cZXO7Wozbc8JFFdL96/jf9C1brF0LZZi6FfZO9+XhVrK0d0pXUBjEnBVFY1e9qW/AznFhCma/nVOSl6GJfMnUPnt7UIA+w97VutLYVFX3IeEzZsW2BdWbosqvjyI3VWZ4Mlr7o3MD6WMKRq3oWkkfdm39N2SSIoPZug5/Ou6W8seOBX9qE7e10nJ99vYxud8/LMMeRYmKbbyHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23BgSzNETCaiwng3und09gmFw66dLZ/Ypszr/Sqb+Tw=;
 b=Tt/HbjtQG0izvldBRzL4yiK39UhHkDQL3Rj9QfCDIelL9NqAShsZ44RgieGVshU/kupmJSyN0sZYqnOX9tcgyKQraBh44BRhTYGVCCqYpGlWloRhN0he5KpLs10SmIAbrelg5YFGnfXDAbg5TfgFPT2fd56wWqXRb/wPd+F30FY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10743.jpnprd01.prod.outlook.com
 (2603:1096:400:2a7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 02:15:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92%4]) with mapi id 15.20.7046.015; Thu, 30 Nov 2023
 02:15:17 +0000
Message-ID: <87sf4o0yx6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 2/4] of: add of_get_next_status_child() and makes more generic of_get_next
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
Date: Thu, 30 Nov 2023 02:15:17 +0000
X-ClientProxiedBy: TYCP286CA0072.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10743:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d766909-8e2e-4935-7868-08dbf14a325b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UymrmUHn/KCCbRZXnpfc+FF93KScBiRqNK3k0Or9gYfyBRqsTzks4e2J+D3/VSIjShVpS3/yrGvyJb63vCimqJH6oc4265RDZYJlSmsYZZl5xWN0IgyQV2erWel3bH882jLsRB1iH9rOvtP1vjZKo4dJpHlfVwyz1m/WZ/RCZf0Mov0ILrTYPLO4HHPZrB7EYVqOLm8BN1K6TtQcfAaLgbWG9ON6TlfKfvJv+gcZjNTWdNaj0Dccpas5oqN+oFpsnA9WN8/w5MdWac7W4pnQihvpLmXyDWyMHdVUXc6IJVKvUa4t6qRzMiEU3k0GkyHGrCkyonjPegbzoB8CjUyKXrYN4lDV0FqWEAfp+mVHK+AxoMdhKi5eWvc2N+imme/R1bO3pN8NOT/QqfRQH5PVMeVHODEBJSg+0RE3jNE8LgV6WI4LK6uI5H9uIHyh9pO0yGvvV7Yk3NwpM5HePaMwZoZLwv7lAUJeeCoEjE2WrMRliWhVKQglpf2u7NGbfd7F06udc3dMKUgl3gKs6io+JMRaNMudREE0OdMagi0YjMgS0xmhdMeCBQUpBAVRyUoAwzteStMBUqIxkTlOcOuxiqjsrCR5mJJKLC0qcUxmpp30LWG3kYuViB2cMODFGln8BCPQ2/COghF29nUqWAXJfnd1GxqnvN0Cnefsy6c4Y6C9RgRpjfskWvYiw6ufbUwe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(39860400002)(366004)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38350700005)(202311291699003)(66476007)(66946007)(54906003)(66556008)(38100700002)(86362001)(36756003)(83380400001)(6506007)(26005)(2616005)(6512007)(107886003)(52116002)(6486002)(2906002)(110136005)(316002)(478600001)(5660300002)(4326008)(8676002)(41300700001)(7416002)(8936002)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b/8PQkp9EHFTPWOP6J9Fd75nYyS2iojQrruyNxmKWcUbv3qs5z0ejyDVYKIN?=
 =?us-ascii?Q?ms2shqPaEs1VwCWo6LEfYEcQ9HZreXsa6JgV6zAoI9O9z5MyORpqj0LO0+B/?=
 =?us-ascii?Q?kXJDszHrTdrX04SOiG9Vfubkxpbz6B0WMRqTpPdy1LSyCdBRk7m3aHETGYyH?=
 =?us-ascii?Q?dLD8e3YIOAeSZzBHS7s4CKO6kNYrfcCdzsDVN/G24lFMxnPEWkXVS1zmmyCQ?=
 =?us-ascii?Q?QFiM3LdzbNa4d/KkK5wFOkOhDuJRD0TblN8M1rpSaVN44GifWp7go5cLWZJA?=
 =?us-ascii?Q?P093cVjRWwAS/l01ArgdyVI50ObOnU4g8UYTB/GzVHEPfFoPbQuf/ovqVM9M?=
 =?us-ascii?Q?XvkdpGHNd5MhXcU96gET0mpoNxuOWUZZHsDaT1sZO5vSwv9SsxccBZh69P53?=
 =?us-ascii?Q?Agi+0W18fv/EVCAtJ2dYOiphGjzjXHcSBdrzim8xCnS2QrPPmkftTFlgcK7L?=
 =?us-ascii?Q?uC6qJcnLSg+BKmsHRyQCh5X8j0eeP7jgU5Esr8vTPQV+WKFsn5XGODSEfUQW?=
 =?us-ascii?Q?Rx+H0Qqa7249nvSzENspM+umQ9fH0gkon+gxKyl8efxf+FzRBmueH4/DLrEx?=
 =?us-ascii?Q?ppEqwWgq5awYvNbX5SD3/FInm7SKYXqEArTq5pvYo3u7HlqjGmpqXnk4roZa?=
 =?us-ascii?Q?p7Z2G+2sg7sxPeHj6kudumXmdSlL22wS/yC7yRD92LHk+Ckhw6OnD25frDPI?=
 =?us-ascii?Q?M0iAw8I4zyc5v+H065/oZ4MHqfTW7JTR9viwuvHRKMyNad0/6BpnL6NV+4sH?=
 =?us-ascii?Q?V3Y5twQZ4IB4m/mKabHyyMvD4zPc6S7dV7joL3aZkg2LohmZd9nWqEqMO1vo?=
 =?us-ascii?Q?wUHhwVKAbc/+WmhNUKePE3baHbU6FnXtRJxyLdyDyHyxW2PzWA8Z1+mDr9XI?=
 =?us-ascii?Q?vIFpKZVCJEFvKrpmwPDWQi5SBzZuKmg6iYZMxl/BC83FPuQK7e2iPKzJYlBg?=
 =?us-ascii?Q?ojwqei5lIp0KWQMk4utgDOoCKnSBGDYMSWByWexBxCp5GezOYTtJIuCiKylQ?=
 =?us-ascii?Q?6NIu63Endaoz8FpBw7pcszml+AWM6Z2WG11p4XByNESiwZIT7DbNBC9jHioJ?=
 =?us-ascii?Q?xDGZtDnAW6eEWkMGVENB8cutgwTwxRski8J6TKlkF49EW02SRPVDMT2q83Fh?=
 =?us-ascii?Q?073e42tXbgAsBYZE+I5p7QYcJYZz0irmqhit3SPaS9TEVLyWUW1LAUhZqNk+?=
 =?us-ascii?Q?hXBXhjF2xS/012746TXeK52Iij+4BJoRbD1aVspd1m9M3ZpDcqb4iuODqwiR?=
 =?us-ascii?Q?SMCXvC7dF29U5kLxUt/M9QDx2oM1smEB4n/mDPg0+RI8MqUbOtf2fe1e9INd?=
 =?us-ascii?Q?amrb0tsqZvFIbXaoaYOlVSgelR5nieBImJ4lz1Zc6yQrXqAaIpG/KS1P+KrU?=
 =?us-ascii?Q?JhSubYBu7+NU/o3oSCXHF79TNnVkuNd4/fn3/124uh/N41EAaOEe6S/6QvlA?=
 =?us-ascii?Q?hxG/P6gTIDywFVqGALVizFEhN2oM5iBDC1I61JGxD+7DcNQIq91bLX7VTjse?=
 =?us-ascii?Q?HQmjMyyCKRv4A6kLUyRtIU9u4TPZFtbgcw5ULekCNZBTnADycR+oeKG+nBNI?=
 =?us-ascii?Q?DB20JEs0cw40ArKi48b0lt6K488llVCdb3YZ6Q8DbRb+c916mHZGaYVt5Y23?=
 =?us-ascii?Q?F+M4Q88YyyG2wt3moUy3+eE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d766909-8e2e-4935-7868-08dbf14a325b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 02:15:17.8648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZeXeP46Dsb2zndHD0YGpH3lWKWWYdEXJhy4MW14CWLhGBxEX3M/6ECCAOWsyJC4cCAbsPuw5rMXmY6+bbLAaxph81A9I/TK+aH4C+Y9S8Yt1wdPZkhvpDLtvApDi7o2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10743

Linux Kernel has of_get_next_available_child().
Add more generic of_get_next_status_child() to enable to use same
logic for other status.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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


