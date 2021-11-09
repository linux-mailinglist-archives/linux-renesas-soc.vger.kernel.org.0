Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF90449F61
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Nov 2021 01:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241169AbhKIAUm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Nov 2021 19:20:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241154AbhKIAUl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 19:20:41 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C2CC061570;
        Mon,  8 Nov 2021 16:17:56 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id s186so48219365yba.12;
        Mon, 08 Nov 2021 16:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kv70nKReru2U0FWWfEZVZKiB4QAPq6CzVK+RIiY/Pas=;
        b=KfMuTM8gtKNwavjBrO+oz/leteZBvGcJE1qEg9uYFxdtZjI+cDiSJhu3YwaYRMe0vR
         NpH22jOvCX8ic6oH8ka484+WQxeWbaixoewVHAL4fSaEMZ7+gadvgP6kc08Px8B4mh0g
         05qd8TVsUwe6TkgcPEf+ti1tkEjOBwpIRhCawNwjaYE3nsEfr5bJBr7vUj3ewryR+9zG
         SGrvc+nJeK40600coZ1WGnNrmz4SBQMQ8xULOpZ5miIxShha3yHK2lNPDbKZ0OErg0V0
         Gjm/K4NTDQatAZ9I3a5uxrrbxZoNnElrkAnTHVbgsln/pZRA+j5uL4xatd1YxbTv/g4G
         gQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kv70nKReru2U0FWWfEZVZKiB4QAPq6CzVK+RIiY/Pas=;
        b=e4zmL0NOk2JHMp4ehYU//5C8fBYULk5R8dPSLVoo+Vlzx8Wb8NWUaDmBzpHZOhJ/CL
         oDky9NZSRRP5e7khxgW7pOiiUsU1BdZJ3VHU/G9PVWoG1Y+QJGR3YIeyQ/uYswDNZuTG
         hE7VD6OOKUiugFjxhlcBKF8hCeiZt4orSRUfcwckKR3OvzDdAUrI8z/DGO+21/frhJVz
         qRBD2xopfCueTSTnRy21YydMPmdSS8rcv5ea0mzBDgwEsXa/WUem/u5IQj8zQjrXzUGL
         b3X0R/wn/DdVLUcfC22ndTDlJaESRIVUtp9bFExxsrfGwHCrb9i/LKEe130WUfK1jsOO
         Ku3g==
X-Gm-Message-State: AOAM532eSDL3E2r6IqYtcCyRyGz1GKlkH5Vm03y2YnkxpFJznn+fQZgk
        u4Zw1sK0J/0361VLMiqERX4AY4tRikQwQsFXaqk=
X-Google-Smtp-Source: ABdhPJwObN6ajVBlMuqDsnX6vf6ZzuSvu0Hvn7GHKUzd1yOEGu3a5nNPMUk0FTfy4TUawFNCwKqbeHbJZ/NO6O1sWfE=
X-Received: by 2002:a25:dc4d:: with SMTP id y74mr3596735ybe.422.1636417076117;
 Mon, 08 Nov 2021 16:17:56 -0800 (PST)
MIME-Version: 1.0
References: <20211103173127.13701-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211103173127.13701-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXE9t5immi5WCVgPOe0dwioj3N_PGTk4Z_tWPaWtyQ6VQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXE9t5immi5WCVgPOe0dwioj3N_PGTk4Z_tWPaWtyQ6VQ@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 9 Nov 2021 00:17:30 +0000
Message-ID: <CA+V-a8vU9jKn2LBo+vVykCH2L_LqOmpXeR7XxX56_L7myi6xLw@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: serial: renesas,sci: Document RZ/G2L SoC
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.

On Mon, Nov 8, 2021 at 4:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
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
> > @@ -14,7 +14,11 @@ allOf:
> >
> >  properties:
> >    compatible:
> > -    const: renesas,sci
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - renesas,r9a07g044-sci     # RZ/G2{L,LC}
> > +          - const: renesas,sci            # generic SCI compatible UART
>
> You added a oneOf, but forgot to keep the old single compatible
> value as used on H8/300?
>
Ouch I grepped renesas,sci only in arm{64}, will fix that.

Cheers,
Prabhakar
> >
> >    reg:
> >      maxItems: 1
>
> With the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
