Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17A10601137
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Oct 2022 16:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbiJQOgJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Oct 2022 10:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbiJQOgI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Oct 2022 10:36:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D347660CB4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Oct 2022 07:36:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6D9DDB818CC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Oct 2022 14:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 264F1C433D6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Oct 2022 14:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666017361;
        bh=ryS0vggc9LD6YGSgoAuz3qrtzQJrwMg4ashyleXsCbA=;
        h=Subject:From:Date:To:From;
        b=E/vcq7v26e/Pb9ad0Dla4kVkvSCKNSBDqIWkD0JPtiEV+0xAN7yTW/ftKGMRk8aPE
         EIl+GeQCQ+jJFYO0y94hIKiSOw3wXIS1aiVOiPNX/YS4J2tR06bbrpLG9XLSoYmFml
         gacQe9BU3StNyIrt4RzGxxfPw1dV3zpvbwSavmyqBz4Ae4xPhdtqgcsKwAPzwreVqf
         tptW21kZNU1auc/U4Q2aQv00anTowKm87zabN4T6iphA13sxmv4mkZEt7BUyeQbm1j
         l1ok45hLQ0JO6AfMNdsS7n0J8/7c8nuIW4Gd2tAnzRvAfqU6A4Hh2R51oqGnb6CmUt
         0yfvxvoe4zc0w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0588DE270EB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Oct 2022 14:36:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166601736094.25096.10617877407363192538.git-patchwork-summary@kernel.org>
Date:   Mon, 17 Oct 2022 14:36:00 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v2] dt-bindings: display: bridge: renesas,dw-hdmi: Add resets property
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=672970
  Lore link: https://lore.kernel.org/r/20220831213536.7602-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: arm64: dts: renesas: r8a779g0: Fix HSCIF0 "brg_int" clock
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=683735
  Lore link: https://lore.kernel.org/r/a5bd4148f92806f7c8e577d383370f810315f586.1665155947.git.geert+renesas@glider.be

Series: arm64: dts: renesas: r8a779g0: Add PWM and TPU device
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=683745
  Lore link: https://lore.kernel.org/r/cover.1665156417.git.geert+renesas@glider.be
    Patches: [1/2] arm64: dts: renesas: r8a779g0: Add PWM device nodes
             [2/2] arm64: dts: renesas: r8a779g0: Add TPU device node

Patch: ARM: defconfig cleanup
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=668759
  Lore link: https://lore.kernel.org/r/20220818135522.3143514-1-arnd@kernel.org

Series: [1/3] drm: rcar-du: remove unnecessary include
  Submitter: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=668409
  Lore link: https://lore.kernel.org/r/20220817132803.85373-1-tomi.valkeinen@ideasonboard.com
    Patches: [1/3] drm: rcar-du: remove unnecessary include

Series: r8a779f0: enable CMT timers
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=659263
  Lore link: https://lore.kernel.org/r/20220713101447.3804-1-wsa+renesas@sang-engineering.com
    Patches: [1/3] clk: renesas: r8a779f0: Add CMT clocks

Series: dt-bindings: display: bridge: nxp,tda998x: Json-schema conversion and fixes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=676993
  Lore link: https://lore.kernel.org/r/cover.1663165552.git.geert+renesas@glider.be
    Patches: [v2,1/3] ARM: dts: am335x: Fix TDA998x ports addressing
             [v2,3/3] dt-bindings: display: bridge: nxp,tda998x: Convert to json-schema

Patch: dt-bindings: pinctrl: Add missing (unevaluated|additional)Properties on child nodes
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=670314
  Lore link: https://lore.kernel.org/r/20220823145649.3118479-6-robh@kernel.org

Series: arm64: dts: renesas: r8a779g0/white-hawk: Add SDHI/eMMC support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=684694
  Lore link: https://lore.kernel.org/r/cover.1665558371.git.geert+renesas@glider.be
    Patches: [1/2] arm64: dts: renesas: r8a779g0: Add SDHI node

Series: Add support for RZ/G2L VSPD
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=671788
  Lore link: https://lore.kernel.org/r/20220828081334.30078-1-biju.das.jz@bp.renesas.com
    Patches: [v14,1/5] media: dt-bindings: media: renesas,vsp1: Document RZ/G2L VSPD bindings
             [v14,2/5] media: renesas: vsp1: Add support to deassert/assert reset line
             [v14,3/5] media: renesas: vsp1: Add support for VSP software version
             [v14,4/5] media: renesas: vsp1: Add VSP1_HAS_NON_ZERO_LBA feature bit
             [v14,5/5] media: renesas: vsp1: Add support for RZ/G2L VSPD

Series: drm/bridge: ti-sn65dsi86: Basic DP support
  Submitter: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Committer: Robert Foss <robert.foss@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=672744
  Lore link: https://lore.kernel.org/r/20220831082653.20449-1-tomi.valkeinen@ideasonboard.com
    Patches: [v6,1/3] drm/bridge: ti-sn65dsi86: Reject modes with too large blanking
             [v6,2/3] drm/bridge: ti-sn65dsi86: Support DisplayPort (non-eDP) mode
             [v6,3/3] drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP

