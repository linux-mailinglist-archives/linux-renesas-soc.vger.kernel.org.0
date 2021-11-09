Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2626D449F91
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Nov 2021 01:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234783AbhKIAgw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Nov 2021 19:36:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbhKIAgv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 19:36:51 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C528CC061570;
        Mon,  8 Nov 2021 16:34:06 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id q74so48275308ybq.11;
        Mon, 08 Nov 2021 16:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q5DOp79TqIehgB/tt332cR2spFyy+swaF0wEaBl7XIc=;
        b=a7PQcClm4Xy/E/Osr0G2js0eSdA2KdGA4mVKsIXZ9CCPBIw5v8CosLAnaYRdg7ZIdr
         4SyfaYkYvXY9H+iNOJgpLkKVGQ5u0mfBA4Umr71QFx8KLamv4DjiTcjBPHggtJTYqtmQ
         3ilkb6KAxAYYaf/FpJKG0Ns+rJAk/pM2on894j8ehkCrUOHRXd/3lOUnj9VYXGX+3QKQ
         39nwufPZfT76qKsJ85QAQmDaeuFgX15uc9lTGTyb4Rjuq1W45uC5HfkFykqGvUTOFuHN
         T7Xx6k1/6og7+MOeRj6cJtz4YlJ1R5SQB3j4DZavTnsfpZ+tT1stIWjkXVVkPmog7oEf
         cqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q5DOp79TqIehgB/tt332cR2spFyy+swaF0wEaBl7XIc=;
        b=GeIhZ45FSaMWJYZRqiSXa3bgMzvZHMMegU1XrLgY+84t3ptry4Liz8LX2t9bkFUquV
         e7ssawrOmPtqaXg/SfZd/2asUBACYahLIOxKMFKy2G46CMbb/tjLBxgrjHK9ZmCdxCgd
         cFJOoINb17eLc6TjbmU7vWmgUwZRYzE/DKyMAKYjqm09mjBLPMke/3I8k1VvNhfoZEag
         8TeNoMKxEfS0+RZvKJLJVp3H7EqOgfNL9mjZOaug2zTd+p+/tsZBwVd5/Oft5LLl6SmM
         QnBvwZwb3vIy9RjG5UWqfNsKA4r/Bwmx/Pu4j74J5mPavZVZAENlZpom5pBnbA94mZhK
         b3ZA==
X-Gm-Message-State: AOAM530rOWJ4uSAZO7SucOrM8D7UyQ8DvUnRgxLFMqWSv7kk7hB0RmrC
        LK9jKrI625SfzNqk5zU1rghefeG4N8EMGtEYhFU=
X-Google-Smtp-Source: ABdhPJwgGFcUu6m+TJwjEwbFscerQ8a9/lv/DzIhJaXAO17zeyi/3RDTEv1ZJxuugzKwZC+yv4rYVyoRjHUejfM3jYU=
X-Received: by 2002:a25:c08a:: with SMTP id c132mr3673023ybf.49.1636418046095;
 Mon, 08 Nov 2021 16:34:06 -0800 (PST)
MIME-Version: 1.0
References: <20211103173127.13701-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211103173127.13701-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWLfUNh7PQWpARS6CNymqpGO_29tgy7NLtgmJ-BRgyUaA@mail.gmail.com>
In-Reply-To: <CAMuHMdWLfUNh7PQWpARS6CNymqpGO_29tgy7NLtgmJ-BRgyUaA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 9 Nov 2021 00:33:40 +0000
Message-ID: <CA+V-a8sLuZUC=Xfce5CzJ3jbszGjK00r6wLGc1n-xWgFDBuqPA@mail.gmail.com>
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

Thank you for the review.

On Mon, Nov 8, 2021 at 4:40 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Nov 3, 2021 at 6:31 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > On RZ/G2L devices should be explicitly pulled out of reset for it
> > to work. This patch adds support to read the "resets" property and
> > performs deassert/assert when required.
> >
> > Also, propagate the error to the caller of sci_parse_dt() instead of
> > returning NULL in case of failure.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for your patch!
>
> > ---
> > Hi Geert,
> > For handling the resets I was in dual mind whether to perform
> > reset based on compatible strings or soc-id, let me know your
> > thoughts. Currently no SoC's use "renesas,sci" so using the same
> > for performing the reset operation for SCI.
>
> We do, on H8/300.
>
Missed that.

> > --- a/drivers/tty/serial/sh-sci.c
> > +++ b/drivers/tty/serial/sh-sci.c
> > @@ -3203,23 +3204,58 @@ static const struct of_device_id of_sci_match[] = {
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
> >         struct plat_sci_port *p;
> >         struct sci_port *sp;
> >         const void *data;
> >         int id;
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
> > +       if (!strcmp(of_id->compatible, "renesas,scif-r9a07g044") ||
> > +           !strcmp(of_id->compatible, "renesas,sci")) {
>
> This will match on H8/300, too, which doesn't have resets.
> Please match against "renesas,sci-r9a07g044" instead.
>
> Please don't use explicit strcmp() calls here, but add a flag to
> of_sci_match[].data.
>
Agreed, does the below hunk look good for handling the reset?

-#define SCI_OF_DATA(type, regtype)     (void *)((type) << 16 | (regtype))
+#define SCIx_RESET                             BIT(31)
+#define SCI_OF_DATA(type, regtype, reset)      (void *)(reset |
(type) << 16 | (regtype))
 #define SCI_OF_TYPE(data)              ((unsigned long)(data) >> 16)
 #define SCI_OF_REGTYPE(data)           ((unsigned long)(data) & 0xffff)

@@ -3169,7 +3170,11 @@ static const struct of_device_id of_sci_match[] = {
        },
        {
                .compatible = "renesas,scif-r9a07g044",
-               .data = SCI_OF_DATA(PORT_SCIF, SCIx_RZ_SCIFA_REGTYPE),
+               .data = SCI_OF_DATA(PORT_SCIF, SCIx_RZ_SCIFA_REGTYPE,
SCIx_RESET),
+       },
+       {
+               .compatible = "renesas,sci-r9a07g044",
+               .data = SCI_OF_DATA(PORT_SCI, SCIx_SCI_REGTYPE, SCIx_RESET),
        },

Cheers,
Prabhakar

> > +               struct reset_control *rstc;
> > +               int ret;
> > +
> > +               rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> > +               if (IS_ERR(rstc)) {
> > +                       dev_err(&pdev->dev, "Error: missing reset ctrl\n");
> > +                       return ERR_PTR(PTR_ERR(rstc));
> > +               }
> > +
> > +               ret = reset_control_deassert(rstc);
> > +               if (ret) {
> > +                       dev_err(&pdev->dev, "failed to deassert %d\n", ret);
> > +                       return ERR_PTR(ret);
> > +               }
> > +
> > +               ret = devm_add_action_or_reset(&pdev->dev, sci_reset_control_assert, rstc);
> > +               if (ret) {
> > +                       dev_err(&pdev->dev, "failed to register assert devm action, %d\n",
> > +                               ret);
> > +                       return ERR_PTR(ret);
> > +               }
> > +       }
> > +
> > +       data = of_id->data;
> >
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
