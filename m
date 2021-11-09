Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 828DA44AA00
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Nov 2021 10:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244666AbhKIJGB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Nov 2021 04:06:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244675AbhKIJFq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Nov 2021 04:05:46 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF56C061764;
        Tue,  9 Nov 2021 01:03:00 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id a129so51148823yba.10;
        Tue, 09 Nov 2021 01:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fkY1X+XuWwRQxh3Iw6z/z5kHVKdaGmVPBbbJBkq6Smo=;
        b=li1eRBz1bDvEGo8G5EKrdUxULljEOEdjZG/cI+H0BmdNo9OYe6Oc9GPfLW0hAP6H66
         llYYrA6jlK5SFSyVLBC4YpEuBq2G8A3HaS47HK/+mg35x8XEXA02aGT18h1x5IkUgEv5
         9oNyv8TQwrhha4DiJNZRT0IgRo3AzOp66gQL6F/cyZweq4RePu5JQG86qmoooJGm9ggZ
         ANHmv9lenS2snSio63Zdqq7XZ2StaB8lJqKo1PZk+fwwdG5mc/bXRZciQp9OpMTH9RV9
         iHD4hjIjcLCq+tzZijhzDt10lpUtHEX6FAejWmPffa3NIiaFgoXub0qws8TfETjIC3lp
         4b7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fkY1X+XuWwRQxh3Iw6z/z5kHVKdaGmVPBbbJBkq6Smo=;
        b=FTA5Jc9X37WvY/u9NTwkbknLnGcPUcvZr76JEPNLEFa74WmncPTGD9CQqVaTEGdXcw
         Sk+O0eVSVAF32zpXeCh8DqUIawFqtwxfFFenep5LNw52XlRn2Yx/xE53niwVDptOe3Xr
         OuuwqE7IlwZvMjWsrSZCAfgn5JfLBw9brQwq8nEIeb61qBDdn5TeNLUlCkz3bCfLfK07
         nG7nuGrPf9zfTOxCfmFYTJtZ0GDkzobllqp5NFTwgVtjiXCyUTa59SEfs+WVzy6uK+kF
         yij7jsHxCUcoFfhMhL9o8tu4g60LqztKNV7QqJYQ4NMTVLRZZ9Djj8eU4pN4dF3Tf6YK
         JbEw==
X-Gm-Message-State: AOAM533fU6L1VrJWd/MgAoFrZuEMxPxpwTIO9w9V0yKQUpIZWepw2Xtq
        LWCMXQDQ9lyetPCqSJss7wBo6FKEcbvRCAf7l9o=
X-Google-Smtp-Source: ABdhPJy20qCQifzfZQwscpU28VBySc+BGf4KGxpW9jhd3euz3a7NH9pCw3kfZGJlWKjBJzG/zn3wH3iJXbX8Fp4dOp0=
X-Received: by 2002:a25:1c02:: with SMTP id c2mr6886720ybc.218.1636448580078;
 Tue, 09 Nov 2021 01:03:00 -0800 (PST)
MIME-Version: 1.0
References: <20211103173127.13701-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211103173127.13701-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWLfUNh7PQWpARS6CNymqpGO_29tgy7NLtgmJ-BRgyUaA@mail.gmail.com>
 <CA+V-a8sLuZUC=Xfce5CzJ3jbszGjK00r6wLGc1n-xWgFDBuqPA@mail.gmail.com> <CAMuHMdWOQq=avCqAU5t+gKqdb5FMRZB2hz7fVNmtgWK8Yp3iWg@mail.gmail.com>
