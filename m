Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09D167B048E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Sep 2023 14:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbjI0Mn5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Sep 2023 08:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231689AbjI0Mn4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Sep 2023 08:43:56 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0E7194;
        Wed, 27 Sep 2023 05:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=2T8YHEKuEB6B68lIkcjNZVCk54WFy2pat8kTZPO7/zU=; b=1sRvoBLHqWDDoTEtU8Gzh2NqXX
        BecH/RHYTwnzQp0NtR/9805cbbMA4vcu85nkJj5Edbl6PmQFL1fDKLir5x6zoNtyiAFQR1bW/b8zc
        RyxDM5CartA3FKSpq7Ut9Hxb8bPGQ8ihrSgF5vJUREwp8QDMlkgHBzNE4FjuWDhWl6eY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qlTtK-007e1J-DL; Wed, 27 Sep 2023 14:43:46 +0200
Date:   Wed, 27 Sep 2023 14:43:46 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH net v3] rswitch: Fix PHY station management clock setting
Message-ID: <c88ebcd5-614d-41ce-9f13-bc3c0e4920d7@lunn.ch>
References: <20230926123054.3976752-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230926123054.3976752-1-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> +
> +	/* MPIC.PSMCS = (clk [MHz] / (MDC frequency [MHz] * 2) - 1.
> +	 * Calculating PSMCS value as MDC frequency = 2.5MHz. So, multiply
> +	 * both the numerator and the denominator by 10.
> +	 */
> +	etha->psmcs = clk_get_rate(priv->clk) / 100000 / (25 * 2) - 1;
>  }
>  
>  static int rswitch_device_alloc(struct rswitch_private *priv, int index)
> @@ -1900,6 +1907,10 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	spin_lock_init(&priv->lock);
>  
> +	priv->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(priv->clk))
> +		return PTR_ERR(priv->clk);
> +

/**
 * clk_get_rate - obtain the current clock rate (in Hz) for a clock source.
 *		  This is only valid once the clock source has been enabled.
 * @clk: clock source
 */
unsigned long clk_get_rate(struct clk *clk);

I don't see the clock being enabled anywhere.

Also, is the clock documented in the device tree binding?

      Andrew
