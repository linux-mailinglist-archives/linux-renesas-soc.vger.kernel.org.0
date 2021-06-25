Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 626DC3B45FF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 16:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbhFYOpY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 10:45:24 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:37467 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbhFYOpY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 10:45:24 -0400
Received: by mail-vs1-f46.google.com with SMTP id x12so5564128vsp.4;
        Fri, 25 Jun 2021 07:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UoKID4eypEQpJ7+14TSpYbygCQ6WMreQFUdhOYCkTcg=;
        b=G3r+NYeNxdgcJcZZUCS3so0Ez6EseeeCOfSxVTVYrhVrAn/fTCLalO1IqBl70Eza/4
         ipk2m6wACvuEkT7DxorLRjn8wWrl4NB/QuKky62zoO+xQV3ckgRekSqOW9LRwjHr7vlK
         8wHtON7lA05QQhroT0aWkIFIqPccQifN4MnyRkh5BUevbNxB1O+6aACCua3IKlfGzZVF
         30j2l01Xlk9VEKf4+hXbxMldo/nmX/QbPLV0BfTkSY9fe3iEFN8IAjY2O6f6zLbBeKQu
         vQEYdNWvy8889ZwutMlHVMxHo6kkXsnlBySW7o14iOEWqhnS8uivr0jJct3SjJ3Zq9tb
         ycrg==
X-Gm-Message-State: AOAM531mtWRcNYPIsCw883xlftyvBQFkV1bgn/jP4jh5opn032Kr2RuP
        xIfm3MwEmZaX4dLVWlY1u2m9ut8A4AiMC++qs6Y=
X-Google-Smtp-Source: ABdhPJwemR2pecVSFQDnb2pt9UolWHQGIAwtQ50IZzSzPYjn5xf2a8wd8NRRJBmWylCmpNUuXxm02I+kSl+sJMYFG7M=
X-Received: by 2002:a67:f7c2:: with SMTP id a2mr8183302vsp.3.1624632182763;
 Fri, 25 Jun 2021 07:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210624130240.17468-1-biju.das.jz@bp.renesas.com> <20210624130240.17468-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210624130240.17468-7-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Jun 2021 16:42:51 +0200
Message-ID: <CAMuHMdWLdDoL++e7qerjEoO3NtqdoxxN4zoa4XJ9Xy1EoZKVNw@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] drivers: clk: renesas: renesas-rzg2l-cpg:
 Separate reset from module clocks
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

On Thu, Jun 24, 2021 at 3:03 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G2L SoC's have different definitions for clock and reset.
> Separate reset from module clocks in order to handle it efficiently.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/renesas-rzg2l-cpg.h
> +++ b/drivers/clk/renesas/renesas-rzg2l-cpg.h
> @@ -99,6 +99,26 @@ struct rzg2l_mod_clk {
>                 .reset = (_reset) \
>         }
>
> +/**
> + * struct rzg2l_reset - Reset definitions
> + *
> + * @id: reset index in array containing all resets
> + * @off: register offset
> + * @reset: reset bits

bit

> + */
> +struct rzg2l_reset {
> +       unsigned int id;

Do you need this field? It seems to be set only.

> +       u16 off;
> +       u8 reset;
> +};
> +
> +#define DEF_RST(_id, _off, _reset)     \
> +       [_id] = { \
> +               .id = _id, \
> +               .off = (_off), \
> +               .reset = (_reset) \
> +       }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
