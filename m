Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA76B937B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Sep 2019 16:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389217AbfITOyz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Sep 2019 10:54:55 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34073 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389185AbfITOyz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Sep 2019 10:54:55 -0400
Received: by mail-ot1-f65.google.com with SMTP id m19so4589068otp.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Sep 2019 07:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NDb30hKd9vs3z/WcUpB+wU4dKoX9DpnKApvtT8pobqs=;
        b=PM74Xxs0bzUwlFx0q7JtRyFtk0m4rmhAN2rsE4MPOF73KXg9gpv8dcNXnyJNNdJRvB
         rplBi1WiyncCGk1NrqLeZsPff241qCFITOAo1jC+OewIlUaVjmD54i+PN+nb0q+hLSfw
         bZ2Lgoq2KGe8kcDDOYjej0Iuo8bDjToxTfWluPKdFE+NuO+ziERhV5Qhuz1DZAcMFYxp
         arBGzn6UAoQ/EgAlVI++V16Rvxz0nf+cCTJNUbjAq/+hIMG29f4jlDFJuT4MVaRMxis1
         SwWo5+kh4i+ZUVXEC/4wH806uWhnkyhM2eHVqqWzBsRoulZ9PNzd9LHuNHBOj7IU9HUv
         JDRA==
X-Gm-Message-State: APjAAAX51EABsqb0RyVHDtct8n5n5VgreoDEgrVhadEiBWSx8Bk9IKZe
        TWSh7nEL+8JHUvA+GlgPitXnDVCkaU/KB3f+Ze8=
X-Google-Smtp-Source: APXvYqw6eRX4aS/vz7UhWtah9Ici6Z2MWt+4J4lAwU6tkuuar4VNK7iTPl3RIqau00A1meWH35zyUoTzaBlygTY6EgA=
X-Received: by 2002:a9d:404d:: with SMTP id o13mr6324206oti.39.1568991294343;
 Fri, 20 Sep 2019 07:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <1568881036-4404-1-git-send-email-biju.das@bp.renesas.com> <1568881036-4404-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1568881036-4404-3-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Sep 2019 16:54:42 +0200
Message-ID: <CAMuHMdUvVKYZuzS7Z9uiN=KmdKm6GPnGS0oZbGZKfkbaUOB+Ng@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] soc: renesas: rcar-sysc: Add r8a774b1 support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Sep 19, 2019 at 10:17 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add support for RZ/G2N (R8A774B1) SoC power areas to the R-Car SYSC
> driver.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/soc/renesas/r8a774b1-sysc.c
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/G2N System Controller
> + * Copyright (C) 2019 Renesas Electronics Corp.
> + *
> + * Based on Renesas R-Car M3-W System Controller
> + * Copyright (C) 2016 Glider bvba
> + */
> +
> +#include <linux/bug.h>

This include doesn't seem to be used?

> +#include <linux/kernel.h>
> +
> +#include <dt-bindings/power/r8a774b1-sysc.h>
> +
> +#include "rcar-sysc.h"
> +
> +static const struct rcar_sysc_area r8a774b1_areas[] __initconst = {
> +       { "always-on",      0, 0, R8A774B1_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
> +       { "ca57-scu",   0x1c0, 0, R8A774B1_PD_CA57_SCU, R8A774B1_PD_ALWAYS_ON,
> +         PD_SCU },
> +       { "ca57-cpu0",   0x80, 0, R8A774B1_PD_CA57_CPU0, R8A774B1_PD_CA57_SCU,
> +         PD_CPU_NOCR },
> +       { "ca57-cpu1",   0x80, 1, R8A774B1_PD_CA57_CPU1, R8A774B1_PD_CA57_SCU,
> +         PD_CPU_NOCR },
> +       { "a3vc",       0x380, 0, R8A774B1_PD_A3VC,     R8A774B1_PD_ALWAYS_ON },
> +       { "a3vp",       0x340, 0, R8A774B1_PD_A3VP,     R8A774B1_PD_ALWAYS_ON },
> +       { "a2vc1",      0x3c0, 1, R8A774B1_PD_A2VC1,    R8A774B1_PD_A3VC },
> +       { "3dg-a",      0x100, 0, R8A774B1_PD_3DG_A,    R8A774B1_PD_ALWAYS_ON },
> +       { "3dg-b",      0x100, 1, R8A774B1_PD_3DG_B,    R8A774B1_PD_3DG_A },
> +};
> +
> +const struct rcar_sysc_info r8a774b1_sysc_info __initconst = {
> +       .areas = r8a774b1_areas,
> +       .num_areas = ARRAY_SIZE(r8a774b1_areas),

Given the Hardware User's Manual documents the presence of the SYSCEXTMASK
register on RZ/G2N, you want to fill in the .extmask_{offs,val} fields, too.

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
