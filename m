Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D59844BE95
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Nov 2021 11:28:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbhKJKa5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 05:30:57 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:44997 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbhKJKa5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 05:30:57 -0500
Received: by mail-oi1-f178.google.com with SMTP id be32so4303692oib.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Nov 2021 02:28:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A+eYYyV3QtQ1bPG0axbaeuFvDvyunk6IaBZwJw+9La8=;
        b=sWBak4vrauSTgyqKEPQaUTAlLKYtOjEpLIf9W/z1GNr52RoFP0Gx8WEuR+0RGKCAKU
         0ExyG8eebA4oEAmM0hIR17Vmq8E4fdABm6eG4CJ3UN8jL9ge3kDpN7MrNfVBNl3HpsEq
         wvetc16/LF8RwAZizBhjDeWD12e9tw6akE42SGYZBoaRNsBVf9Wk8O6t2q+c5UimcW8D
         WkeqAvQwvhfPUmvrtpXbVMW3BK64+bB3zRVib4953iSun1ygWr6AY3kQTy6rQKFS8cnO
         VNOEkivy3tN1bfw1cWFT5JZf/ym/TkfC1urg8zyKd6cDCSc5EXQdusEy8uCeT/IOksNa
         KwnQ==
X-Gm-Message-State: AOAM5307z0oiu9qpHWE+aB2nZaQ+j9XQWm5iud7OD3/Yp1nblOeCEwgi
        9xHcmqjFKLTsz6RDhLd1W4vmKWL/BEa6kg==
X-Google-Smtp-Source: ABdhPJwlpySEGwjWLOi4yXQhzp1L7GOv+5klddnHoaYEwMQfvXD4syYYX0a/A/OZcAo2WsBlg2ajHA==
X-Received: by 2002:aca:2412:: with SMTP id n18mr11894589oic.119.1636540089175;
        Wed, 10 Nov 2021 02:28:09 -0800 (PST)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com. [209.85.161.43])
        by smtp.gmail.com with ESMTPSA id g2sm1879835oic.35.2021.11.10.02.28.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Nov 2021 02:28:08 -0800 (PST)
Received: by mail-oo1-f43.google.com with SMTP id q39-20020a4a962a000000b002b8bb100791so651117ooi.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Nov 2021 02:28:08 -0800 (PST)
X-Received: by 2002:a4a:b881:: with SMTP id z1mr7401592ooo.68.1636540088100;
 Wed, 10 Nov 2021 02:28:08 -0800 (PST)
MIME-Version: 1.0
References: <20211110083152.31144-1-biju.das.jz@bp.renesas.com> <20211110083152.31144-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211110083152.31144-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 Nov 2021 11:27:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+3TfX21HtuUcUQp1SZKJgZ0By8XFxzpxSED1H8_ua0w@mail.gmail.com>
Message-ID: <CAMuHMdX+3TfX21HtuUcUQp1SZKJgZ0By8XFxzpxSED1H8_ua0w@mail.gmail.com>
Subject: Re: [PATCH 2/2] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM support
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
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

On Wed, Nov 10, 2021 at 9:32 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
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
> @@ -209,3 +211,39 @@ static int __init ostm_init(struct device_node *np)
>  }
>
>  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);

Background: this driver uses TIMER_OF_DECLARE() because the OSTM
is the system timer on RZ/A SoCs, which do not have the ARM architectured
timer.  RZ/G2L does have the ARM architectured timer.

> +
> +#ifdef CONFIG_ARCH_R9A07G044
> +static int __init ostm_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct reset_control *rstc;
> +       int ret;
> +
> +       rstc = devm_reset_control_get_exclusive(dev, NULL);
> +       if (IS_ERR(rstc))
> +               return dev_err_probe(dev, PTR_ERR(rstc), "failed to get reset");
> +
> +       reset_control_deassert(rstc);
> +
> +       ret = ostm_init(dev->of_node);
> +       if (ret) {
> +               reset_control_assert(rstc);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id ostm_of_table[] = {
> +       { .compatible = "renesas,rzg2l-ostm", },

I believe the OSTM block on RZ/G2L is identical to the one on RZ/A,
and the requirement to deassert its module reset is an SoC integration
feature on RZ/G2L.  Hence the driver should match on "renesas,ostm"
for both?

So my suggestion would be to include the reset handling in ostm_init()
instead, but make it optional, and error out in case of -EPROBE_DEFER.
In case initialization from TIMER_OF_DECLARE() failed, the platform
driver can kick in later and retry.

However, it seems __of_reset_control_get() ignores all errors,
including -EPROBE_DEFER, if optional is true, so this won't work?
Philipp: is that correct? If yes, ostm_init() has to check the presence
of a resets property to see if the reset is optional or required.

> +       { }
> +};
> +
> +static struct platform_driver ostm_device_driver = {
> +       .driver         = {
> +               .name   = "rzg2l_ostm",
> +               .of_match_table = of_match_ptr(ostm_of_table),
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
