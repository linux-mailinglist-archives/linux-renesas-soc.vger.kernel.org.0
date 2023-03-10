Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 475806B4E5D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Mar 2023 18:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjCJRUa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Mar 2023 12:20:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbjCJRUa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 12:20:30 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B9E8C581
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 09:20:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id BF7E3CE29D5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 17:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19D61C433D2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 17:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678468823;
        bh=EdyjfNKrCz10RAhHXPgYZE/gP4AFx1p573tNByiDo4c=;
        h=Subject:From:Date:To:From;
        b=joUTIRKUjum/wT3w3VHA+1Ht4sB1EtDT/HH7QWe6ONYJisf0JmGRfqN63wIo4byep
         SFBn03Ih8/moGGaTfCSUJGSevjBdBHIqEAwXb2L8vhIoYJTLfzFNek4SXIIaY0Q4kF
         qaXYQhzd5lQyhTjNF2egc/0y41k42nOyFHLpRiaohXWo6twUFvA1S4KN1MQ/USmA0Y
         h3tpEDDQcXuyl47iPxrlOiDvepV55tRf/jAKV/RyJUhRqDiMgjhkZ+j21mSInoioTJ
         JiUIIbtIstlZsJIkBlgsEO77zXN7KUw2jErNt+wbsJEqc3yOK5+MAv9BAGDsSBLP6i
         N5SmE8f2cBOEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E6EC9C59A4C
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 17:20:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <167846882283.32252.15303576265018277858.git-patchwork-summary@kernel.org>
Date:   Fri, 10 Mar 2023 17:20:22 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: WhiteHawk: Add Sound support
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=727135
  Lore link: https://lore.kernel.org/r/87r0u1l9vc.wl-kuninori.morimoto.gx@renesas.com
    Patches: [1/4] arm64: dts: renesas: r8a779g0: R-Car Sound support
             [2/4] arm64: dts: renesas: r8a779g0: whitehawk: Add R-Car Sound support
             [3/4] arm64: defconfig: Enable DA7213 Codec
             [4/4] arm64: renesas_defconfig: Enable DA7213/COMMON_CLK_PWM

Series: ARM/arm64: defconfig updates for Renesas platforms
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=727925
  Lore link: https://lore.kernel.org/r/cover.1678286291.git.geert+renesas@glider.be
    Patches: [1/3] ARM: shmobile: defconfig: Refresh for v6.3-rc1
             [2/3] ARM: multi_v7_defconfig: Enable additional support for RZ/N1 platforms
             [3/3] arm64: defconfig: Enable RZ/V2M xHCI and USB3.1 DRD controller support

Series: arm64: dts: renesas: add V4H White Hawk Sound support
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=717933
  Lore link: https://lore.kernel.org/r/87edr8angv.wl-kuninori.morimoto.gx@renesas.com
    Patches: [1/9] pinctrl: renesas: r8a779g0: Add Audio Clock support
             [8/9] arm64: defconfig: Enable DA7213 Codec

Patch: soc: renesas: rmobile-sysc: Use of_fwnode_handle() helper
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=727874
  Lore link: https://lore.kernel.org/r/d49b9fb20d68709b12692558aca91997e6b06fb4.1678272276.git.geert+renesas@glider.be

Series: arm64: dts: renesas: Remove bogus voltages from OPP table
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=722592
  Lore link: https://lore.kernel.org/r/cover.1676560856.git.geert+renesas@glider.be
    Patches: [1/2] arm64: dts: renesas: r8a77990: Remove bogus voltages from OPP table
             [2/2] arm64: dts: renesas: r8a774c0: Remove bogus voltages from OPP table

Series: renesas: remove support for H3 ES1
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=727290
  Lore link: https://lore.kernel.org/r/20230307105645.5285-1-wsa+renesas@sang-engineering.com
    Patches: [2/5] arm64: dts: renesas: remove R-Car H3 ES1.* devicetrees
             [3/5] dt-bindings: soc: renesas: remove R-Car H3 ES1.*
             [4/5] soc: renesas: rcar-sysc: remove R-Car H3 ES1.* handling
             [5/5] soc: renesas: remove r8a77950 arch

Series: RZ/G2L SSI: Update interrupt numbers
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=723065
  Lore link: https://lore.kernel.org/r/20230217185225.43310-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/4] ASoC: dt-bindings: renesas,rz-ssi: Update interrupts and interrupt-names properties
             [3/4] arm64: dts: renesas: r9a07g044: Update IRQ numbers for SSI channels
             [4/4] arm64: dts: renesas: r9a07g043: Update IRQ numbers for SSI channels

Patch: [LOCAL] arm64: renesas: defconfig: Refresh for v6.3-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=727918
  Lore link: https://lore.kernel.org/r/b852a3302fbc2e7729d95dad9e56c3636ff9624e.1678286092.git.geert+renesas@glider.be


Total patches: 20

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


