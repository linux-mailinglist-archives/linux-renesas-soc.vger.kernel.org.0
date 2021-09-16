Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA99640D34E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Sep 2021 08:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234469AbhIPGgx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Sep 2021 02:36:53 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:43961 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234452AbhIPGgx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Sep 2021 02:36:53 -0400
Received: by mail-ua1-f41.google.com with SMTP id 88so2296646uae.10;
        Wed, 15 Sep 2021 23:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5ufQKAz6TkeaaXRuN+J6DP1tCLLuwEwO4m7kYP4z4hg=;
        b=qZo580KVjR9qphIbe3LMhxss/PkRY+NMy9yBphXST3qObZLBHP677SvYuWgC7A1v1g
         zsyC37rb935IwBJejLH5fxs3NNNP9gH11FXrBopFBCpInx+Owlbr2EjSFy0bp7SVI2DM
         79aDAnp01pYqEgelA4Hh5xGL8clrQNRe28N1qGwvptKCObhbYCJylHSdaV97svwcAhgD
         5isBvmcubnwpzRUt07NoevBIH0IAt9gJjMXx0N+W0iX2hbai+Kw7HB2Zebz37zfwpA1/
         R2Ux8x3HHKsRfFCdkw9VKjeCO6pUyMp5eK5nSWLewPztahK/vUHuniMURrs4BXXd/IFp
         jRQg==
X-Gm-Message-State: AOAM530J6uLXe8hfUMNrQAIzb0bMvi+FqrKZvtr58PChsbpgQcRgBbXr
        SrvYxwvszl24qGnqx3epnc7py94KoclFvGwq5AXgaonR
X-Google-Smtp-Source: ABdhPJxyAlbGcHh3eAvZUQ9TihAg6jzEEwczrnrEDobUZvqo2TcpiRYPBqzTIaed4L3puMyDGDJ39exG5n+Wt034b4Y=
X-Received: by 2002:ab0:6dc7:: with SMTP id r7mr2973997uaf.14.1631774131988;
 Wed, 15 Sep 2021 23:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <29de13c075b839ed62cee189b6eb262e540c6553.1631707026.git.geert+renesas@glider.be>
 <dbc3f4bf-78cd-fb97-2502-ab87f9881179@fi.rohmeurope.com>
In-Reply-To: <dbc3f4bf-78cd-fb97-2502-ab87f9881179@fi.rohmeurope.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Sep 2021 08:35:20 +0200
Message-ID: <CAMuHMdVSeysg9ojCcst3AS5d_eZE+Ge34THK_=ouZ7gJGxELqQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mfd: bd9571mwv: Convert to json-schema
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Matti,

On Thu, Sep 16, 2021 at 8:31 AM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
> On 9/15/21 15:14, Geert Uytterhoeven wrote:
> > Convert the ROHM BD9571MWV/BD9574MWF Power Management Integrated Circuit
> > (PMIC) Device Tree binding documentation to json-schema.
> >
> > Make the "regulators" subnode optional, as not all users describe the
> > regulators.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> > I have listed Marek as the maintainer, as he wrote the original
> > bindings.  Marek: Please scream if this is inappropriate ;-)
> >
> > v2:
> >    - Add Reviewed-by.
> > ---
> >   .../devicetree/bindings/mfd/bd9571mwv.txt     |  69 ----------
> >   .../bindings/mfd/rohm,bd9571mwv.yaml          | 127 ++++++++++++++++++
> >   2 files changed, 127 insertions(+), 69 deletions(-)
> >   delete mode 100644 Documentation/devicetree/bindings/mfd/bd9571mwv.txt
> >   create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd9571mwv.yaml
> > +                  regulators {
> > +                          dvfs: dvfs {
> > +                                  regulator-name = "dvfs";
> > +                                  regulator-min-microvolt = <750000>;
> > +                                  regulator-max-microvolt = <1030000>;
> > +                                  regulator-boot-on;
> > +                                  regulator-always-on;
> Out of the curiosity (and in order to learn) - what is the exact idea of
> the 'regulator-boot-on' and when it should be used? I _think_ the
> 'regulator-boot-on' is in many cases used to make the regulator
> framework to enable the regulator at start-up. What I _think_ the
> 'regulator-boot-on' is intended for is to advertise the regulator
> boot-up state for regulators which do not provide a way to get the
> state. I am unsure if there is any property which is intended to be used
> for enabling the regulator at start-up. DISCLAIMER: Source of these
> thoughts is unknown. I may be wrong here. If someone knows this for sure
> I'd be grateful for any education :) If I am not mistaken the dvfs
> regulator does provide a way of reading the enable state after boot.
>
> Finally, I have seen this quite many times before but I am unsure I
> understand it - why setting both the 'regulator-boot-on' and
> 'regulator-always-on'? Wouldn't the 'regulator-always-on' suffice?
> > +                          };
> > +                  };
> > +          };
> > +    };
> >
>
> Anyways - as I mentioned, I am not 100% sure of pretty much anything :)
> Hence my questions are just questions - and the binding looks good to me.

I have to defer to the regulator experts to answer those questions...

> FWIW:
> acked-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

s/a/A/

Thank you!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
