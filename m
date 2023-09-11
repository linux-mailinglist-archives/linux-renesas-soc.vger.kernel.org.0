Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEF2479AE4D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 01:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241590AbjIKVRh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Sep 2023 17:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237494AbjIKMyA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 08:54:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28970E40
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 05:53:55 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1727C433C7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 12:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694436834;
        bh=JWK7FQZNnw3yowHrzdZrk91/9zF8LvwsYmSoWNDnSFs=;
        h=Subject:From:Date:To:From;
        b=K9snVuRIiXmmE1Y5OIiTklbHJCU1Oz3ZMtvvzSTO94/d5gnaaCnrB3lDZzrmKBK4d
         GdRLggtYwGtBt1ZQ2/pNpFLTLQYRL7lww2yOkSWP0YBQdQkinQljokgJj1O2e6eeQ/
         TtGDgiTL6Nyrnjxcq/riRZA0Pj4/Ps+wQB4CHitOGfOHE45zBKc1Vnwj3v6KevDoQu
         CuXs+nBHyPSUvvXvx+OO9MR4FmbVpl5x23nfKNrBLu5MJUzsmLfs7THEKVmHZhCq47
         0ZNzJ3ZeCUVvE7JOjaiECYk80lObmihQatBLbc7v0qyP+5O/iGgYwgFurhF5tEGcYg
         SH+7o1swLNF2A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A6C20C64459
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 12:53:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <169443683462.23253.6797133289603425591.git-patchwork-summary@kernel.org>
Date:   Mon, 11 Sep 2023 12:53:54 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: of: overlay/unittest: Miscellaneous fixes and improvements
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=770475
  Lore link: https://lore.kernel.org/r/cover.1690533838.git.geert+renesas@glider.be
    Patches: [v2,01/13] of: dynamic: Do not use "%pOF" while holding devtree_lock
             [v2,02/13] of: overlay: Call of_changeset_init() early
             [v2,03/13] of: unittest: Fix overlay type in apply/revert check
             [v2,04/13] of: unittest: Restore indentation in overlay_bad_add_dup_prop test
             [v2,05/13] of: unittest: Improve messages and comments in apply/revert checks
             [v2,06/13] of: unittest: Merge of_unittest_apply{,_revert}_overlay_check()
             [v2,07/13] of: unittest: Cleanup partially-applied overlays
             [v2,08/13] of: unittest: Add separators to of_unittest_overlay_high_level()
             [v2,09/13] of: overlay: unittest: Add test for unresolved symbol
             [v2,10/13] of: unittest-data: Convert remaining overlay DTS files to sugar syntax
             [v2,11/13] of: unittest-data: Fix whitespace - blank lines
             [v2,12/13] of: unittest-data: Fix whitespace - indentation
             [v2,13/13] of: unittest-data: Fix whitespace - angular brackets

Series: net: dsa: rzn1-a5psw: add support for vlan and .port_bridge_flags
  Submitter: Alexis Lothoré <alexis.lothore@bootlin.com>
  Committer: David S. Miller <davem@davemloft.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=774867
  Lore link: https://lore.kernel.org/r/20230810093651.102509-1-alexis.lothore@bootlin.com
    Patches: [net-next,v5,1/3] net: dsa: rzn1-a5psw: use a5psw_reg_rmw() to modify flooding resolution
             [net-next,v5,2/3] net: dsa: rzn1-a5psw: add support for .port_bridge_flags
             [net-next,v5,3/3] net: dsa: rzn1-a5psw: add vlan support

Series: clk: renesas: add 922 ADG bit
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=771395
  Lore link: https://lore.kernel.org/r/87r0onprph.wl-kuninori.morimoto.gx@renesas.com
    Patches: [1/9] clk: renesas: r8a7795: add 922 ADG

