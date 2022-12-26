Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0EB6561F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Dec 2022 11:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbiLZKnf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Dec 2022 05:43:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiLZKnd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Dec 2022 05:43:33 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4476A251
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 02:43:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 29653CE0D9E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 10:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B04DC433D2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 10:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672051407;
        bh=W/e490DFWJO8+JUzrTld79kYGK3+Ozb69Hmk9qAHbB0=;
        h=Subject:From:Date:To:From;
        b=L22lHMf8S7QBxs/0dY8VPLV6F6VpEbGX3gJ+aPtMLrTa8Vixjlu6EfPky66YZHIbj
         v7cGxHB5bhQCxZ75H/4M/czzlZ5XIcgNBoEuNeK8KR8gmFWUzlQ6cxNTNJKpB/xPSp
         +jbBJ34hdcozNt6B7yoxSCYiyCE8j6ggIzHO1Htonbtxmdb7K6OUWRbjgTVLJ7Ik8N
         ZRp/CDTLzu7cHgPznoNwHKVN+xIGyHFA/5R8uuqCp9agNimHE1MjopGInUrTYT5pXg
         AhxNUzSExW9/eUfDlsVeif0ufjTBckXbogjgNQticlZwmCNI6fiXXK/F5XLVsgXdjG
         gxICQSLKGDR8g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 13280C43159
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 10:43:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <167205140702.7269.624594582520191101.git-patchwork-summary@kernel.org>
Date:   Mon, 26 Dec 2022 10:43:27 +0000
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

Series: mmc: tmio: further cleanups after kmap_atomic removal
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Ulf Hansson <ulf.hansson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=691199
  Lore link: https://lore.kernel.org/r/20221102125430.28466-1-wsa+renesas@sang-engineering.com
    Patches: [RFC,1/2] mmc: tmio: remove tmio_mmc_k(un)map_atomic helpers
             [RFC,2/2] mmc: tmio: remove 'alignment_shift' from platform data

Series: Fix pca954x i2c-mux node names
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=701303
  Lore link: https://lore.kernel.org/r/cover.1669999298.git.geert+renesas@glider.be
    Patches: [01/11] ARM: dts: ti: Fix pca954x i2c-mux node names
             [05/11] ARM: dts: socfpga: Fix pca9548 i2c-mux node name
             [10/11] MIPS: mscc: jaguar2: Fix pca9545 i2c-mux node names
             [11/11] powerpc: dts: fsl: Fix pca954x i2c-mux node names

Series: Add RZ/G2L DSI driver
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=678592
  Lore link: https://lore.kernel.org/r/20220920105501.396999-1-biju.das.jz@bp.renesas.com
    Patches: [v8,1/3] dt-bindings: display: bridge: Document RZ/G2L MIPI DSI TX bindings
             [v8,2/3] drm: rcar-du: Add RZ/G2L DSI driver
             [v8,3/3] drm: rcar-du: rzg2l_mipi_dsi: Enhance device lanes check

Series: dt-bindings: display: bridge: nxp,tda998x: Json-schema conversion and fixes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Tony Lindgren <tony@atomide.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=676993
  Lore link: https://lore.kernel.org/r/cover.1663165552.git.geert+renesas@glider.be
    Patches: [v2,1/3] ARM: dts: am335x: Fix TDA998x ports addressing

Patch: clocksource/drivers/sh_cmt: access registers according to spec
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Thomas Gleixner <tglx@linutronix.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=700601
  Lore link: https://lore.kernel.org/r/20221130210609.7718-1-wsa+renesas@sang-engineering.com

Series: drm/fb-helper: Untangle fbdev emulation and helpers
  Submitter: Thomas Zimmermann <tzimmermann@suse.de>
  Committer: Thomas Zimmermann <tzimmermann@suse.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=691689
  Lore link: https://lore.kernel.org/r/20221103151446.2638-1-tzimmermann@suse.de
    Patches: [v3,01/23] drm/komeda: Don't set struct drm_driver.lastclose
             [v3,02/23] drm/mcde: Don't set struct drm_driver.lastclose
             [v3,03/23] drm/vboxvideo: Don't set struct drm_driver.lastclose
             [v3,04/23] drm/amdgpu: Don't set struct drm_driver.output_poll_changed
             [v3,05/23] drm/imx/dcss: Don't set struct drm_driver.output_poll_changed
             [v3,06/23] drm/ingenic: Don't set struct drm_driver.output_poll_changed
             [v3,07/23] drm/logicvc: Don't set struct drm_driver.output_poll_changed
             [v3,08/23] drm/rockchip: Don't set struct drm_driver.output_poll_changed
             [v3,09/23] drm/panel-ili9341: Include <linux/backlight.h>
             [v3,10/23] drm/tve200: Include <linux/of.h>
             [v3,11/23] drm/fb-helper: Cleanup include statements in header file
             [v3,12/23] drm/fb_helper: Rename field fbdev to info in struct drm_fb_helper
             [v3,13/23] drm/fb-helper: Rename drm_fb_helper_alloc_fbi() to use _info postfix
             [v3,14/23] drm/fb-helper: Rename drm_fb_helper_unregister_fbi() to use _info postfix
             [v3,15/23] drm/fb-helper: Disconnect damage worker from update logic
             [v3,16/23] drm/fb-helper: Call fb_sync in I/O functions
             [v3,17/23] drm/fb-helper: Perform all fbdev I/O with the same implementation
             [v3,18/23] drm/fb_helper: Minimize damage-helper overhead
             [v3,19/23] drm/fb-helper: Always initialize generic fbdev emulation
             [v3,20/23] drm/fb-helper: Set flag in struct drm_fb_helper for leaking physical addresses
             [v3,21/23] drm/fb-helper: Move generic fbdev emulation into separate source file
             [v3,22/23] drm/fb-helper: Remove unnecessary include statements
             [v3,23/23] drm/fb-helper: Clarify use of last_close and output_poll_changed

