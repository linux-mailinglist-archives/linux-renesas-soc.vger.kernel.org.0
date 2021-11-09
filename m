Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 538C6449F95
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Nov 2021 01:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241242AbhKIAkA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Nov 2021 19:40:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbhKIAj7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 19:39:59 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9137EC061570;
        Mon,  8 Nov 2021 16:37:14 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id s186so48324980yba.12;
        Mon, 08 Nov 2021 16:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bSfeCJ2Z/X7kBSChbyDqpzm4O/dmdGm7eTZ8A/c58wk=;
        b=R+KiBS7oLE3TLSGAGsi5KEYaDb2+CqL0D7eYn6MOYLVFhfL+SPrF3sDCqsGcUZARvC
         YvbfHMZ84Fw8/GzKEeFBjwfutKtekNfMeX2q2CkEwxLSBMB3zBR3qLo9Pm5nkspAVVFj
         TzBpLIWCMoHRLhqjxOtImpMGWBVX3/VWWbhQwcw9MSoh5RwT/8K9P37q/qoZyJcr+YQR
         fSLFEctvMK3o2vROi4oEBCu5EZHiFuBd4VrC/Qq2UmNAv6e5rC9ly+eyqJq+DmILeTJi
         s6WKjj3mW1gUvRiNUt1SkNMKWASH5DVRRETUU84e/z3S7hTSkVw/aiblapjH5x324elg
         8BqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bSfeCJ2Z/X7kBSChbyDqpzm4O/dmdGm7eTZ8A/c58wk=;
        b=T6agn+l0qn5+3Uw3t76ENjG8dsFNtIHmNfbcWdzmi4/1uza8XKxaoiESdjQhYZ8nLT
         GOSObKLRHWKqX6Ed3N61CW7qTh2ctx1SB5stqc+MOXY/rMpSZz9PYf2CfVOktFLRGI3d
         ISVHbSzQhy7HYqHgI2+cXujxCBt/9mY4LxY7cwT6hc0unLGuV7QvgBAAxRdN3QfwkGRA
         6xWrM5llmHC4usByvYcPR383BLQFxjg0dLyeiSjDS69V2RabbmLhm9Yr2ZUbGRtUMDtX
         4yJi/3NShudGjUkSmb9iS5EG3kzLc6nLfoiirhdTMwe+8EeEZSIW/W2M6gCWLW1AL56/
         +poQ==
X-Gm-Message-State: AOAM530SN+q3H64xMPkcw1RkY0Zu8f4QTZQsN4Ff6lxWjUtigr33J482
        xZtiERjRqgdROzpTKVBt18MjS3vpRaYAcGlAZoPGclExztk=
X-Google-Smtp-Source: ABdhPJxplGon2xCo4mu4L8SQRbCJtXQl1XvfzXos6JHFgiXDGfe/eWF8St9CiA2jHQwbtgSVdmTpN1pqXP4PlnBMyvo=
X-Received: by 2002:a5b:783:: with SMTP id b3mr3665309ybq.328.1636418233817;
 Mon, 08 Nov 2021 16:37:13 -0800 (PST)
MIME-Version: 1.0
References: <20211103173127.13701-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211103173127.13701-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUjp4WQgkVxaSFJ-ge071KZ_JFWOuBQKZMpSCUW4kG9Ug@mail.gmail.com>
In-Reply-To: <CAMuHMdUjp4WQgkVxaSFJ-ge071KZ_JFWOuBQKZMpSCUW4kG9Ug@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 9 Nov 2021 00:36:48 +0000
Message-ID: <CA+V-a8vg8Qf+xetzNAyA2Oa9-BVUgZht=Nxw3or6GBgkVRi0Gw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: serial: renesas,scif: Make resets as a
 required property
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

Thank you for the review.

On Mon, Nov 8, 2021 at 4:29 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Wed, Nov 3, 2021 at 6:31 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Make "resets" as required property for RZ/G2L. On RZ/G2L the devices
> > should be explicitly pulled out of reset for this reason make "resets"
> > as required property.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > --- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> > +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> > @@ -151,6 +151,7 @@ if:
> >      compatible:
> >        contains:
> >          enum:
> > +          - renesas,scif-r9a07g044
> >            - renesas,rcar-gen2-scif
> >            - renesas,rcar-gen3-scif
>
> People might prefer alphabetical sort order...
>
My intention was to keep the generic ones at the end as we do for
compatible property.  Let me know if you still want me to change it.

Cheers,
Prabhakar

> >  then:
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
