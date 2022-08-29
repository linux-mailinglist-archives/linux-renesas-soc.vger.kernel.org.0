Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85D935A5833
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 01:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbiH2XxO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 19:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbiH2Xw4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 19:52:56 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on20719.outbound.protection.outlook.com [IPv6:2a01:111:f403:7010::719])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B24E8285D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 16:52:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G85p5QkCk3VDYtnqSIeuf4ZICVmzLBhMYWkUhqQOHFpz7gvR9zbBRtG37vKgCSzspj9wUnlUsE30TYp1FivvlrMQSb7h1vQNVulYvMqgULibG1ivP0C0c6ZTXl90J3Z8WlD8UzLFHX7sWJgXVvf35OR98Bezm3gkHvyEvtXFF0Gke0GMJs9fRI7NgXSM/PK5qQnwpgXxL+g9Xapu25wchG0l0TmJxIo5GZ/v68/ILNfE2Yjm1DMcP48CJCP4XLXWalKhX7pGqA2glZPFiJqmq+ZoGAzoncGyQpym4ssv9d0+gbozYQRSBp4Jq+PFVQrUfdMbX5+oHAsNWWR/SW8wKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XE54eS1v6Yi+3cEX5U8ISZ3/WdI/aWlW/jFzoZl4lRE=;
 b=R6EwD+Ps9RgQcT7QbMx5vin4A11b/eip6kTCz2bO91reiuLda02OyxVtvvc2ZS+5nzlR8qd44KnEL2ESi/dNc8xNDstvKLQljDbsIwrAgrGNhWLrWt6jpS9T3qryZ1SQe/H63P5V+imjXvqfpk5LWfAa+DbRIizjzIlhmJns1am4fBkF77y5QURPDAML9Xait1BqgSfiUwoY/lHLue111vinx39+nT5wttivGnG0HG42/knLrQ56GQvwNV0X1ZmKyFNh9426cmv/dD+sHUbkE/dV148+wNtZ1T3FrmxfpL0OfSeiULhCdtZnjV9sXSbsuscZmMA05n9Op/L+nQXk+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XE54eS1v6Yi+3cEX5U8ISZ3/WdI/aWlW/jFzoZl4lRE=;
 b=jrkJWpPccrwQ5p8+pr5XJhRQd7Z2jSsa0GpJWh/KaZyrxp6rAx/CiERgaVaXD8uuU5bLQPkuzUiMmS6wcufFiBbBsijWMDkY2+hyht4l5VTdww3Q/d/Yzs0Ttp6JIeJGQ5WQWdVWonLxhVl3jEZJv2DSXyl2mkfxxzkT9dPasjk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY2PR01MB4218.jpnprd01.prod.outlook.com (2603:1096:404:d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 23:49:52 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 23:49:52 +0000
Message-ID: <87zgfm4nkw.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 2/4] arm64: dts: renesas: add r8a77980a.dtsi
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
In-Reply-To: <8735de626c.wl-kuninori.morimoto.gx@renesas.com>
References: <8735de626c.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 29 Aug 2022 23:49:52 +0000
X-ClientProxiedBy: TYWP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39485235-e480-4bdf-8b73-08da8a192ac9
X-MS-TrafficTypeDiagnostic: TY2PR01MB4218:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SsS6rJMbxVEZzBQa4K6KcgwtCOhccJSyfJ0t+TljcDvJO82x1SDggQfv1MRJj+PavubQ2BqhuzuAztg2VH2g2LNUBAijGB2s3BT2iSlrct9VD0YkMV2NCgvcmkNezyWeO+7f3F8PqKlvJE/xcsQr6xolHZzZ8+bC6UCYUlUK+5vt9/6wQKkYLYJuA8gpw+2lBhugJ4UWzirLjjwLhgYpZs4Myt07NPG/y08yJEhIwDvFaVGBh4cAFOgtNIi2tfTej1/blQ2HFzNvpM9qiSUwI1BusdaPjZvpl2t+kqb7j5yyD6zm/ZVGi/g/PpSI07oPQ9Z0E7/OJKjZEz6GkUnvLrXfuQHUv3vRJNIvbJAxevcuSZu5Ls3xX89EeaU/CqcrpSK7pXOImj1AYgdHMjnNKH6vSRZamqYtmDypl8Sb+KIlhdhS1j3YPpe2TCbPaQNWZMevyKn+rO0NroCtJ6vQEl1vbTUXEbGglr18ItJE7stNSvsqGGoeZ6Sh8Anh+EkSyxZUN8DSwO/2/Vz9Jw20entsITZ4UoLfEUFbBPJh/X4iRv67wvKXQnJYIYvIh2qWDITDMzsF77zCWsiP6V/IRZ1n7gXffDmM4xh2BoO++kKXiNK0erUsGnYvveCU4BzdhOOLTwK24/tVMmHs4yeMyAd33Mqo8J1jOBHFsJhaHmCYuVV/s90K4Kz8MQFXvywW8gO0PzrI+EXkYHtL+7hZPAUTe4EXcQFLD2/CfUmH5A+6JsIPcsQkzXjAZ79ol75QSlEqS89LxDsjH0zA1Wq2xQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(186003)(2616005)(2906002)(54906003)(316002)(66946007)(8676002)(66476007)(66556008)(5660300002)(4326008)(478600001)(6512007)(6506007)(52116002)(26005)(6486002)(41300700001)(8936002)(36756003)(4744005)(38100700002)(38350700002)(107886003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bjaDJrhrq9K+1zkshoHX8zTIP9YWbrDbWMfZ9mVuLsWPMFqhzGKlAnQqSoO9?=
 =?us-ascii?Q?Q+d+xKHOkRoiHhYTZ+lLOlBhqUhDph5FvsZdmXq/obqa7VtgOUJ5hVuMM0a2?=
 =?us-ascii?Q?c1OtI9mJ2Ni2fVf8wIcq5wX2FvduKw3o+jfWCDfzJB3G3qZN9QbeibRpG4tP?=
 =?us-ascii?Q?OGiVHyX1Zu5xHOegjyfLr9LGv4cfm3HZbJ9PVg2HU9JPMstOqLH/7v2BHewA?=
 =?us-ascii?Q?zu1hOGGq4jaIlFLxJLs3YzVMEvWmT1TNhfhgkgeB9iTrtBsks2jDq67x/SUW?=
 =?us-ascii?Q?sPH5p7nX432l1vFCQpuQUA8gDm/ewbiZ0+mqT5mXmaa0uNBI7zxA+M3B5Vmt?=
 =?us-ascii?Q?+KuYs0ArP7sMI66kjoWcxrx8lKFwXbIV+GlXFLMVlCyulveK7LzWMtwaJwnm?=
 =?us-ascii?Q?MtFs/KcnlGVaWOfCxWelgs3p02W0Un4tpQuXQkAqGh2+cwBknB4ZDBQE05ZH?=
 =?us-ascii?Q?fulOgesmrt9zOmVED3ikFdjLD3WAQh43uSi/6E/voU/K2TMPKWXWV5unFgtU?=
 =?us-ascii?Q?3VxrYJWPwwSLMMNpIBfxpCmKYBJ1LPz6lhBkQ6gSwke4Dk0FyQ4VB3hjz9QF?=
 =?us-ascii?Q?KGBJFTk+ExnP/c+k7W6/Ip1GWD4wySScptbcu0B7YEUhAsv+ZXLatSMsTlPI?=
 =?us-ascii?Q?8MQUn4dBy3N+veunQFLzoG5+pTUnyomwzDLJqpxw2n+QRShddMIeTPiEe4lX?=
 =?us-ascii?Q?jzz/lpSgmkrXmTyf1iRthccn2AwoJlEmYbLx6mH3TeQDWdMqKl2yUhhIzkvZ?=
 =?us-ascii?Q?V9mQtB0qm+kjUDFlflQamnrj+y8rNFQwoijKgYdned5WrgH8TgAJrMMPqO9h?=
 =?us-ascii?Q?dzgH5pUDfso/QDdeo875zNoStEYC9R7UsPTSPjG9w6aj057bCeepYvXblXwQ?=
 =?us-ascii?Q?HryV0WRNX9Y/Bfdjere4PBVkXrqzP0O8fFy1tByJDyebIr0sA3XlWzREY4Lq?=
 =?us-ascii?Q?gTY7XS289g0Qk3S/UaRrmRJCb1Z6lts08CHk4ZsmKLRRuW8D59TQB7zs3zbn?=
 =?us-ascii?Q?rqT+u3q07cEhwXHFuZv51Z/MLFP4YDlaodoGv7Q2N0iB9RUW8Tx7Izi9oBA+?=
 =?us-ascii?Q?drwx0U7SZoG4ucYtz8tbQX4HJIivxCdjHuoTlhkfq9Uka9CmB5Mi3hU/V4mn?=
 =?us-ascii?Q?pJJgrbuBwjLDosi6ZiSzZmtcGilLKj5vp7lrz5jCqGTbe/9haJq113/w92fz?=
 =?us-ascii?Q?bqRjCEWlY7mGz7O3JH5HX98ecqH0CDGMbwSO4RxWGmyxtohhEv1NWuWxRlyF?=
 =?us-ascii?Q?KonrmSZUSzbweuij6LLtJoe+a8BZRAqfL7f11EDnunZ28KGrFvzJOIsJRaNA?=
 =?us-ascii?Q?OzWaHID37CQ3nEW/R9dnKNlLGo6/+w8dB/JhDGgyZiTzXsNSGVpSJGz3lMLL?=
 =?us-ascii?Q?nDxcz5qdhHdrM97ynqxVydVFf3t7GDtC0i20J2h6qfEakGL3ZIUMoAQ5Fy++?=
 =?us-ascii?Q?J211kkcFRt0Pp/lNptpztfWrv/c3eqbXFzO3IucnBJTbuk81a2zmhOGiE8UQ?=
 =?us-ascii?Q?2+kQxCv5EVYKczeTSq5KIDJh0CKA+pzkO2EO78DQn9oYUP4ERRArgiHwKFhs?=
 =?us-ascii?Q?o2M+yW2UagNIIQZdZ+hTd0sQJmY1E3qIL7QYqH2cHreOKAaQeN78k60aQAYF?=
 =?us-ascii?Q?wUwwjIHg8JP04VsYDgHf0tw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39485235-e480-4bdf-8b73-08da8a192ac9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 23:49:52.5044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+yFYKil1CL8RC85I4l6MqOEyx8dhaddkpkXXAMXsucMwHOL4fXvJ3ZV5XdiTne7Ozd+WjLbelbe3eUvsM2aGB8GFoI7ZAsuCURJuvXBj4JnwmVKp+gexKxD4AFmQEvZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4218
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch adds r8a77980A V3H2 (= r8a77980 ES2) basic SoC
support. It is using r8a77980 (= V3H) setting as-is for now.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77980a.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77980a.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a77980a.dtsi b/arch/arm64/boot/dts/renesas/r8a77980a.dtsi
new file mode 100644
index 000000000000..25b2d27b6167
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a77980a.dtsi
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0 or MIT)
+/*
+ * Device Tree Source for the R-Car V3H2 (R8A77980A) SoC
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+#include "r8a77980.dtsi"
+
+/ {
+	compatible = "renesas,r8a77980a", "renesas,r8a77980";
+};
-- 
2.25.1

