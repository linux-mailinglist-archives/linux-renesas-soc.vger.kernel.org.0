Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B14C15AB84
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2020 15:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727231AbgBLO7p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Feb 2020 09:59:45 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35056 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728139AbgBLO7p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Feb 2020 09:59:45 -0500
Received: by mail-lf1-f67.google.com with SMTP id z18so1839346lfe.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Feb 2020 06:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=IuHG2t7m6yf7uclIpWwT4vlCJ72ejFiqCDoerkzgElg=;
        b=Ugzkd7ahdUR7l+pHF4e4FUE6T5t9Z+SA+glmQvvKQugojKfjVJ/OZS/idlpjQcwIVI
         nHOc3GHBWMOznM0lu850Au6cFCIdNZF9APwihamx/AYk+Q1hNjOqu+cX0fAj1kA3UGly
         i+/NQA6lpfjnzjIIbkyxsjc1u6G3IvDk23/X0m4/vRREAdVOBs2VMK6BZoyB44Vcx4fS
         BqPHuKnP80Jg9DylDWgYPiD+BEbJIEOCfdgJpPUJASP1GdVibx2VsBD8UQAhfY3LQpb+
         hmK1JhiJzreXk7ufIh5nvF9GNntxa684D02F5UO1WFniwTE0lxaGZmCJ8oImVu80a70W
         ui0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=IuHG2t7m6yf7uclIpWwT4vlCJ72ejFiqCDoerkzgElg=;
        b=LBNm2CBaKMF2iC/A1UQM++lPLfz/iSGWPP6DRd7B1Q6e6p8QAHo2zVGmPWy2urv5h7
         KQoUekQqMua84zMMRttxzXZvDzmZIJzJRwOxaTto457OZowSElThmC2hyP0vXdsFBprz
         yaf5xL3Gns+UjAyAvc6/T4sJJKcfSWZx9zgMUjRJVz3xNBgCXA8rNdqaxoowDe1B/SwZ
         2zTpjknuNn4BQ7LVUoSoxhe9c47aNrXrTNDZ1UbCP7cc999WxlnYzEALeOMo/HZrzc2A
         pDthshIHUYuTMm28B5XMkidSTg5TVvUVT9sA9DmY0xYIQ2iRWMbRGUM7RNqg6VszCF5A
         6V4A==
X-Gm-Message-State: APjAAAWziIPqpByZrN5WZ0pHejE7miIaeqlMobf3rO4KMeFU1IBzDLlF
        QC6W53jJaML538e2JckW3FccQw==
X-Google-Smtp-Source: APXvYqway+Y1QUjA+1fPrqgdxjOw9a27iqer38HWOER8WW4dXi4bniSvyvxLCtpqhXYuJ/mpK05cGg==
X-Received: by 2002:ac2:5e71:: with SMTP id a17mr6735043lfr.181.1581519582530;
        Wed, 12 Feb 2020 06:59:42 -0800 (PST)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id t21sm428588ljh.14.2020.02.12.06.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2020 06:59:41 -0800 (PST)
Date:   Wed, 12 Feb 2020 15:59:40 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sh-pfc: gpio: Return early in gpio_pin_to_irq()
Message-ID: <20200212145940.GA3013231@oden.dyn.berto.se>
References: <20200212090200.11106-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200212090200.11106-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2020-02-12 10:02:00 +0100, Geert Uytterhoeven wrote:
> As of commit 4adeabd042422cee ("pinctrl: sh-pfc: Remove hardcoded IRQ
> numbers"), only a single operation needs to be performed after finding
> the wanted pin.  Hence decrease the needed attention span of the casual
> reader by replacing the goto by a direct return.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in sh-pfc-for-v5.7.
> ---
>  drivers/pinctrl/sh-pfc/gpio.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/gpio.c b/drivers/pinctrl/sh-pfc/gpio.c
> index 8213e118aa408573..9c6e931ae766edf7 100644
> --- a/drivers/pinctrl/sh-pfc/gpio.c
> +++ b/drivers/pinctrl/sh-pfc/gpio.c
> @@ -205,14 +205,11 @@ static int gpio_pin_to_irq(struct gpio_chip *gc, unsigned offset)
>  
>  		for (k = 0; gpios[k] >= 0; k++) {
>  			if (gpios[k] == offset)
> -				goto found;
> +				return pfc->irqs[i];
>  		}
>  	}
>  
>  	return 0;
> -
> -found:
> -	return pfc->irqs[i];
>  }
>  
>  static int gpio_pin_setup(struct sh_pfc_chip *chip)
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
