Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31C503EC188
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Aug 2021 11:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237619AbhHNJLo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 Aug 2021 05:11:44 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:33460 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237547AbhHNJLn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Aug 2021 05:11:43 -0400
Received: by mail-ua1-f41.google.com with SMTP id x21so5466956uau.0;
        Sat, 14 Aug 2021 02:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nS2GBUaZJqdSBV6ll8beKF35e+BRExfjUT6JLRFqePs=;
        b=tBNuI9SKgsQi3mM0ZP8AzpH45iVU7C4OlTWaTIZnBYPGn2K+zvKPQ/C9awxCxGUvs7
         pt9pRRWd2pC6SWncHgWFISiI/wHb+PRE0i8lHvqeiifx+JhjSBQ44bHBv1TBEcIvXpw4
         fCR8er9C/AivdgtoJqAoE85t2JQ/Z21y5YWk0FFs6eZ543sHCY0goyW/RGU/J6oRzB8E
         sR861t0CfDjqxU+5B7GF7aq1d6PxzyAx/U3905r18o32AabsgB9Y0vWB/WP/iwihfNmH
         tjQ+TIFc/TXp37iFzVybJVjYIcZAzIYkogp7xnL6XYMYLAro+3RQLu4HnvLTqZmsqsad
         IVRA==
X-Gm-Message-State: AOAM530hMV+I/+ZAQAPrAMk3KSED+ZDqCyo4gtUWNvaVXW0sIINUZiIv
        Gt40yuYO5KTLyu6Z4f3sewwKo6QyD5U4V1F+VkA=
X-Google-Smtp-Source: ABdhPJwDZ92lrh+CYuLTZSHlHS4ZHH7Rm08fcznOaAAqNrX88dRPlmVucjpDawgMaoLwq6WOgO2xuYqn0lpv41Vl01E=
X-Received: by 2002:ab0:6887:: with SMTP id t7mr4505712uar.114.1628932275340;
 Sat, 14 Aug 2021 02:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210806102930.3024-1-biju.das.jz@bp.renesas.com>
 <20210806102930.3024-3-biju.das.jz@bp.renesas.com> <CAMuHMdVnU4HSXCr08WEiVmYCNoRBcdZGOfS7mwmS_euo2RZaEA@mail.gmail.com>
 <YRbSHw9X51Nif/Sd@robh.at.kernel.org>
In-Reply-To: <YRbSHw9X51Nif/Sd@robh.at.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 14 Aug 2021 11:11:03 +0200
Message-ID: <CAMuHMdXipSxTTEtiAYrZNXz6POzB9C_qaRUv+KXYtUS+DeGzug@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] ASoC: dt-bindings: sound: renesas,rz-ssi: Update
 slave dma channel configuration parameters
To:     Rob Herring <robh@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
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

Hi Rob,

On Fri, Aug 13, 2021 at 10:12 PM Rob Herring <robh@kernel.org> wrote:
> On Mon, Aug 09, 2021 at 02:57:33PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Aug 6, 2021 at 12:29 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > The DMAC driver on RZ/G2L expects the slave channel configuration
> > > to be passed in dmas property.
> > > This patch updates the example node to include the encoded slave
> > > channel configuration.
> > >
> > > Fixes: 5df6dfbb6de815ba3a("ASoC: dt-bindings: sound: renesas,rz-ssi: Document DMA support")
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > > v3->v4:
> > >  * Updated bindings as the DMAC driver on RZ/G2L expects the
> > >    slave channel configuration to be passed in dmas property.
> >
> > Thanks for the update!
> >
> > > --- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> > > +++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> > > @@ -93,8 +93,8 @@ examples:
> > >              clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
> > >              power-domains = <&cpg>;
> > >              resets = <&cpg R9A07G044_SSI0_RST_M2_REG>;
> > > -            dmas = <&dmac 0x255>,
> > > -                   <&dmac 0x256>;
> > > +            dmas = <&dmac 0x2655>,
> > > +                   <&dmac 0x2656>;
> > >              dma-names = "tx", "rx";
> > >              #sound-dai-cells = <0>;
> > >      };
> >
> > I think it would be good to describe the expected format in the description
> > for the dmas property, so the DTS writer knows what the numerical
> > values in the example really mean.
>
> Yes, but that's a property of the DMA controller binding, not this one.
> It could vary from chip to chip.

Right, unlike the other Renesas SoCs, RZ/G2L uses the normal DMAC for
audio, not an audio-specific one.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
