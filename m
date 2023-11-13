Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C05F7E9F97
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Nov 2023 16:07:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbjKMPHr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Nov 2023 10:07:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbjKMPHq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2023 10:07:46 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F73132
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Nov 2023 07:07:42 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28F66C433CD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Nov 2023 15:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699888062;
        bh=Dfz/b03fb96rvb12Jg7+J741hmaxyyMYO6Y5EKmvEkg=;
        h=Subject:From:Date:To:From;
        b=Cd36ZpJmLOaNKkdGkYUbqlITDRCWGuKnHVbwOezXzm2pN+lG8HpbtpwCSQzWkd+jA
         Z7BTEFFL0kyfeuUZdMmoMRWqj2MDFVNGZ4QyptweJfZxiKVD4QhAqOyGOh1hUoio9Q
         I4Eaf3LGAgvfuotKOINtj04TZBoGtXodtsY6t86xdC0XR/ZyByBpM2KJv4Kb9FEc6B
         wMevrF/Oq/DGOddU7S9tN9JO4gwsyk2KS7gHXaTcr7WNWegU83nKypUlrZOS7vcXO4
         T5h7wcbMz0Ii9vj4LjeDc+Q7CCLBepUqabQcv8yeUZ8Exn9/6eKe0fZ1ROWy+XR6aF
         7cxlGPlfMCQIA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 12093C04DD9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Nov 2023 15:07:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <169988806100.10049.1987798227418240041.git-patchwork-summary@kernel.org>
Date:   Mon, 13 Nov 2023 15:07:41 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
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

Series: drm: renesas: shmobile: Atomic conversion + DT support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=784497
  Lore link: https://lore.kernel.org/r/cover.1694767208.git.geert+renesas@glider.be
    Patches: [v4,01/41] MAINTAINER: Create entry for Renesas SH-Mobile DRM drivers
             [v4,02/41] dt-bindings: display: Add Renesas SH-Mobile LCDC bindings
             [v4,03/41] media: uapi: Add MEDIA_BUS_FMT_RGB666_2X9_BE format
             [v4,04/41] drm: renesas: shmobile: Fix overlay plane disable
             [v4,05/41] drm: renesas: shmobile: Fix ARGB32 overlay format typo
             [v4,06/41] drm: renesas: shmobile: Correct encoder/connector types
             [v4,07/41] drm: renesas: shmobile: Add support for Runtime PM
             [v4,08/41] drm: renesas: shmobile: Restore indentation of shmob_drm_setup_clocks()
             [v4,09/41] drm: renesas: shmobile: Use %p4cc to print fourcc code
             [v4,10/41] drm: renesas: shmobile: Add missing YCbCr formats
             [v4,11/41] drm: renesas: shmobile: Improve shmob_drm_format_info table
             [v4,12/41] drm: renesas: shmobile: Remove backlight support
             [v4,13/41] drm: renesas: shmobile: Don't set display info width and height twice
             [v4,14/41] drm: renesas: shmobile: Rename input clocks
             [v4,15/41] drm: renesas: shmobile: Remove support for SYS panels
             [v4,16/41] drm: renesas: shmobile: Improve error handling
             [v4,17/41] drm: renesas: shmobile: Convert to use devm_request_irq()
             [v4,18/41] drm: renesas: shmobile: Remove custom plane destroy callback
             [v4,19/41] drm: renesas: shmobile: Use drmm_universal_plane_alloc()
             [v4,20/41] drm: renesas: shmobile: Embed drm_device in shmob_drm_device
             [v4,21/41] drm: renesas: shmobile: Convert container helpers to static inline functions
             [v4,22/41] drm: renesas: shmobile: Replace .dev_private with container_of()
             [v4,23/41] drm: renesas: shmobile: Use struct videomode in platform data
             [v4,24/41] drm: renesas: shmobile: Use media bus formats in platform data
             [v4,25/41] drm: renesas: shmobile: Move interface handling to connector setup
             [v4,26/41] drm: renesas: shmobile: Unify plane allocation
             [v4,27/41] drm: renesas: shmobile: Rename shmob_drm_crtc.crtc
             [v4,28/41] drm: renesas: shmobile: Rename shmob_drm_connector.connector
             [v4,29/41] drm: renesas: shmobile: Rename shmob_drm_plane.plane
             [v4,30/41] drm: renesas: shmobile: Use drm_crtc_handle_vblank()
             [v4,31/41] drm: renesas: shmobile: Move shmob_drm_crtc_finish_page_flip()
             [v4,32/41] drm: renesas: shmobile: Wait for page flip when turning CRTC off
             [v4,33/41] drm: renesas: shmobile: Turn vblank on/off when enabling/disabling CRTC
             [v4,34/41] drm: renesas: shmobile: Shutdown the display on remove
             [v4,35/41] drm: renesas: shmobile: Cleanup encoder
             [v4,36/41] drm: renesas: shmobile: Atomic conversion part 1
             [v4,37/41] drm: renesas: shmobile: Atomic conversion part 2
             [v4,38/41] drm: renesas: shmobile: Use suspend/resume helpers
             [v4,39/41] drm: renesas: shmobile: Remove internal CRTC state tracking
             [v4,40/41] drm: renesas: shmobile: Atomic conversion part 3
             [v4,41/41] drm: renesas: shmobile: Add DT support

