Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D366F76A52B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Aug 2023 01:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232116AbjGaXvR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Jul 2023 19:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232120AbjGaXvB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 19:51:01 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2131.outbound.protection.outlook.com [40.107.114.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ADF32D4C;
        Mon, 31 Jul 2023 16:50:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtZf+PVrrtXT5RH4T09Qr5/Lm8xW1bjNCdgz/dHekeQUm3GgKF9FE+/bkZp3TfWuQANFoLxnvoGeSpvvr4ZS+RuF2Wzj0Hmpkcx/eu/+Xa/ZKrHp90fdcGDo1w+e7an28T5Ljln8CJxU7yX45u+VgtS7ZwEXaaLcrgXd4CIAqR4asnuP71LJEcmhks0yEJNCiIpXz+fx5Ol1eUZ14zq33+2GoAhkZddeY7/xvC+UqzRGpTxjXZppvXavKeEK4QmSu0a2r/SvOq8ux4LAgdkK4fAu6wpSFCVQBTRMiC8lbkKY0B7NHSqYIAwKfasCoZ3hxMabQb9nVo0rnRoF+b8IuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9orcNDFQqBhC+0dPa+Ilh2IA96qs4I0nyCE/tRGBV8=;
 b=nKB3sqV8cpExinMSylnQxzgOfpMyYU64UjjOMrFrlD6ssnQSZRgfnSIRKrKtdHUzmA/LB5qJy4DOaMl9QHX3cAAXYxjVkgBOXevjgCslN7BzvSXx0nEpfpF7z51ErO7hdPFkS8x8VP/4Th3OVP3Tp6aEORZ2I5Gh1dedKdZaUHDxGHsIKGxMQKzbWwK1m3V1TyKWjmB2MVQ8G20tkI9yrSdE3D7IvPIf6USK91D741VpnvaePyLr0+7UUDT6w93elXpaxYn9hcCyqKaCFEGi6ZpHM72pnzQO724bAVhtND0hg65o9AalUnDz/JVEbyBl2xK+mJBiH7/BPGK0kseEwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9orcNDFQqBhC+0dPa+Ilh2IA96qs4I0nyCE/tRGBV8=;
 b=GNK2EBif+WDtBP0bNPCel8lXUI1HbN9ow4Eb7BRrqyro8PniE16QJutuWaPCS5ons7+0oetRGnCohayPgW8g0+ej+FezOUn/qXauOWQPzEj+VMs9517Apqznt+Lo3x/3W6f8t5QSp4cxkgtSJ407Vxf2bIDoIReaqPbIrVXOa7k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11995.jpnprd01.prod.outlook.com (2603:1096:400:3dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Mon, 31 Jul
 2023 23:50:04 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 23:50:04 +0000
Message-ID: <87h6pjpro4.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 7/9] clk: renesas: r8a77965: add 922 ADG
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk@vger.kernel.org
In-Reply-To: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 31 Jul 2023 23:50:04 +0000
X-ClientProxiedBy: TYAPR01CA0160.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::28) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11995:EE_
X-MS-Office365-Filtering-Correlation-Id: 7180838f-c8fd-43c3-2e9f-08db9220dcbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xzvXAZ2dVkeDPpIaNrW4mpQnMxMfRrMNvpaFCovhWYm5pPG2neh4LLONR+XgPvKFo0obcQtwwtpJ6otXMCgqhwg9PRjjHfrVB+SOSiuNDyDHLkPUOsf6CCV2jRqqIKaveAKY9KIwZKEeDgF8XLcMEtDCgUF0+UA/q6On+bxhX8xi3Ef12apf+NNTVCcGuEaN33g5kVRl7xqPb25ru9pXFQTb6s2Pla7xtGBr9i3m8F/TUN2xSJd4vXCE/AIW8wrtvtXwLs5r2umTFTX6MgZkaYFPZgH9v6PVu7Br/xPUjwX0uCuoWhR/Msi3IN3MlqSM92dQIW9e7akimL0s4PpPK7LYEB+0CPcHuveC8oRlL/gBpHv0Nq3NhXk4EurnXz3uQHm5C5WCtN30r3pKwen3Lozsqne7ckeR1P9wwoVlk/vJWojfpy+EMIB8eTrzZoQkyeOf1ntPKm8vdctHUEUNG7HEIGjTjoiwGWsRJpPc/rynh/dRvLofl86gqB2u/avwDZAYgjKHB8lndFTwu5futoxdc/tpwi71l2qd0COOCzJFPIWhvsNyY97v2WGSxFTOY5Z6EDYqEmF7uXWK4g7OmBHVPwWMX7tOeVFYi/XUV21LLpvp5bcZHPACxF80X6ql
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(478600001)(6486002)(6512007)(52116002)(66476007)(41300700001)(26005)(6506007)(186003)(2616005)(316002)(66556008)(2906002)(5660300002)(66946007)(8936002)(8676002)(38350700002)(4744005)(86362001)(36756003)(38100700002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VogCK4SAIiqn43kG5FHur06CXpdtEO2TuMmvTFGNbUOA7acDuntHC0HCD8F1?=
 =?us-ascii?Q?r8nLZxf2EzxeaI4WsG7P+tIMqiXSRHzsPJ8c9v398iH2xbYiqlgmNWl7L4AX?=
 =?us-ascii?Q?Mpnk3xd+Kvamh8BJQJtQudrhmtBm8PfumoR/TYmSIpZfHKeU2bSV1HJNeVU4?=
 =?us-ascii?Q?+Zs6KB//W5IQyNRxm9DnfEnl1YBAvdYiUf7eXlPio0RwiC2osq3rcqMbM2RV?=
 =?us-ascii?Q?wHvJsx2e4905Wy6HIxvY7O3YW9sKpVY9vkif/448CYocmGa6igxa/G/Y3qXU?=
 =?us-ascii?Q?x1nCrr/q4fG/X60g4Mx9+iP8c7g3VD2V5vGQN1j+MFsi9Q+msg5YKq4KTNIa?=
 =?us-ascii?Q?wrrHO1l4tD9iKvoNYT7M1YojTwBGnbQucCcpMeAquw/AUTrr3J97Sw5p7XEE?=
 =?us-ascii?Q?1l5aYjGv/SwUjrBCeSacI4kZJTfNeYjb7GFsogq+NpvMOgVxGTHhpc8Zm7Uu?=
 =?us-ascii?Q?EPAzLzA+l3V4sDdnbB5h0Wnw8wpultRZn2pAFUiQ7Qg3mF41aW7rwC7XcabO?=
 =?us-ascii?Q?gMfkaQSAc29gOhQ3GPcSOE+IaomGQSqteEOuf3MjpTCwv4MxdXKxtkWfzUMr?=
 =?us-ascii?Q?PoUCfIsaiH/2XU1nYL1LSD+y0RT3GVETUhiwD5ehhDSi8pT2IEmK49lDyVR4?=
 =?us-ascii?Q?KWBjbBni811GyZMv86+C8GP6utFbaEvLPHilqxYsmfxidYsZYYdVautqV4pB?=
 =?us-ascii?Q?4Pt8wY3kFKEBFLwQkqMbWBmYmf0lh2kcSngDCvMv/0qxl1efrpjuwh3b3z3n?=
 =?us-ascii?Q?ID5Xxel+a6g/shxYs1+M8MjDa1+snC0iKzonnZ59H/lXT4OXYTuMK9vN9jjd?=
 =?us-ascii?Q?3HLh4pSqqIoqNcSGsX0t/qqqFTO0ePXSIVNb171ckV8u29iFM0WfFBSyBNGy?=
 =?us-ascii?Q?T4W7BNTruwDZJKuCVOTZjUA6Gd0x6JrobgwwqUWEB12iO3a1EMYkhbrDoRuD?=
 =?us-ascii?Q?7+EkvLJIyvo0JXNXJwtA1imOLWH/FcrjgUniJPah2Kp2hf9To9ojxoDnKnMW?=
 =?us-ascii?Q?qxcv20JWFx5nVNQUDvsltL0KRr+dGDdq4i3l6YFMwbQ5qdMhkCdG/3qcq4Fo?=
 =?us-ascii?Q?3sGnsszBZGDMbT4SrIz43mk1PcUgmHHQWm3ebBkSrDV/EMXGPz7pmaqbD6o2?=
 =?us-ascii?Q?NmePZMieTD3/WXbsidhMk48QnGzvvYHAyZ5lB1Gs96C6kkFIRyYY2wnO8HfQ?=
 =?us-ascii?Q?kmCsa6WjGH3SPebK8FVVeU7tqlhu3a+aOum+fSVNtpyFO4KS+K/gNGV+87+D?=
 =?us-ascii?Q?wT3Nh09+btsSqXUUDZ+abu6Vgsv1lr6qU/xOG0aicBWhbgckxFKQQ2HWREF+?=
 =?us-ascii?Q?A4Jc+5Nj6Jhg7AtaopuXZIuxJLx1x8XCfspEW50Lc6sDgK5sUxs67kc/G6CA?=
 =?us-ascii?Q?WdVV026+b90oFqDm8rlWbsX3qUxdVBpz3kxOYualAW5TKGS7NSScKyWstsp0?=
 =?us-ascii?Q?BwsAVOgKKBKmLg28P1R1OyZcBQRDg9udpslezHBJaaGnL2yrNGiUblaUYz/w?=
 =?us-ascii?Q?zUQzRir33iN1tKtH/GwziTH0B38kdVbONbjgJqhmk3Dvlx/GXw1ZK47wzWX2?=
 =?us-ascii?Q?bEAel9fDAJMWyC8p/fkOm1s09dQKoVSCLCp2QiKHat/IrZwwrDYV8sl5+jSY?=
 =?us-ascii?Q?lkEHWV9wwGNHM6eBWf0HWNA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7180838f-c8fd-43c3-2e9f-08db9220dcbf
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 23:50:04.4075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ke3QABTWqaIrdyLpZsX+lRc1h3aSNZchQEY5gLLL7aq3eX1rxPhYyVKnzXTWlIIbQukaWOaFyOg8kq2yqEoMToukPaa8YwnXRMkvd+apk0oidNER0bHy9f7pYL4N5TX/
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
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index 78f6e530848e..48aa4bd8ee4e 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -236,6 +236,7 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
 	DEF_MOD("rpc-if",		917,	R8A77965_CLK_RPCD2),
 	DEF_MOD("i2c6",			918,	R8A77965_CLK_S0D6),
 	DEF_MOD("i2c5",			919,	R8A77965_CLK_S0D6),
+	DEF_MOD("adg",			922,	R8A77965_CLK_S0D4),
 	DEF_MOD("i2c-dvfs",		926,	R8A77965_CLK_CP),
 	DEF_MOD("i2c4",			927,	R8A77965_CLK_S0D6),
 	DEF_MOD("i2c3",			928,	R8A77965_CLK_S0D6),
-- 
2.25.1

