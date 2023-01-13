Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67994668951
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 03:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbjAMCDn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 21:03:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbjAMCDm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 21:03:42 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2133.outbound.protection.outlook.com [40.107.114.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE4C0621B1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 18:03:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDNUrxzkfgRN8QLroLUi6eH9fqGeWoQU5enR5wexVZG89KilxgROGYE0c3OC+/LfUozk5Fh2BgbRah6QDCOnavs+3gxacQz5Ett0MtnB4d18sBqg5R6EI6HwZu/O+3YvvUAgrPvPgEZ8ZIyHdCPCuhzehds+e0pCal3SaCx3URTTlR60KbDI3awM62/VUrVTeoX2C4ppRrpxayRPgY6y6ztGF1NrfeDoT9sMxKCz3+CQmrYr61F6th3m/I5TOKJ2sqkBCKshP1BD35Z3zg5t8l6erqoWu/CZp5kUs9GyZO/OxHlJM08mauAgU53GaC6jKiwMlD4MZrZFH8tpe0Fl9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUeUnZjdakFNoUg+u+tW0EVgOXHfuZib9Z4HLvWuY3w=;
 b=oanTKowJ8Flme08il5dnQdje0w6he5xucaOACqTLzLD5NjmdG3WZxrK0YHVSFsXx+BnnAyUhnmfEJ4ZWSe1Ar3VWXP2CvNQY02RQVoxPCKedlc/PrhL3jZ4usXcYlTLGfxVsR3a6dlFIwbYhUwXsFPU9OuTVwhEW12Bspg5etzyYeQGq3e5RJ9q3NaMV346IG80prYL5kDJht1SGZzmM9d2ycD5TKb5AkeUsSGc7iiauR2NZ5jlwRQk0QsJOudwvCCFSZL09tiljxVNGUFDN30+mgPAiUx9sl79hUUL+MZzmhRxdc1pHvUp0r5CASmz9iOeI+UoZG13q9gG+OlNFeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUeUnZjdakFNoUg+u+tW0EVgOXHfuZib9Z4HLvWuY3w=;
 b=VCanje8D2fgcpdCh3MI45M0+MpkyW1GJP0UvpZ9S0LsnVQyYnrTVH+cTHEMWyNl0eatBkU82FX6+zlPdrSeeXikYKWlqKUqmOUdqmk6VpmKprUJ287H4Iy9e5W/8Ol2UDewb9qf2vvqo/U75ETmEOGb84TlQlUYdoneSesLWVEI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10859.jpnprd01.prod.outlook.com (2603:1096:400:26f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 02:03:38 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 02:03:38 +0000
Date:   Fri, 13 Jan 2023 11:03:31 +0900
Message-ID: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 0/8] arm64: dts: renesas: Simple-Card / Audio-Graph-Card/Card2 dts for ULCB/KF
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TYAPR01CA0219.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10859:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ab4eda2-88fe-4402-7ddc-08daf50a62ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3PrMYDA/sIOr2cYcRFlJdxvepVx5PobuvclGKLpQyjl/jYdxNeqb8dfYikwcFdm6JZyD9vYGnuEATdC0XaaZQIDP//ArJJf/Ysvo0NEhiJ3X21pJ2TUArxN2BzLMC8rKOfSUUKv5jU0bbyWCJo/okP9Esxsf4hOpSIkEJKUyuyT5YpXlwOfL4sMwUEKzFHMn9JmFY/ChlDuO39xitPvO5OKF7mNX9xWYM9ivnwaLAI83FDFnonVd76NZDXTnrOvUW1dRxMTUAyWBdIzK8RfDOXQY0RG+/RQN1zUs7MCrzGkhfAy/wjSVQuUG1Gm2dLBYk9MaXAgZqWMM35gWAWZ+b0HiRWk+1WhG69YwJtOm2IF7jb9SVH7NqT1e/jQIz24H1ouFpESWBGGBLdHioe+8aOzyR4C5QrifVbN5BvxmkwS2AerpDTV19z0oQaYwCsXxi3Y9PsbKJRq4Jnmmyz6n4SvlPGjef5iXu4zx/ztq19O5mfNLTqDO/ptkIFSbz8/OmGzOP2t6FD4aqBSxkIflVM1i0V/TnKNqUl07l2GVg+9mK8NamqdOBCLrB4OQdSu0MAkXSNMn1swE4zxbSiHavET/zopgYU/vchb5YZxK3TV6QW1uHC4zNgucY1gu5c3k8hlgVcT6eAz2lj0TAGqeqcnuNHDqzaR4utnLIXfzeUf89o0gIwCkedLkVZq9R5QpTcSezSqo+8CT9wohiBoE/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199015)(6512007)(478600001)(26005)(186003)(86362001)(6486002)(52116002)(6666004)(6506007)(6916009)(4326008)(66556008)(8676002)(66476007)(2616005)(66946007)(316002)(38350700002)(38100700002)(41300700001)(8936002)(36756003)(83380400001)(5660300002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P6MgTurTKmQIJrSIN8B7OHGspy8qc3UXMFZ5DX2sjGW+vL1xlpuYINlw9haq?=
 =?us-ascii?Q?EVz6YW8ZjlARTSMx6trfrNVFyVGbexIwi2+2TwMt5q6mfRgNIWrhh3hbg2vL?=
 =?us-ascii?Q?6wGf6db2G0nss6eonduh67sxyO0vmTnQVwf5xL6QLlOs7qoT8M85hnfaIDqJ?=
 =?us-ascii?Q?xUmquWqgUlN9lVJFS7dr+D9Y119zlvwLF8T1eQ6Py9DLDzOdazFr1wzbAcgr?=
 =?us-ascii?Q?jzR/2x2qI2vS3m7dV3A/oGGB4BKnXHAppSWPDPT1vU2MShOxKoUS92VN5nbs?=
 =?us-ascii?Q?ZJAoeJnalxmloi/CnKQBK6hzhT4Q1oh+/VP+vL838K4WNAoGOC2I7sdKUzVF?=
 =?us-ascii?Q?OqkiaKvLdGCduT58SjXvvd4WLyNWfiOvo9OJaZwap6QP3IxEmJyMhnIKnqjO?=
 =?us-ascii?Q?nrQxcL/a6sABZpDA7nL1qFmwINUaFDDNRD4UJb3lRfd00A4swcjPk8tkzJ55?=
 =?us-ascii?Q?+raNuClWrpzftFWKNKwAby48aCfw/YhTh+rj8dXZKGY5PDMpYv9wpDllip8m?=
 =?us-ascii?Q?ZGPvLrpfdAtKJYCFdq5HUZQM2j+iVl7kwrS8T7loJHtQelOW3QrqvJOJauo1?=
 =?us-ascii?Q?Ki826Ag2lpgVVw1Xet8aQbEX3LkRFkud77vu8h/Gq6o1euFqTSjRQSKPY+QF?=
 =?us-ascii?Q?Jedwm6KNWlxujNRM1pegheHYhme5Ivh2JXb846dDdC5B43+KJBYaXWuA4kG1?=
 =?us-ascii?Q?nb8XPte2q3IRrIlrARmX+73eFezHyadSMLa6VF2toi7i543YZukS0KKGVPRf?=
 =?us-ascii?Q?TI2nMVTigjaErKWQ5zdMLWQYZ0ANfqSBN7+taFd00iC9ggEwnG/1Gj4hNMCS?=
 =?us-ascii?Q?bHxlNXTawHOsT5LIEoAvwuKuu5BrOrVB2nWRKdu52/nf1xSZLYqdw56thzFH?=
 =?us-ascii?Q?6WE9uEELGrgBPVe+Y5U12NAO+JnXf7oK+2PwAQ8P5n+qVsCspAt5if/1kgF7?=
 =?us-ascii?Q?be4YVvbl15l+gQBuqxYGmzvuz2lD7xJxYOgVpcMIK6whMhTN1mvw3Nh3U7rF?=
 =?us-ascii?Q?4+WmvT3ecLwiHYuL9nEOjr0KaB6ai/Hf8tvCsIUE3j0nIoHcvTNTtgnkCIZI?=
 =?us-ascii?Q?MNlMunAMQxuBqJi/qng1hRND1A9rzJttpdBGWeL2MGrSO5LnzUNUNYvHukBO?=
 =?us-ascii?Q?T+/Ohsalew/g2Cd9mp100Q3W4F6ANKjSJUTqFy8Fz7wgWIlHF6V61lGeSBEI?=
 =?us-ascii?Q?DDKvcMlgO7AzRL3yvMEuMW3dXon7X8QbWn3Y9nCDbNHPtPQOa9sq3mymzdZf?=
 =?us-ascii?Q?12nsCx5VdbjsaFK1RA1swYRU96zfsgdBz+JJxV8tXYNK3dz8b3wAYT+pG1AN?=
 =?us-ascii?Q?P/p20Vogf3E6A9D+Z745p9RsU8rCrsGnq3LfYz6KjRl0SeKKwWDMlXBJ2wJY?=
 =?us-ascii?Q?H/VvUjE8YasSR4Jc1FVFldDuMz7vfABw8KSEOBU13AAAOnUmNyn1F/lNf/xO?=
 =?us-ascii?Q?UjSQoH71DwjcuaapYooNfZ4yo3vn0JwwxsiuCfiZdJ/hQeSnlaMkPxcsptrW?=
 =?us-ascii?Q?4XZttZ8BCF/LEi2gtl2gGMJmyf53mInGNkWNgPfkLqtPLmaylHzslIg0ms8i?=
 =?us-ascii?Q?RWgD7mvGbtICHkH9HZT5o5cxyOvRcYbwgZj7HsvnEjg2G5n94xU9mBrKjHXz?=
 =?us-ascii?Q?nPpzWQoeBy70AtvUiUxubCU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab4eda2-88fe-4402-7ddc-08daf50a62ca
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 02:03:38.4918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6vM2PRrBfPsK67nJlqVv47L3dSNC+SmGkvkL0K9I3uG3DFhm7pNSP7eosQuuQqfFowBJfr7/G6UOnNo26P5JtnT7Cfs0wo3tZfbaI5I4eyndvacPOY10rgvK1HlplmC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10859
X-Spam-Status: No, score=0.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

ALSA SoC is now supporting generic Sound Card driver such as
Simple-Card / Audio-Graph-Card/Card2, and it supports
"normal connection" and "special connections".
I'm its maintainer, thus I need/want to test these.

I have been tested these by using my local patches to switching card,
but maintenance it locally is not useful for me, and users who want to
know the sample DT settings.

And I have noticed that some local patch had bug, but no one noticed
about it (of course :)

ULCB/KF is very good board to test these.
So, I want to upstream these.

These are v2 patch-set for it.

One note here is that this patch *should not* have effect to
existing normal users, but useful for test user.
So, this patch-set adds "3 card" x "2 use case" dtsi file,
and ulcb/ulcb-kf "include" one of them which doesn't change anything.
test user can switch to other card or other use case by changing
"include" dtsi.

v1 -> v2
	- tidyup tab alignment
	- tidyup comments
	- remove no longer needed comment from ulcb/ulcb-kf.dtsi

Kuninori Morimoto (8):
  ARM: dts: renesas: #sound-dai-cells is used when simple-card
  arm64: dts: renesas: #sound-dai-cells is used when simple-card
  arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi
  arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi
  arm64: dts: renesas: add ulcb{-kf} Simple Audio Card dtsi
  arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi MIX + TDM Split dtsi
  arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi MIX + TDM Split dtsi
  arm64: dts: renesas: add ulcb{-kf} Simple Audio Card MIX + TDM Split dtsi

 arch/arm/boot/dts/r8a7742.dtsi                |   2 +-
 arch/arm/boot/dts/r8a7743.dtsi                |   2 +-
 arch/arm/boot/dts/r8a7744.dtsi                |   2 +-
 arch/arm/boot/dts/r8a7745.dtsi                |   2 +-
 arch/arm/boot/dts/r8a7778.dtsi                |   2 +-
 arch/arm/boot/dts/r8a7790.dtsi                |   2 +-
 arch/arm/boot/dts/r8a7791.dtsi                |   2 +-
 arch/arm/boot/dts/r8a7793.dtsi                |   2 +-
 arch/arm/boot/dts/r8a7794.dtsi                |   2 +-
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi     |   2 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi     |   2 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi     |   2 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi     |   2 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi     |   2 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi     |   2 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi     |   2 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     |   2 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi     |   2 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi     |   2 +-
 .../boot/dts/renesas/salvator-common.dtsi     |   3 -
 .../ulcb-audio-graph-card-mix+split.dtsi      |  91 +++++++++
 .../dts/renesas/ulcb-audio-graph-card.dtsi    |  85 +++++++++
 .../ulcb-audio-graph-card2-mix+split.dtsi     | 111 +++++++++++
 .../dts/renesas/ulcb-audio-graph-card2.dtsi   |  26 +++
 .../ulcb-kf-audio-graph-card-mix+split.dtsi   | 170 +++++++++++++++++
 .../dts/renesas/ulcb-kf-audio-graph-card.dtsi |  88 +++++++++
 .../ulcb-kf-audio-graph-card2-mix+split.dtsi  | 177 ++++++++++++++++++
 .../renesas/ulcb-kf-audio-graph-card2.dtsi    |  30 +++
 .../ulcb-kf-simple-audio-card-mix+split.dtsi  | 152 +++++++++++++++
 .../renesas/ulcb-kf-simple-audio-card.dtsi    |  85 +++++++++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi      |  72 ++-----
 .../ulcb-simple-audio-card-mix+split.dtsi     |  89 +++++++++
 .../dts/renesas/ulcb-simple-audio-card.dtsi   |  89 +++++++++
 arch/arm64/boot/dts/renesas/ulcb.dtsi         |  68 ++-----
 34 files changed, 1240 insertions(+), 134 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card-mix+split.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2-mix+split.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card-mix+split.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card-mix+split.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-simple-audio-card-mix+split.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi

-- 
2.25.1

