Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1712179BC48
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 02:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238040AbjIKVRg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Sep 2023 17:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237749AbjIKNNw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 09:13:52 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0119E9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 06:13:48 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46BFCC433C7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 13:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694438028;
        bh=okFwk+T2nPdFWy3SPIDaf83sOvPWwEReMqLLVEx+PwU=;
        h=Subject:From:Date:To:From;
        b=Nvra6bQZkkyUtS4uSA0SBWkhtm27KZxn1e6htIVCLenj4AZO7nccKNpY4tWtVnsfX
         9Np5ePC67iqwdVJIUd5N4iws7tVZ0OJGRNCPkhd14LC9P4AT5VxQuLXHRa0721Mo3H
         8glSnFjhbP8Qi2mqXS0FhFifhTwcWt0mcH64/XKaTBZ/qMwkP9UMk9EjXtFHSnMszv
         WwIESLBCWJvwfA0Si8NY0joEZGZv6s9vgrJtVkouJlMQ/0cedWaJEys0RDPNdgyt1q
         /fd7S1OXSMDi/+ITy7SYV9IzFps3qPmY4n21K/Bkq5PEHp+4PmyFA6e9cPw9VSDm4Q
         +3I05aRVba7Dg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2979DC64459
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 13:13:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <169443802809.23253.15510034534153334813.git-patchwork-summary@kernel.org>
Date:   Mon, 11 Sep 2023 13:13:48 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel.git (next):

Patch: [GIT,PULL] clk: renesas: Updates for v6.6 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Stephen Boyd <sboyd@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=776909
  Lore link: https://lore.kernel.org/r/cover.1692262242.git.geert+renesas@glider.be

Series: Renesas SoC updates for v6.6
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=770548
  Lore link: https://lore.kernel.org/r/cover.1690545139.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.6
             [GIT,PULL,2/3] Renesas ARM SoC updates for v6.6
             [GIT,PULL,3/3] Renesas DTS updates for v6.6


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


