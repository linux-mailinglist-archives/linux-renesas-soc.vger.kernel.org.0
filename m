Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFE493A2BE4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 14:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbhFJMsU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 08:48:20 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:33788 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230376AbhFJMsT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 08:48:19 -0400
Received: by mail-wm1-f47.google.com with SMTP id s70-20020a1ca9490000b02901a589651424so4727810wme.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 05:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=g7TiuP2WpfKxq21Oat7OGhwnmhrUis17kCLilyIjt+M=;
        b=HRu4a60k50d+JB0O2NTMWABJCFfiQA2RcYP1msxTcprDAoeMBpoTI1ENO03jjhiqr7
         u46wP7+4M0yyuJvqtkAXgXUn8wffXhZ0k9UEdNR2fAsXsLqOykReQkfzNr4kp6aZmAj4
         h31sIMxhS81cLikgksh79kMgbrG8vPMEJQFHZyNLhuQkMiyE3oJgBZP4hIwiehJ09meW
         kaM+1lD1esg4jijgBDIYWbAYqoPakUrHV1QYO8HO1CKtKEhmDV1dMou72sAaasRudDQN
         Rxkime7bWiy6h53MeCa7+LCbL7aLPMmlGaa7VO73cE2nDYOMtTimNRbLxd9jpGqfz5s3
         nJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g7TiuP2WpfKxq21Oat7OGhwnmhrUis17kCLilyIjt+M=;
        b=BfF7PNSnwcJw/o9aP9sh2LAXzrAaRZAdiO8uAvsUqE53q5aAf1n490m8fbahiRFiyO
         gPZEoVJMhYWu7Un0epHbJzAFs/sTPAM2bb8QMEogX/eCeKPGIujX+/DuMdy3TkAdih0S
         SN9y1qNuIdOf48vDBvrChPleJvdZIfMrmbsolBMbw8yaiceDULeZjLo4p7Y+Rl3oy4Fe
         itrD/LSZ8WQUtvAOPplCpguq++WGqQDiPoDi62s3SWv+zRdswcSBwcuYLDTTZt+fxKqD
         fazD150/+bspZmLd2AScyyk9pDx21pJU88LXDxGmWtGMGJzKCxUa++ZOn/Jb1xpZY9KC
         jqIQ==
X-Gm-Message-State: AOAM5334bbPi0cv5fCBQrDNJEKaBy4tqnCzwrkxo6mElnTTeI9aa5rPs
        Z/wj787KeVaoTrRAjCZ4MXjYItOG+8S8YVBv
X-Google-Smtp-Source: ABdhPJxIcnCNPtsmmIzFfE6qEFokBKUq+C8okxGUZwsNJ4ydegrjMS8XjCzfE3VNejv5ijC4EmuOtw==
X-Received: by 2002:a05:600c:5128:: with SMTP id o40mr14639555wms.43.1623329107454;
        Thu, 10 Jun 2021 05:45:07 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:e537:d458:d3c4:18e1? ([2a01:e34:ed2f:f020:e537:d458:d3c4:18e1])
        by smtp.googlemail.com with ESMTPSA id f5sm4022143wrf.22.2021.06.10.05.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 05:45:06 -0700 (PDT)
Subject: Re: [PATCH] clocksource: sh_cmt: Fix wrong setting if don't request
 IRQ for clock source channel
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Phong Hoang <phong.hoang.wz@renesas.com>
References: <20210422123443.73334-1-niklas.soderlund+renesas@ragnatech.se>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <7cf6444a-1dc4-a2bb-8fef-696e0b2b6f23@linaro.org>
Date:   Thu, 10 Jun 2021 14:45:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210422123443.73334-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 22/04/2021 14:34, Niklas Söderlund wrote:
> From: Phong Hoang <phong.hoang.wz@renesas.com>
> 
> If CMT instance has at least two channels, one channel will be used
> as a clock source and another one used as a clock event device.
> In that case, IRQ is not requested for clock source channel so
> sh_cmt_clock_event_program_verify() might work incorrectly.
> Besides, when a channel is only used for clock source, don't need to
> re-set the next match_value since it should be maximum timeout as
> it still is.
> 
> On the other hand, due to no IRQ, total_cycles is not counted up
> when reaches compare match time (timer counter resets to zero),
> so sh_cmt_clocksource_read() returns unexpected value.
> Therefore, use 64-bit clocksoure's mask for 32-bit or 16-bit variants
> will also lead to wrong delta calculation. Hence, this mask should
> correspond to timer counter width, and above function just returns
> the raw value of timer counter register.

