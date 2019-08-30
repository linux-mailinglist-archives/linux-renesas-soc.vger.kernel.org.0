Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4F1A3FC0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2019 23:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbfH3VmX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Aug 2019 17:42:23 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34810 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728079AbfH3VmX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Aug 2019 17:42:23 -0400
Received: by mail-lj1-f195.google.com with SMTP id x18so7782764ljh.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Aug 2019 14:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=75k9uEPTRm4ex9kEGLUEmDRZB/7BY/VMWfNglUvJs+c=;
        b=ASIURLUEBvVUGmMBHh0ZqCNUBWvQlcmCnclW1hMOOlPKDUWOofW74dz49Qs9rWVm8n
         JoORHIrnEHMQEZ8Mm6Dd+vRx8+2cAkQ312cXaTa35WJS0HwRXr5hKlQK1ZpYtMDyIr7F
         QZpDdalZsB71luyBmNR3daxgDjePOgWt/X0e2ph19gOQ7Ej7kDekxQUCSw3maCBfFd3j
         OQKqvTJVTWEuQaUSYIM+50xSG8+Q6bVxDS/GNeRmVwDYxVTK5UB6cHOhEWiY0VqMH8K9
         D6Z4HTuMowFu3x+XPpzTehDlYjefHiOuUZ0MybqBFqeD5eW05Nrxd9b1Skq2iHnWKITE
         bYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=75k9uEPTRm4ex9kEGLUEmDRZB/7BY/VMWfNglUvJs+c=;
        b=FxNponwy+PTpYdeOJh3AuVO3XP/SGOd8txDk5ChRCx67Xx/K9ybZ8uubNPNCCHTiHN
         JSXnYGmrP5kUxUXNkXWulZjXSijBQAFty+cV0Qn3Cu/n06Qm/g6JzbLdk39vLemZgyXy
         wy7c0LLXueV2WCr+YFgojFAn5yYlK/tn8GlhII4yh4Gno8TAbRVZh5CuIhsonwWlfDVJ
         R9UodFcfOtpshqkSKOODh2rz7/LrkNbQ3IRgkG+4qp492OqxG1mkWEFXA5NwbsHaksCz
         /39WC7QWJzLhqyblG4oq4Ozigh/epa0CFYrkdZJ3ojjeB4h+7XQYX1dRvKkNZCY0i7hX
         f6rw==
X-Gm-Message-State: APjAAAV50v9PdYX4nkUxVuZe0ydzgyHY8hfouxZQuMdosUQoCkqIfX2B
        O2EWAx5/MNaNRUA3ymCV5N7ZUaiN32o=
X-Google-Smtp-Source: APXvYqzzs+cfmZYn5KaCOsblVd80oVJsjnqMolehdXZLX5a0eEVJ3fLjfhQ7Z60eEmdZi0D7elw0PQ==
X-Received: by 2002:a2e:924b:: with SMTP id v11mr9919553ljg.139.1567201340968;
        Fri, 30 Aug 2019 14:42:20 -0700 (PDT)
Received: from localhost (h-177-236.A463.priv.bahnhof.se. [217.31.177.236])
        by smtp.gmail.com with ESMTPSA id s7sm1035389lji.26.2019.08.30.14.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 14:42:20 -0700 (PDT)
Date:   Fri, 30 Aug 2019 23:42:19 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/8] clk: renesas: rcar-gen2: Improve arithmetic
 divisions
Message-ID: <20190830214219.GQ8479@bigcity.dyn.berto.se>
References: <20190830134515.11925-1-geert+renesas@glider.be>
 <20190830134515.11925-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190830134515.11925-2-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-08-30 15:45:08 +0200, Geert Uytterhoeven wrote:
>   - Use div64_ul() instead of div_u64() if the divisor is unsigned long,
>     to avoid truncation to 32-bit on 64-bit platforms,
>   - Prefer ULL constant suffixes over casts to u64,
>   - Prioritize multiplication over division, to increase accuracy.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> v2:
>   - New.
> ---
>  drivers/clk/renesas/rcar-gen2-cpg.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rcar-gen2-cpg.c b/drivers/clk/renesas/rcar-gen2-cpg.c
> index f596a2dafcf4d8d1..c378505830f0bacc 100644
> --- a/drivers/clk/renesas/rcar-gen2-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen2-cpg.c
> @@ -72,10 +72,10 @@ static long cpg_z_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>  	if (!prate)
>  		prate = 1;
>  
> -	mult = div_u64((u64)rate * 32, prate);
> +	mult = div64_ul(rate * 32ULL, prate);
>  	mult = clamp(mult, 1U, 32U);
>  
> -	return *parent_rate / 32 * mult;
> +	return div_u64((u64)*parent_rate * mult, 32);
>  }
>  
>  static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> @@ -86,7 +86,7 @@ static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>  	u32 val, kick;
>  	unsigned int i;
>  
> -	mult = div_u64((u64)rate * 32, parent_rate);
> +	mult = div64_ul(rate * 32ULL, parent_rate);
>  	mult = clamp(mult, 1U, 32U);
>  
>  	if (readl(zclk->kick_reg) & CPG_FRQCRB_KICK)
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
