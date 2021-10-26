Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9B9943ADCB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Oct 2021 10:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbhJZIMj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Oct 2021 04:12:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:51412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231158AbhJZIMi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Oct 2021 04:12:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3181E60F9B
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Oct 2021 08:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635235815;
        bh=O3Sg36S7/gbhuddqjL6Qn03HtHWU2Tld9BZ8T473n7w=;
        h=Subject:From:Date:To:From;
        b=j3GXVWZ6yPxMTk24O6TCi6kZhqaAWR2VrFeAJuhFN3/nDf1SzrAzXVOCU6mBsizTi
         Gg94Idl5+xFjLVnyLwM3NiacUAbsRdE+0uBSx7INjrJU+pRE36u6oW4AQIzAIfXFGP
         YYD0yo23aSm+b1HIuGbtA5aoNHJrJMsLQPyKVZs4BPtGNegPVpKn8RGIIVTAoA4a0b
         H7M12qubzxOt5sfXIp5Xg+b5DuS58aAweOF9I+lSbXXPd3OSBBPU3EDu+8mnZSdNvJ
         DIqelsT8IqR6OyHdJJK23sGgzbwQZYK79hopgEUx1biYamMRzzQzfC/9sfAaJr1N0K
         xY4ZtlzyEcLRw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 227EB60726
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Oct 2021 08:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <163523581508.24102.2640196939201336788.git-patchwork-summary@kernel.org>
Date:   Tue, 26 Oct 2021 08:10:15 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v2] can: rcar_can: Fix suspend/resume
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Marc Kleine-Budde <mkl@pengutronix.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=552069
  Lore link: https://lore.kernel.org/r/20210924075556.223685-1-yoshihiro.shimoda.uh@renesas.com

Patch: ARM: shmobile: Add missing of_node_put()
  Submitter: Wan Jiabing <wanjiabing@vivo.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=565075
  Lore link: https://lore.kernel.org/r/20211018014503.7598-1-wanjiabing@vivo.com

Patch: ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add missing camera regulators
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=563543
  Lore link: https://lore.kernel.org/r/300149c730931914b77e17df6bcce89b67c3005f.1634222546.git.geert+renesas@glider.be


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