Series: ARM: dts: renesas: LBSC and FLASH improvements
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=780813
  Lore link: https://lore.kernel.org/r/cover.1693481518.git.geert+renesas@glider.be
    Patches: [01/13] ARM: dts: renesas: ape6evm: Drop bogus "mtd-rom" compatible value
             [PATCH/RFC,12/13] ARM: dts: renesas: marzen: Add FLASH node
             [PATCH/RFC,13/13] ARM: dts: renesas: blanche: Add FLASH node

Patch: [RESEND] Documentation: i2c: add fault code for not supporting 10 bit addresses
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Wolfram Sang <wsa@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=797419
  Lore link: https://lore.kernel.org/r/20231029194143.22512-1-wsa+renesas@sang-engineering.com

Series: dt-bindings: net: Child node schema cleanups
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=793725
  Lore link: https://lore.kernel.org/r/20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org
    Patches: [net-next,1/8] dt-bindings: net: Add missing (unevaluated|additional)Properties on child node schemas
             [net-next,3/8] dt-bindings: net: dsa/switch: Make 'ethernet-port' node addresses hex
             [net-next,4/8] dt-bindings: net: ethernet-switch: Add missing 'ethernet-ports' level
             [net-next,5/8] dt-bindings: net: ethernet-switch: Rename $defs "base" to 'ethernet-ports'
             [net-next,6/8] dt-bindings: net: mscc,vsc7514-switch: Clean-up example indentation
             [net-next,7/8] dt-bindings: net: mscc,vsc7514-switch: Simplify DSA and switch references
             [net-next,8/8] dt-bindings: net: dsa: Drop 'ethernet-ports' node properties

Patch: mtd: rawnand: renesas: Annotate struct rnand_chip with __counted_by
  Submitter: Kees Cook <keescook@chromium.org>
  Committer: Miquel Raynal <miquel.raynal@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=784790
  Lore link: https://lore.kernel.org/r/20230915201254.never.511-kees@kernel.org

Series: PCI: rcar-gen4: Add R-Car Gen4 PCIe support
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=779314
  Lore link: https://lore.kernel.org/r/20230825093219.2685912-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [v20,01/19] PCI: Add INTx Mechanism Messages macros
             [v20,05/19] PCI: dwc: endpoint: Add multiple PFs support for dbi2
             [v20,06/19] PCI: dwc: Add dw_pcie_link_set_max_link_width()
             [v20,07/19] PCI: dwc: Add missing PCI_EXP_LNKCAP_MLW handling
             [v20,08/19] PCI: tegra194: Drop PCI_EXP_LNKSTA_NLW setting
             [v20,09/19] PCI: dwc: Add EDMA_UNROLL capability flag
             [v20,10/19] PCI: dwc: Expose dw_pcie_ep_exit() to module
             [v20,11/19] PCI: dwc: Expose dw_pcie_write_dbi2() to module
             [v20,18/19] MAINTAINERS: Update PCI DRIVER FOR RENESAS R-CAR for R-Car Gen4
             [v20,19/19] misc: pci_endpoint_test: Add Device ID for R-Car S4-8 PCIe controller

