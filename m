Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA0CF592C60
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Aug 2022 12:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233333AbiHOJZB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Aug 2022 05:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233074AbiHOJZA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Aug 2022 05:25:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AD972A7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Aug 2022 02:24:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1667F60FB2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Aug 2022 09:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6EA23C433D6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Aug 2022 09:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660555497;
        bh=M6PLnP1M8v8++Aj6CAlcSosSm3jWoqvK2YnPp/oKVHg=;
        h=Subject:From:Date:To:From;
        b=SST8NH125oz93YAwUReQzfEtBuPtdyG2988wlmA5RRjeI/2LgxnwkYRC+M4jYHvwP
         bY5hAPRXTesxPGSysNMb+r9MbeXMsJgKph87AARz8NEWPKSBfP4rG9n3qL1eWs/s++
         gBGwS3cyaBxz/775VaqvazQLxF/BKUNvRktc+DUVj5LO1ogYV0EdYntR2GQFwsaPJo
         MRhAgyc0jHQlgaDvS7iXtrpv+TyGuYigGYaWzO9AZo8R+1Ww0paFXrejLNBHaQHD/G
         OJbIh+ZT76ZxwapIVFEM+G4t7YpEwBNXzrHMr//IxI2r6AzmQn07Oj23f0rAtpVpDr
         o10pP5YSjLwHA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4CAF7C43142
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Aug 2022 09:24:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166055549723.18008.14502036172938294356.git-patchwork-summary@kernel.org>
Date:   Mon, 15 Aug 2022 09:24:57 +0000
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

Series: Add support for RZ/N1 SJA1000 CAN controller
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Marc Kleine-Budde <mkl@pengutronix.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=658274
  Lore link: https://lore.kernel.org/r/20220710115248.190280-1-biju.das.jz@bp.renesas.com
    Patches: [v4,1/6] dt-bindings: can: sja1000: Convert to json-schema
             [v4,2/6] dt-bindings: can: nxp,sja1000: Document RZ/N1{D,S} support
             [v4,3/6] can: sja1000: Add Quirk for RZ/N1 SJA1000 CAN controller
             [v4,4/6] can: sja1000: Use device_get_match_data to get device data
             [v4,5/6] can: sja1000: Change the return type as void for SoC specific init

Patch: i2c: move drivers from strlcpy to strscpy
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Wolfram Sang <wsa@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=666783
  Lore link: https://lore.kernel.org/r/20220811071030.3388-1-wsa+renesas@sang-engineering.com

Patch: [v2] drm: rcar-du: Fix Alpha blending issue on Gen3
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=635635
  Lore link: https://lore.kernel.org/r/20220426084157.10979-1-biju.das.jz@bp.renesas.com

Patch: [v2] drm: shmobile: Use backlight helper
  Submitter: Stephen Kitt <steve@sk2.org>
  Committer: Sam Ravnborg <sam@ravnborg.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=651169
  Lore link: https://lore.kernel.org/r/20220616170821.1348169-1-steve@sk2.org

Patch: drm: rcar-du: Extend CMM HDSE documentation
  Submitter: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=630745
  Lore link: https://lore.kernel.org/r/20220409185706.505319-1-kieran.bingham+renesas@ideasonboard.com

Patch: mmc: tmio: avoid glitches when resetting
  Submitter: Wolfram Sang <wsa@kernel.org>
  Committer: Ulf Hansson <ulf.hansson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=653814
  Lore link: https://lore.kernel.org/r/20220625131722.1397-1-wsa@kernel.org

Patch: [v2] selftests: timers: clocksource-switch: add 'runtime' command line parameter
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Shuah Khan <skhan@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=659836
  Lore link: https://lore.kernel.org/r/20220714185721.48125-1-wsa+renesas@sang-engineering.com

Series: Renesas RZ/G2L IRQC support
  Submitter: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Committer: Marc Zyngier <maz@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=653842
  Lore link: https://lore.kernel.org/r/20220625200600.7582-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v6,1/5] dt-bindings: interrupt-controller: Add Renesas RZ/G2L Interrupt Controller
             [v6,3/5] gpio: gpiolib: Allow free() callback to be overridden
             [v6,4/5] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the properties to handle GPIO IRQ