Patch: media: v4l2-ctrls: Fix off-by-one error in integer menu control check
  Submitter: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=680608
  Lore link: https://lore.kernel.org/r/20220926163151.21445-1-laurent.pinchart@ideasonboard.com

Patch: rtc: rzn1: Check return value in rzn1_rtc_probe
  Submitter: Katrin Jo <zys.zljxml@gmail.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=692684
  Lore link: https://lore.kernel.org/r/20221107092544.3721053-1-zys.zljxml@gmail.com

Patch: None
  Submitter: John Ogness <john.ogness@linutronix.de>
  Committer: Petr Mladek <pmladek@suse.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=695160
  Lore link: https://lore.kernel.org/r/20221114162932.141883-40-john.ogness@linutronix.de

Series: R-Car CANFD fixes
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=688725
  Lore link: https://lore.kernel.org/r/20221025155657.1426948-1-biju.das.jz@bp.renesas.com
    Patches: [v2,1/3] can: rcar_canfd: Fix IRQ storm on global fifo receive
             [v2,3/3] can: rcar_canfd: Use devm_reset_control_get_optional_exclusive

Series: R-Can CAN FD driver enhancements
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Marc Kleine-Budde <mkl@pengutronix.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=687842
  Lore link: https://lore.kernel.org/r/20221022104357.1276740-1-biju.das.jz@bp.renesas.com
    Patches: [1/6] can: rcar_canfd: rcar_canfd_probe: Add struct rcar_canfd_hw_info to driver data

Series: media: i2c: ov5645 driver enhancements
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Sakari Ailus <sakari.ailus@linux.intel.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=690676
  Lore link: https://lore.kernel.org/r/20221031232202.131945-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v4,1/9] media: i2c: ov5645: Drop fetching the clk reference by name
             [v4,2/9] ARM: dts: imx6qdl-pico: Drop clock-names property
             [v4,3/9] ARM: dts: imx6qdl-wandboard: Drop clock-names property
             [v4,5/9] media: dt-bindings: ov5645: Convert OV5645 binding to a schema
             [v4,6/9] media: i2c: ov5645: Use runtime PM
             [v4,7/9] media: i2c: ov5645: Drop empty comment
             [v4,8/9] media: i2c: ov5645: Make sure to call PM functions
             [v4,9/9] media: i2c: ov5645: Call ov5645_entity_init_cfg() before registering the subdev

Series: Add driver for CSI2 and CRU modules found on Renesas RZ/G2L SoC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=698275
  Lore link: https://lore.kernel.org/r/20221123010943.324689-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v6,1/4] media: dt-bindings: Document Renesas RZ/G2L CSI-2 block
             [v6,2/4] media: dt-bindings: Document Renesas RZ/G2L CRU block
             [v6,3/4] media: platform: Add Renesas RZ/G2L MIPI CSI-2 receiver driver
             [v6,4/4] media: platform: Add Renesas RZ/G2L CRU driver

Patch: None
  Submitter: Jacob Keller <jacob.e.keller@intel.com>
  Committer: David S. Miller <davem@davemloft.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=682390
  Lore link: https://lore.kernel.org/r/20220930204851.1910059-9-jacob.e.keller@intel.com

Patch: None
  Submitter: Jacob Keller <jacob.e.keller@intel.com>
  Committer: David S. Miller <davem@davemloft.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=689792
  Lore link: https://lore.kernel.org/r/20221028110420.3451088-9-jacob.e.keller@intel.com

