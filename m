Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1C505E9E2B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Sep 2022 11:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234496AbiIZJqo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Sep 2022 05:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234478AbiIZJqD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 05:46:03 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F3EBEAD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 02:45:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 4BA8ECE0FCD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 09:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A7BBC433D7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 09:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664185241;
        bh=3HU5kRhqESNTWQL/tz7LS++n5jXmPz+JQexZkVvvB9I=;
        h=Subject:From:Date:To:From;
        b=Lj+nEcdES95+7xYqiaoUXfznrynUJ2FJN/byI00x7F7lG/MOnaJTYY/3y7zhbXPIh
         QJZcd2rRXH7uKnB0kePmamJBk2SrhKHTamuchi90LmRB1t+Kf35pWmwHhAfapliWiC
         rGpbO34S5r9mU2F3FcU4zZx5QaOQGZFoTxze9HVakev/PVJScnB9KIfFhPI2H2KdzP
         m5Jk/43b+4BHLMlK3ydrH5u9Rh0N7/GcSvFC4RJEgOl9aL5eZTh0lnMsO3TUGk0CsZ
         p81xYIubv7CXwqSZYQdnAsMZUtBGbCNxe9dRC/SS+J+7Er1TvLwfY/zDPt5xFx1o5g
         YmS93XOCThXdA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6DEE6C04E59
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 09:40:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166418524137.22858.1042367156633658025.git-patchwork-summary@kernel.org>
Date:   Mon, 26 Sep 2022 09:40:41 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Enable AT24 I2C EEPROM support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=678640
  Lore link: https://lore.kernel.org/r/8f2cdcef492e661163ae66e1b9df77a4ae4e87a4.1663678724.git.geert+renesas@glider.be

Patch: net: sh_eth: Fix PHY state warning splat during system resume
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=678253
  Lore link: https://lore.kernel.org/r/c6e1331b9bef61225fa4c09db3ba3e2e7214ba2d.1663598886.git.geert+renesas@glider.be

Patch: Documentation: i2c: fix references to other documents
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Wolfram Sang <wsa@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=676510
  Lore link: https://lore.kernel.org/r/20220913100552.3080-1-wsa+renesas@sang-engineering.com

Patch: net: ravb: Fix PHY state warning splat during system resume
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=678252
  Lore link: https://lore.kernel.org/r/8ec796f47620980fdd0403e21bd8b7200b4fa1d4.1663598796.git.geert+renesas@glider.be


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


