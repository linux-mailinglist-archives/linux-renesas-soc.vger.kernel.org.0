Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44576343C13
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 09:51:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbhCVIum (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 04:50:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:53712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229591AbhCVIuR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 04:50:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4FB266192B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 08:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616403016;
        bh=5rxZFJMOaNc7Flc7l005n1whU55iQg+0HrHfzSfq0pM=;
        h=Subject:From:Date:To:From;
        b=CLXiKInJp2c23+1ooEbsw9kVWrG07YtQxqTnFM2p5VZzZF0aLp9uRufFqtRexyorx
         i8NkCR1U96ENeetCPULZXqxUdIviV9NDsGml9W6LrSCnSw6nipnUMSVB5iUQWWyu1u
         wjtEgR2aZD8FFuRwF13NgJKChedwcP9hSYccGiJ8L/Mwc90ka+gZp3PJnQr6OmeMxh
         IJymIpt92CcrHpFJPrYpfqD1ODn/UsnZZOy4b7JOVYNB08z5dHDY7sYRhszPohPHlc
         UrYg3GGzb1seSFI4mYcL0xFER2DbcwW+EtxuZWFr3UShI9ubLWJV9SLHMVJkqTsAoq
         b1EUnoRuN826g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 457E560A0B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 08:50:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <161640301623.32340.2314520618149150450.git-patchwork-summary@kernel.org>
Date:   Mon, 22 Mar 2021 08:50:16 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Series: arm64: dts: renesas: falcon: Restructuring
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=449195
  Lore link: https://lore.kernel.org/r/20210316154705.2433528-1-geert+renesas@glider.be
    Patches: [1/3] arm64: dts: renesas: falcon: Move console config to CPU board DTS
             [2/3] arm64: dts: renesas: falcon: Move watchdog config to CPU board DTS
             [3/3] arm64: dts: renesas: falcon: Move AVB0 to main DTS

Total patches: 3

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


