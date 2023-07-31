Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E82F276A529
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Aug 2023 01:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232065AbjGaXvH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Jul 2023 19:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232066AbjGaXux (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 19:50:53 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2092.outbound.protection.outlook.com [40.107.113.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A02192111;
        Mon, 31 Jul 2023 16:50:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lyy0z9P2ceS/oU6YPd8Zbj0PDGTM9S4wCSVsB2YeSQEZ9nuZ2kkyjc8pdiMSpk88bDWrSON1c3Pvo3TP/Cl1KbPQ/JL+BZWV0omOL80iIb8hZs6ajJ/fNmMfGc6GIfHismlCHELXZuN/BqzUlpItG/2Jy+N69pL0/gIGa/iiTaZjuyyP80eFF3LBG/BNO47PRA2kTaUsjmx/THQzZ5VGks8AhxUfEzJLgzq5XHC5/MOwGJRiI65e0taAztakp/rfrjR/l0IQJVTrsAvwTLmohgd9n24fzLtmTpnycnnIqCHNUggfYoZeuoMpLWozzm7L2tCitfCYgZ8XlKmDkDgz7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7YO0pEcOu5wPn29UFlF7PLGv3TlbCdMao2em7LlGeM=;
 b=KO40PXyNlDlf6j0i35iPd2HGJfAhj/0OKVDZO9gkXjEGjSURCDldHopIp+drIqHJPY7da24dxpn50J355CkoFyJJ3TmLE1qDQqMJiLYL82j0w/Ab0yqU6WLeJbLtCZoh9N7xYuxQJkspp4eirzau4/S8CnohRXF4HP7inOnp8SzpbKpb6nFzVfz6Q6EcyM1FPfyZXmY3dJBTYi6hd+lFOuqh3JHgPjrdFMFJsWPhNZYCJO5ccBd2BpEJau52MXuRhRFAthJ0zE5lybwEc1HjA5thxLIDh5hPpm0yi1Da6cJS58j7crJKMn6xue4JNyrBR3Lyz3hUs2cbt66svpl/Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7YO0pEcOu5wPn29UFlF7PLGv3TlbCdMao2em7LlGeM=;
 b=PbrHpG+ZVKvjoo2BFFytRQwji23mvlICC1fUIMaiUUwGdaS+qO28+eaQPJYy5K9QngR8udqRgFjsD8QyWw8/43mMMwUcQpiW36BNs7kCR+x0xtqOglPHgOttIoS2Unf+Ye6DPgbHVbS7DkziDdr9EKC71XpZ/K/xA9MUEeGBnSk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB7732.jpnprd01.prod.outlook.com (2603:1096:604:179::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Mon, 31 Jul
 2023 23:50:10 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 23:50:10 +0000
Message-ID: <87fs53prny.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 8/9] clk: renesas: r8a77990: add 922 ADG
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk@vger.kernel.org
In-Reply-To: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 31 Jul 2023 23:50:10 +0000
X-ClientProxiedBy: TY2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:404:56::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: 7576751e-0f1f-4017-a050-08db9220e046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yT+BuMTQbZ7HQZylcKw9YTMBVf9ZL8IA034Oiin83d2NHcyeb9WKoVeVRFG4RV2m4fSP7lrVj6e/eBo3muZ8oEtEcTsabFXLx9YT1B1rYjCCJ8O6ZfkqGWa93n3ZFfsFccdrVOlHerMChY8yG6LkG6X7Ia0gQQYNiHq7yzKMKwSt7ew6gUHD0XhZs6lBBTMmo3YznA8yCMyeB0DbigUxVk98FhCu4XmLGbdMIc8XTcp/7A2us+j3n0N+xXz/ltXkmV9uiuegiSaIUdtqhKNFecYKfIMFv2N7pOx9/vkKKneGkt1U5FOX+Gs4l8zjubbYpiAIoaR+eOAlbtNDw/A+DOGMu/D0BCtylcOFhhD4xYwtv9e7+RhZm+IyVi7j6MnN8frRGsugHrkoxAy8hqNgYees3cMAD6ridCCioP6zwql3mZOFt9crTHIrEs/YPfLhWCbzvSNzpBo2R87crjfCaqGTifQTocv3Z/1wAKDlII5fB1AG8OgX632Oa03N/L4yXIIsIL4XUV8wm/jpO7sBRRnd61fARCAw6GTG1BdJgwkNtX0YoFLviwkp7FlGisuXh441BEaAiqhGHOp2YslkosQfrYX/D4UspOK3//b/1kelIPpSkyKX0/MSwbRWBbB/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199021)(38350700002)(38100700002)(86362001)(36756003)(6512007)(478600001)(52116002)(6486002)(2616005)(186003)(8676002)(26005)(6506007)(8936002)(5660300002)(66556008)(66946007)(66476007)(2906002)(4326008)(316002)(41300700001)(4744005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DkPTA9ej643g4k/BDdPC/s0kHe25Nwwoznr5apezeDEn84It6T2l9uAjBsFp?=
 =?us-ascii?Q?7AvSNo+ELF+vCdnebbpraP+dXcm4546ZWYURc5k7gNri7tQAGstCN0XCQmaR?=
 =?us-ascii?Q?VdWV46MLSP37ozPLd0tKLpKGHHi0D6ZOCTsuo3yR0Lm+CsbxZqeqG1jsHDN8?=
 =?us-ascii?Q?MPwKcderWOCI1msuko+WI7kIl8/w5m3ph5LkFhtJ6C5XXLq9i19kGeatMihb?=
 =?us-ascii?Q?7Irycll2VV4+8Sii/dSis0KOEYGzinhfVT/HoTRn0oCkIEOz3Hn7e+eAsg5p?=
 =?us-ascii?Q?LikmWuRr/KVVCluSCTdY1exclHTdRaixzCFW3tScD07E9k3F0YkN0N6QnFfJ?=
 =?us-ascii?Q?i87VPKrujxRFnTas7LZ76Yq+i0GPfzGtzCqmd4AImzhXfskAtysJiLqvStb1?=
 =?us-ascii?Q?Q4hWZiJzXTuytRPgrdZBKfWTJ/Qp8NKf+e7lYx2XVEk44kD2L+UmZdQUXQix?=
 =?us-ascii?Q?zXgcimwq/GLlqKHbxXjZEHvircCkkwrEAzCKwCcs/0Zb+4zjGVXjPSsSEo9R?=
 =?us-ascii?Q?a3in2QNZwUk9tgPPIUk3qRAH8SR2Ev6Bp9QWNCZVB8hunEGSSRw2AX6WAfoG?=
 =?us-ascii?Q?f99Sq4+FZVe+HbPv4Zw5HLxObpLuZW41/+BPJISxBzTd+Yw3znAVB++T4F8m?=
 =?us-ascii?Q?YB0LTqqfbNPY8Onr9NVeZzdcOyVb31hgH9ZUU5iTZZlLKnkz6fWBK2Y35O+G?=
 =?us-ascii?Q?0DDuKj5WZ192Sb0c1j9aYY+Zt+CzLeNucKmZBOJUiYFcq4CIobG4tSTjAzLl?=
 =?us-ascii?Q?QKwAgFNJUYML/QjsUckTbjl5qWMskNeAhtzkwBW8Qo38JDun8oGtTk2Y2d//?=
 =?us-ascii?Q?bjphW+8Qrkz38cFMCxfcfYD6aHkkT6s4253shESbrL9O/NIZfKE3zTuOMp/j?=
 =?us-ascii?Q?pWE0H9MT6Xe6hf8VQT78y0HeRG60FSzA3noQd/zb24cwYCijA5/GeGsLE0yV?=
 =?us-ascii?Q?9a8PMD7t2MX2fK6dEcMFW8R57851lvUiP0xm0v8NcxwsQm6X4PBnDaZ0MDST?=
 =?us-ascii?Q?bHmov65/T+xUYH3OOCT+fWU73PZRgcpzl0Ubtkf1BGsDMN5tPcf6PEX5bgvu?=
 =?us-ascii?Q?CPn6SHonF/HhwXcIN1g9RybSqm0UEZuCKbcxlNU1ETAGWAkWWWprIRsJGs3U?=
 =?us-ascii?Q?QvoXYO4zl8FKw1reBvsnZdCKN3Q2Cqpo9XTjiDis6C1NgLBs2tgNeaHTyxtI?=
 =?us-ascii?Q?sdKaIs2gzfE9QTH8wAn3Mp5hC1iPXlZSktITbQtPnLaupZxQKtFV5eDMZbaf?=
 =?us-ascii?Q?IaFUocSLxyJ5S8uDj/bUagyuMeuUu+jrEmYwZXlaefvG6VJLrlEEqDevkDCb?=
 =?us-ascii?Q?iLqgDU5zPcOQObvFMOzgSwwKzq6r9MR0lGBp+38rJuhBAA382hCZJrbF/Ay/?=
 =?us-ascii?Q?3IyvYzd2OA/PL4IRt7Hccl6SD/SFTmiqCy2yzL2ZWELVuoGcGRvGlTSGqnG8?=
 =?us-ascii?Q?4yGSTeNIE/NJ1V8z9zpf0VP37ImC/HcFC0BQ6EYuepWWXyUX1Mz2iZR2Zd32?=
 =?us-ascii?Q?3ZwUZ2FHfp3lRZj6j1iBw9TkoMNfvh7k4gmj0HEyPJHb2pMo7fG9b9fU40HD?=
 =?us-ascii?Q?qvqtgfkIZvF9Lvuk1cJR/A5j1BPpIB+l871Gx/8X1wKE0yYz9ZATJb+tPPvm?=
 =?us-ascii?Q?sAPv+Y9tyPB/oAi9xWpYOA0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7576751e-0f1f-4017-a050-08db9220e046
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 23:50:10.3577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8yXDI5jaJc4iwi40l+XGIJpjSyA4FqaajXRgjEGH2MqBRQT+BNRSzPxRqoz7SxllbpBd10mv1zsqBNJ8NETXg1Hc/B7ZrJuiqRniDKLG6OcRa+wUDg2VGSi/ie5JKlMZ
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
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
index b666d099365e..b2f82c594925 100644
--- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
@@ -224,6 +224,7 @@ static const struct mssr_mod_clk r8a77990_mod_clks[] __initconst = {
 	DEF_MOD("rpc-if",		 917,	R8A77990_CLK_RPCD2),
 	DEF_MOD("i2c6",			 918,	R8A77990_CLK_S3D2),
 	DEF_MOD("i2c5",			 919,	R8A77990_CLK_S3D2),
+	DEF_MOD("adg",			 922,	R8A77990_CLK_ZA2),
 	DEF_MOD("i2c-dvfs",		 926,	R8A77990_CLK_CP),
 	DEF_MOD("i2c4",			 927,	R8A77990_CLK_S3D2),
 	DEF_MOD("i2c3",			 928,	R8A77990_CLK_S3D2),
-- 
2.25.1

