Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B758E41138C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Sep 2021 13:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236888AbhITLbx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Sep 2021 07:31:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:49792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231279AbhITLbw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 07:31:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 23D35606A5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Sep 2021 11:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632137426;
        bh=d8BQ62u/lZYeNAQn3+LE3raTFDYtvHH6TpISyP6NGQI=;
        h=Subject:From:Date:To:From;
        b=s5peMWlGGLTE82uP3MdylUGPefHZLdLqm6CBl6LahMmZfP5rlNKry6+C58f4Cg/Lh
         cnlCgaALgwk6BFrHVtUg0zJIDwraKnAI3IzpaXtew5n3HiUCgXn1TOb9nv047BPXeU
         m1RBj1RgAUUHTSstfJTMKw0CAGtxKe4+f6u/jKGKqKUqWuRNc55YudhSrtby0tI22U
         LsEMnECmwQ64KSXt6KdfoGAC9vXi0JOsZCGvji/qqHTJMaoc5ghcsR9XiHch44kpH9
         Fs2pReJ+ZBGX3ZiJWKYwnuE5OzahLaqMJrF6FrxCi8n/3nMGKjoKqfs5oLtLnTUvi1
         WjZdnSClh79qg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1A71C60A3A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Sep 2021 11:30:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <163213742605.10769.15519326904044287473.git-patchwork-summary@kernel.org>
Date:   Mon, 20 Sep 2021 11:30:26 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: ARM: dts: rza2mevb: Add I2C EEPROM support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=515471
  Lore link: https://lore.kernel.org/r/786f0354fb30b183d5bccb2f12b13e6535b9ace1.1626267234.git.geert+renesas@glider.be

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


