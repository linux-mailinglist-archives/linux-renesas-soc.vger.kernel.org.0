Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 144AC6ABED4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Mar 2023 12:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjCFLzf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Mar 2023 06:55:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbjCFLzZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 06:55:25 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B947DEC42
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2023 03:55:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 22200B80DA6
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2023 11:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7742C433D2
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2023 11:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678103718;
        bh=z2syD0vAnkbpZuOHqh2E/gLCElN4ttpmDRES6syNkxk=;
        h=Subject:From:Date:To:From;
        b=d34Ni0dsoJqWEikl3O290zfuj1AMboDJM0vWhIgR4N7BD0o9tvJz0ghs1dR0VdHm6
         PQ7f8Uii53fTCDZEm5MJ6K6zhiwbho/+lImaepYLcb4SgGF5NPndnqjf6bYejonkX4
         F325TafD7QkaduuTEMw0CbInFInuZ9wudLpcRU2NKcLSQEISduD1ClBTlF0xLbK3Z8
         BlkY9AymGraAaHJ6mo9Sx+c/OpjZKKXB7bCKlZKUaaqvjYOWi93Kmdg+3uGKoaPtbK
         MpJ1xiTJPdbQOty2/syfACkMW+DypHOcDacfctUDvLgh3wEPlpexKz3HkzDzeNTWwk
         2xJgtXC8tHJpA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B7E92E55B14
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2023 11:55:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <167810371867.18423.7645587047113613438.git-patchwork-summary@kernel.org>
Date:   Mon, 06 Mar 2023 11:55:18 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Series: media: i2c: max9286: Small new features
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=602228
  Lore link: https://lore.kernel.org/r/20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [v2,01/11] dt-bindings: media: i2c: max9286: Add support for per-port supplies
             [v2,06/11] media: i2c: max9286: Rename MAX9286_DATATYPE_RAW11 to RAW12
             [v2,08/11] media: i2c: max9286: Define macros for all bits of register 0x15
             [v2,11/11] media: i2c: max9286: Select HS as data enable signal

Series: media: i2c: max9286: Small new features
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=704625
  Lore link: https://lore.kernel.org/r/20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [v3,01/12] dt-bindings: media: i2c: max9286: Add support for per-port supplies
             [v3,05/12] media: i2c: max9286: Support manual framesync operation
             [v3,06/12] media: i2c: max9286: Rename MAX9286_DATATYPE_RAW11 to RAW12
             [v3,07/12] media: i2c: max9286: Support 12-bit raw bayer formats
             [v3,08/12] media: i2c: max9286: Define macros for all bits of register 0x15
             [v3,09/12] media: i2c: max9286: Configure remote I2C speed from device tree
             [v3,10/12] media: i2c: max9286: Configure bus width from device tree
             [v3,11/12] media: i2c: max9286: Select HS as data enable signal

Series: fw_devlink improvements
  Submitter: Saravana Kannan <saravanak@google.com>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=719304
  Lore link: https://lore.kernel.org/r/20230207014207.1678715-1-saravanak@google.com
    Patches: [v3,01/12] driver core: fw_devlink: Don't purge child fwnode's consumer links
             [v3,02/12] driver core: fw_devlink: Improve check for fwnode with no device/driver
             [v3,04/12] gpiolib: Clear the gpio_device's fwnode initialized flag before adding
             [v3,05/12] driver core: fw_devlink: Add DL_FLAG_CYCLE support to device links
             [v3,06/12] driver core: fw_devlink: Allow marking a fwnode link as being part of a cycle
             [v3,07/12] driver core: fw_devlink: Consolidate device link flag computation
             [v3,08/12] driver core: fw_devlink: Make cycle detection more robust
             [v3,09/12] of: property: Simplify of_link_to_phandle()
             [v3,10/12] irqchip/irq-imx-gpcv2: Mark fwnode device as not initialized
             [v3,11/12] firmware: arm_scmi: Set fwnode for the scmi_device
             [v3,12/12] mtd: mtdpart: Don't create platform device that'll never probe

