Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0CB6872AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Feb 2023 02:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbjBBBCs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Feb 2023 20:02:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjBBBCr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Feb 2023 20:02:47 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2137.outbound.protection.outlook.com [40.107.215.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 443EE60CB9
        for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Feb 2023 17:02:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xr9wUQ/ipTbMonNl6Qz4j0KJkZ+BkFkU3zWvgPrar1VTrhjEga7S/WIL11qnLc1w2P2LR2c2Rlry8ALjEwrUIzLgqUwgZIKRJITyYMkmKG7fCvbZn/k5RkrZ7I/JWMdH6Qr8UXS6Td+/qwpshed18UMLpCZrVPvZVZfXlM1v1tagBzuuooY0YzUBV/qbRsZ/BYQ7j9KnSJ23bZeDPaBz2/SLo6MPnJwx3VSdJhOWkRyB8HeGMkca7/N4DtbjRALavSadCFCahmchL+OUBwUHdxejF7RS/xWCqfeULF4PtUM0ucBZZX35OjCusHVe5dUtdTGUKnbbMDQzh6d6U9aymA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMleOXKUm08f5G/zRuZRRXdBO72cf8k18Ywt5zE8DY4=;
 b=M8fb7t9L9tyYsZfpjtldBQCYl1Dq5vaYg/kczd6KgD+CPoyazdXh6HFtOf0LcLfBdP7eSqk5lpAyrVDQDtdjUhzsIfQfaIv31oHf7XXkOAnOVdR1KSXdIJYL3dI3bICCBhE6lVlIultQIZuQJ5lkldm8A53H3zd3IFZcNsiflx2zVnwXtVKk/nINXHAlBu8Pz05eiYWtcZvRZCW0bewq+vNutcathousqmTrmc4PODchuPmPGe+WoeSV5U1ehdzCtTX5RLpuIIYkJFGIBJL6NKhFVNzeOsm/88Y5n2pxqy7+yl53KmloPZzUgt0wiR22U7IFYiZKX0uuE/0SCoQNzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMleOXKUm08f5G/zRuZRRXdBO72cf8k18Ywt5zE8DY4=;
 b=X5TML/mMED44/MdsNXuf7gs1LdLXb3nP4F1NdEv2LySzHLCGskvoBv2tLVu1Y2bES1L/Srkp48Y/odtEkE19Arf7gZjffH7dFykoXjhTmU7PqS0SLQL/XN1oULbEphXVvZVAS1OlEvrVaeYSMQjlaaLGPGQ8aqd6mvR7JdFfs+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5959.jpnprd01.prod.outlook.com (2603:1096:604:d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Thu, 2 Feb
 2023 01:02:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Thu, 2 Feb 2023
 01:02:42 +0000
Message-ID: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/9] arm64: dts: renesas: add V4H White Hawk Sound support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 2 Feb 2023 01:02:42 +0000
X-ClientProxiedBy: TYCP301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa40aee-1995-44ff-06fd-08db04b9300f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E86FW0Xi/nMArKwLfLyRwRT5iVmdni7fEtufhXi4XSKbJi9YaoPYRIniOEQOukbTtJuZbhkwV7DkJkZQEli+b9kR7wg/WrNvybBua5W7qxf0U9Lc/V/9fuKVg5hgZ9qIAsrBblFum07QuePpNGitNTAF4UtchX7ssksP5VZ0P9WU1fF5/KSdGHuSR/rf1e80iDoJxm2zA53uMONq4q4/BqeWQTd0/307M8c3tY9/XFpAlcfnM1HWyGlDW7ZB6+ruDV5LzciTET73DtaGG4cIOAZtSmvst9ny+E6At2AnyFnfboTGSjGjfSwtzEV9hT9PTloXm4bHqJAtw3BZah1xe7A4qWLTUyqedMs4HQbuCstmzHgcJctoOPjsr8A3cCRafWNr7I05utMc80+Cw24/8MfmSD0AMwRgEKmhBannKjxIFwtLxXU7BAnzK6AcLgCSumbCw0IlOdHjJU7Ml5gnj1DWKmznJV9bG5fwCubCZ5fn306/ubj5o67CgbLU+DuMWkTq6xbeoJGZBLcarJzN1G6X5IgqoS7CjGHDGYpLM2tGAKpjkctbxgYnN7i22X0S+GoxyTr58OF3iueudvhMDAIB8l5DxkieiYu9ovMalStvYuNq6uTl09bGZFa7lrAMSlMv3+kjuoccjNh/Cir+YexreXagciCMtXbFyuiiHK737DQFzX7zxiHjlx6FC6sPIOcNj93Br5u0ly7PInTq4quZ6lL8GkZb7yhe08w6fxZvvGArV0AZpm/kqOTGqPBgOMEq8wVsNCInWUfUvWtimA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199018)(36756003)(86362001)(38350700002)(8936002)(38100700002)(66946007)(66556008)(316002)(8676002)(4326008)(41300700001)(66476007)(2906002)(83380400001)(2616005)(5660300002)(478600001)(966005)(186003)(26005)(6512007)(6486002)(52116002)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?THbxoH05pbd0oGSSORwcvr3qZ+Tq3F3FT4LVp8QIh0rQuAVNLPBx4aYlz7zZ?=
 =?us-ascii?Q?aCSD7n5n5K2e+Z4Av7rYIUZGdb9cJCsOt3xssGHeOhvLIhXR71KfAWskWpVl?=
 =?us-ascii?Q?BB5j1w0+0LhyyX3oiZCNH/a1zIkgZ26b31iVn2j4g1fkTSmu3MaKB56kUuml?=
 =?us-ascii?Q?ONoqdDyk8HsxFxePt272TZjC+j5LGC+G0Q4PJFvjycqOcC0YfHMGusagQtzJ?=
 =?us-ascii?Q?hYk2cIEPxp3eD+jxvVO3tt5YwhE6kn1qjp8myXWc/5Z6+dZ/UbvKAGLAGNZe?=
 =?us-ascii?Q?OHSftClsvLguQRiFaJ4YRFx73n9kj52tARScIdQgxx4vzMvrS/nqGWxmlXJJ?=
 =?us-ascii?Q?vhRFvNjgQY0pt89Sry4EtlbFZ7Tq/W9Px/Ha1pgwINBFZ/O8X+CKLmHzNMaO?=
 =?us-ascii?Q?w1K7z1SSobJ+UAM3uRW0jYChQ1hYcLa5NwX1Zw8j4uBqETL0aEJw2Svy4iuB?=
 =?us-ascii?Q?Jtu8cYDwfvHOjGL1RD0EotEKM6sf7n8ATAQ76U1CDEKCXTsBBpYflxFSa02K?=
 =?us-ascii?Q?TixfIXXtv2OXx6GxeHptCyv6PnLdp2Q+S3jtPmFNtGLnmiyhQQM6ABDoMzF9?=
 =?us-ascii?Q?4BmoQamNhyYJuQqUoJ3VKvm+LjZDXdNQlCihig+hbceSefXgpCP7ZLmF07t3?=
 =?us-ascii?Q?20CqXcj4Rz0iXza88prCwQ1k2RfKT3ugqwCFIrBEM/2bFSn1KQu23lzUL70P?=
 =?us-ascii?Q?CER7gVLupaQvRm6iUm+oT75NX7WU9LoUU+bK9Aar816lKw1ZhjmOgCEBxzaz?=
 =?us-ascii?Q?jncQRdiQmMQRRIvlY2C3b3WvrQGkJMzEJCHx6bIJp2CC55Y81TyHJBUWNubn?=
 =?us-ascii?Q?ag6PRTwAe34Qn96qDmvlYCzS28AZ1+tKoOSXbGa5gY5nvNQh6ijhi7jJ5rOX?=
 =?us-ascii?Q?kpLQfkQAgrai1MiEySWlO6CfTlzzpPKUypCf+Rj5B7oxqE/bNJ4Q8iMJtBFE?=
 =?us-ascii?Q?EBkT1nj3Qwpiqrq6q5g9H4S4ourAxFSugiSWt/f5rjhjYGALn1l6kQuJCfJy?=
 =?us-ascii?Q?kv+XCjT2PwWZB5I1EtRil9qt1kjf8q1WO1f/Qxt8LJZQ0A4dh11Gwc1+iBx5?=
 =?us-ascii?Q?qkQ8V1N07k32Rz8Q7eGc2rtnRQNepce0PpLW8+JP28YUUynAue9mi0adG9Tz?=
 =?us-ascii?Q?D7boX807AjA2qz1eOccv6Z3x3QC/55F0xU4lJm7B/vRjhuixJHqAjqa+pUQp?=
 =?us-ascii?Q?xiBLH5U9HcK4IZFlxFOrbUvVI5V721DFN1QNjzWFxiCg+cpSB8upoVUvBoRH?=
 =?us-ascii?Q?0hs1jJ+c4zITPXsJF3rp9ruWeart1H9bN5NsKFYlOQ6ZaEhOFl0MrJ0Fuj+l?=
 =?us-ascii?Q?VEzg/DtcqF57p7pzDYQj06zWn6SVkJFv1XwQgPWYsueQoUuKVqIo3A6mv3Fl?=
 =?us-ascii?Q?rQKVrlsuS9DW9Av/tMUR4Ykf8cpRXG70gAWTAvrFv6CRBDpYUNPHKnCKWXyh?=
 =?us-ascii?Q?LSUFwJVMgSt4Hz4uiofEeOHz655Pp/d5FZkHlVIEXnSj4bNuqQp2Xjfn2fkz?=
 =?us-ascii?Q?GaQJksIo2hyEO2Yq5AC9oZPJL6zEdQ68NA6PIO3GJGDLOHgFKIiTHRsyuSIP?=
 =?us-ascii?Q?yBMaQ59OhgIXNY/7sjqcSTEYBJzwKiVEvlouM9ZuNPVl5JPCDuIczHL/4pqQ?=
 =?us-ascii?Q?qp78hG1NSlAxFkLjCTH6Y9Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa40aee-1995-44ff-06fd-08db04b9300f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 01:02:42.6527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89iD83VUCQuKxyhV6lE4cRIMw1dN3opDb4JNcnjUDujs13AGYza3Jj37I8nElma7obttIs5GPF6cM/UV12XLICEFfIkttIUha8V8MzdIPSa7uj1eOf0zE4I8pOY9biRu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5959
