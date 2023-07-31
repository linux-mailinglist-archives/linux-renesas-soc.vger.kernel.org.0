Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E927476A52D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Aug 2023 01:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232066AbjGaXv2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Jul 2023 19:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbjGaXvI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 19:51:08 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2092.outbound.protection.outlook.com [40.107.113.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132B12D62;
        Mon, 31 Jul 2023 16:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCBPKktZKgdbIZvSPOihjRo02+kuGIA/Xbd4GWT2WOVvjMt2bfPQWR4Hz2TRor28APIZe5T9lftbpeYKunJQtVW3kXoksaFQqdS3MlqoT2KlxjOsUda4AeSErv+Ot+MOqjq7TOAe1a+i8kHpyFLQyHzWp10HyCkzLH1J0MlkD4EjmokVx8HT5CkYxgkobtG60/MHiSPHT6ZtAPdCV7O1EFNYEp6A75l6raWF5qpG6FWKpoNQtgZOM1s1HFYjpT1+TtlcI7LJ06tZG8N4pM1uFdIkjrmAwfYWg4zOOwSJarLR/fL/gvfBgFhDqNu9wionZ4vxdG2MM1z8h6OM9c0ETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQUqP7FTZ6f7RWAsjYOH63h9nfDu41dpgPXWmXsSnNg=;
 b=WqgXkjQD/ecMvIxy4JXX+MT4Iog65ImfLNjHKaPDUJnqc+oRz6kqlU1Cy98ilFCckJG4FrLomvKSxDE4qwW/xOSYNDvV2Is1TDoBpitv2oaTYNc7wMBeofsUJem+5lWnVVUT8pdZ0hm7Ggu1aTSZSOQJRmM9W+t+/PR6DizGUGzubIQ7LLHwVWVOfBZdG5XyrRpAsx0zdG6BdVbV14e0Z5cjPcBXCSpV6BWrkGK+NOtoTCfi5sQg/NFtW2ghQaBQu9kXEzNWQw+ikUGN0IiNUXBbSlNfWKf5NG/+ZpEHqXJq0lbXlAMPDvP4EL/kv37/Hlvy2kJ+vIxapf1nWJmAWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQUqP7FTZ6f7RWAsjYOH63h9nfDu41dpgPXWmXsSnNg=;
 b=f7favY2mXHjiKuXX8osXwfPxfCQM+fcJ5VMYfPZ8Ml9F12PADx44fwJ+GS9MzdOBPn9OnVjte7ihYv82GUhW7Jq4dg2vaqkp0rDGugu5S7wlzmog9sd+hQLeuzszH866JCEFPaVuRHaqUi+0H5JzwopNj3jQk+wm8vbzyLvWkVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB7732.jpnprd01.prod.outlook.com (2603:1096:604:179::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Mon, 31 Jul
 2023 23:50:15 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 23:50:15 +0000
Message-ID: <87edknprnt.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 9/9] clk: renesas: r8a77995: add 922 ADG
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk@vger.kernel.org
In-Reply-To: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 31 Jul 2023 23:50:15 +0000
X-ClientProxiedBy: TYAPR01CA0172.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: 7164afc3-a5b8-4b04-0b86-08db9220e33f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kjBmbbISdz0E4AsMW4EctHA2sjWgpi1tl8ex588RFsYS533eDc0rwhTrTI0iKhKFo97Fu4wEZLIkOVF7RHAqugXO/HtU+/Hejp2pCt4RH/0kE2T2n4fe57J/yI+PtxlM+nSkCcwuzkr4e551jVRJSzUOfONFoxPdg08k9k/bZxaN9t86k75w+c+jIukCvhfjoZggQLv7J3xjr5XfvFDTU04LkZQ8IR3mj9+Ws32rB1UImNzbayWobFo+7erKdn2zE+6jmDPPh4LBXQEfQ+wCqpEFCnD0u56gO4+ZNufgNaaT7EIV6UoV7YyYN0JFeXXm3SafD1i0rSW8z2cdoVRtsO2jjRFfAm7auDTkeyphYSPHZGH2djYtbZUhEP4OehWDrque6BhCT/JMxu3LFlMkWhNV2/B6ergZDpHIkL3SVRFSTq/ojJx4g08wYDAWV/mIbxkX7u7EefXU2nfG0ZE1QfVJk4C9dwEd4JCKNPmDc+8AijhxmlvORbYMSYwbjCD9E/881qf8TnAY88FIPfamq65lzsI0vN6HG4NSnfZGtbMtcPhprqbLP1uFf2jV60C6uEpLkBlR6adewhqPGyakbqLygeChm9sp2IHrlEFOcJDow+me5NNYAwwHBbuHAjTs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199021)(38350700002)(38100700002)(86362001)(36756003)(6512007)(478600001)(52116002)(6486002)(2616005)(186003)(8676002)(26005)(6506007)(8936002)(5660300002)(66556008)(66946007)(66476007)(2906002)(4326008)(316002)(41300700001)(4744005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?93phW3ki0/g/PZ6ssuwxhiUPlvcFQ4xX81CHBeS1PAe7Ws6E0Y0qsEmB5L5k?=
 =?us-ascii?Q?h1Xip6J4NAL17SMDXG77x1MyjEOwUu8vs47QqwAerSnaJ2JfgIDBpBf113KG?=
 =?us-ascii?Q?yxTe2v9dvf3QL2eTa7dL4nuYaiCjLazEOcTeOzZ3kgHkMbcRwlya66dGvarx?=
 =?us-ascii?Q?kng27lih8cDBSAQgnbhp0c18jJhPq23ASbohSPbu9JsxPHlFhkqayhSJK5an?=
 =?us-ascii?Q?Mw/mxxNXYOIzsLSC/EpYrhV+HRQX9AqGVsRQdH5y8Qw3cXK2C37UfpBkaPRV?=
 =?us-ascii?Q?Hg0Qv63Cz9aWcFHX+5YXJSiuD+lUVpoFcyR2trpt5PUcWjJUqa51yYoYnhn5?=
 =?us-ascii?Q?pEn+DcB65sfc1Sks8lgiwnN4O3Nd8CdSZyBX+uf0FzUjIkNTLenbOlErq5Ux?=
 =?us-ascii?Q?INg4zsEf7k/2ETpQjkoYDIJubVf1e862xB6q6r5eSu8/OCXSTLQPEN6wUJIZ?=
 =?us-ascii?Q?RXqUiB6DxK2lm8/Zr9J1Xbcy1vNK2FXlD4JBTpTA2NgDTlqz09iBS0u8WtVu?=
 =?us-ascii?Q?u6w0xtWwEGZuwDDRuIsgiR0Y5jMFWu654lAfSCrpgcMgvHKViZa3nC1Syx+t?=
 =?us-ascii?Q?ImCiNIQVLCQwE4F7Sv1KbZUzM5NiuW0t6Xdw8iomh8HEQts4PJEgVydrb3u2?=
 =?us-ascii?Q?HvjwKvC04dD3Mr6hWO1mRPok43s0dF1QxZl6q6BIBJMyxv04Xz+mKphIL8Ek?=
 =?us-ascii?Q?rH8Emodd4MPgOctpuzpvLQCqOtL56ltUcwGro0k1mNuZ9q9T/6gJyTWo5uoS?=
 =?us-ascii?Q?rzbelj3j6je3ZIG0UciEXU9m7Z63UHnzYqjcOjrcWZD+VlPirWYQwUEdsyU7?=
 =?us-ascii?Q?p5UyjG+Ni7P78EIKIFnCjv8eKzq7WNU9wEeZhN2DFptH83Vh839SSWWIiySF?=
 =?us-ascii?Q?vcGXwLgprIOMM5K5EfzpHQygxZVwN170d3ZDcnU6+bh+XicZzszpGiRL6ZpB?=
 =?us-ascii?Q?5em/HqS5Q0LefcjbxHIpt2/ZrWPZC2DONVOi5owFTGX+qhPnSaUOcsQ4FrM4?=
 =?us-ascii?Q?D+6znoxglRy12Th4yqdBIV0eHNHfKKamtUO+1PQ5Ipa//BvDSvAegVTwT1r4?=
 =?us-ascii?Q?d1bHvBwOs2HfvwCW7jqYboGnTpCfkMVMfAF/hv7dEQF+45A8z4Nr7ZBvd6QJ?=
 =?us-ascii?Q?vnF170JWjYZxpN5JIHpGvpnhZZgnX9KWm7W5v7c2NAY0rPIvdXQHGMGWC3d3?=
 =?us-ascii?Q?uAK59BF1ARvvsEeafvSySh+auJuVl7N5bLgayTYioHNpjAKWvRZU8Nog85k6?=
 =?us-ascii?Q?giIT1N0v+zPprs1UfxT5/h5i1P0p76HM3bcgRYrMC6e4gN2R8rLvEDCL/9RO?=
 =?us-ascii?Q?d/C+1rMnLc4AFbk/5jttIiHUNkZvPMJ2BzMCKYMZKCx3HeltWuq5q5/DDgQG?=
 =?us-ascii?Q?1h+jvCqr/PYolihnQgMMyg/nKFC7BQJcf1cwEuXoxqfH4aUtJbsFsd8Q/Ldp?=
 =?us-ascii?Q?E1J1saQCOWoLL4TvMFgHMBlwhx6KVd6brZ2GbqXq5bx29Q6VyIrnO4nAcXv3?=
 =?us-ascii?Q?hc04L1x308+fx5w/y0ev19XFKmySG/nP+zfcvQTsViwLgdFfZADE9hR5iWwW?=
 =?us-ascii?Q?MXPznqL/zur/cu4jVe6YDnjiiWS7meLhqsrBvsHiSEWPb2JkkZFdqzanFRuq?=
 =?us-ascii?Q?UyiOfxsb5UTbSTKuqXW33Lk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7164afc3-a5b8-4b04-0b86-08db9220e33f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 23:50:15.5347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBCRSB15csUDAMBJ6GQBaRjTcWfmvgd8xm+dhyWE+pSC5HQ/fs8Bj/Kp1CpVe0eNB1pRkdeNsKnyllfVOekNAF2p+qPreYkCSMR5DZWNwMpGjPZl0Sm4KhG8aCq6NpHK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7732
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
clk_i which came from internal ZA2. This patch adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index 3a73f6f911dd..162fa86c81ff 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -181,6 +181,7 @@ static const struct mssr_mod_clk r8a77995_mod_clks[] __initconst = {
 	DEF_MOD("can-if1",		 915,	R8A77995_CLK_S3D4),
 	DEF_MOD("can-if0",		 916,	R8A77995_CLK_S3D4),
 	DEF_MOD("rpc-if",		 917,	R8A77995_CLK_RPCD2),
+	DEF_MOD("adg",			 922,	R8A77995_CLK_ZA2),
 	DEF_MOD("i2c3",			 928,	R8A77995_CLK_S3D2),
 	DEF_MOD("i2c2",			 929,	R8A77995_CLK_S3D2),
 	DEF_MOD("i2c1",			 930,	R8A77995_CLK_S3D2),
-- 
2.25.1

