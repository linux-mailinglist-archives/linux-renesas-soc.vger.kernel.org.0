Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7B754F12A1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 12:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355668AbiDDKJN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 06:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239305AbiDDKJL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 06:09:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B873C4A0
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 03:07:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B8F0B614C2
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 10:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FC85C340F3
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 10:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649066834;
        bh=68A7eMfvVozICjHLg3QGEblpbv/DXzO197vXN6BF/F0=;
        h=Subject:From:Date:To:From;
        b=IXfVWh/m7ZFO6rqIPSCeiyUhPDkftx6sO5eztCakyd4XvzfADzontujXWROxxTkyC
         nMSriQdR7AqRBzkFyayIG3lnyFLvZcOqrjxAhaKiafP5piOGGhxKbeRCsiV0cJNiAb
         bE+KRCEF4r3u3qFr7JkCGTlJ2jHqKAF2lKhhz5TlW/yRm3SUa6XVgWkfmYw5UxVUoW
         +CC1Gnv9f2BvkbQ19M+4F0KzTJmDY3icd7zYxb670Q0hmp8bxNWqW6vovATk9qB/yR
         TwWbirse7QY3lSuHRb1G9DmvKDMYsxkRn0/ddJLUDy8zcTC174KxA4tq4S2UtVoXsw
         R3GYHjhjQQbZQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E2849E85B8C
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 10:07:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <164906683384.4049.1091529641657216486.git-patchwork-summary@kernel.org>
Date:   Mon, 04 Apr 2022 10:07:13 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: media: Use platform_get_irq*() variants to fetch IRQ's
  Submitter: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=601074
  Lore link: https://lore.kernel.org/r/20211223173015.22251-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [01/13] media: vsp1: Use platform_get_irq() to get the interrupt
             [03/13] media: bdisp: Use platform_get_irq() to get the interrupt
             [04/13] media: s5p-mfc: Use platform_get_irq() to get the interrupt
             [05/13] media: stm32-dma2d: Use platform_get_irq() to get the interrupt
             [07/13] media: exynos-gsc: Use platform_get_irq() to get the interrupt
             [08/13] media: marvell-ccic: Use platform_get_irq() to get the interrupt
             [10/13] media: exynos4-is: Use platform_get_irq() to get the interrupt
             [11/13] media: s5p-g2d: Use platform_get_irq() to get the interrupt
             [12/13] media: mtk-vpu: Drop unnecessary call to platform_get_resource()
             [13/13] media: coda: Use platform_get_irq() to get the interrupt

Series: media: Centralize MIPI CSI-2 data types in shared header
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=607589
  Lore link: https://lore.kernel.org/r/20220123160857.24161-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [1/6] media: Define MIPI CSI-2 data types in a shared header file
             [3/6] media: rcar-isp: Use mipi-csi2.h
             [4/6] media: rcar-csi2: Use mipi-csi2.h
             [6/6] media: xilinx: csi2rxss: Use mipi-csi2.h

Series: pinctrl: renesas: Add R-Car S4-8 support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=616352
  Lore link: https://lore.kernel.org/r/cover.1645457792.git.geert+renesas@glider.be
    Patches: [v2,01/12] dt-bindings: pinctrl: renesas,pfc: Document r8a779f0 support
             [v2,02/12] pinctrl: renesas: Add PORT_GP_CFG_19 macros
             [v2,03/12] pinctrl: renesas: Initial R8A779F0 PFC support
             [v2,04/12] pinctrl: renesas: r8a779f0: Add SCIF pins, groups, and functions
             [v2,05/12] pinctrl: renesas: r8a779f0: Add I2C pins, groups, and functions
             [v2,06/12] pinctrl: renesas: r8a779f0: Add HSCIF pins, groups, and functions
             [v2,07/12] pinctrl: renesas: r8a779f0: Add INTC-EX pins, groups, and function
             [v2,08/12] pinctrl: renesas: r8a779f0: Add MMC pins, groups, and function
             [v2,09/12] pinctrl: renesas: r8a779f0: Add MSIOF pins, groups, and functions
             [v2,10/12] pinctrl: renesas: r8a779f0: Add PCIe pins, groups, and function
             [v2,11/12] pinctrl: renesas: r8a779f0: Add QSPI pins, groups, and functions
             [v2,12/12] pinctrl: renesas: r8a779f0: Add Ethernet pins, groups, and functions

Series: media: mc: Simplify media pipeline start/stop
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Sakari Ailus <sakari.ailus@linux.intel.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=605232
  Lore link: https://lore.kernel.org/r/20220113150042.15630-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [1/2] media: media-entity: Add media_pad_is_streaming() helper function

