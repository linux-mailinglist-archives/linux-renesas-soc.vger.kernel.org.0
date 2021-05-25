Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80C3338FD50
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 May 2021 11:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbhEYJCI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 May 2021 05:02:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:41494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231785AbhEYJCI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 May 2021 05:02:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D10AF613F7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 May 2021 09:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621933238;
        bh=ETJdoamVrw2l0vmA7TIE2BUhV54864Kv1L4rS8IEpkE=;
        h=Subject:From:Date:To:From;
        b=YRQKFTeaIzsqOxV/TFZkOaf3eNrk0pImxeiiwLG0XP6Yg9ulh7dnoysc5tCeek65q
         v8gIDC6CFmiyWNbR/x+k0nU+3jZQdgVjnzNNz2ajJqKKNBaCDas7z8FTxdBXTRvOid
         9N8BxkQguuftU4pDbsGLYrJpb5mFsOUgzzeJSFxHW71t8dCZSoEyP+Q63eCKHl+yKT
         kFm0YdE82F5Le8yvpnh5bJby1zAw8B8KJoDy9tLARtouIZJ+HkFdts3mBBzCvNRRg/
         gB9s/06tRHPQ7l4ELTASrv9Ayb2mneRi+6fZlAc2lN/8Gh70A4bytJNIN4sy+AXWdh
         fuPx+QHYNezqw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C1D2360A22
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 May 2021 09:00:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <162193323873.21202.6445593998240243269.git-patchwork-summary@kernel.org>
Date:   Tue, 25 May 2021 09:00:38 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Series: [1/3] arm64: dts: renesas: beacon: Fix USB extal reference
  Submitter: Adam Ford <aford173@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=481829
  Lore link: https://lore.kernel.org/r/20210513114617.30191-1-aford173@gmail.com
    Patches: [1/3] arm64: dts: renesas: beacon: Fix USB extal reference
             [2/3] arm64: dts: renesas: beacon: Fix USB ref clock references
             [3/3] arm64: defconfig: Enable usb2_clksel for rcar3 and RZ/G2
Patch: [v3] ARM: dts: renesas: Move enable-method to CPU nodes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=484985
  Lore link: https://lore.kernel.org/r/35fcfedf9de9269185c48ca5a6dfcba7cdd3484b.1621427319.git.geert+renesas@glider.be
Patch: dt-bindings: media: renesas,drif: Use graph schema
  Submitter: Rob Herring <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=479797
  Lore link: https://lore.kernel.org/r/20210510203514.603471-1-robh@kernel.org

Total patches: 5

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


