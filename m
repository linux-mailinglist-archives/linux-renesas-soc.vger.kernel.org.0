Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3FDF7BC2F0
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Oct 2023 01:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233861AbjJFXaa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Oct 2023 19:30:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233860AbjJFXa3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Oct 2023 19:30:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B63093
        for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Oct 2023 16:30:29 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A4ABC433C8;
        Fri,  6 Oct 2023 23:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696635028;
        bh=dg72NsvyLzWcreB5+s/HJ6z49P7BaEYwjVWsow40gYM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bGE7Xia6NG7mxkYRSxYmlRwAuZR2ZTU+iwhrpNuLvV8Y8saS7asDJ3MY1iNmxPdy1
         IEdIogGGmUvIYcMeW0IrYEnDj55bC/YHoHE54o6z6JsPAL8rbFrDqtcfPmd/Vy3Tho
         PDqTflR86HEWTozgwtiba/e5h6Q6fMDU+hR3nGhTXGVg9ZSO8q/pHaNHalsjb7cBZy
         ey5ZV13Pnboz1GdC+PsCWs4V5npoy5HSDRiwz7sAtPPAqMabpb+gRQOiuYqV8OouAl
         FRXzkmrwWewOUhpnlA+5GJqZAfRcEagXxrRuBW9bhQ5+keyUqRm4gGUYzYTPAsbm1I
         qDMBpzWarlvDw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8416CC595CB;
        Fri,  6 Oct 2023 23:30:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/2] ravb: Fix use-after-free issues
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169663502753.14259.5824699296193501364.git-patchwork-notify@kernel.org>
Date:   Fri, 06 Oct 2023 23:30:27 +0000
References: <20231005011201.14368-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20231005011201.14368-1-yoshihiro.shimoda.uh@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  5 Oct 2023 10:11:59 +0900 you wrote:
> This patch series fixes use-after-free issues in ravb_remove().
> The original patch is made by Zheng Wang [1]. And, I made the patch
> 1/2 which I found other issue in the ravb_remove().
> 
> [1]
> https://lore.kernel.org/netdev/20230725030026.1664873-1-zyytlz.wz@163.com/
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] ravb: Fix up dma_free_coherent() call in ravb_remove()
    https://git.kernel.org/netdev/net/c/e6864af61493
  - [net,v2,2/2] ravb: Fix use-after-free issue in ravb_tx_timeout_work()
    https://git.kernel.org/netdev/net/c/397144287071

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