Series: media: Drop .set_mbus_config(), improve .get_mbus_config()
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=602395
  Lore link: https://lore.kernel.org/r/20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [RFC,1/8] media: pxa_camera: Drop usage of .set_mbus_config()
             [RFC,2/8] media: i2c: ov6650: Drop implementation of .set_mbus_config()
             [RFC,3/8] media: v4l2-subdev: Drop .set_mbus_config() operation
             [RFC,4/8] media: v4l2-fwnode: Move bus config structure to v4l2_mediabus.h
             [RFC,6/8] media: v4l2-mediabus: Drop legacy V4L2_MBUS_CSI2_*_LANE flags
             [RFC,7/8] media: v4l2-mediabus: Drop legacy V4L2_MBUS_CSI2_CHANNEL_* flags

Series: ASoC: sh: rz-ssi: Code cleanup and fixes
  Submitter: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=605671
  Lore link: https://lore.kernel.org/r/20220115012303.29651-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,1/5] ASoC: sh: rz-ssi: Drop calling rz_ssi_pio_recv() recursively
             [v2,3/5] ASoC: sh: rz-ssi: Drop ssi parameter from rz_ssi_stream_init()
             [v2,4/5] ASoC: sh: rz-ssi: Change return type of rz_ssi_stream_is_valid() to bool
             [v2,5/5] ASoC: sh: rz-ssi: Add rz_ssi_set_substream() helper function

Patch: [v2,01/13] media: vsp1: Use platform_get_irq() to get the interrupt
  Submitter: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=604305
  Lore link: https://lore.kernel.org/r/20220111002314.15213-2-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: media: i2c: max9286: Implement media entity .link_validate() operation
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=605347
  Lore link: https://lore.kernel.org/r/20220113205150.6533-1-laurent.pinchart+renesas@ideasonboard.com

Series: arm64: dts: renesas: Enable MAX9286 on Eagle and Condor
  Submitter: Jacopo Mondi <jacopo+renesas@jmondi.org>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=596783
  Lore link: https://lore.kernel.org/r/20211216163439.139579-1-jacopo+renesas@jmondi.org
    Patches: [v8,1/7] dt-bindings: media: max9286: Re-indent example
             [v8,2/7] dt-bindings: media: max9286: Define 'maxim,gpio-poc'

Series: ASoC: sh: rz-ssi: Trivial changes
  Submitter: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=608282
  Lore link: https://lore.kernel.org/r/20220125132457.14984-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/3] ASoC: sh: rz-ssi: Use a do-while loop in rz_ssi_pio_recv()
             [2/3] ASoC: sh: rz-ssi: Add rz_ssi_set_substream() helper function
             [3/3] ASoC: sh: rz-ssi: Remove duplicate macros

Patch: pinctrl: sh-pfc: checker: Fix miscalculation of number of states
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=616368
  Lore link: https://lore.kernel.org/r/6d8a6a05564f38f9d20464c1c17f96e52740cf6a.1645460429.git.geert+renesas@glider.be

Patch: media: rcar-csi2: Drop comma after SoC match table sentinel
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=619953
  Lore link: https://lore.kernel.org/r/0c6a183ade26c68b96d91ce14e675ca01fc563fb.1646311410.git.geert+renesas@glider.be

Patch: None
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=603005
  Lore link: https://lore.kernel.org/r/20220105201558.31325-1-laurent.pinchart+renesas@ideasonboard.com

Patch: [v2] i2c: don't expose function which is only used internally
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Wolfram Sang <wsa@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=613231
  Lore link: https://lore.kernel.org/r/20220210213341.2121-1-wsa+renesas@sang-engineering.com

Series: drm: rcar-du: Avoid flicker when enabling a VSP plane
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=616396
  Lore link: https://lore.kernel.org/r/20220221171340.11113-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [1/2] drm: rcar-du: Don't select VSP1 sink on Gen3
             [2/2] drm: rcar-du: Don't restart group when enabling plane on Gen3

Series: Kill some dead code in the Renesas Ethernet drivers
  Submitter: Sergey Shtylyov <s.shtylyov@omp.ru>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=609633
  Lore link: https://lore.kernel.org/r/20220128203838.17423-1-s.shtylyov@omp.ru
    Patches: [1/2] ravb: ravb_close() always returns 0
             [2/2] sh_eth: sh_eth_close() always returns 0

Series: Remove some dead code in the Renesas Ethernet drivers
  Submitter: Sergey Shtylyov <s.shtylyov@omp.ru>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=609730
  Lore link: https://lore.kernel.org/r/20220129115517.11891-1-s.shtylyov@omp.ru
    Patches: [v2,1/2] ravb: ravb_close() always returns 0
             [v2,2/2] sh_eth: sh_eth_close() always returns 0

Series: add R-Car M3-W+ (r8a99761) LVDS encoder support
  Submitter: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=601157
  Lore link: https://lore.kernel.org/r/20211224052309.1997096-1-nikita.yoush@cogentembedded.com
    Patches: [1/3] drm: rcar-du: lvds: Add r8a77961 support

