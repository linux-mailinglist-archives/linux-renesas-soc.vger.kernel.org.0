Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5676AD300
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Mar 2023 00:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjCFXso (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Mar 2023 18:48:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbjCFXsk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 18:48:40 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2133.outbound.protection.outlook.com [40.107.113.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E5FC30B05
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2023 15:48:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGyJnTNGcdUsZzX4ZAmuRiOjw5tlCpCtCgyunTDM6oLKj3EKrLxi10sfLibMTrkNPYxpv/CoL6Gm9pTet7/YCGBI2KkxFEERPL7cfm+m0/fO7Yu9H1bJHfJ5b9Qlc0SYulGbS2Xb6iO4SkhncaYGw/wCrbnhvXffBg+xoqGDw3q5q3i8cmev8e3kAGAi1Rq2W/wlzXAdfozcwt6RGgLsFLxWafAimRDQjeH+AkgxAHQAFt2CQ/yD73iVN7RyIg0ucWhltqD0ezpGLH/dBdc8VuadXWSfTlMAjzP4UX9RnETUIrfJhzbome5Qz2s1YHvjuGIZleVS0rdGZAD1Tdjibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TEb/KWrZNKpf8vggj9hgBkD7rj8QigOVYvZsr5MXlc=;
 b=DKJLMxOvIea+SQnZqiuB2AjHgHoorLP/pVtaVS+HBwR7RRQ4JFtCv9dPE3SNCbjzE8UJitjH2lJi6F4B2yEIO2G4f4NoNStSX8aYkIIGFy3yLebOMV/jLbTQDAD/vuJNPFpGQpc6vSCSxdos1QkKO9I0wNFaWJHWEzKcK1hT/CYJORFSKu9DF56txsNzg9/LaJc+xRFcqZy1/ayFvm4+A6kTDrie9LPDyKfW7RfzPaoMwpXKi2s4E48zRbNJUsauzMR323FzEmh2i/aHNlLTsyc9nt8IhLgXcTDa5AwrNANsa3VWHhMeHc0HGS22hFAbCEL25D1s9nFhl78tnKljiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TEb/KWrZNKpf8vggj9hgBkD7rj8QigOVYvZsr5MXlc=;
 b=oPhzd0X04AgIE/ViNjlfyLVAAq8hL1BvzGTPuLNdBc4GrCZvglYw7FTv1mus/MnozqIbCX5+r3s22wMcClYpr4wcYRcFPIA1CUN44rCdLMt4HuvuMcXpz60ij2aLJsLSAiQ3NjOpiFlss5gRuh8HkeyhPkhv/dE7YgZ6+miiO4w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11433.jpnprd01.prod.outlook.com (2603:1096:400:37e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 23:48:29 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%8]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 23:48:29 +0000
Message-ID: <87r0u1l9vc.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/4] arm64: WhiteHawk: Add Sound support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 6 Mar 2023 23:48:29 +0000
X-ClientProxiedBy: TY2PR01CA0020.jpnprd01.prod.outlook.com
 (2603:1096:404:a::32) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11433:EE_
X-MS-Office365-Filtering-Correlation-Id: c1239881-c085-4433-2274-08db1e9d49a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oSFn6Y1UM1BJqVRlvFSla6LwisEu6SJVGz+2TJYLG5QNyHt2yQX4KbV2eH4WFyt1DtVoPeVutXP9PuwSuEeHXmGFghlkJRE5kwL5QDAYCDgmjYlXLt73uucKxMwIilX50le2Ej4hFKLEramyaA7WH8S1F4RcEbsozzMS6UqzrHELa2LaKDgDcXydtMlKh8ZSOhh67YOAo168aCCkXmcm7Ak1cz4lLKqNaYwhkVdd/qk5e3zEhVokt4BXn+xqzMLA/tJvy0ynCktevJ+nlgTpszZIDNBH2vLVR9P5x1IGeLsvlO87mupQdCQm4leOk36iXWFWlfxafdQhfj0o3hRpTQ1aD4X3j1zmumc8cO9ah0BugMX/HyWWGPl2n8scB9e7xS2r1Hc8G5cUK+V7ec/7WhJ9zHmJMZI5/Gp++ooBPj7xrDsRUyToFe1Ej79ALzLkHHVrxIA1IIyXtZTYs+Bi0J4tRn/sfL0IpPHM+mxtVHmEvrHlmtNfqjVlKAM5cEyMab0+vwKaB5OWKwmbMCsWj4r1wGdRx5zcKNrmOkxPz0CDItywrLTrvymYliIdnPghSbXDc+NK4aoaXSMA6BwhdBZFtu6iWh/Izp0TsH9eb9Wkkt8VwSOLCYbxcrP3YbphTcZUh1qsG8TRBjzbjuuhfZrMqlKzrM6Zz/PmM8C0oM2KM08sCxZNENU6nFyoQ7Q2pX7Jqd5VxfF0JLcLwOmLMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199018)(36756003)(6512007)(6506007)(41300700001)(186003)(52116002)(26005)(6486002)(2616005)(5660300002)(8936002)(66946007)(86362001)(4326008)(8676002)(2906002)(66556008)(4744005)(66476007)(316002)(38350700002)(38100700002)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hiTT97xBT8A3kQYqhBbuWVeAGHPFKxuJ1JUEA2mV1mJHXr7FN3UTmHrxGUiw?=
 =?us-ascii?Q?WCifBAiQ+lw+PzHwFsYqw9hIrlqVD6DAlxTsw0wsQoGO+w/piuFztKtZI65k?=
 =?us-ascii?Q?NHakcGP/ja5qv6rWmR/sU3ke/OG+Xy5iEWhHeYFsspgrhjG+mztdV1sKYS3D?=
 =?us-ascii?Q?U9DZwxLNCdVjSlmjf+u/iGZJm5fTmTHMSKRmmcX/2lncg4mHj4EQc7BFhSKD?=
 =?us-ascii?Q?ttLeXEiRnMAgPMWFhvggMGoUckzfVDDR2bFWZkJK5Iemani2uXIAMMrJu8mk?=
 =?us-ascii?Q?ENvKv/yR9lCcynjDma7OhTOEk50gHm+I/JYQ9RGu5OhPEVUBl+J93y4ZKYKG?=
 =?us-ascii?Q?G37oNR0dPaHzmuPASybUaHQQaGDwgMJHreRO5mnYLSS5QP1Ud0cWPWb/8n9v?=
 =?us-ascii?Q?/DbG8GPQafkiY7R4qTupgDcwcoXA8O4KxjUeU7lFaFFUbp2fKY3JdWqaPmhw?=
 =?us-ascii?Q?pCFrFe3+hDlpmDnI/qljNOTNcU57s/GyjdzMrrjka9vxFUOK9kvrZLI+W7y9?=
 =?us-ascii?Q?WuyQdY1PiIJ1BNIPDiY7TgMB9OhGABsXIp0VPbYeD9zHm5oOHSgQgpE3O6xL?=
 =?us-ascii?Q?eKSrNJjHdSKDyZhVzw4HFNWGRaPFW151ejgaimZEtIWOvmpIT4hd4iz3TBhC?=
 =?us-ascii?Q?NKqc9PCT/wKAUqFjX2vpj6LUaqVY9dd7Cn7t+snLwSM1rYoKHlJnnMlJ44DR?=
 =?us-ascii?Q?xAGB3RhJIe46xPwHLRXwr6/izqaBPItM6bsdP8F6kpmbyFCGkUUSv9g8LkhB?=
 =?us-ascii?Q?/aglUZJsRgFsvthGMl99a5APhqczAEMIPeJJpZeEU0aaDWDK3w4JKlj+9uaT?=
 =?us-ascii?Q?HGde6CqsHlkDyWNhV6pGlLJmNgdR3wH+50U979l1+UF8GUVPpLp02IhPZ6jl?=
 =?us-ascii?Q?QpZmbBPzgKJ36YejpphZ90QY0wwUg9KGUSY0lhV601b17nG0BI40emapdYa/?=
 =?us-ascii?Q?OokrhwX9/hmQ5sMn6GXUEjuNOIYQ3KHZFVSS6MZKLhxNCM/CdqncUBEHbYod?=
 =?us-ascii?Q?oJkRURvCxqgDCVVsHGNGjxCmOjYyzq69NBFJzGh05DAAVTqo9zpCOofecwes?=
 =?us-ascii?Q?+TVU+O9a9Ai4Sz6ESB2kiE/YHelBgJA+Pkn8Xv4QIxkTi6oNSGeV2GG3JQb7?=
 =?us-ascii?Q?CqVoSMAXZ8kTMXWm2yqVAqjL09Y/3ZYK8W5bHJodMIyDWRa+BZch2b2CEHie?=
 =?us-ascii?Q?JxQSmQUFhVLdyLTgpFR/vpWohso9pqk11RsdJx4byGhzc7mJcq4pBOkI3Oih?=
 =?us-ascii?Q?2FiimPivxxF8Tv0dyx6kx9sQeihXRHGk44Um/GWRjYRzCW+h31PAeYu7yLNl?=
 =?us-ascii?Q?ri/j+JcVcaHtzfjSNN8RqfKvWfMezpxQWUMR+FRLf7m43UsUeEtl2k45JGHY?=
 =?us-ascii?Q?TnMcuKEq70jLQDK6ua6Fg8Lkn92cfO3YyV/LIThXQh3Yu5u4Hmj/qRo+j8Mg?=
 =?us-ascii?Q?vrlX6xfl0kTvQ9QMlsGbSXIPKvJRi9gBQXHRbFWAb6Ju9o7ikggccE8ygZq+?=
 =?us-ascii?Q?HJLED4rXc9YhoT0cMIu8eZz1EiHLcni62euc6v7ChpWyZS3SkjkkUdL+ImrI?=
 =?us-ascii?Q?aIgl+ZCnyLFQjRA384Gd/EG5RiMH4nNrtHLHqL8lpU3B9NwWR6kh8gHkniS0?=
 =?us-ascii?Q?0w5X96M+zdM73Yp05z28Rc4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1239881-c085-4433-2274-08db1e9d49a4
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 23:48:29.8030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PuW9Npkjt0yrMbMHEkBK9sZvWihHs/CCVsxAXJ7fR7O0xDqpYXjMncVzU7mOdEKHhWXbmCu3LPb76DWU7wWNkG9Q4Elcgqep94H8P1gJIc0P1NZqqiT6BoVjsQbMoYBr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11433
X-Spam-Status: No, score=-0.6 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

These patches adds Sound support to WhiteHawk board.
But WhiteHawk doesn't have Sound HW implementation,
thus, it needs extra ARD-AUDIO-DA7212 board to use it.

This patches are based on below

	renesas-drivers tag: renesas-drivers-2023-02-21-v6.2 
	ALSA SoC     branch: for-6.4 

Kuninori Morimoto (3):
  arm64: dts: renesas: r8a779g0: whitehawk: Add R-Car Sound support
  arm64: defconfig: Enable DA7213 Codec
  arm64: renesas_defconfig: Enable DA7213/COMMON_CLK_PWM

Linh Phung (1):
  arm64: dts: renesas: r8a779g0: R-Car Sound support

 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 .../r8a779g0-white-hawk-ard-audio-da7212.dtso | 187 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     |  78 ++++++++
 arch/arm64/configs/defconfig                  |   1 +
 arch/arm64/configs/renesas_defconfig          |   2 +
 5 files changed, 269 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtso

-- 
2.25.1

