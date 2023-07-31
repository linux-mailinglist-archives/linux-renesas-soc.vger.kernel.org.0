Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF01E76A513
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Aug 2023 01:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbjGaXt7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Jul 2023 19:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbjGaXt5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 19:49:57 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2135.outbound.protection.outlook.com [40.107.114.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7368A10DD;
        Mon, 31 Jul 2023 16:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSpi2E7jxxiSUk7ny2DPXWALO1tbSe6j8pvKktzFNdLP4p9owhoYHs/Ajs/U04PXns4/10aYH+js5ySYauMxOclqrEOh/mlWv3fqttMGyJaSswkWBJuN5sQJ49tlnT/s3EO0dUukpGg38lYNRsL+P4L4HDRVF3Ey26MTfj0mzGZLDWB3nVfbvPs9Ndv/XpLgVEYYA5rjI4E5L+JxuNjenyzm9SKXBJbXuy5Eqn0NVTe3T1dDFWLwsRGNffvClSyFNbTMKzkQrp92t+muAZBX58A4XnUzktS1fHG0CDVhv7eLrGQtWpOltDY8kel6yceObB4mhlZUCLv8At01iueCag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqYRj2+L30nhMe2j47yVStE+d4sFszM0WIkOlNMHr6w=;
 b=El27ZS/XN/UnhckaWCdDx2uwe9PmwQBRVBir+Nh5i6tlAYTwJeybpqXmu606LK801DZb85aURAELg//Xym/cH9JBzgQMC+XVGMYN8y7AEA8ayEIVA2Z+Ez9xecGLYpWCeZD18+bBUSghT9Mg6+nt1h+zG5vkR29In0eGfz4JIhvd/k/1AbF1/gWJtRt117GqPISxilQtPwjf951Ixo4AnNPX87ftyeXi6dCw3N0ra10Yl+wva48EtB/ApBV0oi8x1rYmWRHefQR3qPGxQcukKKJTXUA7f8e6TK6JZXPoTIZllHZC34m6fHIAbIfdxpJ9R0GiBAX7CeGDbjgq4aoyrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqYRj2+L30nhMe2j47yVStE+d4sFszM0WIkOlNMHr6w=;
 b=JL0b/eZ6zgA3qBEchq1FzCInyOPdDsTOaPxPQNIQ2wTEkCGZeILToseQwfRRl3jwZJSkhzBfdBGz58/WSV0qpBMWmx3IyzUCvjZEHX/Uzo5pknQnImnCoyKWr+UhY9QwEuD5bbbiNF8awXm3QfZEjgFhVrDtNbvthqMrOoVPpEg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11995.jpnprd01.prod.outlook.com (2603:1096:400:3dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Mon, 31 Jul
 2023 23:49:45 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 23:49:45 +0000
Message-ID: <87mszbpron.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/9] clk: renesas: r8a774a1: add 922 ADG
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk@vger.kernel.org
In-Reply-To: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 31 Jul 2023 23:49:44 +0000
X-ClientProxiedBy: TYAPR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:404:28::21) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11995:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc7b4ba-e9b2-4f1d-5262-08db9220d133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BA3WCdMtbt7iPACwD5XasTc6y0hYuuy6zpMEg3JMp++WRKLc0bbk16QhA2bAZ4Ih4i2gAHw0v8F1pcoGKNx9qdjLuGMGks6DiidO+SiwXLSeLLMEV4WcbhMoxPWou7MuyCHLSiaC3BYn5Rjhjv98pgj4tCy+TF7hrGlLKxVxrO1t+YevoK9UlY8KmhfP1Oyjm+5bYbuZPeCXZ3b/mtX6EZFgz1tY1z4KlQLWWWg2kywdjXOkO3/1w70OabxowzzACuiHXEkTDqn9izl4vmxBFcDNAVp/roAt0cAaby05SdVxXP/LM/U7RRIvNP2yQDmGkv34ur3OTQWtosoYEFrmjIDzkf0Od5WmpfnqkNDtqHX/zoKj3x3IBH/2HbppGijb4ko2WlvTsaEFjfPvefTrFSRVn7jKVlBjg/as2OZiMGAxU0Gj95lttZQY40q3Som5sdiueXR76W2o/IwMWxQGrXm22vDu4jsq2N/1dD3N2H1j+GskwVsaK8nLpPWHB4Wv++tUNpWBpBii4+4owjfuItIhp2elz3M6fFV5T4GO/j53u9rRND8DItyAnTEP+cG7G5uTvigsoj3viv9CQjiocYmDO2fpAd0JAV3EGrkwUGnmaXyJcO2dyuOhAJJ/D3cO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(478600001)(6486002)(6512007)(52116002)(66476007)(41300700001)(26005)(6506007)(186003)(2616005)(316002)(66556008)(2906002)(5660300002)(66946007)(8936002)(8676002)(38350700002)(4744005)(86362001)(36756003)(38100700002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HMjuAr04EElmbpf7DbM0cqACR8jWR91IqbTui7JUR3WSvWrahHHmRDogzqW0?=
 =?us-ascii?Q?ViQLo39jE2GtBROHjYs1kRxpGonrpiWvFISRpfYDxABKvFWg2L8IzKDeMcFL?=
 =?us-ascii?Q?vEYBnlDjn7TYwsOY59KO/YwFk3DmWjvKzWtNOIJeRasu0N6pHhI+b3K/PubL?=
 =?us-ascii?Q?Bl/oyf4Ztf9Cqgilvpk/qq8L+yDDChqoweHyGPvRpFvtAFchWlAjwi+ZYdAl?=
 =?us-ascii?Q?cizc+ZxhJFDBEU0TFDHOv5crf3ES/ZbYKL435ddxzLmoHFZwe6lpt5jckfoI?=
 =?us-ascii?Q?g08V5lZiaifHEGvur69VGzFo17llcB5RlExp6G/eNgshnvoc3WkI8LjEg44n?=
 =?us-ascii?Q?NZPHIA3JukGsgWtHZ+9g4rlF+NwES4cWYajc+ZoAqcZvYaDDtAUHk65vNjYW?=
 =?us-ascii?Q?tYTxJ50dED9LU92M2yeVbmNtfeGahBpmBcPYT+2UgiLkUQcvsQ50AlrP1Vf7?=
 =?us-ascii?Q?wQ/fKcqAMMZ15UURXDT9+NeQPv6l4d8YjSLUPa/VOWog778DQSfox47X35OR?=
 =?us-ascii?Q?5HAk42tpsurZBOl0gv4rYGQg9a0aZUW1PWHncSVnquKLQ/MtTyjW9pM9z//Z?=
 =?us-ascii?Q?eES5wqG1clUyFvNhUVPtJAswmlWmXGFCknQ6zBnuM5KI3Zu9guCROb9zA1rw?=
 =?us-ascii?Q?3fAcSDl9BP+0zVaZ1X6Z/2z6Zg07ru5pOZ7WsFUJTVHq0E3vpoLBGRBk50ic?=
 =?us-ascii?Q?icDs4MeYBL4EUZcKu6eY1ifWHxodb4geBZrixYGfqPrmO7Xwe9iRI1S6t1p6?=
 =?us-ascii?Q?cctsPBL+x9xa1XRWer/EWMQiHegmJUH7OLM7wqXuDUcRqIxEH7aeac7QTnyH?=
 =?us-ascii?Q?YtY2Lxa5oM6cqR/7CnZZQflUImlDsa4jUhe2XYEOa/DSmhfkf/4TJIYCayZR?=
 =?us-ascii?Q?rr/qWgxDAxc5KgJAUf+iLnifhaNUsqjv6KPp+Ild0pscv+xzzNV+VbZlT7U7?=
 =?us-ascii?Q?FYkITAl7EvxY+TFPkDkRTeXQ+YFNFNGBznBHhK73IF47Pgv4u4hrmDLvbHwn?=
 =?us-ascii?Q?G0NMwBffHXSX1n6U+fcD30YolLQwhvBgnUpK9pk1VAUtvZqXaL8GIo67/jPN?=
 =?us-ascii?Q?4mDV9SciQmkF72wmjAV4a9qKfkpWmZRDOl+pQcPUVMkvhf9LYOClw4YUhaFN?=
 =?us-ascii?Q?/FDLtqIu9XykH7Jp7MzfaB3/7vGH9TqYMoXgx7JgAHGwWNLFkZXzzH216icj?=
 =?us-ascii?Q?zlKcy8twEQBlLpyd4DJ+GgQ55nTJI5Lxj7m01zfga18IZayw66t8jXvlBp5x?=
 =?us-ascii?Q?8FYkWgH/xzzbivm+Z5HRPz4D4g0Hdj/eyzX/Dvmu7LcnOe0ZaqwvYGD0Lwp4?=
 =?us-ascii?Q?w37ehF1V7Z2jntyIWdhIvewj0QWYX+6Db7MPIQmZG13EnGmG3TbIV/scg/Gl?=
 =?us-ascii?Q?CUrZze6v7iHS4JHZfBSSGGPG9WVosXvo9hw1ONoNT3f7wvIdw0Vtrw3ROUSr?=
 =?us-ascii?Q?uS4rSi1NZZITz8u5Z71Glm6i+XH9UzF0qPiz43+OAjU3dbbks9gOuwmsKkpx?=
 =?us-ascii?Q?E7atyLuBrmn9PCUeDLJ3rZJu8IxHtR3J1z9PLLaa4pblTTUx5TBTLzHBN8nd?=
 =?us-ascii?Q?F4a/LD4ZYP8erjzLobSi5e9jgWH5M/CFmO91qxutttO94v/j6e5ETXSaHnr6?=
 =?us-ascii?Q?HTyEklw4DDlW8crg2RZLDVs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc7b4ba-e9b2-4f1d-5262-08db9220d133
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 23:49:45.0299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yAdxKlFrxEPQHAg5jx6FYqYWOG4RTQfzOTqdDjiQelhRxQNgOpesVsNm2M3dJgu6qM2Nweze2bs8UzvzpHlxzdSJdNEG0s9+u7PKuVFLOeBeRBnGJlMoFPXY/ODvWdVO
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
 drivers/clk/renesas/r8a774a1-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
index ad03c09ebc1f..daa3fd34c69e 100644
--- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
@@ -213,6 +213,7 @@ static const struct mssr_mod_clk r8a774a1_mod_clks[] __initconst = {
 	DEF_MOD("rpc-if",		 917,	R8A774A1_CLK_RPCD2),
 	DEF_MOD("i2c6",			 918,	R8A774A1_CLK_S0D6),
 	DEF_MOD("i2c5",			 919,	R8A774A1_CLK_S0D6),
+	DEF_MOD("adg",			 922,	R8A774A1_CLK_S0D4),
 	DEF_MOD("iic-pmic",		 926,	R8A774A1_CLK_CP),
 	DEF_MOD("i2c4",			 927,	R8A774A1_CLK_S0D6),
 	DEF_MOD("i2c3",			 928,	R8A774A1_CLK_S0D6),
-- 
2.25.1

