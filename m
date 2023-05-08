Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 975956FA2E7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 May 2023 11:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233015AbjEHJDZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 May 2023 05:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233405AbjEHJDL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 May 2023 05:03:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3D202271D
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 May 2023 02:02:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2BA8760FA3
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 May 2023 09:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80839C433D2
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 May 2023 09:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683536481;
        bh=VyEFBNEm7PzN9RoDyndqJX2+J8E1lpOgIEC8sgmVgko=;
        h=Subject:From:Date:To:From;
        b=tJOh46/Q/q5fnGGtmtg6TMwVu3fMulT5jjr29YwiXmQYAcI9eveaNlYsaTML+m1Dc
         nzk5Z5LtYGCrpvHWJ2HOCkNQ+d8QR8bkGnxia6N/tkuYfO83ybcGLm8V1BeIzJYJQn
         uta+PGvaYXVpHSS33XPj1yQhLAqcny2leZ60rrHTU9abEYuS6IYM3op0P9oBr7aq67
         pRSkXDCTYTbg0bR8hfvVria8cfCxt3WV7dqt5BSjoHSmMeBgh16+HSmh4pjHJrjDg9
         AaYtuWwAGDDfsfve/eIQ7Dqfis8s3h5qToJf3kht3dv8c5F++8YDWo9UE0dazg04AV
         nDXiTymIAgC1A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 61956E49F62
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 May 2023 09:01:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <168353648133.17503.10110939549656899307.git-patchwork-summary@kernel.org>
Date:   Mon, 08 May 2023 09:01:21 +0000
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

Series: Add RZ/G2L MTU3a Core, Counter and pwm driver
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Lee Jones <lee@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=735350
  Lore link: https://lore.kernel.org/r/20230330111632.169434-1-biju.das.jz@bp.renesas.com
    Patches: [v15,1/6] dt-bindings: timer: Document RZ/G2L MTU3a bindings
             [v15,2/6] mfd: Add Renesas RZ/G2L MTU3a core driver
             [v15,3/6] Documentation: ABI: sysfs-bus-counter: add cascade_counts_enable and external_input_phase_clock_select
             [v15,4/6] counter: Add Renesas RZ/G2L MTU3a counter driver
             [v15,5/6] MAINTAINERS: Add entries for Renesas RZ/G2L MTU3a counter driver

Series: media: dt-bindings: media: Add bindings for video capture on R-Car V4H
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=735450
  Lore link: https://lore.kernel.org/r/20230330144731.3017858-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v2,1/3] media: dt-bindings: media: renesas,isp: Add binding for V4H
             [v2,2/3] media: dt-bindings: media: renesas,csi2: Add binding for V4H
             [v2,3/3] media: dt-bindings: media: renesas,vin: Add binding for V4H

Patch: [v4] dt-bindings: iommu: renesas, ipmmu-vmsa: Update for R-Car Gen4
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Joerg Roedel <jroedel@suse.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=729435
  Lore link: https://lore.kernel.org/r/20230313124026.954514-1-yoshihiro.shimoda.uh@renesas.com

Patch: dmaengine: sh: rz-dmac: Remove unused rz_dmac_chan.*_word_size
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Vinod Koul <vkoul@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=734089
  Lore link: https://lore.kernel.org/r/021bdf56f1716276a55bcfb1ea81bba5f1d42b3d.1679910274.git.geert+renesas@glider.be

Series: r8a779a0: enable PWM
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=744460
  Lore link: https://lore.kernel.org/r/20230502170618.55967-1-wsa+renesas@sang-engineering.com
    Patches: [1/2] clk: renesas: r8a779a0: Add PWM clock
             [2/2] arm64: dts: renesas: r8a779a0: Add PWM nodes

