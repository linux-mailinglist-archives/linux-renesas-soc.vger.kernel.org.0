Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD46333A0A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Mar 2021 11:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbhCJKa1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Mar 2021 05:30:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:41348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232562AbhCJKaI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Mar 2021 05:30:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 5380164F76
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 10:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615372208;
        bh=2/v9lXQEpjtxTo2WR3ZZcycC46wYb7Y0qB6K9iaTLhI=;
        h=Subject:From:Date:To:From;
        b=YUfBq1+xjHLY0cK5K574mDxtGb/ltjOeKOpthHlrUzr+deG70A1aewb6Z32QyT0V6
         +4QHk9NFQv39S4OrvzjBRWCZFtG1xYhSg9IERZPNkRowOiffiBl/hamFDS2N/6xgbe
         F+dx123NNB/yU2e+b0RM9kfl4KX13HSlltKI1zOlZwUMuM5oEocn9oFXyCP79UgF3O
         Kqok65Nps4A/mXRKeFJVQfL1zlrR5dJb+Q2A3sPBwE8r3SFceQQ2tVBGbpO6BYeDun
         sbubAR+ROwi5dsasEZWI1w6aCGq+IT5CuXTgakDaHcOT99GZ/92KnCwHdrPPxhgUOx
         I4pFESIB0AGWA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 383F16096F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 10:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <161537220816.2642.4527915078705924835.git-patchwork-summary@kernel.org>
Date:   Wed, 10 Mar 2021 10:30:08 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Series: arm64: dts: renesas: falcon: Add I2C EEPROMs and sub-boards
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=442119
  Lore link: https://lore.kernel.org/r/20210304153257.4059277-1-geert+renesas@glider.be
    Patches: [v2,1/3] arm64: dts: renesas: falcon: Add I2C EEPROM nodes
             [v2,2/3] arm64: dts: renesas: falcon: Add CSI/DSI sub-board
             [v2,3/3] arm64: dts: renesas: falcon: Add Ethernet sub-board
Patch: [v2] ARM: dts: rza2mevb: Upstream Linux requires SDRAM
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=441919
  Lore link: https://lore.kernel.org/r/20210304094945.4003097-1-geert+renesas@glider.be
Patch: arm64: dts: renesas: Consolidate Salvator-X(S) HDMI0 handling
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=441593
  Lore link: https://lore.kernel.org/r/20210303140529.3941670-1-geert+renesas@glider.be

Total patches: 5

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


