Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFB183C6C1C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jul 2021 10:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234512AbhGMInK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 04:43:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:46794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234396AbhGMInK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 04:43:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id AA2BA60232
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 08:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626165620;
        bh=Zfo0CcZTW6keSdlsqyNkS5G8bhOsN12L9MGaMvs0iXw=;
        h=Subject:From:Date:To:From;
        b=e6Qaoacip0FbiJEW+xVpbb2NRd81kQYmLFGsLZd+JMRZkNh/p8+hfglqb8nKXWFaZ
         M8p4pmx28DRFTRCrLfUVoTPp8aB4cw7rui8VfT4/2EKKmaLw7aP2Kil1tcT7dxxFeX
         E4ucsVj08xp28KrGoqGXh8F2prpvAJ08Y6rLrdiyWRJpLcx5OTYXuHDG7gQ9jMuRBs
         gplexhpiOve1jbab9LMvukU1c2HYRejER8WQAf/mVRRQqS05N1xXHHjoEPU6vtAeqi
         d4yUId7mV3kd+2X0W8t+UQHe+a7iDRh5EP1b8wfsfCndppm/KZUnf4l9/ambo8DiaX
         3DqQdFmJ2wbYA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9A5C0609DA
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 08:40:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <162616562057.25239.13297883874591726205.git-patchwork-summary@kernel.org>
Date:   Tue, 13 Jul 2021 08:40:20 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: arm64: dts: renesas: rzg2: Rename i2c_dvfs to iic_pmic
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=503225
  Lore link: https://lore.kernel.org/r/3fee803a7464a3243e62a943a6a5dce8f1c65a2d.1624016811.git.geert+renesas@glider.be
Patch: arm64: dts: renesas: r8a77990: ebisu: Add I2C EEPROM for PMIC
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=510943
  Lore link: https://lore.kernel.org/r/32443cd203ce2787d9a719d06a473b9e9cd508c2.1625489160.git.geert+renesas@glider.be
Patch: ARM: shmobile: defconfig: Restore graphical consoles
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=513925
  Lore link: https://lore.kernel.org/r/2a4474be1d2c00c6ca97c2714844ea416a9ea9a9.1626084948.git.geert+renesas@glider.be
Patch: arm64: dts: renesas: r8a77995: draak: Remove bogus adv7511w properties
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=509567
  Lore link: https://lore.kernel.org/r/975b6686bc423421b147d367fe7fb9a0db99c5af.1625134398.git.geert+renesas@glider.be
Patch: [LOCAL] arm64: renesas: defconfig: Restore graphical consoles
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=513931
  Lore link: https://lore.kernel.org/r/4a671ef00b3469f8b7ffd42309c3dfb1ccb8eb8a.1626085156.git.geert+renesas@glider.be
Patch: arm64: dts: renesas: beacon: Enable micbias
  Submitter: Adam Ford <aford173@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=509297
  Lore link: https://lore.kernel.org/r/20210630175935.189454-1-aford173@gmail.com
Patch: arm64: dts: renesas: r8a779a0: Restore sort order
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=505853
  Lore link: https://lore.kernel.org/r/8d68a7ce449aaf90a88e69397dbe0e9c467d5726.1624460175.git.geert+renesas@glider.be

Total patches: 7

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


