Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74DADA4007
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2019 23:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728194AbfH3V5N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Aug 2019 17:57:13 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46447 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728166AbfH3V5M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Aug 2019 17:57:12 -0400
Received: by mail-lj1-f195.google.com with SMTP id f9so7706451ljc.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Aug 2019 14:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=OIMQ5gerYhuOsRypocR2IiSSlvfpiTfEKw63P5FeflU=;
        b=qks3GcI2JtvwXz3+YHwROnTIz+ULI/ibMgiuTNy3C7mWCEV0SyNNhaf2/j++4xQEt/
         IdHpIYIOgGsy10lmM1T9FbtyhTwIh+aWtUDuyUbMPBBrFEBwsWMM0+6cFoAoHYnxNYKK
         DxSCwjAZk6EocceqKxpZayFt9OVZuhAvTbytKKHmjlyzwaiKXPBKDp1I2YMddRVj4rDk
         MyM68aTxct+LEa7O+1+tjWQ3kD80ijAWelY/XB31Drmyexyd+bfyQT3mTh+dIyEV82Kn
         m2ISo/iZ3NbQszPb2ijDgqUZsHSTCQjrUUmuZUWCMJ/YaUC7UAsCL9QhNalLksc8B6bS
         AYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=OIMQ5gerYhuOsRypocR2IiSSlvfpiTfEKw63P5FeflU=;
        b=os6BAGiVtd2qJP8Q9IdUNg81IvK5jOraEoQYNO4qNBBMuYwDlW3g+Z7rHAsx7xVDpU
         JloK6cwmbhDZSv/eGgX/lzWySHIz9zPioghtg9a0h/WlAm6/P7CkB2Bq9LRwRl79Vs3M
         2Pl8WPnDyVNhHTSoBiAAGpn6CbmSZYJWbrak265wa3aOeOGhRs56p8rzpEn8LB4J73+z
         ZkGKbf01FXhxBFB6kED8Zcd/ca9TPvyNrkeVOGiZ8fJ3xKN/dCVJuyqp0kq8f9P+NJED
         xgS5A7Z+Xjek/6+VlpCLkQG6P83u1I16KK/VI/fAWIuRExxikOek2F+rO7tMk+fHvoTO
         xVEw==
X-Gm-Message-State: APjAAAX9gTPE4QwHJJShxsIW2F/AQJYEbGAsOtOOqn1lDxkfOFKkoNBS
        rtwrGQFozVEG603k5rOktA+idg==
X-Google-Smtp-Source: APXvYqzXASr5hEdWIknrvJUTLQbQyDYLPkCrGU0QQu8XvV8j3+0dFw6N53nQEI6Eg+5Y9MpN9BshKg==
X-Received: by 2002:a05:651c:1036:: with SMTP id w22mr9519786ljm.79.1567202230673;
        Fri, 30 Aug 2019 14:57:10 -0700 (PDT)
Received: from localhost (h-177-236.A463.priv.bahnhof.se. [217.31.177.236])
        by smtp.gmail.com with ESMTPSA id 63sm1053595ljs.84.2019.08.30.14.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 14:57:10 -0700 (PDT)
Date:   Fri, 30 Aug 2019 23:57:09 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/8] clk: renesas: rcar-gen3: Improve arithmetic
 divisions
Message-ID: <20190830215709.GR8479@bigcity.dyn.berto.se>
References: <20190830134515.11925-1-geert+renesas@glider.be>
 <20190830134515.11925-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190830134515.11925-3-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-08-30 15:45:09 +0200, Geert Uytterhoeven wrote:
>   - Use div64_ul() instead of div_u64() if the divisor is unsigned long,
>     to avoid truncation to 32-bit on 64-bit platforms,
>   - Use div_u64() for 64-by-32 divisions.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> v2:
>   - New.
> ---
>  drivers/clk/renesas/rcar-gen3-cpg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
> index 043ab6ed9d550732..3480284a08308134 100644
> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -122,10 +122,10 @@ static long cpg_z_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>  	unsigned int mult;
>  
>  	prate = *parent_rate / zclk->fixed_div;
> -	mult = div_u64(rate * 32ULL, prate);
> +	mult = div64_ul(rate * 32ULL, prate);
>  	mult = clamp(mult, 1U, 32U);
>  
> -	return (u64)prate * mult / 32;
> +	return div_u64((u64)prate * mult, 32);
>  }
>  
>  static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
