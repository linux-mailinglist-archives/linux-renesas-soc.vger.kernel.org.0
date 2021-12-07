Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1CD46B144
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Dec 2021 04:09:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233094AbhLGDM2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 22:12:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbhLGDM2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 22:12:28 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8609C061746;
        Mon,  6 Dec 2021 19:08:58 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id z7so30118658lfi.11;
        Mon, 06 Dec 2021 19:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Km3jBM98QOVIPHfE1+ksg7FpQAlp8fEc3kxNaS1mbKE=;
        b=Czby897Tgi9GPk69OG2taf1KV+OUJjLtduA8N148PJ4K96pZk0/CXC3Q7uZnp/R7+s
         q0CGMpT9EfCD6uC/O+ocyjlzvDFMS3gSAhKzaAbvx5COEi7b2QBp24j5RHfnThuu834B
         zUp0/D9j0ZPibiyl6ATDrqNOh33WMQb4MOBj5YkZbr2daOE4EyYUIr7hUULk/WVLwnA3
         mzrLUh68377HbXeC7OTiLjO3t3vBa4Cf6g7Zbs/Q7TJdaE4ovXeMNG2B3+0Hq6wwKnoo
         lkMyy1S6gMFE0ET/IQksLkIREHgNUqmvijYhZoMwj0y/IeXEkJsSvqRh4pyYXnjBjXvO
         ++2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Km3jBM98QOVIPHfE1+ksg7FpQAlp8fEc3kxNaS1mbKE=;
        b=IfNIvO4tKp+TZVOq/7Zy0a0nPShAifH2f4ugrcwbgwcA2xAUdLIJByMX9cNuKrhvV2
         KJfqxeW3FTFyN4j926UlpnLHDcXa2Zl1Amjw8SXhQsoKPkPszgfUd2pl71gqQAdcAwRq
         aKifXJzWW2q82WDodFsN+E5VWB4qpNjTi6XfENo5Ck//0lMEmAdV1MLb4H/ItdlVIRs2
         1Piq9aiXjRoDc/GBFH/aE8jaKcSHmo0ah7YQdQynjrvl3s3nvag9YdoUJyhNLb+OxARF
         fIc0WJh8g0QP56ay/3JtwPx9t4J0zPvx9wcjPYtqS+8usu51IYmAx/nD6dzapRdH0HfY
         ec3A==
X-Gm-Message-State: AOAM5329PijquDnLAiPE1xnJSaAwaQTnAKJ3T1o0mNxpR8DBiI1RVh9I
        nxuoKsNgC+e6dOU7y4msEMAWrh/nZIyRful2DePiMCUm
X-Google-Smtp-Source: ABdhPJyAItm+tUMbKYs/R1DRliMaLJ+OUIKmYkq+b+S4xUNBHh6imhkRHwGuHwaPdYzr5dOy6UfEJ8rgQNqHlfMbAJc=
X-Received: by 2002:a05:6512:33c4:: with SMTP id d4mr36104693lfg.182.1638846536830;
 Mon, 06 Dec 2021 19:08:56 -0800 (PST)
MIME-Version: 1.0
References: <163866408173.12449.1612367816588218523.sendpatchset@octo> <CAMuHMdVwR+npNSHnetet3V6dj6y1yZjsASCTdvtgs_kdYi_qhA@mail.gmail.com>
In-Reply-To: <CAMuHMdVwR+npNSHnetet3V6dj6y1yZjsASCTdvtgs_kdYi_qhA@mail.gmail.com>
From:   Magnus Damm <magnus.damm@gmail.com>
Date:   Tue, 7 Dec 2021 12:08:44 +0900
Message-ID: <CANqRtoQK7oWnGH3a4Vx-aiVzC+duQCP+-UgZsH8F0d73UHcWqw@mail.gmail.com>
Subject: Re: [PATCH/RFC] serdev: BREAK/FRAME/PARITY/OVERRUN notification prototype
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Mon, Dec 6, 2021 at 4:48 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Magnus,
>
> On Sun, Dec 5, 2021 at 2:19 AM Magnus Damm <damm@opensource.se> wrote:
> > From: Magnus Damm <damm+renesas@opensource.se>
> >
> > A prototype patch to let serdev device drivers get notified by hardware
> > errors such as BREAK, FRAME, PARITY and OVERRUN.
> >
> > With this patch, in the event of an error detected in the UART device driver
> > the serdev_device_driver will get the newly introduced ->error() callback
> > invoked if serdev_device_set_error_mask() has previously been used to enable
> > the type of error. The errors are taken straight from the TTY layer and fed
> > into the serdev_device_driver after filtering out only enabled errors.
> >
> > Without this patch the hardware errors never reach the serdev_device_driver.
> >
> > Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>
> Thanks for your patch!

