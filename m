Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907322E361F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Dec 2020 11:59:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgL1K7R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Dec 2020 05:59:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:49902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727019AbgL1K7R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Dec 2020 05:59:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id EDB862084D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Dec 2020 10:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609153117;
        bh=8t34yV6JuabaCWsqflZlqF8dF8B6+wtLvEx69/aG/8A=;
        h=Subject:From:Date:To:From;
        b=k3S22zeM7kRvbPc65iOvlYoGFrDIssgX9fz1scVgQeWrIE9nkefHrYqlgGrXbU+WP
         fsJFT4BpKm4LNnxjZRLwZXfvckSyS4MR+1FoTN4gdXKK2lGjAIMeRr0IE/F8Imkt5m
         Pa7reL0izq+ryfEEOvPIukUPSwlD+RbMqnIGLNb2WxuafMCUEV590VL76+nId4HDKN
         CbERiJvTg6Xz1FDBpfJmsZCPKw/SUT+OHTRlpGbio1gC2BMxIcX6COyp2ZEWoCIaPI
         G1d5SzH9Xrdd352kDiFmeQmG8GyvPYer4lXztVqvyFyPhGVzHHcbfyBWlaM3qWP26Z
         nNxicYLx/XzRw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id CF49560504
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Dec 2020 10:58:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160915311678.31533.17337011338198718909.git-patchwork-summary@kernel.org>
Date:   Mon, 28 Dec 2020 10:58:36 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel.git (refs/heads/next):

Patch: [GIT,PULL] pinctrl: sh-pfc: Updates for v5.11 (take two)
  Submitter: Geert Uytterhoeven <geert@linux-m68k.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=392231
  Lore link: https://lore.kernel.org/r/20201127134304.79252-1-geert@linux-m68k.org
Series: tmio/sdhi: fix workaround for a regression
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=378775
  Lore link: https://lore.kernel.org/r/20201106072549.1495-1-wsa+renesas@sang-engineering.com
    Patches: [1/3] mmc: tmio: when resetting, reset DMA controller, too
             [2/3] mmc: tmio: bring tuning HW to a sane state with MMC_POWER_OFF
             [3/3] Revert "mmc: renesas_sdhi: workaround a regression when reinserting SD cards"
Patch: [GIT,PULL] clk: renesas: Updates for v5.11 (take three)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=399583
  Lore link: https://lore.kernel.org/r/20201210075018.2407915-1-geert+renesas@glider.be
Patch: dma-mapping: Fix 32-bit overflow with CONFIG_ARM_LPAE=n
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=370571
  Lore link: https://lore.kernel.org/r/20201026152755.3738293-1-geert+renesas@glider.be
Patch: [net,v2] ravb: Fix bit fields checking in ravb_hwtstamp_get()
  Submitter: Andrew Gabbasov <andrew_gabbasov@mentor.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=370279
  Lore link: https://lore.kernel.org/r/20201026102130.29368-1-andrew_gabbasov@mentor.com
Patch: mmc: host: renesas_sdhi_core: Missing tmio_mmc_host_free() in renesas_sdhi_remove()
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=378887
  Lore link: https://lore.kernel.org/r/1604654730-29914-1-git-send-email-yoshihiro.shimoda.uh@renesas.com
Patch: irqchip/renesas-intc-irqpin: Merge irlm_bit and needs_irlm
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=372207
  Lore link: https://lore.kernel.org/r/20201028153955.1736767-1-geert+renesas@glider.be

Total patches: 9

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


