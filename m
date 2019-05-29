Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DEDA2E70D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2019 23:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbfE2VHz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 May 2019 17:07:55 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45653 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbfE2VHz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 May 2019 17:07:55 -0400
Received: by mail-lf1-f65.google.com with SMTP id m14so3215442lfp.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2019 14:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=zh9+9yRl0nxItU1MTT/ATBOYhw29alvblpi0dcu7FgY=;
        b=OhsQ7qZULd3tXXaST8afYbDpeaCTZ55xJGSwOzV8SZIoA949ICy5JQE03gkRIHmiuS
         OnEzDZflMztC9fcP/5oXD4UzPGul9p7dg5CuZwp2IG0iwU+PucpRJsBbDw0An36jwNjZ
         I37YTW8FNyxbRMpv51t7RJyv8ejPvGxWtW8Mz3UpBtHGDGt0Y3ClS6pos5IP5f7lR1+y
         zpN0AbazxDqu5h1OEqJCzBBJA93I0g/zfqb5+2j2qOMvRl48ry1bwJZSCWIV/7PPUsqn
         D63yKj1o8StKjykeugv3cHcc1MPVLUgS8vQ31pqfJOcK+y5k4RnNafEeDHmnvE8+62M8
         oB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=zh9+9yRl0nxItU1MTT/ATBOYhw29alvblpi0dcu7FgY=;
        b=gAQG8JpBqksWkXkxoYWXRSQBVzOIr2OwoA/OrOP3p1j3y+QOkSU7BTtYCtSOOVbHiY
         t1sCKuqVxPFBCL9kd7DRO7NP4iiVVKb8WGL4F118Z1LXTwQmsbq4PdF40oDF/3bGSo0+
         o64dMpPpAVj3oKUxD1OHvFwEKEIoJBrNBQcZ9NEVFZVjvUgRiUCv5aVttp3u9mXTy+9a
         gue8sLGgGeyd+5QYXwu4Wv2UyjcUFYC4pLVJgIF25ERKpXnjFHOCzsDbBxAl67V2Ffr0
         nGko8efECellEpmimYtpZln4mneqD0ZahDmgAJxhCtCUsTi3iRnIMXZf1CK9IajziFTE
         KVEA==
X-Gm-Message-State: APjAAAUK50VsIe91MQKzTOdQSsnwcEQ0sBGJ8tFoxznMFDJtC3EKCP2a
        dUOFXDDxo0IjWhVqLlXhcfwIlg==
X-Google-Smtp-Source: APXvYqwHdVjMt6s8UXKAj/2gI0JKhqeA47qMVZYA8s96pMf+cxK58NrghU3NDIYhlZVXsPvGYhKc3Q==
X-Received: by 2002:a19:f20d:: with SMTP id q13mr7678lfh.65.1559164072980;
        Wed, 29 May 2019 14:07:52 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id h25sm83446lja.41.2019.05.29.14.07.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 May 2019 14:07:51 -0700 (PDT)
Date:   Wed, 29 May 2019 23:07:51 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: mstp: Remove error messages on
 out-of-memory conditions
Message-ID: <20190529210751.GN1651@bigcity.dyn.berto.se>
References: <20190527123514.7198-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190527123514.7198-1-geert+renesas@glider.be>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-05-27 14:35:14 +0200, Geert Uytterhoeven wrote:
> pm_clk_create() and pm_clk_add_clk() can fail only when running out of
> memory.  Hence there is no need to print error messages on failure, as
> the memory allocation core already takes care of that.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in clk-renesas-for-v5.3.
> 
>  drivers/clk/renesas/clk-mstp.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
> index ebd5cd74ca0733d8..a5e9f9edf04079c7 100644
> --- a/drivers/clk/renesas/clk-mstp.c
> +++ b/drivers/clk/renesas/clk-mstp.c
> @@ -298,16 +298,12 @@ int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev)
>  		return PTR_ERR(clk);
>  
>  	error = pm_clk_create(dev);
> -	if (error) {
> -		dev_err(dev, "pm_clk_create failed %d\n", error);
> +	if (error)
>  		goto fail_put;
> -	}
>  
>  	error = pm_clk_add_clk(dev, clk);
> -	if (error) {
> -		dev_err(dev, "pm_clk_add_clk %pC failed %d\n", clk, error);
> +	if (error)
>  		goto fail_destroy;
> -	}
>  
>  	return 0;
>  
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