Series: net: Remove redundant of_match_ptr() macro
  Submitter: Jinjie Ruan <ruanjinjie@huawei.com>
  Committer: David S. Miller <davem@davemloft.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=775803
  Lore link: https://lore.kernel.org/r/20230814025447.2708620-1-ruanjinjie@huawei.com
    Patches: [net-next,v3,1/5] net: dsa: realtek: Remove redundant of_match_ptr()
             [net-next,v3,2/5] net: dsa: rzn1-a5psw: Remove redundant of_match_ptr()
             [net-next,v3,3/5] net: gemini: Remove redundant of_match_ptr()
             [net-next,v3,4/5] net: qualcomm: Remove redundant of_match_ptr()
             [net-next,v3,5/5] wlcore: spi: Remove redundant of_match_ptr()

Patch: [RFT] mmc: uniphier-sd: register irqs before registering controller
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Ulf Hansson <ulf.hansson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=764904
  Lore link: https://lore.kernel.org/r/20230712141327.20827-1-wsa+renesas@sang-engineering.com

Patch: of: unittest: Run overlay apply/revert sequence three times
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Rob Herring <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=778168
  Lore link: https://lore.kernel.org/r/a9fb4eb560c58d11a7f167bc78a137b46e76cf15.1692699743.git.geert+renesas@glider.be

Patch: [-next] PCI: rcar-gen2: Use devm_platform_get_and_ioremap_resource()
  Submitter: Yang Li <yang.lee@linux.alibaba.com>
  Committer: Krzysztof Wilczyński <kwilczynski@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=733073
  Lore link: https://lore.kernel.org/r/20230323091644.91981-1-yang.lee@linux.alibaba.com

Patch: soc: renesas: rmobile-sysc: fix -Wvoid-pointer-to-enum-cast warning
  Submitter: Justin Stitt <justinstitt@google.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=776122
  Lore link: https://lore.kernel.org/r/20230814-void-drivers-soc-renesas-rmobile-sysc-v1-1-6648dfd854de@google.com

Series: [1/2] drm: rcar-du: Add more formats to DRM_MODE_BLEND_PIXEL_NONE support
  Submitter: Damian Hobson-Garcia <dhobsong@igel.co.jp>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=770709
  Lore link: https://lore.kernel.org/r/20230728200714.2084223-1-dhobsong@igel.co.jp
    Patches: [1/2] drm: rcar-du: Add more formats to DRM_MODE_BLEND_PIXEL_NONE support
             [2/2] drm:rcar-du: Enable ABGR and XBGR formats

Series: drm: Atomic modesetting doc and comment improvements
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Javier Martinez Canillas <javierm@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=767454
  Lore link: https://lore.kernel.org/r/cover.1689779916.git.geert+renesas@glider.be
    Patches: [v3,1/4] drm/todo: Add atomic modesetting references
             [v3,2/4] drm/todo: Convert list of fbconv links to footnotes
             [v3,3/4] drm: Remove references to removed transitional helpers
             [v3,4/4] drm: Fix references to drm_plane_helper_check_state()

Patch: [-next] usb: gadget: udc: Remove redundant initialization for udc_driver
  Submitter: Li Zetao <lizetao1@huawei.com>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=772408
  Lore link: https://lore.kernel.org/r/20230803032838.3045730-1-lizetao1@huawei.com

Patch: None
  Submitter: Yangtao Li <frank.li@vivo.com>
  Committer: Wolfram Sang <wsa@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=763881
  Lore link: https://lore.kernel.org/r/20230710063351.17490-8-frank.li@vivo.com

Series: ARM: dts: renesas: LBSC and FLASH improvements
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=780813
  Lore link: https://lore.kernel.org/r/cover.1693481518.git.geert+renesas@glider.be
    Patches: [01/13] ARM: dts: renesas: ape6evm: Drop bogus "mtd-rom" compatible value
             [02/13] ARM: dts: renesas: gr-peach: Remove unneeded probe-type property

Patch: [GIT,PULL] clk: renesas: Updates for v6.6 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Stephen Boyd <sboyd@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=776909
  Lore link: https://lore.kernel.org/r/cover.1692262242.git.geert+renesas@glider.be

Series: [1/2] ARM: dts: use capital "OR" for multiple licenses in SPDX
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=778490
  Lore link: https://lore.kernel.org/r/20230823085146.113562-1-krzysztof.kozlowski@linaro.org
    Patches: [1/2] ARM: dts: use capital "OR" for multiple licenses in SPDX
             [2/2] arm64: dts: use capital "OR" for multiple licenses in SPDX

