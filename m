Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD61264C1F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Dec 2022 02:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236915AbiLNBrt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Dec 2022 20:47:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbiLNBrs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 20:47:48 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2138.outbound.protection.outlook.com [40.107.113.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1EAF193D9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Dec 2022 17:47:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cD0N9GYt6zS1lFqEBU7WeL57CSosIf/tDWdFHQjOnIX4Kcu2Tkl1VFLalWSSytwyLZi3xjRpbA8zBE+K5rHr/Tylp9WG7NIFCVrbEjvGGvAegmFlo0qN8c+fFmYgi8ZI6v29jzvPmLrdD6+9OCOYSXqFuH5uhm01Pu2dxQwRZMfkMnAEjxyC5AAuBNDs6Z0arriP7yIKglhb6cHpJ4dfhxBycg/K2ds45feVAViLU/lBz7Z9HChfzinuXsUu0gXFYYOsBR/RjALwzJlon/NwWLFJsyvnLEhhObkhS9w46fqN0KoYbeg2ojs6UiJccYE5bR2KWeMz72wcTrWRa6HW2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qpsmb+kZdbz4RSVskemfloD3r2VMQEr+2AF18xfkiIk=;
 b=S+NS5KgJgi4riGW3P0fuvyqJKI91JAjCc4+DTssoANi8Vn0FcEzxB7IyoDqtgvxYpd9g7q2Ox4OIhmlLq7wNy/B7y3/6pXGYbDt5s287mEbeEzgrk6lcWGEvOsu0GAc/18sY+BvODuUB+BB1O1LBmsTFgZnDPDUjTHHzkjL8r2mnIk4ydS61ZmSk+yTmoqTJeXRFwatkY81P0MVrPXnLVxMx+C5tQkqNgJqEAaszNuQEKC7SCHwZ14VhPBmONztDiIGl7sJrtRnsEFeDUN3BDIyru0kyAOHdg2PdiK82sCYWDlL8XR9jhZtYKi5WY0Cct6MmWp0DcsPKwtyWKaRiUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qpsmb+kZdbz4RSVskemfloD3r2VMQEr+2AF18xfkiIk=;
 b=BBoSkz9mlfFbxq83t0GaRon+qBgHd3lpldtva21oUagTw7fzjWEirOGtF91Ss9knehBO4mrcHTYuqKnfEuufQyIbpUrgUO1DkIj7aC9gQKCvBitVKNzGd8a15moRFgtG+wVaw0WTVtTf9iNNWTb/kkqEAEwQbFhinA7o6Wo4Jqo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5860.jpnprd01.prod.outlook.com (2603:1096:604:bc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 01:47:43 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 01:47:43 +0000
Message-ID: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 0/8] arm64: dts: renesas: Simple-Card / Audio-Graph-Card/Card2 dts for ULCB/KF
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Wed, 14 Dec 2022 01:47:43 +0000
X-ClientProxiedBy: TYWPR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5860:EE_
X-MS-Office365-Filtering-Correlation-Id: cbfa5cb5-e271-4598-a5db-08dadd75311f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sn2Em9l5jnQf7S2JkhoAel0/2Th1M7WUrDnkXNrs4OGlDQLveO/L6AfInuRCapjAagoZ4OZM+K6i40ciWCjKBoLi+OuyXtH3EMwMfmz8010GHTC4sTVH4+FZJ5P+eVxaO+izl4Gn9qw6h3CkUPcDsWcnW8Kb+bf779n7AP4kqikx/aOvyd4+RbE0ldo0+qDiqMTTU5VQPWmzpkzZxsSO1JIxM0aFopKFp42OftQYaLfMlcdEpLQzGEKLj1gpUivWnVXT5TEZ92/WVUGEcpfM8chCTUFzXzdl/+xsOhX0v2N7MxAaRCVSbwEyj+yMfzq9QT5UJ2mmCuOrASXf7WsIq0sypDwyRVsb0K/4KK5yuo1LZ+iZ3rDkNobLy6+FHawsF5kxkOi7RfiggRYSwxgHj2hMjnf3pv83H24yNj6GELBT+skyrr4rsM4K4enYqhDJADAb6qUuq+yaXAxHMHatLcxkYsn9D4EB6jPnrC1W/8iFcF4QOplOdQSwMN1tvK7TlZtPWcR+fqym3O8rBC7iUMYHaDCxIQd0AAX1KAUOqjrecqtEm21gc/YChe4Y+P5kMCgZlfnHXCHsoiIi+OvK9D03qRA3PkuYm6BQhC2SMKpeP4oVadlklB2WpzcD38QczXsXi1TTQFElWAf+OQ/ytr7RAVOq8YhB/7P5Fy6ljsrTF0D04Rp1ytz9NqGaCnGMN2f9WXxHiZw1PSZary6vhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199015)(36756003)(66476007)(316002)(4326008)(6916009)(41300700001)(8676002)(83380400001)(38350700002)(38100700002)(86362001)(2906002)(66556008)(52116002)(6506007)(6486002)(26005)(66946007)(6512007)(2616005)(5660300002)(8936002)(186003)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PmfJVpDiWJJS5LFWiG+4DZZYO7Aqkk67QW87CYpGO2pPMrBbtDnMmmQS62mM?=
 =?us-ascii?Q?ZFPrchWtFMrtyOB60NWRF1dglklgb823jakQ/1wgV4Gj1IGG1fe7pE3UU4PE?=
 =?us-ascii?Q?DREaur0hV1S58Mn1KE37bwOcj+a7HgDXTtenF3mGLW4FVI9DP8yKXcUCjqyd?=
 =?us-ascii?Q?U0v1tECGCV+w9Rp0a2YYIZiTz8tSJoLBoRWO/rfL/U8GSIOR4blWKvM+ch/T?=
 =?us-ascii?Q?q8QJaIxub1J2/TivkDLEDVGhInUJtu8q8GBjRpZUtOWZh+QVyb1kc13iDjB9?=
 =?us-ascii?Q?kKt7MuYWcK9yD4c2e5quT4ydrdLCKlJ4oPq5dcn1i31FiQ19W+mhICcn9h6q?=
 =?us-ascii?Q?mU1LmuLkytQWeg+M0DF5zDBU6F9E4MVsXQ1GWEKTW2ZB1r7ku4VMqBUs+GEG?=
 =?us-ascii?Q?mtXevhGS0CoRdgpaHDyVr5X51WwIu2aIYsWu3dD8vcVMlSkLdpylh/YLzde/?=
 =?us-ascii?Q?DaOg3Tc7TvB9NBgvhrC3ImBxS1kiRD5CdDa/c+r1+YEDeWwqDAelzTLUTmO+?=
 =?us-ascii?Q?XK3yHjKhAErqSwd/6DXiX//6iV5ao5/Z5LQWZck2aByMa2SAziY4ME0uXIv4?=
 =?us-ascii?Q?ejOYBk5yAFPssmOExAdrxEqwR1mft3FUtn8FYxPWON+1UC19NHSvGtP00kWx?=
 =?us-ascii?Q?LqZGN6+n/5twbDNZxPEJWt4pb67LgoveqQfSRaW3JWSAGxbPklTE6/5z8bbS?=
 =?us-ascii?Q?NQEcHV5tgNTxHy6llhyWGx51iv4/TUq2n47FEtGvzfzMQLCEphTb03gx9DWK?=
 =?us-ascii?Q?t8EG7m664UKdy+3t4YytEDdqa9eUKWqvt/Mvt1x3PkQ9bwT3Ts4ilHqexoR6?=
 =?us-ascii?Q?PTblqwgY46yxlU7SIrLu5y7R93+B1BaSbw3N2uSiDlJtnmYGVTDso3ZIuABW?=
 =?us-ascii?Q?q6AAciHUmKmIyNghEdnPbCPTW8+3P/wSRY15AIMVNp5QrKc1BAXqknB5sb/l?=
 =?us-ascii?Q?uNsGFdDwmfhcAiwjZc9qDanwsYagQO9T1YMMk/6JuORP2w8f5FC5cM111JBK?=
 =?us-ascii?Q?PxiYguQiQMkdPGBhJyrjcF5omHjdhicSMsQDghlzPEPftM6DUs6HBaUJj0vC?=
 =?us-ascii?Q?SBNo/dqzc2yBHjB3idxFTnFND3cpJqAwO6wmDvVXEWq2FvS0mHMSJ8VQWmLb?=
 =?us-ascii?Q?rbdyoDzI1yryr+/3CZatMagq++8SjAPQGSD8WgUuhtaVkI32PzEGVSa68Fji?=
 =?us-ascii?Q?GPqTKsbRzNVK7TAfMcCuqJYVkOxOy2gLaMJ9kNH9Jqy72iiYLQLjVlUC987e?=
 =?us-ascii?Q?BLVmW9z3IOlmtNxtTTPAEpwxM/UTXil0jgOm4gvhErs/MwZQKN7fMLtmS2j+?=
 =?us-ascii?Q?0ogNUq1CPGoBfHrAHAPFiydPHh/kXHAFOWVCsDoo/yuluZGQPCY7au97ChUH?=
 =?us-ascii?Q?k0NbMig9W+8nGjLfFj+zlPF2wpqc2JoqTjIqCxwKGIPcPmv8Ux/m2iZMUm7m?=
 =?us-ascii?Q?JLUsihFNqkLDfkmhly55HsCsu/HNYHfsBAp8KMq5jvnEGgpR9EYSGTOMOycV?=
 =?us-ascii?Q?sZU/Vt7LcMaBqAU54tiaTUM3SfKcGtoCbwQSdwe6GTFhKLezuc6zgauSl1TU?=
 =?us-ascii?Q?TFyeUD2hBFFWtHCtevJ1lIj8MS43XNschnRNpKsH0/LNfCFVUejFSuC77N6I?=
 =?us-ascii?Q?cGRoEPlWtVHIg8B+uZ6Kd00=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbfa5cb5-e271-4598-a5db-08dadd75311f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 01:47:43.2197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/5ONWAjqQJwa7m6Q5F82bG9MTsJhdQFYukQNpczCpsUi50aEqpViBRZHD9eRr0mWdBeCPNqCMpTtg6GUXumqGnLq6g/F4mqER9lo+9swkgi6ksh72UZF+YzU9gdKa6Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5860
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

