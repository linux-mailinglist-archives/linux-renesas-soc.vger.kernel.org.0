Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C41A6872B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Feb 2023 02:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbjBBBDH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Feb 2023 20:03:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjBBBDG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Feb 2023 20:03:06 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2100.outbound.protection.outlook.com [40.107.215.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28C091E29D
        for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Feb 2023 17:03:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dt3Z/ZNhlLCqOzwgkNedtOj3YN5rC9ptUpTb7GlAu+wsi9Li0sIBWLxQ9UiwyNYyqK7v2k2fEOl5VIQegUxUB9BjAf9oQMR2tQNHNu7WqdrAnhYZp90TRLWfe+tiYZhMixBIfzecI4BB9U61M5erNR27S+SoM6u/5RVsX9H8IMOa3EjL3JXIEbVKJOG/n54BlaMdhoWLDebL3Qq7FKg06Y6g4IYUoCKDNOdcNTj2epnoQPdsrA+ghjn5LQeN4yOGB2XSopKajaLUpMtaUSVCu0Hfn9xhCYFq2Lb77s+R1jvq74ysIuhnW8CHDptRBN2sKpDVUFGbDPVT6MH8lg9fmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGNNt8VrSphKhlpzBzKsWsjhpQH2byyl2Xois4bPB80=;
 b=RY509BRmxAgpphHJiJw+m1TGIRy16aQcSYLtpZHTn223bsi1avreIM27Gg+FT7Xr86TR3eH7OOR1T450D9sA/KAVFhkN5SAJHmscIeqMeTg9aob9E8ya/gYtRHFcDBlV2zbvIvKCHYuAcT8nND7eLxEN2JjVse5aGrDTwNB9qrLay3pngFPxI71pWNvFZXGT/hVxzNbhpHlrYR7M4CWix8jP01ZYzvWHKuqst9LoZ+G2FfTeW7hk1zkdViu0z4f1CzR43YnwL0WfDD1apGtKorr1OYNMFYE7Icw2xFmXQMy8Y2Y0H4t1oHSNohE6rxpy3ovG6okGdGMYHISkw9cFfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aGNNt8VrSphKhlpzBzKsWsjhpQH2byyl2Xois4bPB80=;
 b=EBce1ssRVP7oi9sKahgxc7p94Nis7E01aHIPOhTH5uw++IOw+daWQQAf7UxM4M6DqzJRW0zM1uKoNwDBOgt8iWtzkZ5JJD6Buu3YQWcOr2jjfH1MOcwf/GsYQO1c9+MTulCrVM6riEq/Mtsg3aUe2oEB5oWjC6ibBDXaFyQJ1rI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5959.jpnprd01.prod.outlook.com (2603:1096:604:d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Thu, 2 Feb
 2023 01:03:01 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Thu, 2 Feb 2023
 01:03:01 +0000
Message-ID: <87cz6sanga.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/9] pinctrl: renesas: r8a779g0: Add Audio Clock support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com>
References: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 2 Feb 2023 01:03:01 +0000
X-ClientProxiedBy: TYCP286CA0069.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: 866e8407-b97b-47f2-ddab-08db04b93b81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2nfS8OKlTYM6uZ/RZd8jHgQQOag6zEtRgO8FXVQ6uISPxhVguCsKaf1duOdUDHvw2Y6PFeyMmv8IV+E84+OMyo39d/5bzR/XsCG5HPhP4CsdYG3HNjldAEm1P44Ms9NeKc/yF3BV57jqJd3ru2Dx+5ZLsyxHxi4nbd2GwQA/MgtQJG78D7PE0Ygdg/wgYZJx5R0PzzzxTd+wjI+E2ZejEi9zDcMZ1URMqHXvRD59u8D1EXkigmAkn1EhI91q+yTxRgfkPbuzaYAhnv5jt1YEmbHlymYHtmEiFkaC0q5EiI8o1k3KAJnf06Ob6ft3+QjYgUkglx1BiIsXfNykdbZ7w2by/2z73NcubrBR7Wnh422ocoY7lzM4vvtu1Ksp+Hcw2IP4d5X4J977WlnATIFaZdft/UQU5pnPVckWh5OTzV11SZ7Efh3ZWbKE7QcNqJG8NXCTG485XcB4GyNVXx0rpkbz3Z4R5JMQOvRd50DsrSEOrQGTfgIa5guyPWK7hqBXEMYGaJddpXZhjBFAcSW3JdFu3I+I2P4QwLrj5M26MUR4COE4KpKkHzW16kaBk8ZLyRxhDd+JlL9IjKukN1wwYH+I0TBoBuVszsq4BYC2/VDjj63qf6U3uMf13irLPzV4AQzWHZBpEPONvFsUnOg0TEBGZ/3w7QM2U7IGANJxrkMJiVzWHMrYkWyo+BpnSx47ufC3KQaChQUMKfCDtmU4eA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199018)(36756003)(86362001)(38350700002)(8936002)(38100700002)(66946007)(66556008)(316002)(8676002)(4326008)(41300700001)(66476007)(2906002)(83380400001)(2616005)(5660300002)(478600001)(186003)(26005)(6512007)(6486002)(52116002)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8m5193ZA5Ip3sThrrdpcKGKy4eVz3CUTqEVJYcfOCrzkqk+72KiHSv0FV2yu?=
 =?us-ascii?Q?hWW8ofUCoD8pf0SaSQYsl+J3x3VvypoLCv002mgComVntImRLXqsdXE9Br0q?=
 =?us-ascii?Q?VPkxLpwMwiauTHoPxe2nZ3b4wf/4MKk8rvKNSeOS+smPheO3mlxuh79Uin8R?=
 =?us-ascii?Q?8h173k2KCy5ggph16z4d0sBvU3SWrVNQihG2LBX0DjBmcKnPw29bvrDpYK3Z?=
 =?us-ascii?Q?y49l61c4S571ZxWtEHJF9+SD5jYXNA4O+U7SVvnvCtFL9vMJdBoi5HQhNVlA?=
 =?us-ascii?Q?L7qqWd39/B4Syup8dDJ4ZXEDInqq6uAIfGe7bpxqWnYsgNM2mF+FWJYN0q3H?=
 =?us-ascii?Q?7D6QVqOoUGSEjjyBsW1RY7vTfjH1xUDscrqgPdUsXsGK8wasMY8h6a+fc0aF?=
 =?us-ascii?Q?87I+ZHwz2nD9bw+UkPGt1eN+yYj89BY6EF8w0uDffb1RZMYZwSohSyfS87SZ?=
 =?us-ascii?Q?WQ5WF25qmt55J6vN9VHJwSEgKlp7O0IvVk3buO1nth8sWWtYQ++pwCtT5bme?=
 =?us-ascii?Q?CN0Fyuqt3WRA7PzsO3CBxuMDpR/ua/Lv262yo35PwbbKsKKYl5XQh5Vnm/f9?=
 =?us-ascii?Q?Qh6wNCFg6fw/pZZbFEIhQeMLcmviS+DOXZYuiiBkxzwmtUu+ICXSBJosOftE?=
 =?us-ascii?Q?GzRgEvzHEafGUv02KR8gHt+RYiRjHhZ3QHw+aTPtcb6aAkC/+sDX+UH4W0LU?=
 =?us-ascii?Q?QpgFdl49gSIEGdNEl7r5+HZsfRqMHFnbffr4/XcZ7xAyDuAV2fWQk4yynJjl?=
 =?us-ascii?Q?y9v+7avdQdjq/ilIusjSUXgq0AI53er6DfJ7F7tPTX1OZDvSjGc9rukeSL+w?=
 =?us-ascii?Q?W9C8slMAUp/y4S68PeR9iPnXEFrCN0n3eveJTGwVv6y4fNgWsnrY43r/lhwI?=
 =?us-ascii?Q?nbNRWQAK2jSQtddNEZZRmoqhIG0nLWeTeMs4tLq3fzISowKHjweJN2mJ5avW?=
 =?us-ascii?Q?m04n6kj9ZB143WxyNDnJwvX8C6TITTaTovZGkboPZirZ+BvGShbbfIh6CDF8?=
 =?us-ascii?Q?VYbfw7ZAn5zIR4hndeZ4Qz/4XJkmvfiMpV/YGNOVEX3/OnEjKq8x//kvzFr2?=
 =?us-ascii?Q?JFOk3mQpAlQMi3Bv6fL6BTfuG3vuEjW5rJcqECYEHoenETSJvVmoZ6Oy3A+D?=
 =?us-ascii?Q?TkJt73PIZjTmHC/QclNMWAcAa1I0SVsv3E/Yg+YuJSg+7EIZnQQeOppk9QNc?=
 =?us-ascii?Q?CIScFygk0s6bvcWwOBAuAxZC5ruq5hfnze2ILZyiLfH+AJcqZkZ+MZr7+wKb?=
 =?us-ascii?Q?vwcMtxp9e5vLUQAmtiZsq+Kz3V/9tfpwGZJiHMLODIbZL54TKqdYhjQcNtNp?=
 =?us-ascii?Q?NyiDsmvYOa7lwa+uUXqUg2jFqEAu3KCFrQOSO8C/qGeGnRAFy/2UFpn41LX5?=
 =?us-ascii?Q?SAxhofRLIN20g9Qct5ykieKxp+09ZPb/0h+pHdhLQ+17tAgsdQWBcRc5tUYf?=
 =?us-ascii?Q?ibWJdXr7TTeMR+WcU9wDqOO82HZYdAX/y7cZWDZTDnKggJCyDuscAao1kjiF?=
 =?us-ascii?Q?W6dx8G3d429RdIvG+MgW3mIDmO4HtRRafWPBNmGAxs9abNLkHQrDdbnNoClq?=
 =?us-ascii?Q?NtKmBAS82qDxqwLrtFTqW0zNGBPT4S90C+8mpemFgpKjboa7C5TNu6e1FxUj?=
 =?us-ascii?Q?QqQasQNLZdOu+PiEHPdZiWU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 866e8407-b97b-47f2-ddab-08db04b93b81
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 01:03:01.8446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pAgd3YG08+P5r1rB3wO/YXAmQlTGEw88yD+5Qe8TTNBW0h8HcUyJClVfOQdjIEMqwXbFg/gnther312zTjTPUe0JCpqDQEgigkDg+wEOIOGLzB7dwP2iuGfAtCZepQA0
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

