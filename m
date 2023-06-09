Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E33472961E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jun 2023 11:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241909AbjFIJ6u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Jun 2023 05:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241913AbjFIJ54 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Jun 2023 05:57:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B99F63A9B
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jun 2023 02:50:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3274965647
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jun 2023 09:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FF65C4339E;
        Fri,  9 Jun 2023 09:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686304221;
        bh=B4ehf1qx10BkGmaVu5ZrrQtzlbv/nf43IPDZstS9ck0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=e6j7UGYjfedho/hu4QQ2c8ISalWGjz0fFZLtl1mUgZxQW/fwwPI/B+HOJLOhrkLEj
         PI4KdrTSXG3R3/MMuiek8OFf59FtifawVs5LonhiMp8HpIanMvKxZ0jUnH+9i/cjnS
         h0t0UQieAReq+ZcM9RPzAzYHhak0rk01QIeCFStRq+IDyw0K6SURTf9gMqPhLaUmS0
         mao2CxMt790DbE0vMmFaDT+lvlXCTAtwXH5toim8DfxAYqwL8CxjVX52zt/InnPJ7g
         njLl7N38cpl4k8G85wLD7xOaw4jMzeFuDYSp29lWhHET/gUHbVvhuJVmMFR0SZ/3Ik
         jsnhG3F6bZY2Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 61A2AE29F36;
        Fri,  9 Jun 2023 09:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] net: renesas: rswitch: Fix timestamp feature after all
 descriptors are used
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168630422139.21394.17316227658031207308.git-patchwork-notify@kernel.org>
Date:   Fri, 09 Jun 2023 09:50:21 +0000
References: <20230608015727.1862917-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230608015727.1862917-1-yoshihiro.shimoda.uh@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, lanhao@huawei.com,
        simon.horman@corigine.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, phong.hoang.wz@renesas.com
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

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu,  8 Jun 2023 10:57:27 +0900 you wrote:
> The timestamp descriptors were intended to act cyclically. Descriptors
> from index 0 through gq->ring_size - 1 contain actual information, and
> the last index (gq->ring_size) should have LINKFIX to indicate
> the first index 0 descriptor. However, the LINKFIX value is missing,
> causing the timestamp feature to stop after all descriptors are used.
> To resolve this issue, set the LINKFIX to the timestamp descritors.
> 
> [...]

Here is the summary with links:
  - [net,v3] net: renesas: rswitch: Fix timestamp feature after all descriptors are used
    https://git.kernel.org/netdev/net/c/0ad4982c520e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


