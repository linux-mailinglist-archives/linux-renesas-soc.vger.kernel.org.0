Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D09B6C0CCE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Mar 2023 10:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbjCTJKt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Mar 2023 05:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbjCTJKs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2023 05:10:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE2C812F15
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2023 02:10:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 796AA612A1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2023 09:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9BDDC433EF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2023 09:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679303445;
        bh=TsLkRQ36pHbCUfAXAHPS1BrSSMFhu/l1IWA4vYlgqNQ=;
        h=Subject:From:Date:To:From;
        b=Y3cFOD9MHRcAAvf+TeL+PQ7nljLCHHOq2/X/rYKT/RKHhLCe4h/eng79lLBeuNXq+
         DsISEhcY2EeTk/wPi5UrdkN/eAtR9+4c+Fmh0RywiljbL9AHOqptECeaIsM3ksoFQ5
         SpYEwz4Qqn4SdHaK2IWBef8VQFBA2gzJy7rl67B9y9M253CJj9L5FuaN23LW58TwS8
         X7aarvuTVXHEPm62DN0qX3zzxgosgNm/DSdJbyNq0WT6C+EHZxwIkITihtAGCFWXKR
         y2Pbh1ultxZeiwqekE8i717fxwxhfHSFOF34rlrp7rmm67U/VPAWjeS1v0PSzjUUZt
         svFLefcKijZjw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C0FBFE4F0D8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2023 09:10:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <167930344571.11643.3387693883768872244.git-patchwork-summary@kernel.org>
Date:   Mon, 20 Mar 2023 09:10:45 +0000
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

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: net: renesas: rswitch: Fix rx and timestamp
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: David S. Miller <davem@davemloft.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=730198
  Lore link: https://lore.kernel.org/r/20230315070424.1088877-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [net,1/2] net: renesas: rswitch: Fix the output value of quote from rswitch_rx()
             [net,2/2] net: renesas: rswitch: Fix GWTSDIE register handling

Series: net: set 'mac_managed_pm' at probe time
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=729927
  Lore link: https://lore.kernel.org/r/20230314131443.46342-1-wsa+renesas@sang-engineering.com
    Patches: [net,1/4] ravb: avoid PHY being resumed when interface is not up
             [net,2/4] sh_eth: avoid PHY being resumed when interface is not up

Series: net: renesas: set 'mac_managed_pm' at probe time
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=730211
  Lore link: https://lore.kernel.org/r/20230315074115.3008-1-wsa+renesas@sang-engineering.com
    Patches: [net,v2,1/2] ravb: avoid PHY being resumed when interface is not up
             [net,v2,2/2] sh_eth: avoid PHY being resumed when interface is not up


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


