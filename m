Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB234BF971
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Feb 2022 14:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbiBVNax (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Feb 2022 08:30:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232586AbiBVNaq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Feb 2022 08:30:46 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A97A15F373
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Feb 2022 05:30:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A60C2B819C7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Feb 2022 13:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65A8FC340E8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Feb 2022 13:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645536611;
        bh=Z2z0q344TMGE+kuKmzsT62jGIek2mwaEtY1sdqa8iNE=;
        h=Subject:From:Date:To:From;
        b=iI8M8FIFKHvLZs6wcN476+d6Wn6a6TeRzFiUfjcxYVOZypfWvlvpcLAGgJNlDvX/U
         8SBn7QoU2oHdCl6blw7rH62Dwu0AnjP7tEHsdpElMqfUWcOWvZJqJlW9G5YMC/TrbF
         cBpQsz6YWCD6sjZ9r6wFMpzQ2/xzZH1LwnCs/xbPYroT5hdd9CrSwzlrF1ym/MAXAi
         ks8gl7pd/3eiAqmf1ji7nJeE1Ynuhvl7SZ8MVAcY8rREI/UvoFXSdov79AJfT6kJwS
         XpitkPDWfO37DiDSAIJmZeIFS+wDuBmIY2lHatrvHn415mwwwK1rNYrqZlS01JJy09
         0hRyv+w/2hB3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 45AA9E5D07E
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Feb 2022 13:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <164553661117.2496.3523378500709791285.git-patchwork-summary@kernel.org>
Date:   Tue, 22 Feb 2022 13:30:11 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: soc: renesas: Kconfig: Explicitly select PM and PM_GENERIC_DOMAINS configs
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=616468
  Lore link: https://lore.kernel.org/r/20220221222450.5393-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Series: arm64: renesas: Add R-Car S4-8 watchdog support on Spider
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=606327
  Lore link: https://lore.kernel.org/r/cover.1642525158.git.geert+renesas@glider.be
    Patches: [1/5] clk: renesas: r8a779f0: Add WDT clock
             [4/5] arm64: dts: renesas: r8a779f0: Add RWDT node
             [5/5] arm64: dts: renesas: spider-cpu: Enable watchdog timer


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


