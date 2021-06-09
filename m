Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95EB73A0DB8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 09:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233039AbhFIH3Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 03:29:25 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:38895 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230221AbhFIH3Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 03:29:24 -0400
Received: by mail-vs1-f51.google.com with SMTP id x8so12353492vso.5;
        Wed, 09 Jun 2021 00:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nWNpzXGRyCGRE/T+VmaA6oH+l9WqaV/Ah1VoOoi8rDk=;
        b=OM7/mwsLDWu9Bi3GDZiXBCo90xdVImQGQLQF7dH3HKWKufMpkZFeoEWT/eMRJVvZXB
         5oPK+cOSaEQ0Uh8sMMZxfwwvWYd/YBX3S0Gs4d5957LaRxItNMA7pjeYvXTTSkcRJqzN
         lAysbIWNU1BlHZK71RnRk26+q4It0QDZyE2hVjw/3Qw7vPDqIoP1QCJLUItpQmusvXJD
         vzZN8+Nna0CrRWgjoszJdOewH8hJxPp+yEGjIodxT/GDKWqE4F0XS73gWi0NRr3PPxvz
         r/alPK5Tx2JzMFUgq4+KgFDsyUanT+Jy9Ek2T+SNv5Oo3uOSgxaiE+1hq2aklkxdgKMr
         4ddg==
X-Gm-Message-State: AOAM5313Gt902dbZM/lQ43C0gomUJ6HUZKLH9RfZK2iIP5b1MmnDGyFL
        9Nm9vsAUL05dpp54cqgVRwkPJBic0XH2dr/16E6nvzNi526MBw==
X-Google-Smtp-Source: ABdhPJxRBcZfyGdvJxRstRs7Opkp9as+0vaZOjoxAlvkppxwAy0BA5T7tOpNPuM9ZrrqvGbj2LS3FrBdiwdN+Px/dek=
X-Received: by 2002:a05:6102:2011:: with SMTP id p17mr3979601vsr.40.1623223636944;
 Wed, 09 Jun 2021 00:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210604180933.16754-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210604180933.16754-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210604180933.16754-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Jun 2021 09:27:05 +0200
Message-ID: <CAMuHMdVkKhD3kU-DtPzrGfNf4Sn5Ht09Z1N0scwx1XJoG-F6Mg@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: renesas: Add support to read LSI DEVID register
 of RZ/G2{L,LC} SoC's
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Fri, Jun 4, 2021 at 8:09 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add support for reading the LSI DEVID register which is present in
> SYSC block of RZ/G2{L,LC} SoC's.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c
> @@ -56,6 +56,11 @@ static const struct renesas_family fam_rzg2 __initconst __maybe_unused = {
>         .reg    = 0xfff00044,           /* PRR (Product Register) */
>  };
>
> +static const struct renesas_family fam_rzg2l __initconst __maybe_unused = {
> +       .name   = "RZ/G2L",
> +       .reg    = 0x11020a04,

Please don't add hardcoded register addresses for new SoCs (i.e. drop
".reg").  The "renesas,r9a07g044-sysc" is always present.
And if it were missing, the hardcoded fallback would lead into the
classic CCCR/PRR scheme, which is not correct for RZ/G2L...

> @@ -348,6 +361,25 @@ static int __init renesas_soc_init(void)
>                 goto done;
>         }
>
> +       np = of_find_compatible_node(NULL, NULL, "renesas,r9a07g044-sysc");
> +       if (np) {
> +               of_node_put(np);
> +               chipid = ioremap(family->reg, 4);

Just use of_iomap(np, 0)...

> +
> +               if (chipid) {
> +                       product = readl(chipid);

... and add the DEVID offset within the SYSC block here.

> +                       iounmap(chipid);
> +
> +                       if (soc->id && (product & 0xfffffff) != soc->id) {
> +                               pr_warn("SoC mismatch (product = 0x%x)\n",
> +                                       product);
> +                               return -ENODEV;
> +                       }
> +               }
> +
> +               goto done;
> +       }
> +
>         /* Try PRR first, then hardcoded fallback */
>         np = of_find_compatible_node(NULL, NULL, "renesas,prr");
>         if (np) {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
