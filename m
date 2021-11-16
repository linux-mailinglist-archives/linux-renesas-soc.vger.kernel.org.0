Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4DE1452F08
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 11:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233988AbhKPK32 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 05:29:28 -0500
Received: from mail-vk1-f182.google.com ([209.85.221.182]:43921 "EHLO
        mail-vk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233807AbhKPK31 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 05:29:27 -0500
Received: by mail-vk1-f182.google.com with SMTP id f7so10893019vkf.10;
        Tue, 16 Nov 2021 02:26:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eiiYNIGtI4pGCvP2Hkjjxqji+rVM90dLAs2ei/jjzho=;
        b=XWJ/Jr1s9S6dRK1hkzLI+xB5AU8ox4Po4rII0dYO8VZhc3164s2K21gAwVCOeZ8224
         QkXLV4stCZ5FB8h9fIXtJyw8WOYydaZjTMOGZbc9J8HCUfIAS8AFClhufrUqq+DJxfBI
         IYSIYEQji8pdzIj5Zol4ZQyCeMq3fntCDLf7wa1p5QfdZWqkNAXSkPPGDD5eWBQG+Op5
         ybr/HQKm1BBSr1lXtwoCljYu+MUiUGxfUvlHfEPAliFeymmFZkA6borzO4H2oJLoBwXF
         8LXKJ3NIOdJW0G33GccwaHhH80vEE0wXRJbWSZpkyZeRNmPh4Zl6qao/SJ+v342WTTDV
         D+kA==
X-Gm-Message-State: AOAM530V0Xi3C4PNi1UBVzH6Aql+FkhH+LAF8k0hvZSxid3B0e6qRRKp
        lkJI/4Snhxw6/+CMqv40fN9D1nurXZxnJQ==
X-Google-Smtp-Source: ABdhPJwNaBC9uM1Wz0eagSciXuUeNKsFVd9FUyCfEGVhly7TOuzAf3lRPEc7wi06mvl+QSEift/a/Q==
X-Received: by 2002:a05:6122:d9d:: with SMTP id bc29mr19348412vkb.14.1637058390183;
        Tue, 16 Nov 2021 02:26:30 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id t1sm9861845vkl.56.2021.11.16.02.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 02:26:29 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id v3so41136135uam.10;
        Tue, 16 Nov 2021 02:26:29 -0800 (PST)
X-Received: by 2002:ab0:5552:: with SMTP id u18mr9140636uaa.78.1637058389381;
 Tue, 16 Nov 2021 02:26:29 -0800 (PST)
MIME-Version: 1.0
References: <20211115160600.4455-1-wsa+renesas@sang-engineering.com>
 <OS0PR01MB59220D97CD59F44918DE4FA586989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YZKz/ptgPfzqGfeq@kunai> <OS0PR01MB592241C04F5CDDB94D850FFA86989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592241C04F5CDDB94D850FFA86989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 16 Nov 2021 11:26:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUm2EG3Yi+eTZA0E9tZOT71ewkbx=yh8sVOnL207Od3Rw@mail.gmail.com>
Message-ID: <CAMuHMdUm2EG3Yi+eTZA0E9tZOT71ewkbx=yh8sVOnL207Od3Rw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH clock
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Nov 15, 2021 at 9:32 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH
> > clock
> >
> >
> > > > +      if:
> > > > +        properties:
> > > > +          compatible:
> > > > +            contains:
> > > > +              enum:
> > > > +                - renesas,rcar-gen2-sdhi
> > > > +                - renesas,rcar-gen3-sdhi
> > >
> > > What about RZ/G2L, as it has 4 clocks?
> >
> > They are a few lines above this in a seperate block if I am not confusing
> > the SoC numbering.
>
> Ah ok, I thought, since RZ/G2L using generic rcar-gen3-sdhi compatible, We need to move that
> Separate block inside this if block. With in gen3 compatible, if RZG2L then
> Max 4 clocks else Max 3 Clocks. I may be completely wrong.

But is it working?
With this series, the driver looks for the "sdh" clock, while it is
called "clk_hs" on RZ/G2L.

As the RZ/G2L part declares compatibility with the generic
rcar-gen3-sdhi compatible, it is subject to SDHI_FLAG_NEED_CLKH_FALLBACK.
In the absence of an "sdh" clock, the driver will use
clk_get_parent(clk_get_parent(priv->clk) instead.
On RZ/G2L, we have:
  SD0 -> SD0_DIV4 -> imclk
      -> clk_hs
So that will pick up SD0, which might be correct, accidentally ;-)
As quirks is not set, it will use clkh_shift = 2.

So all is good? I think we still want the driver to check for "clk_hs",
too, to avoid having to depend on the fallback.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
