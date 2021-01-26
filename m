Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2893330397C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jan 2021 10:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390408AbhAZJu4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jan 2021 04:50:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:43270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390739AbhAZJut (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jan 2021 04:50:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 46E95206B5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Jan 2021 09:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611654609;
        bh=1Zo7F0Vw2crvZGxVZLh0P4PULQnFshcQ7s6yE3alvy8=;
        h=Subject:From:Date:To:From;
        b=vH4u5rOdwcaC4/Z50FftBjS1amOSjVBf+Alxu6LqmoHDqQzLWkwEr55WkfAo1IHoQ
         Vc7/dGN6ot6PmzKDsnK0chFFGK1Vdyb8GneZJkcYsN24YJg/lg909BV8NcZS+AMnKj
         Tuy/NcSXvvV2OjmxnOtd7fkWzaIFQKL5QUepLII+z1z/PQsxgFe4lT8X11Ddmd6Mke
         I9IRFvKGI93XxCsV4Kk2FRu5b9dZwpbhXyEwOLr7BYA029pGAVHFqJt55Va+oN5Dz2
         cj0+kqOn+aCdl+hGeiNGs1aTYiduiayLH0k55JOsn0OpXysUHoCa9YZHcboS7YLa3b
         E+SvpJ/8RaN4w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2F6B761E3F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Jan 2021 09:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <161165460911.31320.5491165237712609313.git-patchwork-summary@kernel.org>
Date:   Tue, 26 Jan 2021 09:50:09 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: [v2] soc: renesas: rcar-sysc: Use readl_poll_timeout_atomic()
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=421567
  Lore link: https://lore.kernel.org/r/20210125142606.1050130-1-geert+renesas@glider.be

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


