Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5417A6426DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Dec 2022 11:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbiLEKkd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 05:40:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbiLEKkc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 05:40:32 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A249B1CF
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2022 02:40:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BCAB9B80E8F
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2022 10:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7ED27C433D6
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2022 10:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670236829;
        bh=2WuJ9lkW5z9zoP0aPNpQ83nzBmu+pB7qOPbluXpukaQ=;
        h=Subject:From:Date:To:From;
        b=YZzarkOY4gxJlGBbE0l9EPyJVpEpbZ1v1JQsP6Lp7rjxnad9NPtgbYBwx9IXKpF3U
         vdJfnOoEaMgkwaU0iCTxkf4hqagL1u9tf24MWjkBWFhVaiWpUMeCOGkepBF03+mvf5
         7nD2M5yfPvR24RPUpsMFCKI57WoyxJJi236RSASzk5xO9zJM4A8UiTLzv3idyp0rSI
         QjhGAUIWucLuGjKRB2BuuLguYEN/vV84wT9yP5O3c8fi6rzH0sKIIUZW7gPnHGZ108
         Yh87YvnQOb9e2dBDi8ukRNL9f4P7QrZK5UWBRig0tOfxHaq0PZtvVCk8Ugdp0ej/Ag
         szMz+cBnjvXuQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 56776C395E5
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2022 10:40:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <167023682927.2329.18146039126038489313.git-patchwork-summary@kernel.org>
Date:   Mon, 05 Dec 2022 10:40:29 +0000
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

Series: renesas: r8a779g0-sysc: Add missing A3DUL power domain
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=700174
  Lore link: https://lore.kernel.org/r/cover.1669740926.git.geert+renesas@glider.be
    Patches: [1/2] dt-bindings: power: r8a779g0: Add missing A3DUL power domain
             [2/2] soc: renesas: r8a779g0-sysc: Add missing A3DUL power domain

Patch: [net] net: ethernet: renesas: ravb: Fix promiscuous mode after system resumed
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=699582
  Lore link: https://lore.kernel.org/r/20221128065604.1864391-1-yoshihiro.shimoda.uh@renesas.com

Patch: arm64: dts: renesas: r8a779f0: Add CA55 operating points
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=700474
  Lore link: https://lore.kernel.org/r/ae78351d702a53702a1d5fa26675fe982b99cdf5.1669817508.git.geert+renesas@glider.be

Patch: arm64: defconfig: Enable Renesas RZ/G2L MIPI DSI driver
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=698195
  Lore link: https://lore.kernel.org/r/20221122184854.1820126-1-biju.das.jz@bp.renesas.com

Series: Renesas V4H DSI & DP output support
  Submitter: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=700774
  Lore link: https://lore.kernel.org/r/20221201095631.89448-1-tomi.valkeinen+renesas@ideasonboard.com
    Patches: [v5,1/7] dt-bindings: display: renesas,du: Provide bindings for r8a779g0
             [v5,4/7] arm64: dts: renesas: r8a779g0: Add display related nodes
             [v5,5/7] arm64: dts: renesas: white-hawk-cpu: Add DP output support

Patch: riscv: dts: renesas: rzfive-smarc-som: Enable WDT
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=696945
  Lore link: https://lore.kernel.org/r/20221118135715.14410-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