One note here is that this patch *should not* have effect to
existing normal users, but useful for test user.
So, this patch-set adds "3 card" x "2 use case" dtsi file,
and ulcb/ulcb-kf "include" one of them which doesn't change anything.
test user can switch to other card or other use case by changing
"include" dtsi.

[1/8][2/8] are small tidyup patches for all SoC sound.

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
 .../ulcb-audio-graph-card-mix+split.dtsi      |  89 +++++++++
 .../dts/renesas/ulcb-audio-graph-card.dtsi    |  85 +++++++++
 .../ulcb-audio-graph-card2-mix+split.dtsi     | 111 +++++++++++
 .../dts/renesas/ulcb-audio-graph-card2.dtsi   |  26 +++
 .../ulcb-kf-audio-graph-card-mix+split.dtsi   | 162 ++++++++++++++++
 .../dts/renesas/ulcb-kf-audio-graph-card.dtsi |  88 +++++++++
 .../ulcb-kf-audio-graph-card2-mix+split.dtsi  | 177 ++++++++++++++++++
 .../renesas/ulcb-kf-audio-graph-card2.dtsi    |  30 +++
 .../ulcb-kf-simple-audio-card-mix+split.dtsi  | 137 ++++++++++++++
 .../renesas/ulcb-kf-simple-audio-card.dtsi    |  85 +++++++++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi      |  66 ++-----
 .../ulcb-simple-audio-card-mix+split.dtsi     |  86 +++++++++
 .../dts/renesas/ulcb-simple-audio-card.dtsi   |  89 +++++++++
 arch/arm64/boot/dts/renesas/ulcb.dtsi         |  60 ++----
 34 files changed, 1212 insertions(+), 120 deletions(-)
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





Thank you for your help !!

Best regards
---
Kuninori Morimoto
