Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDBA37A1FD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 May 2021 10:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhEKIam (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 May 2021 04:30:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:40188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231299AbhEKIaN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 May 2021 04:30:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id CC68B613CF
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 May 2021 08:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620721747;
        bh=Unn88THm3X78klgY53B8BBKhIrNX8exkBM5Yn8Ksnj4=;
        h=Subject:From:Date:To:From;
        b=I6C2SNj4WpF6NO/9frqiQFX52XHwn0OhzZBul8f1yYohSXsd1sPcnv44LT4Y835Ww
         GEZWPnxo1bCaSo294QwLavpSvLooDz7n1JV7Q40WmCKMxXQ2YNrsXB6A5iQ3+2oVnA
         TaQw3fH/ENkpAnr3eo98gr37TxSZDIsLIxMRzDMPRiCUSLa/DM/qUl2cJnV9cBAM39
         0lsF2s1FxQ3D7b4B/WShc+A8ns/iCULn2ErzqhFrY3kATvx8SFUiuMXx2M8DjPshtO
         a2HEpW1DJGuaHF4kYh9J6WfEDc9vQNq/upy1B7okyWDaLfJB9OCT736DBEMl+WGfQE
         ygATAvrclUC1Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C6C586098E
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 May 2021 08:29:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <162072174780.29505.4172900874478972779.git-patchwork-summary@kernel.org>
Date:   Tue, 11 May 2021 08:29:07 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: ARM: dts: r8a7779, marzen: Fix DU clock names
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=475155
  Lore link: https://lore.kernel.org/r/9d5e1b371121883b3b3e10a3df43802a29c6a9da.1619699965.git.geert+renesas@glider.be
Patch: arm64: dts: renesas: eagle: Add x1 clock
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=476751
  Lore link: https://lore.kernel.org/r/75a66bae21937da1c69e8024ce61b35aad4ac9b8.1620119570.git.geert+renesas@glider.be

Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


