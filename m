Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5705C72AE31
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Jun 2023 20:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbjFJSxs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 10 Jun 2023 14:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbjFJSxs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 10 Jun 2023 14:53:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799D0173A
        for <linux-renesas-soc@vger.kernel.org>; Sat, 10 Jun 2023 11:53:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0DF6F60B4C
        for <linux-renesas-soc@vger.kernel.org>; Sat, 10 Jun 2023 18:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A225C4339B;
        Sat, 10 Jun 2023 18:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686423226;
        bh=0kXLR6N19QJarrOM9L2An/IXYJpG+uaknAMpiddQX0k=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=u3rEUtAW9Oz5d3L9s7DJzvMxazzAZJ0gKbBElMO1pnkjOHQ4b0+Rfl3VA5TMEy4sG
         CuFrSjZHWj8M5Alpp+J4akWEnNizgH5tGiUp7XoeYc5fT2dsf/fAuh1TCKfngNL5I9
         N2cve5CpVQYBdAg/dCBJYO1Ijxx5KxDX/27qsejRs3cf5KYspq5beqToKQvwOlymqg
         rfaAFTdhaBYWZo9CAtUaSAUSDkT9xoXU6zRSFjljDva6Z2Eh9S+Ih0MvqcTUlppHm8
         zFhYGbQ2pW9jhw9xktygzgKoklE1jQVtP1IIIWP6ug7jIEUwhN3VmwmtdSLUG2ao/7
         Fp7R7GoiyKJhQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 373C8E87232;
        Sat, 10 Jun 2023 18:53:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/2] net: renesas: rswitch: Improve perfromance of
 TX/RX
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168642322622.21298.7526575301146103242.git-patchwork-notify@kernel.org>
Date:   Sat, 10 Jun 2023 18:53:46 +0000
References: <20230608022007.1866372-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230608022007.1866372-1-yoshihiro.shimoda.uh@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, maciej.fijalkowski@intel.com,
        simon.horman@corigine.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu,  8 Jun 2023 11:20:05 +0900 you wrote:
> This patch series is based on net-next.git / main branch [1]. This patch
> series can improve perfromance of TX in a specific condition. The previous code
> used "global rate limiter" feature so that this is possible to cause
> performance down if we use multiple ports at the same time. To resolve this
> issue, use "hardware pause" features of GWCA and COMA. Note that this is not
> related to the ethernet PAUSE frames.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/2] net: renesas: rswitch: Use napi_gro_receive() in RX
    https://git.kernel.org/netdev/net-next/c/dc510c6d2ecf
  - [net-next,v4,2/2] net: renesas: rswitch: Use hardware pause features
    https://git.kernel.org/netdev/net-next/c/c87bd91e34e1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


