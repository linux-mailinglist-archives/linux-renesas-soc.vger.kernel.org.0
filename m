Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE35D3C5C0F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jul 2021 14:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbhGLM0t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 08:26:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:37942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229562AbhGLM0o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 08:26:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B4A3D610FA
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 12:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626092636;
        bh=/awttR1cMuCT7HsgXIBGSdawZok1HJNha13dCvw0hhQ=;
        h=Subject:From:Date:To:From;
        b=vNlu4by9xOizlNQCtZMESlqzhCE8eM+SYkNtsV3+Nfucn4ZK4bzajSGpn9Q/L1WFd
         m9ovDV25SJdU7shZlOEAdwwVZEaogYMevz6ERUUr/OS3nvHa16ZYIBKt+mDXkJ05lG
         zrAAj24XB3RzW2z239zdvgl+/RBsZAVnDzjZ/otKEifrkW4kiX0kvaFi30CI/tPYi3
         LJjHNXQ/hWDXFwAyzd5aAQmhszQBd90/2CwwJYhg7fXRcmhjD8EKtSMrxem6mHJI0D
         LK+/fcwYIs1iyZFwkg9B1Q4Pn6QBhBxgVHZk9Rrtu95/lu+ppryD4KrLE5pqAOxKDh
         zVzmu0DQtcObg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A02E060A0C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 12:23:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <162609263659.31074.586489978012655940.git-patchwork-summary@kernel.org>
Date:   Mon, 12 Jul 2021 12:23:56 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel.git (refs/heads/next):

Patch: [GIT,PULL] pinctrl: sh-pfc: Updates for v5.14 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=498723
  Lore link: https://lore.kernel.org/r/cover.1623404609.git.geert+renesas@glider.be
Patch: [GIT,PULL] pinctrl: sh-pfc: Updates for v5.14
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=490145
  Lore link: https://lore.kernel.org/r/cover.1622191662.git.geert+renesas@glider.be
Patch: [GIT,PULL] clk: renesas: Updates for v5.14
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=490149
  Lore link: https://lore.kernel.org/r/cover.1622191519.git.geert+renesas@glider.be
Patch: [GIT,PULL] clk: renesas: Updates for v5.14 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=498721
  Lore link: https://lore.kernel.org/r/cover.1623404713.git.geert+renesas@glider.be

Total patches: 4

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


