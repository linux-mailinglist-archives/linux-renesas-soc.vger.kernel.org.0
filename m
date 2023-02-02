Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 360766872B2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Feb 2023 02:03:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbjBBBD1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Feb 2023 20:03:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbjBBBDZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Feb 2023 20:03:25 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2101.outbound.protection.outlook.com [40.107.215.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2CE34302
        for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Feb 2023 17:03:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0hHvcxeaGLcHl09G0325EI3wByByjEPPUvXi3UdlGo848UCyBfExuV6zTV0VDglJOi8Z9NpY3IHtNuSyqGviMR1Slltbb17lyfz4kp3Z6bGGL45yiJ0yZZ9S+VVPAcT1V9ZR6D/KKdbZhwbkdfsUlYtFLJ9pXGIpCgz6b+gqEhzRKPg+/VR9kaUaLA7Xa7fH19Z3RGqw+gV+tsl79jT8bWV+EVQAw9MTHrofMSgORUPUvNK6vadyUrtzLrVtaTod7oWn82Sj1F5ryYwrJyzIZ5ftxJOPMgb6p2EHhFu2oepZJUwS84p6AOdECZ6WCO2fmitPkr3xwkqfynIdNessQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5GceCtMI4luMRTCVnBRnxIyV0TL/Mu2ljkXFX5kARF8=;
 b=UgDCpkUGWBI+8azEgXMR+mZ42lWQ1EsAqhpJKG04R/OYKnrJlvHOaNHABG4POMQFzntqyfBQYk/3lNjGbwBDkCzMe2lP/k7PpXXZDR3y/YOyhgB6DL8XoDv7JCDBSoPxvllAUJGDYNkshUccUI1HfE5QExccNXx0txuSoHcGxNLrKUKHLbsiCdwmtjJZgOwPpo3GsUmcugJ1nQ/YeBZNlQ0hHurZQRRgy9v96O6UNIxwY51b90Lb7zxFKcU7DmID3nBwt9aYkjctxWJZ1g9/RSCwjIbuEiLj2k4QEzkTJv27fHPsTUO+rVAfh+8q8xeLZIVSiUADuoJknhguzzl42A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GceCtMI4luMRTCVnBRnxIyV0TL/Mu2ljkXFX5kARF8=;
 b=Kxp3mdQ4ubjMAi1pC2VsSCq5I8jVTmmsvGRb/XkriKaAIjNz4q6nGlV5fqhDMAqmqznJiYM/1EIwXY6VeQjQAcIIbJHnexslnWaDfKyfqIoimK4skxYkbjhInwZOFCyBJtFuhvEgS2oo66Rv1l66+qOXWnJD0oN+JRPBUJ4BEMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5959.jpnprd01.prod.outlook.com (2603:1096:604:d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Thu, 2 Feb
 2023 01:03:15 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Thu, 2 Feb 2023
 01:03:15 +0000
Message-ID: <87a61wanfx.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/9] clk: renesas: cpg-mssr: Fix MSSR register range for V4H
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com>
References: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 2 Feb 2023 01:03:14 +0000
X-ClientProxiedBy: TYAPR03CA0005.apcprd03.prod.outlook.com
 (2603:1096:404:14::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: fa5217b1-c9d8-48aa-deb9-08db04b9436f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZLYdcFbl6RvGeMS/DYjkTgtGGT/7mMXjO7BdQ6Fw7/m05wMDaXk58xCkTzz9u+A4487q6JuGpTmYlVwRA2Q2dCMKQhFuX95dPbePfSqiwciIpc6lCD4sO6t6SPLKj3ibb56w3B8MWARJlZqUjN2kiESIM3Ohx9ZfxOFx8lbzhoOUE2I35l2OFE0B+sZUsTfMMt3iL17tGa1ekiIt04socGSVxkwbN5K6a3lQU5nkc8PcreoDSnIttyESQQsoy5qZS6JRw77CTRKdehk62yw47lPq73zjlljf7nMdjCtEYxd22Gywh22isFrypjqTJzRVxp2+ONqYYcAnXK30WooFKs3E6twBzflT2D1s1690oVmbGZOjaZyQF1knhp1J6NQgfFXpYagIBQb1bieyjcOSpLFzstu44MQGYbjQYd0vxo/VbJ3efN3LXBswWa8eOkd3GZ8kIRqcICamc7nF2t7rjn9AGHbJovgX1v/vp+IYA4J1bAiNXaGsEnQetBHiEy74+1KhpwjS7C35kAcDVseOzbrC4U3n12Hl16Bu4s9t8w1VQl1NHhrBWUIdxnxAih4DAGi8d5Vk9AGzdTfWb1m9pz4SFtzzYeGlSdnVEzmEGOooLNtWQFCenlAF8z9T2Wjqh9OfZyw/YkRq1jyf41lNPw22uA0xF8XbqQd0/BQRec+hnF1d4epci1fhjlnrtv18VywXOuGjDHW9Zj1AF5w8dQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199018)(36756003)(86362001)(38350700002)(8936002)(38100700002)(66946007)(66556008)(316002)(8676002)(4326008)(41300700001)(66476007)(2906002)(83380400001)(2616005)(5660300002)(478600001)(186003)(26005)(6512007)(6486002)(52116002)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qx/b/wpvyRUbPB1LJ08OTejUH7R5kTYuuuAvXD9akgFkiHkwnukxB2u5dOnU?=
 =?us-ascii?Q?ay8i6dPivxD70EDtewLmURrYb4XtnAjUgNi9XrXsv6gPeOnOA7FdLqAyM+mW?=
 =?us-ascii?Q?bzK6bbK3AkZIkRy93l0rtKuxH8lWrrfmn72obGnIRyF/50W+cDaJbrYLGdXS?=
 =?us-ascii?Q?aoXjeT8WF8DAMeOKc8+nLatBQD93iKBQCf25+aOnq+5Jd+ARFgrZeOH7bL0i?=
 =?us-ascii?Q?q2lkkK2rsjGwb756CQfMq2EHCnVbXXrOHYnbIZZ71eDQHtVF1sUxszuIIo8m?=
 =?us-ascii?Q?IFsmpG4CeQdERJKO/o6+y+hwnykWx8RO61+XTUohgCDS7DqfJ+yKWmb94OIS?=
 =?us-ascii?Q?MoKbBpu5GHJTjGuJvOfDx/3uKtd+B9mYYhrzWppE32wpSN/CRb8Uvx02+9Je?=
 =?us-ascii?Q?+Xh/LNoioAAWKYuRhzMb3c8Je5dt3/LXDzm4+YeViqcfEDHxz6QNjW6z0+2T?=
 =?us-ascii?Q?uZ126L6YbVD5VR2KKz0h41AB34Do+zZGHopEPjtuqkRJBTufMkU08uZQ7kP5?=
 =?us-ascii?Q?MfmaklXMkJQ7e9I7g4WQWcLQbHFOAQRoa42t2BGMJhOlboqILs8C4otLnjPw?=
 =?us-ascii?Q?xaTj8SykZHnrQwP+/Smom8ibdBFddCwr02xsng6PwdSWTzUeNe0orBoxZytS?=
 =?us-ascii?Q?38VH33r21vaFaqvXas9PoTOr270BdZo4X9ZRRzz7uEyUzaQkL9UBLG8xMvu1?=
 =?us-ascii?Q?2AtYJq2eH7p3f4HQgNrXxFU2Xq7FB0a92b1BRy85eqFEXxVCYCxkW2DF9D8z?=
 =?us-ascii?Q?MSrVyV3hSI93Fike65sKnOwk5aCct5/jJiPdLFaOAStkDzazEcjAJ59aLi2o?=
 =?us-ascii?Q?uB7E70IEjqk687TrZ7ee4rbcoLgJVWSDYzYJWS7556AS+ZVq0f59Plev8NPH?=
 =?us-ascii?Q?XBq9O1uIe/SlvtY86lyNY+uVtFJm9yN1+QHnWSGtSxeLG+mIpzLG9cmQUpue?=
 =?us-ascii?Q?pzGD+zNJNBggS3DOLe+SfMwIhbFMnMqFjJLP+r6j6PddogVgwhApIqIsP/Sc?=
 =?us-ascii?Q?I1BnpoHhHVsT1eQYbIe2AojAjlNL1s0gJOG7H5rWd21FNBy6gFIvda2GkYou?=
 =?us-ascii?Q?ZoTk1bcXRTa4j88+jPSHCueUgOdKa284IYtbm/td6wcokkDQw32J8vgh34Hx?=
 =?us-ascii?Q?nssAYM173ZUwj0vCq88LjugTtUE69kItkh3ACRMLr146A9e9dPxye3NF/Oba?=
 =?us-ascii?Q?FtpicjaTMuFPQijIm//t51LW0DlhCc4btXC35uyS9qVrHMDhVvqiBceGBFwa?=
 =?us-ascii?Q?fDbGmXCfw9GZ5a6nvuyokKb/EUEt2Ylzg6XGC9L2b7KA5IjyNuKkRp0IKYcX?=
 =?us-ascii?Q?msJp9uXNV2iNlNIhQ1nZ7yio5x6n9UHgpTgyP6NMHi7aW9Yrg0NRvQPCksA/?=
 =?us-ascii?Q?hfDz5rJYINz0M3Y9Xz5RlImNDXRzfyuweQT3CpZ1fcAMs4cxjKtxuE/YsPf2?=
 =?us-ascii?Q?6IA1AHHWFkeS1YDqBCy4fQOtKxx2K0Ds4OPNpy+qVexuHKu9TKtmEAizrw2W?=
 =?us-ascii?Q?tO/qRq2HhM4/5JILn3V5QFoU+w7Kwm30W/raNoGNjUqCE6YkvCBM++cbpilD?=
 =?us-ascii?Q?XLqzds4Wl+Gx3s262eQv0g6oXC/7XG9tncxymrKR07NKHBhZ8wG7/q1DCKAe?=
 =?us-ascii?Q?e7yF5yCKfoWMPycCl3eUiZI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5217b1-c9d8-48aa-deb9-08db04b9436f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 01:03:15.1172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hWHHWQ4JEA5BUvLesFYT+YAwtFfacbhNyIkVqsJNOwz4wl7hqHrWas1d56rbTdiTE4VuFN9cvVicVZz26zUZMHBeqvP9Zf0W9sJj6X5BKMXsb366FEs4YFSDETiDYMHS
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


From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

The SRCR, SRSTCLR, MSTPCR and MSTPSR registers for R-Car V4H (R8A779G0)
each have registers up to offset 0x74.
This patch update it.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 202aeb232044..3b899ffa88b4 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -61,7 +61,7 @@ static const u16 mstpsr_for_gen4[] = {
 	0x2E00, 0x2E04, 0x2E08, 0x2E0C, 0x2E10, 0x2E14, 0x2E18, 0x2E1C,
 	0x2E20, 0x2E24, 0x2E28, 0x2E2C, 0x2E30, 0x2E34, 0x2E38, 0x2E3C,
 	0x2E40, 0x2E44, 0x2E48, 0x2E4C, 0x2E50, 0x2E54, 0x2E58, 0x2E5C,
-	0x2E60, 0x2E64, 0x2E68, 0x2E6C,
+	0x2E60, 0x2E64, 0x2E68, 0x2E6C, 0x2E70, 0x2E74,
 };
 
 /*
@@ -77,7 +77,7 @@ static const u16 mstpcr_for_gen4[] = {
 	0x2D00, 0x2D04, 0x2D08, 0x2D0C, 0x2D10, 0x2D14, 0x2D18, 0x2D1C,
 	0x2D20, 0x2D24, 0x2D28, 0x2D2C, 0x2D30, 0x2D34, 0x2D38, 0x2D3C,
 	0x2D40, 0x2D44, 0x2D48, 0x2D4C, 0x2D50, 0x2D54, 0x2D58, 0x2D5C,
-	0x2D60, 0x2D64, 0x2D68, 0x2D6C,
+	0x2D60, 0x2D64, 0x2D68, 0x2D6C, 0x2D70, 0x2D74,
 };
 
 /*
@@ -103,7 +103,7 @@ static const u16 srcr_for_gen4[] = {
 	0x2C00, 0x2C04, 0x2C08, 0x2C0C, 0x2C10, 0x2C14, 0x2C18, 0x2C1C,
 	0x2C20, 0x2C24, 0x2C28, 0x2C2C, 0x2C30, 0x2C34, 0x2C38, 0x2C3C,
 	0x2C40, 0x2C44, 0x2C48, 0x2C4C, 0x2C50, 0x2C54, 0x2C58, 0x2C5C,
-	0x2C60, 0x2C64, 0x2C68, 0x2C6C,
+	0x2C60, 0x2C64, 0x2C68, 0x2C6C, 0x2C70, 0x2C74,
 };
 
 /*
@@ -119,7 +119,7 @@ static const u16 srstclr_for_gen4[] = {
 	0x2C80, 0x2C84, 0x2C88, 0x2C8C, 0x2C90, 0x2C94, 0x2C98, 0x2C9C,
 	0x2CA0, 0x2CA4, 0x2CA8, 0x2CAC, 0x2CB0, 0x2CB4, 0x2CB8, 0x2CBC,
 	0x2CC0, 0x2CC4, 0x2CC8, 0x2CCC, 0x2CD0, 0x2CD4, 0x2CD8, 0x2CDC,
-	0x2CE0, 0x2CE4, 0x2CE8, 0x2CEC,
+	0x2CE0, 0x2CE4, 0x2CE8, 0x2CEC, 0x2CF0, 0x2CF4,
 };
 
 /**
-- 
2.25.1

