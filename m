Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E35D979E69C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Sep 2023 13:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239978AbjIMLYn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Sep 2023 07:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240129AbjIMLYj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Sep 2023 07:24:39 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27B91726
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Sep 2023 04:24:35 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A68AC433C7;
        Wed, 13 Sep 2023 11:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694604275;
        bh=oI4QxwIa+0uVLswqbMXCEUfXoMeGy9kLfMbzOPVMnSY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j/Oc24iBJ4+HgMYPoSR27YwkCDiN0OKkNl7sgo5ZEb7+CQOCIMHDbvjpU/JKBaK9d
         qUsSXu+rao6MYzkxXtGk2HD4513pcMhG1E4N4Sn3OQ+o01fDDAuar496X9mVD5aKJi
         FE20LEcdXfyHDcI6GDIhmPWKstY2HBiGFW+78FiPGgy0EzFEHRHdI++34KQBBEW3CR
         mA7qB9DQGkO+D+LXC99MnqTrSkxwmPPwEECJIQYarGVl0GTgx7HSarX4loI+ZA51rS
         4Bfj52SZI9bQwq7RSi0B1OEMSaajfHFthpUSZV7wbKBiXgkJ3j9SDVZ7ldCq3yKT2b
         rRCeKy+MRgy8g==
Date:   Wed, 13 Sep 2023 13:24:29 +0200
From:   Simon Horman <horms@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net 0/2] net: renesas: rswitch: Fix a lot of redundant
 irq issue
Message-ID: <20230913112429.GQ401982@kernel.org>
References: <20230912014936.3175430-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912014936.3175430-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 12, 2023 at 10:49:34AM +0900, Yoshihiro Shimoda wrote:
> After this patch series was applied, a lot of redundant interrupts
> no longer occur.
> 
> For example: when "iperf3 -c <ipaddr> -R" on R-Car S4-8 Spider
>  Before the patches are applied: about 800,000 times happened
>  After the patches were applied: about 100,000 times happened
> 
> Yoshihiro Shimoda (2):
>   net: renesas: rswitch: Fix unmasking irq condition
>   net: renesas: rswitch: Add spin lock protection for irq {un}mask
> 
>  drivers/net/ethernet/renesas/rswitch.c | 20 ++++++++++++++++----
>  drivers/net/ethernet/renesas/rswitch.h |  2 ++
>  2 files changed, 18 insertions(+), 4 deletions(-)

For series,

Reviewed-by: Simon Horman <horms@kernel.org>

