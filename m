Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 178E45A5834
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 01:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbiH2Xx2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 19:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbiH2XxK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 19:53:10 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2118.outbound.protection.outlook.com [40.107.114.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C788305F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 16:52:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6AfsGnCyzC57Dc57NRCntZnks2d6qNjKQuyZ1cdy/j7DiIdYLOKp4gFye1GRqgsI+Un5oyWNZig30grUIdYYOKOvTmEcN0AEazyowOQGc67PkdYK2KrW2jSAC5e+WalR098QBR4BsY/NApkBe0ieTHUiTPKO5GHv/vaA8FEWDNYoQM/jolDWtGmBntov4x1fReryle25dWnkivm6/4TGDXhXMa1sN+gP81A5Pd/MITBx1/CbZxDWpJWTgl7DDhBiAqXnmHNdthgG7uf3h2uGLYTgfCCDvH7YFBRM5ZD6LIsx8u2eVmkB/nmLteJb5+o6IHbHOCOI/FZ9LUZkRT8Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSA33EIi7G7YCCyofLCiP/yCsuZtXs2+dIeGHN6u7kg=;
 b=IPWEsGR2v27J2ssSzpW/RdAkbPAPb/AHr8N+bnVNzC4efUfp36Idw5djokK7o5ZVHrUVvVEqdKILzhf10SVjHUfm0AliiTQsg0ewkXoFQ/hYMH0utK5422Z9zTMJNOthA/WCM85oER6Owf17aedLLMNZPIl2FUoKWkh+gHZYSYPhH09rJa9xO+KQDg5+pBfXIHJMCEOGocdjShRBfmpZOX0SFXOZLaeCqabyw2WO47xGTKon3FIVttyc1lQm4gAcmLe8O1Xpm6c5nTNPzho+4l3LXaOzfIruxMquxqIp0se+Dsx0dLaNhD0xnBFSa6tSzDNaPAnSYbiX1QhOGDRXhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSA33EIi7G7YCCyofLCiP/yCsuZtXs2+dIeGHN6u7kg=;
 b=aBdaBLFh9fEF4SERZpeMKuta3p4AxYrHyYa10cumLelSEvuM2YKcqjlYbzwvRVbCDDHW0HfZR8u0141sJLXxi6KPUpikVqqGevas81mXVHmmZLCABxAh4Re9I15ZJP9gohFf7/jU13TFNYTX4iikV1q74HHCWFAb6oXle78H1Kk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY2PR01MB4218.jpnprd01.prod.outlook.com (2603:1096:404:d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 23:50:00 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 23:50:00 +0000
Message-ID: <87y1v64nko.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 3/4] arm64: dts: renesas: Add V3H2 Condor-I board support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
In-Reply-To: <8735de626c.wl-kuninori.morimoto.gx@renesas.com>
References: <8735de626c.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 29 Aug 2022 23:49:59 +0000
X-ClientProxiedBy: TYWPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b20cf410-75f3-4d2d-b4c2-08da8a192f5c
X-MS-TrafficTypeDiagnostic: TY2PR01MB4218:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ejx/KfGiHPYcp+vRLHYjl2BR180RMz56R+ApFqI7raLFMUVBg1nnxhfJAZlejyDiB8XrJSi2p0uU/Oan8ZRek3Z6/FUHzIHMAYTxIKchD5ThCH7Wc6vBhMvR7GYey30sN8kST//15lqNXnqUaB+D8h0e2yX9XPHg0wpIebJnT1841/NOEK84SYhU5J+Gx5Z351w4SEjESprnO9PTUv0tAKPoDsvKgxUaMJn7georQi81oPlRrbNvMYxYSEMLCKvHRToXqQDccG8WonCKoWzQvdWpV9mYWe1vXMZtRO/6jFH/RiwKdt4RyyLde2hEC4Rso00oFI/TN5AtLeIzPj3JBpHjNNAZnBUSCVBa0xTHE/r2gFt1Jco8QXPv3yJBSXe1M4wZc3w75yL+zN3qWkyew1Ha7lJ+kEVX4wQj4hMsNOMIQkDx6tr+w+wlD3h3gZBP3sIMgpd2vsaerWWBNAjOhngZihMntf7kdOUJDSTUx8JqaIIktV67BZMfsJHEB9ajyRWxIVHh1Do/p2XSk+XPOAcZ5PZUfoMinkiElOi53HQtDoeGoO/EHG4Vt1XMCEp8qnqhCpsU+DyUArAhDXaU3m9u39HpKCZbayUSul92AVcBcbCG8CkOWt3yThsm7xxax7DjtGVgyfnsShUg0Ra/GjUgKtJCtgo7YEYBJFWYdT2jX/Zz+Or+Lhz2wFVGxGNnK42kb67Z2N4kLyW1BDK+6ZRWyxy79PZ1rpXJYNw2aiOalJsXQbDF3igAiyPsyHLBdXW3oe1viRwT/qAxi4NU6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(186003)(2616005)(2906002)(54906003)(316002)(66946007)(8676002)(66476007)(66556008)(5660300002)(4326008)(478600001)(6512007)(6506007)(52116002)(26005)(6486002)(41300700001)(8936002)(36756003)(38100700002)(38350700002)(107886003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wSJhA3VPKLMIf7wbGRbQpo9ajtdunwCbnFwcA+e9IDfxMOjnDTftrUA0dAxn?=
 =?us-ascii?Q?8Fjhoso7uMIkch/W784M9DL/J94ykNi1Xe9PkoqNQ2brWQs3RwQAUuuE7kUG?=
 =?us-ascii?Q?0yPtqMYWx8d1y6yq+fSEGldXE1hhoiwj8DRX2CGH+zjqMTCbq82J4yo8KMcY?=
 =?us-ascii?Q?MtPC1vVkNJGgBCbDHgI03zxywCckMbmfaDmtdl0/CrX/WMYj55Id8rLE/7iD?=
 =?us-ascii?Q?ecQoMOmbIRySHHFwcRZVH5jX+dfLIzlixYt0krm9hnnQ2JgOJoqO6S4kHPEJ?=
 =?us-ascii?Q?8Y7eKDKhrTkxG/RnqrligjnSZ/NHOV50NUe1VB3kuNHATn2IsmKMvgyGtXqz?=
 =?us-ascii?Q?XcvspziQ6MjmpiiKgG1V4ZyQdS+mDxppwmUFLoGRO95SMMTUHkUzDxaVqXvi?=
 =?us-ascii?Q?rZjlhm53i4mYp/pUC4+zC3M/im3MnlwZLas76SxuIPPS16CFahW/LlISbbnO?=
 =?us-ascii?Q?P5uEyoJEj8fk2GdlqTKG/qtWrUo7wE7ES3k1ycOAyGLIbTNiaJDhiWWi2mV9?=
 =?us-ascii?Q?Povn03uD3hDC0TY4emY28KvC7Sel03i9XAw1RshkHx52s5n9qSHhyjZq/SaZ?=
 =?us-ascii?Q?FMg7t0OHq7d53WcKPtsliEQEQp7AIoZr+CTbLKQYzqUKzAb56DKbCuxSG63I?=
 =?us-ascii?Q?GeyXjTD3ZRw76yB7Xgmlpa30eo1vTsnD/ziJ48BcuLD4WEEdbt8rZsbihTdz?=
 =?us-ascii?Q?/7pcKrl0hPtuesutukJa9Ymk8kSw5G9N4IxMw7FoV8rlkF7gIbtkgb8BoP5J?=
 =?us-ascii?Q?AmTP0VSaNyPHOE69kBeUDIDsMB9HmIB3whSFHM74bpzUxl4+HN7Fai9POG/F?=
 =?us-ascii?Q?KyyjtsnvxkapGJgR8O/Y8komS5aO+USG6C2tb9yZY3HIsgcpsqmycebFJyLc?=
 =?us-ascii?Q?uCXRC+2zR4vBmnMgXAwTmTH5iARWGqW03cnQ55vUAE9flRMQ+xHkJJOPg8DO?=
 =?us-ascii?Q?ZPf0cfPQOiDRRaB/l4meZFEEIg31TnW7dWqiRuo9ww45nc8TMh4s9UuRSQFj?=
 =?us-ascii?Q?KXLNPiJ0S5lt5879aklXEtA9FsUrp2UDCb415G+TPgEMpdPSAJclOqxgJPUc?=
 =?us-ascii?Q?exjP6CUsvTFbL6FSavymU4RpOThoCtoo45gWcpyPthKgBDbgHiMGhmiRGtGF?=
 =?us-ascii?Q?z3JPeFMBAMjOSEAEMz42JWfqN3Lrf5EsPptuIwJ2rQ7ucw23Mw6J849EgbUs?=
 =?us-ascii?Q?wCr+9+pgfvEp/yvob/xLD9f+3e3AabuuTZXMdU9gGEmXl+4EtaCR+IRitxJC?=
 =?us-ascii?Q?k12sppLzsp/ZbGGn3ozPRpzO+hH0vVgg/8YyCVo6MF8TFtnBpP+7jtY4bKyL?=
 =?us-ascii?Q?3z85x3gdRtSCk+eFSVqmuVBy/jSGao0WUxQHRa/8/egrdJD3RfPI96+urztl?=
 =?us-ascii?Q?KQRoe7oZQgFmUpMEzDw+P7q6bNDqgrc+PF2DEyoKO21NvjS9IXgpf6RPKFKt?=
 =?us-ascii?Q?XxhnNSCzPsHNqamxg7yy0xqgOVJgcIliuyZ8QcAavwdJLb2TYM/0OtwGnmpB?=
 =?us-ascii?Q?GR7aXIC0gtoA5b/V7+L0/1Ie/7YUMFuSJrScDcQRDFobo1z6TFb1fnpTw1QG?=
 =?us-ascii?Q?nwaFajqTOf3krH8zToPRo97vweSFANpUsP9JylcWVQfk+4jPMIS0JXYgJX2k?=
 =?us-ascii?Q?SzX670CjqWQs9f+bhY9zGEE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b20cf410-75f3-4d2d-b4c2-08da8a192f5c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 23:50:00.0704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSpGBKwYB0MoEY4N1NpN+B/UePZ/oYVupva3nnm0P6IfuHPwwQlwIsNk2JReOTYkDGFeK7OwlrjMe9GPZ7Rd4G41nHWp3dXIkx10zlw4mWHGmAV7mYMH0kncoUPWojYg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4218
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch adds r8a77980A V3H2 (= r8a77980 ES2) Condor-I board
basic support.

Signed-off-by: Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>
Signed-off-by: Valentine Barshak <valentine.barshak@cogentembedded.com>
Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile              |  1 +
 .../arm64/boot/dts/renesas/r8a77980a-condor-i.dts | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 7a647860ef35..0699b51c1247 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -56,6 +56,7 @@ dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-v3msk.dtb
 
 dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-condor.dtb
 dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-v3hsk.dtb
+dtb-$(CONFIG_ARCH_R8A77980) += r8a77980a-condor-i.dtb
 
 dtb-$(CONFIG_ARCH_R8A77990) += r8a77990-ebisu.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dts b/arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dts
new file mode 100644
index 000000000000..9f488dea0f34
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Condor-I board on r8a77980A (ES2.0)
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a77980a.dtsi"
+#include "condor-common.dtsi"
+
+/ {
+	model = "Renesas Condor-I board based on r8a77980A (ES2.0)";
+	compatible = "renesas,condor-i", "renesas,r8a77980a", "renesas,r8a77980";
+};
-- 
2.25.1

