Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEF5A3B4586
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 16:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbhFYOa2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 10:30:28 -0400
Received: from mail-ua1-f42.google.com ([209.85.222.42]:42770 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbhFYOa2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 10:30:28 -0400
Received: by mail-ua1-f42.google.com with SMTP id e20so3618063ual.9;
        Fri, 25 Jun 2021 07:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zWDSZ55vDIqTTzTYQvZl2Wg+gW1Pu4/t/3XgViOSN7M=;
        b=QTG4YRNkdR9DF2EuxXO5w2ADzxNqWK0iEbG0Tol3yjT2+3msc8t2tlGqUhLNu9N5Nh
         QU8WJYOADjqE6o9vhZnUGvU5B5MLu4F+xsryrJR1AodiP2cce/ZnujIY6jG5iwRsobpx
         59R+vtij2JrS01ntvZWCP214IW+pl22OrU10CD4eOytUIby+hbQI19VbBtWn3wsYaXfR
         ny8u3pj5y8jASCPEzOPS1hrkXfJ+MyZ0TGVNUbyisxHSYoWleO9mpn9Ouvb3UOm9p4Lq
         qg71USJvLsb9J9MklVyVYdK+8Q1+jFqnHXampsyX63HVqDqDKNL2IiMwccLJyLCI2leo
         e2Ug==
X-Gm-Message-State: AOAM532y0/yKTlk1ssaDeHUpNlPEQiON0cW4BUd/8PkjvfT0Z8UZRA9c
        dsEArxvpds5z6n8jZBJvdcFJUVNwFHOOSFGOuyg=
X-Google-Smtp-Source: ABdhPJz71C4Gf21TKCwFJzrKsmXCtx/A7wFlTKIzgKK3PknLZxJa7I7wWygRVF83TLoDwztym+MdYDvjBrcTvM6qU/4=
X-Received: by 2002:ab0:3734:: with SMTP id s20mr11988608uag.106.1624631287526;
 Fri, 25 Jun 2021 07:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210624130240.17468-1-biju.das.jz@bp.renesas.com> <20210624130240.17468-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210624130240.17468-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Jun 2021 16:27:56 +0200
Message-ID: <CAMuHMdVhyBVzF864m6n78U2nr+ZREj36B=T3wdtXDmTHRXcDjw@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] drivers: clk: renesas: r9a07g044-cpg: Rename
 divider table
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

Thanks for your patch!

On Thu, Jun 24, 2021 at 3:02 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As per RZ/G2L HW Manual (Rev.0.50), CPG_PL3A_DDIV,CPG_PL3B_DDIV
> and CPG_PL2_DDIV(for P0) shares same divider table entries. Rename
> clk_div_table dtable_3b to clk_div_table dtable_1_32 so that it

This does not match the actual variable name.
I do like the shorter name, though ;-)

> can be reused.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Apart from that:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/clk/renesas/r9a07g044-cpg.c
> +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> @@ -42,12 +42,13 @@ enum clk_ids {
>  };
>
>  /* Divider tables */
> -static const struct clk_div_table dtable_3b[] = {
> +static const struct clk_div_table dtable_common_1_32[] = {
>         {0, 1},
>         {1, 2},
>         {2, 4},
>         {3, 8},
>         {4, 32},
> +       {0, 0},
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
