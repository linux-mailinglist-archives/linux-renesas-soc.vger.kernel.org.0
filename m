Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64138347539
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Mar 2021 11:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233215AbhCXKAd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Mar 2021 06:00:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:36254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230105AbhCXKAL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Mar 2021 06:00:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F30F9619E8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 10:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616580009;
        bh=DlKFRAri5DF6Sv8AaeXloRBl+tHPkQOPEe59gzw+ZhU=;
        h=Subject:From:Date:To:From;
        b=o1mNzcRdg5rsSqxY2RS4pANy9ba6Hs8QhutCxk1zAsDk1gLf1blosEWiBdtPFvR0z
         dNYdwdZpv0+XXakJcVak4XgCiq77RCVoePRBfjSEoiNiKeAUABU9nc7NI6VQ8XeO4k
         VbTO7Cay/aHfOc/094uyE7xmR81Q8ud0qM27cKd0SNdMbf5AllV34eQC0v4+3BOZuT
         LFoEmQ3w8vRoEYAy9OatHXRcyndQiNn5zHx7JSxnmHmFAFuNBMXh/Xu0XM3za1kz31
         lmOdmlPRCXlRXmiIlJygY9l4U7pSj4VhYlpTyrFcr4EcQjRvnkz87xUKLgcEmzASv0
         2N8xb8JwVyt7g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EDE746096E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 10:00:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <161658000896.29452.1041095054418016356.git-patchwork-summary@kernel.org>
Date:   Wed, 24 Mar 2021 10:00:08 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: arm64: dts: renesas: r8a77961: Add VIN and CSI-2 device nodes
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=447027
  Lore link: https://lore.kernel.org/r/20210312131020.1747344-1-niklas.soderlund+renesas@ragnatech.se
Patch: ARM: dts: koelsch: Configure pull-up for SOFT_SW GPIO keys
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=441591
  Lore link: https://lore.kernel.org/r/20210303132941.3938516-1-geert+renesas@glider.be

Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


