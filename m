Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADDB5BBDFE
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Sep 2022 15:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbiIRNa1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 18 Sep 2022 09:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiIRNaZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Sep 2022 09:30:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98D5A1B78F
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Sep 2022 06:30:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2BDB661509
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Sep 2022 13:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C1D2C433D6
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Sep 2022 13:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663507820;
        bh=zbroMBkxCsvnC2OaDUW/QhgGghG76ENRd+kcU7ZlpCg=;
        h=Subject:From:Date:To:From;
        b=qyIEwFMP/KOJpWvcqkORJJ5i+Bio9MqvlRqIHekBY62TGCaRI8Xa2XY3lyRXloPqH
         OrMJhgal5d7DGLhcPB+rglJ2jnde2UWweWUsGAZFAm/P2MQ4MYaexwYWLdyMs0MwGw
         dTKhnqmz6OybZ3qpJ9n+wPoemoA8y/ilM9D6+SXYwr1psvbV43kGnqYWEz1VK7oMJ6
         o/QneGAdWTQ6l99BWsbVl87Gvioktt1pcKhXRPuod3E8bnNw70kv/IX0Afr5lCCU08
         BWiLw6yontq4ckZB/C66I0MThrG8mfXHfhm7x+YWEQcvu9xo4+llrg5pQI6R/LrLkB
         JI/y6ToenPBMA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 52C9DC73FFD
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Sep 2022 13:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166350782020.16137.16668281262507670679.git-patchwork-summary@kernel.org>
Date:   Sun, 18 Sep 2022 13:30:20 +0000
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

Series: arm64: dts: renesas: r8a779g0/white-hawk enhancements
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=675614
  Lore link: https://lore.kernel.org/r/cover.1662715538.git.geert+renesas@glider.be
    Patches: [01/14] arm64: dts: renesas: r8a779g0: Add RWDT node
             [02/14] arm64: dts: renesas: white-hawk-cpu: Enable watchdog timer
             [03/14] arm64: dts: renesas: r8a779g0: Add pinctrl device node
             [04/14] arm64: dts: renesas: white-hawk-cpu: Add serial port pin control
             [05/14] arm64: dts: renesas: r8a779g0: Add I2C nodes
             [06/14] arm64: dts: renesas: white-hawk: Add I2C0 and EEPROMs
             [07/14] arm64: dts: renesas: white-hawk: Add CSI/DSI sub-board
             [08/14] arm64: dts: renesas: white-hawk: Add Ethernet sub-board
             [09/14] arm64: dts: renesas: r8a779f0: Add GPIO nodes
             [10/14] arm64: dts: renesas: white-hawk-cpu: Add GP LEDs
             [11/14] arm64: dts: renesas: white-hawk-cpu: Add push switches
             [12/14] arm64: dts: renesas: r8a779g0: Add RAVB nodes
             [13/14] arm64: dts: renesas: white-hawk: Move aliases and chosen
             [14/14] arm64: dts: renesas: white-hawk-cpu: Add Ethernet support

Patch: arm64: dts: renesas: r8a779a0: Update to R-Car Gen4 compatible values
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=676992
  Lore link: https://lore.kernel.org/r/f14fde21270bf8269a61a75fc6e50af2765f2a42.1663164707.git.geert+renesas@glider.be

Patch: [RESEND] arm64: dts: renesas: spider: add missing bootargs
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=676379
  Lore link: https://lore.kernel.org/r/87leqo58ox.wl-kuninori.morimoto.gx@renesas.com

Patch: ARM: shmobile: Kconfig: Drop selecting SOC_BUS
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=677450
  Lore link: https://lore.kernel.org/r/20220915233852.415407-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: arm64: Kconfig.platforms: renesas: Drop selecting SOC_BUS
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=677449
  Lore link: https://lore.kernel.org/r/20220915233640.415305-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Series: RZ/G2UL SMARC EVK trivial changes
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=677399
  Lore link: https://lore.kernel.org/r/20220915165256.352843-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: rzg2ul-smarc: Include SoM DTSI into board DTS

Patch: arm64: dts: renesas: rzg2ul-smarc-som: Drop enabling wdt2
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=676968
  Lore link: https://lore.kernel.org/r/20220914134211.199631-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: arm64: dts: renesas: spider: Move aliases and chosen
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=677006
  Lore link: https://lore.kernel.org/r/c03500bb10eae10caeb3f4f97bc979eeee6cce75.1663167551.git.geert+renesas@glider.be

Patch: ARM: dts: renesas: Fix USB PHY device and child node names
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=676991
  Lore link: https://lore.kernel.org/r/6442b4042e26537abc8632c4772f8201685f1f1f.1663165098.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: Adjust whitespace around '{'
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=677596
  Lore link: https://lore.kernel.org/r/20220916100251.20329-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: [RESEND] arm64: dts: renesas: white-hawk: add missing bootargs
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=676380
  Lore link: https://lore.kernel.org/r/87k06858oe.wl-kuninori.morimoto.gx@renesas.com


Total patches: 24

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


