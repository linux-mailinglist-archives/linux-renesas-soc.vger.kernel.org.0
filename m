Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C559E7B75EE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Oct 2023 02:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjJDAkd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Oct 2023 20:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjJDAkc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Oct 2023 20:40:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83614A9
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Oct 2023 17:40:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1198EC433C8;
        Wed,  4 Oct 2023 00:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696380025;
        bh=KetrmMAUGEXoH/6y1Ezjmso7zLcGbqOzBEqDa1SojPc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=OKyxnqp1my9u0QlzHSvo9iTdc0aI53pI8CsTyrYpulswazmsQuWb4pMUUD45x2ydT
         5eviY/hv90t8T83xoqTC62MeEof8PplMJoAHJyfz+sSNBqDeN3QwH5hvM52fpj/8Ab
         M344gYZb2uczvcE3LrquXKJz08tqsT9j7mowt6NbOethUEkfbAuMRjBll5KFp93CqB
         W+mAHdsjWP2q16Z7WKRyOUT2GquIMedRcp3rO3S8WfRRsZXA9IZ1bRqi+T+Xc+aZu3
         Pdx+ZA3efNuegwm88QsbE/1ea95uxrtoRg+NmECFxDj0itlk0FNxuwpjHzTpUx66DJ
         y9x5IfeHpvgNw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E3DB4C595D2;
        Wed,  4 Oct 2023 00:40:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] rswitch: Fix PHY station management clock setting
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169638002492.30838.643667282615565934.git-patchwork-notify@kernel.org>
Date:   Wed, 04 Oct 2023 00:40:24 +0000
References: <20230926123054.3976752-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230926123054.3976752-1-yoshihiro.shimoda.uh@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, tam.nguyen.xa@renesas.com,
        kuninori.morimoto.gx@renesas.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 26 Sep 2023 21:30:54 +0900 you wrote:
> Fix the MPIC.PSMCS value following the programming example in the
> section 6.4.2 Management Data Clock (MDC) Setting, Ethernet MAC IP,
> S4 Hardware User Manual Rev.1.00.
> 
> The value is calculated by
>     MPIC.PSMCS = clk[MHz] / (MDC frequency[MHz] * 2) - 1
> with the input clock frequency from clk_get_rate() and MDC frequency
> of 2.5MHz. Otherwise, this driver cannot communicate PHYs on the R-Car
> S4 Starter Kit board.
> 
> [...]

Here is the summary with links:
  - [net,v3] rswitch: Fix PHY station management clock setting
    https://git.kernel.org/netdev/net/c/a0c55bba0d0d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


