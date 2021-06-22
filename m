Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 537AA3B085E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 17:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbhFVPPc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 11:15:32 -0400
Received: from mail-ua1-f44.google.com ([209.85.222.44]:34326 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231761AbhFVPPb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 11:15:31 -0400
Received: by mail-ua1-f44.google.com with SMTP id c17so7770077uao.1;
        Tue, 22 Jun 2021 08:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bv7WwnNN4jSgH2oWMMbN7hrYMpc9ayD+kEEI17OMXyM=;
        b=fpHlWgEP5az7FfJ4iqMmxDIdpS9ieO2TrwI/b64gKCyqoxP7hQCMBqup8MNkSQ0Gf4
         3iU2IPUadOak265AN2Sor870QCR32LDgSbimPcILThqUSXytaI41DH0tybduS89old2Y
         UCXg6osZbJwrBneNyNE6YTaprSA0bmYn6+GnEQBdhnfsB7OdriAgiE0+t2+SW2eKL+BT
         kM5W4jU4J7td82embgdHQSS5Lzjv/m3RgKM9IlA0+I7nlmf2zHAnqo0GmB3Alusi6VdC
         GrtO6uPwy18BKCP0oVTDgRoUox5mKUIQvESbRJmbNSUQtmiWmHS2eoVTFzR/pa6jptVA
         rP8w==
X-Gm-Message-State: AOAM531DnN7uYDTWrr/4c4vHsUt1VRuX4atFbXzsVmuHld4WJTnxrn+k
        BY1vNGmFsx0LjaarJBu45GuX/oDmvoTtq1F3M0NHySnNj5fAtg==
X-Google-Smtp-Source: ABdhPJxBfjeS3Vm/JkS1teO/qjijGjsPTc2ptiVapThJpxDJlrF4gSrmUGx+Gqr2gkQJgioro3egJ2e/gxu8Lt8vZYM=
X-Received: by 2002:ab0:70b3:: with SMTP id q19mr4200398ual.2.1624374794935;
 Tue, 22 Jun 2021 08:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210618095823.19885-1-biju.das.jz@bp.renesas.com> <20210618095823.19885-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210618095823.19885-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Jun 2021 17:13:03 +0200
Message-ID: <CAMuHMdV77ORDvcQmMUg8FpmyotdiORDSN_J19hqctzZz9g6gUw@mail.gmail.com>
Subject: Re: [PATCH 3/7] drivers: clk: renesas: r9a07g044-cpg: Update
 {GIC,IA55,SCIF} clock entries
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

On Fri, Jun 18, 2021 at 11:58 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Update {GIC,IA55,SCIF} clock entries to CPG driver to match with
> RZ/G2L clock list hardware manual(Rev0.2).
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a07g044-cpg.c
> +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> @@ -32,6 +32,7 @@ enum clk_ids {
>         CLK_PLL3_DIV2,
>         CLK_PLL3_DIV4,
>         CLK_PLL3_DIV8,
> +       CLK_PLL3_DIV16,
>         CLK_PLL4,
>         CLK_PLL5,
>         CLK_PLL5_DIV2,
> @@ -42,6 +43,14 @@ enum clk_ids {
>  };
>
>  /* Divider tables */
> +static const struct clk_div_table dtable_3a[] = {
> +       {0, 1},
> +       {1, 2},
> +       {2, 4},
> +       {3, 8},
> +       {4, 32},
> +};

Divider tables have to end with a sentinel entry that has .div = 0.
Actually the same bug is present for dtable_3b[], oops.
Both tables are identical, perhaps they can be shared?

> +
>  static const struct clk_div_table dtable_3b[] = {
>         {0, 1},
>         {1, 2},

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
