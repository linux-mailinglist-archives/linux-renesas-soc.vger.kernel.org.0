Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D748449F67
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Nov 2021 01:20:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241183AbhKIAWu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Nov 2021 19:22:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231793AbhKIAWt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 19:22:49 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C800CC061570;
        Mon,  8 Nov 2021 16:20:04 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id u60so32439992ybi.9;
        Mon, 08 Nov 2021 16:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q+19nBfRNpo6Y86z6kv2X8Ob+JQpejAbhm0Zous8mTU=;
        b=R+/Wz1haZE62GVuxS8p7cIkyS8jnoxqDJp8QL12goFC2bfXvbr5rl75Xku0ANNZVi7
         6EIrEpyKeRklDQV6B+zlbiDyIpyG5j0nDbSJKQRBZX7ZOZfOcbNU1T5GpQXGxu8532Rq
         bQdwzrh5xx2xj2vk3WPmdNxOdafMVnTBjzVowEJlm67rdFjIQq+nejSSr04nUFiNWJDy
         5lYkXjOFzsbhrq9c8MzK8F/v9mgIUDu0cgT49f8CD+ujudwLc0Vs2lOebMgecDd/omOy
         f+SnW4LGtgcp+6N9OHvOGRKUTAbQpAbvXi6WKtVnWc1uhg4HvTFeICTwHSbLdpBiYS5W
         Zk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q+19nBfRNpo6Y86z6kv2X8Ob+JQpejAbhm0Zous8mTU=;
        b=wLTg+Tm7oLAHFHXjrunj1uOhDLXgNJEGMICeG73djvxLPG7Ri2lovBGhH+8mGtBv09
         qRFbv3w57qgLPJypywofzvGahRcXSysKbP1zlop4LV0Usdl3Nt+oO/zyN4thuwxe02sx
         IFuwASH1GsZP9f5u8gNFqvFYI/ZeTqgAmp0AujfBu9Y785Mj3tIBONaI5+QMJ9LOCDcf
         phSziOes5j1X5+kL0JtMNy/EkPeuGqeFo4MplsOZt0o5ikVZR5vfSN9/gBIGTtSeiOSa
         DVnXcmAyQKOTDHndFnx3Vvf1wYqj/mhUhwE0OfJZEIobChWQZjfNHMDdc5j+6xuKzRT2
         KlsA==
X-Gm-Message-State: AOAM532GtfavJifX0sle2VZJ2XpMiYfnI6ihisECEHnxqILw7BW/oVdo
        /Usrx02m8MXK8dDOj9IIHv/GfFEuRbNjNysfe6s=
X-Google-Smtp-Source: ABdhPJzlF0V0/9y5SlEu+hDsVSOHPsuoD0CYtV+k4hHykhk9iSkqUCRHR+uL8N74nP+LrZ3xp7QgEGcOz9NZDMEoC5M=
X-Received: by 2002:a25:c792:: with SMTP id w140mr3781812ybe.131.1636417204107;
 Mon, 08 Nov 2021 16:20:04 -0800 (PST)
MIME-Version: 1.0
References: <20211103173127.13701-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211103173127.13701-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUPYYfPu7NDE2uh9woP7p6_53XinASH-=USG5qwN2m=hA@mail.gmail.com>
In-Reply-To: <CAMuHMdUPYYfPu7NDE2uh9woP7p6_53XinASH-=USG5qwN2m=hA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 9 Nov 2021 00:19:38 +0000
Message-ID: <CA+V-a8t+Kb2dN8zDV9LNOfiQX=1JnsJnFPdCbV0iEZDF5rqhtw@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: serial: renesas,sci: Document RZ/G2L SoC
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Mon, Nov 8, 2021 at 4:21 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Wed, Nov 3, 2021 at 6:31 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add SCI binding documentation for Renesas RZ/G2L SoC.
> >
> > Also update the example node with real world DT node.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> > --- a/Documentation/devicetree/bindings/serial/renesas,sci.yaml
> > +++ b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
>
> > @@ -54,18 +58,45 @@ required:
> >    - clocks
> >    - clock-names
> >
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - renesas,r9a07g044-sci
> > +then:
> > +  properties:
> > +    resets:
> > +      maxItems: 1
> > +
> > +    power-domains:
> > +      maxItems: 1
> > +
> > +  required:
> > +    - resets
> > +    - power-domains
>
> We really should make interrupt-names required everywhere, after
> fixing the H8/300 DTS files.
>
Agreed, also in other scif*.yaml files this needs fixing.

Cheers,
Prabhakar

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
