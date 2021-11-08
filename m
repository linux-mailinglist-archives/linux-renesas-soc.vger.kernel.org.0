Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31F41449A08
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Nov 2021 17:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241294AbhKHQmy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Nov 2021 11:42:54 -0500
Received: from mail-ua1-f41.google.com ([209.85.222.41]:37747 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236528AbhKHQmt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 11:42:49 -0500
Received: by mail-ua1-f41.google.com with SMTP id l43so32697295uad.4;
        Mon, 08 Nov 2021 08:40:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=35vjIg1mcgYM3GxZvYXmrSJn5EeE32/H7G52/qXH9NU=;
        b=YsSpXEH31wEVfYDIK1IB8WRpSq6hhCnSFYILejpBTgSwdRJkZdT3lteNnpJeCK7PQ1
         yIgHRhK0gkh+ty9jf0OLeHCEVa3xqrzm4taAICXAAvLvykE4gnvPPonLsEI8TLeiQ84A
         PKmxzQeGCXzVOeAVrKLXmHyY4rszg/v89lblDlWZ/tzGLZvS8g0CjaYq3dwoXS5iXKEU
         Cg4zaMKfYaDWVGmdJ8EHJYHu6wOdRlyMf1V+d5g8fNJUasEQX7UYsbtZUQFBGAFkUsq3
         U38jwCwxKJRrXLV/KxsOXrMo6EncikGqMiGv6+45mSydKQCpqfte9GEuE/U05qQKJkm5
         l5wA==
X-Gm-Message-State: AOAM532vPZ9owux/PE4qTZcIVxKMbewcNspfPymX1Ow3sGnKwH9S56oj
        ijDbZCqMH8ILVvHBt76n0KFHa4z4QEImJu4g
X-Google-Smtp-Source: ABdhPJyYcCtLXlqBT1W6LWUu8v7/V9jFu7KcZI/63c8qjfFtL0Yy/M2VhE6e37bImdgL01Pe7XKGTQ==
X-Received: by 2002:a05:6102:b14:: with SMTP id b20mr6609990vst.17.1636389604377;
        Mon, 08 Nov 2021 08:40:04 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id y24sm2986511uaq.17.2021.11.08.08.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 08:40:04 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id az37so32694947uab.13;
        Mon, 08 Nov 2021 08:40:04 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr991282vst.37.1636389603858;
 Mon, 08 Nov 2021 08:40:03 -0800 (PST)
MIME-Version: 1.0
References: <20211103173127.13701-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211103173127.13701-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211103173127.13701-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 17:39:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLfUNh7PQWpARS6CNymqpGO_29tgy7NLtgmJ-BRgyUaA@mail.gmail.com>
Message-ID: <CAMuHMdWLfUNh7PQWpARS6CNymqpGO_29tgy7NLtgmJ-BRgyUaA@mail.gmail.com>
Subject: Re: [PATCH 3/3] serial: sh-sci: Add reset support for RZ/G2L SoC
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Wed, Nov 3, 2021 at 6:31 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> On RZ/G2L devices should be explicitly pulled out of reset for it
> to work. This patch adds support to read the "resets" property and
> performs deassert/assert when required.
>
> Also, propagate the error to the caller of sci_parse_dt() instead of
> returning NULL in case of failure.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> ---
> Hi Geert,
> For handling the resets I was in dual mind whether to perform
> reset based on compatible strings or soc-id, let me know your
> thoughts. Currently no SoC's use "renesas,sci" so using the same
> for performing the reset operation for SCI.

We do, on H8/300.

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -3203,23 +3204,58 @@ static const struct of_device_id of_sci_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, of_sci_match);
>
> +static void sci_reset_control_assert(void *data)
> +{
> +       reset_control_assert(data);
> +}
> +
>  static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
>                                           unsigned int *dev_id)
>  {
>         struct device_node *np = pdev->dev.of_node;
> +       const struct of_device_id *of_id;
>         struct plat_sci_port *p;
>         struct sci_port *sp;
>         const void *data;
>         int id;
>
>         if (!IS_ENABLED(CONFIG_OF) || !np)
> -               return NULL;
> +               return ERR_PTR(-EINVAL);
> +
> +       of_id = of_match_device(of_sci_match, &pdev->dev);
> +       if (!of_id)
> +               return ERR_PTR(-EINVAL);
>
> -       data = of_device_get_match_data(&pdev->dev);
> +       if (!strcmp(of_id->compatible, "renesas,scif-r9a07g044") ||
> +           !strcmp(of_id->compatible, "renesas,sci")) {

This will match on H8/300, too, which doesn't have resets.
Please match against "renesas,sci-r9a07g044" instead.

Please don't use explicit strcmp() calls here, but add a flag to
of_sci_match[].data.

> +               struct reset_control *rstc;
> +               int ret;
> +
> +               rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +               if (IS_ERR(rstc)) {
> +                       dev_err(&pdev->dev, "Error: missing reset ctrl\n");
> +                       return ERR_PTR(PTR_ERR(rstc));
> +               }
> +
> +               ret = reset_control_deassert(rstc);
> +               if (ret) {
> +                       dev_err(&pdev->dev, "failed to deassert %d\n", ret);
> +                       return ERR_PTR(ret);
> +               }
> +
> +               ret = devm_add_action_or_reset(&pdev->dev, sci_reset_control_assert, rstc);
> +               if (ret) {
> +                       dev_err(&pdev->dev, "failed to register assert devm action, %d\n",
> +                               ret);
> +                       return ERR_PTR(ret);
> +               }
> +       }
> +
> +       data = of_id->data;
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
