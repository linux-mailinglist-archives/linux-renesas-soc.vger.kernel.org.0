Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95B7067C2B6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 03:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbjAZCSw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Jan 2023 21:18:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbjAZCSv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 21:18:51 -0500
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2102.outbound.protection.outlook.com [40.107.255.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22AED36446
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 18:18:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YaUorOTIYCAH0QaxCV39aPc3qEYgIUqhdgdlVw+hHNZdU/4CFevPpDC6t8SEtMEyQev4EfXCHcJU27X9OMNmVtVNGy1PtOf6dC/G08PQccQs02Zq987Jbeuzt/MAz87BfThSbcRlane6aALNquYcKAQvDw21MqU9n8qUh6tk/EbPlpp4aLbujZT8u0q7Cr+yuzxdXfNM2AfHbANNrNG+p6eUPBOkWJFqAHPoaNhILux5wdtQtp56AkfOwGfR4NDXwCrVhqRvWGqsOlrNA79y8jGZ8JOGfmD8q+6+3zY5ZFymCHmUmpiQIHkw8BAncdYvtcs+mVm3SjHGG6j/JP40yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKYRxPHmqDXG54cpbLJm2xHXX9NyrpM7jSuQQwjasZg=;
 b=COfUVg/3GXCvIJfwp0S3cwBF4Q0HryH9XBdI8fGDz/NxG77qKKYV7D/hG/fhTpaDA8Q/8SVkqb/ODVrEdPLIozp+moybSETIlz19cN6Ldce95iKYhyqh3keHKENYUYEVtVgS9At7VZbOwNOXnSUUwZmFPGveUufAvV0rsqdTdHRbPG0r6o6VcEG7ELN9Y3WjR3Atjt7QD/3e5ME9nx6y7NQ3BvHu5z6aKzQVGCXT8pmmfhuv/Ef1d+pDpw1AW8iIdMDYtrtwICx70HXJZvwwXfb2hxr7ZwWMNIXt444ufjVvueGWguCNnR6STuxWVnWcn18g34JtXLPfChF6ttHf2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKYRxPHmqDXG54cpbLJm2xHXX9NyrpM7jSuQQwjasZg=;
 b=NWsYS9QVT3IPdBdFj98BgJpluCDxcRm0kXHP1AYNvljcZONE7SsNxZfxNMW+gFwKS7lJmt3HtJWMrFORNtNVNf5fClCfqnA3KmWGzcMBkb0oHnbUL68dkSxS/BN1zP3a0cJLnU7bR9qeF4ArSWC59wkFvfJvS4x9D8YQXAK+kr8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11323.jpnprd01.prod.outlook.com (2603:1096:400:36e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Thu, 26 Jan
 2023 02:18:48 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%4]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 02:18:48 +0000
Message-ID: <87y1pqt4vs.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/4] arm64: V4H Sound support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 26 Jan 2023 02:18:47 +0000
X-ClientProxiedBy: TYCPR01CA0128.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11323:EE_
X-MS-Office365-Filtering-Correlation-Id: 009f847d-c965-4aac-e862-08daff43a859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AJuBe0XO8wiyvy1LBK7kYjtTPRnnnNnThVbmk/DnRcB2SwTpaR/FdrdEs+NgGz24iusTcDiReXieoKvbxI409Xsu70HrozvAu7vpkqm1nK3H5W6TG2LpeUyxxFZb5yssL0Nzji8/s/gcNvsgSIaEy3ojusN54mYrbl0SLX+hHStNBkw1MJxRmhqBSJ8ntXytsmpSKt9s0M7lVGGZvuldC2h/oT1PPHvscu3RmbbOsprcwWxkWx2xIkIZ6w1w/+DcGBZ3StM5jnGLpxsAyBtpjEdxXlP3xbXEHzm5KBdS7iuU4U+OUkxXD3egs6FfBewFqI8HMTrFRRBn0x8dBTLuqwxvD2bB7j66/W/+FNkdkAD6EREODE9BDuTf+r9kyiY1xuE9p+r7OAEM1jj2rs19Col8Go34aQngSQJICbQDRpt+JNZpIH+zEssQ5H1xeHH6JOX2yeGfmvf36yuFIaOiD0yIbLwUty+/YezgGgxt0A8dzf9Fqjnn+tpwy5rByxcRBvRbfPkWbUHHLEIRrFH2SLeBRHKpj2lq41aLgA5ixiDfQacmBOb2XXcfeMo5oA4h6Z4rdA8aUNhv2Al66Y8MxNcIMUtfqIBi+B5p9riUPC9xI1pA71XtR524Wg5zx4cO/t7+KeCXT9IX6EXdJwW0S4B798GJmleJKIDiq5iW8B9tccj5PmCxgBR/6eFetbI4PEH76H9EWswzZwCVp7Esfie+zq6eLvgY26AZiPua3qCp6bgxkFXsXtRaEr6Wmh+M
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199018)(83380400001)(316002)(4744005)(2616005)(2906002)(38100700002)(36756003)(52116002)(38350700002)(478600001)(66476007)(8676002)(66556008)(66946007)(8936002)(86362001)(4326008)(5660300002)(41300700001)(186003)(6512007)(26005)(6506007)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NQclHROq7a566Je21+rLy8g92UMJzF0OjNKSnR0YoU6Z9ldbMw+pwELtCs6j?=
 =?us-ascii?Q?cgFi8QaHmnWXnCqXjM/uJJoJm2cENNmq2gHNuQmPAiK42pGrAI9lFjGPNYOj?=
 =?us-ascii?Q?HlXBNv4m0bPgZ3m7EW2TxRgVrFzx8qpukVMkUcryQg43fVjcB6HUKwHUhJ35?=
 =?us-ascii?Q?rojllWDvp3kFRwugBMETGfdNf2vNajpi1SEo6zNK5GYHtD6nel45MVtD5P5X?=
 =?us-ascii?Q?Ol5U5weQpVB2gDrGGFuBv5n1QgGbZfB0njQdOgMLKhTEvvdgtfXUSGShKQ8v?=
 =?us-ascii?Q?e1Ozy627bjeCmutN/UzMvL6zyQD/uP/HFZYX4OkdK4gJ3NGFzATz3SiUR3Zh?=
 =?us-ascii?Q?l7ytmcl1R6Ly0TWXYXGrRdPLg2iTHWPvCQk8g05q13slfYQ1p6Ql/C2pCJMA?=
 =?us-ascii?Q?C2Igj+GQu/yLM+cK7lm9Wo3tXbKUSt94ukxVq2iZssfwkbsUxZPXti52Mj/3?=
 =?us-ascii?Q?aSFVST6YcKEd13MehZ8Jbaw9oZLPvS4pgXTOsXMpP8UCsSMqcFS+VZl+yHsF?=
 =?us-ascii?Q?0dmeKW9YojEkaqqaHJCWfTYCDrFMhdr2h0fVsBaXZYeDIbFggH88l1OVs8pJ?=
 =?us-ascii?Q?Zwbo7v65AEqLugcJLEzkqbPNjnkd4da7qlvN4VSYk7veAV/DoMs9J0tm+Ua5?=
 =?us-ascii?Q?PRliwEU1431Z2/e1Rt7W4lfZD+FmN0+9Zd5S9YxPw+OpTpCmdYi7xyoCLFCm?=
 =?us-ascii?Q?aJV+2V2bb4F5hFtcuINt+vPV55fndCbMUpxCwALyunL0bxVys+AXUEpelSI6?=
 =?us-ascii?Q?eLqrSziHVX38Fe2q5WRqP+XWzLdnzoIGfR2WLaV8kPRg6hPysI9CIxcS9T8h?=
 =?us-ascii?Q?TF5go9Yu0i2j6PFfLcG+aVknncZGZdtQ5x3SFiJh1WyHLqbgIcTWe+MSKOZC?=
 =?us-ascii?Q?O9Q4e0B5dLjdwdVASJyOey5qhybltgl2IH+QQGxPH3N8GfqdgwNh00fS7dey?=
 =?us-ascii?Q?icCw2Xwt/dswBP1ZuxCHaUG0Z4YReugyip80BvfecYgAHq6xwk2K8gJTgHva?=
 =?us-ascii?Q?Jqc+hcr3vwkhWOdOZjPSVDBb5I0DjTY3CmKq+iu/2wpm19QTCqH93qiYcyyu?=
 =?us-ascii?Q?iiz6rJWIiOLvEjXA+zyIAChqmX9oc18QpOdjtoWejrWX3RIXkVqDICJLGbwS?=
 =?us-ascii?Q?1EKzICxHG8jIPlGgL1EOiUMxHe8NDTkyLsvxmYZT4NUAUIBiFYSwigDhRQEd?=
 =?us-ascii?Q?OME7EBAjuCOp1AdS4uDWMVETM982XId47BNn18b3KAHToXmS5oWBpidmDQ1O?=
 =?us-ascii?Q?fAcdcby9qehz/bSC4mxDBYugKaJaoYLF8mEJ1R4GSwKIC7DhUpl8xPjzmf6O?=
 =?us-ascii?Q?X70f5pedp95HF+xOBEFn8zQRikcp5auS+oMS0jwqdaIZ8MyZODxaIBm7AMx0?=
 =?us-ascii?Q?X2EltaevfEdi62NPzTqiEZUdd2twoNuJWDhXkTe5sjubNqZgj3ZjxKSsIV+P?=
 =?us-ascii?Q?ncU7qWtiS8NJgAaw8a9QpEU58MYcNXpL2OkMVQoRrWTJCrgqvuuS0u/yCXZX?=
 =?us-ascii?Q?sPGgL7TpXeuBvlAUYNjO+2zWGYz2S5VoerijAuPgQBLnnn6Ym64qzFfsnCuJ?=
 =?us-ascii?Q?ylfXhXU8Y3Y3H7LpZhT3SSAJnOMJPxgZJgixsuLc5ZdY85tImnhol6TcTXIh?=
 =?us-ascii?Q?Kl90d1DtN/Cc2GvARP5D7kE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 009f847d-c965-4aac-e862-08daff43a859
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 02:18:48.0421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tsTpry5IEBFiKfMoaADyEtKyJPUrvcKskuL5PBFP3/3KZFS19Q0fFyuj3zhVUA4JdCacoYCqrA+BFqTFm0JLvjzK8NyMPGQa3uUp6rf7FyuP1QJq2iJfY3VB6DQqfBhT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11323
X-Spam-Status: No, score=-1.6 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

This patch-set is for V4H Sound support.

Sound test on V4H needs Custom White Hawk and extra Sound board.
Sound Driver Gen4 part is not yet tested, but SoC parts are OK,
and these are for it.

Kuninori Morimoto (1):
  clk: renesas: r8a779g0: Add Audio clocks

Linh Phung (3):
  pinctrl: renesas: r8a779g0: Add Audio Clock support
  pinctrl: renesas: r8a779g0: Add Audio SSI support
  arm64: dts: renesas: r8a779g0: R-Car Sound support

 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 78 +++++++++++++++++++++++
 drivers/clk/renesas/r8a779g0-cpg-mssr.c   |  2 +
 drivers/pinctrl/renesas/pfc-r8a779g0.c    | 58 +++++++++++++++++
 3 files changed, 138 insertions(+)

-- 
2.25.1

