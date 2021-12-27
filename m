Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFE5347FBDF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Dec 2021 11:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236097AbhL0Kkc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Dec 2021 05:40:32 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:57324 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236006AbhL0Kkc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Dec 2021 05:40:32 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0712060F5D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Dec 2021 10:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C230C36AE7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Dec 2021 10:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640601631;
        bh=6btPMcl8lbXPaPHHBw03RTPispraOP+uhGhIoqYWuHQ=;
        h=Subject:From:Date:To:From;
        b=PizzxJ3LLvT/9wD/pCf3w+/HKCqocThss154SwRCZfQ8o7VEeAie7e88j9NX822J7
         CIj+eXx+vpGDOK3HpV7XoLsOmB9Y9ja4FOuzqsEdHf+jmhKaImdZrsgqWnbZmn2KWx
         0YJjtG6gTSyVQDiofB5qPt3k22RfxejpOYkzob8GOFeSskledR4WR7b1JRt1LjieW8
         ZYDm2jxPbcgfM3TgagfRhaU6IXDYCXTgObqrIJhniMusIhCFct2L1rDqURGBOTeb6z
         sH5mvpVPsJGw9r7a9oHkzOgRRa1mKvH4gGn+14IwzawqmtKMeJulcKIoPS0AVV2d2H
         ttJtYglKX4bYw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5165FC395E0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Dec 2021 10:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <164060163123.14683.4127959780982295628.git-patchwork-summary@kernel.org>
Date:   Mon, 27 Dec 2021 10:40:31 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: renesas: defconfig: Refresh for v5.16-rc1 and misc updates
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=596745
  Lore link: https://lore.kernel.org/r/cover.1639669217.git.geert+renesas@glider.be
    Patches: [PATCH/LOCAL,1/5] arm64: renesas: defconfig: Refresh for v5.16-rc1
             [PATCH/LOCAL,2/5] arm64: renesas: defconfig: Errata update
             [PATCH/LOCAL,3/5] arm64: renesas: defconfig: Enable CONFIG_ARM64_RAS_EXTN
             [PATCH/LOCAL,4/5] arm64: renesas: defconfig: Enable CONFIG_SPI_RSPI
             [PATCH/LOCAL,5/5] arm64: renesas: defconfig: Enable R8A779F0 SoC


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


