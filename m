Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3355D74D345
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jul 2023 12:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbjGJKYD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jul 2023 06:24:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbjGJKYD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jul 2023 06:24:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A64594
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jul 2023 03:24:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D4E6560F99
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jul 2023 10:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3843BC433C7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jul 2023 10:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688984640;
        bh=lecbdhG3dS1HsiH3oEaLe7bj0hCYnk5cVSvM9n98p64=;
        h=Subject:From:Date:To:From;
        b=vBPL9FAYUGZz0SDfcWumvi+EumM32DtcfVGF9riUojCNoPGX8r8iSuGzym1EOwwL2
         W1OVBF1Jtt5l74GPvfTtZ98Am8+r0yve1i11DjvWqvk3Anf3NEBGfSWNZooXqAV/VK
         6nveqEj9xIBwsqQ/535vW4oun/Vo9xnxmnVy1ZLyDneKyP6JqDUOgj7BIs5F+Hl5n+
         H3Kxwc4/gdfd8AMJOZuA650MFiQ7BGOhKar2lJmdnYaruul5DdKMbu6tNL/2nwldoR
         7oLZqtCTTS+pvaJHV92Sdj+kOQkJN0v7h1rQQ9XgwIffC/IUOj8vf3hCq47/7nxE66
         FldIFsC/ilJ5g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 06B04C395F8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jul 2023 10:23:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <168898463993.30238.1839126483601805158.git-patchwork-summary@kernel.org>
Date:   Mon, 10 Jul 2023 10:23:59 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: drm: shmobile: Fixes and enhancements
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Thomas Zimmermann <tzimmermann@suse.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=750294
  Lore link: https://lore.kernel.org/r/cover.1684854992.git.geert+renesas@glider.be
    Patches: [v3,1/5] drm: shmobile: Use %p4cc to print fourcc codes
             [v3,2/5] drm: shmobile: Add support for DRM_FORMAT_XRGB8888
             [v3,3/5] drm: shmobile: Switch to drm_crtc_init_with_planes()
             [v3,4/5] drm: shmobile: Add missing call to drm_fbdev_generic_setup()
             [v3,5/5] drm: shmobile: Make DRM_SHMOBILE visible on Renesas SoC platforms

Patch: [v2] media: Add common header file with JPEG marker definitions
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=750292
  Lore link: https://lore.kernel.org/r/c0f9415cd4f5b16465f0e3456b645eb9980d7b6d.1684854852.git.geert+renesas@glider.be

Patch: mmc: Revert "mmc: core: Allow mmc_start_host() synchronously detect a card"
  Submitter: Ulf Hansson <ulf.hansson@linaro.org>
  Committer: Ulf Hansson <ulf.hansson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=761524
  Lore link: https://lore.kernel.org/r/20230630120015.363982-1-ulf.hansson@linaro.org

Patch: [v12] PCI: endpoint: functions/pci-epf-test: Fix dma_chan direction
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Bjorn Helgaas <bhelgaas@google.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=739023
  Lore link: https://lore.kernel.org/r/20230412063447.2841177-1-yoshihiro.shimoda.uh@renesas.com

Patch: PCI: rcar: user proper naming for R-Car
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Krzysztof Wilczyński <kwilczynski@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=755029
  Lore link: https://lore.kernel.org/r/20230607192144.27190-1-wsa+renesas@sang-engineering.com

Patch: [v2] PCI: rcar: use proper naming for R-Car
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Krzysztof Wilczyński <kwilczynski@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=755065
  Lore link: https://lore.kernel.org/r/20230607204750.27837-1-wsa+renesas@sang-engineering.com

Patch: arm64: dts: renesas: minor whitespace cleanup around '='
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=761846
  Lore link: https://lore.kernel.org/r/20230702185252.44462-1-krzysztof.kozlowski@linaro.org

Series: Add Renesas PMIC RAA215300 and built-in RTC support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=759819
  Lore link: https://lore.kernel.org/r/20230623140948.384762-1-biju.das.jz@bp.renesas.com
    Patches: [v7,01/10] regulator: dt-bindings: Add Renesas RAA215300 PMIC bindings
             [v7,03/10] arm64: dts: renesas: rzg2l-smarc-som: Enable PMIC and built-in RTC

Series: spi: Add CSI support for Renesas RZ/V2M
  Submitter: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=759472
  Lore link: https://lore.kernel.org/r/20230622113341.657842-1-fabrizio.castro.jz@renesas.com
    Patches: [v2,1/5] spi: dt-bindings: Add bindings for RZ/V2M CSI
             [v2,4/5] arm64: dts: renesas: r9a09g011: Add CSI nodes
             [v2,5/5] arm64: defconfig: Enable Renesas RZ/V2M CSI driver

Patch: lib: dhry: Fix sleeping allocations inside non-preemptable section
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Andrew Morton <akpm@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=762725
  Lore link: https://lore.kernel.org/r/bac6d517818a7cd8efe217c1ad649fffab9cc371.1688568764.git.geert+renesas@glider.be

