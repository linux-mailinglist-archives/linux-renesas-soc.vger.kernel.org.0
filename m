Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0844572B9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 17:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236365AbhKSQWk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Nov 2021 11:22:40 -0500
Received: from mail-ua1-f42.google.com ([209.85.222.42]:34355 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234650AbhKSQWk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 11:22:40 -0500
Received: by mail-ua1-f42.google.com with SMTP id n6so22367339uak.1;
        Fri, 19 Nov 2021 08:19:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oXJ8b4UJXP3bxjRNXZDIaiKXPClCEL/4bLUcBV0dHUU=;
        b=AoTBCL1/5aAyx0k8rWF8L1SMK7ch87wV1E14Ms+qpq+mX/AU9+FoNabEi/ya6ofmsS
         qj2NK0oMI0rRcFvi0U9plsXmPIK19mo/+SERaxxJhJeEvd2VqH0LJXG/U8LtVwejb689
         smGCSfNnI2q79Uwa5q+kK8iiS+75DCxeoAohzA1PrhHa6cBJ42PlI9nOfyLVv5IbdV5b
         nDTGhDXkL3JPWcTSYQW9tVDodjRmoLz0vPiuq0GwrcWpN54bXf3Uay02GbUfIKBhQN8l
         nlwC4wGzeYWxikvPYNa9lFvE1qfKpjeEYG+nrA05XV6As3Tim9BCzgwAR/XcTTANWa3N
         1gWA==
X-Gm-Message-State: AOAM530zuNURTi01uS5RFmyM0PlOm/xX0ReVisXURnuK4HUT2SSVFybt
        r6HSQq9c7J5cf9C9SUJTV6yOOphuzARxlQ==
X-Google-Smtp-Source: ABdhPJxQTx9QIPIyV1pu17c5wbPF0DBlaSbIh9mEiESRSOHDrVC520jFtFtWjyl8cdJhA0P55ypaEw==
X-Received: by 2002:a67:c982:: with SMTP id y2mr93749063vsk.15.1637338777384;
        Fri, 19 Nov 2021 08:19:37 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id e7sm113819vkn.20.2021.11.19.08.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 08:19:37 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 84so6184281vkc.6;
        Fri, 19 Nov 2021 08:19:36 -0800 (PST)
X-Received: by 2002:a05:6122:50e:: with SMTP id x14mr120320183vko.7.1637338776791;
 Fri, 19 Nov 2021 08:19:36 -0800 (PST)
MIME-Version: 1.0
References: <20211119123710.31575-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <e51e2a73-1fd4-d3cd-8973-f7e94ae5027f@omp.ru>
In-Reply-To: <e51e2a73-1fd4-d3cd-8973-f7e94ae5027f@omp.ru>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 Nov 2021 17:19:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV7EhGyfSYYvZTd-HE+5_wuesH5P8zD6Hakkf8W1F2FyA@mail.gmail.com>
Message-ID: <CAMuHMdV7EhGyfSYYvZTd-HE+5_wuesH5P8zD6Hakkf8W1F2FyA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzg2l-smarc-som: Enable serial NOR flash
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
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

Hi Sergey,

On Fri, Nov 19, 2021 at 5:10 PM Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
> On 19.11.2021 15:37, Lad Prabhakar wrote:
> > Enable mt25qu512a flash connected to QSPI0.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >   .../boot/dts/renesas/rzg2l-smarc-som.dtsi     | 40 +++++++++++++++++++
> >   1 file changed, 40 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> > index 7e84a29dddfa..e53c17954566 100644
> > --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> > @@ -178,6 +178,18 @@
> >               line-name = "gpio_sd0_pwr_en";
> >       };
> >
> > +     qspi_pins0: qspi0 {
>
>     Not qspi0_pins:?

It's a subnode of "pfc", and all other subnodes don't have a "_pins"
suffix. Same for the other boards.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
