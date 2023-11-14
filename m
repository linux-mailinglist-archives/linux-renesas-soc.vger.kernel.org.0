Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95D407EA738
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Nov 2023 01:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjKNABA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Nov 2023 19:01:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjKNAA7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2023 19:00:59 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2091.outbound.protection.outlook.com [40.107.113.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BC4DD53;
        Mon, 13 Nov 2023 16:00:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlIB2JgX+NrymrIhpbLzIUxz1rSfw6IdHUkjslYXC0rPXRNVabJGxRskvqliiZ+yLT+kZ94wDMhg4kOEyoJpHp7kiRlDHxgNgeebN7qYpsRcieK5H2pqrFB9nfYu/SSFm6AIY2bL2ua7v0527/DlM3x2jL0rsT99+hvpIZchNJMz91EvPJrX8ZVERCj3j6Jbg0v7Bf08/JRXQhcASKiVj+nStg/sJVuMw8nArk/5zxO3WHEHkk/gMtyISXEN2/BwB7MwRHSHL5FZcii9ga76FOvfZMXK6FCyXqDOPTRJM3j5dd/GFeQVLUTJqob7S9HK4iaPpcjEDJIDuHqGlfsqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7/3fZ7ogIVnSz0COzEmm35LZFE3vMCvyxCRSfyMNEM=;
 b=Ep5BZUfNmI61/0LXIHwBtHDIZ/YeTZfz2JlEeQJykr+EIP6ieicyhr/6X4orXOb2ffsINoRycyBYgOl665G93MykW84OaiEJDdB417hXOvKy26e/UAQXAo4Wp1IVAOjro2kKqv8c0L4p4x3wD8yeivLZDadU6QZ7FcFyUJ9uStCSe7B+61Qi+z78KuLWe+9AHZCG6ZUFf0Y+McbEC5lHTr5bhSMVna7puqaJmh4UVWpezjQQh6S97j15aTRzuu5uysfGx+AJzEb3gqXXfYKIznvVEBniNoiRT+XbdHaobZN6JVBRhunr/0Y8PWOUvfffflGP5HKiydyXQZI5dbuGpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7/3fZ7ogIVnSz0COzEmm35LZFE3vMCvyxCRSfyMNEM=;
 b=pZZenv6/dgvdZDu/Mm8Osv+3kp1CdAwdAkf11cBr16KwCyBQBHfABQYM5ljtvQPAh9Cf6e0HtFQgbU5FjGQca5SAPB9V0sEd/nCLRn0+zcaxFXqsVf5WkjXymWb6ctbPrqRTeSqDlwfSKcJkoCKdqRSdNbUlErFLqeE6mbF1QjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com (2603:1096:603:1a::14)
 by TYCPR01MB9273.jpnprd01.prod.outlook.com (2603:1096:400:198::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 00:00:49 +0000
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d]) by OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d%4]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 00:00:49 +0000
Message-ID: <871qcttd8v.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 1/4] of: add __of_device_is_status() and makes more generic status check
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Nov 2023 00:00:49 +0000
X-ClientProxiedBy: TY1PR01CA0194.jpnprd01.prod.outlook.com (2603:1096:403::24)
 To OSAPR01MB2178.jpnprd01.prod.outlook.com (2603:1096:603:1a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSAPR01MB2178:EE_|TYCPR01MB9273:EE_
X-MS-Office365-Filtering-Correlation-Id: e95f9ccb-b609-4e00-d338-08dbe4a4c2c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zzQg63B7tP50+cyvyhL8OvqZx0NuW6F67xUiUTkaXQMiz1k1x2wAYkgP9r4M+6a/1/ySx9muMyJSI9fXfY+YeFNmhS51HKHfdRpJaGb+WGW5ga3qRHrx+n5/EcRRSf4EVH9wXli0S3a1eFtBTmdQYY1J/iI9UE8mAi/p/E0zbNKPN8ZhBzvQL7s7lKFo1qhEKmq0uQHu+8kIq1UeHfDKq50XbnWIqkRRDclqYTsNFrAm9fcDb7mKrbUNbjaVnqw2wHua2pvPHxDZu2ggB6TsnsKoSAWx1NjREOtSctfLuNKOfSAE2oKUgwAvh/vyDIIYp3223ZoT/Zk/axxdU6rCm4DSVGhtMXqSbIFuH/XQDZ547EaycUa+mz8FcX5vMdHSkCr/a18oRzmzVRyUvL55uUf52vcx0WdWZ9ekehF9K0gyi6fTyApHwmIF3XCnw8G5gg3DESXhzP1SvnsW0djPd/xrcwwqSTPnsv3llVzmQOa7xmzJnUL4CQtsTWyq3OkoetVztInxMoRY2C6tceBV/6Nezz1OfbomPZ37TU+1lUlnfC5l83FGGFR2pvp8KWUtOQUq8Ol/xM/JZN7TItb4JZ2owv6UZV6Gan0NgAHc48NHgHoOp7mB/0miX72r3xKRjsUPTUr0CtoVSxfLz+xf5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(366004)(346002)(396003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(26005)(107886003)(6506007)(52116002)(6512007)(2616005)(83380400001)(4326008)(7416002)(41300700001)(8936002)(5660300002)(2906002)(8676002)(6486002)(478600001)(316002)(110136005)(66476007)(66556008)(66946007)(54906003)(36756003)(86362001)(38100700002)(38350700005)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7Vw0dN8DdHccii7ykMYY3krtbshvWV892bCMgHVjAoaAIzs6iYixFect3b4G?=
 =?us-ascii?Q?tsINc6wOz/kA+IWysmbsBtqpZglJsxGMHW5BZLDJa+vHHxQORnPlCYDZLxDk?=
 =?us-ascii?Q?jWbm4WBPmlWRm8VkDTkHA8w19N0gw6OadY+gQRqPuYUAVaJ1RhLNON9QD3s+?=
 =?us-ascii?Q?4uI062Pu7jv67JzxooFx1ax3oCj4x8o3ILaJ+q4IcqCx6mQZL1z27sFLruv+?=
 =?us-ascii?Q?bPiIr0iGlx7EgyBGERLzwKFTYBKm6Fy+7bkIqZfpGCq8/0+OMY6BlZEqWvXi?=
 =?us-ascii?Q?zYmA9zeuTMs0UP4NwGuFKlXZ0S6lhF3muZXKokxu4+yH4q/A//zVrcE5aWta?=
 =?us-ascii?Q?WP2pkH3Mt7nFSw2rFRKyW9sC9MprMeJezM4qcnggErghCyIhA7OPif0oYuQj?=
 =?us-ascii?Q?fLeX2pdWERTzosMaKzgUEa4k7IYAHhYpohHUIIr1G6BafSboHHPoFDix9vLp?=
 =?us-ascii?Q?CYyx7IMjgNA7XsKPuVtkNdvm6u5c3cEmA4rWae7KeaL3k92o3UqjMEhoYyZf?=
 =?us-ascii?Q?lAM8CScfEuziQmCNGlLISyvyoOP35e2YEA7HuWH2JRFSdcpJU8oBUZplFE+O?=
 =?us-ascii?Q?C0xRH0veBHHOA6V0fW8L/AuMVDDhj9SZLndiMchBnhhHmZ9FYTzPmNJCFJpL?=
 =?us-ascii?Q?K3p5ljEg17G8dipnbGi9o/9WObovjs/oiHuPfCCyKPzGvtq6BfxWD+Y/XDis?=
 =?us-ascii?Q?x0jSUFbnFHYhfNO4kU1ut+i5+iblVuyaxuocsJLvdgYxLyN0K2292XwmBJbX?=
 =?us-ascii?Q?MZ81QjX/X3JTj59oJlFj80BaFt9QD28Ohlmlhe9+CpEmaQncGHDQ526WVcnr?=
 =?us-ascii?Q?Ypv2L/Mhv9paVuCJzXfWUtFSZgkig0CZw5EnkRoJOuKQleEO7BTAmRbhUGvF?=
 =?us-ascii?Q?z++vyCFjQsURetakSpbeJwuLJ7+Mw/xEwhoXUmOvRsUGZZVjet9fMt/OyxSX?=
 =?us-ascii?Q?eLaJAA0MJccJlG4SoLnvWfSuUI8IC2DPS0ApoBJ133IA1jX+a6yBy2/XdC8R?=
 =?us-ascii?Q?pK5DyD/qloVtk7cOyF2Z9/1xAysF8cfzByOgvuMm77dHl9HXJzvERMmVawhZ?=
 =?us-ascii?Q?fzS5q5nTProSePVJBgB0ZJsiYDw8B3vYpHr9XY1vTR1cHjgRE5R/p7vN/W93?=
 =?us-ascii?Q?62S80KjaH+heq6+qGu2VTDZaZiEeueP/IHMCuT/ZiW/y2JlXP2/lv3JonqLv?=
 =?us-ascii?Q?bXhOaNGvP31SNWkUzceh0vomlTQxL7GFXWR0/5r8CszWx3l5YsnT3RYOdgqy?=
 =?us-ascii?Q?iwGoBkKBhYrUS/14nQbnoeKxQKBcWunSodQgw17eUvm3E5ZYXJjT5PVmKk1r?=
 =?us-ascii?Q?5kuFFlxxUu0xe/kCOkTikYunYXYxFKQlzmJKI8eXlRgxIlh4+ZaSGqgSbMvF?=
 =?us-ascii?Q?euy4hx7vrGZm6r7869eZMoAvxTidicpwPCJLEggo4b76lIwclVaF/p9jzPgk?=
 =?us-ascii?Q?st1gEzd889wY+6ST1OQCEbRtoj1dcXJpKFzetJCFUAYSvUqGZ4mSyslkEne4?=
 =?us-ascii?Q?t7lXCs/yK/Bw8V7+MEdQVHYUcvi1UrAhgKO71CZU8pw1SV6AbfAdpeoKGLGS?=
 =?us-ascii?Q?owmXkR8ixV/ToXM6QARkF5556dz3x2DLp+FG1TN7lzDD+Rwlj876J0OaCEWJ?=
 =?us-ascii?Q?qpl4YuIiXgJf+MbjbosBVkc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e95f9ccb-b609-4e00-d338-08dbe4a4c2c1
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 00:00:49.7967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9KmGV+jKCOZbYFOlhcxI5yJZGqjY2kXpPJsIxTfCKjW6n7y0v+swBaF9qBguW9RZfuGZ0VKUFRO9Z1pRxT8mBYX3/iwEtI3vSOy5jzWPlxn4lYUBDNm43xSWB+FWnTM
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

Linux Kernel has __of_device_is_available() / __of_device_is_fail(),
these are checking if the status was "okay" / "ok" / "fail" / "fail-".

Add more generic __of_device_is_status() function for these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
---
 drivers/of/base.c | 53 ++++++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 21 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 8d93cb6ea9cd..d67cb650dcd6 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -415,15 +415,8 @@ int of_machine_is_compatible(const char *compat)
 }
 EXPORT_SYMBOL(of_machine_is_compatible);
 
-/**
- *  __of_device_is_available - check if a device is available for use
- *
- *  @device: Node to check for availability, with locks already held
- *
- *  Return: True if the status property is absent or set to "okay" or "ok",
- *  false otherwise
- */
-static bool __of_device_is_available(const struct device_node *device)
+static bool __of_device_is_status(const struct device_node *device,
+				  const char * const*strings, bool default_ret)
 {
 	const char *status;
 	int statlen;
@@ -433,16 +426,41 @@ static bool __of_device_is_available(const struct device_node *device)
 
 	status = __of_get_property(device, "status", &statlen);
 	if (status == NULL)
-		return true;
+		return default_ret;
 
 	if (statlen > 0) {
-		if (!strcmp(status, "okay") || !strcmp(status, "ok"))
-			return true;
+		while (*strings) {
+			unsigned int len = strlen(*strings);
+
+			if ((*strings)[len - 1] == '-') {
+				if (!strncmp(status, *strings, len))
+					return true;
+			} else {
+				if (!strcmp(status, *strings))
+					return true;
+			}
+			strings++;
+		}
 	}
 
 	return false;
 }
 
+/**
+ *  __of_device_is_available - check if a device is available for use
+ *
+ *  @device: Node to check for availability, with locks already held
+ *
+ *  Return: True if the status property is absent or set to "okay" or "ok",
+ *  false otherwise
+ */
+static bool __of_device_is_available(const struct device_node *device)
+{
+	static const char * const ok[] = {"okay", "ok", NULL};
+
+	return __of_device_is_status(device, ok, true);
+}
+
 /**
  *  of_device_is_available - check if a device is available for use
  *
@@ -474,16 +492,9 @@ EXPORT_SYMBOL(of_device_is_available);
  */
 static bool __of_device_is_fail(const struct device_node *device)
 {
-	const char *status;
-
-	if (!device)
-		return false;
-
-	status = __of_get_property(device, "status", NULL);
-	if (status == NULL)
-		return false;
+	static const char * const fail[] = {"fail", "fail-", NULL};
 
-	return !strcmp(status, "fail") || !strncmp(status, "fail-", 5);
+	return __of_device_is_status(device, fail, false);
 }
 
 /**
-- 
2.25.1