Series: media: Convert to platform remove callback returning void
  Submitter: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Committer: Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=733922
  Lore link: https://lore.kernel.org/r/20230326143224.572654-1-u.kleine-koenig@pengutronix.de
    Patches: [047/117] media: rcar-fcp: Convert to platform remove callback returning void
             [048/117] media: rcar-isp: Convert to platform remove callback returning void
             [049/117] media: rcar-core: Convert to platform remove callback returning void
             [050/117] media: rcar-csi2: Convert to platform remove callback returning void
             [051/117] media: rcar_drif: Convert to platform remove callback returning void
             [052/117] media: rcar_fdp1: Convert to platform remove callback returning void
             [053/117] media: rcar_jpu: Convert to platform remove callback returning void
             [054/117] media: renesas-ceu: Convert to platform remove callback returning void
             [058/117] media: vsp1_drv: Convert to platform remove callback returning void

Series: drm: rcar-du: Fix vblank wait timeout when stopping LVDS output
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=721489
  Lore link: https://lore.kernel.org/r/20230214003736.18871-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [1/3] drm: rcar-du: lvds: Call function directly instead of through pointer
             [2/3] drm: rcar-du: lvds: Move LVDS enable code to separate code section

Series: media: i2c: adv7604: Fix handling of video adjustments
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=733851
  Lore link: https://lore.kernel.org/r/20230325205610.22583-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [v2,1/2] media: i2c: adv7604: Enable video adjustment
             [v2,2/2] media: i2c: adv7604: Fix range of hue control

Series: drm: rcar-du: Avoid writing reserved register fields
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=723948
  Lore link: https://lore.kernel.org/r/20230222050623.29080-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [1/2] drm: rcar-du: Don't write unimplemented ESCR and OTAR registers on Gen3
             [2/2] drm: rcar-du: Disable alpha blending for DU planes used with VSP

Series: tree-wide: remove support for Renesas R-Car H3 ES1
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=727480
  Lore link: https://lore.kernel.org/r/20230307163041.3815-1-wsa+renesas@sang-engineering.com
    Patches: [01/11] iommu/ipmmu-vmsa: remove R-Car H3 ES1.* handling
             [03/11] media: rcar-vin: remove R-Car H3 ES1.* handling
             [04/11] media: rcar-vin: csi2: remove R-Car H3 ES1.* handling
             [05/11] media: renesas: fdp1: remove R-Car H3 ES1.* handling
             [07/11] ravb: remove R-Car H3 ES1.* handling
             [08/11] mmc: renesas_sdhi: remove R-Car H3 ES1.* handling

Series: phy: Convert to platform remove callback returning void
  Submitter: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Committer: Vinod Koul <vkoul@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=727325
  Lore link: https://lore.kernel.org/r/20230307115900.2293120-1-u.kleine-koenig@pengutronix.de
    Patches: [16/31] phy: renesas: phy-rcar-gen3-usb2: Convert to platform remove callback returning void
             [17/31] phy: renesas: phy-rcar-gen3-usb3: Convert to platform remove callback returning void

Series: [v3,1/4] clk: rs9: Check for vendor/device ID
  Submitter: Alexander Stein <alexander.stein@ew.tq-group.com>
  Committer: Stephen Boyd <sboyd@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=728511
  Lore link: https://lore.kernel.org/r/20230310075535.3476580-1-alexander.stein@ew.tq-group.com
    Patches: [v3,1/4] clk: rs9: Check for vendor/device ID
             [v3,2/4] dt-bindings: clk: rs9: Add 9FGV0441
             [v3,3/4] clk: rs9: Support device specific dif bit calculation
             [v3,4/4] clk: rs9: Add support for 9FGV0441

Series: Renesas SoC updates for v6.4 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=738357
  Lore link: https://lore.kernel.org/r/cover.1681113111.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM SoC updates for v6.4
             [GIT,PULL,2/3] Renesas driver updates for v6.4 (take two)
             [GIT,PULL,3/3] Renesas DTS updates for v6.4 (take two)

Patch: [RESEND,net-next] net: phy: update obsolete comment about PHY_STARTING
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=729935
  Lore link: https://lore.kernel.org/r/20230314124856.44878-1-wsa+renesas@sang-engineering.com

Patch: [v2] dt-bindings: pinctrl: Drop unneeded quotes
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=735558
  Lore link: https://lore.kernel.org/r/20230330200402.2731992-1-robh@kernel.org

