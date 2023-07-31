Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56C6676A528
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Aug 2023 01:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbjGaXvB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Jul 2023 19:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232129AbjGaXuk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 19:50:40 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2131.outbound.protection.outlook.com [40.107.114.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9373C1FD7;
        Mon, 31 Jul 2023 16:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VouuPhdNzznm4tL8X9wQP6ObhaR0yR7v/tqb7juHlmew54jVfwsoxoq7Povc7xJSotVkGv1vXIQFcEZUAhqyyanYc+RvwAnr/48LFNHhncBk09+sKUOkzECdCnm96ivdbC5d6Cc/5F3o8QIgTGhrOVwUw5x+IBBWk5wj5L4FHgulzI9NW298E6+9B5NKxfYsgp/+WQF60wRkWgtisPoL07pUhARdYYwZnZYZ6E+q04+ohsRNHVW7Y1BpSokfv2d0BmZisvP5HDHUk9J/LNL57m1WvqSfTJ1KvWfb9MjJkrNRqVD6Ldu3aK2MAHeGw8d5KhyoBtSvgWkdns4p8D5dmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqLlP+kYIvVOBY6ji3xqBhCybW6O03TS8wahYAVMHRk=;
 b=ae6WkWmRk5HM8R1jbgC9Ls6RXOO33Z1eAmb6wiyD/b2dSxyZ9mI6ZfzMip+95P+YI6xLjgqFl2TMuDjzA9g9keU/CjMXoYKzVZZ1H6e1eMgICExzYC717hhDThR+jvovWOqabNdp3uoyLryeAfEZx0kbnORzu8jKJ7sqfPxamkk1FnhyXywrvX/JFOsCDY8S2g4rRDvYYg3+9ufQ93e+aXMf6+tv+YDYjWmQqPIg3yz5fYlWmHlPr9zHBaRNPGU3OdqEQsUu4/dk9N9qd3lFBCju5lpMF5cjAJDAshrEMbuAFCfN1uXoI0UvTVchuy5JKM4IoMkAzj66FYy/fpDNyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqLlP+kYIvVOBY6ji3xqBhCybW6O03TS8wahYAVMHRk=;
 b=JZNZtfFKQu6S2pUds2yt7LYTnoQ2nCuNoVcH74lHl7CXqyYx12c3jTEWwQjHR+78VCH1eU3xb9Ce+sHsKtgNkUOLGpNztavzmpgP7XKMZzQZbGm6eATnxRKYPP1V2GQ+Y/akUfyp/2QgR9CRz7U8Bq3P72P6NYlspUKK4+0DFpM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11995.jpnprd01.prod.outlook.com (2603:1096:400:3dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Mon, 31 Jul
 2023 23:49:59 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 23:49:59 +0000
Message-ID: <87il9zpro8.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 6/9] clk: renesas: r8a774e1: add 922 ADG
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk@vger.kernel.org
In-Reply-To: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 31 Jul 2023 23:49:59 +0000
X-ClientProxiedBy: TYAPR01CA0162.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11995:EE_
X-MS-Office365-Filtering-Correlation-Id: 30e41e49-0aab-4984-34c2-08db9220d9fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MrZ+WzlNSryG0SVoT3XN8aeCsRQI0iCFKNugwVT3FrCic9vnbXvEkZWmLH3FVbhiBG7kT7CLQdDZY1HWj8FaAqzkgmBoWkZTxlZTr/Z2djOyBe8INrXHFwY6NfWyqta30u1eXM1KiodMRp8CJnrFkmBbOweIGkANylCm5hOVJpk6ExbZ7HOs8sMaJVYtUO7df7FMkDFdeaQTSy/4TQg1tA8Et/kXeXK5gn06+yKQ1MehFffYYUno/04XHoQV2/pT7/TAdHzKZMLM6yzas5awePXORnALN8HIYmOGQ0G7SYRAYKbF7e695Ztt2PhxNS1i3o1sBix2LM88G0yoeI80OuuDEPfXgrGfQOkOxveRZSp1VSI9NKS5nn4Mdx8To4LED4qfNqRUrsOF7PcDr4qA3zLDCx5tXEpXncAdArH7t40armKaJ1qOkSGp2f2MP1fkRrHe/NEucyU55RECdvmKTBe13YMn5aAuwgZUGlEraBFtNb6p7EGEhKoFY4kx/mseHfoLAZiYnOA6gmaiV1AQo47s86xIaJcrXVJAK80F3/0Xix6y4TurrCihKtQjktFrfDrltbuq2Gr5iMiHw53gExrNc21xapmZU8PBsa45LvXAzKpCfBgvaic5eTDplncD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(478600001)(6486002)(6512007)(52116002)(66476007)(41300700001)(26005)(6506007)(186003)(2616005)(316002)(66556008)(2906002)(5660300002)(66946007)(8936002)(8676002)(38350700002)(4744005)(86362001)(36756003)(83380400001)(38100700002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nEdTGcj1RAwKGLKieV2wvIVhjWwB0otms2DNN1Gp2GSsrAiCuOv3/U3FqtV6?=
 =?us-ascii?Q?Oo7yNmz/dbpF8o3uwUBXGnsXe7M9x0imy6FqK6pdsLd7dlGCtP4s9bjErUeO?=
 =?us-ascii?Q?4w8HlbTfBu9Gm7s+XiTwes0D859cJott3qCTUtu+87Te6Y//+MvEjOLVeDBe?=
 =?us-ascii?Q?lcxopoAjwjhgeDmH6CWYUhSMryejtKa7CJtWo5nqlUsduW081Rko4P0xwmKa?=
 =?us-ascii?Q?tNWY0iLgGeHkRGr+mbXBADay2/5D/nsJNvzvuQYju5uGQbbdOlv48BE4qPLP?=
 =?us-ascii?Q?82BElDPqbsQDy8/8uFwz1dhD+gHlhIWeQTQnT8q+ZkJwjay+d7B6cR3Unc7l?=
 =?us-ascii?Q?0kKoBZJDs8MDlBl90lwEvZZs2xuXjLYylua9pYOFJbXWFlC1HdczdVe4jza5?=
 =?us-ascii?Q?AI4A0kkOICaG2iELGva7XU6OJq1urKWRigsUIP4NcTOseO5XxGk1/Rzvrric?=
 =?us-ascii?Q?wznihXvFkBEhVSwgjG0tQ1kxPCikL8kql9EobxSI3pHzAfu1svokOwZpHZsu?=
 =?us-ascii?Q?oZhrgjiv/P/tFiBZjsWmtURAq3IxI+3RkskPCTlJnQdaQ7XwfaU2tUV2aonM?=
 =?us-ascii?Q?BmxthhpB8CiSqxz3+ye7ifMBOCz/jRoypoLTdwQRNaXMwoUMczuFZL7Y9Zgl?=
 =?us-ascii?Q?/HZE2+vvdkjAE3PBuyvQpDtEv6QmabXwtf10X+nu0AjfMn4ZmaYIipqKhn4D?=
 =?us-ascii?Q?pATQMAvQ0q2K3qSevPEC52Gv3DiYMbCrEooBFNtbTFnqEgEmyMudhsvlCjMA?=
 =?us-ascii?Q?D3AmIzt2it572aSGE6E5XfHQm5eVcoBQ4xmECrRH9oX17sKiD5l+dX/rM4W7?=
 =?us-ascii?Q?j0p5WCLGDcSN/h04tqazlSJy0T3M180tCB8ZWQXtRF7MPQIhzSg9RGVzl4RK?=
 =?us-ascii?Q?wil5ISsJpTd0nqMNEN0y5modJ1xV/Zj5gqwChcsVQL5R9ED2tyDuWJ6rVgNU?=
 =?us-ascii?Q?2SKDVmskJzrnwhT7F8njPbVuWs9Z1e6k6tv85RMR2p8hkH30DnGNTQlH5151?=
 =?us-ascii?Q?v+xJfaX2lH5yJyKx0m2ZUMVpfbjnW6zs8DuV3YmvyyMJhfjMHPO9O7D1slfe?=
 =?us-ascii?Q?VcGncbCTzuqbSZniSd2Ng8ULZ95XfbzHyUrbV0UU0Efun02w3l0lbE3w9lTz?=
 =?us-ascii?Q?jYsUQjMoMJpiHWDpgwHL5V0lcdEORu9j0iy92WP+UEhkTFC4EtfIVgSFVi2z?=
 =?us-ascii?Q?omWg6EUqnB5UB/vYU4rNjb1wn3BJWbRi0JmHMILmbusqVJLRASt3WDFOFAF3?=
 =?us-ascii?Q?bbnxzFS5l+rOt4lCSoW/r5x9uq7/wHWZ/lFRsF0rb8QhCEfQMVpO+n3x2Grf?=
 =?us-ascii?Q?ZBuFdWuljZYmEQlR8rSovTq41QLxZFaWQR7oJ4lhDzh90u4LpS0U/yLtKhp7?=
 =?us-ascii?Q?18WgouaLYSDwggtqWuvdUlsCqrAkocJYN2aHW5vb+3X2FLJuog8XNMI79iP7?=
 =?us-ascii?Q?glWWfq+9yJHhsdRsRZ5L67p0MqvodgDy2jZ37fxPKZ1e9M2HrjrIWuCbpmzA?=
 =?us-ascii?Q?DXR5c4jx/u1NCApB1YYVMrm/xcaTsKDPL8h3hABTXx0a7lVi++3GytxpKxCe?=
 =?us-ascii?Q?9lqESlgPALWxaPPZGB2VISGOPeutfDh9/2vMm/e9aVlXbiTXZM4fP1QfjkN9?=
 =?us-ascii?Q?H3c0tFzOso5CvhxJDjDH3tY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e41e49-0aab-4984-34c2-08db9220d9fb
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 23:49:59.7772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5wyjkJvZ2t4B8YBAX+V/L+peHYFkESBBbljMWjSnQr0fCqBBr7HbM5WSsuR3loiCzv2A0EWhL6q7v/oeVtvjF7e1etikmhs9CYt722HIHXfgvzJbLrCNcBL25ePUd1M
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
 drivers/clk/renesas/r8a774e1-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a774e1-cpg-mssr.c b/drivers/clk/renesas/r8a774e1-cpg-mssr.c
index a790061db877..1a70e1a3cdaf 100644
--- a/drivers/clk/renesas/r8a774e1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774e1-cpg-mssr.c
@@ -221,7 +221,7 @@ static const struct mssr_mod_clk r8a774e1_mod_clks[] __initconst = {
 	DEF_MOD("rpc-if",		 917,	R8A774E1_CLK_RPCD2),
 	DEF_MOD("i2c6",			 918,	R8A774E1_CLK_S0D6),
 	DEF_MOD("i2c5",			 919,	R8A774E1_CLK_S0D6),
-	DEF_MOD("adg",			 922,	R8A774E1_CLK_S0D1),
+	DEF_MOD("adg",			 922,	R8A774E1_CLK_S0D4),
 	DEF_MOD("iic-pmic",		 926,	R8A774E1_CLK_CP),
 	DEF_MOD("i2c4",			 927,	R8A774E1_CLK_S0D6),
 	DEF_MOD("i2c3",			 928,	R8A774E1_CLK_S0D6),
-- 
2.25.1

