Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB94C6ABF12
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Mar 2023 13:06:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbjCFMGj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Mar 2023 07:06:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbjCFMGh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 07:06:37 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A6129159
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2023 04:06:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BA19960E83
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2023 12:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2601AC433EF
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2023 12:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678104395;
        bh=mV1EsxZ5eCQFKDlAV98c5PDdf5boQ6ltdJFWubI3qmU=;
        h=Subject:From:Date:To:From;
        b=tEP3MWsXvuJOs5NIiAEJtjF/kCOdVrNaTfYgfBLMAeKFuCE6a5ZnS9OpcQywRuG8H
         leMh0j406KwREvHkJApwxvH5o9THrG8NBp+1FdpiBwhZs43m+XuggssI4XVj8+TpOW
         H82eV11fs1rh7gBMd2rp6njiNa88CeFfW9rtN1fvxbEqzrT6LBOYGZrW59oXWPg5Ps
         RsYUIjb2/GlNqf8VzyTw5MRBXH7eHaxDwZKcu6NEvSH+BjFmF6AbVOonM6q0+XOta+
         mdDY6Zaqnh4kjPGd9Q+ot4FxRMD3s5iL0eKtTmLaXKGAiipOHUU2JgX/tFZ84+DoE/
         if9+yHxeMhZ3A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0D7E5E55B14
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2023 12:06:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <167810439497.18423.6066833953483272798.git-patchwork-summary@kernel.org>
Date:   Mon, 06 Mar 2023 12:06:34 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel.git (next):

Series: Renesas SoC updates for v6.3
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=712031
  Lore link: https://lore.kernel.org/r/cover.1673702287.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.3
             [GIT,PULL,2/3] Renesas driver updates for v6.3
             [GIT,PULL,3/3] Renesas DT updates for v6.3


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


