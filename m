Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FAD62E08E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 11:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgLVKqu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Dec 2020 05:46:50 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:39865 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbgLVKqu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 05:46:50 -0500
Received: by mail-oi1-f169.google.com with SMTP id w124so14337198oia.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Dec 2020 02:46:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WOEV+cWKrp2bxeH9Ax2IWqS0CcKk0l85uQHV3NPCsHw=;
        b=LMLJZY0hlfFsjlirM5sDu4lvdM6qFvrqMgJHmge8kvguSBY4UnBSp7FVYMfyqZ1AQG
         zLboYFY2WmZUMVkVdYs251upvfHqmAYXKRnFH44JdBmXHbtoHiyEsOwH4MIukq2qWzuP
         swus7Svfqji1+JnKosMgk6hGoS5R3hwV67jHoCa3R8pf8Dd9LU3+YtAr+yYTPTrxFS69
         GWZwRw8M7IohKC3uX9IGdqwaGfTYRRrXZa+LY8jY4g2hgS6918K6+Xvp69nigTJzHusU
         8L+V1sg+TIhff1U8zFrqFaDDmxWlpgXdtDEHcXgG75MtLpJN2Ws//Dq8jt7IDh80LNlH
         NnOQ==
X-Gm-Message-State: AOAM530DV0vF+5gPIxazi4dN6xxn/CPyz5QqUcvIiLIC/8P9w+zn3FxZ
        R7tQrTSLkAK0ITvf8LHTlyXc8hItv+RSZ3BP4JDTNp1f
X-Google-Smtp-Source: ABdhPJzgtJjpy280lFAol1XRX0xENENdidc1btKHcHEPEX5l3oD52y/HaAcj6+8eHLLsN8AbpQkQICvgmkFj2O3bM/c=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr12584487oia.54.1608633969525;
 Tue, 22 Dec 2020 02:46:09 -0800 (PST)
MIME-Version: 1.0
References: <20201221165448.27312-1-uli+renesas@fpond.eu> <20201221165448.27312-3-uli+renesas@fpond.eu>
In-Reply-To: <20201221165448.27312-3-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 11:45:58 +0100
Message-ID: <CAMuHMdVH_Cb28M5RPjS6pDiguq_q23ri0KXNxGky4tA6xm0mGw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] pinctrl: renesas: add I/O voltage level flag
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Mon, Dec 21, 2020 at 5:55 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds config macros describing the voltage levels available on
> a pin. The current default (3.3V/1.8V) maps to zero to avoid having to
> change existing PFC implementations.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl.c
> +++ b/drivers/pinctrl/renesas/pinctrl.c
> @@ -634,6 +634,9 @@ static int sh_pfc_pinconf_get(struct pinctrl_dev *pctldev, unsigned _pin,
>         }
>
>         case PIN_CONFIG_POWER_SOURCE: {
> +               int idx = sh_pfc_get_pin_index(pfc, _pin);

I guess this cannot fail when we get here?

> +               const struct sh_pfc_pin *pin = &pfc->info->pins[idx];
> +               int lower_voltage;

unsigned int mV_low?

>                 u32 pocctrl, val;
>                 int bit;
>
> @@ -648,7 +651,10 @@ static int sh_pfc_pinconf_get(struct pinctrl_dev *pctldev, unsigned _pin,
>                 val = sh_pfc_read(pfc, pocctrl);
>                 spin_unlock_irqrestore(&pfc->lock, flags);
>
> -               arg = (val & BIT(bit)) ? 3300 : 1800;
> +               lower_voltage = (pin->configs & SH_PFC_PIN_VOLTAGE_25_33) ?
> +                       2500 : 1800;
> +
> +               arg = (val & BIT(bit)) ? 3300 : lower_voltage;
>                 break;
>         }
>
> @@ -702,6 +708,9 @@ static int sh_pfc_pinconf_set(struct pinctrl_dev *pctldev, unsigned _pin,
>
>                 case PIN_CONFIG_POWER_SOURCE: {
>                         unsigned int mV = pinconf_to_config_argument(configs[i]);
> +                       int idx = sh_pfc_get_pin_index(pfc, _pin);
> +                       const struct sh_pfc_pin *pin = &pfc->info->pins[idx];
> +                       int lower_voltage;

unsigned int mV_low?

>                         u32 pocctrl, val;
>                         int bit;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
