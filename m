Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8D07CA1A0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 10:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbjJPIaw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 04:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231844AbjJPIau (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 04:30:50 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 789E5A2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 01:30:49 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2476EC433CB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 08:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697445049;
        bh=ypVtU7bCAT+AgF5z/+yI4kQAMAFn501tDwHIOZ6qoZI=;
        h=Subject:From:Date:To:From;
        b=bsEwFz1V2yFAbHayCHca2Lbn76DjCksQVhwsvYV+W/uMuH0GXLzzxoes1oP+E5Vt7
         c8jv2tLau+rn9CoXbuAt954WHj/iimOD4hn6mxzE68irLv+QNOolWAqG93R7/JUm4c
         VmmF9VnTlox3UDGoqjvuyvjHwete/W7+oiS1TFROCrb+QgWBF/IIhUz/MhVqTh6bg/
         eTmaKvot9c130kgCZVaRVhv+YWj4s58UmbKQLcuonY5kVSgnGT4Zprls6UTustqksn
         DrwE81fFIvxrr9MbexLkMnkSho/DaFWf2JwcPBt+LS3hUCOhkdpYg2NVI5ixwHMnV6
         DYrkcXHfeg8HA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0D37AC43170
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 08:30:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <169744504900.19592.2363214125670261266.git-patchwork-summary@kernel.org>
Date:   Mon, 16 Oct 2023 08:30:49 +0000
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

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: ravb: Fix use-after-free issues
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=790141
  Lore link: https://lore.kernel.org/r/20231005011201.14368-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [net,v2,1/2] ravb: Fix up dma_free_coherent() call in ravb_remove()
             [net,v2,2/2] ravb: Fix use-after-free issue in ravb_tx_timeout_work()

Series: rswitch: Fix issues on specific conditions
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Paolo Abeni <pabeni@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=791777
  Lore link: https://lore.kernel.org/r/20231010124858.183891-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [net,1/2] rswitch: Fix renesas_eth_sw_remove() implementation
             [net,2/2] rswitch: Fix imbalance phy_power_off() calling


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


