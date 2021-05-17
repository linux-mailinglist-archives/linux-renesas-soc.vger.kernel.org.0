Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADCAC38272D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 May 2021 10:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235717AbhEQIjV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 04:39:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:59924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235423AbhEQIjU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 04:39:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DB26E61108
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 May 2021 08:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621240684;
        bh=mmV0oZaFPPcsPoSwk1hFaz3TneKi/UwjeOpuIrHVbGg=;
        h=Subject:From:Date:To:From;
        b=Lsu7n8iPbSfvNeP06CspsSSJB7Jcz+JTsfa32ys4n6VTUDCreUMQOjR0RI3RK8M3S
         TlClZqRf2h383y6L3LlzlqA0kL1buBol5FuNqiGPdLK12DF/ZnYhB0+g5pAZQK+tFG
         GplBbE9xKuj+rrgqranMwOwgZ7qq4MhchPkyblefUcOdpCyXWYkMnGVZxPke9l8ouB
         s8L5Wp3JeDrbL+FVHeg8MmBqqvCFJ9ofjwZcT40wgfwdM+MuiCjcC/xcczxoKN6FTm
         992W3TG2UqpGhcWVbxxX2v8y9Lar1o+J/uA9UJKpXwzFmkeugdyn5ge+fL9JpTZjj1
         wyCQ06ZA+0SGQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C9E2160A17
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 May 2021 08:38:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <162124068476.25114.10743117348157757981.git-patchwork-summary@kernel.org>
Date:   Mon, 17 May 2021 08:38:04 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: ARM: shmobile: defconfig: Refresh for v5.13-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=480967
  Lore link: https://lore.kernel.org/r/debe6340e9deb2f13f908238f27b62ed7b6005a0.1620806548.git.geert+renesas@glider.be
Patch: [LOCAL] arm64: renesas: defconfig: Refresh for v5.13-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=480965
  Lore link: https://lore.kernel.org/r/051446a44d1a5b89c549ae798db31f91f565397d.1620806299.git.geert+renesas@glider.be

Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