Series: arm64: dts: renesas: r8a779f0: Add PCIe support
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=781718
  Lore link: https://lore.kernel.org/r/20230905012404.2915246-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [v4,1/2] arm64: dts: renesas: r8a779f0: Add PCIe Host and Endpoint nodes
             [v4,2/2] arm64: dts: renesas: r8a779f0: spider: Enable PCIe Host ch0

Patch: drm: rcar-du: Replace DRM_INFO() with drm_info()
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=752110
  Lore link: https://lore.kernel.org/r/20230530092639.18374-1-laurent.pinchart+renesas@ideasonboard.com

Series: Renesas SoC updates for v6.6
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=770548
  Lore link: https://lore.kernel.org/r/cover.1690545139.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.6
             [GIT,PULL,2/3] Renesas ARM SoC updates for v6.6
             [GIT,PULL,3/3] Renesas DTS updates for v6.6

Series: arm64: dts: renesas: handles ADG bit for sound clk_i
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=778087
  Lore link: https://lore.kernel.org/r/87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com
    Patches: [01/15] arm64: dts: renesas: r8a774a1: handles ADG bit for sound clk_i

Patch: [net-next] net: dsa: rzn1-a5psw: remove redundant logs
  Submitter: Alexis Lothoré <alexis.lothore@bootlin.com>
  Committer: David S. Miller <davem@davemloft.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=778128
  Lore link: https://lore.kernel.org/r/20230822084112.54803-1-alexis.lothore@bootlin.com

Patch: [01/18] drm/renesas: Convert to devm_platform_ioremap_resource()
  Submitter: Yangtao Li <frank.li@vivo.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=763336
  Lore link: https://lore.kernel.org/r/20230707072034.48977-1-frank.li@vivo.com

Patch: [v2,01/19] drm/renesas: Convert to devm_platform_ioremap_resource()
  Submitter: Yangtao Li <frank.li@vivo.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=763838
  Lore link: https://lore.kernel.org/r/20230710032355.72914-1-frank.li@vivo.com

Patch: dt-bindings: pinctrl: Drop 'phandle' properties
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=777568
  Lore link: https://lore.kernel.org/r/20230819010946.916772-1-robh@kernel.org

Patch: [resend] drm/panel: simple: Simplify matching using of_device_get_match_data()
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Javier Martinez Canillas <javierm@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=766508
  Lore link: https://lore.kernel.org/r/bca1d6f6a0582988accbb48d709aa9de7ad49ed7.1689600771.git.geert+renesas@glider.be

Patch: ARM: dts: renesas: blanche: Fix typo in GP_11_2 pin name
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=780581
  Lore link: https://lore.kernel.org/r/203128eca2261ffc33b83637818dd39c488f42b0.1693408326.git.geert+renesas@glider.be

Patch: media: Explicitly include correct DT includes
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=765840
  Lore link: https://lore.kernel.org/r/20230714174712.4059313-1-robh@kernel.org

Series: drm: Convert to platform remove callback returning void
  Submitter: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Committer: Douglas Anderson <dianders@chromium.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=745617
  Lore link: https://lore.kernel.org/r/20230507162616.1368908-1-u.kleine-koenig@pengutronix.de
    Patches: [37/53] drm/rcar-du: Convert to platform remove callback returning void

Patch: [-next] media: rcar_jpu: Remove redundant dev_err()
  Submitter: Jinjie Ruan <ruanjinjie@huawei.com>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=769908
  Lore link: https://lore.kernel.org/r/20230727101128.2752153-1-ruanjinjie@huawei.com

Patch: [v3] drm/bridge_connector: Handle drm_connector_init_with_ddc() failures
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Javier Martinez Canillas <javierm@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=766493
  Lore link: https://lore.kernel.org/r/3a7e9540d8dc94298d021aa2fb046ae8616ca4dd.1689599701.git.geert+renesas@glider.be


Total patches: 56

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


