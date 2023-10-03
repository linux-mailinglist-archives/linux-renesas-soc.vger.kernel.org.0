Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23CC77B5F1B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Oct 2023 04:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbjJCCds (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Oct 2023 22:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbjJCCds (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2023 22:33:48 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A687BD;
        Mon,  2 Oct 2023 19:33:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W80gfgJPL/jn/6SZkXFRFq2KKDJLvy0q1BJFvgXuOaaqz7PpjEzHunDhrilBa1DM4Oft6Mj8STTiOoiWmSUboaUQBPG8xqI/rmxwYf0s2b7oWHPru0MUooCu16OHTUrebWHkMJcik8iXMSlQjtlBWBT0e2bT6mitHL/FKhi5fvMbMd/6q6n+/9zVwopPudTWqSy96h4Zxi4t+qngY2WFa9KfofhY4bIbcl1i1qoKyhud7MSe03tJrNdkMaLeyDcN9X/Njey4PUm1UsRTbXmSB7bpQ1ilu2iff9a//eUU2Ca2NfazQiX2DUJiWi/t2R7j4aMRe05GWbeH8mhBHDjxCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJG1pUTJTEwgL2Gjgk/iKuQ6UQVOnPvX0QVZb9KADPs=;
 b=NuelQRMuCxK0e2lsQOwPG4IzaFHSZLLwu9q4bwRdXNFqGYKc3oLtzxab/7K+apm9D0aq+JhckTMzTtfB67mvmfaGnsmkf1l/EW/MNy/6LVZ/+Y27YzwqG/OLQxuxdBimme7FtEoR3Uy2R8/2z0TYyOuumK2JdgDGRO450njjJi/fR55zSYGfbTBJ/EHxvvEYw+l1s/p+n5RzO8unTu4BEt6ZVea2jMKkXAq5vp+w7q1/5TuIU77o2BMHctZrWHMiAS51xdQw+1m2/QrzKL71jw7NFBMhCmj/YEOURqQN1pGPoL2w/MbFeXeEprHmlfz89LyX1U07/KNAA254domdNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJG1pUTJTEwgL2Gjgk/iKuQ6UQVOnPvX0QVZb9KADPs=;
 b=gKFcu9k6Hmp3f9pxStPyY22wXloDiRj/+bSwGgYnwF/2VRobkHcSKATX9MCQfNAel8CoInd0I5Vjb6DcANv1q5Vh5Nl3DX0jwNDXv0r1K6Kj8KboT1AEVt/pdQBcxGhnLrlFsDKnKoN9tmZC+48MBI+RScclE7ETSLHQLxJy9vM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7781.jpnprd01.prod.outlook.com (2603:1096:400:119::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Tue, 3 Oct
 2023 02:33:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6838.033; Tue, 3 Oct 2023
 02:33:42 +0000
Message-ID: <87r0mcfn95.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 3/4] arm64: dts: renesas: Add Renesas R8A779F4 SoC support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87v8bofna8.wl-kuninori.morimoto.gx@renesas.com>
References: <87v8bofna8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 3 Oct 2023 02:33:42 +0000
X-ClientProxiedBy: TYWPR01CA0037.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: 82220733-f263-4079-f10b-08dbc3b928ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g6n5mtkTbvO9oltKYz/F52M6drs97eib40t9oGF5WCOcSFhSny8crlv2O71GWisD3RDAvOfePBQseqaN+/bd+h63Q3yerJJ7bUoJ81KqjsEYen/Qh5glXQqJI4Hw/7nhcG2PhipL+tVoe5LlRbbSVrgz6vImkAyAQ0ov/vd9kzugZUJanohrxqhEa8vElEPtJ0/YRc4xd3zr7VCIgGjqEFzQyTgr/MQ0fM9rzf/4/R1lYL/nzaRmOzcH/ChLrqaiC5ShZtolOjnjzmko/h/H0S/t4XvqqLFgyYGnHSFXQBKYr1z7eLTmLsULjv0VSCNwyjmEG7WQeQo4J+QlrTZPhgZc61T3zfGIOwi3lYzgup+moHNhATI9nueZVtPjhVA2q8be8f9Hf2Vh/0KBhCv0nUWBRqwSqrbSxI3y40m6hx+talNMKR7Tti8ALVd2gwZYGnv1RQJ907X7J6E7Dy5TGAzJiQuwSWBOGkhPlY207TLyUOAwrA9GfvM1CGOjxw1bNXmKlX18KHU7ZfXTPVCCboOmID7NdMdkrbKSfOf8TM0I5ENcWui+mktRhkyxIHO/tkPNpuSzOBB5h7vR2puiLFxc/VMgcPzOw+y3ldm5P0RNluGETiem0qvt/Qg9gq/n
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(136003)(346002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6506007)(52116002)(6486002)(478600001)(38350700002)(38100700002)(86362001)(4744005)(2906002)(41300700001)(2616005)(83380400001)(6512007)(26005)(36756003)(66556008)(66476007)(5660300002)(6636002)(316002)(66946007)(110136005)(8936002)(8676002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dIPkmop8z/sQfUIQBAATUwJQtWUfmlHi5EnUNb7uqkMucz2b16dltwtFozWw?=
 =?us-ascii?Q?U2I/dQJFnfQFVwhsahnWTrG+2UlGUt0ZtLNNbnwoH7XB1nYuarImTV1gbYev?=
 =?us-ascii?Q?J9UzUfNRNVHPu53fIZ6cptbX8rq+0yVxVb9oj35seqcSuue2ur24wwRHW7bZ?=
 =?us-ascii?Q?fD1sfIMb7aNtX8N2ft3eJZ5HiUUQAdybSiujK9hvueIc8l51gY5npwhO1cxm?=
 =?us-ascii?Q?ViVXRRL/iLXUA7/r3vaGfYUK7M8awuzYEeznQMaVqeJvJsnx7GeJ4/AZeY2d?=
 =?us-ascii?Q?78qip+xEQzzWx7CGBNa42CufFvnwaA4MrbCz2bEEuMLQIEyEwVtq585mz8Bd?=
 =?us-ascii?Q?T7rP8fbbjhAw0l7PqCXFnMDKYdD+HB6/f52LvBvOKaar911SYGl/xdHShVNN?=
 =?us-ascii?Q?mxOtYnlweGDFFre2OaPFh5U508MqUIyH6tah7fDJfqzMCts2KH0ipUge/9IS?=
 =?us-ascii?Q?hwZNceiF0sR2tzk+VAqD0Zy8Ku9Y5i8Mu3QehicWeX+o5DKeBR5bmbx7uVc/?=
 =?us-ascii?Q?+cxUvBy92EAeqXQT1i9jhJbtMBDs1DGH+nKmzTaDh/5jxL5LSBDWSGsLoabg?=
 =?us-ascii?Q?vG3CzNYRIwFRxOa98cxjD4M6s4R1T3VZl27werQ3bjz3jdeVloMerlf8f8zl?=
 =?us-ascii?Q?B7Oj++OKK0Lf2c4TY7oJZm+3ELCq3jUxdhD2aVTGg5Q97+AfoQw5DT4Ar+F9?=
 =?us-ascii?Q?28hvFmK28CzBHImrbv8buBGaeCRul5BUDurnyViPqln6pwCshFNTRBOlp4VK?=
 =?us-ascii?Q?yiY2Pe1HQi0gJgWeRdVGfv5le7q0luJRvWM2GVlXBzc2wQqUizRnsNc2/F/4?=
 =?us-ascii?Q?UdVoViimNyOo29zGf5B76MCHMHpdTRO3yagWzRpDGl/AJs7ltjyEyqmWQxZd?=
 =?us-ascii?Q?9iL/db+RxUk3Mpz0azsQ+jVo0DS518PzA+1IDCE+KbWZOLOHm7o/0xgCfPXi?=
 =?us-ascii?Q?/0bq7ZOL9zNw4FvrR+Rpc/ROrO5HYAex2kVKFfCMqhGAwnBwAj4eCBRsYWyA?=
 =?us-ascii?Q?3o8eOvJnzunHK7Z5OhU9gw1DFh83uxup8uHr+EUlDcK8SXPvRXME9XurKZjf?=
 =?us-ascii?Q?UQ4nX8csomffgfXhRSpK75D87qc4vE13r59hdJFc7IQTx4OubCHWCmugIEc0?=
 =?us-ascii?Q?1UvCvHXM+TZJLB7PUylihReuBOC9oOMz3zN49KTWVkR9xjWo1gmadKRisim3?=
 =?us-ascii?Q?rpMV6FWbhLApnZajubdLUqyu3MmfbepcZRSL2SmqayIb59wfiM+tCantrNYn?=
 =?us-ascii?Q?p8ex6kjpg/FR5EIUnEbZWp6eYf5526kmFC5rmZ9nmjfQgI58lBLaLNmdo8fw?=
 =?us-ascii?Q?ExUvhWt1HBA1VuZH9RRFWfhq+amY9OdYk5+wN9H5MDD7HUTecdR3/3EBZLcL?=
 =?us-ascii?Q?SZ+HZlP/xqVl+/+CB1WEAza4faC8HBGMXvon5GzkSquVQWYnHmwNmSAdl93z?=
 =?us-ascii?Q?nIuhbmKDezvafEYr/1FWwWzdD1tR6wTS7YuA5q6R7CiDGyDXBDA6fLbK6u9x?=
 =?us-ascii?Q?xREbzw7C0laYDm74eUKlf3jo0TciQw5nHIV8dbUrLwwu96MzAy4V0ShTbz79?=
 =?us-ascii?Q?Xy2E9OCAGZ2prKMwFdk1zO5tMiewu4HqLPLxIR9FZuGkR7zecVeruQ3QFZoD?=
 =?us-ascii?Q?uh0wli1hgTNJfvmaoMJiZ3E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82220733-f263-4079-f10b-08dbc3b928ed
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 02:33:42.7125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Omm/7c/anXEoK7OAHuTjIAtOy+/NAOtpNA7HxjppkZnmTNWKqS/QoKuvpP0hMIpm/s5V4HIJGJfSHgcc9nKBQKKOnwtvCgS2kqBj/QYASNZCyX0J9STUl2lA8Djvz5/2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7781
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R8A779F4 is update version of R8A779F0.
This patch adds its support, but is using r8a779f0 dtsi internally.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779f4.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f4.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a779f4.dtsi b/arch/arm64/boot/dts/renesas/r8a779f4.dtsi
new file mode 100644
index 000000000000..ebed41892df3
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
+	compatible = "renesas,r8a779f4", "renesas,r8a779f0";
+};
-- 
2.25.1