Series: drm: Remove includes for drm_crtc_helper.h
  Submitter: Thomas Zimmermann <tzimmermann@suse.de>
  Committer: Alex Deucher <alexander.deucher@amd.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=712373
  Lore link: https://lore.kernel.org/r/20230116131235.18917-1-tzimmermann@suse.de
    Patches: [01/22] drm/amdgpu: Fix coding style
             [04/22] drm/arm/komeda: Remove unnecessary include statements for drm_crtc_helper.h
             [05/22] drm/aspeed: Remove unnecessary include statements for drm_crtc_helper.h
             [06/22] drm/ast: Remove unnecessary include statements for drm_crtc_helper.h
             [07/22] drm/bridge: Remove unnecessary include statements for drm_crtc_helper.h
             [08/22] drm/gma500: Remove unnecessary include statements for drm_crtc_helper.h
             [09/22] drm/i2c/ch7006: Remove unnecessary include statements for drm_crtc_helper.h
             [10/22] drm/ingenic: Remove unnecessary include statements for drm_crtc_helper.h
             [11/22] drm/kmb: Remove unnecessary include statements for drm_crtc_helper.h
             [12/22] drm/logicvc: Remove unnecessary include statements for drm_crtc_helper.h
             [13/22] drm/nouveau: Remove unnecessary include statements for drm_crtc_helper.h
             [14/22] drm/radeon: Remove unnecessary include statements for drm_crtc_helper.h
             [15/22] drm/rockchip: Remove unnecessary include statements for drm_crtc_helper.h
             [16/22] drm/shmobile: Remove unnecessary include statements for drm_crtc_helper.h
             [17/22] drm/sprd: Remove unnecessary include statements for drm_crtc_helper.h
             [19/22] drm/tidss: Remove unnecessary include statements for drm_crtc_helper.h
             [20/22] drm/udl: Remove unnecessary include statements for drm_crtc_helper.h
             [21/22] drm/vboxvideo: Remove unnecessary include statements for drm_crtc_helper.h
             [22/22] drm/crtc-helper: Remove most include statements from drm_crtc_helper.h

Series: Reset related fixes for rzg2l_wdt
  Submitter: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
  Committer: Wim Van Sebroeck <wim@linux-watchdog.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=696430
  Lore link: https://lore.kernel.org/r/20221117114907.138583-1-fabrizio.castro.jz@renesas.com
    Patches: [1/2] watchdog: rzg2l_wdt: Issue a reset before we put the PM clocks
             [2/2] watchdog: rzg2l_wdt: Handle TYPE-B reset for RZ/V2M

Patch: ASoC: rsnd: adg: Fix BRG typos
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=722139
  Lore link: https://lore.kernel.org/r/ac6365c17861d71fbc89d823089db4aafdb763ed.1676470202.git.geert+renesas@glider.be

Series: Add Polling support for role detection with HD3SS3220
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=703459
  Lore link: https://lore.kernel.org/r/20221209171836.71610-1-biju.das.jz@bp.renesas.com
    Patches: [v2,1/2] dt-bindings: usb: ti,hd3ss3220: Update interrupt property as optional
             [v2,2/2] usb: typec: hd3ss3220: Add polling support

Patch: thermal: Remove core header inclusion from drivers
  Submitter: Daniel Lezcano <daniel.lezcano@linaro.org>
  Committer: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=719176
  Lore link: https://lore.kernel.org/r/20230206153432.1017282-1-daniel.lezcano@linaro.org

Patch: [net-next] net: pcs: rzn1-miic: remove unused struct members and use miic variable
  Submitter: Clément Léger <clement.leger@bootlin.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=719987
  Lore link: https://lore.kernel.org/r/20230208161249.329631-1-clement.leger@bootlin.com

Patch: dt-bindings: display: bridge: renesas,rzg2l-mipi-dsi: Document RZ/V2L support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Neil Armstrong <neil.armstrong@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=698211
  Lore link: https://lore.kernel.org/r/20221122195413.1882486-1-biju.das.jz@bp.renesas.com

Series: [v3,1/7] drm: rcar-du: dsi: add 'select RESET_CONTROLLER'
  Submitter: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=714676
  Lore link: https://lore.kernel.org/r/20230123104742.227460-2-tomi.valkeinen+renesas@ideasonboard.com
    Patches: [v3,1/7] drm: rcar-du: dsi: add 'select RESET_CONTROLLER'
             [v3,5/7] drm: rcar-du: Add quirk for H3 ES1.x pclk workaround
             [v3,6/7] drm: rcar-du: Fix setting a reserved bit in DPLLCR
             [v3,7/7] drm: rcar-du: Stop accessing non-existant registers on gen4

Series: v4l: add support for multiplexed streams
  Submitter: Jacopo Mondi <jacopo+renesas@jmondi.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=87953
  Lore link: https://lore.kernel.org/r/20190305185150.20776-1-jacopo+renesas@jmondi.org
    Patches: [v3,01/31] media: entity: Use pad as a starting point for graph walk
             [v3,17/31] v4l: Add stream to frame descriptor

Series: v4l: add support for multiplexed streams
  Submitter: Jacopo Mondi <jacopo+renesas@jmondi.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=98275
  Lore link: https://lore.kernel.org/r/20190328200608.9463-1-jacopo+renesas@jmondi.org
    Patches: [v4,01/31] media: entity: Use pad as a starting point for graph walk
             [v4,17/31] v4l: Add stream to frame descriptor

Series: Renesas V4H DSI & DP output support
  Submitter: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=700774
  Lore link: https://lore.kernel.org/r/20221201095631.89448-1-tomi.valkeinen+renesas@ideasonboard.com
    Patches: [v5,1/7] dt-bindings: display: renesas,du: Provide bindings for r8a779g0
             [v5,2/7] dt-bindings: display: bridge: renesas,dsi-csi2-tx: Add r8a779g0
             [v5,6/7] drm: rcar-du: Add r8a779g0 support
             [v5,7/7] drm: rcar-du: dsi: Add r8A779g0 support