Patch: drm: rcar-du: Drop file name from comment header blocks
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=635107
  Lore link: https://lore.kernel.org/r/20220424214550.19463-1-laurent.pinchart+renesas@ideasonboard.com

Patch: None
  Submitter: Jiri Slaby <jslaby@suse.cz>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=657723
  Lore link: https://lore.kernel.org/r/20220708071306.4354-2-jslaby@suse.cz

Patch: ufs: core: fix typos in error messages
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Martin K. Petersen <martin.petersen@oracle.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=652405
  Lore link: https://lore.kernel.org/r/20220621144653.62630-1-wsa+renesas@sang-engineering.com

Series: Add CPG wrapper for Renesas RZ/Five SoC
  Submitter: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=652894
  Lore link: https://lore.kernel.org/r/20220622181723.13033-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/2] dt-bindings: clock: r9a07g043-cpg: Add Renesas RZ/Five CPG Clock and Reset Definitions

Patch: [v4] dmaengine: sh: rz-dmac: Add device_synchronize callback
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Vinod Koul <vkoul@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=662148
  Lore link: https://lore.kernel.org/r/20220722084430.969333-1-biju.das.jz@bp.renesas.com

Patch: i2c: move core from strlcpy to strscpy
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Wolfram Sang <wsa@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=666877
  Lore link: https://lore.kernel.org/r/20220811120808.4256-1-wsa+renesas@sang-engineering.com

Patch: [v3] dt-bindings: display: bridge: sil,sii9022: Convert to json-schema
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Rob Herring <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=643164
  Lore link: https://lore.kernel.org/r/2f8e12b4980a82788c1dd413ceedf8d144fdca91.1652967387.git.geert+renesas@glider.be

Patch: dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G2UL USBPHY Control bindings
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Philipp Zabel <p.zabel@pengutronix.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=634905
  Lore link: https://lore.kernel.org/r/20220423134601.141975-1-biju.das.jz@bp.renesas.com

Patch: media: renesas: rcar_drif: Drop of_match_ptr()
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=644879
  Lore link: https://lore.kernel.org/r/20220525092054.26089-1-laurent.pinchart+renesas@ideasonboard.com

Series: i2c: Add new driver for Renesas RZ/V2M controller
  Submitter: Phil Edworthy <Phil.Edworthy@renesas.com>
  Committer: Wolfram Sang <wsa@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=657809
  Lore link: https://lore.kernel.org/r/20220708100350.12523-1-phil.edworthy@renesas.com
    Patches: [v4,1/2] dt-bindings: i2c: Document RZ/V2M I2C controller

Patch: i2c: extend documentation about retvals of master_xfer functions
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Wolfram Sang <wsa@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=662590
  Lore link: https://lore.kernel.org/r/20220724184628.2752-1-wsa+renesas@sang-engineering.com

Patch: [-next,v2] net: pcs-rzn1-miic: fix return value check in miic_probe()
  Submitter: Yang Yingliang <yangyingliang@huawei.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=654604
  Lore link: https://lore.kernel.org/r/20220628131259.3109124-1-yangyingliang@huawei.com

Patch: [GIT,PULL,FOR,v5.20] Miscellaneous R-Car DU fixes and enhancements
  Submitter: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Committer: Dave Airlie <airlied@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=660257
  Lore link: https://lore.kernel.org/r/YtIEWkE0nk/8nhUc@pendragon.ideasonboard.com

Patch: [net-next] net: pcs: rzn1-miic: update speed only if interface is changed
  Submitter: Clément Léger <clement.leger@bootlin.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=655001
  Lore link: https://lore.kernel.org/r/20220629122003.189397-1-clement.leger@bootlin.com

Patch: drm: rcar-du: Lift z-pos restriction on primary plane for Gen3
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=649022
  Lore link: https://lore.kernel.org/r/20220609235529.22254-1-laurent.pinchart+renesas@ideasonboard.com

Patch: [net-next] Revert the ARM/dts changes for Renesas RZ/N1
  Submitter: Jakub Kicinski <kuba@kernel.org>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=654265
  Lore link: https://lore.kernel.org/r/20220627173900.3136386-1-kuba@kernel.org


Total patches: 30

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


