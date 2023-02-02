Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE4D66872B1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Feb 2023 02:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbjBBBDR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Feb 2023 20:03:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbjBBBDO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Feb 2023 20:03:14 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2127.outbound.protection.outlook.com [40.107.215.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8820D744A0
        for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Feb 2023 17:03:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHAd7KJGtoDdL+rPcTjwnRaq9mqzc2t9NXIh0kDpVSOptFriMatjTn9jpHo+MeapGzNbts32qWP0Xhbk0pudYRRjyU8nBF+OaUkhTnw4DQKzYdFc3aHZAoZluu5KCWTyyOe9HsKIgxfcDR+YEKH0GFqGHu5Y5PFLhaVoBEshejLIPG3SrI0Ds7CqA41YoFnNTLZGWDGDjE1r1rR3BUfWoAwhlwB0ALVaFexa79vlgJ4ZTEnugtI5EfiAGACc2DNWZ3QdwHyTGThe8BXHdItydUxMHKUGx95hUnUNh9pc6kr7ETeo6YnDbcrwiIlBh2W/9lBxP3Zm9ew9ZU9BDEEdOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REs+qC0cNTJ4+s9xd1rXPWkSE6r3phgEUMZS3pMkqCk=;
 b=VAFIfU9o2khjAZvY3KGTmJAZCccfJGjFKAQqE/vpq0ZAWv0VgrPbZO+LDtmgGI6DTgD7XC+W8fBD7D8fH7PaILM+K0GMpeNgUWwjb7rtP4/toQ60kq35GG5hXvl+9qGACrFiUIGYCPqZm4uLzygXIc2PFsJ1kmsyYQFz7BUMB/xnzdvxg65mY/kuULmYX8tdDlyU5cpvOTMx6xzuQmAeikIJr4yZlYR7Ao94JhETxSH/gA+uvDTNfGnaiySudiPK4fKiQI/wI3JMLhnVsUWLIM55fkuNni90uwAJV4HGqmjs2elr05pf0Dn4LgsjF0/TlTNFJHz1Zq2O9x6gUr9Sxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REs+qC0cNTJ4+s9xd1rXPWkSE6r3phgEUMZS3pMkqCk=;
 b=IUroktHsId3Ghc9pJO6sC4bfJ3o72bFpTO0l7TKEQOZjIMudjn56u/sPU4/lV1lObtXAHBtzFHui4pv+aA9HzV42todMeDLaXxyUk3YCwUEwejwo/bZ5B3aldB9lzg9JMossiiS0Jrv7YgyduG674DpevP3HImwOM+8VQMCrqsE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5959.jpnprd01.prod.outlook.com (2603:1096:604:d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Thu, 2 Feb
 2023 01:03:09 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Thu, 2 Feb 2023
 01:03:09 +0000
Message-ID: <87bkmcang2.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/9] pinctrl: renesas: r8a779g0: Add Audio SSI support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com>
References: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 2 Feb 2023 01:03:09 +0000
X-ClientProxiedBy: TYAPR01CA0094.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::34) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: b870d207-92ad-49a7-a9bf-08db04b94046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m76P9GlZuXjCKRUecdtK9HAMMAvfI2nPbjKdy4YM8HrZd6WSPTjnjdnrVnn6pFwuUN/RYgBoThJltZBeXctuuQxIgjhg9pZvMVAqJHyIzmWNYGDr1TrI72J4ZO5u9eo+GZ8r3bAtoJ6mjtRAfM/pKfsX+HI8tGjNG7ONhDHIooa8SW1A1gt2Q3bp/uc5o6ffbIKONSe16ec8z0WUxUFptcsk4Nf0hTzDhF3tNKS4HB3DaMrJEOKlE71ye7tEcl3BwOCK8gddl3qnfMNAWXwkBDCEwyG0N8ltb3DqdIRRYEp/dvIZCUXwEqqwnjD9kjZVvDkScKrN0dRR9JzxnBILrXNinAH/pKGiM2lQzJ80rHVx1KBDfutTTlKBkpZqEMiPp7SHv+cqqy2Xo1P2t6GQPRN2NazcHQvcutI8YAWnzmtk8EIvvVCO445Nl2YBJNNmdDz2E2IsDhED3pkvy7YM146P0cHBI0TBvPdeZvAnPT8uoRZO6lQZKZxYPTuBWwowfoNpNXcSQ0DRJH2/i96USEzJZcuY1tDgz/o4qmaEPJCtsCzw3Xx+GVyD359e66fliwOel9oM3Gkd8vSnQd8bGKsgNcPAr5KRZvewTbb1aLD4FNOzXwRiIKFT8bSt3uFiZPaGI2jYYAyI8o0NmZ483CKc42UyuxOI1xJLjY7GUaV1Qm/mgbQmeMKBAZ5yBj5kXYntoGv6YiGNWfUXUr0Rqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199018)(36756003)(86362001)(38350700002)(8936002)(38100700002)(66946007)(66556008)(316002)(8676002)(4326008)(41300700001)(66476007)(2906002)(83380400001)(2616005)(5660300002)(478600001)(186003)(26005)(6512007)(6486002)(52116002)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X12nsRS9OuNX2e/4SnuoqdlSEv830xfks4jBq1kkckSBwWJnoSFjlmAPjDph?=
 =?us-ascii?Q?Xe9v3YQ4X0luCWuZe2KVB9HRTIz/rH8sC+C/ei/Vqci6CBjOROyJsowgYfR9?=
 =?us-ascii?Q?dRLh6GojqVTnqRxfT+2GfchN3Cx33Pbcw0NtwVtDqhm4NOHjGJEOFVLOEGoa?=
 =?us-ascii?Q?GBnVORZfCs2drK6MuGXqRvct29KymKFmDjUZO1S7tCHfOo8W/pkxaYUUR5QX?=
 =?us-ascii?Q?o9bXVFQfjuqo2/gPBSGlV2sOrKKEy5o4sOwaPT9ky0egIdg51uwT0l/Er6Pm?=
 =?us-ascii?Q?0Ccm2Ol0W6xnoOv4hqxu2IF3HR9sIC0/vrXPP0YLAm1boTRcn/gvnCP5looT?=
 =?us-ascii?Q?vhyTMsewUZhD21F3Xgq5Z/OyF6yGCGePNyn8V/anDudWQse0fMn8cuJv836O?=
 =?us-ascii?Q?1Xq7feLBSRJQMLmhiiEpGcVrZTyMVfQ6l1zb3XrhvwPrqMblN1oASMqBLRzs?=
 =?us-ascii?Q?qGCWHvtqH55Zpc1iDNhVd4KjkE+fjGbQCC3FRhBkEAPK1Cvm5jiApT4neSgo?=
 =?us-ascii?Q?xzeayDNMfu4wvx3IAEVby/S3HfInPoSOSCKCWWLkS3+hHKXe05bchG5FuCXv?=
 =?us-ascii?Q?qqzE+g9rjqoKlvch2kq4vtYSHoGdq68i3/dIyJSw7c1QwBal9kUQ2MDr2o58?=
 =?us-ascii?Q?2uDxw0eiQwNSyYenVF1ieDSuh8+f61kQMMwIs+IFqkVaCkKSlawxs/MEypx5?=
 =?us-ascii?Q?1f2p+QinqRV6rqasTtdBTtaLw7+QGATJX0ohzMh7ZVevOXhsyfB/VRcxL0xi?=
 =?us-ascii?Q?r4S/jjutGRkJcvBv2TkflLtllrcolQeCCgrI96UD7iOrdvzOja1n8MOll9Qe?=
 =?us-ascii?Q?lW1wkX4zY264asPRSH0PL64hbmkxA9IY+ueVHPjCmtWirD5qSaR0ENaBpNds?=
 =?us-ascii?Q?tgKzDbrPJ5HCJ4fatUQbz648T1cFxUubWgYCLWrWTJSMNTEGycxdY6U0KsSN?=
 =?us-ascii?Q?x+B9Vem3VmqjzOMX6r7LZ+yKHYhgrPWjYGZRXpxVs+ee2EgCV9CI7CDx2M2h?=
 =?us-ascii?Q?Fmk3SXdJitoN34ZZomDfkeAdlmwH4zAK5m3AyZorNbPRtG+Jwn7UuBsXUFaH?=
 =?us-ascii?Q?mgzWerZsbxsZs/OcIPph0kdImsCSmUqSmCLp98Gi5ziwaqcSHmm7ez/z/65k?=
 =?us-ascii?Q?syvxs5EyF67W/Dmn1wB8CDO08kf0QgDReREQhHigEe2F9KxIJ+WBN+6DzcXZ?=
 =?us-ascii?Q?mna//+uLTBSx19nUxmnDD+vE49tQ4+TUBvo2UEwXVeRe5QtNm8x295eRAF3q?=
 =?us-ascii?Q?nnDWZwNxpZBf1R4HxoHGJ5BA4R04a6ggG2XtLwwBNvVcPpazsgZgBM3Vb/DD?=
 =?us-ascii?Q?lYGBEoyOm60f6lwxtOxez4XtL9RANG9xqNSIbY1sNm0kI0HoBy+N/cfL/9+B?=
 =?us-ascii?Q?qPX3sdnew91Q86pVM0vyc2wU2JuZTdXHXM2yXFwillLS7FybEFumChdYn262?=
 =?us-ascii?Q?2z/sPwvo4lPJfNd9N9DWSX8PyxSlm7RUiSfpr3fmtWVI06PC1xJ082UmbVjf?=
 =?us-ascii?Q?hka/6HnejzUfUBf9DWmI3lFahtqOByQtwmNYCCTDtGy9T/jQ+0L0xI/7qCur?=
 =?us-ascii?Q?JrbfV6p5oV6dd3D3PmFlDzvN8nWg+wlOhkxYcUHs6twEXN+nDi7iXd7Z6itb?=
 =?us-ascii?Q?NS52lYKa/L+6ZNNLuKiCQHI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b870d207-92ad-49a7-a9bf-08db04b94046
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 01:03:09.7671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8P9MPfXC63fW9obFToCCrK2udXoWot1MoHrYOf+twXwAT3fV7Mzyjk+1SuDqPwvUEsjI3p2MoWQyPR1wW+KI5Lg40HDmGeQ+tfV0UYK7FxU0lu4CL3xr+0b3Ocqs+Mnk
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


