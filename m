Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 120AB44A7D6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Nov 2021 08:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235329AbhKIHwz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Nov 2021 02:52:55 -0500
Received: from mail-ua1-f45.google.com ([209.85.222.45]:36517 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234870AbhKIHwy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Nov 2021 02:52:54 -0500
Received: by mail-ua1-f45.google.com with SMTP id e10so36880379uab.3;
        Mon, 08 Nov 2021 23:50:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+gKUIeTzZdG0q4VnImlywybxzshRShcdtNnJL+SbWZQ=;
        b=l7gW4akxxTz5F1AwmPOWpKRBuxKrJRtOr3Qm9ka3V34iNeKKV3w7Jmkdvu9/xptNOn
         bMuSBrCoNjxntZKXQp9tWL5WP0b5UpImu2kbjFuqXtM61e8bHtPQFW9Ys4/9578hpSIN
         g/XsOZcPvqoztg1fCrfG2UeWf1PoLVdYRYN0oAYtUR1QC8fslTQp23yVH26a43ma9hzv
         I5S+bPVqm7PEDhxq+IL7f/zDHozMonOt1BEpg9Lot0gZ6RHn775nJVQ4QsT3FGFfaKEc
         C4tgJZZ5wh7zxP5E1M1pre8/oxbWsQT/FbfnGjrE/UC+rxtd5uCMuMfO/8UcnBLkTS9y
         AX0w==
X-Gm-Message-State: AOAM5313LR6a+vKhUzDkq+eVjFN5GUwuY/VyNNiMz2LoXxcRcsYH7RHX
        0XK8K9MRlky29lkl6O0fWck7ZNbIjG4/3Hxt
X-Google-Smtp-Source: ABdhPJxgcRVt0NYonR+3s4yB2STjhz6Lywz8Y30iqMA1yEH5KSqtjJvjYkJiUoj5rP4BDdbak/IcFw==
X-Received: by 2002:a67:ec8f:: with SMTP id h15mr9257885vsp.53.1636444208380;
        Mon, 08 Nov 2021 23:50:08 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id u16sm3243589uad.2.2021.11.08.23.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 23:50:08 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id i6so36778195uae.6;
        Mon, 08 Nov 2021 23:50:07 -0800 (PST)
X-Received: by 2002:ab0:5552:: with SMTP id u18mr7277925uaa.78.1636444207640;
 Mon, 08 Nov 2021 23:50:07 -0800 (PST)
MIME-Version: 1.0
References: <20211103173127.13701-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211103173127.13701-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWLfUNh7PQWpARS6CNymqpGO_29tgy7NLtgmJ-BRgyUaA@mail.gmail.com> <CA+V-a8sLuZUC=Xfce5CzJ3jbszGjK00r6wLGc1n-xWgFDBuqPA@mail.gmail.com>
In-Reply-To: <CA+V-a8sLuZUC=Xfce5CzJ3jbszGjK00r6wLGc1n-xWgFDBuqPA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Nov 2021 08:49:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWOQq=avCqAU5t+gKqdb5FMRZB2hz7fVNmtgWK8Yp3iWg@mail.gmail.com>
Message-ID: <CAMuHMdWOQq=avCqAU5t+gKqdb5FMRZB2hz7fVNmtgWK8Yp3iWg@mail.gmail.com>
Subject: Re: [PATCH 3/3] serial: sh-sci: Add reset support for RZ/G2L SoC
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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

Hi Prabhakar,

On Tue, Nov 9, 2021 at 1:34 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Mon, Nov 8, 2021 at 4:40 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, Nov 3, 2021 at 6:31 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > On RZ/G2L devices should be explicitly pulled out of reset for it
> > > to work. This patch adds support to read the "resets" property and
> > > performs deassert/assert when required.
> > >
> > > Also, propagate the error to the caller of sci_parse_dt() instead of
> > > returning NULL in case of failure.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > ---
> > > Hi Geert,
> > > For handling the resets I was in dual mind whether to perform
> > > reset based on compatible strings or soc-id, let me know your
> > > thoughts. Currently no SoC's use "renesas,sci" so using the same
> > > for performing the reset operation for SCI.
> >
> > We do, on H8/300.
> >
> Missed that.
>
> > > --- a/drivers/tty/serial/sh-sci.c
> > > +++ b/drivers/tty/serial/sh-sci.c
> > > @@ -3203,23 +3204,58 @@ static const struct of_device_id of_sci_match[] = {
> > >  };
> > >  MODULE_DEVICE_TABLE(of, of_sci_match);
> > >
> > > +static void sci_reset_control_assert(void *data)
> > > +{
> > > +       reset_control_assert(data);
> > > +}
> > > +
> > >  static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
> > >                                           unsigned int *dev_id)
> > >  {
> > >         struct device_node *np = pdev->dev.of_node;
> > > +       const struct of_device_id *of_id;
> > >         struct plat_sci_port *p;
> > >         struct sci_port *sp;
> > >         const void *data;
> > >         int id;
> > >
> > >         if (!IS_ENABLED(CONFIG_OF) || !np)
> > > -               return NULL;
> > > +               return ERR_PTR(-EINVAL);
> > > +
> > > +       of_id = of_match_device(of_sci_match, &pdev->dev);
> > > +       if (!of_id)
> > > +               return ERR_PTR(-EINVAL);
> > >
> > > -       data = of_device_get_match_data(&pdev->dev);
> > > +       if (!strcmp(of_id->compatible, "renesas,scif-r9a07g044") ||
> > > +           !strcmp(of_id->compatible, "renesas,sci")) {
> >
> > This will match on H8/300, too, which doesn't have resets.
> > Please match against "renesas,sci-r9a07g044" instead.
> >
> > Please don't use explicit strcmp() calls here, but add a flag to
> > of_sci_match[].data.
> >
> Agreed, does the below hunk look good for handling the reset?
>
> -#define SCI_OF_DATA(type, regtype)     (void *)((type) << 16 | (regtype))
> +#define SCIx_RESET                             BIT(31)
> +#define SCI_OF_DATA(type, regtype, reset)      (void *)(reset |
> (type) << 16 | (regtype))
>  #define SCI_OF_TYPE(data)              ((unsigned long)(data) >> 16)
>  #define SCI_OF_REGTYPE(data)           ((unsigned long)(data) & 0xffff)
>
> @@ -3169,7 +3170,11 @@ static const struct of_device_id of_sci_match[] = {
>         },
>         {
>                 .compatible = "renesas,scif-r9a07g044",
> -               .data = SCI_OF_DATA(PORT_SCIF, SCIx_RZ_SCIFA_REGTYPE),
> +               .data = SCI_OF_DATA(PORT_SCIF, SCIx_RZ_SCIFA_REGTYPE,
> SCIx_RESET),
> +       },
> +       {
> +               .compatible = "renesas,sci-r9a07g044",
> +               .data = SCI_OF_DATA(PORT_SCI, SCIx_SCI_REGTYPE, SCIx_RESET),
>         },

That's what I had in mind.

But upon second thought, it might be better to just drop the check,
and obtain an optional reset instead?
After all the reset requirement is not a feature of this specific
SCI(F) variant, but an SoC integration feature.  And deasserting
the reset on other SoCs that have a reset should be fine.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