Series: Enable 4-bit tx support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=781066
  Lore link: https://lore.kernel.org/r/20230901075932.105822-1-biju.das.jz@bp.renesas.com
    Patches: [v3,1/3] arm64: dts: renesas: rzg2ul-smarc-som: Enable serial NOR flash
             [v3,2/3] arm64: dts: renesas: rzg2l-smarc-som: Enable 4-bit tx support
             [v3,3/3] arm64: dts: renesas: rzg2lc-smarc-som: Enable 4-bit tx support

Series: Enable 4-bit tx support for RZ/{G2L,G2LC,V2L} SMARC EVKs
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=799738
  Lore link: https://lore.kernel.org/r/20231108172232.259301-1-biju.das.jz@bp.renesas.com
    Patches: [v4,1/2] arm64: dts: renesas: rzg2l-smarc-som: Enable 4-bit tx support
             [v4,2/2] arm64: dts: renesas: rzg2lc-smarc-som: Enable 4-bit tx support

Series: PCI: PCI_HEADER_TYPE bugfix & cleanups
  Submitter: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Committer: Bjorn Helgaas <bhelgaas@google.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=789598
  Lore link: https://lore.kernel.org/r/20231003125300.5541-1-ilpo.jarvinen@linux.intel.com
    Patches: [1/3] PCI: vmd: Correct PCI Header Type Register's MFD bit check
             [2/3] PCI: Add PCI_HEADER_TYPE_MFD pci_regs.h
             [3/3] PCI: Use PCI_HEADER_TYPE_* instead of literals

Patch: MAINTAINERS: add YAML file for i2c-demux-pinctrl
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Wolfram Sang <wsa@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=797314
  Lore link: https://lore.kernel.org/r/20231028122309.9867-1-wsa+renesas@sang-engineering.com

Patch: [v2] dt-bindings: serial: re-order entries to match coding convention
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=793661
  Lore link: https://lore.kernel.org/r/20231016181909.368429-1-krzysztof.kozlowski@linaro.org

Series: riscv,isa-extensions additions
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Conor Dooley <conor.dooley@microchip.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=786559
  Lore link: https://lore.kernel.org/r/20230922081351.30239-2-conor@kernel.org
    Patches: [RFC,v2,1/6] riscv: dts: microchip: convert isa detection to new properties
             [RFC,v2,2/6] riscv: dts: sifive: convert isa detection to new properties
             [RFC,v2,3/6] riscv: dts: starfive: convert isa detection to new properties
             [RFC,v2,5/6] riscv: dts: allwinner: convert isa detection to new properties
             [RFC,v2,6/6] riscv: dts: thead: convert isa detection to new properties

Series: riscv,isa-extensions additions
  Submitter: Conor Dooley <conor.dooley@microchip.com>
  Committer: Conor Dooley <conor.dooley@microchip.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=791218
  Lore link: https://lore.kernel.org/r/20231009-approve-verbalize-ce9324858e76@wendy
    Patches: [v3,1/6] riscv: dts: microchip: convert isa detection to new properties
             [v3,2/6] riscv: dts: sifive: convert isa detection to new properties
             [v3,3/6] riscv: dts: starfive: convert isa detection to new properties
             [v3,5/6] riscv: dts: allwinner: convert isa detection to new properties
             [v3,6/6] riscv: dts: thead: convert isa detection to new properties

Patch: [GIT,PULL,v2] drm: renesas: shmobile: Atomic conversion + DT support (was: Re: [PATCH v4 00/41] drm: renesas: shmobile: Atomic conversion + DT support)
  Submitter: Geert Uytterhoeven <geert@linux-m68k.org>
  Committer: Dave Airlie <airlied@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=793475
  Lore link: https://lore.kernel.org/r/CAMuHMdUF61V5qNyKbrTGxZfEJvCVuLO7q2R5MqZYkzRC_cNr0w@mail.gmail.com

Patch: dt-bindings: Drop kernel copy of common reserved-memory bindings
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Rob Herring <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=793134
  Lore link: https://lore.kernel.org/r/20231013200851.347042-1-robh@kernel.org

Patch: dt-bindings: memory-controllers: Make "additionalProperties: true" explicit
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=787417
  Lore link: https://lore.kernel.org/r/20230925212626.1974676-1-robh@kernel.org

