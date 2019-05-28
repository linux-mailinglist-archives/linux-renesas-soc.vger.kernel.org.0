Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEE7A2C023
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 09:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbfE1Hen (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 03:34:43 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38305 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbfE1Hem (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 03:34:42 -0400
Received: by mail-lj1-f193.google.com with SMTP id 14so16695311ljj.5;
        Tue, 28 May 2019 00:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=trapB6GCH6DrFYhLqm2TbydlBbFBOqjrTPKFBvYve8U=;
        b=UL/Alc6+GYMD9p6SduN+9qtTmrRUYk5N+x4HcCJti7iMA/2gV42kZoU2D6H2sBaPej
         4hReoi49Nny0v7Of7JQDRX6zxgXIltUS6Aup5b2MMdA1xYEas1kEGiDJlEHAZN+OGBRV
         9wo+U6SZD860sJ/4eR625xPKnxtijIVkHoyJzkzmZOoK/hoNpcMuYy/o/cxwqrSmB+ja
         tsLXG4c2D4lx1LUNvjEseuYR5wgjDbSa5kGFxP59muP7hLt5qJq3SrC62r3OEYlI3mUq
         TNAzwxHai6PqBaFyMaQt0s7E27NZ6GXoLPKV0a4EfIzDJa3o89cfYSL/P/z9uh9pdOmo
         d94A==
X-Gm-Message-State: APjAAAWriTG2h8h7NICWKtd02a4zF/IQQvEqWZeiXXSmqhQDqliLBteg
        yGzn1VDs4BLRM+4/odPFFMIWBBbmOxPhr2rYAss=
X-Google-Smtp-Source: APXvYqy2qQI+pzVbL0x7gFnfPgU8bYHNW5+5eXWGv1zv7eVDWBC5pYEB/0mszyVJkiZmsuOWedYDfj78KMwjiypaGvY=
X-Received: by 2002:a2e:249:: with SMTP id 70mr60692698ljc.178.1559028880499;
 Tue, 28 May 2019 00:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <1558711904-27278-1-git-send-email-gareth.williams.jx@renesas.com> <1558711904-27278-3-git-send-email-gareth.williams.jx@renesas.com>
In-Reply-To: <1558711904-27278-3-git-send-email-gareth.williams.jx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 May 2019 09:34:29 +0200
Message-ID: <CAMuHMdU_+U0iW+35OVZ-ExquE1s0bUtjM5e63zaOU9WFy8j_UA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clk: renesas: r9a06g032: Add clock domain support
To:     Gareth Williams <gareth.williams.jx@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Gareth,

On Fri, May 24, 2019 at 5:32 PM Gareth Williams
<gareth.williams.jx@renesas.com> wrote:
> There are several clocks on the r9ag032 which are currently not enabled
> in their drivers that can be delegated to clock domain system for power
> management. Therefore add support for clock domain functionality to the
> r9a06g032 clock driver.
>
> Signed-off-by: Gareth Williams <gareth.williams.jx@renesas.com>

Thanks for the update!

> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c

> @@ -344,6 +351,86 @@ struct r9a06g032_clk_gate {
>
>  #define to_r9a06g032_gate(_hw) container_of(_hw, struct r9a06g032_clk_gate, hw)
>
> +static int create_add_module_clock(struct of_phandle_args *clkspec,
> +                                  struct device *dev)
> +{
> +       struct clk *clk;
> +       int error = 0;

No need to initialize to 0.

> +
> +       clk = of_clk_get_from_provider(clkspec);
> +       if (IS_ERR(clk))
> +               return PTR_ERR(clk);
> +
> +       error = pm_clk_create(dev);

> +static int r9a06g032_attach_dev(struct generic_pm_domain *pd,
> +                               struct device *dev)
> +{
> +       struct device_node *np = dev->of_node;
> +       struct of_phandle_args clkspec;
> +       int i = 0;
> +       int error;
> +
> +       while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", i,
> +                                          &clkspec)) {
> +               int index;

scripts/checkpatch.pl says a blank line is missing.
Alternatively, you can move the declaration of index to the top of the
function, together with error and i.

> +               if (clkspec.np != pd->dev.of_node)
> +                       continue;
> +
> +               index = clkspec.args[0];
> +
> +               if (index < R9A06G032_CLOCK_COUNT &&
> +                   r9a06g032_clocks[index].managed) {
> +                       of_node_put(clkspec.np);

As the call below uses clkspec.np, the call to of_node_put() should be
after it, just before the error check.

> +
> +                       error = create_add_module_clock(&clkspec, dev);
> +                       if (error)
> +                               return error;
> +               }
> +               i++;
> +       }
> +
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
