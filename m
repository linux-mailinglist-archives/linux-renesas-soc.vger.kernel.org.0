Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 616CF59CDD9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Aug 2022 03:28:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239265AbiHWB0s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 21:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239257AbiHWB0r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 21:26:47 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2113.outbound.protection.outlook.com [40.107.113.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 905BD5A165
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 18:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMos+xGiYDgZZpElSgVxEv+PjBnaXyhvft+PKfLH3+sbpioz57cdeUcmgdTCnKXUonHVSKcC9sDCmNPLjmD8KPQ2InZv8t1NpI/klyz62J0rbBWtotHuMZB15BHTGLNj+xWgueWA3jap8Vyp2xt3TzHyRAJoVgKKcQvOdZ1gldu9gK+3zS+hypE1hEy/mmNpS7LvBEMchCw9bsk7FzFE7HHCcenmacfXJq1CQgo5QOAf9NXUGwpNOK+IK1Mwhi0uVciEhD1aHQtW6/YUtvQLxcnPhItuEaukG7chq31dVyBhzG06bxUCIkJisFfhj5BQNkX8LtTLoxTS1rs7K8VsWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuQYVx5El9EqFZVrBE2DqyvzyyiJfYgJYjmRMrYgzBs=;
 b=hRl1s9wpwhXr/TLr3j2WivgbBa0fALF+xEtlT0dQhqpUUQKQyO34ze9rv2HHtscXxvqUV5VTqTtVcu3IGl84Z1JaVM4sFGnmPmrDg3RF12uH+eXrvQEEajdJGw8cahXlzHUfJ/K/aSNhpIFs5LA7oQhXeToaf8sBegeYxvxyw9K9Lqy8JID+xOzRYOwNbzeoflNs0pO3rMd/vrRwcTZXDrhia/GLrneChgsZQP2svfDd/eA4MZtCG91HmwdOA52FSKTWuiRatVGpdHvmzY4QCEMMUfMgTAR8wnR4wZ0RcjkAUG78FkvIKy5fCXEsLLHVEAxWM88AwG7v1ZdIq0iijQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuQYVx5El9EqFZVrBE2DqyvzyyiJfYgJYjmRMrYgzBs=;
 b=iTnCZXI+GHnlnhcuqDbBVRVmEeiurUVsUcXWT2kvVKgGQA25Mu6S0UIlzVujQEkvj/Vg9+lmw4VgObAOdFcec3iNQFHIGL5xIj1QfiO3x7jIRdPz3/bihL7IjWWe1psb4MvCbZQ9E5gCN7BH7BguPJtsNzdUGLX1VZAGVVmfflE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYXPR01MB1598.jpnprd01.prod.outlook.com (2603:1096:403:f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Tue, 23 Aug
 2022 01:26:42 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::3ce3:3cd2:46cf:6052]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::3ce3:3cd2:46cf:6052%2]) with mapi id 15.20.5546.023; Tue, 23 Aug 2022
 01:26:41 +0000
Message-ID: <87v8qj92cu.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/4] arm64: dts: renesas: add r8a77980a.dtsi
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
In-Reply-To: <87y1vf92do.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1vf92do.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 23 Aug 2022 01:26:41 +0000
X-ClientProxiedBy: TYCPR01CA0114.jpnprd01.prod.outlook.com
 (2603:1096:405:4::30) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a924a3b0-cd7f-4597-d56b-08da84a6888a
