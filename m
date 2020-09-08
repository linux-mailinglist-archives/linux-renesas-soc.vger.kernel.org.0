Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDBEC260B96
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 09:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729003AbgIHHMF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 03:12:05 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:45750 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728562AbgIHHMF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 03:12:05 -0400
Received: by mail-ot1-f68.google.com with SMTP id g96so13993933otb.12;
        Tue, 08 Sep 2020 00:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C0V7iYdgpPN4fUYPNX5tGemHEdFaxKKFAFhDqUNkrtE=;
        b=UgHaWGokceK7hW3kYWRbRBmVgtPdZTagVQREV5r4qG9ZH3e0p8mtDRRgnMAKvV0iFA
         c74PRHZXFHW+198TiJ4DXhA5SAT/8qEMBF3SeLgraYTTv+BS5tOFux26HoAnbcGGLsOF
         ClJK/0RUQH7BXgcqgKO2sxp+W8/QcjNV4JTVW2ASmqBQlL2HK14vl1FpZicVqXM84L+s
         IW6Lj3fFvvcXD9NKwG8VQhTdISvBYtxxUTwdYkPauHh7ZckqOehkpySsN8qA7JpK7Fgp
         +Gf84yHKQkuQK/qrmoWR0pwM2P4NApUBsR4eoOsGNgXpF6WANMhIaWkdDHKqNBtMmuer
         YoZQ==
X-Gm-Message-State: AOAM533nOb9OEmYkSlqNcrm8yu4RYkVEwgLGfCocgM3a99tNd+qxL693
        FoRk3zqrF+gkTmOyB+M9hMrbGBHbx+qz0OV1l+o=
X-Google-Smtp-Source: ABdhPJyze+96GzaktHSUa5wW0UOTsqaHyeIxmAOpeZu032ahAxDRIukHSsQW5YwfM0O1DFuTFw/MQxDb9R2JP06TUV4=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr16609912otl.145.1599549124239;
 Tue, 08 Sep 2020 00:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX_be=+3soDGQBxPGvjF5Ty40wDEPaki3Z=SwbDToPA3g@mail.gmail.com> <TY2PR01MB3692F7496EE91E633E9EF68AD8290@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692F7496EE91E633E9EF68AD8290@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Sep 2020 09:11:53 +0200
Message-ID: <CAMuHMdUUqdqf0unaT5efUL-VmSD8Vh1PH69qOqiWZZFLmTGGDg@mail.gmail.com>
Subject: Re: [PATCH 02/14] dt-bindings: arm: renesas: Document Renesas Falcon boards
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Tue, Sep 8, 2020 at 3:01 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Tuesday, September 8, 2020 12:31 AM
> > On Mon, Sep 7, 2020 at 11:20 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > Add device tree bindings documentation for Renesas R-Car V3U
> > > Falcon CPU and BreakOut boards.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> > > @@ -283,6 +283,9 @@ properties:
> > >
> > >        - description: R-Car V3U (R8A779A0)
> > >          items:
> > > +          - enum:
> > > +              - renesas,falcon-cpu # Falcon CPU board (RTP0RC779A0CPB0010S)
> > > +              - renesas,falcon-breakout # Falcon BreakOut board (RTP0RC779A0BOB0010S)
> > >            - const: renesas,r8a779a0
> >
> > How is this intended to be used?
>
> I intended to use "renesas,falcon-breakout", "renesas,falcon-cpu", "renesas,r8a779a0"
> in the future. However, if so, I should fix the description like Kingfisher.
>
> > The above means its users should declare either
> >
> >     compatible = "renesas,falcon-cpu", "renesas,r8a779a0";
> >
> > or
> >
> >     compatible = "renesas,falcon-breakout", "renesas,r8a779a0";
>
> I understood it. I mistook the description...
>
> > However, falcon-cpu.dtsi has just
> >
> >     compatible = "renesas,falcon-cpu";
> >
> > Who will use "renesas,falcon-breakout"?
>
> I intended to add falcon-breakout.dtsi and the file intended to use
> "renesas,falcon-breakout" like Kingfisher + ULCB in the future.
>
> However, I realized a combination between the cpu board and
> the breakout board differs than ULCB + Kingfisher like below:
>
> - The ULCB without the Kingfisher can work.
> -- So, some .dts files exist like r8a77951-ulcb.dts.
> -- And, r8a77951-ulcb-kf.dts includes r8a77951-ulcb.dts for ULCB + Kingfisher.
>
> - The Falcon CPU board without the breakout board cannot work actually.
> -- But, on this initial patch series enables the CPU board hardware (memory nodes & SCIF0) only.
> -- The breakout board has some hardware like Ethernet and CAN.
> -- The breakout board also has some connectors for sub boards.
> -- So, I intended to add falcon-breakout.dtsi to support Ethernet in the future.
>
> In this case, I wonder if we should describe just "renesas,falcon" only
> because we will not have r8a779a0-falcon-{cpu,breakout}.dts files.
> But, what do you think?

What kind of connector does the Falcon CPU board have?
Perhaps it can be plugged into another base board, too?

What about modelling it like the iwave,g22m SoM, and the iwave,g22d
SODIMM board?
arch/arm/boot/dts/r8a7745-iwg*

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
