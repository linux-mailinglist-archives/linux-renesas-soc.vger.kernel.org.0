Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42FD3312D59
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Feb 2021 10:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhBHJet (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Feb 2021 04:34:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:49822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231490AbhBHJbI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Feb 2021 04:31:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 5884364E66
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Feb 2021 09:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612776628;
        bh=FJWUs1R2AMERxlvrMd2p2XCFFNLyvZ99liwnjDyWSx0=;
        h=Subject:From:Date:To:From;
        b=vNe4TChlmKtF3UIjz6SKAu7W1zisW4NJhrghqHxmLiBq9crGUqtX11yrs16jIFsdo
         gZRMcx+Lk0eJvrrmksW9KDVYaSf0BH3NNToILgv6rm3ADNVAVJtrIrsTKuHvrZJSbH
         O+3FjO/G/+CYV9a/QxD+8x2psElJR8aEbFWvwDq4kRUIxLFfo4AJAsuB40ehIwpbYg
         zCGLN4nS1SElgEA4OeSfb36wjyiqyQc1OCF2BQpOyhhqYsnjJMPEizy/rvVyxbYYlh
         bs+FkgQZDfWyKNFReGREiNF8PO4eSySpzwoENR2ofSuWr7OwjXA7Dkc+LgR52lfgkT
         EDgpK111D9vwg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3CFE460975
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Feb 2021 09:30:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <161277662818.22193.13933506979015548039.git-patchwork-summary@kernel.org>
Date:   Mon, 08 Feb 2021 09:30:28 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: gpio: gpiolib: remove shadowed variable
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=409237
  Lore link: https://lore.kernel.org/r/20210105105914.13172-1-wsa+renesas@sang-engineering.com
Patch: ntp: Use freezable workqueue for RTC synchronization
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=421151
  Lore link: https://lore.kernel.org/r/20210125143039.1051912-1-geert+renesas@glider.be

Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


