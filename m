Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9E6D3D57D1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jul 2021 12:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbhGZKNk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jul 2021 06:13:40 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:41758 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231792AbhGZKNk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jul 2021 06:13:40 -0400
Received: by mail-vs1-f51.google.com with SMTP id g2so4942359vsb.8;
        Mon, 26 Jul 2021 03:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H5pwP3wwekTmwOt3jguCNsgHt2FsmfWLxfT1Dbstxk4=;
        b=N/pf/xfX82UqYyO9Z1ZMyrAnfMtJUItveNGpSqoZIcWMIE+HYS00EEgAWaE8Ogbo6C
         wFZSHU8Sl5SjmBkIPbFUNxvgesmfQVcoE8PEYe+CV4ZpwU3cMpqvFvaT0XdBN3Q7w5Qx
         bPs64WEh7wCHTACKK9toJX57SstLRJ+cKtzFvGctsd/cyIY3HUUR4qkwIJOXzJbsbOVZ
         Zgg+6NQs3Q8OnzGtK5+CNiDTZNHHVwgahHpqyCIphbT8GizfYqAkCBdyyUpIjUTdhT4b
         qi60VYzGXrfY8UHHYsI7yCWLpgcApKyjjW2WJ/a/wvou6PANpwx8VgrRCiiAilXduTG1
         Iw4A==
X-Gm-Message-State: AOAM532e66j5u4J8jQcXtckXPc7qKG7XPVcotdGi40S6ZmMTAa0wgoKy
        T7XcLHAQ+rbN+N+zL6H+guGv5r3LvGEFkpFivAg=
X-Google-Smtp-Source: ABdhPJySKQRmXCMSSoSMlSHgV9KzwEPIBAHyisHnCZizm5I5R0Zk7U1qNaeF0/XFwTKT6GMF22IbL6egss4mdhgfd5U=
X-Received: by 2002:a67:8702:: with SMTP id j2mr11341904vsd.3.1627296847976;
 Mon, 26 Jul 2021 03:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210722141351.13668-1-biju.das.jz@bp.renesas.com> <20210722141351.13668-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210722141351.13668-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Jul 2021 12:53:57 +0200
Message-ID: <CAMuHMdUSe3gkOcU9rMOyQBwFzYJrS0D9PosWDxirTmKbc_xx+w@mail.gmail.com>
Subject: Re: [PATCH net-next 02/18] drivers: clk: renesas: rzg2l-cpg: Add
 support to handle MUX clocks
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,


On Thu, Jul 22, 2021 at 4:14 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add support to handle mux clocks inorder to select a clock source
> from multiple sources.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- a/drivers/clk/renesas/rzg2l-cpg.h
> +++ b/drivers/clk/renesas/rzg2l-cpg.h
> @@ -43,6 +43,7 @@ struct cpg_core_clk {
>         const struct clk_div_table *dtable;
>         const char * const *parent_names;
>         int flag;
> +       int mux_flags;
>         int num_parents;
>  };
>

I'd move SEL_PLL_PACK() from [PATCH 03/18] here, as it applies to
"_conf" in DEF_MUX() below.

> @@ -54,6 +55,9 @@ enum clk_types {
>
>         /* Clock with divider */
>         CLK_TYPE_DIV,
> +
> +       /* Clock with clock source selector */
> +       CLK_TYPE_MUX,
>  };
>
>  #define DEF_TYPE(_name, _id, _type...) \
> @@ -69,6 +73,11 @@ enum clk_types {
>  #define DEF_DIV(_name, _id, _parent, _conf, _dtable, _flag) \
>         DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
>                  .parent = _parent, .dtable = _dtable, .flag = _flag)
> +#define DEF_MUX(_name, _id, _conf, _parent_names, _num_parents, _flag, \
> +               _mux_flags) \
> +       DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf = _conf, \
> +                .parent_names = _parent_names, .num_parents = _num_parents, \
> +                .flag = _flag, .mux_flags = _mux_flags)
>
>  /**
>   * struct rzg2l_mod_clk - Module Clocks definitions

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
