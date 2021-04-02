Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8B33526FE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Apr 2021 09:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233521AbhDBHkL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Apr 2021 03:40:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:60220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229684AbhDBHkJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Apr 2021 03:40:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3E6D7610FC
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Apr 2021 07:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617349208;
        bh=xJVYu61FmKPDngb4V5yqaPal562QwXyupgZylFSiwFU=;
        h=Subject:From:Date:To:From;
        b=klCp+im0CV0vNrkhT1Vsc9A4ea8bWP7R9emspZUw1CssRq2J9tgkAg9oDWAC8ZqBZ
         XfF+s1Au9pq2IKxyhp3lqpi4xT2BXHwpV5zrn1TX3SILoMBGO3JwmMiOs/ehtagiYi
         AVbC3oVGuer7P3u3tmwfUjllxQ/u/GAqXASHsG6Tz6WiN0a+lbdxSWgJn5RXSkqHnw
         kFGUs3NPq55S1KzuMfXWmSJJvYiHJ1dIkDfmv78V14c3Gk4CD2H8GQ5tdPctL4sKSt
         UszI04Gsgh774GO8YIplidAvOhg+azAWUZbMOz/txFG4NiC1T23j2cmbUb18POmlHl
         cpAXdePmOlB6Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 25CB2609CC
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Apr 2021 07:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <161734920809.8163.1354723953038982341.git-patchwork-summary@kernel.org>
Date:   Fri, 02 Apr 2021 07:40:08 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Series: arm64: dts: renesas: Add cpu-supply properties for DVFS
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=456103
  Lore link: https://lore.kernel.org/r/20210326105009.1574424-1-geert+renesas@glider.be
    Patches: [1/2] arm64: dts: renesas: salvator-common: Add cpu-supply property to a57_0 node
             [2/2] arm64: dts: renesas: ulcb: Add cpu-supply property to a57_0 node
Patch: arm64: dts: renesas: r8a77950: Drop operating points above 1.5 GHz
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=446169
  Lore link: https://lore.kernel.org/r/20210311110552.3124180-1-geert+renesas@glider.be

Total patches: 3

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