Series: [1/6] dt-bindings: watchdog: drop duplicated GPIO watchdog bindings
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Wim Van Sebroeck <wim@linux-watchdog.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=740078
  Lore link: https://lore.kernel.org/r/20230415095112.51257-1-krzysztof.kozlowski@linaro.org
    Patches: [1/6] dt-bindings: watchdog: drop duplicated GPIO watchdog bindings
             [2/6] dt-bindings: watchdog: indentation, quotes and white-space cleanup
             [3/6] dt-bindings: watchdog: arm,sp805: drop unneeded minItems
             [4/6] dt-bindings: watchdog: fsl-imx7ulp-wdt: simplify with unevaluatedProperties
             [5/6] dt-bindings: watchdog: toshiba,visconti-wdt: simplify with unevaluatedProperties
             [6/6] dt-bindings: watchdog: realtek,otto-wdt: simplify requiring interrupt-names

Patch: mmc: Use of_property_read_bool() for boolean properties
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Ulf Hansson <ulf.hansson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=728721
  Lore link: https://lore.kernel.org/r/20230310144715.1543836-1-robh@kernel.org

Series: media: i2c: adv748x: Enable pattern generator without external HDMI source
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=724180
  Lore link: https://lore.kernel.org/r/20230222221249.1324102-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [1/3] media: i2c: adv748x: Fix lookup of DV timings
             [2/3] media: i2c: adv748x: Write initial DV timings to device
             [3/3] media: i2c: adv748x: Report correct DV timings for pattern generator

Patch: dt-bindings: clock: Drop unneeded quotes
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Rob Herring <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=732843
  Lore link: https://lore.kernel.org/r/20230322173549.3972106-1-robh@kernel.org

Patch: [v2] counter: rz-mtu3-cnt: Unlock on error in rz_mtu3_count_ceiling_write()
  Submitter: Dan Carpenter <dan.carpenter@linaro.org>
  Committer: Lee Jones <lee@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=741768
  Lore link: https://lore.kernel.org/r/7b535d6b-6031-493a-84f6-82842089e637@kili.mountain

Patch: drm: rcar-du: Fix a NULL vs IS_ERR() bug
  Submitter: Dan Carpenter <error27@gmail.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=725092
  Lore link: https://lore.kernel.org/r/Y/yAw6sHu82OnOWj@kili

Series: [RESEND,v4,1/2] media: dt-bindings: media: renesas,fcp: Document RZ/{G2L,V2L} FCPVD bindings
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=737718
  Lore link: https://lore.kernel.org/r/20230406171324.837247-1-biju.das.jz@bp.renesas.com
    Patches: [RESEND,v4,1/2] media: dt-bindings: media: renesas,fcp: Document RZ/{G2L,V2L} FCPVD bindings
             [RESEND,v4,2/2] media: dt-bindings: media: renesas,vsp1: Document RZ/V2L VSPD bindings

Series: RZ/G2L SSI: Update interrupt numbers
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=723065
  Lore link: https://lore.kernel.org/r/20230217185225.43310-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/4] ASoC: dt-bindings: renesas,rz-ssi: Update interrupts and interrupt-names properties
             [2/4] ASoC: sh: rz-ssi: Update interrupt handling for half duplex channels

Patch: media: platform: renesas: use devm_platform_get_and_ioremap_resource()
  Submitter:  <ye.xingchen@zte.com.cn>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=719831
  Lore link: https://lore.kernel.org/r/202302081659401393135@zte.com.cn

Patch: dt-bindings: ata: Drop unneeded quotes
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Rob Herring <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=734242
  Lore link: https://lore.kernel.org/r/20230327170053.4100949-1-robh@kernel.org

Patch: drm: rcar-du: Write correct values in DORCR reserved fields
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=724193
  Lore link: https://lore.kernel.org/r/20230222233113.4737-1-laurent.pinchart+renesas@ideasonboard.com

Series: drm: rcar-du: Fix more invalid register writes
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=724196
  Lore link: https://lore.kernel.org/r/20230222234212.5461-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [v2,1/2] drm: rcar-du: Rename DORCR fields to make them 0-based
             [v2,2/2] drm: rcar-du: Write correct values in DORCR reserved fields

Patch: media: vsp1: Replace vb2_is_streaming() with vb2_start_streaming_called()
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=714266
  Lore link: https://lore.kernel.org/r/20230120204359.25114-1-laurent.pinchart+renesas@ideasonboard.com

