Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5B347AE49A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Sep 2023 06:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233467AbjIZEhi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Sep 2023 00:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbjIZEhh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2023 00:37:37 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2092.outbound.protection.outlook.com [40.107.113.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFEB397
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 21:37:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkw8cDmZB3rtNKTBWpFkUKgbQeX27kT+kXcxB+lGv+q2UcFHtJ1Wyn9nDUMgFBnd4Z5C0hMaRlLdEAafFiszeVNSvZ9daNzn88pn8ZqYP4b5TYBr6zTcHk4dtKwbMxN26zhZXQBuDU+rnF6yOZehcuzKYhQKlo7QHNMcZlB89GSPoFFJjZDzIZd4gmE5LnHnc+7/OO4Zx679i48UcqdS6fYmWSY6xt9iUJZcRbwIhHn8I/tDpFTfO/oMzRn4d+mN/Ilc5sO9vSLb7k4O8qPt21B90zUkHQz+T2ZYDCxtOk4VYUtQwEgM/u6SvC5Lb2w2jH8mxksJ0ajuAZSxZe4Aug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKIY9N51peZz0q05RVcTCaChq6zE4rysJFt1kxtzCts=;
 b=EQIG6s5v3EulhgBpLZb6dVLjon4ZgMMEWSngdRX+fWhH5d48YP110KpaBQwvfQwRLWTZExsgEAdNM6C+3Edlfow3wJdf29HtAkyMF0H2hehQp6U5GDJcqh7vGSUCrQvEeY6XZsJbPyrqpReA3VB007ugt3+lbfYnOUv1sASlpHleefVcbLbKjm7m9n3IAOhfCNpA8IX28hxwY+T1fJkE9NT78SOnwJ8jjxM9JAMlde13dxTqjSmMwzkqMmk6H/lmIL9TiUQXPLUnA5iOqEhOo0Mx7F2UYDZJsK/ckibkUQzfsB4cs3rA9HHy3SXH8Q8SldMb7x9w/1sd/OHHZ4mmWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKIY9N51peZz0q05RVcTCaChq6zE4rysJFt1kxtzCts=;
 b=Kw7kK0Y35eQIemaXwTBmpFA5ize0+2ZXE0JncKCsqZNCy7E8JJ0os3MTzYu626Zp5gIcbucapVUI1/GxZscoUS8ziEw9NvNVbjkEW1uyrjbYKlcdrbPLPxPZAPFvH+MKac3k15Q9M1oIKVGx3kQvCTCKVAbdsOZNwAfL5OEnpzk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11159.jpnprd01.prod.outlook.com (2603:1096:400:3bd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 04:37:27 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 04:37:27 +0000
Message-ID: <87lectim7t.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/4] arm64: dts: renesas: Add Renesas R8A779F4 SoC support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
In-Reply-To: <87pm25im9q.wl-kuninori.morimoto.gx@renesas.com>
References: <87pm25im9q.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 26 Sep 2023 04:37:27 +0000
X-ClientProxiedBy: TYAPR01CA0186.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11159:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e473e8-d4e1-4893-b2ea-08dbbe4a497a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2kO7WDQai1cLBUKNcxVGeYkbnWe5s1IXUV/jtf6um/Q34Djb1yq/4kHsqfYLsYrDQr73J5D+8a6efy9LEdoCkXsMncVoZaYPd31idGCcQXajf8TFX1bjEDmmVJSsJCYeLsdAngny/LcGBmDa6C+Pntre+uvEqMkN1sFZbuWsiwcOeFakt4G2NOmrEM0WfRh5aQzphdXuwgBa/10ovMT8ht8Db2YmdWJeD3K8dbEIkbgfyJAa1U84iPP+lvBkXaPuo83UOfjdmJmv0MGgBB3JmsXkynbH3+vF+K1qUbLOmc7bkHu62fsuawMNROUyx0RW209KjkaxrZ1Ot0RAybf9gSep5z1otHKG7OLNVzmSnrqZFs0o2MTS9lZMwqq2srt+9P56d6Fmy/NGAndByhriJ4MksoHggYFK5UjmpS9H5SVhCZ0jgKCEGq17V9UjlqkJ63rVoAyZ+73vIx5k4wZTfkKn1dViu437l1vb6gLEzCU5d6EZ/IRxnr+OTyLn2Gi4atxn9Jj4DNhRido5F6GQHwpfADnt3Y1SgRqjOXOQlKhab3qM1+U7LUpfXdY0VnqSXyF7jci5xPLQ8w65TvcEBqjPTBub413wwZMUlJM4+h4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(136003)(396003)(346002)(230922051799003)(1800799009)(186009)(451199024)(2906002)(86362001)(6486002)(36756003)(26005)(107886003)(83380400001)(38350700002)(38100700002)(6512007)(6506007)(52116002)(2616005)(478600001)(8936002)(41300700001)(8676002)(4326008)(316002)(5660300002)(66946007)(4744005)(66556008)(54906003)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7X0Au/Ruup2SRtUO+wM7yMwMlzqId+hUhUQr85Skrt/MYgxzXDbBeMNiDf9y?=
 =?us-ascii?Q?T1q0mgLsYrHVxgKoJ2hbSheiWfgI4j6E+he1otntpIymAo6tHhNJufRUgtGe?=
 =?us-ascii?Q?W7VDKgXYlcnkxuB41VNyM+4GnPq6A6AC2NpjVI+LpOMVt4N7+BEYmtGQKNET?=
 =?us-ascii?Q?F3nyMymwGEMPFUIZ3NnH2s9VUuQCkXtxP6h2ukSaRYtVAlIzCOl6LsgKLYT9?=
 =?us-ascii?Q?zNavCG1QjBEtoNzFLJuQNX3jXXHkblgRynv7b6y60oO3stV/3DKEri2bWEfp?=
 =?us-ascii?Q?Y6SIa0I6bDtuEnCm4WQYHqqK8grI/vTiYAMYgQ1FrhZpi/QyOEHpY621yAt1?=
 =?us-ascii?Q?BJDudV0x1AtGfvbMxKarMjJRyveEY1p3Qh0QTAhFjXm0sgPSmem7/JzwVvTq?=
 =?us-ascii?Q?Ey1vm6EksvmY2LyQqBUNyTTwjj9KMVzLoq3g87ciZ8NR8xAf4vwiU1PiVR9p?=
 =?us-ascii?Q?DZxKlrQEWWV2VZ8dl2HvBv6dSojD8Rkxv/kuvK9ooshPMOUVDDJKX85jLHou?=
 =?us-ascii?Q?MhXy3Y1ipe1byaQSc772v24RVTnSxYCLdmFBNIJsn/2em+xskbCFjJyOZxdh?=
 =?us-ascii?Q?mvsNiMkdUJUekHH9UqrxtO3+QFIro+Xu5QJABh873NbIcy66LpaVJz7z9uM3?=
 =?us-ascii?Q?yGswLHwEHiIb80t64CQj742qvB4AhS2gigs612kymRS0+Z5vvd53AKBcmfUR?=
 =?us-ascii?Q?/t6bi/MkxfqBQJlURJS8yYPfC5r4ZN2yjTG2eHDFVXQOH85rndDMUIQ1cc3M?=
 =?us-ascii?Q?7UqJmtlOqSoBSdYoGn+g3zM5Wn+tLbETCaXHTLUFZ6jdP97ZigZKz+ZYzWbO?=
 =?us-ascii?Q?/M1YecsD21zvhz2//FAv/NQorUavTFAXSD1ifwriQNEqmAbxZe4cblPtCJNM?=
 =?us-ascii?Q?z3kZYrRLYCcZ2Mzj5ZX2wsua0fXrJGlM4LdHfyCgc+MGTqEd65Tj2czS4GvZ?=
 =?us-ascii?Q?PmL6lpgnSY2/Fns3mLgJyhjQIftyoAgumwE99GAT4NiziSrfhXEe/HPJdRn2?=
 =?us-ascii?Q?YEincX2yhmB7+VRho3oL+expX2yVRJmg2SLRd13gbHnjN2A8qHahk8bZNA4O?=
 =?us-ascii?Q?1MnHnVk07+9LK7syvDfSLN3rJcCPAEK/F+Oslj2cvV6NBIlfiC2ICyRzzzuu?=
 =?us-ascii?Q?F1inAD20W9Y7lOe+8Uc3WqgKhL2zkBlTCyn1ex1edQUvlOKNH/yCx/qFy7ee?=
 =?us-ascii?Q?a4KVSZw3fjIwfFn4KxzXis77H9LOW5GIpZEpgoaktCVv+EN7EafF9EFpMEWi?=
 =?us-ascii?Q?1p1lD9rN3sYNSMl+tTGZt1XLmGY874RgukBOsJ1oTD6+LCKv2tTb1Cp0wDpM?=
 =?us-ascii?Q?KxqskvhOwfYBq7cZxIerjCxFeM1Jg24bPWaqoEhWt5YfWzb23ASWkko2jhyZ?=
 =?us-ascii?Q?UH6SEJ2SShpsuvhnbRYaYQnTtRQ/6ZDxmMw09g62SQ+/2WTuS7O1tCxy3rBA?=
 =?us-ascii?Q?nEsSl9orIDYer+5xnq8OONoVSBzPOe1m5H3O+EGda8T1LJxrPGmQDKSPwJyw?=
 =?us-ascii?Q?6anYsz6dkToYji1bhKVL8KZlxsrTwALH1odo5BkGtZYWeikHMIMe4yfXpm4s?=
 =?us-ascii?Q?qin+tYeD3aps7x8VUNL8qQfXSAFdxT6wyJUcxeKkei/ElFXAcNpcchWHjVt9?=
 =?us-ascii?Q?KV++teq8vOvv8K6m+vd+yrI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e473e8-d4e1-4893-b2ea-08dbbe4a497a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 04:37:27.4515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6g7umpXgJeLQN8r0rWuiWO3LRcf0rUAFnUNHRuurs58oon11vtV3RXeyxsjpVJneYyER3Is8gZk/zV29mK2CRfaV06Ycx/TMZG1CZXHYP/BIRs9TfOuiQr8z51J5TaO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11159
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R8A779F4 is update version of R8A779F0.
This patch adds its support, but is using r8a7799f0 dtsi internally.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779f4.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f4.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a779f4.dtsi b/arch/arm64/boot/dts/renesas/r8a779f4.dtsi
new file mode 100644
index 000000000000..f9a31bd891c7
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779f4.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Device Tree Source for the R-Car S4-8 (R8A779F4) SoC
+ *
+ * Copyright (C) 2023 Renesas Electronics Corp.
+ */
+
+#include "r8a779f0.dtsi"
+
+/ {
+	compatible = "renesas,r8a77f4", "renesas,r8a779f0";
+};
-- 
2.25.1

