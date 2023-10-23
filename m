Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2447D322E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Oct 2023 13:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233686AbjJWLRg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Oct 2023 07:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233675AbjJWLRf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Oct 2023 07:17:35 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94DEFC1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 04:17:33 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E98DC433C9;
        Mon, 23 Oct 2023 11:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698059853;
        bh=3zAwiEexuhFbhJpVqY15Jho2Mmz9AaR+HIcJ8igMtoc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u8w89mq4wmC3x/KeH3y9Uy6coEjBuvoBB0+8m3HEhN+r6aKHbD1VyZ7iXe0l4KGvT
         D8EDgUgrGo5ZmaXRYmR8pp3c6LlJPDF+34amu9Hr2ECbYmjYb7VfiDZ3rVibwTuva1
         GxI0IWyIYxtEgtyCKtwxPqdXuBrl7Sy/WeTUM7U7HqiDBwIHqJES6ZsW72jDGo6Qy1
         99WgMe7dUStG7PBFyZUZ6+2nCuk/ChXUv1XtRbNYl4n5AK6NIWliaW1NAWcwqpLC5Y
         Il73Hazs72HGpPMmpNDnF+FceUf0TY7d2Pxazivai7YUdABaYNIHyLPBnT8XUsF/p0
         wiU0iJl34HrDw==
Date:   Mon, 23 Oct 2023 12:16:54 +0100
From:   Simon Horman <horms@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net v2] ravb: Fix races between ravb_tx_timeout_work()
 and net related ops
Message-ID: <20231023111654.GW2100445@kernel.org>
References: <20231019113308.1133944-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019113308.1133944-1-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Oct 19, 2023 at 08:33:08PM +0900, Yoshihiro Shimoda wrote:
> Fix races between ravb_tx_timeout_work() and functions of net_device_ops
> and ethtool_ops by using rtnl_trylock() and rtnl_unlock(). Note that
> since ravb_close() is under the rtnl lock and calls cancel_work_sync(),
> ravb_tx_timeout_work() should calls rtnl_trylock(). Otherwise, a deadlock
> may happen in ravb_tx_timeout_work() like below:
> 
> CPU0			CPU1
> 			ravb_tx_timeout()
> 			schedule_work()
> ...
> __dev_close_many()
> // Under rtnl lock
> ravb_close()
> cancel_work_sync()
> // Waiting
> 			ravb_tx_timeout_work()
> 			rtnl_lock()
> 			// This is possible to cause a deadlock
> 
> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms@kernel.org>

