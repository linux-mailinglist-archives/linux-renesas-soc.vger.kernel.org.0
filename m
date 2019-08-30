Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A087A4016
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Aug 2019 00:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728161AbfH3WGj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Aug 2019 18:06:39 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43040 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728138AbfH3WGj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Aug 2019 18:06:39 -0400
Received: by mail-lf1-f65.google.com with SMTP id q27so6402964lfo.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Aug 2019 15:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=DPVQFmDz+ZwK/0C5JLTUib5pJE3OojucgUl02yyW1Rk=;
        b=wpov99nMJ0N+GC7exkbZ+0Fz2jLUw76TdwtT1WJX2jMNUQFDqvqRJWI7hkY+tnAhJh
         2a4p9b2qvrD3abdBCFwssNNZ0MzXxpA40GN6Vb1AUEs8a3py0askf9TmOD7sxydzJQrL
         aOK1/1Ve0Rw1JAs236ln6y2IlUuSlg4/UPM3bWPysQtDNn7JVdHlP2nhN105bq2dcocj
         RIKsbkVUG4FDiCISa2pHt5v0AiIu+INUefY7jIS47+46/MfYf9+KlW/JAmUbOqooYIX8
         TsiZA1s6gKLQHbvXiOFYte3IKwuT0HmBhmYcnLMFkD0PLmcC9S1iCNRyeernGsXfa2NB
         dBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=DPVQFmDz+ZwK/0C5JLTUib5pJE3OojucgUl02yyW1Rk=;
        b=YpwwOkX/K4hF0r1Y0aGHBKO3mLNawJL0v0N5EGSQYGDeB1ulRxl8crAiOTDQsIh/kB
         5MupHUAOs+KTad2KgM8NeedyLHgRtnkFBZBQlIemCA8LHPLiPv0q5ao3JkFAURuwSLou
         n698mBOy4QJ/fRTHmCu3VWgDhvU/WB8ktkF4FWYVZT9zmGvc5MU1OfZ8TRcnL5W6ebVG
         EZF9pNbMalQ77ptmA1DpeWHrgRJMteUlKe3hsDHHT+oLNlA0RIydTJ7nioolG9uTPTkm
         mPp0nvqtgQqaiVGOa/cz2J44rNBFvWKdl/GL4X4ZdhjPsVQSr7OkB+L8p4ayPlMAFWDJ
         qC6A==
X-Gm-Message-State: APjAAAVDelc588C1+7fZ/CiaZJtbAJF+dn+oL/fqBW4nDqCLfIDCb8+4
        GbwUV7iVyahCJ1uWD/OEBqcXUw==
X-Google-Smtp-Source: APXvYqxEa1KHC9f193Amd1nyFJaiVjsiZqBZq9gLb6ZX8CjVZeEpQiUPbNbVwtee/NVxwAIvVSJVvQ==
X-Received: by 2002:a19:ae1a:: with SMTP id f26mr10300717lfc.172.1567202797315;
        Fri, 30 Aug 2019 15:06:37 -0700 (PDT)
Received: from localhost (h-177-236.A463.priv.bahnhof.se. [217.31.177.236])
        by smtp.gmail.com with ESMTPSA id h5sm650021ljf.83.2019.08.30.15.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 15:06:36 -0700 (PDT)
Date:   Sat, 31 Aug 2019 00:06:36 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/8] clk: renesas: rcar-gen3: Avoid double table
 iteration in SD .set_rate()
Message-ID: <20190830220636.GS8479@bigcity.dyn.berto.se>
References: <20190830134515.11925-1-geert+renesas@glider.be>
 <20190830134515.11925-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190830134515.11925-4-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2019-08-30 15:45:10 +0200, Geert Uytterhoeven wrote:
> The .set_rate() callback for the SD clocks is always called with a valid
> clock rate, returned by .round_rate().  Hence there is no need to
> iterate through the divider table twice: once to repeat the work done by
> .round_rate(), and a second time to find the corresponding divider
> entry.
> 
> Just iterate once, looking for the divider that matches the passed clock
> rate.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Clever :-)

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> v2:
>   - No changes.
> ---
>  drivers/clk/renesas/rcar-gen3-cpg.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
> index 3480284a08308134..9f457411984b1ca4 100644
> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -339,14 +339,14 @@ static long cpg_sd_clock_round_rate(struct clk_hw *hw, unsigned long rate,
>  }
>  
>  static int cpg_sd_clock_set_rate(struct clk_hw *hw, unsigned long rate,
> -				   unsigned long parent_rate)
> +				 unsigned long parent_rate)
>  {
>  	struct sd_clock *clock = to_sd_clock(hw);
> -	unsigned int div = cpg_sd_clock_calc_div(clock, rate, parent_rate);
>  	unsigned int i;
>  
>  	for (i = 0; i < clock->div_num; i++)
> -		if (div == clock->div_table[i].div)
> +		if (rate == DIV_ROUND_CLOSEST(parent_rate,
> +					      clock->div_table[i].div))
>  			break;
>  
>  	if (i >= clock->div_num)
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
