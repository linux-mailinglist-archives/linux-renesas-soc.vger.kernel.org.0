Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB2C634CCE8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Mar 2021 11:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231490AbhC2JUo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Mar 2021 05:20:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:53922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231297AbhC2JUX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Mar 2021 05:20:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8CFDB61933
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Mar 2021 09:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617009622;
        bh=EZO7MLIREcau7g49TJ2KHc6Xnqe27F/K3vuqlXHzFAs=;
        h=Subject:From:Date:To:From;
        b=t4GBYAIoelxR+xxXcxaoEueW5JSgpex5Iu7p9UE9L0ZIkV8vBAWVBrqllx8mUXw6q
         e3fMRAWRrQ7LFBoJ9dwJeiQikvfrlwGyO6TEv5A9xUCMVFlZ7KSgv13kg4vS5FnFmr
         VijyVp7260tG34DLdl/hIjIGCYKA2g+bcOqzpRHkcmpp5vV5IkItpRt6zSvClXW0cW
         AeshYioWslsWDD89rhTDMkhJCHmzzv4Abwcud0UJ6ZJHMWalOI3ltVxoeyDR53XVvt
         hvMTR9D3A2k9cw/4JO4zhPCRsZWKEIgD2hf21syzOfN+gSOM86DW2l/d4JQ59KkAWU
         jbwNbQDRy9QBg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7ABBF609D4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Mar 2021 09:20:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <161700962244.14698.2571953977294579325.git-patchwork-summary@kernel.org>
Date:   Mon, 29 Mar 2021 09:20:22 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: arm64: dts: renesas: r8a779a0: Fix pmu node
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=455109
  Lore link: https://lore.kernel.org/r/20210325041949.925777-1-yoshihiro.shimoda.uh@renesas.com
Patch: drm: rcar-du: Use drmm_encoder_alloc() to manage encoder
  Submitter: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=414039
  Lore link: https://lore.kernel.org/r/20210113170253.443820-1-kieran.bingham+renesas@ideasonboard.com
Series: arm64: dts: renesas: r8a779a0: Add VSP support
  Submitter: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=453141
  Lore link: https://lore.kernel.org/r/20210322172919.1154686-1-kieran.bingham+renesas@ideasonboard.com
    Patches: [v2,1/2] arm64: dts: renesas: r8a779a0: Add FCPVD support
             [v2,2/2] arm64: dts: renesas: r8a779a0: Add VSPD support

Total patches: 4

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