From: Linh Phung <linh.phung.jy@renesas.com>

This patch adds Audio SSI pins, groups, and functions
to r8a779g0 SoC.

Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index a145466d1cf9..1954d66adf4f 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -2348,6 +2348,25 @@ static const unsigned int scif_clk_mux[] = {
 	SCIF_CLK_MARK,
 };
 
+/* - SSI ------------------------------------------------- */
+static const unsigned int ssi_data_pins[] = {
+	/* SSI_SD */
+	RCAR_GP_PIN(1, 20),
+};
+
+static const unsigned int ssi_data_mux[] = {
+	SSI_SD_MARK,
+};
+
+static const unsigned int ssi_ctrl_pins[] = {
+	/* SSI_SCK,  SSI_WS */
+	RCAR_GP_PIN(1, 18), RCAR_GP_PIN(1, 19),
+};
+
+static const unsigned int ssi_ctrl_mux[] = {
+	SSI_SCK_MARK, SSI_WS_MARK,
+};
+
 /* - TPU ------------------------------------------------------------------- */
 static const unsigned int tpu_to0_pins[] = {
 	/* TPU0TO0 */
@@ -2643,6 +2662,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif4_ctrl),
 	SH_PFC_PIN_GROUP(scif_clk),
 
+	SH_PFC_PIN_GROUP(ssi_data),
+	SH_PFC_PIN_GROUP(ssi_ctrl),
+
 	SH_PFC_PIN_GROUP(tpu_to0),		/* suffix might be updated */
 	SH_PFC_PIN_GROUP(tpu_to0_a),		/* suffix might be updated */
 	SH_PFC_PIN_GROUP(tpu_to1),		/* suffix might be updated */
@@ -2960,6 +2982,11 @@ static const char * const scif_clk_groups[] = {
 	"scif_clk",
 };
 
+static const char * const ssi_groups[] = {
+	"ssi_data",
+	"ssi_ctrl",
+};
+
 static const char * const tpu_groups[] = {
 	/* suffix might be updated */
 	"tpu_to0",
@@ -3043,6 +3070,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(scif4),
 	SH_PFC_FUNCTION(scif_clk),
 
+	SH_PFC_FUNCTION(ssi),
+
 	SH_PFC_FUNCTION(tpu),
 
 	SH_PFC_FUNCTION(tsn0),
-- 
2.25.1

