Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46D6B2404D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 12:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgHJKfi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 06:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbgHJKfh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 06:35:37 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67EF1C061756;
        Mon, 10 Aug 2020 03:35:37 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id a34so4874965ybj.9;
        Mon, 10 Aug 2020 03:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1EybH9wbQy4mO2vt6lzN7Vrc2o0dnsrjSRnczK3afhk=;
        b=ql9nfHDIXvPzRo6BqJuftyl9vZdyc2pY8NddWOOzKoJUrS2iigiHqtfq7PwvsuTsZj
         GGqALwj8+bWtOCp6lKh+cLbVWRic0oX8e+hzRsCNtgiKrFMt7I+yEq13q0M32E47IjMH
         odPtlARDQQVqtWS5wRaHcRLpCxnQOSvkKm3In5F3hBV9pvyjhlIaLPwZMZiigp09BnLO
         fc379WrDRe869rkFmDls2rvY/Fsn4/cndyqC/0JDBFxPzTVqDaUSqKLmptIyk8jKLsQJ
         NwSdKo+9trDaNtNw2iFtHN/S9Ub/JwuCYlQjzAROMoLNjsgwLfcSYR4QTq/QK07QUbHw
         WLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1EybH9wbQy4mO2vt6lzN7Vrc2o0dnsrjSRnczK3afhk=;
        b=lWl0ixuht2azzBr1hMrHHEK+SKd71oQ63hbCtcERjGch/wi0YrGH0idWK9FoN74vA6
         ayQcwK1bZxrNQxF41pF48jq6NlSVEESCdjQjW0YK/jbp64IL2v1VxD49+41JL5QWfIzC
         LxplBj+j/SD2RYjPuPZ0FVUHt5XJamDpFuEZ+tZ3xIungdy+syRyxbPy/2E9zWo/5uTy
         Zc4M3gW8xuZ7ccTMwNqcSjyRE7PTrpp3vpx27e0koIFgEj6oX8NM1I8d6DKWM6B6JwR+
         xxOFC932fX+rGaCEKFaH8R/ATUCppuz5eyqrIIWXj9LH6aTb/c59CTtX2j31UrB+AH9f
         qDQQ==
X-Gm-Message-State: AOAM533qQw8aL6RwJzJsREiPBK3nK/fyddHsYGD70XddyosfF8qk0U6i
        Y+XOSvuTeHeEIL0soHH4R9BliJVmGfITDAmeTv8=
X-Google-Smtp-Source: ABdhPJyvQ7P8sYbiS8LPxHzeimpJrb76KiAlFlZXMVJEgex+WAdQFrcSYFVxG+scUu8pHuwS/usrX8q1/7CzxwLmuO0=
X-Received: by 2002:a25:c743:: with SMTP id w64mr36285444ybe.127.1597055736618;
 Mon, 10 Aug 2020 03:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200810092208.27320-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200810092208.27320-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUiRHEYnL-7mbYKVDESBcDbEeCzNYGeamEAie+bYh_Fug@mail.gmail.com>
In-Reply-To: <CAMuHMdUiRHEYnL-7mbYKVDESBcDbEeCzNYGeamEAie+bYh_Fug@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 10 Aug 2020 11:35:09 +0100
Message-ID: <CA+V-a8skEg0VRPJkOQFdcU5wraFp0E5Z55T0QVofuAjLauTerg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a774e1: Add VSP instances
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.

On Mon, Aug 10, 2020 at 11:29 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Aug 10, 2020 at 11:22 AM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> >
> > The RZ/G2H (R8A774E1) has 6 VSP instances.
> >
> > Based on the work done for r8a7795 SoC.
> >
> > Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> > @@ -2374,6 +2374,72 @@
> >                         status = "disabled";
> >                 };
> >
> > +               vspbc: vsp@fe920000 {
> > +                       compatible = "renesas,vsp2";
> > +                       reg = <0 0xfe920000 0 0x8000>;
> > +                       interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 624>;
> > +                       power-domains = <&sysc R8A774E1_PD_A3VP>;
> > +                       resets = <&cpg 624>;
> > +
> > +                       renesas,fcp = <&fcpvb1>;
> > +               };
> > +
> > +               vspbd: vsp@fe960000 {
> > +                       compatible = "renesas,vsp2";
> > +                       reg = <0 0xfe960000 0 0x8000>;
> > +                       interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 626>;
> > +                       power-domains = <&sysc R8A774E1_PD_A3VP>;
> > +                       resets = <&cpg 626>;
> > +
> > +                       renesas,fcp = <&fcpvb1>;
>
> According to "FCPVB0 (for VSPBD): H' FE96_F000", this should be
>
>     renesas,fcp = <&fcpvb0>;
>
> ? If you agree, I can fix that while applying.
>
Agreed should be fcpvb0, thank you for taking care of it.

Cheers,
Prabhakar

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v5.10.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
