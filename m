Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCBA456DFF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 12:10:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbhKSLNR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Nov 2021 06:13:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:44140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229521AbhKSLNQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 06:13:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 43C2960F9B
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Nov 2021 11:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637320213;
        bh=EpVApqZ6IcIIpAxPyA0lIaFKo7Zi4382BA+HU51giw4=;
        h=Subject:From:Date:To:From;
        b=UtODVWiAIVVWwsvLA9pM3w+Bk9RAJawxkpaTnSyA5riYzgAmxpKxa6BPY7OxStxdf
         xH+YLCVRNWgOkGkurhun02L29BDgCip/tXl45jKNxFQ9YUptFwVDopJJgL24qRq7Qr
         zxmEj3CvtMavQxA+pzyIJUIvm+XE+5IMMDl8sGJWPBRZQZhjt+rrf2BtYs2OP5h07o
         oq3VDX30WEbWWpxFC5D3sDnwDCd80ahBOvVVK0b77IQiy1sCBUfg0w/Dye5n/LAIDf
         Ipm0pbT1A9Xbq+qwGvQZ18RIYKK3dNtLUzlzxLBbCA4ebbhAmnI3WyTNKwozec7kCN
         8bHmctrksLbSg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 33B4760977
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Nov 2021 11:10:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <163732021314.23424.1950592706599924406.git-patchwork-summary@kernel.org>
Date:   Fri, 19 Nov 2021 11:10:13 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: cat875: Add rx/tx delays
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=580167
  Lore link: https://lore.kernel.org/r/20211115142830.12651-1-biju.das.jz@bp.renesas.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