X-MS-TrafficTypeDiagnostic: TYXPR01MB1598:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZzpyoCwap09lRNcjm7mX9BWa3+kGEe8mJvbqRIyV90R0OIOmt//zwutl586TabZobNRR9UiremVmLAhc2IicZZxOqxEmwkcr3ao+SJwSTsdamywob3DF9dPNz9WTvNexYd2zdz/MAy+Vflh/nb1YUCP0HNG1+4fFSW8NjhOaqEkGrSLYrIXHcNULFnYd6ri78CKgLlRNPRUzLQn62vagw6ERIaL7z8wWj2l0Jss3w4k8inVD84jZRbfgVG+q8txEkvxi3QmaGaeIYoQasWsBMm4YMd3wOQ0frYNdUd9waJoniQnaKJm8n7MCv4n3Ot2LtVVExxUdtv8PGfJdigHL+WGeeUTuuMmmp/BootxWuo6Oypxb9YehvIG8QHD/hfd1MZ83FkQYw5l2qy7m3flFs8LUzfFtZiuQueDYPVBrLqPyvQPGGgC0AyTBHZM4XIrz6S/jG9b3qLPdgTWV90WVnez24IcIlh5pMeC8CV80KCCx77B06ptzutiecgXSFL1cLhTZ+Z8PtoE5zoSCPZ9BLoOyzC9S/CrDGbre9Vnn5KmVnng7iBnlQg0+8vFOnbAvW9ifmjI4BdPP8JF+wmeE7ozUhmhEP/M/VlbrOf1ucH/PPaZeq43+7j8/jXuEn1bfuF1v/4q+jY5+V9Yk/abxxRHN/BRkIYvrcJGEY11HF+NOuK2q+H8f5z+ExidR2i18HgnRXDM0qfV97FEsC/qlUGlEQyJFttJsx7y8h01BMylkNpkl2G/yo6dJ5KMK0G2E3kGYh76DqHk7mfZerLvSvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(6506007)(6486002)(41300700001)(478600001)(107886003)(186003)(6512007)(26005)(2616005)(52116002)(5660300002)(2906002)(4744005)(316002)(8936002)(54906003)(66476007)(86362001)(66556008)(4326008)(8676002)(66946007)(38100700002)(38350700002)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VTC/ITRKiIhh04ogj8fQAODPUJbuH3l2UCJtmhdRVkfaen5EYTlM7NGePELq?=
 =?us-ascii?Q?o9lbR+ic+FTWaB2MTZEZfbtsHkrfLYCnuqWeP7LJ0Me3c/AcdCF05jOT6QCk?=
 =?us-ascii?Q?AHtTk9m3UFTfh6lcVtS1J7i3lu4RUkgk+ck1JobAgFh7RCf55NVa1rFDmjdD?=
 =?us-ascii?Q?KN7eTndjtgz7a4pmMsYmYuwW5g14D5JC4JpuSkMXdAEeAvYdXS40sYSso3t+?=
 =?us-ascii?Q?AUJeT3qLknizk87Q4TrvJ+b12ViiDRzeqoq4ZN+5EYJuRJd7c9IymF+Ch2PG?=
 =?us-ascii?Q?fQEViiwktanfJMq//k8Wpz75ZOH1DIvJoOCMOnJx4W+ZYCGauH5Il8tHDoIU?=
 =?us-ascii?Q?G0RFB1jesEg+kfUNWlOvkT1XEiUADn0pHFBY8csE3JcaaWLElbwWOl+UakSS?=
 =?us-ascii?Q?VKiGDVGx9WlRuaiq9GrBmjd+uT/mxu/d+RmXJw4/qHQdBeaGBC5zHcjTliKn?=
 =?us-ascii?Q?fMRRZ6wMLUlEo3fK5x7hWukOsyFpX2ZJd3EDgwREXOSYIaU8oMtpyluuLaBa?=
 =?us-ascii?Q?Z7eWAWpZao6MNMr0BBrwJL4uHTDdUGMLupe6DHAfFy2mSAOQ90WqUeBTRrOp?=
 =?us-ascii?Q?djSJjYBiXkpgcXHjlxPW0H5TU3vuRH3fqjaCBP+WfFqrhEFZLkmQsFpfJdrW?=
 =?us-ascii?Q?TXpWL5DwMdFX0wYZOkV2IBwtp19vyjxPyvfc3y6i2Zt4y6KhiaBQa1rXu7Sq?=
 =?us-ascii?Q?sqTZAYQqlZHP5Uqw4NTv2yy+ahzVOsJ6P1dKSKq9z5v67EUPg4zBl5rxa9be?=
 =?us-ascii?Q?yMyGgNVmId6mUKDFqf1hShqqBTHLifMqTQBmldrF1Gts+5MA31vudFabU3sp?=
 =?us-ascii?Q?+ikjPSo6bZ7Qyfobr8M6cg3Z0/S5u1Fyky0XeIkk4gu3oRuGZA4CsFcAvKCD?=
 =?us-ascii?Q?JN4DwXLlInjdmEhZADGM3+MWv92Wtv2kbiYRIuH3pMBEWip4N46pkpZDey5U?=
 =?us-ascii?Q?MqiauYZpOY5r4xf6LpJ7kPS1iN5MAF9k9zDysW5bIeTD3ck7eM9fF4Zv1f+7?=
 =?us-ascii?Q?GTT7Y9gooYqOwGA8CZ7UnIrIZfvia36o+hIdDn/k+/r0vU8V+h8YGUFrKAfO?=
 =?us-ascii?Q?TPd3r9Hsf38okKF1dgslzRfqlPFxcGEscYVsVxxIyvTVVHSIJHgbYAA+YPKZ?=
 =?us-ascii?Q?JqI8jNj6EhxYpdDGZ6HdMl5JsYmKZ00ojVmMLF1YVgSwUvQVhnocdO5culEc?=
 =?us-ascii?Q?mIjmvUeCW6rMDpzAuoZMW48FngDxKbbw7G18TSytqPlMnUb7cWXWl3oZe+sv?=
 =?us-ascii?Q?cA3ffLxQU5mCgLMgkC+y2qvMv71WvJ021QThVqrCHiFI+IUkCAqIqORWsEE7?=
 =?us-ascii?Q?ce19bY5mw5zFeAh8zxvCHRlRLIqrsalVfpdUcj1IoSReBI92BPi9VZ+nnr8I?=
 =?us-ascii?Q?emq1h8lI822745aExYDu1Ou/TnktuhQmMel2EG1JK0Guekjb8jHW4JK6fkPS?=
 =?us-ascii?Q?KyHWkNL9ssWwmahvjxQV6Vv8hjbsr+j0IgrM2WoDswlJDY5YaQ1wdxcR3OlS?=
 =?us-ascii?Q?QWwjZvAgNc8xmf+NqPw7/UMPqXNPNTru5ElnbtV5LPutLSeL583BI+ZOYhBV?=
 =?us-ascii?Q?w+Q3G9WVJWM/tCRvuoncLd2TdYmtNzhgnh0NjVfaAbqBUIm9gMiSGLeXo3en?=
 =?us-ascii?Q?hOPpLppygxP+hCpVZYbM8JQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a924a3b0-cd7f-4597-d56b-08da84a6888a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 01:26:41.8323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uf5AkHb9r5dIs25+mNVU2EyJ1x0hzc1KEMUz3WKA2TUtxM3S4N/IOtgRPYF80pspU4qyUKfcYIERsKcvmo4EdwWg3JydK7cqA1Xb7N2ZspU7Kdw/iHtIoziiV/r1eWLq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1598
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

This patch adds r8a77980A V3H2 (= r8a77980 ES2) basic SoC
support. It is using r8a77980 (= V3H) setting as-is for now.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77980a.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77980a.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a77980a.dtsi b/arch/arm64/boot/dts/renesas/r8a77980a.dtsi
new file mode 100644
index 000000000000..ba49f50b964c
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a77980a.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the R-Car V3H2 (R8A77980A) SoC
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+#include "r8a77980.dtsi"
-- 
2.25.1

