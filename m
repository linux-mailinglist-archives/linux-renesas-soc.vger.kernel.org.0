Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A26044532CE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 14:23:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236693AbhKPN0A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 08:26:00 -0500
Received: from mail-ua1-f54.google.com ([209.85.222.54]:41791 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236677AbhKPNZ7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 08:25:59 -0500
Received: by mail-ua1-f54.google.com with SMTP id p37so40681818uae.8;
        Tue, 16 Nov 2021 05:23:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qq30ZvHhAUE9tjBo3Ks46+0YOGtcMfqT3aH2MJtX00A=;
        b=lmuCHzj46P8+yig4/zx429LQbHrz0Yl6Re1x2qW0UmK7Cjo7J5h3tLKakrC79eGwZ0
         Sde08mNi9bvG1gdxFEoYfFexXivaHoZx7tfrv4bQvix/Q61idEEWdiq84WvuJw92wFk5
         InFw91+zXaj6eP8Qs26kC1WoZQa89vClgPCQvEy4DoDyRkpZypBoSLOgrjRjMDF+9s4l
         NQo3vp51N8UJAnqgyFGg3lCJcdsNrXEaMuWiq05zxDO6XgG0f/eIPlVcD4gC6QYe0n6L
         xM5Qi/FgNINftYGIDcPGgm3jdD6WgSjnHqQAefyFBuvmxbIYxOJLONVY/tShYQ0IDJ4H
         DTeg==
X-Gm-Message-State: AOAM530q3rgzBjK1cm8VcW1VcgN99n9lLn0zEqchY5baALXCz+20dP1G
        GKwUl8OiIb/qNo25/eWmItzfQdrQzf7tfw==
X-Google-Smtp-Source: ABdhPJxd4O+frM4ybv+SL2vKycq3K7AwHSicw6jxtBusXqoxRvdISIQSoKIAjwodRnMCyCrwagC2Ng==
X-Received: by 2002:ab0:3813:: with SMTP id x19mr10875319uav.56.1637068982065;
        Tue, 16 Nov 2021 05:23:02 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id t132sm289787vkb.19.2021.11.16.05.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 05:23:01 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id p2so42316858uad.11;
        Tue, 16 Nov 2021 05:23:01 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id cz16mr55390592vsb.9.1637068981503;
 Tue, 16 Nov 2021 05:23:01 -0800 (PST)
MIME-Version: 1.0
References: <20211115160600.4455-1-wsa+renesas@sang-engineering.com>
 <OS0PR01MB59220D97CD59F44918DE4FA586989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YZKz/ptgPfzqGfeq@kunai> <OS0PR01MB592241C04F5CDDB94D850FFA86989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUm2EG3Yi+eTZA0E9tZOT71ewkbx=yh8sVOnL207Od3Rw@mail.gmail.com> <OS0PR01MB5922A978B55C09B9E754DBD486999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922A978B55C09B9E754DBD486999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 16 Nov 2021 14:22:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWVB_7U0R5hkO7eEkzdkmhwCEFstskvXJgO-dU1hog=+A@mail.gmail.com>
Message-ID: <CAMuHMdWVB_7U0R5hkO7eEkzdkmhwCEFstskvXJgO-dU1hog=+A@mail.gmail.com>
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

On Tue, Nov 16, 2021 at 12:26 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH
> > clock
> > On Mon, Nov 15, 2021 at 9:32 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > > Subject: Re: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional
> > > > SDnH clock
> > > >
> > > >
> > > > > > +      if:
> > > > > > +        properties:
> > > > > > +          compatible:
> > > > > > +            contains:
> > > > > > +              enum:
> > > > > > +                - renesas,rcar-gen2-sdhi
> > > > > > +                - renesas,rcar-gen3-sdhi
> > > > >
> > > > > What about RZ/G2L, as it has 4 clocks?
> > > >
> > > > They are a few lines above this in a seperate block if I am not
> > > > confusing the SoC numbering.
> > >
> > > Ah ok, I thought, since RZ/G2L using generic rcar-gen3-sdhi
> > > compatible, We need to move that Separate block inside this if block.
> > > With in gen3 compatible, if RZG2L then Max 4 clocks else Max 3 Clocks. I
> > may be completely wrong.
> >
> > But is it working?
> > With this series, the driver looks for the "sdh" clock, while it is called
> > "clk_hs" on RZ/G2L.
> >
> > As the RZ/G2L part declares compatibility with the generic rcar-gen3-sdhi
> > compatible, it is subject to SDHI_FLAG_NEED_CLKH_FALLBACK.
> > In the absence of an "sdh" clock, the driver will use
> > clk_get_parent(clk_get_parent(priv->clk) instead.
> > On RZ/G2L, we have:
> >   SD0 -> SD0_DIV4 -> imclk
> >       -> clk_hs
> > So that will pick up SD0, which might be correct, accidentally ;-) As
> > quirks is not set, it will use clkh_shift = 2.
> >
> > So all is good? I think we still want the driver to check for "clk_hs",
> > too, to avoid having to depend on the fallback.
>
> I have added below piece of code and tested clk_hs. It works ok.
>
> Can we change the binding to update to use "clkh" instead of "clk_hs" for RZ/G2L?, so that we don't need
> below code change in driver. Any way it is optional.

Fine for me.
Should we also rename imclk2 to cd?

Note that on RZ/G2L, it will be handled by Runtime PM regardless.

> +
> +       if(!priv->clkh) {
> +               priv->clkh = devm_clk_get_optional(&pdev->dev, "clk_hs");
> +               if (IS_ERR(priv->clkh))
> +                       return dev_err_probe(&pdev->dev, PTR_ERR(priv->clkh), "cannot get clk_hs");

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
