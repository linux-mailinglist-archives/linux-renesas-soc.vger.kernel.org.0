Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1EF6872B3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Feb 2023 02:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjBBBDj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Feb 2023 20:03:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbjBBBDj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Feb 2023 20:03:39 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2138.outbound.protection.outlook.com [40.107.215.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C049F20683
        for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Feb 2023 17:03:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0eNgq2Ny5eUFD5DYkgSjRUth0OwNsp90VTJWIYjjDnC7wrR0xFd251doCbUp/4pOB9SxlXoqFVAyEfy0OD3w1ibGWHxyUc5tYQx6zjNhmhVhEFXZkN04U6jqTvwMmMbJoO9wC2hUtB3PvP6biKemrGzPqxoIf6YMuIIRO2qyC9ubXYUVGqjixGrB5KfwFfOf9dF14e+F8LDR6K0kDJIML6iMD3bQSyYKFN4inXboAcM7jBuJ6g4slpN/NsW7n+BJz+ApDFl8DUA9VxdmL1tdbEdPAd+XlCKD0cQ1owX8ppG1/2ONBOosKJIekGueTkjhPUn6soTooT1EToOanOaHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWVE3UKxVD2Z7L4H32qgl42SdxMA+3N9vnma33S1gLk=;
 b=ZRMVulXwiUauhG8TKhFPh+QbwyxQ9kfR0dZ+U3F3HeTZ0LhZOdb2xvD+9k2N+XlZi/dVf8VDBbt+iqYZflNsvyuBDxQy+MKPYSsBBlyOy3C+N+c6poGla2swhoB+igXlm439wGkdrFNlmjzdbIqBInNoPGdmWJ9AZCRL5CJZPQ46aR7dVirIUWWSIb1yimV2qe1Xane+aUpNf4/cA5iOj+ck2QWl7A7Cnyu8tJ28ei0OoOT7+cUEXQz96hhkduynYATSgs546w8jgS9GcSCJu3GJzCoaC/7IDUALsXGzBhV8CfQcUx9fMv1xs2TVOMXDNM5oPBVtHjb5IqzPwK8ssQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWVE3UKxVD2Z7L4H32qgl42SdxMA+3N9vnma33S1gLk=;
 b=UTsZ7icpyYfX4/9Y9GNepCyVJCmPfqgxCAVrlSGGPqrdCvMu61XM+TuhtktLrMtWtrSunF8NMFwEX8fmU+kpacfZA/Wtu/6QzrFGz274q83XM0vhtEUb9XI1hPVassi58qcmMEEF/EpCu70g34op1hJxh7G0z8XvthCKgMjrcts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5959.jpnprd01.prod.outlook.com (2603:1096:604:d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Thu, 2 Feb
 2023 01:03:24 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Thu, 2 Feb 2023
 01:03:24 +0000
Message-ID: <878rhganfo.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/9] clk: renesas: r8a779g0: Add Audio clocks
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com>
References: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 2 Feb 2023 01:03:24 +0000
X-ClientProxiedBy: TYAPR01CA0229.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::25) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: 17b1bb34-6d36-4d01-8def-08db04b9490d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xFMLU1Zt2zydjWEafqWmy2qEGoEndN080z/jKKdkRWd+7j6c7hW0sWz4z065fCb9YNHVE7cSKwjWeoDPWdyreKNsgdTg2RqU2OPaC17Z40O1nFeyoT829S/Hr5J8dHw9G+8XwDyNzGHApon8yMbVt/TpCtsBWFzBC7Hp44SDRk3V2Z3KDkKCuYcJEgi1R7akV7nP5d2QuKbUwlEtL5vkb/vAp47VOqx+jFCIr+RAwwSaWoTAhQ2GYsG1SLOmf+A2AbDY0hNYats/BsIQsylbv05pZ4TCiqeTkeLO7XzD/QpZyTp84g+6v4pwd0lQSeOCLfRrYJg7lloS6D3ApyE1XLsnbNHGSRXnSzpbnbKcVWjnB6AgJiJMV6VRt2q9UyCMMzZ4yoG26ZpIPGkOdwR4bFKKrCofsEzUm2Se4VCwudQSfI975KPy2nBJuPCdRs4wAvNLivQnMllQJiAwKHjwoYIfr2cP45SKcs/c9smYdlutCBdnMM4eI2R+3n4tO38cPlqNcjPqcGp+DnFRngzNQlab0MWOsIcCT00svRVD8w1e+TcdQrEMTK5JByXbvGcExCTYKMpLRFMYoRFiwlZqgY/cVlnGGmxQVSv7CHZLASa8+N2VyEcbhFk0eiKMCtRpJTNZh2MAVfqLxTHylAzwxay57VYDzdXg2/z2mbs4ecPzbz2uRjlhb7heXgPaOtD2hIuCFQe7rusF71MaB8vDGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199018)(36756003)(86362001)(38350700002)(8936002)(38100700002)(66946007)(66556008)(316002)(8676002)(4326008)(41300700001)(66476007)(2906002)(83380400001)(2616005)(5660300002)(478600001)(4744005)(186003)(26005)(6512007)(6486002)(52116002)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WsdSqB4uA2YSlN6wLlSIrzHrTwmEUzQASarWR1BKeSLA2YCH21tyskBaQSUq?=
 =?us-ascii?Q?PjRbv7v6NHhVwVIWLu/rglpVMD0GLFwDkQJVRE7EOenaWVZRljQtp/4rEqnV?=
 =?us-ascii?Q?J341Cf3RmALhp90RETKhFYFdccpS889UU/FMvvUo3o9eutCea/dXQ5o6VrqO?=
 =?us-ascii?Q?P5C9ViNlffp7/RUXt9cAdwlPVmwjBvLOjfuBLiyZZfFaogzo2adXs0N9md/G?=
 =?us-ascii?Q?yj3pGD5T/rCb3/KEiTlcErn4f6q+YJbA62ALBn492VjOvdDNTsN4J4xLNSHI?=
 =?us-ascii?Q?lXpswBk4nQHjUAZvQcdYWyb6g+/YmoVr10Zyu5mlNYtirdS/p8W4WQFfxqBE?=
 =?us-ascii?Q?oJ4Q9IAP0U+B5g+qQl1oKCujULexq9rg/SL9OvTliaEFqJcBN7LBCpinL1VB?=
 =?us-ascii?Q?toK/HGojejgnCP7EIlKj+4KvCJfdEtgZmL/W9GnxkYKAg7zwnge352ngaRZ9?=
 =?us-ascii?Q?hHICMau5WRc+K22DG3pz1456PZlM/jjeispqWulvY+GtVPHWYNDKOFbfYz8c?=
 =?us-ascii?Q?jwTy9dHzzObXW905VLBk1ybZqm1cOiax/v4pe6NamGvnO74KnXb9+AY0qI5C?=
 =?us-ascii?Q?LfvNvO7qgnwY0va77/ZhdfCXJO8iB/zXtd/5rp/Kb+JggmRBlYdawExvMq6q?=
 =?us-ascii?Q?V/ejs0kgHKFmAqR7r0WGYYq5PHHUTVLzeKKFQVjE05wqPafBtFC71xKWR8j2?=
 =?us-ascii?Q?wNzmuzRy+MIM67PGl7x3csEjmGwNCUeNnmTq5+AS5TTNQh8b5cyUccrSPJPl?=
 =?us-ascii?Q?/C0emh5Wzl3Et2OSDC1R0xYmb/VvNLGEHSozUueD718M+c02jEPYikcw2IX1?=
 =?us-ascii?Q?4Z8tSDNnZxvGkMfexXiJcOSs9oTA/uGTcX50Sf+FDdFCyvvmE3ZLzNMjfe9g?=
 =?us-ascii?Q?zsUe1U+fvBMQW+ZPtXAbhU4Je4gwq0yMkCq9WXKv46lTojhJKg8Hzr9JjBC6?=
 =?us-ascii?Q?4srjEVt/L4xVraS+FTpN/NHLYFzN2HrQJnyWp9BNJsDuqOI4CL/K7fn+c1LO?=
 =?us-ascii?Q?5Uj3I5idwLOluN0MBgy8QxMgqRzTUBOfZgmz1h3392NzmPzzxn7FjssS4DrR?=
 =?us-ascii?Q?PRxreF3eu6OUWM0HC3BEKP7Ao5w5o/vJeHGfEH9eNtzjmEOC61eWweqD7vWF?=
 =?us-ascii?Q?SCxhFR2LhPM7YGyOzycVbdILRXQpINrxEHViQRNTsXH6+hNixDutKCyjuRBG?=
 =?us-ascii?Q?kMzXwbUzZX6oyTyRqtLLhElCj6YQpSj/r6wGbqfxMnlB156Z3iNIzsYRO6x+?=
 =?us-ascii?Q?5xWBEaEI2sGiuZa/wCLlcBrDvmyqINUTobz+dZfvDSAz8XH/tTH4733ONctg?=
 =?us-ascii?Q?D673eNVWW7g+9D8ZXWSqw+M2I0JX2YuF5WJnYqvG/TfZNbJ29ocAWylDihqW?=
 =?us-ascii?Q?5TtX7p/FTiD1kbxmgy3I6pXI1fk0XnWnmHgh+crFUWuv1R+dYZzEzLIBe9/1?=
 =?us-ascii?Q?Wd7saArPI1zPA1vAQN8RVO17k0r8m6K5JejQBQuKQ4tLohK0gxXWJxVIQ3nc?=
 =?us-ascii?Q?uAYm7o2cYPcNgcbJn4SbL9FCN52yo0dWr+dOadZQYhw0Qi/OSAgHPPsCM3FF?=
 =?us-ascii?Q?aelEfR323lmQydO2EjFi3NFZ3evW8MZfMHsNmRhpXUS+Xln3mBc68zbAra4e?=
 =?us-ascii?Q?pcgfVg5EX06caGNHEHUh65g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b1bb34-6d36-4d01-8def-08db04b9490d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 01:03:24.5392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2sEfIc7TC2WuRzT+EB2+l9oKhjegKYQuGAhQhJ5vJ0rsD7Dm614dXtBaOss/Ao57GEHaJpsmIQVtJ2DN0Uk89isdyx2jizqJ88oaIlorQ8T3Rq1NrtX+1ThMX+fcxS+B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5959
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch adds module clocks for Audio (SSI/SSIU) blocks on
the Renesas R-Car V4H (R8A779G0) SoC.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 7fca11204f74..18a9462dab76 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -213,6 +213,8 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("pfc1",		916,	R8A779G0_CLK_CL16M),
 	DEF_MOD("pfc2",		917,	R8A779G0_CLK_CL16M),
 	DEF_MOD("pfc3",		918,	R8A779G0_CLK_CL16M),
+	DEF_MOD("ssiu",		2926,	R8A779G0_CLK_S0D6_PER),
+	DEF_MOD("ssi",		2927,	R8A779G0_CLK_S0D6_PER),
 };
 
 /*
-- 
2.25.1