This patch adds Audio Clock pins, groups, and functions
to r8a779g0 SoC.

Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index bf7fcce2d9c6..a145466d1cf9 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -1196,6 +1196,25 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
 };
 
+/* - AUDIO CLOCK ----------------------------------------- */
+static const unsigned int audio_clkin_pins[] = {
+	/* CLK IN */
+	RCAR_GP_PIN(1, 22),
+};
+
+static const unsigned int audio_clkin_mux[] = {
+	AUDIO_CLKIN_MARK,
+};
+
+static const unsigned int audio_clkout_pins[] = {
+	/* CLK OUT */
+	RCAR_GP_PIN(1, 21),
+};
+
+static const unsigned int audio_clkout_mux[] = {
+	AUDIO_CLKOUT_MARK,
+};
+
 /* - AVB0 ------------------------------------------------ */
 static const unsigned int avb0_link_pins[] = {
 	/* AVB0_LINK */
@@ -2461,6 +2480,9 @@ static const unsigned int tsn0_avtp_match_mux[] = {
 };
 
 static const struct sh_pfc_pin_group pinmux_groups[] = {
+	SH_PFC_PIN_GROUP(audio_clkin),
+	SH_PFC_PIN_GROUP(audio_clkout),
+
 	SH_PFC_PIN_GROUP(avb0_link),
 	SH_PFC_PIN_GROUP(avb0_magic),
 	SH_PFC_PIN_GROUP(avb0_phy_int),
@@ -2640,6 +2662,11 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(tsn0_avtp_match),
 };
 
+static const char * const audio_clk_groups[] = {
+	"audio_clkin",
+	"audio_clkout",
+};
+
 static const char * const avb0_groups[] = {
 	"avb0_link",
 	"avb0_magic",
@@ -2957,6 +2984,8 @@ static const char * const tsn0_groups[] = {
 };
 
 static const struct sh_pfc_function pinmux_functions[] = {
+	SH_PFC_FUNCTION(audio_clk),
+
 	SH_PFC_FUNCTION(avb0),
 	SH_PFC_FUNCTION(avb1),
 	SH_PFC_FUNCTION(avb2),
-- 
2.25.1