Series: media: rcar-vin: Add Gen3 scaler support
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=684063
  Lore link: https://lore.kernel.org/r/20221009183551.1664631-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [1/3] media: rcar-vin: Do not cache remote rectangle
             [2/3] media: rcar-vin: Store scaler in a function pointer
             [3/3] media: rcar-vin: Add support for Gen3 UDS (Up Down Scaler)

Series: remove label = "cpu" from DSA dt-binding
  Submitter: Arınç ÜNAL <arinc.unal@arinc9.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=700473
  Lore link: https://lore.kernel.org/r/20221130141040.32447-1-arinc.unal@arinc9.com
    Patches: [1/5] dt-bindings: net: qca,ar71xx: remove label = "cpu" from examples
             [4/5] mips: dts: remove label = "cpu" from DSA dt-binding

Patch: dt-bindings: iio: adc: renesas,rzg2l-adc: Document RZ/Five SoC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=695524
  Lore link: https://lore.kernel.org/r/20221115124128.1183144-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: [RFC] media: Documentation: Drop deprecated bytesused == 0
  Submitter: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=684077
  Lore link: https://lore.kernel.org/r/20221009213509.860-1-laurent.pinchart@ideasonboard.com

Patch: media: i2c: adv748x: Remove dead function declaration
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=683933
  Lore link: https://lore.kernel.org/r/20221008141205.3493964-1-niklas.soderlund+renesas@ragnatech.se

Patch: [net-next] net: remove explicit phylink_generic_validate() references
  Submitter: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=692212
  Lore link: https://lore.kernel.org/r/E1or0FZ-001tRa-DI@rmk-PC.armlinux.org.uk

Series: [1/2] dt-bindings: clock: qcom,gcc-ipq8074: use common GCC schema
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=689867
  Lore link: https://lore.kernel.org/r/20221028140326.43470-1-krzysztof.kozlowski@linaro.org
    Patches: [1/2] dt-bindings: clock: qcom,gcc-ipq8074: use common GCC schema
             [2/2] dt-bindings: clock: qcom: cleanup

Patch: [net-next] net: ethernet: renesas: rswitch: Fix signedness bug in rswitch_etha_wait_link_verification()
  Submitter: YueHaibing <yuehaibing@huawei.com>
  Committer: Paolo Abeni <pabeni@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=696778
  Lore link: https://lore.kernel.org/r/20221118063240.52164-1-yuehaibing@huawei.com

Patch: [GIT,PULL] Renesas ARM DT updates for v6.2 (take three)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=698820
  Lore link: https://lore.kernel.org/r/cover.1669283381.git.geert+renesas@glider.be

Patch: drm: rcar-du: Fix Kconfig dependency between DRM and RZG2L_MIPI_DSI
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=697776
  Lore link: https://lore.kernel.org/r/20221121181121.168278-1-biju.das.jz@bp.renesas.com

Patch: dt-bindings: thermal: rzg2l-thermal: Document RZ/Five SoC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Daniel Lezcano <daniel.lezcano@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=695513
  Lore link: https://lore.kernel.org/r/20221115121629.1181667-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: media: adv748x: afe: Select input port when initializing AFE
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=684039
  Lore link: https://lore.kernel.org/r/20221009144146.1199437-1-niklas.soderlund+renesas@ragnatech.se

Patch: [-next,v2] cacheinfo: Remove of_node_put() for fw_token
  Submitter: Pierre Gondois <Pierre.Gondois@arm.com>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=695872
  Lore link: https://lore.kernel.org/r/20221116094958.2141072-1-pierre.gondois@arm.com

Patch: [v3] PCI: endpoint: Fix WARN() when an endpoint driver is removed
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Lorenzo Pieralisi <lpieralisi@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=652972
  Lore link: https://lore.kernel.org/r/20220623003817.298173-1-yoshihiro.shimoda.uh@renesas.com

Patch: media: i2c: ov5645: Drop empty comment
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=681196
  Lore link: https://lore.kernel.org/r/20220927202005.750621-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Series: RZ/Five: Enable ADC/CANFD/I2C/OPP/Thermal Zones/TSU
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Palmer Dabbelt <palmer@rivosinc.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=695471
  Lore link: https://lore.kernel.org/r/20221115105135.1180490-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/3] riscv: Kconfig: Enable cpufreq kconfig menu

Patch: [net,v2] ravb: Fix "failed to switch device to config mode" message during unbind
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Paolo Abeni <pabeni@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=704450
  Lore link: https://lore.kernel.org/r/20221214105118.2495313-1-biju.das.jz@bp.renesas.com

Patch: mfd: bd957x: Fix Kconfig dependency
  Submitter: Vaittinen, Matti <matti.vaittinen@fi.rohmeurope.com>
  Committer: Lee Jones <lee@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=584487
  Lore link: https://lore.kernel.org/r/YZzI/gNDRdvdK0nv@fedora


Total patches: 76

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


