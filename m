Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 328EF3387E6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Mar 2021 09:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232556AbhCLIua (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Mar 2021 03:50:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:40470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232530AbhCLIuJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 03:50:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C9AB564FD0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Mar 2021 08:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615539008;
        bh=eATr7BXut6iO0D1tu143pMI/hvKTTobka2usCc/k380=;
        h=Subject:From:Date:To:From;
        b=uocRnPMxT3bv/eAqe/wFPGhySlgFVCjl9LJO3DdqtV9tE/TErkEjdotizznzkJHAz
         Ks2xcTChb0bot/YahgMDy65usKBqabPrCcZhRQBe5UOSiI+2OJZHyx0WntH7nl8sYh
         9rD9MtZ3V2DaTVGGKQQ+3l9NX2uHPLuG6S1eBJmxpSUdueOBfSheEGQBZHOZhw5VJS
         3sSO74JVYSGfh5Sj38IAgFG03aPJH8Rfym0ZdsG9j9uzCch/yrMzxK1Za1LCcAeVnw
         b47rU4csi9U5B10UmNw4NEi0wd8nhi159eCNJs0oWSGKy6TNz+4WtT2jzPXmKJEhR8
         euYHMmVchksyA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BC286609D0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Mar 2021 08:50:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <161553900870.24317.13243556628696047584.git-patchwork-summary@kernel.org>
Date:   Fri, 12 Mar 2021 08:50:08 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: [LOCAL] arm64: renesas: defconfig: Refresh for v5.11-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=445273
  Lore link: https://lore.kernel.org/r/20210310103606.2530334-1-geert+renesas@glider.be
Patch: ARM: shmobile: defconfig: Refresh for v5.12-rc2
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=445265
  Lore link: https://lore.kernel.org/r/20210310103213.2529983-1-geert+renesas@glider.be

Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