X-Spam-Status: No, score=-0.3 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

This patch-set add Sound support to V4H White Hawk board.
It needs ARD-AUDIO-DA7212 sound expansion board to use it.

And it needs R-Car Gen4 sound driver support which will be
supported on v6.3.
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?id=c2bc65274a307e11743d0f56a762f8e57f279b9e

I think [5/9] / [6/9] are depends on above ASoC branch,
others has no dependencies.

I'm happy to re-post [5/9][6/9] patches after v6.3-rc1 was released.
Please let me know about it if you need.

Link: https://lore.kernel.org/r/87y1pqt4vs.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (5):
  clk: renesas: r8a779g0: Add Audio clocks
  arm64: dts: r8a779g0-white-hawk-cpu.dtsi: add 5.0v regulator
  arm64: dts: renesas: r8a779g0: whitehawk: Add R-Car Sound support
  arm64: defconfig: Enable DA7213 Codec
  arm64: renesas_defconfig: Enable DA7213 Codec

Linh Phung (3):
  pinctrl: renesas: r8a779g0: Add Audio Clock support
  pinctrl: renesas: r8a779g0: Add Audio SSI support
  arm64: dts: renesas: r8a779g0: R-Car Sound support

Takeshi Kihara (1):
  clk: renesas: cpg-mssr: Fix MSSR register range for V4H

 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 .../r8a779g0-white-hawk-ard-audio-da7212.dts  | 194 ++++++++++++++++++
 .../dts/renesas/r8a779g0-white-hawk-cpu.dtsi  |   9 +
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     |  78 +++++++
 arch/arm64/configs/defconfig                  |   1 +
 arch/arm64/configs/renesas_defconfig          |   1 +
 drivers/clk/renesas/r8a779g0-cpg-mssr.c       |   2 +
 drivers/clk/renesas/renesas-cpg-mssr.c        |   8 +-
 drivers/pinctrl/renesas/pfc-r8a779g0.c        |  58 ++++++
 9 files changed, 348 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dts

-- 
2.25.1

