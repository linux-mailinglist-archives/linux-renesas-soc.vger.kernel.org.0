Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17BDA41AA70
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 10:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239265AbhI1ILs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 04:11:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:40366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239043AbhI1ILr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 04:11:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C3DC961153
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Sep 2021 08:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632816608;
        bh=exgIAKlgm3GFps/u8u5Xxj1PbnrLw3TOqeBXnOTD9x4=;
        h=Subject:From:Date:To:From;
        b=mACJsDOOJk4mwZXo/93r8/TATHiwULXkY287wM23GoiBqTYbM1cIFAsYbvaRLm+kT
         EF3H6jJ4RuxOVWNdBHCc5vCukWNHTkvGFfXb9KafWkJkl8G8iAu/eww9gGiuLAiHpm
         QYWNhfJRcWqiSHt8c1WQiNq11qL/xhUuBDUKba5tQ5aYwyLcDhnVHbTQMFyXHXd+bn
         2cSJv/n+FFl14BpA2NNf9TeQFGt11UAqW7mCPeKlhQZC3+jEe8trN6oJXFK65k4rto
         8kiVG/rpIZ57PN+CGN6gPe7gQ9hXIyDPsn7epeXSdoBeOgI24hwh2J1f907+Ecx1PZ
         T0Y1uaKVzwUxA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B216F60A59
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Sep 2021 08:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <163281660867.6152.14725953617181430698.git-patchwork-summary@kernel.org>
Date:   Tue, 28 Sep 2021 08:10:08 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: arm64: dts: renesas: beacon: Fix Ethernet PHY mode
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=552017
  Lore link: https://lore.kernel.org/r/2a4c15b2df23bb63f15abf9dfb88860477f4f523.1632465965.git.geert+renesas@glider.be
Series: renesas: Add compatible properties to Ethernet PHY nodes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=544249
  Lore link: https://lore.kernel.org/r/cover.1631174218.git.geert+renesas@glider.be
    Patches: [1/9] ARM: dts: renesas: Add compatible properties to KSZ8041 Ethernet PHYs
             [2/9] ARM: dts: renesas: Add compatible properties to KSZ8081 Ethernet PHYs
             [3/9] ARM: dts: renesas: Add compatible properties to KSZ9031 Ethernet PHYs
             [4/9] iARM: dts: renesas: Add compatible properties to LAN8710A Ethernet PHYs
             [5/9] ARM: dts: renesas: Add compatible properties to RTL8201FL Ethernet PHYs
             [6/9] ARM: dts: renesas: Add compatible properties to uPD6061x Ethernet PHYs
             [7/9] arm64: dts: renesas: Add compatible properties to AR8031 Ethernet PHYs
             [8/9] arm64: dts: renesas: Add compatible properties to KSZ9031 Ethernet PHYs
             [9/9] arm64: dts: renesas: Add compatible properties to RTL8211E Ethernet PHYs
Patch: arm64: defconfig: Enable RZG2L_ADC
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=553701
  Lore link: https://lore.kernel.org/r/20210927193551.22422-1-prabhakar.mahadev-lad.rj@bp.renesas.com
Patch: ARM: dts: renesas: Fix SMSC Ethernet compatible values
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=544213
  Lore link: https://lore.kernel.org/r/59c142176f795b3541c935df43ab11cecd77cc61.1631173813.git.geert+renesas@glider.be

Total patches: 12

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