Series: drm/plane: Remove drm_plane_init(), plus other cleanups
  Submitter: Thomas Zimmermann <tzimmermann@suse.de>
  Committer: Thomas Zimmermann <tzimmermann@suse.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=675642
  Lore link: https://lore.kernel.org/r/20220909105947.6487-1-tzimmermann@suse.de
    Patches: [1/4] drm/plane: Remove drm_plane_init()
             [3/4] drm/plane-helper: Warn if atomic drivers call non-atomic helpers

Series: arm64: dts: renesas: r8a779g0/white-hawk: Add RPC and QSPI FLASH support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=684800
  Lore link: https://lore.kernel.org/r/cover.1665583435.git.geert+renesas@glider.be
    Patches: [1/2] arm64: dts: renesas: r8a779g0: Add RPC node
             [2/2] arm64: dts: renesas: white-hawk-cpu: Add QSPI FLASH support

Patch: drm: rcar-du: Drop leftovers variables from Makefile
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=671668
  Lore link: https://lore.kernel.org/r/20220827004220.8397-1-laurent.pinchart+renesas@ideasonboard.com

Series: [1/2] drm: rcar-du: Drop unused encoder header files
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=671015
  Lore link: https://lore.kernel.org/r/20220825103905.2450049-1-biju.das.jz@bp.renesas.com
    Patches: [1/2] drm: rcar-du: Drop unused encoder header files

Patch: ARM: Drop CMDLINE_FORCE dependency on !ARCH_MULTIPLATFORM
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=681020
  Lore link: https://lore.kernel.org/r/c557b149780faa2299700585afc9d270ede7f78b.1664285062.git.geert+renesas@glider.be

Series: Add RZ/N1 CAN support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Marc Kleine-Budde <mkl@pengutronix.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=672511
  Lore link: https://lore.kernel.org/r/20220830164518.1381632-1-biju.das.jz@bp.renesas.com
    Patches: [v3,1/3] dt-bindings: can: nxp,sja1000: Document RZ/N1 power-domains support

Patch: None
  Submitter: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=670156
  Lore link: https://lore.kernel.org/r/20220823105706.44282-1-tomi.valkeinen@ideasonboard.com

Series: drm: rcar-du: DSI fixes
  Submitter: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=670653
  Lore link: https://lore.kernel.org/r/20220824124726.187224-1-tomi.valkeinen@ideasonboard.com
    Patches: [v4,1/5] drm: rcar-du: lvds: Rename pclk enable/disable functions
             [v4,2/5] drm: rcar-du: dsi: Properly stop video mode TX
             [v4,3/5] drm: rcar-du: dsi: Improve DSI shutdown
             [v4,5/5] drm: rcar-du: dsi: Fix VCLKSET write

Patch: i2c: riic: Use devm_platform_ioremap_resource()
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Wolfram Sang <wsa@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=676648
  Lore link: https://lore.kernel.org/r/20220913170121.24246-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: net: ravb: Add R-Car Gen4 support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=675617
  Lore link: https://lore.kernel.org/r/2ee968890feba777e627d781128b074b2c43cddb.1662718171.git.geert+renesas@glider.be

Series: Remove label = "cpu" from DSA dt-bindings
  Submitter: Vladimir Oltean <vladimir.oltean@nxp.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=676285
  Lore link: https://lore.kernel.org/r/20220912175058.280386-1-vladimir.oltean@nxp.com
    Patches: [net-next,1/3] dt-bindings: net: dsa: mt7530: replace label = "cpu" with proper checks
             [net-next,2/3] dt-bindings: net: dsa: mt7530: stop requiring phy-mode on CPU ports
             [net-next,3/3] dt-bindings: net: dsa: remove label = "cpu" from examples

Series: [v2,1/2] lib/string_helpers: Add str_read_write() helper
  Submitter: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Committer: Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=656112
  Lore link: https://lore.kernel.org/r/20220703154232.55549-1-andriy.shevchenko@linux.intel.com
    Patches: [v2,1/2] lib/string_helpers: Add str_read_write() helper

Series: Add i2c to Renesas RZ/V2M SoC and board
  Submitter: Phil Edworthy <Phil.Edworthy@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=669335
  Lore link: https://lore.kernel.org/r/20220819193944.337599-1-phil.edworthy@renesas.com
    Patches: [1/3] clk: renesas: r9a09g011: Add IIC clock and reset entries

Series: r8a779f0: add SDHI support
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=658561
  Lore link: https://lore.kernel.org/r/20220711134656.277730-1-wsa+renesas@sang-engineering.com
    Patches: [1/3] clk: renesas: r8a779f0: Add sdh0 clock

Patch: ARM: Drop CMDLINE_* dependency on ATAGS
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=681021
  Lore link: https://lore.kernel.org/r/09f0619e8038654d01588d9ad3a023485b2bd77f.1664285209.git.geert+renesas@glider.be

Patch: [net-next,v5] ravb: Add RZ/G2L MII interface support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=677063
  Lore link: https://lore.kernel.org/r/20220914192604.265859-1-biju.das.jz@bp.renesas.com

Patch: dt-bindings: clock: renesas,rzg2l: Document RZ/Five SoC
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=663176
  Lore link: https://lore.kernel.org/r/20220726174525.620-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 43

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


