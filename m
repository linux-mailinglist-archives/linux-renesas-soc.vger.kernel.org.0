Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DECB7CB38E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 21:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233732AbjJPT4O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 15:56:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233412AbjJPT4N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 15:56:13 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04A79D9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 12:56:11 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B22DC433C7;
        Mon, 16 Oct 2023 19:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697486170;
        bh=/VCdYT4fBtEbGzbLAcvNHqRBpRWQM83gNLhvaxU5tq0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U5GNDI9NckPt1u0ux490BLJ+n62O72xBii5ekES2+xudhp98Y/aPN/78Kn1hZLR7r
         vRcJ9b2apMfCZ552hznQTXdFn29enPMPFrgZQk/Jo38k2lMbrGyRuCpChbPrFu41M7
         +j8gXixY4RQvEOlOZo8M8oGWK/KjsWhmHC5yqZGe+n6POmQBdJsl2285Ame77wnusq
         Pdq3umnJo0aoZzwJp3uTUUJR4yulg23kd25J72UKzvdeI6xoh2E9pXprQlU4G7pDs9
         mnxG7M3JMaapaNIuY4OJYxKItuFBvVzEJ8tnDfAds46ngxPzeOlzFgpN9CTCA9/vGT
         BARfdN8/3moWQ==
Date:   Mon, 16 Oct 2023 21:56:05 +0200
From:   Simon Horman <horms@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH net-next v2 1/2] rswitch: Use unsigned int for array index
Message-ID: <20231016195605.GA1751252@kernel.org>
References: <20231013121936.364678-1-yoshihiro.shimoda.uh@renesas.com>
 <20231013121936.364678-2-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013121936.364678-2-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

+ Geert Uytterhoeven

On Fri, Oct 13, 2023 at 09:19:35PM +0900, Yoshihiro Shimoda wrote:
> The array index should not be negative, so modify the condition of
> rswitch_for_each_enabled_port_continue_reverse() macro, and then
> use unsigned int instead.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/net/ethernet/renesas/rswitch.c | 8 +++++---
>  drivers/net/ethernet/renesas/rswitch.h | 2 +-
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
> index 112e605f104a..7640144db79b 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -1405,7 +1405,8 @@ static void rswitch_ether_port_deinit_one(struct rswitch_device *rdev)
>  
>  static int rswitch_ether_port_init_all(struct rswitch_private *priv)
>  {
> -	int i, err;
> +	unsigned int i;
> +	int err;
>  
>  	rswitch_for_each_enabled_port(priv, i) {
>  		err = rswitch_ether_port_init_one(priv->rdev[i]);
> @@ -1786,7 +1787,8 @@ static void rswitch_device_free(struct rswitch_private *priv, int index)
>  
>  static int rswitch_init(struct rswitch_private *priv)
>  {
> -	int i, err;
> +	unsigned int i;
> +	int err;
>  
>  	for (i = 0; i < RSWITCH_NUM_PORTS; i++)
>  		rswitch_etha_init(priv, i);

Hi Shimoda-san,

Immediately below this hunk, the following code appears.

                if (err < 0) {
                        for (i--; i >= 0; i--)
                                rswitch_device_free(priv, i);
                        goto err_device_alloc;
                } 

I suspect that the for loop should be updated in a similar way to
that in rswitch_for_each_enabled_port_continue_reverse as,
now that i is unsigned, i >= 0 will always be true.

As flagged by Smatch and Coccinelle.

Otherwise this patch-set looks good to me.

> @@ -1959,7 +1961,7 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
>  
>  static void rswitch_deinit(struct rswitch_private *priv)
>  {
> -	int i;
> +	unsigned int i;
>  
>  	rswitch_gwca_hw_deinit(priv);
>  	rcar_gen4_ptp_unregister(priv->ptp_priv);
> diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
> index 04f49a7a5843..27c9d3872c0e 100644
> --- a/drivers/net/ethernet/renesas/rswitch.h
> +++ b/drivers/net/ethernet/renesas/rswitch.h
> @@ -20,7 +20,7 @@
>  		else
>  
>  #define rswitch_for_each_enabled_port_continue_reverse(priv, i)	\
> -	for (i--; i >= 0; i--)					\
> +	for (; i-- > 0; )					\
>  		if (priv->rdev[i]->disabled)			\
>  			continue;				\
>  		else

-- 
pw-bot: changes-requested
