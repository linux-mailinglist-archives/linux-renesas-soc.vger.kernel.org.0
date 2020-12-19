Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D03F2DEE91
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Dec 2020 12:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgLSLcU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 19 Dec 2020 06:32:20 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:43756 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbgLSLcT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Dec 2020 06:32:19 -0500
Received: by mail-oi1-f181.google.com with SMTP id q25so5915877oij.10;
        Sat, 19 Dec 2020 03:32:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VY5iQs1XdhMdo8fpc0q1mKuoMEvmaeqP5q2K2K+p/es=;
        b=qT2DJ4fXKe2d1Tf2kk22/0aVau4AfBs7soy+EYLQAhqBcYPva2dmOzPe6dRUBVCySb
         r7wUvyCiFQ50TzRN7wukwHtu8OBC6/AQU3DPiErCPrHhqig4FAFLmaQ/q+JvKqg2ZJDW
         shvtubEAGiPhpDI3pD80ic2PVuWvJ76aaXvY9+xQWsm1fzEC+GHfhh14Xv0zBksoZ3S5
         28NjcMkgS3SBxINvMBenqjSee1nDmJKcG3rQIw+XEwpf9U30sZ4ZM4sfllZt1wcEBzc7
         pM17oVP7NzBW+I8F6kDgt/ZI01iPvLRF1zQ5q/J7ffN6JGOO7e0huUeImAYYSFsFafaz
         CUWA==
X-Gm-Message-State: AOAM533NofPgynSTWtwTskka7SmTS/drCvshOm7RI5eEL0WDUUjWL3oi
        TqpXlV+fZca1e2/ViwGnEAjiDmjo3ggD/DGuI18=
X-Google-Smtp-Source: ABdhPJyohC3iHj3sWc6wI923TS6Motje49bM1fIi6w9jBPt5DchZIB52L+vICKSlRW4BTwzDi1I2yqTL7kf3Ef8++SQ=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr5462186oih.153.1608377499098;
 Sat, 19 Dec 2020 03:31:39 -0800 (PST)
MIME-Version: 1.0
References: <20201218125253.3815567-1-geert+renesas@glider.be> <0b3f6954-273c-d15d-94c3-a80c7df23f56@lucaceresoli.net>
In-Reply-To: <0b3f6954-273c-d15d-94c3-a80c7df23f56@lucaceresoli.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 19 Dec 2020 12:31:27 +0100
Message-ID: <CAMuHMdVg7xaxMsY3jFgFrLQB=irVp5gxBC89TLVscBs2Y-rcUg@mail.gmail.com>
Subject: Re: [PATCH] clk: vc5: Use "idt,voltage-microvolt" instead of "idt,voltage-microvolts"
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Luca,

On Fri, Dec 18, 2020 at 11:18 PM Luca Ceresoli <luca@lucaceresoli.net> wrote:
> On 18/12/20 13:52, Geert Uytterhoeven wrote:
> > Commit 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to
> > yaml") accidentally changed "idt,voltage-microvolts" to
> > "idt,voltage-microvolt" in the DT bindings, while the driver still used
> > the former.
> >
> > Update the driver to match the bindings, as
> > Documentation/devicetree/bindings/property-units.txt actually recommends
> > using "microvolt".
> >
> > Fixes: 260249f929e81d3d ("clk: vc5: Enable addition output configurations of the Versaclock")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > There are no upstream users yet, but they are planned for v5.12, so I
> > think this should be in v5.11-rc1.
> >
> > Thanks!
> > ---
> >  drivers/clk/clk-versaclock5.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
> > index c90460e7ef2153fe..43db67337bc06824 100644
> > --- a/drivers/clk/clk-versaclock5.c
> > +++ b/drivers/clk/clk-versaclock5.c
> > @@ -739,8 +739,8 @@ static int vc5_update_power(struct device_node *np_output,
> >  {
> >       u32 value;
> >
> > -     if (!of_property_read_u32(np_output,
> > -                               "idt,voltage-microvolts", &value)) {
> > +     if (!of_property_read_u32(np_output, "idt,voltage-microvolt",
> > +                               &value)) {
>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

Thanks!

> Now the example in the bindings needs the same fix. I guess you doing it
> in your "Miscellaneous fixes and improvements" v2 series, otherwise I
> can do that.

Yep, planned for v2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
