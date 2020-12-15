Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31F302DAF71
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Dec 2020 15:53:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730107AbgLOOvj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Dec 2020 09:51:39 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37634 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730086AbgLOOvg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 09:51:36 -0500
Received: by mail-oi1-f193.google.com with SMTP id l207so23594696oib.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Dec 2020 06:51:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Fr1RXEENBXmloTxPCCmEENufAgrOJXMXh7xD4Llq9k=;
        b=tLZxUeWwhuPoTwISDf/SE8VpTSv6vCZrfSxRYa9r5V2bNUDQN8UF5AXgcWFjaSloI/
         Yj7eTigE1Q2HPORVyxklBHfDXX3bzikGNPLRtjD8dk2LvmB6p74pqL7gRpC6vOVUOK4e
         irWkQ+mR2J5ga3FEj2w8P23KlURyTekJyoJdIf+L6gDDIAKnJxheyCHJgGAti5zIRBkg
         8fkUTmvFWH8sEshV9bjcm7wIGAMVaNsWhlqod4AjlwxaPXEfj1xWPxtTH+MEkh9eToVZ
         I/kOwcakfWPBNSqscwa0GXEhKLsOSb5nN+p01WMNsJ6ZXNpg1H+poxAwy7Jc4pTIhfxo
         eIZA==
X-Gm-Message-State: AOAM530rWBV4Ljnxfn93UpmFuGMJQV1jLEDV9AFpijqnjTriZyTzHjEf
        5vfB6i5gBW7xg2hAAzGu5XXKJtK3kHTLo5TuZGA=
X-Google-Smtp-Source: ABdhPJyAoGZvTKFQNdwkt2a8Nald5iIQlTH36q6kMZIjhd5Xxy0UdgAkH6Xt8z8Z2eC1If/OVgWsJo+D200Lr0ItDss=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr21526892oia.148.1608043854951;
 Tue, 15 Dec 2020 06:50:54 -0800 (PST)
MIME-Version: 1.0
References: <CAMuHMdWvB+p=2JqTsO7bR8uJqKqO5A2XgXFXsVAjHk3hcxgcTw@mail.gmail.com>
 <87v9d4gcqt.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v9d4gcqt.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Dec 2020 15:50:43 +0100
Message-ID: <CAMuHMdVMcjJempYDUA+AJiXWe=OgKAkGAyZDOS6R2Xp8_Xum2Q@mail.gmail.com>
Subject: Re: [PATCH][RFC] ASoC: rsnd: don't call clk_disable_unprepare() if
 can't use
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Tue, Dec 15, 2020 at 1:06 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> We need to care clock accessibility,
> because we might can't use clock for some reasons.
>
> It sets clk_rate for each clocks when enabled.
> This means it doesn't have clk_rate if we can't use.
> We can avoid to call clk_disable_unprepare() in such case.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>

Feel free to use geert+renesas@glider.be instead ;-)

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>
> Hi Geert.
>
> Thank you for your reporting.
> I have never seen this kind of error, but it possible to happen.
> Unfortunately, I can't reproduce this but I hope this patch can solve it.
> Could you please check this ?
> I added [RFC] on this patch Subject.

The patch looks good to me, but I also cannot trigger the issue at will.
I went through my old boot logs, and found 2 other occurrences, also
on Ebisu.  In all cases, it happened while a lot of output was printed to
the serial console (either a WARN() splat, or DEBUG_PINCTRL output).
My guess is that console output or disabling interrupts too long is
triggering a race condition or other issue in the i2c driver (clk 1 is the
cs2000 clock generator, controlled through i2c).

> --- a/sound/soc/sh/rcar/adg.c
> +++ b/sound/soc/sh/rcar/adg.c
> @@ -366,25 +366,25 @@ void rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
>         struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
>         struct device *dev = rsnd_priv_to_dev(priv);
>         struct clk *clk;
> -       int i, ret;
> +       int i;
>
>         for_each_rsnd_clk(clk, adg, i) {
> -               ret = 0;
>                 if (enable) {
> -                       ret = clk_prepare_enable(clk);
> +                       int ret = clk_prepare_enable(clk);
>
>                         /*
>                          * We shouldn't use clk_get_rate() under
>                          * atomic context. Let's keep it when
>                          * rsnd_adg_clk_enable() was called
>                          */
> -                       adg->clk_rate[i] = clk_get_rate(adg->clk[i]);
> +                       if (ret < 0)
> +                               dev_warn(dev, "can't use clk %d\n", i);
> +                       else
> +                               adg->clk_rate[i] = clk_get_rate(adg->clk[i]);
>                 } else {
> -                       clk_disable_unprepare(clk);
> +                       if (adg->clk_rate[i])
> +                               clk_disable_unprepare(clk);

As pointed out by Mark, you may want to clear adg->clk_rate[i] here?

>                 }
> -
> -               if (ret < 0)
> -                       dev_warn(dev, "can't use clk %d\n", i);
>         }
>  }

With the above sorted out:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
