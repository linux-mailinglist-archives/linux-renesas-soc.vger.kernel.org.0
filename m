Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4096C76A505
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Aug 2023 01:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbjGaXtn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Jul 2023 19:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbjGaXtm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 19:49:42 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2101.outbound.protection.outlook.com [40.107.114.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE8B10C1;
        Mon, 31 Jul 2023 16:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJvfX50tqi+8oU2HkTMd2FXDVzxHWHxPNhfkLRupWHnrz7kKWaChnR5Irk+wh0wxRfXNRDaAbmYbD/x7sIbreQjEyZfTE71/HSsIdIq4cqciSkenANG/LXyJeohuoD78OBBG8Ukc7SI/K1zVehr8cxx7pRF4qrH9WmQNCKRkvNymdQoot2pVl7Hc7q98koiBnVpq+vExCU3qpqRMnY0qF5bXLeemT/tYKtx3NJ5atu1eAwx5BL3mqanO0q0Y6STiJZ5imAb1G6Ikpt9HX5aa89UycTg22w7rHIKlHGC1YZpQOcBwWoTQT/x7UcFS7F7WiO0UKUyJ+rA1KyiLCzAv5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfXBFastFhPT+yarzU3nJNQ56H5g9HojysZv5DVb+hM=;
 b=Hk63pETksrYeE/T89VKHXLfT6qZx6uUvnQKbdLg++ZWjzvihxkPzWT7/GP+z5ox+qdH0GRxn6Vb8qdfUpgdPR0JcBFO5nZsHyRktAVBqhU0fEgs+34bMdfiH4lxB6YSYmUT66+l2/XDs26E4K8T91WelGxxxypsaHOiod/U8LXCWJDmlxpXOuN4QNnDVJzYybtQ6+2CEeorAFoyfSATWsxLYRYM3QsaK+THH8SfWF5yGcwc1ilsMsPScXnXaeE6+0nqkMsbUrsq6DZajpWEBVNfZJ1dbeWvF1pg+J5GzDJRGCnuU1J3yzLAhFR4QLJtzZDMUn1xuMRGDM8T+PD6Drw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfXBFastFhPT+yarzU3nJNQ56H5g9HojysZv5DVb+hM=;
 b=mGpuzItbqzflfENRlSKSRQ9wbhSuJ3uVtGSKPF00QL8KRdk0NulbkQ7Qcckb62DyCoyNLEYiaTzGzMLzCTVZ9zUu6umyZAQzXL1WKafMySdhDV6md81/UxADnR7XcT5GYuJgNxAMKbAlIHKF4PQ65CjeqJYcZYRTRs9lyrww5TQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11995.jpnprd01.prod.outlook.com (2603:1096:400:3dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Mon, 31 Jul
 2023 23:49:40 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 23:49:39 +0000
Message-ID: <87o7jrpros.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/9] clk: renesas: r8a7796: add 922 ADG
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk@vger.kernel.org
In-Reply-To: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 31 Jul 2023 23:49:39 +0000
X-ClientProxiedBy: TYAPR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:404:28::32) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11995:EE_
X-MS-Office365-Filtering-Correlation-Id: 894ceff1-8b35-4fc1-376e-08db9220ce2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iWtUK26QxqPIh9Y4M5evCjZIXRnIELDD3VU6pS7SGZ0hf/IfYf+XYrY7K8HcOatjqaUsZ3BG7ytmfGlE6Ws2szwvMtwfqdfgyipAxXGuQJuQ+KOArw7v09kZYGlzl5TPSW2AIcuchJkS+1pTo4wTjifA/IC+Huw3BSMros854+3N5WVKHb5MslGhADwN3Vq1DOJt3RRs1WJrAS7HCXXVvtn2x+o4pGOI12iHMbiJ6bJkEO063NUgotIJznc3lfBr4vQkQDDM51fgSP0odGOL3kHGesSrNrDX6hGX7ACQ3NEqzSgrMbMpLqL/FYr6TYC5Bi84K3EUxek4tk1LcMLAWdHdOCGvVdfPJ8ip8hj+5h8VfEdIgJwCX5UUCE8+4l9Ag4j3r7g2RW3vPK1CFc8/QmNevg7PTpN2CJ3gCFSPXEBr2DyBdmvMpvNLVVdGUn+sflZBoMIj8UgBLur+4pZK7NRysIMMGD0+re6KDZcb1tE3FSUiUrWfpIPQy2m6IlsLP9uBYJX7I5LgjLx2wn7kFSgMDOEnajoxPpsKBH+b/M34NM0FypAvgZJsgFjJqslYT+M9fTGbRGtmxNiEsESzxWlqeXIR6cNW4tugAi258piq+S98fD4dCP8E+M8qegJb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(478600001)(6486002)(6512007)(52116002)(66476007)(41300700001)(26005)(6506007)(186003)(2616005)(316002)(66556008)(2906002)(5660300002)(66946007)(8936002)(8676002)(38350700002)(4744005)(86362001)(36756003)(38100700002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JOoQlXDgYo3mjFwOxewOpB5jh3Z1+OeOHfSbX9Bg8cPmL40WsmFDc2E2XrvZ?=
 =?us-ascii?Q?9vW1ZAkA9LvYYzCVKkIP9yYN1v8CE1lH4g9ZHuNHtp/b7SkYTXtlzUHspWba?=
 =?us-ascii?Q?oMOC/xQVNXsWB0a3ruTR9Wp5Be+B9MJlZRCV8Od+PpQ82BD9zvKgnY9kDUeq?=
 =?us-ascii?Q?rG0amVDDlx04pXHmb4BqoDVPkG5/7ms4uTdR43axsAeLZVqXm2mjjjhX9RWK?=
 =?us-ascii?Q?Y8WLnQcWRQb+r6Icb50mpyLeSGvMA38zYu7wlcm59SqN+wIpfY4G5av5PJFr?=
 =?us-ascii?Q?xqG2okGnDy1MeY/wrmNqPZOmDdOjcBKDhqba4cE1ksUks3RyEgU2WYxH1S6L?=
 =?us-ascii?Q?m1TxHpcVpKxrkwWgnIciB24kQEerXMUS6f0hSF47J3PsdSJFv8ZzmgdIRFTJ?=
 =?us-ascii?Q?fLIi0c0Kjn7gPbJ+zqyQoq4XPtJWmo6VzK8hO0RQu3XHyQpF9DFSNkYNbw7w?=
 =?us-ascii?Q?yEwfSnr56l9ZLwDEbwiScLgshAjz2R0RXgA6WKmZonHhCFxjrXFrwX9mgBfH?=
 =?us-ascii?Q?MUMMzK4enAHyr0lYrNp/qMpUKwOE2CXSeiWt6YoYEdBGyhGEWtijGe6FSjMt?=
 =?us-ascii?Q?5zwN3mR2otufs6V+pWFE/QoHIrH5bv2wB+Bfcf/JufwqYty+aNxwf6zJV1b8?=
 =?us-ascii?Q?e3GgD9mDTHl6IVlj0vg5ybqxKK6HW/tpNQ+mG0lEePvNALQiH0khxzPGRR5I?=
 =?us-ascii?Q?YYiN1xzk++m2G14MovBMyw9B5EoWiMpSBhCWWv3dUhcObo3rOLefLaySGfNJ?=
 =?us-ascii?Q?7SKr/I0w137w1XoKvrCULwFHY744s1sgKtV6rYgR5XderfZ0LL8u8a89Q1cE?=
 =?us-ascii?Q?pRyjKm5dyABk59AUafw7ET2KL/duxM/GEZKF7VZryb73xZ+tuEOyH3iFXZEn?=
 =?us-ascii?Q?bGYAuzB/uPv/OkIS4voP9VVA3wB4kBgpfu3GKUq0uIjm73ijjPC8YDF7+0VX?=
 =?us-ascii?Q?R5FVcUJGqecUbHzh9n16KUvwOKnCbFMbu9peOvgjawN3nDyuEBhcyLqh42iY?=
 =?us-ascii?Q?nx73MJmvLrDC7Gr7cQjV951qwKstw1WnrGEAkx5FXuCmvKU8ltyNTNsMYspi?=
 =?us-ascii?Q?kwR+8LXgQp8qTKI+UbJ5Q+CEj3+KWzStH/2Tt8OpEWfkVuNDUdWLOFRE5+2R?=
 =?us-ascii?Q?Eh6KzyGLRiqhyWZpa6oumtOLCzRyijOWuR0raOAEeYdM5KFl2x9EVIOz/sSx?=
 =?us-ascii?Q?uJEUr7cQ71Dk46YihtHFhsWM5ILvYvfOnhGC/tIk+ocxsmr0gDhGY6OzkbRz?=
 =?us-ascii?Q?5pwAdHTJXbN2eA+r/KEt9q6NuvxqqZhxv6tFyP7ob34bGEdsTFbGAniCPg6T?=
 =?us-ascii?Q?pto/GtK1I36NInVsqiZSidhwCuQ0xGuGBfZ934Lxq3UerlEcFj8MKGk9jZR5?=
 =?us-ascii?Q?KaRCFJQFYrvY00vhCafrjiw2kXk+I2SBrzPmKA2cuIu+Q00U75FqGvzqEIW9?=
 =?us-ascii?Q?61jQcg1+dRjOxXsy0h+8CjCviqgU1udJnMytXYCo0tSi2auQT/r8jSBfboJA?=
 =?us-ascii?Q?FRwF1np270Dw1XQoiopepU3Hdf/EfTxmcukg6aH9wGKAzv8gV22kF8TIHrH6?=
 =?us-ascii?Q?i0skvP1qLlHQuj8/5An/AZfePqyUp84ONEaRUIpxIjQ0LyiuMf4IC+N2Ac1/?=
 =?us-ascii?Q?/SEZ0CrsMKSeaeiKi/hD3rM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 894ceff1-8b35-4fc1-376e-08db9220ce2a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 23:49:39.9366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2e5Sf7v7yB+SzM5eX5gWu1C5qVL8ycRzEBAh3ZNc3U7jU1iKfOglU+5TPh3reZTYBlAObwRJj7aQ6AdoSqImelsg0orVL2/er+ffRY3hY5B82Xm0ZP5IWIhl+fnrOj+g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11995
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car Sound needs to enable "ADG" on RMSTPCR9/SMSTPCR9 22bit to use
clk_i which came from internal S0D4. This patch adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index c4969318508e..25f0f29d15af 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -236,6 +236,7 @@ static struct mssr_mod_clk r8a7796_mod_clks[] __initdata = {
 	DEF_MOD("rpc-if",		 917,	R8A7796_CLK_RPCD2),
 	DEF_MOD("i2c6",			 918,	R8A7796_CLK_S0D6),
 	DEF_MOD("i2c5",			 919,	R8A7796_CLK_S0D6),
+	DEF_MOD("adg",			 922,	R8A7796_CLK_S0D4),
 	DEF_MOD("i2c-dvfs",		 926,	R8A7796_CLK_CP),
 	DEF_MOD("i2c4",			 927,	R8A7796_CLK_S0D6),
 	DEF_MOD("i2c3",			 928,	R8A7796_CLK_S0D6),
-- 
2.25.1

