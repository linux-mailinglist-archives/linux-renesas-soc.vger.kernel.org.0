Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E90B67C2BC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 03:19:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235466AbjAZCTd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Jan 2023 21:19:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjAZCTa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 21:19:30 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2114.outbound.protection.outlook.com [40.107.215.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A383BD84
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 18:19:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vlzg8YdbrwiJrAZqgtaKOZDeHLn1BTnDLdtT9jUhxOEcc8LeSgtXlnRJskEyFxYI/jB4elva6dULkjOFGOLTTIMweA2A5NF5ZXC8J79IQHO1WROWK6KfpYGwdsex+m5PApJFCvN5q+bIANCLgkp9jvbGN4Vrv1JYC22rRsTkAayqGfxUz/Kh5p/g2mJ7KDH3ZuEmhbuqgRHNmnbaoJU0Kvefr0WIf5QLBkTBe6XxTSHRb06NkeVHXysRKWIpCmEKQ41RpgWUyV4dLODKix1FJXW9/lNsEUcGp955XT8YM4iL3gEcpxomCTBpWNgzOzDql+ASnty2d5C79CrHm93pNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHIQaitJKa8NyNCEksC9k4trh23Jg/zZmOwhvSi0tZo=;
 b=OyDRuSe/e69J2A9qhjY0SOYAHc2RdhefqEv9s32QXpkIITB9tNPDlWXsVqSRe2UJ6Y06UnA2Sgc5A8lnBg3UBlZoxIXc5GWm4+2zeM90a4wGBIMaFuatU16Mj0g/HNhbZx7JvcHdWsB3eyqKOXMnt6VbDRlP4f5RcKyqW+sdP3WMgj6xPk28WZ+ZIiZWTPxDbsq7mdQm6v8bqd/QTn/sOvaYrDd8O74ZrAWrKKZ6Ab81HZGxFIAKajfx859mFP2OWfXVvdmkTiwpLvp4ObFiwJ0Ldjn1Zm7x9BygTLlaiSWYoJgj9951GKryO3/l9bPKpKiz3YjaxObc0wFJtnd/jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHIQaitJKa8NyNCEksC9k4trh23Jg/zZmOwhvSi0tZo=;
 b=Y6DkE7BBeQuVrMZX5HSeISQ2nEXv/aqEg3ECA0jRDlIkOpYNkIqhEf1di9nRrlGrWOuC0HHeYsTjDdlFeTwUaO/RUbslFxcGUFI8trIllt9LbuwP+atRU610VfiZLXLaaKTUfwsqrbOD6OeGSMSwgncrhVCED54+1M8eXB/OcMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11323.jpnprd01.prod.outlook.com (2603:1096:400:36e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Thu, 26 Jan
 2023 02:19:27 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%4]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 02:19:27 +0000
Message-ID: <87tu0et4up.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/4] clk: renesas: r8a779g0: Add Audio clocks
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87y1pqt4vs.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1pqt4vs.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 26 Jan 2023 02:19:27 +0000
X-ClientProxiedBy: TYCP286CA0203.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11323:EE_
X-MS-Office365-Filtering-Correlation-Id: 328258e9-8d4c-4b4c-8997-08daff43bfc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UD8301VYXwhy1OL673cPzoiHonYJV92yXxecdRUKx5SyBJpdpdWS/sNhVEmwPJiABbasmotnCQ7G1eWUygPTetB6+x07po3MQRRM94Xxj6cW+1DA4cgpiHB44ah/Equt5778q2iLsvwdNNTBQavhrlDUHLHvKONfLhd/w87lr9FvIkeyJIzJRw07a3PB8DmnDjQ4dfbrb0dOXYnzb3zNcU4osf4fTlbJf4wW/0RE4w9MoOA+gBZbP2M+7tsyYxDpofu6ByQEpezyVubYJj0jEA0CZFXTC8eoMO9YjaK/26gW5knyxEZLt6lk4rVIgifEquVdTkbU1n4q2tCx22nVAm4O8glOARRrAR0muk1OKx+bclnIPmvnJYILyOM97FY8VL2XavV1Ej/iPk1huZhbxWHsKJaGejFojQSMUf3pNJ3RnxjXOe0pJ3RPneinSA95+cF0io3QRDMgKjiKWJi0FblFpAt84k+HZOlJT9do7YBrl3DGa1o7u3JUOgzykTwybb8DUcC7mS74LDEo60JpJP+Bzfubbz38EzIlCWtjwbU/tzd7wr46Sw/zYnMfpzXrwgI+D8rjiDuMSStwiIl3vhfdKO13ZLG4+CZ3HFJhLe7abqr3tKpv2sb2hheDhpwSBOWB/uQz7vNokHwtr4bEngGkewsy2MixRkqQ/a+1s43doqVRbRV9GyTS01FcLvZz3uuGFl6KgtC58mL4y8CNVKEFNk9AiwCgKgqrck8lljH72WhsUXLch/94Upl7ZJ5s
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199018)(83380400001)(316002)(4744005)(2616005)(2906002)(38100700002)(36756003)(52116002)(38350700002)(478600001)(66476007)(8676002)(66556008)(66946007)(8936002)(86362001)(4326008)(5660300002)(41300700001)(186003)(6512007)(26005)(6506007)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q/pv5zgxxDEUnCYrMoiKAxdYDB5TVOF+JzUTTX7ZjVPgg6ZA3nSEDoP47TUn?=
 =?us-ascii?Q?dq2w4fj9dfvlZTxogr8TO5qXf/+bQIOItbuzezFMCSrlVoWG4DvnyABRUBwr?=
 =?us-ascii?Q?pZ65KJNCAbly/qolXsTX/p01vvtmLc429Pcl5rGh+baPD6p8lcOzVOqwWYls?=
 =?us-ascii?Q?kLJPWnRwsK3b7WlonVDxfm+ctzKjNmbPjNY8oMPLoDwJgyWvgVaPYHGXl+/r?=
 =?us-ascii?Q?ToqKZIKB3tiy8FzonmPYxuP6FT86BiDqSemtLurMWbVR2Sa0Hzpy5HlEf7Dq?=
 =?us-ascii?Q?JUfItlUz6DvJw1C6j16qQSLLNwqB7GIskJRrlrZWBmFxWw9IwNqK4d9Dj2++?=
 =?us-ascii?Q?kgopubppekXVTMMGERNxcbwTzCWkqfGmB2oh8hPhKdCo/LcKmRvH1JRLAYUH?=
 =?us-ascii?Q?oxMDQqFvM8b1CumdMZTtn1u1E0bBAa/gsTikEyEXcC2/yFJYZjpHBDwHXrU+?=
 =?us-ascii?Q?VwyyL0LquM05foBg8lVoMlu0tx+1XtOTyagqD6SJt2yutVmSCMStzCnQgFZ4?=
 =?us-ascii?Q?j0pna52tsqRSMB9hVu+fV7QGto8bwOMmpm858ujcBPrK47l5BxDz0ZoQv0am?=
 =?us-ascii?Q?5NIMALXVMgoHa9Xu50mkWkMwn3hfz1xLxfldbA27qGKHhT6wzPW8bNmdPR/f?=
 =?us-ascii?Q?3MdEEHRLMHftfBXsOM1mU6KKoLZ69onYqB0G1MLZ61DbS2cF5FRXD8hHdLqe?=
 =?us-ascii?Q?tmrRqgdc/jKYUh9fAnStU5RmtotL7ZMEtvwvcEmBqaJIpY8myapS2eDvTzX4?=
 =?us-ascii?Q?FlYAoTucCM7vMXjnC4Cm+2AoeTn+g8JH1BzRQG4LfYyt9G0gzbj9MkKOHdSC?=
 =?us-ascii?Q?JQNo1sqI+rAxVk7Ap2WWFZ7Xf1VdsxO+9ujgE6yJHVDFd4b1ZEAkznYAMIJn?=
 =?us-ascii?Q?5GNf/7C+LyoDhFKwG2iDLDQw03n4753lPeg9Y0iM5xFabksTmn/VjJ0U/UZ2?=
 =?us-ascii?Q?kJBrnr7aI1ssgULC9kJX90rzQFNDclK0c2kWjOx2z/Q1R8n8H5YL3YgyEtN0?=
 =?us-ascii?Q?KOv20lXHZg5Zqcdg5sOTrJ02G/XR5jh72D1BEBVxM7ZxZl4cNZ31iKwBraly?=
 =?us-ascii?Q?GzCMqTy/1J6In07H91J27s8QygURij9YElYYp/ygJZwag0yy4rm7pvrXDXW2?=
 =?us-ascii?Q?h8waxMur5gzbqjIpyQuAOoRrOhz1hQr2X0RdCDGqSHmIoGJjaapnqg1LJy/F?=
 =?us-ascii?Q?YqUYY29R8rv4opwCuo/XwIVQLaM8bzsc+Zp/DmJlpNvIryEkuZPsR6mD6SD3?=
 =?us-ascii?Q?/4z1NJNpikzdG6hXa1ZQL2EqgnmZNRxOEPNh8yWLnePTnGpXekHB7tc4yFgF?=
 =?us-ascii?Q?1/RIWX2+Fe0zqP63T/ohfp2PJWVSGnjysZjKrdJ5IsyeICFbUPhblG4q+F9m?=
 =?us-ascii?Q?IYhrbdAcke2E4+4iQp9rqgoJCrY0EPqoN6XEWF30gF/LvX2QigmDkILzmyOm?=
 =?us-ascii?Q?ZQdMTvtYYpy4UEAi0PBBSjw/Q6mX694a2rTJD1fJG31NQk/e1T2/lYbPdYD0?=
 =?us-ascii?Q?FPPvU2pDoc7U3XmIqTURT0hHAenivjoDOY0CrmYRXS1M9vxk6/D3ciuSv5zx?=
 =?us-ascii?Q?mqxoyMLTdXV9nyZfOBPAPkm72B0QY6YwdTP+hLGpawo10NeUo77AMcrcERMJ?=
 =?us-ascii?Q?/ymfQqMd1Gs0xsyMp9FhPcs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 328258e9-8d4c-4b4c-8997-08daff43bfc5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 02:19:27.3038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPaPcALzAB+jFFoweCt/+2A3VHEk2es7tYJV4J6PjO/ID+/zz1QkOeLcaT9Y+uZvGhvyptQHdziUNDMZyE1RmkIIjvL3XybA8pslMVfH/hOHIF9UBbzrjNe65XTkxjJf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11323
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
index c6337a408e5e..1c95aa1cd07e 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -202,6 +202,8 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("pfc1",		916,	R8A779G0_CLK_CL16M),
 	DEF_MOD("pfc2",		917,	R8A779G0_CLK_CL16M),
 	DEF_MOD("pfc3",		918,	R8A779G0_CLK_CL16M),
+	DEF_MOD("ssiu",		2926,	R8A779G0_CLK_S0D6_PER),
+	DEF_MOD("ssi",		2927,	R8A779G0_CLK_S0D6_PER),
 };
 
 /*
-- 
2.25.1

