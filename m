Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D192D5A91
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 13:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbgLJMdF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 07:33:05 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34337 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgLJMdE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 07:33:04 -0500
Received: by mail-oi1-f196.google.com with SMTP id s75so5554297oih.1;
        Thu, 10 Dec 2020 04:32:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=I9ig92LOtmYRR5DLFNpdrbwnR+k7jwv5PhPqIUt1T58=;
        b=WofdYTsW4iG/mmo240zXtfgDJtn6TYPFc6yBjxx8dU19E8xEKp0kWsqkjS0vEtAqrR
         XV1DAqzUcZaqKgtAcfpcbFGYNLWrlIfcaU2fA9u47XbZtst3iDFe3LrHkYLsd1HXWlQ3
         0I+DhYIP+BrEcPRKmusT7RnAGYS5gnxIgi0K8Y9wwt9i3qnMXuq1zeCZebLa4usjTK6K
         uJvEA6yHuZRjb8+NtWu8052/0wn46JdQQ8n1IAAEKqIUKLg6y5w2gCZFZcxnQqwe+/wt
         jAkiL88mwLL+P04elMARB95gHDx5zvuF0uueOMM4IJ3Ig8B9g0PAQuQpPvf7Rly23zG/
         6koQ==
X-Gm-Message-State: AOAM530sor3SdJ5GvqJMS32sgConcRx2fTidqAXS37eUzeGKjNQbWwaq
        KDt6m3DFINVfsQHvDRoWxtszmB6ennne6HyzbeYqJqKkc3g=
X-Google-Smtp-Source: ABdhPJyPB7l3Eh9ysnJGZqIERlOpCAjlvDM2B+QLkzi6YyTC/py+42zj/JD7+Uj+9Evwu/35KtcCLCBmIYBf9qx/PqA=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr5158505oih.153.1607603543711;
 Thu, 10 Dec 2020 04:32:23 -0800 (PST)
MIME-Version: 1.0
References: <20201209195343.803120-1-niklas.soderlund+renesas@ragnatech.se> <20201209195343.803120-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20201209195343.803120-2-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Dec 2020 13:32:12 +0100
Message-ID: <CAMuHMdUWAnia_cNSgsGWS7DMpj=vPzpb3NJwf-mXQAJnEwTR8Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: renesas: r8a7795: Add TMU clocks
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Wed, Dec 9, 2020 at 8:54 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> This patch adds TMU{0,1,2,3,4} clocks.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -128,6 +128,11 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
>         DEF_MOD("fdp1-2",                117,   R8A7795_CLK_S2D1), /* ES1.x */
>         DEF_MOD("fdp1-1",                118,   R8A7795_CLK_S0D1),
>         DEF_MOD("fdp1-0",                119,   R8A7795_CLK_S0D1),
> +       DEF_MOD("tmu4",                  121,   R8A7795_CLK_S0D6),

The above is correct for R-Car H3 ES2.0 and later.
On R-Car H3 ES1.x, the parent clock of TMU4 is S3D2 (datasheet rev 0.52),
so you need to add an entry to r8a7795es1_mod_reparent[].

> +       DEF_MOD("tmu3",                  122,   R8A7795_CLK_S3D2),
> +       DEF_MOD("tmu2",                  123,   R8A7795_CLK_S3D2),
> +       DEF_MOD("tmu1",                  124,   R8A7795_CLK_S3D2),
> +       DEF_MOD("tmu0",                  125,   R8A7795_CLK_CP),
>         DEF_MOD("scif5",                 202,   R8A7795_CLK_S3D4),
>         DEF_MOD("scif4",                 203,   R8A7795_CLK_S3D4),
>         DEF_MOD("scif3",                 204,   R8A7795_CLK_S3D4),

The rest looks good to me.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
