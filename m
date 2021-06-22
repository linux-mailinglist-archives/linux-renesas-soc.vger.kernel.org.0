Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93FB33AFE58
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 09:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbhFVHwX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 03:52:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:37566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230304AbhFVHwS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 03:52:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 94A2C611AF
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jun 2021 07:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624348203;
        bh=PzaF+zGkr6Ae9Y1WQqylS8CJimkpTBLo2NxtIEN4iXA=;
        h=Subject:From:Date:To:From;
        b=CPSqtiMrzlwkew7oyE08LUEPolSS4DCw40L3wOmuPSG4y1beGcs2GKjfnUFafZCOa
         c7bWkuJTcixbHM2EoNULnY5lWNIrAkIa0ec5IgGCT7ExRWknL8yxAxyWsZvjT/Yrx/
         12yIakx/db0uhkKatRS/fO/niopOwCDe19/Hi5fNENrKNH3YxnEqNxsGcIp/xlm0pV
         xDZKH2XYDS0h9hgeSHFPVhOZaFMYpDjdoJK02hn7kvtqbb3CAW1xJYa/tRc/89/GDB
         iyoHNE3Rw1fWzbSp+TmpJFylBOkOWL1AyJLdKBNrrcy64KycZMTsxTqTQW3N+pQ1Dh
         OImIeBipNQ+Iw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8623A609FF
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jun 2021 07:50:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <162434820349.16300.14863477723459333574.git-patchwork-summary@kernel.org>
Date:   Tue, 22 Jun 2021 07:50:03 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Series: arm64: dts: renesas: salvator-x(s): Factor out common optional parts
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=495565
  Lore link: https://lore.kernel.org/r/cover.1623087028.git.geert+renesas@glider.be
    Patches: [1/4] arm64: dts: renesas: salvator-x(s): Factor out HDMI1 parts
             [2/4] arm64: dts: renesas: salvator-x(s): Factor out SATA parts
             [3/4] arm64: dts: renesas: salvator-x(s): Factor out USB ch2 parts
             [4/4] arm64: dts: renesas: salvator-xs: Factor out USB ch3 parts

Total patches: 4

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


