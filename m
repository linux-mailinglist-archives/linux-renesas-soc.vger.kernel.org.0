Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08DAE5ADED3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Sep 2022 07:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232469AbiIFFTD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Sep 2022 01:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231441AbiIFFTC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Sep 2022 01:19:02 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2111.outbound.protection.outlook.com [40.107.113.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52DCE52FEB
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Sep 2022 22:19:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfwLI8nGSNFTbxeAUaMKArwO6sf9XFYM0xTbOrdRCUeFkIqb0cGl3RYfykYjn+qq7rwVnIkolODIB8ZU+jIcnYM3f/c9dHVEcd+NwAukABwuFwT2NjZWXN2uyO6DELXj36IT6i3aZhFrdEBcb+9oTn6zgB4hykNgw3tnwbXfCi+xHfZf+4X953EuIlYg7HIKsRFR5A+yorpsaG/d1WmAchmEKDo3XoDOmdk/LfbAfkSE1fJ8r3+taOe7GxAQm24IS1TERz1gt2xCOLX6n0tzgDJPjK60eOPMEyCXH1aXg7Z5CRobb4kh0UdMxWdadgJIWPh+OG4pvw31YEk/KF3QBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5euOZU7yUKbeEmvZ2K80P9S7pF90pFEzcskdXNa75dk=;
 b=FqWq/LEt/94mWAT1VSkGJjLWiavFqomg6NLV7+fRrZ3PC2JA9OboACWhvZaSL3drCA49v2MVHotigShMnBp56k0XsR/jlygBC91njdz3jG0s63MabbJ+ntKZBzOd8AMPRV+0Tt+EeOVDsyAicQu+RLwnahMitVhcDiTueTIpbbOG0NqPPEyx1Oa4vBaNSqvrzFlWuinmdziePlL6LTie8+fvF8UcNkrV8pFyjyBfBY+sVI/R59INgW0EPmrQnWGy+T5N/XU96razCuot+mzkHfV9HTCzAN3OwcH2u3ttSDVaZAZF+Jh/46Oh3EhrmLDsU+jxUTMcjtX9uIY6wXp/hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5euOZU7yUKbeEmvZ2K80P9S7pF90pFEzcskdXNa75dk=;
 b=RbEibqAEKEl07WJWHGLxmBOF5pp8xsBvej+nKbyym6zYEXLYIKc90U0zAVuGfRof2t+FrSo6afYyM7pURTuwqIcWLD7fbID8Km/Hfs8z+lJ2sWpb7+HYgHFAx5LnH9X+Gkb980P++Lq7qs4FG3SCSsAC2CS6YsySZxfhhm7PEwk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9420.jpnprd01.prod.outlook.com (2603:1096:400:1a4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 05:18:59 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 05:18:59 +0000
Message-ID: <875yi1f5bx.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2] arm64: dts: renesas: white-hawk: add missing bootargs
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 6 Sep 2022 05:18:58 +0000
X-ClientProxiedBy: TYCP286CA0041.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 400f4d05-cc26-42dc-a1a0-08da8fc74d9c
X-MS-TrafficTypeDiagnostic: TYWPR01MB9420:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EmQSNacScrGTnqb+UU49eDB5zXyEFv5AkVgoGTugXUBOI/xjILoJtFEV8Druudzq0SwT8YD05FapJ2q/T/eZpiPk32HNBOg+kLq+t2pOEURQ95l9xe9bw1ge6ZWdgbXsuN6+yPa36/wtxWNw+zxL/tpX1jYeD/y247QQ06EctOgX02gzdJ9CAKAUsGraUiwM484dtdAqbHmfu9/Z4UMSXZu2w31Fi6trv5qvrimuNbuuw8NvaXiaMtowL2+kBoAZo1RnVkWOIkIHBuiScj9sv2Q/5ZZIdEDl+fdU5iLL+wV04kl3/65YPmJqj/tAQMj597WsFODJZ2vztynP2EQgIUK+89DK6eXciYcIr5p+UbWW9HHMOtyWDUWHCExh8r2CjZEiUsWZEfi3rSicWY2zDxQ2yYgDM/hZWk9YKm30NP20qZGgoX+KiOzOLuOS73xuUB5nuV6cfXrzq9p+T8SoX3o8DK3bhVKchX0GMXeUS27DS0OQ0tf8+/IsaCMij96nqZGGjrMHt82OsGDwRVZsEJI6F5LiX7GrZRnxQ/VZKbaXNrt/VLWpa+9IvS5pzGyf2v76IHRidPm0LWd8V86zHnSf3tt1yUBT4uaLsKfUJ7aCextcqOAwmYfgQfts1d+bDgch2MdUq1vjPKsycTeNQ0aV5rwlNviL8G4hbhY1v2WwYEUN2vb7QqMezyMha12+BEkKiDDBqHvkcvy5UohdsC6mV1CKl3CpY394HoSX9NInmWVkU6CDu44ILhow3saLgsBIXLN/9za53t5S3xqkOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(478600001)(66556008)(54906003)(316002)(4744005)(4326008)(66476007)(6916009)(5660300002)(6486002)(8676002)(66946007)(86362001)(41300700001)(38350700002)(8936002)(2906002)(6512007)(36756003)(186003)(52116002)(2616005)(38100700002)(26005)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+4Owhip7zczhy+vrHqqUoyLbittkyD53G88zoECGPegTLKzHE2CW53hKsomB?=
 =?us-ascii?Q?LQw5wIep9FVJ4Af0pzPEAnDGAGhqxvPUMVH2asKynZw5xBg5UQRZ6eJgs73g?=
 =?us-ascii?Q?17yFJHejIc9ZJh9nQ9lfgwOn7Y1beLXRyegmdCoVixCWMEUjaelqQLIxs9qN?=
 =?us-ascii?Q?giDjk0cEcEsF6m7dhlp+6aB+HzFRo5zBlOnVhlM4Qt1khyEyx02qjM8nb/Rc?=
 =?us-ascii?Q?JUXzEjZnot+cVFnVC5ddXqWhgNueWP+iWCm3AGCl6lP/gbJuf00/9lqQLVFr?=
 =?us-ascii?Q?WhDDmx/ejzMspGFrrG+bYNjdLBPV6/1bzxCoRIr+lE2Cpi6fMCEkN06dj2nR?=
 =?us-ascii?Q?qUbBMAf3l50I5gnEkk4RSoUAIKXCPnxlRlK9sP4278jxJC5DNqMeeYwpwsDZ?=
 =?us-ascii?Q?aBElWacj/6NngkzcLH1HOt3xdXMnQdRs3OrVOxSnFh33POOIi+D5rEchGgJg?=
 =?us-ascii?Q?RsOxdiTxYSyJi1fPAGfydRRNUn2rWtaQuohzVuw8HElKDwbW8IqqPhtRdPzx?=
 =?us-ascii?Q?TPZUVaNpekGkMQSppaA5fRvPO1arN+bIpQAO+wqJgAxSOMpGayTV2wzT7mlx?=
 =?us-ascii?Q?doBdg242/SAQQs2xO/0QcaVEt2lRL7PVbSTcoNs5BqaY0wbAKCQ2dsE9XOnj?=
 =?us-ascii?Q?Bb5RjXJDRm+cSdFIMX0x00NSHA9WKHQ5YDZuAAsVVFBkw6yqKRsDiBDJzj3d?=
 =?us-ascii?Q?ZzeqiXC7wPg1jcQkUT+rbvgTUDbGkkpXEHj4r0nIKOn4I1sFpYBXzcGKIpzZ?=
 =?us-ascii?Q?ko6nGHmrPeAdRH5790ybHLYrElkgCX/AdRTnq5ICSV1X1CxC+SZeEndSw6Jy?=
 =?us-ascii?Q?4N7E57rjA5u574oPud3juT0wvZPSF2Fzz+FOnoDmhH9ZEO2O+k8YZi3QvAfz?=
 =?us-ascii?Q?VPKc2znOucNJEV1ErJt+F77/JbrAZVa1K8wLghQ1bWyO2oGMfyAPPqfByhO0?=
 =?us-ascii?Q?scakPYVoZTul+tiqLouDfzI1HEEc6dueOe1ZaHhIfKP6GhNYH29GWbW2F+iN?=
 =?us-ascii?Q?onhYuVKcmpr2G2BKmi99bxlzA+dVGvtMcbO6itTor3NvpHgPLVw78lUInJcC?=
 =?us-ascii?Q?d3C2D/60oGE6Oe473JAlF1PhU0igrdqQYSQbRPrFf4/X/ZqRKQV9xIAYyxq9?=
 =?us-ascii?Q?0BkZZBr34c3d6elfbImjhckzz5ewfn3muYgvAfPw6ybHLLYCWrKUfwxVAEtB?=
 =?us-ascii?Q?nesMV9HMblU05D2+RHe5olioACUPAudtKdI9elDKmGy2O1MyQi2uXAuwjerM?=
 =?us-ascii?Q?kVeG950TxMfkaT/K7W8vEHP6q7EOvLMXPZncGxKRoUFZ/jG8sgQJ3pKgs1fD?=
 =?us-ascii?Q?yu+LNxv2NcKk0fcorKkMOeiOTSh7FABiNDKgiN8Hu2qnGjPLLFiGSWpwrtZ/?=
 =?us-ascii?Q?Q6rg2D5QBLu38DsFTmwHymCJ1TqC7JM0kluwXedS/VM6gBnh2RDbI2D6Ia4y?=
 =?us-ascii?Q?LMOtaGLPVEPAuhJfkXS2LttwHjwwiGBNehDh1uQj3oN8ec6qQU0y5vcD8PIN?=
 =?us-ascii?Q?ylKSLOjBs/zXWmJQ39kUieMI/MJa635isl211Lygrmvqycje8j9d4VRLLITp?=
 =?us-ascii?Q?f6LlZPiD3Y4jaiPPpqQWLdM/YA1AiB+N1RmrB1t2/VMJUv/ji8UVxU1afmIu?=
 =?us-ascii?Q?1MuaCerZ/6gEgn1nu10puMw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 400f4d05-cc26-42dc-a1a0-08da8fc74d9c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 05:18:59.0658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Dp2QYQwNBNBPZf/6jkIi5sxOj3Q40Kfr8UYVsSZiSO8gxi7Gs7vmLP7SffHRjybTH6I/Rt8nd3rGyP3LNBCDXkwdagVqwdzUHrQ13hdvYe6e+d+KbypNc2WuMeYiRHW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9420
X-Spam-Status: No, score=0.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch adds missing bootargs for V4H White Hawk board.

One note is that current White Hawk board doesn't have Ethernet
support yet, but this patch adds standard settings for it, too.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- fixup git log comment

 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
index bc0ac109b17c..34b018cd0c9c 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
@@ -17,6 +17,7 @@ aliases {
 	};
 
 	chosen {
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:921600n8";
 	};
 };
-- 
2.25.1