Series: rswitch: Add PM ops
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Paolo Abeni <pabeni@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=793901
  Lore link: https://lore.kernel.org/r/20231017113402.849735-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [net-next,v3,1/2] rswitch: Use unsigned int for port related array index
             [net-next,v3,2/2] rswitch: Add PM ops

Patch: dt-bindings: regulator: dlg,da9210: Convert to json-schema
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=795612
  Lore link: https://lore.kernel.org/r/bfd1cf9d620a8229f5a5e62e6fe9e59c153d0830.1698051619.git.geert+renesas@glider.be

Patch: i2c: gpio: remove error checks with debugfs
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Wolfram Sang <wsa@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=786358
  Lore link: https://lore.kernel.org/r/20230921084016.3434-1-wsa+renesas@sang-engineering.com

Series: treewide: drop check because i2c_unregister_device() is NULL safe
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=786540
  Lore link: https://lore.kernel.org/r/20230922080421.35145-1-wsa+renesas@sang-engineering.com
    Patches: [1/3] usb: typec: drop check because i2c_unregister_device() is NULL safe
             [2/3] media: i2c: drop check because i2c_unregister_device() is NULL safe
             [3/3] media: dvb-frontends: drop check because i2c_unregister_device() is NULL safe

Patch: pinctrl: Convert to platform remove callback returning void
  Submitter: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=791199
  Lore link: https://lore.kernel.org/r/20231009083856.222030-1-u.kleine-koenig@pengutronix.de

Patch: drm: Convert to platform remove callback returning void
  Submitter: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Committer: Javier Martinez Canillas <javierm@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=771622
  Lore link: https://lore.kernel.org/r/20230801110239.831099-1-u.kleine-koenig@pengutronix.de

Series: None
  Submitter: Bartosz Golaszewski <brgl@bgdev.pl>
  Committer: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=789628
  Lore link: https://lore.kernel.org/r/20231003145114.21637-6-brgl@bgdev.pl
    Patches: [05/36] gpio: rcar: use new pinctrl GPIO helpers

Patch: [v3] i2c: fix memleak in i2c_new_client_device()
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Wolfram Sang <wsa@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=788732
  Lore link: https://lore.kernel.org/r/20230929091952.19957-1-wsa+renesas@sang-engineering.com

Series: serial: core: updates to uapi header
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=786501
  Lore link: https://lore.kernel.org/r/20230922063642.4120-1-wsa+renesas@sang-engineering.com
    Patches: [1/2] serial: core: remove cruft from uapi header
             [2/2] serial: core: add comment about definitely used port types

Series: dts: renesas: Fix I2C bus demux node names and ADV751[13] power supplies
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=795650
  Lore link: https://lore.kernel.org/r/cover.1698068646.git.geert+renesas@glider.be
    Patches: [1/3] ARM: dts: renesas: rcar-gen2: Fix I2C bus demux node names
             [2/3] ARM: dts: renesas: Add missing ADV751[13] power supply properties
             [3/3] arm64: dts: renesas: Add missing ADV751[13] power supply properties

Patch: dt-bindings: pinctrl: Add missing additionalProperties on child node schemas
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=787418
  Lore link: https://lore.kernel.org/r/20230925212713.1975800-1-robh@kernel.org

Patch: [V3] arm64: dts: imx8mp-beacon: Configure 100MHz PCIe Ref Clk
  Submitter: Adam Ford <aford173@gmail.com>
  Committer: Shawn Guo <shawnguo@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=790124
  Lore link: https://lore.kernel.org/r/20231004235148.45562-1-aford173@gmail.com

Series: Enable peripherals on RZ/Five SMARC EVK
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=788672
  Lore link: https://lore.kernel.org/r/20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/5] riscv: dts: renesas: r9a07g043f: Add L2 cache node
             [5/5] riscv: configs: defconfig: Enable configs required for RZ/Five SoC

Patch: dt-bindings: i2c: i2c-demux-pinctrl: Convert to json-schema
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Wolfram Sang <wsa@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=795651
  Lore link: https://lore.kernel.org/r/28c173dfbbc17403b0c5a6f27661d7bd33a86f84.1698068607.git.geert+renesas@glider.be


Total patches: 107

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