Patch: dmaengine: sh: rz-dmac: Add reset support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Vinod Koul <vkoul@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=730190
  Lore link: https://lore.kernel.org/r/20230315064501.21491-1-biju.das.jz@bp.renesas.com

Series: [1/2] dt-bindings: dma: rz-dmac: Document clock-names and reset-names
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Vinod Koul <vkoul@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=730196
  Lore link: https://lore.kernel.org/r/20230315064726.22739-1-biju.das.jz@bp.renesas.com
    Patches: [1/2] dt-bindings: dma: rz-dmac: Document clock-names and reset-names

Patch: [net-next] ethernet: remove superfluous clearing of phydev
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=732330
  Lore link: https://lore.kernel.org/r/20230321131745.27688-1-wsa+renesas@sang-engineering.com

Patch: dt-bindings: mtd: Drop unneeded quotes
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Miquel Raynal <miquel.raynal@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=731332
  Lore link: https://lore.kernel.org/r/20230317233631.3968509-1-robh@kernel.org

Patch: rtc: Convert to platform remove callback returning void
  Submitter: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=726615
  Lore link: https://lore.kernel.org/r/20230304133028.2135435-1-u.kleine-koenig@pengutronix.de

Patch: [RESEND,net-next] net: phy: micrel: drop superfluous use of temp variable
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=729908
  Lore link: https://lore.kernel.org/r/20230314124928.44948-1-wsa+renesas@sang-engineering.com

Series: MODULE_LICENSE removals, fifth tranche
  Submitter: Nick Alcock <nick.alcock@oracle.com>
  Committer: Luis Chamberlain <mcgrof@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=725508
  Lore link: https://lore.kernel.org/r/20230228130215.289081-1-nick.alcock@oracle.com
    Patches: [04/20] pinctrl: renesas: remove MODULE_LICENSE in non-modules

Series: spi: struct spi_device constification
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Lee Jones <lee@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=729395
  Lore link: https://lore.kernel.org/r/cover.1678704562.git.geert+renesas@glider.be
    Patches: [1/6] mfd: rsmu_spi: Remove unneeded casts of void *

Patch: [v4] media: renesas: vsp1: Add underrun debug print
  Submitter: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=722429
  Lore link: https://lore.kernel.org/r/20230216094115.151189-1-tomi.valkeinen+renesas@ideasonboard.com

Patch: [net-next,v2] smsc911x: remove superfluous variable init
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Paolo Abeni <pabeni@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=734872
  Lore link: https://lore.kernel.org/r/20230329064414.25028-1-wsa+renesas@sang-engineering.com

Patch: usb: gadget: udc: remove unused usbf_ep_dma_reg_clrset function
  Submitter: Tom Rix <trix@redhat.com>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=731578
  Lore link: https://lore.kernel.org/r/20230319155910.1706294-1-trix@redhat.com

Patch: [v2] dt-bindings: display: Drop unneeded quotes
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Rob Herring <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=732081
  Lore link: https://lore.kernel.org/r/20230320233823.2919475-1-robh@kernel.org

Patch: [net-next,v2] Revert "sh_eth: remove open coded netif_running()"
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=734209
  Lore link: https://lore.kernel.org/r/20230327152112.15635-1-wsa+renesas@sang-engineering.com

Patch: spi: Replace spi_pcpu_stats_totalize() macro by a C function
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=725533
  Lore link: https://lore.kernel.org/r/cb7690d9d04c06eec23dbb98fbb5444082125cff.1677594432.git.geert+renesas@glider.be

Patch: [v3] mtd: nand: Convert to platform remove callback returning void
  Submitter: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Committer: Miquel Raynal <miquel.raynal@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=738735
  Lore link: https://lore.kernel.org/r/20230411113816.3472237-1-u.kleine-koenig@pengutronix.de

Patch: [net-next] sh_eth: remove open coded netif_running()
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Paolo Abeni <pabeni@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=732203
  Lore link: https://lore.kernel.org/r/20230321065826.2044-1-wsa+renesas@sang-engineering.com


Total patches: 83

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