Patch: arm64: defconfig: Enable Renesas MTU3a PWM config
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=762028
  Lore link: https://lore.kernel.org/r/20230703132706.355237-1-biju.das.jz@bp.renesas.com

Series: [1/2] ARM: dts: renesas: add missing space before {
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=762726
  Lore link: https://lore.kernel.org/r/20230705145912.293315-1-krzysztof.kozlowski@linaro.org
    Patches: [1/2] ARM: dts: renesas: add missing space before {
             [2/2] arm64: dts: renesas: add missing space before {

Patch: dt-bindings: arm: Add Cortex-R52 to the list of enum
  Submitter: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
  Committer: Rob Herring <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=748960
  Lore link: https://lore.kernel.org/r/20230518152730.82954-1-ayan.kumar.halder@amd.com

Series: tree-wide: remove support for Renesas R-Car H3 ES1
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=727480
  Lore link: https://lore.kernel.org/r/20230307163041.3815-1-wsa+renesas@sang-engineering.com
    Patches: [01/11] iommu/ipmmu-vmsa: remove R-Car H3 ES1.* handling
             [02/11] drm: rcar-du: remove R-Car H3 ES1.* workarounds

Patch: [v2] drm: rcar-du: remove R-Car H3 ES1.* workarounds
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=746032
  Lore link: https://lore.kernel.org/r/20230509074818.4399-1-wsa+renesas@sang-engineering.com

Series: drm/panel: simple: Add support for Ampire AM-800480L1TMQW-T00H
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Neil Armstrong <neil.armstrong@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=750638
  Lore link: https://lore.kernel.org/r/cover.1684931026.git.geert+renesas@glider.be
    Patches: [1/2] dt-bindings: display: panel-simple: Add Ampire AM-800480L1TMQW-T00H
             [2/2] drm/panel: simple: Add Ampire AM-800480L1TMQW-T00H

Patch: [v2] dt-bindings: i2c: maxim,max96712: Require setting bus-type property
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=746232
  Lore link: https://lore.kernel.org/r/20230509190031.769298-1-niklas.soderlund+renesas@ragnatech.se

Patch: dt-bindings: clock: drop unneeded quotes and use absolute /schemas path
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Stephen Boyd <sboyd@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=755736
  Lore link: https://lore.kernel.org/r/20230609140751.65129-1-krzysztof.kozlowski@linaro.org

Patch: media: rcar-vin: Add support for R-Car V4H
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=720985
  Lore link: https://lore.kernel.org/r/20230211145519.3821526-1-niklas.soderlund+renesas@ragnatech.se

Patch: mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED
  Submitter: Vlastimil Babka <vbabka@suse.cz>
  Committer: Vlastimil Babka <vbabka@suse.cz>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=750158
  Lore link: https://lore.kernel.org/r/20230523091139.21449-1-vbabka@suse.cz

Patch: arm64: defconfig: Enable PMIC RAA215300 and RTC ISL 1208 configs
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=762060
  Lore link: https://lore.kernel.org/r/20230703144108.413938-1-biju.das.jz@bp.renesas.com

Patch: [v3] media: renesas: fdp1: Identify R-Car Gen2 versions
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=750305
  Lore link: https://lore.kernel.org/r/3d6cbf2cd4398f29379d8d7287b93e8b8ec6c147.1684856457.git.geert+renesas@glider.be

Series: Input: gpio-keys - Interrupt-related fixes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=589923
  Lore link: https://lore.kernel.org/r/cover.1638538079.git.geert+renesas@glider.be
    Patches: [1/3] dt-bindings: input: gpio-keys: Fix interrupts in example
             [2/3] Input: gpio-keys - Use input_report_key()

Patch: dt-bindings: pwm: Add R-Car V3U device tree bindings
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Thierry Reding <thierry.reding@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=744456
  Lore link: https://lore.kernel.org/r/20230502165330.55769-1-wsa+renesas@sang-engineering.com

Patch: dt-bindings: cleanup DTS example whitespaces
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Rob Herring <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=761826
  Lore link: https://lore.kernel.org/r/20230702182308.7583-1-krzysztof.kozlowski@linaro.org

Series: media: rcar-csi2: Add support for V4H
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=742846
  Lore link: https://lore.kernel.org/r/20230424185934.438059-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v2,1/3] media: rcar-csi2: Prepare for Gen4 support

Patch: dt-bindings: backlight: pwm: Make power-supply not required
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Lee Jones <lee@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=750304
  Lore link: https://lore.kernel.org/r/29943059c80c8db0db437f9548f084a67326647b.1684856131.git.geert+renesas@glider.be

Patch: media: rcar-isp: Add support for R-Car V4H
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=720984
  Lore link: https://lore.kernel.org/r/20230211145436.3820935-1-niklas.soderlund+renesas@ragnatech.se


Total patches: 39

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


