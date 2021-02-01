Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750FC30A41C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Feb 2021 10:13:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbhBAJLv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Feb 2021 04:11:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:50500 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232812AbhBAJLX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Feb 2021 04:11:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 2451864E4F
        for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Feb 2021 09:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612170616;
        bh=TPhKPLxBkVJudBpaPwn9UxqVuSyPBI46btXLzg2BOcY=;
        h=Subject:From:Date:To:From;
        b=QvMkWZTI6YlJP3dmIVjweMjJ/pKr6mrkOyTzMQ6oj/pK4IC9NjswiQlfs1TJksJiI
         gHdD8/W8f90gsHJyE/09nqdc4Wj6Rlb5Yh3lu9hiPHKLc2x/BxEe5hVK/UyeKoVCS2
         7Its5K1r2NB0xQWH1Bd/dFSGekynDgrybk8N+3+nWabnvaP9pD7LwWJdRZ93mDdujP
         73qLqFPJ6o4gX0GP55uzphujVjNHTzTSK/Xw9SaPn6m4aOdOO4s6AaCxHMi+FLtVmT
         jm1qzsjEGr6rsS+x4Dbo26Ulyx2rXTh4RaLJfqoIEI72YfxAp/iMqMVbro2j0SSBO6
         f9zTlvenJJBrg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0E45560981
        for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Feb 2021 09:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <161217061600.11562.5510712174433188163.git-patchwork-summary@kernel.org>
Date:   Mon, 01 Feb 2021 09:10:16 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: [next] media: rcar-vin: fix return, use ret instead of zero
  Submitter: Colin King <colin.king@canonical.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=396497
  Lore link: https://lore.kernel.org/r/20201204173833.1146570-1-colin.king@canonical.com

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


