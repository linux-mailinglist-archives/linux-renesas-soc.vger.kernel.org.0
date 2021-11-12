Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3429344E949
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 15:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235074AbhKLO7w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 09:59:52 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:41978 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhKLO7w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 09:59:52 -0500
Received: by mail-ua1-f51.google.com with SMTP id p37so17659493uae.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Nov 2021 06:57:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2b/60J30ANRg/cMB4dcb81s4aS1swDNWKxWwZ1/hYOw=;
        b=mBvEalhoIDVffEQbhkcOT8SLJVflMFmFJJO9/deWNzTmlUEp5PQk3gtxET3ibmyPQ5
         hGJPn140zyz5WDNTwGxJPHjZrkK6qVomodW6NL/ZDID/HMReJuS/VbE66F7OoUfRb3to
         Cx/lJKrrPt0IdCMqtOolMqkMa2vVgSf8NzWm/w7rJkxgOifAwnKl0FYVh8/y01My8JZY
         GWkKVW7tX2n6yojA7mAesju5TfZb8AIrtDo48I5510Ks5J7PikVKgzIKF7BepfX9Dd7V
         vRAIBHBWW2Okq708W+WuYnco5F9rZbAYr/ew0TS6FmewdhW2YXlBb5oCQRybxLGBYmdz
         91ow==
X-Gm-Message-State: AOAM531dye4+Q70B06Oe8hijACshFhFMICNeru5PQiGPAwPZ26e1qH/2
        yTb/sYEsyDbzE/Ez6DB2UmsOsf+EipmP0g==
X-Google-Smtp-Source: ABdhPJxrDQF65nhXQgdbeEjx/Y7nkSgbDa/WxTVvZ6zicwTOUH49jxkfv7dy/VKl3I/wnt5gmaG01w==
X-Received: by 2002:a67:c11c:: with SMTP id d28mr11098333vsj.54.1636729020928;
        Fri, 12 Nov 2021 06:57:00 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id r13sm4015065vkl.13.2021.11.12.06.57.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 06:57:00 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id n6so2779644uak.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Nov 2021 06:57:00 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr10445261vst.37.1636729019886;
 Fri, 12 Nov 2021 06:56:59 -0800 (PST)
MIME-Version: 1.0
References: <20211110153142.3451-1-biju.das.jz@bp.renesas.com> <20211110153142.3451-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211110153142.3451-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 15:56:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUPYJ8kK2h=WzXw3PTzaGve3c3whoyaE_3kqR4XJbk0Jw@mail.gmail.com>
Message-ID: <CAMuHMdUPYJ8kK2h=WzXw3PTzaGve3c3whoyaE_3kqR4XJbk0Jw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Nov 10, 2021 at 4:32 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G2L SoC has Generic Timer Module(a.k.a OSTM) which needs to
> deassert the reset line before accessing any registers.
>
> This patch adds an entry point for RZ/G2L so that we can deassert
> the reset line in probe callback.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clocksource/renesas-ostm.c
> +++ b/drivers/clocksource/renesas-ostm.c

> @@ -166,6 +169,14 @@ static int __init ostm_init(struct device_node *np)
>         if (!to)
>                 return -ENOMEM;
>
> +       rstc = of_reset_control_get_optional_exclusive(np, NULL);
> +       if (IS_ERR(rstc)) {
> +               ret = PTR_ERR(rstc);
> +               goto err_free;
> +       }
> +
> +       reset_control_deassert(rstc);
> +
>         to->flags = TIMER_OF_BASE | TIMER_OF_CLOCK;
>         if (system_clock) {
>                 /*
> @@ -178,7 +189,7 @@ static int __init ostm_init(struct device_node *np)
>
>         ret = timer_of_init(np, to);
>         if (ret)
> -               goto err_free;
> +               goto err_reset;
>
>         /*
>          * First probed device will be used as system clocksource. Any
> @@ -203,9 +214,33 @@ static int __init ostm_init(struct device_node *np)
>
>  err_cleanup:
>         timer_of_cleanup(to);
> +err_reset:
> +       reset_control_assert(rstc);

Missing reset_control_put(rstc).

>  err_free:
>         kfree(to);
>         return ret;
>  }
>
>  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
> +
> +#ifdef CONFIG_ARCH_R9A07G044
> +static int __init ostm_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +
> +       return ostm_init(dev->of_node);
> +}
> +
> +static const struct of_device_id ostm_of_table[] = {
> +       { .compatible = "renesas,ostm", },
> +       { /* sentinel */ }
> +};
> +
> +static struct platform_driver ostm_device_driver = {
> +       .driver = {
> +               .name = "renesas_ostm",
> +               .of_match_table = of_match_ptr(ostm_of_table),

.suppress_bind_attrs = true?

> +       },
> +};
> +builtin_platform_driver_probe(ostm_device_driver, ostm_probe);
> +#endif

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
