Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A28F458F2B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Nov 2021 14:10:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231444AbhKVNNx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 08:13:53 -0500
Received: from mail-ua1-f54.google.com ([209.85.222.54]:42975 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230406AbhKVNNw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 08:13:52 -0500
Received: by mail-ua1-f54.google.com with SMTP id t13so36302655uad.9;
        Mon, 22 Nov 2021 05:10:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cZ0Uo7ATYpsrQwJTgWsP7rE+IeWkbDLgOg8WiWSro+k=;
        b=P8xa34PwI4rEBzGV6oa9Y+gXAl4vHC+nj2+lYXRsTS9tTnNRieDdIT0VY54Pacs1oD
         Tbf6omcCU9EVf5Pwp24iajO5u0Omi9NY6uI23RGyLAawbnLrpcza9VUQaxYwDwcFjz4o
         PzJsDL1V0VZNHnHVAU5/It7RcD/BzEjAyn8lLZiuJBUm6tO2Dv9SMLckkQZ2loiLZoK8
         FpSyN1VQ4F/KlMUTCLpfma37U96GxsQD9tenv1XQmdrI18/Fa2WOuEdhOdeeLo473wkn
         2IAtLgXDcn7bW526yYkOrk0Wt+ALHCJFoHMOzlmUasHoPablpYU1YtcyNItY9OAJyRN/
         qwNQ==
X-Gm-Message-State: AOAM5323f69rOTH0KweWoNHAzwij+VqXjE5nw0GmmCcDjuOufmDfcH66
        ekWLUNdKWSzyDRtqF/uSdygXuIzgELWAMA==
X-Google-Smtp-Source: ABdhPJyNhqOS6tRWNHbm3rsot+gZcrjLREyOg+sIVjlHAxdnYYe15zNU9UHWiFwzKyIKH0AcIQGTSw==
X-Received: by 2002:a67:e114:: with SMTP id d20mr102840526vsl.5.1637586644751;
        Mon, 22 Nov 2021 05:10:44 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id bl34sm4762214vsb.31.2021.11.22.05.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Nov 2021 05:10:44 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id n6so36419878uak.1;
        Mon, 22 Nov 2021 05:10:44 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr130142461vst.37.1637586643812;
 Mon, 22 Nov 2021 05:10:43 -0800 (PST)
MIME-Version: 1.0
References: <20211122103032.517923-1-maz@kernel.org>
In-Reply-To: <20211122103032.517923-1-maz@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 Nov 2021 14:10:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX2ZRvDYA3idmw3nBcP6CO=2od6ZU-UeJo9vYsuB=fQNQ@mail.gmail.com>
Message-ID: <CAMuHMdX2ZRvDYA3idmw3nBcP6CO=2od6ZU-UeJo9vYsuB=fQNQ@mail.gmail.com>
Subject: Re: [PATCH] of/irq: Add a quirk for controllers with their own
 definition of interrupt-map
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kernel-team@android.com, Rob Herring <robh@kernel.org>,
        John Crispin <john@phrozen.org>, Biwen Li <biwen.li@nxp.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marc,

On Mon, Nov 22, 2021 at 11:30 AM Marc Zyngier <maz@kernel.org> wrote:
> Since 041284181226 ("of/irq: Allow matching of an interrupt-map local
> to an interrupt controller"), a handful of interrupt controllers have
> stopped working correctly. This is due to the DT exposing a non-sensical
> interrupt-map property, and their drivers relying on the kernel ignoring
> this property.
>
> Since we cannot realistically fix this terrible behaviour, add a quirk
> for the limited set of devices that have implemented this monster,
> and document that this is a pretty bad practice.
>
> Cc: Rob Herring <robh@kernel.org>
> Cc: John Crispin <john@phrozen.org>
> Cc: Biwen Li <biwen.li@nxp.com>
> Cc: Chris Brandt <chris.brandt@renesas.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Thanks for your patch!

> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -76,6 +76,36 @@ struct device_node *of_irq_find_parent(struct device_node *child)
>  }
>  EXPORT_SYMBOL_GPL(of_irq_find_parent);
>
> +/*
> + * These interrupt controllers abuse interrupt-map for unspeakable
> + * reasons and rely on the core code to *ignore* it (the drivers do
> + * their own parsing of the property).
> + *
> + * If you think of adding to the list for something *new*, think
> + * again. There is a high chance that you will be sent back to the
> + * drawing board.
> + */
> +static const char * const of_irq_imap_abusers[] = {
> +       "CBEA,platform-spider-pic",
> +       "sti,platform-spider-pic",
> +       "realtek,rtl-intc",
> +       "fsl,ls1021a-extirq",
> +       "fsl,ls1043a-extirq",
> +       "fsl,ls1088a-extirq",
> +       "renesas,rza1-irqc",
> +};

Are you sure "renesas,rza1-irqc" handles this wrong? How should it
be handled instead? I read the other thread[1], but didn't became
any wiser: interrupts are mapped one-to-one with the RZ/A1 IRQC.

In both v5.15 and v5.16-rc1, interrupts seem to work fine on RSK+RZA1
and RZA2MEVB, both with gpio-keys and when used as a wake-up interrupt.

With this patch applied, I see double keypresses with evtest: when
pressing a key, I get a key-down event, immediately followed by a
key-up event. When releasing the key, I again get two events.

Good (v5.15 or v5.16-rc1):

    Event: time 1637585631.288990, type 1 (EV_KEY), code 2 (KEY_1), value 1
    Event: time 1637585631.288990, -------------- SYN_REPORT ------------
    Event: time 1637585631.499924, type 1 (EV_KEY), code 2 (KEY_1), value 0
    Event: time 1637585631.499924, -------------- SYN_REPORT ------------

Bad (v5.16-rc1 + this patch):

    Event: time 1637585341.946647, type 1 (EV_KEY), code 2 (KEY_1), value 1
    Event: time 1637585341.946647, -------------- SYN_REPORT ------------
    Event: time 1637585341.960256, type 1 (EV_KEY), code 2 (KEY_1), value 0
    Event: time 1637585341.960256, -------------- SYN_REPORT ------------
    Event: time 1637585342.146775, type 1 (EV_KEY), code 2 (KEY_1), value 1
    Event: time 1637585342.146775, -------------- SYN_REPORT ------------
    Event: time 1637585342.160092, type 1 (EV_KEY), code 2 (KEY_1), value 0
    Event: time 1637585342.160092, -------------- SYN_REPORT ------------

Thanks!

[1] https://lore.kernel.org/all/bbe5506a2458b2d6049bd22a5fda77ae6175ddec.camel@svanheule.net/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
