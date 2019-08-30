Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22CEFA4039
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Aug 2019 00:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728257AbfH3WOp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Aug 2019 18:14:45 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45427 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728255AbfH3WOp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Aug 2019 18:14:45 -0400
Received: by mail-lj1-f193.google.com with SMTP id l1so7755347lji.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Aug 2019 15:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=bEQ69WeIauTgFDJQNBz5ypiOnyZ2Lbzr1a7apMN0/Xg=;
        b=lWK4O2f9muuZTEoKWoR1hlG3kuqWwGNBSdfZjN1J5o1krOuGnCfqsPY29mt+IjIk2K
         AHBbBcZkOS1m2n3z8+fKNSNn4Mj5jvUvwKNphTQS5BREMoYsACeTlyeXqpvqjMQ+tm6J
         sAbBKvkFLYyHx7Ta1qflWC9wqR1dxvlzn5VYzU/wJDJBO994m33AiFk4QT9KfYUUGcVD
         pOBMVuxfN9h3J82U19lreLGFuVrwHJ90Wg2c3cUan+WBjw07sGBww7aWjhkgON7oferl
         UvV40lRgdKPxBlxH7BvIHcQRbhX8ffl2LH5h//zBdjDcCadWLw7ZTBKlHdMa1AQl8cRf
         qBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=bEQ69WeIauTgFDJQNBz5ypiOnyZ2Lbzr1a7apMN0/Xg=;
        b=f5fgjO6S+Ju2rgKDBLH/Cyoc3KvYPIl+9CWaanoeif5ZGa/pKOGRi8QpFTS2ktwBC5
         RNB6RpiheSq3cUsFt/0M+bVn2JPDm4d3OKLiRPnVHuznm+NwZy9CCNXu3h2VmIj//IRJ
         Nu+JrYDVCi76eif+u9HEnt7PsSudFhYmQmhEYzuRF8U/vxrBCyaign0FAs3C3301xHMA
         hel+5ahb6zTyrDAeFU5N5entkPiuHytDBMakSHb9oamM5sWfx2l3RCxTjwcQIXfDHtOp
         Iw5zoeELoXwDPE1CZiX1zTABOwly1f4WCwRYBWDvWFE9swkz3rCxB6GhmuOV2LtIYsb2
         3gBA==
X-Gm-Message-State: APjAAAWx9bYCBKA9r1+Pcnw+yIUxwjRJrnfjQ7OgLxEO49qwAeDmWrW0
        uBML0Lu5M5IUO0m5qVw/+NrDCw==
X-Google-Smtp-Source: APXvYqxifJKGr5l9Dw9jQ8hUAzx2mCk1etj+NtHRvPjDa5RAs6TSLysAh7dy7PoBpRvzK0sbsoYDxQ==
X-Received: by 2002:a2e:6a04:: with SMTP id f4mr9869654ljc.150.1567203282876;
        Fri, 30 Aug 2019 15:14:42 -0700 (PDT)
Received: from localhost (h-177-236.A463.priv.bahnhof.se. [217.31.177.236])
        by smtp.gmail.com with ESMTPSA id m74sm1174676lje.72.2019.08.30.15.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 15:14:42 -0700 (PDT)
Date:   Sat, 31 Aug 2019 00:14:41 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/8] clk: renesas: rcar-gen3: Absorb
 cpg_sd_clock_calc_div()
Message-ID: <20190830221441.GT8479@bigcity.dyn.berto.se>
References: <20190830134515.11925-1-geert+renesas@glider.be>
 <20190830134515.11925-5-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190830134515.11925-5-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-08-30 15:45:11 +0200, Geert Uytterhoeven wrote:
> cpg_sd_clock_round_rate() is the sole caller of cpg_sd_clock_calc_div(),
> hence absorb the latter into the former.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> v2:
>   - Split off from "clk: renesas: rcar-gen3: Switch SD clocks to
>     .determine_rate()".
> ---
>  drivers/clk/renesas/rcar-gen3-cpg.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
> index 9f457411984b1ca4..12ea5c9a671de788 100644
> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -309,15 +309,15 @@ static unsigned long cpg_sd_clock_recalc_rate(struct clk_hw *hw,
>  				 clock->div_table[clock->cur_div_idx].div);
>  }
>  
> -static unsigned int cpg_sd_clock_calc_div(struct sd_clock *clock,
> -					  unsigned long rate,
> -					  unsigned long parent_rate)
> +static long cpg_sd_clock_round_rate(struct clk_hw *hw, unsigned long rate,
> +				      unsigned long *parent_rate)
>  {
>  	unsigned long calc_rate, diff, diff_min = ULONG_MAX;
> +	struct sd_clock *clock = to_sd_clock(hw);
>  	unsigned int i, best_div = 0;
>  
>  	for (i = 0; i < clock->div_num; i++) {
> -		calc_rate = DIV_ROUND_CLOSEST(parent_rate,
> +		calc_rate = DIV_ROUND_CLOSEST(*parent_rate,
>  					      clock->div_table[i].div);
>  		diff = calc_rate > rate ? calc_rate - rate : rate - calc_rate;
>  		if (diff < diff_min) {
> @@ -326,16 +326,7 @@ static unsigned int cpg_sd_clock_calc_div(struct sd_clock *clock,
>  		}
>  	}
>  
> -	return best_div;
> -}
> -
> -static long cpg_sd_clock_round_rate(struct clk_hw *hw, unsigned long rate,
> -				      unsigned long *parent_rate)
> -{
> -	struct sd_clock *clock = to_sd_clock(hw);
> -	unsigned int div = cpg_sd_clock_calc_div(clock, rate, *parent_rate);
> -
> -	return DIV_ROUND_CLOSEST(*parent_rate, div);
> +	return DIV_ROUND_CLOSEST(*parent_rate, best_div);
>  }
>  
>  static int cpg_sd_clock_set_rate(struct clk_hw *hw, unsigned long rate,
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
