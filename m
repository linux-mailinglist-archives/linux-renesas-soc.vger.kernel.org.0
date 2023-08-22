Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 380A37839A0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 07:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232926AbjHVF6f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 01:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232784AbjHVF6e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 01:58:34 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2090.outbound.protection.outlook.com [40.107.113.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C2EE186
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 22:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwNXU0B75cmEu3lBYFUstvTgfrXRK2WxhSSfvNJ7NMcP5GS3PbBVLqN+9mr5buRAee8zywYGwbNn//ald4DfglItnS8JRLOW2FRrixuE2Us4i3DIZ0Suhqm2XZpUAI/eD5HtGapcobtkiQ6FQsKvZURQnircFe+ypk+4dCdqgeTM8AsS9hHm66K/W6EcM2hZ+flaOzK2CQJwTsIUIDg1aakHnpsXpSMrvWmVX/uQiR+1gt/12KFmXphph8Xst/zZpbRogjrSHmP613Vzbqho9aX1jY00I1bDcQACye1sEm+oSeXyR+WS4wRLYGcz5fBH2g2b87U2QfcZpbmkGugxiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KYB/IHzIxEotIPvkWHeyzUfTFsylrLg/Qm/POeIhrI=;
 b=Q3JRoKoA1UgUTb7/ShMtX7RPfRG58Zv41HfaDZkGnApUv/5C1hwvCiXYwkAX9hYw0hvsL14PImL1qWgv9IuROWPVaeaDNVRGJpR8oWyrW4O33VuJg8w+uclvlLRxNXLDjkwZ+ylcGXlgk0hqtWH1/V98kieY0VpbqNqAFzbi93AiA5Zbv71KFduMw+1SSM8sZGZdQC3gx2UrcTN4nloSAt0O9pBmCZCkejIJzqG8JqCo9Yn990DVzkfLqzOA6u/SkJ3R9+NkxVdva5jtFWId+TpQVQp5YTy3yhUwluuiRwNWNRKKtPPflCb8ZJEnySjXre3AjIi75vhykwTeqCTmRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KYB/IHzIxEotIPvkWHeyzUfTFsylrLg/Qm/POeIhrI=;
 b=CENqGmT1rwrKO6ab88cqrvaJrpQTFYRJnLHjBAFQVBgO4WLnrQEaSmoc9urV2ZTNZ8Ot71Mdsw7X1CmvMgmmrmznp2XjgFLL+3s6Oxx5Dqez5/zsz5nxBNXYXB0IdAN4i+Z+g9la1FAATwo//iwxTi6sD2b0MZ7Jtz1Spck9+mc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11746.jpnprd01.prod.outlook.com (2603:1096:400:404::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:58:30 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%5]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 05:58:30 +0000
Message-ID: <87o7izsjnd.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/15] arm64: dts: renesas: r8a77965: handles ADG bit for sound clk_i
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 22 Aug 2023 05:58:30 +0000
X-ClientProxiedBy: TYCP286CA0319.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11746:EE_
X-MS-Office365-Filtering-Correlation-Id: 1469bac3-1c54-4b3e-14e3-08dba2d4cfe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QYFgGBaxj/f3e43knfsN7Hc7AKy4TpqmgPfEGTDnTZ5OBZd1YLYCPSY4iDour+JmptVGxO57xR+OE1H+UNnRqs5aBcCnT5kkAYYZn2r7t6rPCWkz6pA/OWHDDe+oaMbdE49AeQnXfciB98qyfvlIX88ocRXHFiGAX29hlxbug82iJps4zZSQkBsOdmbqJSXr3XNUpo4BsueEdzCF2nZwxt1HG+ogopzYQ67InxWIGKB82eqg2WnBTadCwuCbza9D10ngYugJHpcQAE7FnnmX1L/aTBu0T6fBFglBXzKv4k3mJt2dl5fI5mYTzOce4+cWPpN9ryyGoh1VKTAXobFisuC6oRA3Cm7j6/afs719ue/WQEi/reV2u5I/7kBktj39HGnIWihnb3x3NaH3v6uQ4T6z41ldWF1pCxFHLZG+Gs8Y8IoLfkHp8NWGj3pDQl/NAR7hrbzOvJBDjc+HcQLVRAZEiSIs8yhO+qAjIkj5Zn6qYaCBvDKfc02Nf07mxOYXU1iPvnaTFwww6tqI9DxV7r10hqns6+NRrNF+2zEByrYq0Ux+NoQSt5ceN8DM1vojmyOqXwiQCABh6lhfclbB49hFJ8W5Jc2xp0IqGq4Y8RQcToG8VbxtVNm18GPXn2J4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(366004)(346002)(376002)(186009)(1800799009)(451199024)(66476007)(66556008)(316002)(6512007)(66946007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(52116002)(38350700002)(6506007)(6486002)(83380400001)(4744005)(2906002)(86362001)(5660300002)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VaRr2BTQIu15ok8fbAAB8QigYyRaaLIRPsM3JKNRZ38o0eDnlocAybUBk+hs?=
 =?us-ascii?Q?V3wyRqVn+FD6/4f7s4DF4w3ge3WewVe1Hvi3LdAvD2XozUKgOE+YExIeb68m?=
 =?us-ascii?Q?FHrUB2xyOyO5z3QHFi9bGpFKDEentxiXmTI/xiYSn0cPHkXSv0hMagjzYBal?=
 =?us-ascii?Q?i4bcm/4KVLbXW1w0POah2ENJghhN1F8MgHiZZIZV5otUvPQLEYuVFNphsP24?=
 =?us-ascii?Q?klRtRbM/FBr6NdQL3EdhY2Q0Pv9IGNGmemo/nh2mGwZpNSnyC1p53kMJgyK4?=
 =?us-ascii?Q?WMarjBPTg7h9MEslj+7fqGFQc7tsbY4NJE1XlXHQyJTi8buBrKCpuzxT+1JD?=
 =?us-ascii?Q?0AAB7vq/FfwgeeLy0GdjspUu8eeViqfsN1RXJ8HPJjewxV3unZk5MN0e+gDY?=
 =?us-ascii?Q?FIv+EZIAfal5lnwdr47pB06HZUPaPF6Y5V4VohnXYNKp+/5J3MYeChDDdI50?=
 =?us-ascii?Q?7SkixhD4xpWDJJUaDq9kMjvee+V+YOO9bD+nMeCjQ6ck0sXqJAQ9v291xuHk?=
 =?us-ascii?Q?tKCEGNl6Ihz+De8Ha22cD5bwHKHwHtKDCTTUAk2HSwlsfFuvdoDmkrsRUw4G?=
 =?us-ascii?Q?8/zPue2l0MfYhaL50PVrflCWhNNPNLR6y+DK5gQxvoWTzxuoCsAEgSwKeWUc?=
 =?us-ascii?Q?pNkoA9TKs5nfbf1NJV3ji/t/lkJXturwtdplkssccKIE9aDzl4CMNWqz89dx?=
 =?us-ascii?Q?u4PS+otm6kd0xq4uNUV+3b763hN0CMV5Z3ir0KT8+zwECU8DDcWBYIou3Yaj?=
 =?us-ascii?Q?QoliWX1rz41O9DjyQHlbpZzBma+zdfbqNFwSkYko/E9lsZ86LcoCtZhRIohS?=
 =?us-ascii?Q?JkOi1kc6ux+S54sh09FeTyfH9do6dXzEWTAnKuG7FRE7zaXKBxnW3EHglUyR?=
 =?us-ascii?Q?p5ioIlz877XFI2dzJuxKtwlc4kjZbttN64eOA7c48NkRhPaLBULW4cWN6Zt8?=
 =?us-ascii?Q?rVRmKJQdcOPwtmCIIMRedOnPkeMJUJBWZ0YDx6lAB3HVMOQUOUTMBZBhuKno?=
 =?us-ascii?Q?gxFsaPl15kxCq27rXBwiX2cVRh4d9HaZ2fu1s5a8sLZ4Twpl5aov7f6xMlA7?=
 =?us-ascii?Q?/w5gUp9D3hRQggVATb63xEii05NDPDus6XGukDuyfJrRDfFUlbGGgrrNcM3q?=
 =?us-ascii?Q?HoefbIq/fuQXjr19tzvcj9UCv0ug4CfwL3K++q+InHNicXuHsDcNnZPBHSUB?=
 =?us-ascii?Q?tp9IU4yGphcr2UAlvyjOrkmm3y4Gdfbjh9zkR4UtBTRAByGk/Vt5/iy5KE+f?=
 =?us-ascii?Q?Mm58rN79p611T1VuOOMzHXAs64kduj52wjummney3hhzRklmXMkbY83+LVcV?=
 =?us-ascii?Q?x3G3VtUslciw+vHCVSI48hc0K59zVE9Gdz1Dt1cvqkfmBo9/GyZhghXtEnv3?=
 =?us-ascii?Q?Uo1Bs8DgZU2xrmwdIXGXL4HhemUOpijF3ur8s64Uvp5jFkl2hLRTHRf7/TTR?=
 =?us-ascii?Q?pG47TalzLEgnvBkkGlplhNpp0YeBLahVLc0kQvlJKF7nWibJ9uXDYooyQie2?=
 =?us-ascii?Q?5tMj/ymfXQnvlMzE04AIO39JujfWP8OQS/emKI/i4f57gR0US0dGDukjDi4l?=
 =?us-ascii?Q?3mBMw1lnECMrgseDY7vjV6pLE5h8tHwnAhwQZFur9vRoSWrY6xquyIT/8Nfn?=
 =?us-ascii?Q?1G3KKT7i1a4YQud+Q8RLXuo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1469bac3-1c54-4b3e-14e3-08dba2d4cfe1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 05:58:30.8753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TU4NuNu5NcNZimMNkNkSHfhHzP+qakD/2hkA6z90HvoXYnZEbkCiF7ExCtR/jgxvtuwR2010hlwIRn13LkDNDuUaEl0M+USYr4V/XLKI9BoD5Z2/otrwpDszKcMDIn86
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
Tested-by: Vincenzo De Michele <vincenzo.michele@davinci.de>
Tested-by: Patrick Keil <patrick.keil@conti-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index c75820038491..0db25e5aa006 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -1766,7 +1766,7 @@ rcar_sound: sound@ec500000 {
 				 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
 				 <&audio_clk_a>, <&audio_clk_b>,
 				 <&audio_clk_c>,
-				 <&cpg CPG_CORE R8A77965_CLK_S0D4>;
+				 <&cpg CPG_MOD 922>;
 			clock-names = "ssi-all",
 				      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
 				      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
-- 
2.25.1

