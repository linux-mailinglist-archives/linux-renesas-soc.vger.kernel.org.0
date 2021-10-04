Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5BB420737
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Oct 2021 10:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbhJDIWH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Oct 2021 04:22:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:39650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231282AbhJDIWE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 04:22:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6C34C61248
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Oct 2021 08:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633335616;
        bh=e/eH1/3Bb3OA6LYaGWM3C3QLKVYKOvIutiCFCb4ThY8=;
        h=Subject:From:Date:To:From;
        b=M6EL4krhQJ04ej6r/5z12J/eLZr3dL7+Q07TMkH/5C9WftftZ49xtfQXTAKUIbxYW
         p96BM23A0bQj0mAXC4Yn8Sxb8nAKNwRQ3Uv8WRstIS3l2P/n6rr3Jkin5g8HkBDEjB
         93SE2oVUB24zsl5iY5zk5siI1vRV40LgrMMlOydlZUui3TE39lciu82TMFUbrq7TxC
         I3EG3N7XlbvaYlCxaK5axEltUt0U9drZREsHuealDsAiAyjtTDkxaG341YMH6Bj2Q8
         MEa9k7rVVBgB/q3l/jJWlR0kFz4yXRVkSQ5Ru7KACTjrgF/qM1PC5LTPUHP4Bjjxlt
         5c0d4zVd79QMQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5A08060A17
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Oct 2021 08:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <163333561631.2979.13231264544685994367.git-patchwork-summary@kernel.org>
Date:   Mon, 04 Oct 2021 08:20:16 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: mmc: renesas_sdhi: fix regression with hard reset on old SDHIs
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=537607
  Lore link: https://lore.kernel.org/r/20210826082107.47299-1-wsa+renesas@sang-engineering.com

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


