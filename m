Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BFE47B4B42
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Oct 2023 07:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235449AbjJBF4P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Oct 2023 01:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjJBF4P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2023 01:56:15 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2116.outbound.protection.outlook.com [40.107.113.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCE8FAD
        for <linux-renesas-soc@vger.kernel.org>; Sun,  1 Oct 2023 22:56:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IW/G/CWrMALc4fsAMQUzl99fhgimy7lEOX1Yhmsa2lznvjEt8bX9wpxJ3biW86ZthBOZqNCr1yS2ITjR7TFWM32TM3wGIf1uwM+f8F8LJCYfoGui/8L46t7Qr6SJMgyuqeGUe02lKne5ZFXOOGBJIW4ai5JtHPDlWApj8eDFSj8djS5H3OzWdvLjAUt5ZPkPbaesm2GUUWSiGruYXxsT+Gc6EQSs1jSqPi4Kv6l2/ghANCpqv4ufdiYMwA5m4T5fG5ZqeT7Vb5rZ3Muv97bI6mDFdKs0b6r9+R40dh0YNemWeitVIIDrRe5RGmIHNOY4w7ivIGgKDWjR17mkrNVqKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcL6D8d1aRNvL/X9b4/Jp8opUWKRSbiCJ/RQ408lFns=;
 b=EjcVghj8awkm53QOr6TNy1CC/5HGE8ZthqH4FvMNWpZwZG6e7EQFQxYl3h0enhQFBLzRDT1B8Ou+F2jfi/QeLg1mnB3LMGl45F86/6KB32ZzlYnmx1K0azomYweuMAd1zaJW843XLS8n4gTauJrIxPmNP0226JILOjUsRDPTOH9BOTmQ6I39axJqSYZcBedZ+hj6vMbQZoA/5NlVqvyrz2LjzHqxDx/sY+9ezjCJ791CKqdoMiIqFWACcJVc/jK/PzAgsZPkEPdeysjtLLr0ZT0EYr9wfExRJDFQtaAU0x5+UeMVRRztMz4DTHe95Pcgx/l5VIFE9e15KPrwcCH0oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcL6D8d1aRNvL/X9b4/Jp8opUWKRSbiCJ/RQ408lFns=;
 b=oppVAHYkyYudw7BQMjIAgxaX75NlSPMgNQTwK1DLrFHhVphFm/Lvd7gnZuQnyhvC0D8jc6oCkg0mlBE8cTWNxD4+pJlQtDCQvF8Jwa9IZRAeUY0xhpEJ8zIVuj95I6WuC5eqrZdgG941cIcYsFFrccWuXTRVAOex7PGUOrhkgf4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB6307.jpnprd01.prod.outlook.com (2603:1096:604:f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Mon, 2 Oct
 2023 05:56:09 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6838.030; Mon, 2 Oct 2023
 05:56:09 +0000
Message-ID: <87bkdhefev.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 3/4] arm64: dts: renesas: Add Renesas R8A779F4 SoC support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
In-Reply-To: <87fs2tefhj.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs2tefhj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 2 Oct 2023 05:56:09 +0000
X-ClientProxiedBy: TYCP286CA0159.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: ebbe377f-5772-46cb-dcf9-08dbc30c467b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v0X699kvnJqU3BcOKdy3YNSA5gViA7vnClNFpK4UjkiwwQ34fUFPrmOcNoz1R0AaUmud3zl9lt/eZbKHPepIMzhcwIIuekjEDffQvQJ+PApI2RIwgKbcxjflnw5Uf2xVXXM9tJU84uZngcHQ1nU94wXgPBwijvp+jSoZl+yoPaECfQg4qcjILJER4bkQDXEerpeZ9vQgOuonHM08dE+Y0JWEFD/YJ1858ZJDtrapxBF2A8Al9tVNRq87+5+OQ9fHefM3hCB9e2S0CFeeYMG3uwBfqppAWvcYc3/vSSHFG3wPKKbxKIAl71YSiC4o5fGF1vNQr3fjBbU2gX2WKI7wNwgBO11rkM85DM9I8AGeVd8be96XwGCQ/PfokrsIy4BnKiWTICEzHbLCfAoJVLsSnHHaFMcEK0Mr/j+yEiaW+srlsmE3SJTXRCPzcr+MHr4wILMAs0DOiEgCT3w2N/dJnfR+GgWdkOhn9oDsMQnyx1E7N94rTHu5CYUj7oUtcbKK74gmmjUZWCISB18CROcr9YJeDdOjQHRRrGwYHFDTFt38FxGdID1PV1pwPmD1RhdzflYja8N9laAv6ccwCsdCtHELFFnAOmx5DHT5WnRG2Bl9qxGaN2vBnUlot6HmW452
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(136003)(376002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(107886003)(83380400001)(478600001)(4744005)(2906002)(2616005)(316002)(66476007)(66556008)(26005)(66946007)(41300700001)(38100700002)(38350700002)(86362001)(5660300002)(6512007)(8676002)(4326008)(8936002)(6506007)(52116002)(36756003)(54906003)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xAWySNjWP+DVWKJoPfIsJyPU6kVdccVfcsUHqrxWbkHu6WcvCznGRActCf/l?=
 =?us-ascii?Q?5FwSs8sIbRMo7EQMjiMg0s6ijwF+fVhjVE95CtpkxhZzFpq4jWISPHoRp3ae?=
 =?us-ascii?Q?QuO8laV5mitauwbmGqO1HXfkTGbOlLfizYE19VkhItxTGO8DcjZkpwpEX3zm?=
 =?us-ascii?Q?P0R+O8HszWBw5FRrM3aX5x/AjKOgtezedo/hY6NvRFbeV8UZbp2lgcjDVqIo?=
 =?us-ascii?Q?hqjwHWz5uCbwgvSKbluS3Q0FJlHGLDtQ6INoeXbT0LHAhc/sV6dZCeInswib?=
 =?us-ascii?Q?OAix85XXUq9EUFyAUr+IstSAX6fQ4WLAA+dZQ1zDjY6jNYIOC/nfgiQQPwTD?=
 =?us-ascii?Q?k5Q8IPZtWkzAZcEWV7N4quYeEcfyFhaDmFKZ8Bt+oat9Op1pmgjqA6MPjNrp?=
 =?us-ascii?Q?h2fvty39C0kBT8XR4x8o/WhyxKP4TEebCGI6sQdVw9Gwsw1e8kboXdvjxKDe?=
 =?us-ascii?Q?kucAxdXhEVinp7/7no87b3k6lkaq6zQz5BjTYOAoMuBObNR8PPYEfQWp5HkL?=
 =?us-ascii?Q?FZfR9umcWivN1g4uP0TlqPb+KO5ZwQZR3JcKDmYQvwiCTW1tXbCIHxPz1izz?=
 =?us-ascii?Q?BrA++u/ElRuU3Zumi2Fnm13rVT9hJpe8/Hb6qTkhRewdOC7zGZbKTpbvI9D4?=
 =?us-ascii?Q?9Nh80Ljcb1q7ZBpGlCItqE7o66ejYMnZFnd6/fbOuMyKdxS6tIJlPce3zf0G?=
 =?us-ascii?Q?ewnW5AUc4fEoWLWp6RpcRwfuPKQuGH1aC2S1nqMdITAHbh8C0v9xWouN9uEO?=
 =?us-ascii?Q?oza1KKz/VTtPwgZoZ44nBiOHJYvM6KISTY0PKgF8/BYLsIL6qtZB6pUJc2DA?=
 =?us-ascii?Q?f2tla0ucfvRkYo7kDlV+PgZOv1A+7VjtlvR+MxaihNYvBcZ3hbv73yKfJOVv?=
 =?us-ascii?Q?c5JwdCYKH5NLJ9RFo+lok3c22s4lzgh9zcGbmoe4XnDF7iVehhijNOwfUNEe?=
 =?us-ascii?Q?CHNCqMn1m47PPdQjRjR33JhKAPqS9FFGYpnxngRrZk45gqY4VSZ0WMVPGgDY?=
 =?us-ascii?Q?ZwjQQ5Uugx2sdBM1hChORbcGiGNbubHKEgt8YCsHavq8DbA3fowjrnl7An/e?=
 =?us-ascii?Q?Sy5vj3g2UM4RmiJSscNqSzmgFcJfPpELCnFupeat3ohSCQqLioQ4njD6Umiq?=
 =?us-ascii?Q?mgRygkpjPfbqdumvpJT0nznkdaOnICDkShUXEp8e4vJ3ZC/IdAq7SPGU6QZ1?=
 =?us-ascii?Q?0mkQkwP6wBMcUi1QpWqWMjupudF01bXJt+Dk3wu1r4ky10kj585NVsMFf2UZ?=
 =?us-ascii?Q?zJ/+73qNKkeCiWP8tzgTyFvfN5nS0iCVhIVhpDblBmSCo0G2E4PDH8MfBQU5?=
 =?us-ascii?Q?1tknGR/wGh/Sg+sbadLK+GV39TyyjUsm2Mj+Gg3aAKye3Mgb47pRnjo1O4GG?=
 =?us-ascii?Q?H80TzQmsjW3nvYDT0f6c9SWo1ZPrYR2hE6iKDFYt3cwv+WiNEULZoxZAhwUI?=
 =?us-ascii?Q?IacFsHVA6n4q/CmQrN2rquVYR2ofH5Jj5fhXKjnp4QvLH5MutbUPdWFJq9X4?=
 =?us-ascii?Q?b7QfS0RC9LBUxjkEIsSV1CDCne2myakTll9tb5zl+roC8VaY51uOhbvhs2C9?=
 =?us-ascii?Q?Noao0FXu4CWACHTwr0dzxgYMeWf1AVulFP0Zh0FZ7GlR7OkVyKsHXiQy5eB7?=
 =?us-ascii?Q?LXH9d6vQ+0XFMkzT3P6p+cc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebbe377f-5772-46cb-dcf9-08dbc30c467b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 05:56:09.3926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISyCoT0tXRR/vxjrnxsFDyNtSuxL5WBB0OpCS+TPQPxUQEBvYte0Uv+pVd88+qdcaZ4nxHrHXUKdLHK7k24gZHTFJ9x5lFkvmFzvOaFwegv6BGIZrKyQzmj6ePvU/+Lr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6307
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
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