Series: Renesas SoC updates for v6.3
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=712031
  Lore link: https://lore.kernel.org/r/cover.1673702287.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.3
             [GIT,PULL,2/3] Renesas driver updates for v6.3
             [GIT,PULL,3/3] Renesas DT updates for v6.3

Series: media/drm: renesas: Add new pixel formats
  Submitter: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=706165
  Lore link: https://lore.kernel.org/r/20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com
    Patches: [v3,1/7] media: Add 2-10-10-10 RGB formats
             [v3,3/7] media: renesas: vsp1: Change V3U to be gen4
             [v3,4/7] media: renesas: vsp1: Add V4H SoC version
             [v3,5/7] media: renesas: vsp1: Add new formats (2-10-10-10 ARGB, Y210, Y212)
             [v3,6/7] drm: rcar-du: Bump V3U to gen 4
             [v3,7/7] drm: rcar-du: Add new formats (2-10-10-10 ARGB, Y210)

Patch: [v2] dt-bindings: leds: Document Bluetooth and WLAN triggers
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Lee Jones <lee@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=714463
  Lore link: https://lore.kernel.org/r/0d0de1bc949d24e08174205c13c0b59bd73c1ea8.1674384302.git.geert+renesas@glider.be

Series: drm bridge updates
  Submitter: Sam Ravnborg <sam@ravnborg.org>
  Committer: Maxime Ripard <maxime@cerno.tech>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=660451
  Lore link: https://lore.kernel.org/r/20220717174454.46616-1-sam@ravnborg.org
    Patches: [v1,01/12] drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs
             [v1,02/12] drm/bridge: Drop unused drm_bridge_chain functions

Patch: dt-bindings: watchdog: renesas,wdt: Document RZ/Five SoC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Wim Van Sebroeck <wim@linux-watchdog.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=696942
  Lore link: https://lore.kernel.org/r/20221118133829.12855-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: None
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=704969
  Lore link: https://lore.kernel.org/r/20221216004500.4263-1-laurent.pinchart+renesas@ideasonboard.com

Patch: None
  Submitter: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=705475
  Lore link: https://lore.kernel.org/r/20221219021820.24596-1-laurent.pinchart@ideasonboard.com

Patch: None
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=714917
  Lore link: https://lore.kernel.org/r/20230123225013.10476-1-laurent.pinchart+renesas@ideasonboard.com

Patch: None
  Submitter: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=700339
  Lore link: https://lore.kernel.org/r/20221130080810.517470-1-tomi.valkeinen+renesas@ideasonboard.com

Patch: driver core: bus: Handle early calls to bus_to_subsys()
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=723736
  Lore link: https://lore.kernel.org/r/0a92979f6e790737544638e8a4c19b0564e660a2.1676983596.git.geert+renesas@glider.be

Patch: [v2] drm: rcar-du: depend on DRM_RCAR_DU for components on that SoC
  Submitter: Peter Robinson <pbrobinson@gmail.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=709810
  Lore link: https://lore.kernel.org/r/20230108060401.391061-1-pbrobinson@gmail.com

Patch: [v3] PCI: Fix dropping valid root bus resources with .end = zero
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Bjorn Helgaas <bhelgaas@google.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=720672
  Lore link: https://lore.kernel.org/r/da0fcd5e86c74239be79c7cb03651c0fce31b515.1676036673.git.geert+renesas@glider.be

Patch: lib: Add Dhrystone benchmark test
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Andrew Morton <akpm@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=702992
  Lore link: https://lore.kernel.org/r/4d07ad990740a5f1e426ce4566fb514f60ec9bdd.1670509558.git.geert+renesas@glider.be

Series: None
  Submitter: Paul Cercueil <paul@crapouillou.net>
  Committer: Paul Cercueil <paul@crapouillou.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=692887
  Lore link: https://lore.kernel.org/r/20221107175256.360839-7-paul@crapouillou.net
    Patches: [17/26] drm: rcar-du: Remove #ifdef guards for PM related functions
             [19/26] drm: shmobile: Remove #ifdef guards for PM related functions

Series: None
  Submitter: Paul Cercueil <paul@crapouillou.net>
  Committer: Paul Cercueil <paul@crapouillou.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=700214
  Lore link: https://lore.kernel.org/r/20221129191942.138244-4-paul@crapouillou.net
    Patches: [v2,17/26] drm: rcar-du: Remove #ifdef guards for PM related functions
             [v2,19/26] drm: shmobile: Remove #ifdef guards for PM related functions

Patch: [v2] clocksource/drivers/riscv: Get rid of clocksource_arch_init() callback
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Daniel Lezcano <daniel.lezcano@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=707603
  Lore link: https://lore.kernel.org/r/20221229224601.103851-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 88

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


