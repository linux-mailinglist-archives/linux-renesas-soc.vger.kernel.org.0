Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB9CF5492B6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jun 2022 18:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236579AbiFMKcL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jun 2022 06:32:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344934AbiFMK3U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jun 2022 06:29:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D259625E83
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jun 2022 03:20:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 47D3A60AE8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jun 2022 10:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD9F1C385A2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jun 2022 10:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655115636;
        bh=9AuwvcDNSCHaYiBRl68W7uxVTwStxTBwbeBq+t/JEsE=;
        h=Subject:From:Date:To:From;
        b=Nxud7VAxCf9/601AP7hBTYx3Y5fulDXYYUzdYnx3To72FRK87iz3L2cjA/Li/5kMQ
         lWfSDlmQdrsA2wN7XelCpPlKQ19TP8e76dr0ht1cw/FrlvsA3depyxHA29eFYNz6qI
         6rJt2YG/4iICXWlLOKubuavahsKb5MkKCdq03kD7NDWKzEVgq7qDnHq+JL/3bvTE0p
         4YnUpDa9s6ombtm7UYgwQB7+33jGjzHODkj2T7dPC2qgmlAZ7a6v9gczsR4+InQNLh
         5eTWY1sPkPR/HNNZvQEANcFcl45y6zjocNVc75L0ksabOBfWh/OcH9a8YX8sQ5zpac
         JIOdDVAuR7bjA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 935F1E575F6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jun 2022 10:20:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <165511563654.8839.2013511555343668272.git-patchwork-summary@kernel.org>
Date:   Mon, 13 Jun 2022 10:20:36 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Patch: arm64: defconfig: Enable R8A779G0 SoC
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=649223
  Lore link: https://lore.kernel.org/r/eb672fad7c9a340812079a07539d670f42f4ad41.1654855105.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: Add missing space after remote-endpoint
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=648598
  Lore link: https://lore.kernel.org/r/20220608175728.1012550-1-niklas.soderlund+renesas@ragnatech.se

Series: arm64: renesas: defconfig: Miscellaneous updates
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=649224
  Lore link: https://lore.kernel.org/r/cover.1654855338.git.geert+renesas@glider.be
    Patches: [PATCH/LOCAL,1/3] arm64: renesas: defconfig: Refresh for v5.19-rc1
             [PATCH/LOCAL,2/3] arm64: renesas: defconfig: Enable HyperFlash support
             [PATCH/LOCAL,3/3] arm64: renesas: defconfig: Enable PSCI CPU idle Driver

Series: arm64: dts: renesas: r8a779f0: CPU topology improvements
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=648541
  Lore link: https://lore.kernel.org/r/cover.1654701480.git.geert+renesas@glider.be
    Patches: [1/4] arm64: dts: renesas: r8a779f0: Add L3 cache controller
             [2/4] arm64: dts: renesas: r8a779f0: Add secondary CA55 CPU cores
             [3/4] arm64: dts: renesas: r8a779f0: Add CPUIdle support
             [4/4] arm64: dts: renesas: r8a779f0: Add CPU core clocks

Series: Test plane alpha and zpos control
  Submitter: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=649018
  Lore link: https://lore.kernel.org/r/20220609234031.14803-1-laurent.pinchart@ideasonboard.com
    Patches: [kms-test,01/10] tests: Replace double quotes with single quotes
             [kms-test,10/10] tests: Rename kms-test-planeposition.py to kms-test-plane-position.py

Patch: arm64: dts: renesas: r8a779f0: Add thermal support
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=644988
  Lore link: https://lore.kernel.org/r/20220525151355.24175-1-wsa+renesas@sang-engineering.com

Patch: soc: renesas: rcar-sysc: Optimize rcar_sysc_area struct sizes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=648530
  Lore link: https://lore.kernel.org/r/cbbc8f464743d636895c048de61aa610d75392de.1654701156.git.geert+renesas@glider.be

Patch: ARM: shmobile: defconfig: Refresh for v5.19-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=649221
  Lore link: https://lore.kernel.org/r/7ef31a41e1a15d0cedeb6cfc496ce70a78102e32.1654855000.git.geert+renesas@glider.be

Series: Enable ADC, RSPI1
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=648585
  Lore link: https://lore.kernel.org/r/20220608173025.22792-1-biju.das.jz@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: rzg2ul-smarc: Enable RSPI1 on carrier board
             [2/2] arm64: dts: renesas: rzg2ul-smarc-som: Enable ADC on SMARC platform

Patch: arm64: dts: renesas: adjust whitespace around '='
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=645374
  Lore link: https://lore.kernel.org/r/20220526204231.832090-1-krzysztof.kozlowski@linaro.org

Patch: soc: renesas: r8a779a0-sysc: Fix A2DP1 and A2CV[2357] PDR values
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=648473
  Lore link: https://lore.kernel.org/r/87bc2e70ba4082970cf8c65871beae4be3503189.1654696188.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: rzg2l-smarc: use proper bool operator
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=647340
  Lore link: https://lore.kernel.org/r/20220603232940.21736-1-wsa+renesas@sang-engineering.com

Patch: ARM: dts: r9a06g032-rzn1d400-db: enable rtc0
  Submitter: Clément Léger <clement.leger@bootlin.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=648364
  Lore link: https://lore.kernel.org/r/20220608090850.92735-1-clement.leger@bootlin.com


Total patches: 20

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