Patch: [v2] phy: make phy_set_max_speed() *void*
  Submitter: Sergey Shtylyov <s.shtylyov@omp.ru>
  Committer: David S. Miller <davem@davemloft.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=609602
  Lore link: https://lore.kernel.org/r/4889c4d5-cff8-5b15-bd50-8014b95b18e8@omp.ru

Patch: spi: Fix erroneous sgs value with min_t()
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=623969
  Lore link: https://lore.kernel.org/r/20220316175317.465-1-biju.das.jz@bp.renesas.com

Series: arm64: dts: renesas: r8a77961: improvements from BSP
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=624905
  Lore link: https://lore.kernel.org/r/20220319223306.60782-1-wsa+renesas@sang-engineering.com
    Patches: [1/2] arm64: dts: renesas: r8a77961: Add CAN-FD node

Patch: [1/2] ARM: remove support for NOMMU ARMv4/v5
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=624019
  Lore link: https://lore.kernel.org/r/20220316211315.2819835-1-arnd@kernel.org

Patch: usb: Drop commas after SoC match table sentinels
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=619966
  Lore link: https://lore.kernel.org/r/5cae409f647272a5679291ebc0000bfeccc14160.1646311762.git.geert+renesas@glider.be

Series: Renesas RZ/V2L add support for SDHI/CANFD/I2C/OSTM/USB2/SBC/RSPI/WDT/SSI
  Submitter: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=618474
  Lore link: https://lore.kernel.org/r/20220227203744.18355-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [01/12] arm64: dts: renesas: r9a07g054: Fillup the SDHI{0,1} stub nodes
             [05/12] arm64: dts: renesas: r9a07g054: Fillup the I2C{0,1,2,3} stub nodes

Patch: [v3] media: dt-bindings: media: renesas,csi2: Update data-lanes property
  Submitter: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=607106
  Lore link: https://lore.kernel.org/r/20220121002622.30359-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: [net-next] sh_eth: kill useless initializers in sh_eth_{suspend|resume}()
  Submitter: Sergey Shtylyov <s.shtylyov@omp.ru>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=609773
  Lore link: https://lore.kernel.org/r/f09d7c64-4a2b-6973-09a4-10d759ed0df4@omp.ru

Series: media: Kconfig/Makefile reorg
  Submitter: Mauro Carvalho Chehab <mchehab@kernel.org>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=623074
  Lore link: https://lore.kernel.org/r/cover.1647242578.git.mchehab@kernel.org
    Patches: [10/64] media: platform: place Renesas drivers on a separate dir

Series: media: Kconfig/Makefile reorg
  Submitter: Mauro Carvalho Chehab <mchehab@kernel.org>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=623246
  Lore link: https://lore.kernel.org/r/cover.1647274406.git.mchehab@kernel.org
    Patches: [v2,10/67] media: platform: place Renesas drivers on a separate dir

Patch: [GIT,PULL,FOR,v5.18] R-Car DU misc improvements
  Submitter: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Committer: Dave Airlie <airlied@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=619941
  Lore link: https://lore.kernel.org/r/YiCwy3FR3gPng4dN@pendragon.ideasonboard.com

Patch: mmc: Drop commas after SoC match table sentinels
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Ulf Hansson <ulf.hansson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=619965
  Lore link: https://lore.kernel.org/r/9050fa278eaaa9e6ec719a3b158a2fad285560d0.1646311673.git.geert+renesas@glider.be

Patch: dt-bindings: clock: renesas: Make example 'clocks' parsable
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Stephen Boyd <sboyd@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=619290
  Lore link: https://lore.kernel.org/r/20220301190400.1644150-1-robh@kernel.org

Patch: mmc: sh_mmcif: Simplify division/shift logic
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Ulf Hansson <ulf.hansson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=616374
  Lore link: https://lore.kernel.org/r/68d689c39c769d298b53ee8cb9de0e594a2999b2.1645460780.git.geert+renesas@glider.be

Patch: base: soc: Make soc_device_match() simpler and easier to read
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=619160
  Lore link: https://lore.kernel.org/r/9f9107c06f7d065ae6581e5290ef5d72f7298fd1.1646132835.git.geert+renesas@glider.be

Patch: MAINTAINERS: rectify entry for ROHM MULTIFUNCTION BD9571MWV-M PMIC DEVICE DRIVERS
  Submitter: Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Committer: Lee Jones <lee.jones@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=621388
  Lore link: https://lore.kernel.org/r/20220308085136.30753-1-lukas.bulwahn@gmail.com

Patch: None
  Submitter: Maxime Ripard <maxime@cerno.tech>
  Committer: Maxime Ripard <maxime@cerno.tech>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=611903
  Lore link: https://lore.kernel.org/r/20220207163515.1038648-17-maxime@cerno.tech

Patch: None
  Submitter: Maxime Ripard <maxime@cerno.tech>
  Committer: Maxime Ripard <maxime@cerno.tech>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=616248
  Lore link: https://lore.kernel.org/r/20220221095918.18763-16-maxime@cerno.tech


Total patches: 74

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


