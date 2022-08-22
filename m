Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9946959B7B5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Aug 2022 04:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232216AbiHVCeI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Aug 2022 22:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232143AbiHVCeH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Aug 2022 22:34:07 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2106.outbound.protection.outlook.com [40.107.113.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8CFE2251B
        for <linux-renesas-soc@vger.kernel.org>; Sun, 21 Aug 2022 19:34:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDvmOAfkHfNvS3pI10Fd9AdblvKYAYOLuZiabwwdo9ZPVZpCWwlFxPljVVS7Swhq362FyPtctG9cFwTfG5nHqSwqBSd7cBT865bsoSw6I7pKQsa73p3am7AJ/ZUZTa0dfbD1CUl3E90+uxRAdcqx9UORxASPIStRb5I70hjdlKjoGgp9tRTrOOzBbUfrcBH0kMYcq4OaqR+WD3M4VJsBAHBzhIlAwJ0HeYEp2DGWeGtnOaHMXu4AuhZFINN16iGMFbrxZdwXNVa0wZTx+11O9xESFCKUzUeD9mN3XkhHun86psA3+2hGk5W8VA1OZ6Ne4bBBHIscLFJ/Qc4r4X9tOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHxfYFGMBRk+6jV4qX7Pk/oCZnjV35DKjogCmqFh3zc=;
 b=RXGU8xX8Cg7QutHzTQ4dnWQWvunBTOxpJcGeSQ7h2zK5RF2a70ISjONc0kP/w8JPBz/vlMFlRREhIHQNmhFBJPvG/uge1UxQ2941hkBvPGbIfdliYLcemJRjPMPHO7oLsip6HzdEN6ztghsZALp0BZD3el+LyDNnH+tLeEDwERWxaE+tEObNsyerJUvJIgLujbKE78M+N3as9HC2G7Kmpgh2j3v1jXiCfV0eq6FvkGKg3oXoAe1VZpXwo0XW08LmVwPWMm7L8oWsJJSiqi0M+at3CAjKyfjDvGKjFXy7tkNkc6Ekzt4PLvTOnBZQaWEdsY8zL+/zRJ0ffbhps+TEsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHxfYFGMBRk+6jV4qX7Pk/oCZnjV35DKjogCmqFh3zc=;
 b=dY/6BG8EzwWYHyagoqE925I9F9+tVRDDZCks+DFTwnmFsIB8pKul1lhVHFcI18HESgJd86KYtgOhF6jVkEVffIeY9SG3044Fk+cv4g/fhAANO5TpRGEDLV8AY++KofVw/CdrrJrsCyGF52vVGqCFsXn4+VVOo8L5E7Pm+8KVQ5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9271.jpnprd01.prod.outlook.com (2603:1096:604:1cf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Mon, 22 Aug
 2022 02:34:02 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::cf2:7a63:ffc5:5cfb]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::cf2:7a63:ffc5:5cfb%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 02:34:02 +0000
Message-ID: <87edx9gg6f.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] arm64: dts: renesas: r8a77980: Add V3H2 Condor-I boards
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 22 Aug 2022 02:34:02 +0000
X-ClientProxiedBy: TYWPR01CA0050.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0aa2398b-d076-48e0-ff90-08da83e6c678
X-MS-TrafficTypeDiagnostic: OS3PR01MB9271:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3fYsYrp2DijPf+iQpYPVBl6fMBPO4Q0FHcPfJQ7fBsMyFcHQfn2ZG9VKyGew2JlBzjmglvnEfvgAFj0DG67d0jutg+SHe7svUKHYz5Nloasp2x0Bl36m6F8ujGZcnojKxQgJuKTaen6eWDZwRuzlNrvQfVZkYoD8NnfwSJoErNVBzqa4688WCdbDhjAV925/SrVrVZ+tfNhMljGGD4U3XnJQxaDOhUB5rct1U8KHCvYzssTjXiUoveULLqQ0xl+SReblMXVQq0qrcDaBjw4Vr2i9F7SLM9yJiVj0i43ps1BWfU6ELWDG1k9ioAtgWOgxOuyvJ2paz/hjKDgCAeMQ4nZaEWvuY0vaJLnrhw/+Zqjx41fYNvxDLbvLSmTF1NDQ5+7lZS3o3uHm33Ojlzgy+2+cGhK5uAAWLa74LJo8JM3rwviIprve9zRf1Dd9nzJdYAkhatCG33sgghdpo/edVI/aXtPPuChBPZgda+GBndXhdjyws0UVrJG11mz8biu6a0xJeuJu1fkn/US+9mGK+SCkYaPEqvL6MuiQdLsfRpDKKEnOQ98bRlRzcDv0hbjPhq/4/k60yM5ZZShTnCEVPHucSd7ILNBHZ1RA04m8chfWukCeNv2yR98Os7yjLGv2yeyrszJk1wmMjTTaTdtHxfBSokfbTDkhKtGkJUFoTmGX6gqSVRpZVDFYsRsOS3Ihj37iVRvtIq8BRlx0TK098xgg3UoeejA9MeDi9u0sSym8oWLzRvea7TtZgWwJx+Qdb8jbVIGm8EPSCzsPQC+eCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(86362001)(6512007)(26005)(2906002)(6506007)(52116002)(2616005)(107886003)(186003)(38100700002)(38350700002)(41300700001)(5660300002)(8936002)(36756003)(54906003)(478600001)(4326008)(8676002)(66476007)(66946007)(316002)(66556008)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hqgGo8W2qr+cALDAAZGoDnv7XcCowpq9uxJ9CTjqyxFS2pqt2DHmEVNzvb6u?=
 =?us-ascii?Q?5FXh5JD4AiRFltCILyXpnX4JlBfBjjbyy+E2qe7d/GjQFpYPftB+JbfFUBue?=
 =?us-ascii?Q?QuBj3dj9VgZkIue8/lzfLw/JUN/eDkDk8ZwcgS6h54qBH3yZc8xuOduLT/Dy?=
 =?us-ascii?Q?RghCCLN0PJUFiL/F8T+QUcyzt1Ho0ot3kLav9b+vbspE3xMaT8NpFhQOkvnu?=
 =?us-ascii?Q?GcsOPamjA4tN0Jc7rUqlGSEKnZAu82ehErmSWhkeR9mk3FdbZWnFFOCFnI7V?=
 =?us-ascii?Q?o6lwETzoPJtUUEZsh9okDS+zS7MtBFGgrg2y6K8Nt1kR5a9PUxuW3Rrx3Og+?=
 =?us-ascii?Q?xdQYYf8qRzqKI9UWu9fSHYBmn15DRQe2RKkj95HH863+Xq6MQ7QlO6VYsdqQ?=
 =?us-ascii?Q?ZINtzisy+Ir5BRg48prMb6JIulJNycE1ll+SvG69CDUq1kKqd2DqP+hcGsCl?=
 =?us-ascii?Q?fj8Op5jFOj2ZMkqUyUT/kTjBxVgnrwLQZX0H2jEeGj+PsGmNsrbEM/aF1/9a?=
 =?us-ascii?Q?KDZrdx0g+OrXkQ2k57rYpwDiqr7uhfq9H1cjh2l0mnSzVf+z2Ns3cXiUpB5e?=
 =?us-ascii?Q?yzCNTgngIiN648dAb6Rs3sqOWcxAzAmwbbfmIiPlm4JZHXuvAjHTQNkH6OGt?=
 =?us-ascii?Q?y5xrZmoNc9zdRg4v/pRgMLwNFWTx3PIhfpWsLs+lKLAbm3KVTp0Cz7AnsmHs?=
 =?us-ascii?Q?MJsijwk5SPOwNbP3I1au03cnwTrTnG4ZeyS+SY6fUMpEEOjxT5eFEd2hs60L?=
 =?us-ascii?Q?K4EiHFh1CXdpgvy0X973je6ZiSzbSa/ncevcH2Z3hqEa7FmsKOPDVAosxMRr?=
 =?us-ascii?Q?oPiHwRsIWH245JZGVWRjz5ioBrNkbXSCmwRmDqp6vpLAakTDNXf5t84584//?=
 =?us-ascii?Q?kpbA5pUhxmhNbe3j/w22jrrp1oOkVIOtdNQiRdCcF0eIzcH5It8sj9kVmint?=
 =?us-ascii?Q?sxbKkVIXUbq2XMIzL7FHztFYKdAw45OfanaOq3Za89BDOZ32Y1NWpBgwdO/O?=
 =?us-ascii?Q?Hx2z9Fwgpx9ZZENWZhPq8tyL5ToGmqEapAtGg5nXzq/hMr/0Tj4qAfjBcP40?=
 =?us-ascii?Q?ulZAD2zhEAZrQ2FLCLbDUY6hWPkgIzSY4SGTFcr1QqtEp9jka6/+ZpgYjChL?=
 =?us-ascii?Q?C+0Q9CF4sxXQtu/2dT4/uazYjpgGzw+yz8hQnyAQQgUWi49pLaGTH1Bg04SK?=
 =?us-ascii?Q?WGGnmIp9Ty/GzSWx/Qk6WVaTdcyUtJ22YPLjlbrCCHhTQvjZlsOnMztc0O7F?=
 =?us-ascii?Q?16MRwZOn5bs9RFF/t48zGkhhPrcjMRlM4TqFilXJyO+JwCIu5ygBBwDG3Z7z?=
 =?us-ascii?Q?0s51GWJoF7/yDJQADaRxdgd7EGCauyk6G+iruB8RlTpn+hAWy5NTQbNW53p8?=
 =?us-ascii?Q?IeMqk1xpmjO4oVs5VAhZkLxnHbTcoVQEDg2YNv7eEQdLEPflB9jBaE5ZmWfl?=
 =?us-ascii?Q?VrKgg8a/01/H9fMvYQAsw97915I4cQF7EMVoK5UZAyOVxAKKbemDeQZLWAyR?=
 =?us-ascii?Q?teNoLlkWqOHS/kGyBWtDuYVlJeqn2YidIaU+oW7wou+TEumGQ39C6+ZonCXc?=
 =?us-ascii?Q?2MIOBaxD8VtUUTE/eSEW9DgSeL4gXlhgu+GkxFf7dq2lWkdsD9jVT5NYhRG3?=
 =?us-ascii?Q?LZJsQm272GvZ9hhvFG7yLHU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa2398b-d076-48e0-ff90-08da83e6c678
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 02:34:02.2975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gHg8nUVJsQ/ppW1lfZII+jGH2mkAMoSBQ1SgvIQGpRHilqn2dpkKDvUzcPrjh7JlBy9L0NNPi4QbkPr7V7M+Wjqpxh3NwsOwZjHQ7mQz+TCeUDmiFp4nDsGJ4dCzL2h0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9271
X-Spam-Status: No, score=0.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds r8a77980A V3H2 (= r8a77980 ES2) Condor-I board basic
support. It is using r8a77980 Condor board setting as-is for now,
but should care ES2.0 specific feature in the future.

Signed-off-by: Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>
Signed-off-by: Valentine Barshak <valentine.barshak@cogentembedded.com>
Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile                |  1 +
 arch/arm64/boot/dts/renesas/r8a77980-es2-condor.dts | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77980-es2-condor.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 7a647860ef35..dd8b937191f3 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -55,6 +55,7 @@ dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb
 dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-v3msk.dtb
 
 dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-condor.dtb
+dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-es2-condor.dtb
 dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-v3hsk.dtb
 
 dtb-$(CONFIG_ARCH_R8A77990) += r8a77990-ebisu.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a77980-es2-condor.dts b/arch/arm64/boot/dts/renesas/r8a77980-es2-condor.dts
new file mode 100644
index 000000000000..30a0d933cff9
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a77980-es2-condor.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Condor-I board on r8a77980A (ES2.0)
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ * Copyright (C) 2018 Cogent Embedded, Inc.
+ */
+
+#include "r8a77980-condor.dts"
+
+/ {
+	model = "Renesas Condor-I board based on r8a77980A (ES2.0)";
+};
-- 
2.25.1