Thanks for feedback!

> > --- 0001/drivers/tty/serdev/core.c
> > +++ work/drivers/tty/serdev/core.c      2021-12-04 15:04:48.108809440 +0900
> > @@ -349,6 +349,17 @@ unsigned int serdev_device_set_baudrate(
> >  }
> >  EXPORT_SYMBOL_GPL(serdev_device_set_baudrate);
> >
> > +void serdev_device_set_error_mask(struct serdev_device *serdev, unsigned long mask)
> > +{
> > +       struct serdev_controller *ctrl = serdev->ctrl;
> > +
> > +       if (!ctrl || !ctrl->ops->set_error_mask)
>
> Can this happen?
> There's only a single serdev_controller_ops structure, and it provides
> .set_error_mask().

Good question.

The code above is following the same approach with callbacks as the
rest of the serdev functions in core.c. I think there are more than 10
functions that validate pointers such as:
ctrl
ctrl->ops->pointer
Interestingly enough ctrl->ops does not seem to be checked at all.

What would be a better approach here I wonder?

> > +               return;
> > +
> > +       ctrl->ops->set_error_mask(ctrl, mask);
> > +}
> > +EXPORT_SYMBOL_GPL(serdev_device_set_error_mask);
> > +
> >  void serdev_device_set_flow_control(struct serdev_device *serdev, bool enable)
> >  {
> >         struct serdev_controller *ctrl = serdev->ctrl;
>
> > @@ -27,11 +32,38 @@ static int ttyport_receive_buf(struct tt
> >  {
> >         struct serdev_controller *ctrl = port->client_data;
> >         struct serport *serport = serdev_controller_get_drvdata(ctrl);
> > -       int ret;
> > +       unsigned long errors = 0;
> > +       int i, ret;
>
> unsigned int i;

Will fix.

> >
> >         if (!test_bit(SERPORT_ACTIVE, &serport->flags))
> >                 return 0;
> >
> > +       for (i = 0; fp && i < count; i++) {
> > +               switch (fp[i]) {
> > +               case TTY_BREAK:
> > +                       if (test_bit(SERPORT_NOTIFY_BREAK, &serport->flags))
> > +                               set_bit(SERDEV_ERROR_BREAK, &errors);
>
> No need to use atomic ops for setting bits in errors.

Switching to the non-atomic variants makes sense, will do.

> > +                       break;
> > +
> > +               case TTY_FRAME:
> > +                       if (test_bit(SERPORT_NOTIFY_FRAME, &serport->flags))
> > +                               set_bit(SERDEV_ERROR_FRAME, &errors);
> > +                       break;
> > +
> > +               case TTY_PARITY:
> > +                       if (test_bit(SERPORT_NOTIFY_PARITY, &serport->flags))
> > +                               set_bit(SERDEV_ERROR_PARITY, &errors);
> > +                       break;
> > +
> > +               case TTY_OVERRUN:
> > +                       if (test_bit(SERPORT_NOTIFY_OVERRUN, &serport->flags))
> > +                               set_bit(SERDEV_ERROR_OVERRUN, &errors);
> > +                       break;
> > +               }
> > +       }
> > +       if (errors)
> > +               serdev_controller_error(ctrl, errors);
> > +
> >         ret = serdev_controller_receive_buf(ctrl, cp, count);
> >
> >         dev_WARN_ONCE(&ctrl->dev, ret < 0 || ret > count,
> > @@ -180,6 +212,26 @@ static unsigned int ttyport_set_baudrate
> >         return ktermios.c_ospeed;
> >  }
> >
> > +static void ttyport_set_flags(struct serport *serport, unsigned long nflag,
> > +                             unsigned long mask, unsigned long eflag)
> > +{
> > +       if (test_bit(eflag, &mask))
>
> No need to use atomic ops for testing bits in mask.

Agreed.

I'll cook up a V2 later this week.

Cheers,

/ magnus
