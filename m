Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC3D7C69AC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Oct 2023 11:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjJLJaa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Oct 2023 05:30:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232558AbjJLJa3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2023 05:30:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF2B1B7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Oct 2023 02:30:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81128C433C9;
        Thu, 12 Oct 2023 09:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697103026;
        bh=cLhAWw79kwNYxKES6zDveSTsFkXxKGLY9f4mOyYx3CI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=htmJ/Bs6c0bAAYLQjEQTwrEC1d6bXxtAVJcVsz1pdL5UoSp6VTBEo1HECHKKXhhlS
         Qhy/lmhDpiagK7I637O/s0OTNffikwWgcDuB9huZs3fQ4vsB5598DH5P94FTN3Ufza
         Arn/1wAfS/fPSrrXmEEpMzwatCPJBRNlog8GE5g4uQNWtKWdaqP/mJh4sLvJUd3nC2
         bUmjo5W8JnPXjhwWh5EjFLM2Q1hbiznOJo5I621zGTNZWCNjECQ6fZJAQ9KERoXarc
         swT47dJ+qn/OWKhjaNTBXQ7OPxQm99NM8h0i0g0RMjPZSReoL1Edi+0KUSkK2qX/0Y
         v8VLOWDTAymjg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 673E7C595C3;
        Thu, 12 Oct 2023 09:30:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/2] rswitch: Fix issues on specific conditions
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169710302641.22077.15617536299898879874.git-patchwork-notify@kernel.org>
Date:   Thu, 12 Oct 2023 09:30:26 +0000
References: <20231010124858.183891-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20231010124858.183891-1-yoshihiro.shimoda.uh@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
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

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 10 Oct 2023 21:48:56 +0900 you wrote:
> This patch series fix some issues of rswitch driver on specific
> condtions.
> 
> Yoshihiro Shimoda (2):
>   rswitch: Fix renesas_eth_sw_remove() implementation
>   rswitch: Fix imbalance phy_power_off() calling
> 
> [...]

Here is the summary with links:
  - [net,1/2] rswitch: Fix renesas_eth_sw_remove() implementation
    https://git.kernel.org/netdev/net/c/510b18cf23b9
  - [net,2/2] rswitch: Fix imbalance phy_power_off() calling
    https://git.kernel.org/netdev/net/c/053f13f67be6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


