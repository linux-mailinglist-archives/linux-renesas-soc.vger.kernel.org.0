Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED6416494A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2020 16:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgBSP4E (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Feb 2020 10:56:04 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44012 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbgBSP4E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Feb 2020 10:56:04 -0500
Received: by mail-oi1-f195.google.com with SMTP id p125so24235983oif.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2020 07:56:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bx6vzrqE5hplAO8MNZe9jieF7dCT8kB+q/3eDNnOWhg=;
        b=dcFS092ajuUXGsRCRJNb8uQBVKYDj7SS4Xn9vyN4ILntEU1DFygPjgxPRVy8i6uC6U
         kTPQC1gaxPysVjgqfvCzHH6nmKCh2hGeszrAjORuDUTPM4arXmUo2S4xYpBd3GCnpfMr
         9MuFUQTQFebREr1D0nXUP7EOQCgxUCGFXQLVS60K/rraaQVxjlQ4wBUV6uSPqxCk2Sv6
         HEswgRZ2rktVEsJAVTrraNkKNNLMN+XjCbYYNgLregzXntMRiIdBHnzxfWF+YCpqZqCF
         DfAfiONsMWI69ngsLgpTESAXzhJzlTlsoGRFNJa2yI0Rh+nP7y+k9y5aA92ScpsYUmt/
         E33w==
X-Gm-Message-State: APjAAAUZofbKoHtND/7vwWzo8XkkqcS4inj8hBj6qbV7HEgWcFrYQAAH
        odTxIybk0kKf+QnmOSDzZ/JjQCQ7UXVX7MTG1hA=
X-Google-Smtp-Source: APXvYqzx4VtaQt/IrxTLwnLVsaRZe3wNkoH7Wpfv3AakFcZdpIu7qv6v07N8aRpr6peCmj1s+B0Pgqyce7PVieucr8U=
X-Received: by 2002:aca:c4d2:: with SMTP id u201mr5138250oif.54.1582127763970;
 Wed, 19 Feb 2020 07:56:03 -0800 (PST)
MIME-Version: 1.0
References: <20200218133019.22299-1-geert+renesas@glider.be>
 <20200218133019.22299-4-geert+renesas@glider.be> <20200219153339.GT5070@pendragon.ideasonboard.com>
In-Reply-To: <20200219153339.GT5070@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 19 Feb 2020 16:55:52 +0100
Message-ID: <CAMuHMdUjVqC=AsNjO1icMyNRrdeMVed_HxMzn6HY=fRt+LvUwQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: rcar-gen3: Add reset control
 properties for display
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Wed, Feb 19, 2020 at 4:33 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Feb 18, 2020 at 02:30:18PM +0100, Geert Uytterhoeven wrote:
> > Add reset control properties to the device nodes for the Display Units
> > on all supported R-Car Gen3 SoCs.  Note that on these SoCs, there is
> > only a single reset for each pair of DU channels.
> >
> > The display nodes on R-Car V3M and V3H already had "resets" properties,
> > but lacked the corresponding "reset-names" properties.
> >
> > Join the clocks lines while at it, to increase uniformity.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> > @@ -2503,10 +2503,11 @@
> >                       interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> >                                    <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
> >                                    <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
> > -                     clocks = <&cpg CPG_MOD 724>,
> > -                              <&cpg CPG_MOD 723>,
> > +                     clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>,
> >                                <&cpg CPG_MOD 721>;
> >                       clock-names = "du.0", "du.1", "du.3";
> > +                     resets = <&cpg 724>, <&cpg 722>;
> > +                     reset-names = "du.0", "du.3";
>
> I wonder if this should be du.2, especially given that 722 corresponds
> to the non-existing DU2 channel. It's a bit of a mess at the hardware

Just following the bindings: "du.3" is the lowest channel that is affected
by the reset.

> level :-S

Note that supporting R-Car H3-N will make your^H^H^H^Hthe rcar-du device
driver writer's life even more miserable, as suddenly there is no longer
a DU2, while the single unified Display Unit node prevents the DTS
writer from not setting the DU2's status to "okay" in the board DTS
file. But you might look at the ports submode?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
