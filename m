Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C46567C2B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 03:19:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjAZCTY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Jan 2023 21:19:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjAZCTX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 21:19:23 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2100.outbound.protection.outlook.com [40.107.215.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8EF366AF
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 18:19:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3LidPNSmtqthL5/j/gKRvLLeKVr6syYKULxBW708vVRYzy4mujge9nB1Yknlv0cw0+uROTttqxJevaH+fN5i61Ts4nPH+5S8MRqCIsdZ60gEho4PIdlbhO234AyvYu4kX6WZM7zo3l/ypuIPkF2+1HL9CbACVhDOvIovea7iLdslnnIp0y2TI/7D3BZ0w3hXIOzz3BAYVVFhZHP6bfaUAOdYWNx4YX5GL1ZVNuWSSSQJDmc+Lb9AqWjMFIVHSjMxBRYc7yw1Fw7e9esMrRMauFK3+pVDMzS41Mfb9Y1JvU7FlolWdUR6ZuHkTymZB4oviuSSuMHoIMzuuOX1n8RKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGGOonQgvbj8u4Cg29RapWDm7cFO12IMbyiyZLWmY9Q=;
 b=HW8rLYwcAGyAtfbAQ/xzIBo7Ki3w6UC/miZ4N2Bz7X2za/GBGYEnZrbNI8npCx0EwsUkg6uZeASqvFe1KwemNYyovD1gVOZEofw7+rTc3vQYlRNeIrewI0l5x9xSRNFx872DmdTYNanVa2nwd/ons2RCcYRTG1uEzu56hcgLbDzjJSC0kRMtGwk7zJypTyCeTdYDOkJJLjPsICXAMZ9RANTeQjx2kBfcMwjF5q2dZymFfV3Ih37JpED0aBLwj63xJMe3Yovd5boWEnBmWrK/QN3uLZwSZSwRq9VnICLiu8ZkIYs9CT0e23j3iCJYbEiY/QuMhkGrf7qNrf3ikATYwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGGOonQgvbj8u4Cg29RapWDm7cFO12IMbyiyZLWmY9Q=;
 b=G7t7IBiQmOfiOe39Q5mZaAeQBEvBfUpB+ZaHqH8HTnfG5VvGT+gkVkgohazHnqmU49M/uha9BIrPtPa2myfbhXjOFmWqhmNfmuIWGlIIBPLnR1DFP3C+0jxZtQrCJ3IaOmGX4NLClWs2wXTO2OGck8EdCJfBVdS2IagLdb6stCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11323.jpnprd01.prod.outlook.com (2603:1096:400:36e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Thu, 26 Jan
 2023 02:19:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%4]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 02:19:19 +0000
Message-ID: <87v8kut4uw.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/4] pinctrl: renesas: r8a779g0: Add Audio SSI support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87y1pqt4vs.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1pqt4vs.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 26 Jan 2023 02:19:19 +0000
X-ClientProxiedBy: TYCP286CA0122.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11323:EE_
X-MS-Office365-Filtering-Correlation-Id: 763e278b-105f-4fb4-94b4-08daff43bb34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G+uQboSFOUEh/ZF8nDDfF3Sb15fj9AzGO225GHhqDInWVPXJLyFUobsgA8V5FhW2H52mu5ipzj/5YC1EBRoH9KUdHaHW4sbnrzctG8iw1e4NB6FUyZhnYRckcV8Ndiwmhn2bom9/YcgIpSQrOfJMV8DSVvURS1SPGwS3Cr4VFpHml3nXfJD0CFTr8hFVn9b9yI8Qf/W9aZC3HFV5vElsPOwBs2q71jghbiNi9HHS4C56gwT1VrMD5EhFO1CaDnRZg9vY+RpYpS9TTniQPXCtqHgM8nsHc4gIxscTnhbzqOInkrp8IwUQaNTYlmRv1SOxD+ulRHYvkCIr3qh4bvgHCswxTaSE5BiH6I5x6YeR5ExjqdXFuyqItUoOG/8xnvi0RMauAd7EeBV6drpnqFT155DilQV4cmNvFtiavSsqMrHGwKPsihIE5khqo7lXa5aHhZKJpol6mzSh37vWFKXQkgDbzW0YIwRm/B/0zwxwdrpiI6+3LdUNYj9dnmLXZ7oebSPQ0wfW0KCHeXqADVQsxydEBypL+ukn6x+vYqhLhXtG8797J83H26wmXuV6om1FNViuqOAKtZY814nYgFqskVBC17tSoSFSQ1Dmojyc4FpboXfJ4nIROM4JHJypCpEh6maX368lF1K426Um2quQuLzabsP/Y5KvKE5ay9ZbxJLTN35UUbGT39igRYj3nkCMA8cfs5sW5W80B5tkmRmJkyMVbblVbwy3KWaQS8KXHd2EKnMWKHlxtcvKE9Yfh1Q0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199018)(83380400001)(316002)(2616005)(2906002)(38100700002)(36756003)(52116002)(38350700002)(478600001)(66476007)(8676002)(66556008)(66946007)(8936002)(86362001)(4326008)(5660300002)(41300700001)(186003)(6512007)(26005)(6506007)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?krKIUneArqUmq7f08pWf2P035wcyS84af2W8IOUwRoYZFXydx9vlFU6J8arh?=
 =?us-ascii?Q?BvKKuBGywNdqO7Ry71ZZXSd+JkPLVEpsIu/iuwiPN5NGP4grCDREqVWvXlhD?=
 =?us-ascii?Q?d/prw9LjUVMeR7bA88Jt+/dBvyPK1kcG7oPXCEsYkSt1+VZqVZkTOXhOwytP?=
 =?us-ascii?Q?X+VdMJxViE52f7yJj3zdQMTxUK1DSwfT7zC2hJ4yPxerAZ/pnKONwAlD0bYT?=
 =?us-ascii?Q?7cbxCqMLWLGaREG1bky1x1XnQ4eKorxXWlusJBBq8+bwPATcIfdvJe023i7T?=
 =?us-ascii?Q?n2uhiVdNSSD+8KKvscJSiEkpbgwjBYLYnHvxZMeQT24kDo1F4uiJv4zjCbNL?=
 =?us-ascii?Q?9KRaprKNiPaUS8UfNRULCfVaWf8viQl1FhUcVa8cwB4C7iAtB/TVBI52Sy2n?=
 =?us-ascii?Q?dK9hgmzH7qxZlyWCLCN2K9F2BFIpbd6AvIxEP9MF7a48hQ/fZ9Nabkw/kgiY?=
 =?us-ascii?Q?pCxVQo+JZI21gseqjxSeS7Qvoel3AMqNX8MvHXvtVsLye7pzxIscFxXFDJQl?=
 =?us-ascii?Q?iPGcrkDdsdcE5z7pXRucyCcydWOjh/D7zLATGg2DT/JXavNK4rgYpUlkekCx?=
 =?us-ascii?Q?te/lFAXGRfFPFhOE3K8wNxSFUxZSrFKugDUaiH3cZPsxZjPXYOt99natUylP?=
 =?us-ascii?Q?ZOIfFm7fXhJv46JlZwsuxtT4H9C4zLmIkVVJWCB6EmJ1WRvpLAPevxhLeN4t?=
 =?us-ascii?Q?K/eTZjbBHzuyPkG0oY/7hMP3o6b7CcRI7sGma/w5LCItDvc95u792jVbVi+u?=
 =?us-ascii?Q?+h7yEPRTnmQpoNFGoUE5LLhx1H1fLlMZH5pELWoU6qDusGDf0+r8SlnIFVeK?=
 =?us-ascii?Q?i7AO6xhFKnEqrstWGUi0xRb7azk5cjoLN1b8P2iTTmj1l1QITmVtqIdNJzpd?=
 =?us-ascii?Q?s8n7tOZq4q2ezTd/8TDR9WJLD5yVj98Y/VGJr3DEQbcNJkBW1+7FIYTu0jK8?=
 =?us-ascii?Q?OERA6pEMUT4yM65HfrIGTSv5J8+ivt5yy3wOcWwhYAYzig4xDf6Un0/O+Htj?=
 =?us-ascii?Q?6tfN9usL6f1TB6CRn6Yj5jfUOXaieud4NWMiaKlm0z9GsrJRTuWPkQ/v5TtW?=
 =?us-ascii?Q?pF5PJaGTVPnhVZk3JeEYH49prHOc7sILy/NGyltJ8A3BFfoqgrAsYsEvqZGK?=
 =?us-ascii?Q?eDHNph0nG3Wen4YZw48IJJV1JZmA2jAjpZxqUTKICFSm60M1QppcKruJ9Zx7?=
 =?us-ascii?Q?JQHef/MUkTevVUv3Zez2O+lkYfElU0x2+RP7aK6dgdevcN9fY/j7htmxsUFr?=
 =?us-ascii?Q?05kaMQxI+gA0QYRw+tO1V/djHtTImCqXyOgZoT0lJo1goqNxVKepQcqBA81U?=
 =?us-ascii?Q?GnqQIAlSE5LfLpOozJXS6Dp/cSAygXfKrCeDDyPm0G+4BGaOj+sSoH3DeY59?=
 =?us-ascii?Q?0m2lL2/7Mh+HPnZetqRmMss9IvPinGFomSZZdhd+Vi9eZQgT9/J2610kPX4g?=
 =?us-ascii?Q?oOVc+IyRQdbCSEkyEf/lo9X/A6qqv+fukUZXLONbdbdZ8WriX9cH4nGA+cjS?=
 =?us-ascii?Q?8WXv96aDGSrLyxWmuO3Y++rlapO5y8PIfat7LeBkQuSaarILSBdQTpRl5YVs?=
 =?us-ascii?Q?2dMWfEUMc0QYmFLImEtgIAA61nEriYXy6kiMY9udQeXJMpA/Agp2O6B4pPlr?=
 =?us-ascii?Q?qjyFdTdVdpe6xVcMAp6h0OU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 763e278b-105f-4fb4-94b4-08daff43bb34
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 02:19:19.6117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 20fIPqjg9ahzuenAIQ0Q0pcC0imzORaMob4Z78mJdz2VYGBgaTmgVesiVK73aWZA/i3ZSxJvbbpjfMbQT14tJhtp05RUN+tSsHeEEDtD0m7lcqmy7MhWyLLXjl29xuoI
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

This patch adds Audio SSI pins, groups, and functions
to r8a779g0 SoC.

Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 7674b2a50f6c..89e993ec0b85 100644
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

