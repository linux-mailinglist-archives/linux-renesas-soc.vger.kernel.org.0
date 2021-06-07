Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD00A39D936
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jun 2021 12:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbhFGKCT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 06:02:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:56636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230194AbhFGKCT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 06:02:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 66AE66023B
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jun 2021 10:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623060028;
        bh=q+n/IrKBJnwW4rCZ7tF4b/hhIsL151gmWutmBcQqF9I=;
        h=Subject:From:Date:To:From;
        b=qKOmS5LS30eUUBCoXwBQua1j+Y95cWLqOuFuRC5AAHb03SKjYyhFeo10TAXHNvEqM
         WT1TOkek1u9zHTy7d68tiOnAJafgMUnGH/1NkMr9y15WNlpWkcuROIJF4Ml0v+ku3r
         g7nLIzTwHeTACh3OUtyUSRzW3oNwmoHlfexPhwh+egHoBicRKDOUbnqq2aTRxWlle9
         eLvMVe544teWLnsziSCv4Ri5edp7GNEG3IayZ6pp/QB0GOx4xHwrNkiyHkSGCjHsEW
         RioOxXwKX1b3wzYyIbxejwD8dDKWPHGKaqG76iUvR/KFf1pCuZVjXn9Jct0n9gSnSu
         H9EpTO7oOmMxg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5538C60283
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jun 2021 10:00:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <162306002829.5711.17526839469513237010.git-patchwork-summary@kernel.org>
Date:   Mon, 07 Jun 2021 10:00:28 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: arm64: dts: renesas: r8a77961: Add INTC-EX device node
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=491719
  Lore link: https://lore.kernel.org/r/6f3cc1a1b6d777e743a7a9e66a80aaf9d5232a4f.1622547125.git.geert+renesas@glider.be
Patch: arm64: dts: renesas: r8a779a0: Drop power-domains property from GIC node
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=491911
  Lore link: https://lore.kernel.org/r/a9ae5cbc7c586bf2c6b18ddc665ad7051bd1d206.1622560236.git.geert+renesas@glider.be

Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


