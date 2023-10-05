Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB8137BA33D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Oct 2023 17:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235702AbjJEPwz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Oct 2023 11:52:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235576AbjJEPvL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2023 11:51:11 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE21A5DFCD
        for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Oct 2023 07:07:31 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0EDD7C4AF5C
        for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Oct 2023 13:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696512632;
        bh=5WRYu6DvdRv4eius04Qr34dh4j5n5SCEGE+8cxHg8Gw=;
        h=Subject:From:Date:To:From;
        b=tVq5ErGjrqLRsJhbfxd2jssd4ietxzbwyFY3usz9/ZQTyn7YrhITkZAEFYBBPehf1
         3GjV1Tcmbzw6zd60szi/YxGh0uk5Au2R80sYMKXyWkBlRmQSlEljhxvD9qs+kIJp7L
         4oqUBTBZGnIX/b9PrG2SROeSO8apn7AmaFsdFdmDs6PKn6NUmeecHg7Ccm5ByNtgF/
         dmu7xvnvOZI3tFTENEYjTrX+4IE5KRgMOXsHUqCg6ar2woLqWQs7+ehdbRl8ZmGWTY
         RoczRqx9IqbGIS5nTuKOlZFtyZB1yZ7Q/GmdF9epIh+bZop3gttbBuYG2EFNys84Ku
         L1cp7d2ipYyDQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E8B7CE632D1
        for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Oct 2023 13:30:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <169651263188.29610.715752346644851033.git-patchwork-summary@kernel.org>
Date:   Thu, 05 Oct 2023 13:30:31 +0000
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

Series: arm64: dts: renesas: Add R-Car S4 Starter Kit support
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=789448
  Lore link: https://lore.kernel.org/r/87v8bofna8.wl-kuninori.morimoto.gx@renesas.com
    Patches: [v4,1/4] dt-bindings: irqchip: renesas,irqc: Add r8a779f0 support
             [v4,2/4] dt-bindings: soc: renesas: renesas.yaml: Add renesas,s4sk compatible
             [v4,3/4] arm64: dts: renesas: Add Renesas R8A779F4 SoC support
             [v4,4/4] arm64: dts: renesas: Add R-Car S4 Starter Kit support

Series: Enable peripherals on RZ/Five SMARC EVK
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=788672
  Lore link: https://lore.kernel.org/r/20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/5] riscv: dts: renesas: r9a07g043f: Add L2 cache node
             [2/5] riscv: dts: renesas: r9a07g043f: Add dma-noncoherent property
             [3/5] riscv: dts: renesas: rzfive-smarc: Enable the blocks which were explicitly disabled

Patch: soc: renesas: make ARCH_R9A07G043 (riscv version) depend on NONPORTABLE
  Submitter: Jisheng Zhang <jszhang@kernel.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=789973
  Lore link: https://lore.kernel.org/r/20231004150856.2540-1-jszhang@kernel.org

Series: Add new Renesas RZ/G3S SoC and RZ/G3S SMARC EVK
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=788691
  Lore link: https://lore.kernel.org/r/20230929053915.1530607-1-claudiu.beznea@bp.renesas.com
    Patches: [v2,01/28] dt-bindings: serial: renesas,scif: document r9a08g045 support
             [v2,12/28] dt-bindings: clock: renesas,rzg2l-cpg: document RZ/G3S SoC
             [v2,22/28] arm64: dts: renesas: add initial DTSI for RZ/G3S SoC
             [v2,23/28] dt-bindings: arm: renesas: document RZ/G3S SMARC SoM
             [v2,24/28] arm64: dts: renesas: rzg3l-smarc-som: add initial support for RZ/G3S SMARC SoM
             [v2,25/28] arm64: dts: renesas: rzg3s-smarc: add initial device tree for RZ SMARC Carrier-II Board
             [v2,26/28] dt-bindings: arm: renesas: document SMARC Carrier-II EVK
             [v2,27/28] arm64: dts: renesas: r9a08g045s33-smarc: add initial device tree for RZ/G3S SMARC EVK board
             [v2,28/28] arm64: defconfig: enable RZ/G3S (R9A08G045) SoC

Series: renesas: r8a7778/bockw: Add LBSC pin control and FLASH support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=784503
  Lore link: https://lore.kernel.org/r/cover.1694768311.git.geert+renesas@glider.be
    Patches: [PATCH/RFT,1/2] pinctrl: renesas: r8a7778: Add LBSC pins, groups, and functions
             [PATCH/RFT,2/2] ARM: dts: renesas: bockw: Add FLASH node

Patch: [v4] arm64: dts: renesas: rz-smarc-common: Use versa3 clk for audio mclk
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=779299
  Lore link: https://lore.kernel.org/r/20230825090518.87394-1-biju.das.jz@bp.renesas.com

Patch: [v2] arm64: dts: renesas: r8a77990: document Ebisu-4D support
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=789976
  Lore link: https://lore.kernel.org/r/20231004152751.3917-1-wsa+renesas@sang-engineering.com


Total patches: 21

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


