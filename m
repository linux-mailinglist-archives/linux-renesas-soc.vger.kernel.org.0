Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41C7144AE74
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Nov 2021 14:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbhKINKc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Nov 2021 08:10:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbhKINKb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Nov 2021 08:10:31 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29EE4C061764;
        Tue,  9 Nov 2021 05:07:46 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id a129so52769512yba.10;
        Tue, 09 Nov 2021 05:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vx8ACzzR7ClOZiFbVt6NTdwPz8XSyKvvQycpeMv1yu4=;
        b=FXkyq7Qt4Du6/Jg1yT/OpZ68vb86FuM4kkBB5KI7rdNfHLIiExYnXMRsMuVTaeEzyS
         WJzrmRtpAjNpyMg+1wxs2LhOmrK4QNbBxKvZePJD+pVa3kP2EyrLUXCN/DWmZDOOVtQw
         80qYWtHz6DnP2D2AyhYcY7yTt+1VN8g/Z3sh9s+OROsbRCE5xklP18Gu2R5UU41Gy+vv
         OQ2PmvDtLyWP/wFEx3H1/JbBrlSwpvjc+qF5MpuxWsLbUbLsKqla50oOG9qc6fdqtZ8k
         n4UE9ZeaUJFnG0EVadNK1JZdt6g/QdMJ1YdybXzyJADgq9YKPGgj1v/pEylUVwlxDiSH
         Eksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vx8ACzzR7ClOZiFbVt6NTdwPz8XSyKvvQycpeMv1yu4=;
        b=YWG4k9vwhyvlh4Y0RkWm/CZaGptlIXKx2HSkj7W6+bgc1Ir+Xgr6NHSU6y6d3ajZxg
         VBHZUAhyvEx9hfhhlOmhXGrJ0itpv2mqQ83NYlxZV3wciyWKB4skvgTFVVhNiVYVYLPe
         OWZzaM9diV1+4XQN7ZkD/JxpQqmZSYKDc3xiBLKeci8oZQe4ZYYOCsq1c/OryiLVYauE
         Ohg6TdwnZyUC+PUeVNYjdp9SgoxPBu2I7d87tnhBA+qoZXgqHzYv3WE6CMtglB1v/mdt
         vnJy0CXaa/azjss/2+e4Hmck/tR2KCPWsyAo7rh1fKSUNOkPdhw8HsrCEsjgGwVpArP5
         P1xA==
X-Gm-Message-State: AOAM531bGsLv7BNoPMTpdGe1MkltFin/0fdM5uRxNeJfgZp3BNuq7c5i
        8YIHmFJAz2iBEf0k+gxtuupwf4zIiC8y3kj+mkw=
X-Google-Smtp-Source: ABdhPJxPF7bznx3Iq5w5DGo3ahtGklJaTLgR+RgnfIWFMmHgwtOpFhicepqYpjMaeWyH3BuKscGFh7EI7nhmMZtJih8=
X-Received: by 2002:a25:c792:: with SMTP id w140mr8229629ybe.131.1636463265288;
 Tue, 09 Nov 2021 05:07:45 -0800 (PST)
MIME-Version: 1.0
References: <20211109121631.26687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211109121631.26687-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXAhQMOzbQHyymJrq0So11-uLC5nPT0gU7qj+MH8GmApw@mail.gmail.com>
In-Reply-To: <CAMuHMdXAhQMOzbQHyymJrq0So11-uLC5nPT0gU7qj+MH8GmApw@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 9 Nov 2021 13:07:19 +0000
Message-ID: <CA+V-a8tYFA_jgt+yE5En0OhUYibb38=uR=Y0hmDs+gggqF8R+A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] serial: sh-sci: Add support to deassert/assert
 reset line
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

Thank you for the review.

On Tue, Nov 9, 2021 at 12:58 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Nov 9, 2021 at 1:17 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > On RZ/G2L SoC we need to explicitly deassert the reset line
> > for the device to work, use this opportunity to deassert/assert
> > reset line in sh-sci driver.
> >
> > This patch adds support to read the "resets" property (if available)
> > from DT and perform deassert/assert when required.
> >
> > Also, propagate the error to the caller of sci_parse_dt() instead of
> > returning NULL in case of failure.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v1->v2
> > * deassert/assert reset line if available on all SoC's
> > * Updated commit message
>
> Thanks for the update!
>
> > --- a/drivers/tty/serial/sh-sci.c
> > +++ b/drivers/tty/serial/sh-sci.c
> > @@ -37,6 +37,7 @@
> >  #include <linux/of_device.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/reset.h>
> >  #include <linux/scatterlist.h>
> >  #include <linux/serial.h>
> >  #include <linux/serial_sci.h>
> > @@ -3203,23 +3204,53 @@ static const struct of_device_id of_sci_match[] = {
> >  };
> >  MODULE_DEVICE_TABLE(of, of_sci_match);
> >
> > +static void sci_reset_control_assert(void *data)
> > +{
> > +       reset_control_assert(data);
> > +}
> > +
> >  static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
> >                                           unsigned int *dev_id)
> >  {
> >         struct device_node *np = pdev->dev.of_node;
> > +       const struct of_device_id *of_id;
>
> Not needed.
>
Agreed.

> > +       struct reset_control *rstc;
> >         struct plat_sci_port *p;
> >         struct sci_port *sp;
> >         const void *data;
> > -       int id;
> > +       int id, ret;
> >
> >         if (!IS_ENABLED(CONFIG_OF) || !np)
> > -               return NULL;
> > +               return ERR_PTR(-EINVAL);
> > +
> > +       of_id = of_match_device(of_sci_match, &pdev->dev);
> > +       if (!of_id)
> > +               return ERR_PTR(-EINVAL);
> >
> > -       data = of_device_get_match_data(&pdev->dev);
>
> Please keep the old construct using of_device_get_match_data().
>
OK.

> > +       rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
> > +       if (IS_ERR(rstc)) {
> > +               dev_err(&pdev->dev, "failed to get reset ctrl %ld\n", PTR_ERR(rstc));
> > +               return ERR_PTR(PTR_ERR(rstc));
>
> The error might be -EPROBE_DEFER, so please use
> "return ERR_PTR(dev_err_probe(...))", to avoid printing the message
> in case of probe deferral.
>
Agreed, will use dev_err_probe().

> BTW, ERR_CAST() is a shorthand for ERR_PTR(PTR_ERR()).
>
Thanks for the pointer.

> > +       }
> > +
> > +       ret = reset_control_deassert(rstc);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "failed to deassert reset %d\n", ret);
> > +               return ERR_PTR(ret);
> > +       }
> > +
> > +       ret = devm_add_action_or_reset(&pdev->dev, sci_reset_control_assert, rstc);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "failed to register assert devm action, %d\n",
> > +                       ret);
> > +               return ERR_PTR(ret);
> > +       }
> > +
> > +       data = of_id->data;
> >
> >         p = devm_kzalloc(&pdev->dev, sizeof(struct plat_sci_port), GFP_KERNEL);
> >         if (!p)
> > -               return NULL;
> > +               return ERR_PTR(-ENOMEM);
> >
> >         /* Get the line number from the aliases node. */
> >         id = of_alias_get_id(np, "serial");
>
> I gave this a try on Salvator-XS, and noticed no regressions.
> I will test this on more SCIF variants later.
>
Thanks, I will re-spin a v3 just for this lone patch. I hope that's OK.

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
