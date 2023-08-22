Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3B178399F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 07:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231961AbjHVF6e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 01:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232927AbjHVF6d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 01:58:33 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2090.outbound.protection.outlook.com [40.107.113.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F846116
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 22:58:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbmrgOpWnMwbVVGWM9+J1DMF7ORmNGVVb+AcK0FqgViAUQtkoiHidgTbQv5jmUjnWhDuKOfrQGI94kcja4KQGnV+G7iJI1E7PNvXqtucJkJbSaym2Oewun+OKySSxI0UptfoGGZNaH2nBaJY6BmrpSuzsNy4RBA7bvT5yQEAMpLWXVogK0kKTmIMZgjOzxjrdRzQlbQBBK/ZHzMj22Q5Mn00qX1/5t2PzvblaJuq02ZzV1vAI07CkjP1RC0meKstaeNGk/qWEnw9Qcf2euwZ74DaXaAytuaRr0nIC+znPh2QniNzFOhYqhKfB00AgKZorZXJY88ReUbtY0GfupEOTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zt/zmLxP3pZ4RYP2TW2SUyJNQyyFEAW+O8iYDLpoQjQ=;
 b=BHDsFRTbrOwH8hz4FzYylGt5fi8LMdGbcD5YK/zh+c9ctwRbhDk7pQ7vsxlmXp9GoM3+IT9X8gU7MIdsLGnNyYvtyf3hBv90oQp4gO3AR/9TjXkcQH06THB2Lm+1iSk4sscDZCODqBJ5/c26vNCW1IN+bRdh5cESfdM3L/TZsw2LmSYMOlPfncPeMcOWlOvtiVnLpwCrra8AaqwiGHbYEULsHbrLBTTwXw3jMmJR77zGIEp78B9DPWXaRZ3wMCgDp3QU2GHtGCYK9MWRQHviZZtMig35F4HZ9NOHDvC5SWYSXV/iEbLxEmPNkWJ3n77Jsh6S1bhN6vdkCBmp5hrnrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zt/zmLxP3pZ4RYP2TW2SUyJNQyyFEAW+O8iYDLpoQjQ=;
 b=N1lZ/88J04uqWj1UGMhM13gcjOBOzBZl2MRWWuRRiKqTjahl5RMOp0IhopMExCWnz6mvpePAIy8B1WF+k1tNuOI4rB0X2qjhSfW8otU/qo/whHXskOIqiZyERCQoawwllcgEAsbb1XbdnyKLU+plBzpZ1OkfoO2jUcBxYUStRjA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11746.jpnprd01.prod.outlook.com (2603:1096:400:404::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:58:26 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%5]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 05:58:26 +0000
Message-ID: <87pm3fsjni.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/15] arm64: dts: renesas: r8a77961: handles ADG bit for sound clk_i
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 22 Aug 2023 05:58:26 +0000
X-ClientProxiedBy: TYCP286CA0324.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11746:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fdc0621-0499-4710-f479-08dba2d4cd15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DQL2Izp9CxwxiCg5mkIV/MSBOeKqyLqx56mf7HCHyat/gf33TwZVjkmFwihDr1H2I29z6UAATYyzhJDtSNoCrGX28EKr8Pxz+jtbkVF2+E59+NkKowgS5tMkwO3pE1vW0aHsBmPyCQMBGeMWIOQFLtJgKIfeq/dI5mkaW8ZUX46dZDHVq+L+pMwvV6NVWkb5B+OJFByWyMzE2xE3wqbe97Ae4r8CPRQVAaU0nMOM2L21S5YfwTeiNPiQKQQMOaQ+mLx4tEtJgEF7qXqcVKh7WH5mV01QLXSDLtUk9ZQTzxDFy2hp6g1Zo7okBf8lNRhjmTUWINQyXKvSfRE27onMSd/fBCs6mFRQy2suvSyntO8BmB2ZIYEoFkdFXN58Oz3mFy4bKqjngOk9e/9NCvoK4Ns3RdRWmYFeUFiZLmGtQxQKiSxOLSftxhM3QX7s1bQcev994R11jINI2o8u+Rte+4s7Rp3jyF9112bl3MsrPTOagrMpmKylgiPrEYaibO6sY08CmcKrBorcCcEXfNc7kW4ryfSuwlX32p2kHXSCWBRD5T0gWktpLkqvb3R9SgxHQzUkFjyL7gnmBiGUem94cZMnOuk53bi2f+kRGN9PdknIHYBl9qNuFsoG9qgCDOcr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(366004)(346002)(376002)(186009)(1800799009)(451199024)(66476007)(66556008)(316002)(6512007)(66946007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(52116002)(38350700002)(6506007)(6486002)(83380400001)(4744005)(2906002)(86362001)(5660300002)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PhvUpZhZ2yB4Ifhjg0Q3aPg44Gp0NFlm7/pYEHB3jwD1SkecH/VvQ0ycwo9R?=
 =?us-ascii?Q?IxiOYX91cvb97S/FOUBL/cXDWTq5G7VgVQkWcbbL8QKQnVWRKzKc0A135nVs?=
 =?us-ascii?Q?i8SFKkiO0FoZbEcNgjhRdSZoDZjwuhMExrTiGP+ZS/8gOtCgkz/Tn6yOWcRN?=
 =?us-ascii?Q?yFszZ9ofzUIKff4S/a2Clv8ZoWIS7VhjhLAVI/QYB+e+SfsXtUAAEbrwo6rQ?=
 =?us-ascii?Q?6IW+Q/CgVl+yrtpjdPbKPnmWYAiYKtO6POldOBupVVqTsbpqCNUYYrf/nR8P?=
 =?us-ascii?Q?TKKZZGuL1EzLlVGVsB8MDnFTFcEQ1mJxTGtga84TI9ihsPoaIoCWsuas8g8A?=
 =?us-ascii?Q?YNhEXCCIXLw/F3Tbz0cH1bvmY9tgQXZq7JZFWXGA1GQDknWqbUnM7Aj17R0H?=
 =?us-ascii?Q?Fe8gHDuVbrsw60mgh9kSf3+kEDc8rDBX5ZxKsatltLCJKeEvTg5ypw9ynUNQ?=
 =?us-ascii?Q?m6zSkAgdMjEK7zfO/4pxRrbEbqIbv640ARIDV5pRG4uwdMxuIFkqUUsmcrOb?=
 =?us-ascii?Q?Br20arzme/cc6Rja2TvjP9GNvYNJlzbZTpGq0zCB5xNPnANAPIoewub3NHCl?=
 =?us-ascii?Q?BYkjZWPVZCGpSwpE7QU0F0teCbfV6Pb2ofgYPiCAG4+nXxVmKm/CT26uO8xa?=
 =?us-ascii?Q?a9jZ5uFffVOuD4wYuYpVfVfCL9UhsG8wnVdgFtiJshxz2BTN6BrysQpp/uad?=
 =?us-ascii?Q?D/I0uBfYHndpbSxKRGfWNMxhwf71lktXmyxg2EVUEv8ZUktVGOEneMmSFkEd?=
 =?us-ascii?Q?MdbkiUz0Tk6/azNWEsn1kaw51w+XxulaWXGDKGDlbtbkgm6r+6LbC1WYmHCX?=
 =?us-ascii?Q?8tW4m3g/vsaoOBcSZ7hmISPBfXMx/6QokDxzaO45RK/l5WrEum6hBh1pFrjV?=
 =?us-ascii?Q?FljaZs0g1lHnEiAYm4yU2gBDvWSRkh3cl7FKuxNGwpQuNxsHTfr2URifO841?=
 =?us-ascii?Q?JQfdP9egnPj2SRP7wwVrNf5aMLOqJvLyGHyFElXRtflSFrk/lVJcezSDK2EA?=
 =?us-ascii?Q?IQ/uuuRow56r2aNbVcvb1nVj8DOBr2b3tmpFVA/aC+iDf7QeJGt6stLbkqfC?=
 =?us-ascii?Q?NxJyNLX3eL2sWAuaTkAW8aXA+Dv5GPbjmZDIW1Rd/J5EJXvKpobpox6IADTK?=
 =?us-ascii?Q?hL73q0ygrcOTtvlvmb4/EWBb1uFEgrUe+a4WzrlWqK1dyW6FLy46TAm16Xc4?=
 =?us-ascii?Q?Q+PA6oZeuww26RbkdCBPrr3IReWjj/saR+OGzjRwakUzlE+ZApzxnUCbpqcR?=
 =?us-ascii?Q?NLBSBazdlIsMFLd5eN1H73oRyKgYhvPhpvjlrVOV2At6ZyvJUxQcF21EjfWc?=
 =?us-ascii?Q?TbiPvtOuM8CuI0LmPYSCE0JH9Cn6v+0vK0ezx0HKND/CCmogBIsCQwUaedDb?=
 =?us-ascii?Q?TL6g3iFybdCC+PIMh3DS0eC8pkEOZ0hGpyZacDKu+86JM4zRRHdXOqlO0XPA?=
 =?us-ascii?Q?nzcUXH1Cxt/EprNbYE3PoIloYhAAhF4sFU135iUr84wRLcliGEMc5vO0HRuj?=
 =?us-ascii?Q?cxBXHUCz2e8rLYlT3PJQVpfcmtGRk07FMTkEvOx0gbAThS6qNDYrNCrAyNRw?=
 =?us-ascii?Q?iTRgOagF+rt03gagS8Qe8jDbgCjoFt6fKgBhZUsY7UP3aBPPzzG2OD1fqUwa?=
 =?us-ascii?Q?opFUS0YdNd35VsMfRbBD3pI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fdc0621-0499-4710-f479-08dba2d4cd15
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 05:58:26.1940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qR86Ri6CNH/qEq4jV7IC4KsFLAzKUFldn43OW0w/ZpPGDvb/Q1iqjb6m1w+mIXTMjjtaAHdZ/w3EEoeU6rVAJuGpogU34uIAAgfSCIbGautr3pA6rWakwXZhYID4Cqsp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11746
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car Sound clk_i needs to handle "ADG" bit on RMSTPCR9/SMSTPCR9.
This patch do it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index d3f47da1b626..b27930101df5 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -1783,7 +1783,7 @@ rcar_sound: sound@ec500000 {
 				 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
 				 <&audio_clk_a>, <&audio_clk_b>,
 				 <&audio_clk_c>,
-				 <&cpg CPG_CORE R8A77961_CLK_S0D4>;
+				 <&cpg CPG_MOD 922>;
 			clock-names = "ssi-all",
 				      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
 				      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
-- 
2.25.1

