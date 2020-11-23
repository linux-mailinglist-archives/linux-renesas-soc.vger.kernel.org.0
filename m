Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 051D82C02E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Nov 2020 11:02:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbgKWKAT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Nov 2020 05:00:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:33414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727108AbgKWKAS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Nov 2020 05:00:18 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606125618;
        bh=PIFDpT3LKQd3gCQy0l8GW+vUbaWUFUFYMbaywpCvNQQ=;
        h=Subject:From:Date:To:From;
        b=TGyVdDAJm2VIV2Fw+6atTNTTF4WA3gnfVJDQwM1cBUBh9oy+ivboqK4cL5eJarKIP
         0M9OyBmOUbkc9POnoNarWCypt24VIy8wIX7+8YgtktB93KDRehvpwMZAZTz5ThmiF5
         sO5fXoxmsIU4o2mq0/qWOlqPVUZUBwvzYuit1LZ0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160612561825.25842.4685860621750109067.git-patchwork-summary@kernel.org>
Date:   Mon, 23 Nov 2020 10:00:18 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Series: ARM: shmobile: Remove IOMEM and static mappings
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=385839
  Lore link: https://lore.kernel.org/r/20201117103022.2136527-1-geert+renesas@glider.be
    Patches: [1/7] ARM: shmobile: r8a7778: Introduce HPBREG_BASE
             [2/7] ARM: shmobile: r8a7779: Use ioremap() to map INTC2 registers
             [3/7] ARM: shmobile: r8a7779: Use ioremap() to map SMP registers
             [4/7] ARM: shmobile: r8a7779: Remove obsolete static mappings
             [5/7] ARM: shmobile: sh73a0: Use ioremap() to map L2C registers
             [6/7] ARM: shmobile: sh73a0: Use ioremap() to map SMP registers
             [7/7] ARM: shmobile: sh73a0: Remove obsolete static mapping
Patch: soc: renesas: rmobile-sysc: Stop using __raw_*() I/O accessors
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=387513
  Lore link: https://lore.kernel.org/r/20201119125214.4065925-1-geert+renesas@glider.be
Patch: ARM: shmobile: Stop using __raw_*() I/O accessors
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=386037
  Lore link: https://lore.kernel.org/r/20201117142447.2205664-1-geert+renesas@glider.be

Total patches: 9

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