I'm not getting the 'ch->cmt->num_channels == 1' change, can you explain?

> Fixes: bfa76bb12f23 ("clocksource: sh_cmt: Request IRQ for clock event device only")
> Fixes: 37e7742c55ba ("clocksource/drivers/sh_cmt: Fix clocksource width for 32-bit machines")
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/clocksource/sh_cmt.c | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
> index c98f8851fd680454..cadd09ad1a0946b9 100644
> --- a/drivers/clocksource/sh_cmt.c
> +++ b/drivers/clocksource/sh_cmt.c
> @@ -578,7 +578,8 @@ static int sh_cmt_start(struct sh_cmt_channel *ch, unsigned long flag)
>  	ch->flags |= flag;
>  
>  	/* setup timeout if no clockevent */
> -	if ((flag == FLAG_CLOCKSOURCE) && (!(ch->flags & FLAG_CLOCKEVENT)))
> +	if (ch->cmt->num_channels == 1 &&
> +	    flag == FLAG_CLOCKSOURCE && (!(ch->flags & FLAG_CLOCKEVENT)))
>  		__sh_cmt_set_next(ch, ch->max_match_value);
>   out:
>  	raw_spin_unlock_irqrestore(&ch->lock, flags);
> @@ -620,20 +621,25 @@ static struct sh_cmt_channel *cs_to_sh_cmt(struct clocksource *cs)
>  static u64 sh_cmt_clocksource_read(struct clocksource *cs)
>  {
>  	struct sh_cmt_channel *ch = cs_to_sh_cmt(cs);
> -	unsigned long flags;
>  	u32 has_wrapped;
> -	u64 value;
> -	u32 raw;
>  
> -	raw_spin_lock_irqsave(&ch->lock, flags);
> -	value = ch->total_cycles;
> -	raw = sh_cmt_get_counter(ch, &has_wrapped);
> +	if (ch->cmt->num_channels == 1) {



> +		unsigned long flags;
> +		u64 value;
> +		u32 raw;
>  
> -	if (unlikely(has_wrapped))
> -		raw += ch->match_value + 1;
> -	raw_spin_unlock_irqrestore(&ch->lock, flags);
> +		raw_spin_lock_irqsave(&ch->lock, flags);
> +		value = ch->total_cycles;
> +		raw = sh_cmt_get_counter(ch, &has_wrapped);
>  
> -	return value + raw;
> +		if (unlikely(has_wrapped))
> +			raw += ch->match_value + 1;
> +		raw_spin_unlock_irqrestore(&ch->lock, flags);
> +
> +		return value + raw;
> +	}
> +
> +	return sh_cmt_get_counter(ch, &has_wrapped);
>  }
>  
>  static int sh_cmt_clocksource_enable(struct clocksource *cs)
> @@ -696,7 +702,7 @@ static int sh_cmt_register_clocksource(struct sh_cmt_channel *ch,
>  	cs->disable = sh_cmt_clocksource_disable;
>  	cs->suspend = sh_cmt_clocksource_suspend;
>  	cs->resume = sh_cmt_clocksource_resume;
> -	cs->mask = CLOCKSOURCE_MASK(sizeof(u64) * 8);
> +	cs->mask = CLOCKSOURCE_MASK(ch->cmt->info->width);
>  	cs->flags = CLOCK_SOURCE_IS_CONTINUOUS;
>  
>  	dev_info(&ch->cmt->pdev->dev, "ch%u: used as clock source\n",
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
