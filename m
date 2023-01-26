Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1D7167C2B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 03:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjAZCTN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Jan 2023 21:19:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjAZCTM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 21:19:12 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2112.outbound.protection.outlook.com [40.107.117.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3740366AF
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 18:19:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkuHDeodG5UPifFe+r90POvswqRBN1Ifg7CgNcynhoSwLl57koyC/iCqZjtrENxoroKd7Qlx7aHk0jA8oIf7Wz/rpj8wg3EC9xluEi79f2IhPnEh7Mdf0JWhY/WelpHUtAHfcFvf/vrqo6AGXHxgPn1TYcNQQrgAP4AZJtQwuNRLBPaCO0FQbSVCjJMc3lATv+fthbKsp5leg3myu99toe61MmqKXXUTkr4yz3yaE2QfSCS4b1aKNMN5vA9+qb8+vaZ//UXpIsQDDstZw9XyvagtXSE0WhtPrlRQ4CXwtcEQIj3df5zD6Fv6ub90oSsAGjzPwm6RIGso2Ku8Iqi5KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JjqhmkQxmZNA4h1s+M515TwONdzq4tPbQbWmgAbf3M=;
 b=KmL+tX3zE6CLWGKzED8qZ8GsUiIGagstJMGaZtc475x4jh9ff/QstCv10/E9GFVcpQ7SJZnBQVV+DC8Zr3o5MkYI7izLkd7fwaz6cnhkZohIvVlwwF/gaB8lxlqfjsug7DEhMyEYbSoMU3fnmQlSrbebphZgdVyxIKBqqOkgvM+eP0pPzuyiu9odxA1uhcmffl9LZDsQJ5YZ3nG8mOIuOqSnovWvONCsyswC5AfwWJUFHwOy57KNhTqYohV4fa8M10qr2Nys0d18aYUbSvYlcchhOzcSRoT0UDn3zmANQfhxDiiCqS+NiFJJd7zamqZATHZtXpM2gkEHKSv+irB+Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JjqhmkQxmZNA4h1s+M515TwONdzq4tPbQbWmgAbf3M=;
 b=BNWCG91sMFW8z0bfCV+iuHiS0xxMv6TbWQ68ELHcT8ZMz+YrbnPr4xpX31Js+tymVJfc5pYL2GG5fKucKaQdUlQ87pqj1xs0411z7DiWhSeDTMzEslQqCrxOnsYI4A5lx3yB52GB+SNnTF0DCvk31K96/56uGdY+WWAW5b6DB10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11323.jpnprd01.prod.outlook.com (2603:1096:400:36e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Thu, 26 Jan
 2023 02:19:09 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%4]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 02:19:09 +0000
Message-ID: <87wn5at4v6.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/4] pinctrl: renesas: r8a779g0: Add Audio Clock support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87y1pqt4vs.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1pqt4vs.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 26 Jan 2023 02:19:09 +0000
X-ClientProxiedBy: TYWPR01CA0034.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::21) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11323:EE_
X-MS-Office365-Filtering-Correlation-Id: c1ec570a-25a1-499e-c463-08daff43b540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aHDDKBMAsYoQsjlfoTs8GheebJS59TSNdxCvNvXKuEGEUqAU5VKWdRBOK4RWYkwYx8xGvJLSugqeXkL2PFmf1uS2oMAVzZdZQY9ELw6TRoQTBAdwUec+A82jjqNMVYlVVyfcnQE3O7MyWpBZfL+ysSVYsQyLGdZAfG8sjRdHt8DoSj2eeyVMx5WfuZf6nGlDHS+TNXaslWtB/ssKG1MgWOdGGKHUDQ/Lu6dJrp4b8JK6nH/vGU1oCBr4aJZxt5Pfa604SeNTE4QC+gWcpc4+gihjUVFWw1a95Cpec//iwJ2/sAUOPslQTTVlux50C1f0ZugeCjPFTmCfNtTdCv4cexYzijKbGsn62J8ptsnhc4iwCg+xMV2u7G0wCddTCeN2R+i+ow55WcgK8fANnXiq+dDfg6pHDnADERlccTUqG66+X3ry0Jx72qdDOxkz3yUZqBgzb6sFUUX0QIJcYazy2QRe9nzk4nOa0nZx79TxFFokFDY9tgE6AFyWYDXt2LrfnoLcnozaW5yhduINpsLdb4rslEbha6TF2WbUXwfDtTWli28jpyBLhrL+7aXEIalvuKaV/qHP+R9BpKUtXRLSMHFx8zSv+mxPurDOvGi/P14ObFCkdC0oaDSzfICJeS6RswwUkNnm02D8MiusA8a4XQQWj0J7sUQ2xx5+cpX5345BC0RwxH617X3iDXQ/9JDEYUuBbOCgaM8F4Zw/1YC732sFw01Ulq6uAIHu66bAlAIzTqlMXdisSUyTp9aeygqe
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199018)(83380400001)(316002)(2616005)(2906002)(38100700002)(36756003)(52116002)(38350700002)(478600001)(66476007)(8676002)(66556008)(66946007)(8936002)(86362001)(4326008)(5660300002)(41300700001)(186003)(6512007)(26005)(6506007)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Ixb50eciBh8UEtqx5nUSwwVz8Jd28UunswjND6Waa7iEdWNj0pD9wEEeSNX?=
 =?us-ascii?Q?Meg9FdmGZF/DxHFIg5lBpWRYRsy+MCheCsZqeUH8wK6hR1+Sy3RKKf4/Ru/1?=
 =?us-ascii?Q?YiNOZ7Y5er/f8hnMGxiWVCvNM3BqjmyhIyiFD44Z2XCwvp39cSjowmPmlUJP?=
 =?us-ascii?Q?YEOejBR+He9sgJ+5UuYlNyDo+opwWZ8LWi0J23fQE4DlyQOylZ/Am2272/ug?=
 =?us-ascii?Q?hDMtTiAqoMQKNZYvfKvP1LpUdJu+fhER+1QW5Wd4JZPjSPGVBIYDaifuXYl0?=
 =?us-ascii?Q?m9N48Y5exWwsPtS8sQxKM7nnHj2TSVDscz+ciBBqoHcVgHA5JgAeSWlWjRzl?=
 =?us-ascii?Q?1AksupGxnZ03b8u2Wccg6N173emgo9eyClv6ijHZ2WhV/3eGnnF48Rpsgzmi?=
 =?us-ascii?Q?sSgjPd7mwazV8qkaS0O8C2OvzDVy/Nwq9JdgXDjFhlc/iAT0ftLcP02yf7Mh?=
 =?us-ascii?Q?VR0/EC7GYwV/Peh7RLM/AhLWy6ShNEfObyaQGMp3IKoNFhvQcW2phDgF6H3J?=
 =?us-ascii?Q?EVM8R+hEZ/53/C6hYGBobPX+CqhhdAvrNWYCzQeNH/Z3PNCJLfy6Qnd/9Es9?=
 =?us-ascii?Q?LazV8U193HACKY5XMso19498b33/2kfvtdtV3sbLm++1t2CO8/eJnTFo5QTa?=
 =?us-ascii?Q?Z/2gLgg2lmOympjsXnxgeXbFVw8kq63orHacok+NO5NqSjBH0N/gBQjQqOwN?=
 =?us-ascii?Q?uVe8wdQNE/kAJtgeqWRmKSLA7KFCds8BLqL6WEb2w8Na8iROS5ZbeTjgm49/?=
 =?us-ascii?Q?ricuwQwwS0BBIitarRWFzAtKh1gQRxHoOmjU4O9E9jr1xQ9V7WxAnDSIx8Id?=
 =?us-ascii?Q?mSefT8zN+1B13Vf2SbujydXJ8LWWIMWehUZpt5p2pFntyASmlLSTJxMiM1Ki?=
 =?us-ascii?Q?lcY6jggl/Px9iinoSro0sh/1oZ3+cvOFmguBR4RysPiWO82hCxHZfOhZAHOq?=
 =?us-ascii?Q?UUttCAz1tx5vLOKIB++k5zXp7ZboHG6eCEINjAq6Uyp092AbchWkQAu4qPwQ?=
 =?us-ascii?Q?R7cVxHV0JKLgHqyEAcH7mBPXjNQoq5yiTUX5wS1w3yaWQaxgWmDBucKdPdxq?=
 =?us-ascii?Q?p9jgg/52RVKOnVWJal+CKKq8LgK1nt4U8SAg5AUtsyxNK9xNswSVNpKktOQA?=
 =?us-ascii?Q?IjyNPjQn23XhiS/NGrds4Z7z7aC4pewpbEUgr+7o4+p67uhlUt4Or/jc1m8S?=
 =?us-ascii?Q?0lSKpZcAF5qkzfnKva6L0hULf+rJVVLq63zXxmJ5giwE6n6qv4adgAV21sJj?=
 =?us-ascii?Q?J9mYuJXyMBYDV4SqLCsKVNe2hv51SYdX9GiTlrEz2Ow9DuPlCK4Ca92disB7?=
 =?us-ascii?Q?GiZopuauPfHx19QMK8AzMxL1t0IB8CJNorEemWVTZuKKE41bePgOikHSVFXU?=
 =?us-ascii?Q?eFjfjvrny0HXeN8y+y2SjTggXGs6D8LvjNRMhytv3jSiz4024v8zIY+bJlBV?=
 =?us-ascii?Q?Pu9fvePs6n73kYlNAiz1g0DKa1E1SZPn0RmK5jA8I5WLnoqGrHafzaKJRgAh?=
 =?us-ascii?Q?SgZf2au1ueZPtPvuChMMNSe6IvSI27offl3aDOjC779AbWnbRtiij6of6tkd?=
 =?us-ascii?Q?AqGtLqDCRBdqptPkRZZU9zgGgRKZrDsxHp4t1ND1CkfZkL6MO816YdBscFV5?=
 =?us-ascii?Q?5jwL1T1i2jm754B0aUcMFmM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ec570a-25a1-499e-c463-08daff43b540
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 02:19:09.6252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xSDWXyLszqOG0XdH6GCCh4aXIqBjuHEX05fw8AaNL90wv+setETWL3nWIsmAQlyC3yHYY5GETLssonhE0BzuyPC0FxhaHPFsDpNh8G1K1Zw9pW3HP4zE1WbD8gMA9Eri
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


From: Linh Phung <linh.phung.jy@renesas.com>

This patch adds Audio Clock pins, groups, and functions
to r8a779g0 SoC.

Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 5dd1c2c7708a..7674b2a50f6c 100644
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

