Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 258AC44E637
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 13:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234818AbhKLMUs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 07:20:48 -0500
Received: from mail-vk1-f173.google.com ([209.85.221.173]:46022 "EHLO
        mail-vk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234811AbhKLMUs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 07:20:48 -0500
Received: by mail-vk1-f173.google.com with SMTP id m19so213047vko.12;
        Fri, 12 Nov 2021 04:17:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KS2sKiDr9po7riufi5pMSwEWAne4JUDpYMGieP7r2Lg=;
        b=7BjBloGsD6wSFzTVX4bjJT87mUYDfdpASipKZ+OwsIXIcA4dzX3iyL+rebzXkuO76+
         2BSehMFSvR62rwQeTTFFy58ZH+/yLtajRNiq2hrm2oYl47PgC0YeugsuGzkmXXgY8I06
         MfvgQ0eC6/1DGtJAPJF8IO/Et2jxUB8wKRDz1q8J2z3+m2mpoBOSeD+Mgwp4bD4Z8JBK
         SgUtSktRygqZ0o+iNS5TqbPQ5lJe6aeOe55jHfs+dCZ8lss3OUr7U9ANFC2fMDZjl0pY
         BQ9CWvsHCYUYOkN486bHOt1K+/o893t7h5t1HB6u1ikC9wyljGq4ZZQ3G2ytuynBi2jz
         oNyA==
X-Gm-Message-State: AOAM533FyPviL14ENF1HOOdX8l1ZwOJ09kNqxRwwDVKnxkEsk0sJIRfv
        52HB4rztl5goaWhcdMSw+P6nJOHVIZonzw==
X-Google-Smtp-Source: ABdhPJzxSaWSWU+HZ2fG6cLQ1m0tcFyVXKy3FfYhOEVPj99aERN4QGYja2kGTUf/Pro+SDBoUBls6w==
X-Received: by 2002:a1f:d0c4:: with SMTP id h187mr22750377vkg.1.1636719476807;
        Fri, 12 Nov 2021 04:17:56 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id e9sm4165619uan.9.2021.11.12.04.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 04:17:56 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id e10so18436964uab.3;
        Fri, 12 Nov 2021 04:17:56 -0800 (PST)
X-Received: by 2002:ab0:15a1:: with SMTP id i30mr21935808uae.122.1636719476202;
 Fri, 12 Nov 2021 04:17:56 -0800 (PST)
MIME-Version: 1.0
References: <20210817090313.31858-1-biju.das.jz@bp.renesas.com>
 <20210817090313.31858-3-biju.das.jz@bp.renesas.com> <CAMuHMdVXpn7X3Tm_ouq6DVUDP4mxMO8EObFjtfEU4pX6sodo9A@mail.gmail.com>
 <YY5WZ1r10EphBJEZ@shikoro>
In-Reply-To: <YY5WZ1r10EphBJEZ@shikoro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 13:17:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUbU5NX7Zpd=oSmizCwpOVEn6Ojnfw85uBET78HUsDFCw@mail.gmail.com>
Message-ID: <CAMuHMdUbU5NX7Zpd=oSmizCwpOVEn6Ojnfw85uBET78HUsDFCw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: mmc: renesas,sdhi: Document RZ/G2L bindings
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Fri, Nov 12, 2021 at 12:56 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +            - description: IMCLK, SDHI channel main clock1.
>
> Sounds like "core"
>
> > > +            - description: IMCLK2, SDHI channel main clock2. When this clock is
> > > +                           turned off, external SD card detection cannot be
> > > +                           detected.
>
> "cd"
>
> > > +            - description: CLK_HS, SDHI channel High speed clock which operates
> > > +                           4 times that of SDHI channel main clock1.
>
> "clkh" compared to the Gen3 bindings to me.
>
> > > +            - description: ACLK, SDHI channel bus clock.
>
> This I don't understand. The CPG-MSSR clock?

RZ/G2L has more fine-grained control of module clocks.
On e.g. R-Car SoCs, there is a single "MSTP" bit to disable "the"
module clock, but in practice it may control multiple clock inputs
to a module.  The actual clock tree is not documented, so we model
this as a single module clock.  So probably the MSTP bit controls
both the main channel clock and the bus clock.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
