Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00BC262E577
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Nov 2022 20:50:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234380AbiKQTuX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Nov 2022 14:50:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240298AbiKQTuW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Nov 2022 14:50:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632E08516C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 11:50:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DD8BCB821C9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 19:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89C3DC433D7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 19:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668714618;
        bh=nTbKJTR5ZGZJB9+6QGzDBw5ekPUn8kj/hHBjeZ9YeoA=;
        h=Subject:From:Date:To:From;
        b=G0lrcVXFwu0a6VGNGO1qEMVI8dVr041j83QI40v2q3Ga0VzvbmAgfXdKtPEixvQ3G
         UAWTtpPkVJ0Vlhym63SWztw+r3XY9R+C3tP4R7m5z/c8DCNktcW4trf8AVd4DRFcX3
         5+NmKL76g+VlyvKHKa98e1YG8Yn2/msdnFaqMjU4qU2G92vlxpSHy1FGP9YJ11H3T0
         QIDRfJgc6GxIHk8Ye8OF0H/qYK7LG0Hx8n55qz3kD6qYnFUg+tDf/yH5+g2AckBtKO
         ty2ajbVmgeiF+7yRHjfJzZFoV3j+8mSlpeD1NNG4bikpf1EXZaPfs3BKCyqz5yYkem
         nstg+yJGQ+AXA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 64E39E270D5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 19:50:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166871461833.5926.1594366164767983914.git-patchwork-summary@kernel.org>
Date:   Thu, 17 Nov 2022 19:50:18 +0000
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

Series: arm64: dts: renesas: r8a779g0: CPU topology improvements
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=695078
  Lore link: https://lore.kernel.org/r/cover.1668429870.git.geert+renesas@glider.be
    Patches: [1/5] arm64: dts: renesas: r8a779g0: Add L3 cache controller
             [2/5] arm64: dts: renesas: r8a779g0: Add secondary CA76 CPU cores
             [3/5] arm64: dts: renesas: r8a779g0: Add CPUIdle support
             [4/5] arm64: dts: renesas: r8a779g0: Add CPU core clocks
             [5/5] arm64: dts: renesas: r8a779g0: Add CA76 operating points

Series: Add SoC identification support for RZ/V2M
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=695896
  Lore link: https://lore.kernel.org/r/20221116102140.852889-1-biju.das.jz@bp.renesas.com
    Patches: [v4,1/3] dt-bindings: arm: renesas: Document Renesas RZ/V2M System Configuration
             [v4,2/3] soc: renesas: Identify RZ/V2M SoC
             [v4,3/3] arm64: dts: renesas: r9a09g011: Add system controller node

Series: RZ/Five: Enable ADC/CANFD/I2C/OPP/Thermal Zones/TSU
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=695471
  Lore link: https://lore.kernel.org/r/20221115105135.1180490-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/3] riscv: Kconfig: Enable cpufreq kconfig menu
             [2/3] riscv: dts: renesas: r9a07g043f/rzfive-smarc-som: Enable ADC/OPP/Thermal Zones/TSU
             [3/3] riscv: dts: renesas: rzfive-smarc: Enable CANFD/I2C


Total patches: 11

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