In-Reply-To: <CAMuHMdWOQq=avCqAU5t+gKqdb5FMRZB2hz7fVNmtgWK8Yp3iWg@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 9 Nov 2021 09:02:34 +0000
Message-ID: <CA+V-a8u-K3LHaT6M1iipEc_xaqS6O1KJni7dJmH=_oooOq7dDg@mail.gmail.com>
Subject: Re: [PATCH 3/3] serial: sh-sci: Add reset support for RZ/G2L SoC
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
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, Nov 9, 2021 at 7:50 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Nov 9, 2021 at 1:34 AM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Mon, Nov 8, 2021 at 4:40 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Wed, Nov 3, 2021 at 6:31 PM Lad Prabhakar
> > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > On RZ/G2L devices should be explicitly pulled out of reset for it
> > > > to work. This patch adds support to read the "resets" property and
> > > > performs deassert/assert when required.
> > > >
> > > > Also, propagate the error to the caller of sci_parse_dt() instead of
> > > > returning NULL in case of failure.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Thanks for your patch!
> > >
> > > > ---
> > > > Hi Geert,
> > > > For handling the resets I was in dual mind whether to perform
> > > > reset based on compatible strings or soc-id, let me know your
> > > > thoughts. Currently no SoC's use "renesas,sci" so using the same
> > > > for performing the reset operation for SCI.
> > >
> > > We do, on H8/300.
> > >
> > Missed that.
> >
> > > > --- a/drivers/tty/serial/sh-sci.c
> > > > +++ b/drivers/tty/serial/sh-sci.c
> > > > @@ -3203,23 +3204,58 @@ static const struct of_device_id of_sci_match[] = {
> > > >  };
> > > >  MODULE_DEVICE_TABLE(of, of_sci_match);
> > > >
> > > > +static void sci_reset_control_assert(void *data)
> > > > +{
> > > > +       reset_control_assert(data);
> > > > +}
> > > > +
> > > >  static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
> > > >                                           unsigned int *dev_id)
> > > >  {
> > > >         struct device_node *np = pdev->dev.of_node;
> > > > +       const struct of_device_id *of_id;
> > > >         struct plat_sci_port *p;
> > > >         struct sci_port *sp;
> > > >         const void *data;
> > > >         int id;
> > > >
> > > >         if (!IS_ENABLED(CONFIG_OF) || !np)
> > > > -               return NULL;
> > > > +               return ERR_PTR(-EINVAL);
> > > > +
> > > > +       of_id = of_match_device(of_sci_match, &pdev->dev);
> > > > +       if (!of_id)
> > > > +               return ERR_PTR(-EINVAL);
> > > >
> > > > -       data = of_device_get_match_data(&pdev->dev);
> > > > +       if (!strcmp(of_id->compatible, "renesas,scif-r9a07g044") ||
> > > > +           !strcmp(of_id->compatible, "renesas,sci")) {
> > >
> > > This will match on H8/300, too, which doesn't have resets.
> > > Please match against "renesas,sci-r9a07g044" instead.
> > >
> > > Please don't use explicit strcmp() calls here, but add a flag to
> > > of_sci_match[].data.
> > >
> > Agreed, does the below hunk look good for handling the reset?
> >
> > -#define SCI_OF_DATA(type, regtype)     (void *)((type) << 16 | (regtype))
> > +#define SCIx_RESET                             BIT(31)
> > +#define SCI_OF_DATA(type, regtype, reset)      (void *)(reset |
> > (type) << 16 | (regtype))
> >  #define SCI_OF_TYPE(data)              ((unsigned long)(data) >> 16)
> >  #define SCI_OF_REGTYPE(data)           ((unsigned long)(data) & 0xffff)
> >
> > @@ -3169,7 +3170,11 @@ static const struct of_device_id of_sci_match[] = {
> >         },
> >         {
> >                 .compatible = "renesas,scif-r9a07g044",
> > -               .data = SCI_OF_DATA(PORT_SCIF, SCIx_RZ_SCIFA_REGTYPE),
> > +               .data = SCI_OF_DATA(PORT_SCIF, SCIx_RZ_SCIFA_REGTYPE,
> > SCIx_RESET),
> > +       },
> > +       {
> > +               .compatible = "renesas,sci-r9a07g044",
> > +               .data = SCI_OF_DATA(PORT_SCI, SCIx_SCI_REGTYPE, SCIx_RESET),
> >         },
>
> That's what I had in mind.
>
> But upon second thought, it might be better to just drop the check,
> and obtain an optional reset instead?
Agreed, will do that.

> After all the reset requirement is not a feature of this specific
> SCI(F) variant, but an SoC integration feature.  And deasserting
> the reset on other SoCs that have a reset should be fine.
>
Indeed.

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
