Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5A854F2B1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jun 2022 10:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380589AbiFQIUX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jun 2022 04:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380357AbiFQIUW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jun 2022 04:20:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C5868328
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 01:20:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5CADFB8213C
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 08:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E2A7C3411F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 08:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655454017;
        bh=zqrtWjUVgzZK2JBAoLk4dA7BkGKMkE78KsrKr3frAAU=;
        h=Subject:From:Date:To:From;
        b=F/K5pJa8gs3nEviE82MFTnuwvVaB6vyMlehaUXCrdxKG7I4CjpyhOxbfTtWIZlJuT
         HNIVHdaoXZpXI3Y5wcBT1pMzGIPHTpXT4CwHBepFXFG1PkKj9yb3GKVjMSWUSl3Ka2
         LL3v9HCNdbUGvjplnsXgN8VG0lsrLnsHFtclfZzcJr3JPfdMj8EOZNw2M7aj33PKKB
         L9TfNq+agylCuoTT0ecvrlss1v6sfVgmqK/JGStYsFssB3rQM7uUbKfwuyiEPVyq4P
         yOjyaNlwLtJ2RnLOiQeL5bYQydBxyrxFju26KB8YUoVNFTLGVqOlOluo/Q6ymb7sLk
         N1Ym0v5Lo+26g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E11CDFD99FF
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 08:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <165545401681.26881.6087779430785221489.git-patchwork-summary@kernel.org>
Date:   Fri, 17 Jun 2022 08:20:16 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Patch: arm64: dts: renesas: r8a779a0: Update to R-Car Gen4 compatible values
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=648528
  Lore link: https://lore.kernel.org/r/b477eea0fc33a055d1b1874847e26614f68f5da0.1654701299.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: Fix thermal-sensors on single-zone sensors
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=650624
  Lore link: https://lore.kernel.org/r/28b812fdd1fc3698311fac984ab8b91d3d655c1c.1655301684.git.geert+renesas@glider.be

Series: arm64: dts: renesas: r8a779f0: CPU topology improvements
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=648541
  Lore link: https://lore.kernel.org/r/cover.1654701480.git.geert+renesas@glider.be
    Patches: [1/4] arm64: dts: renesas: r8a779f0: Add L3 cache controller
             [2/4] arm64: dts: renesas: r8a779f0: Add secondary CA55 CPU cores
             [3/4] arm64: dts: renesas: r8a779f0: Add CPUIdle support
             [4/4] arm64: dts: renesas: r8a779f0: Add CPU core clocks

Patch: [v2] arm64: dts: renesas: r8a779f0: Add HSCIF nodes
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=650151
  Lore link: https://lore.kernel.org/r/20220614095109.8175-1-wsa+renesas@sang-engineering.com

Patch: ARM: dts: rza2mevb: Fix LED node names
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=650616
  Lore link: https://lore.kernel.org/r/f6e2883c16803b5d90a26c38d8e61ad15096089c.1655301593.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: r8a779a0: Add CPU0 core clock
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=648529
  Lore link: https://lore.kernel.org/r/3ace4eea4ff1cdc0f7b8ea7d0433c1063d795785.1654701400.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: adjust whitespace around '='
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=645374
  Lore link: https://lore.kernel.org/r/20220526204231.832090-1-krzysztof.kozlowski@linaro.org

Series: [1/2] dt-bindings: soc: renesas: Move renesas,prr from arm to soc
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=637563
  Lore link: https://lore.kernel.org/r/5f124fc332b4b866f5238ada7ac000f4639c88c3.1651495078.git.geert+renesas@glider.be
    Patches: [1/2] dt-bindings: soc: renesas: Move renesas,prr from arm to soc

Series: [1/3] arm64: dts: renesas: r8a779f0: Add DMA properties to SCIF3
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=649913
  Lore link: https://lore.kernel.org/r/20220613134914.18655-1-wsa+renesas@sang-engineering.com
    Patches: [1/3] arm64: dts: renesas: r8a779f0: Add DMA properties to SCIF3

Patch: [v2] arm64: dts: renesas: spider-cpu: Enable SCIF0 on second connector
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=650325
  Lore link: https://lore.kernel.org/r/20220614193005.2652-1-wsa+renesas@sang-engineering.com

Patch: arm64: dts: renesas: r8a779f0: Add thermal support
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=644988
  Lore link: https://lore.kernel.org/r/20220525151355.24175-1-wsa+renesas@sang-engineering.com

Patch: arm64: dts: renesas: Add missing space after remote-endpoint
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=648598
  Lore link: https://lore.kernel.org/r/20220608175728.1012550-1-niklas.soderlund+renesas@ragnatech.se

Patch: [v2] arm64: dts: renesas: r8a779f0: Add SCIF nodes
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=650152
  Lore link: https://lore.kernel.org/r/20220614095242.8264-1-wsa+renesas@sang-engineering.com

Series: treewide: ufs: Add support for Renesas R-Car UFS controller
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=647161
  Lore link: https://lore.kernel.org/r/20220603110524.1997825-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [v6,1/7] dt-bindings: ufs: Document Renesas R-Car UFS host controller
             [v6,6/7] arm64: dts: renesas: r8a779f0: Add UFS node


Total patches: 20

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


