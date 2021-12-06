Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B385F4690EE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 08:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238588AbhLFHvn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 02:51:43 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:34369 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237150AbhLFHvn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 02:51:43 -0500
Received: by mail-ua1-f47.google.com with SMTP id n6so17903657uak.1;
        Sun, 05 Dec 2021 23:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tbRnBnaucpdNoeDbYtukU4vcheBiqVmH2qBmq2Nt9OY=;
        b=tmqD+TFMeS6HiPSIMdVkx/5ydTc20fD9M2zgSKMW3rdc3Dl5Ca4n83kLY+KOSl+CMG
         WUsEsM0DVFmRMEUzUWzLozCiQPCn76L+ymEYlJAMVAVihdOgthqi8wk1+ATeViumSgBX
         XL/wJYsyquGBKA/e5vNES0AxCYgAy3cjCyjvdjnHpHO1Xf892G0RYsLGXaBL3WXKXad0
         jYGFkTCurMr4NOKaLW+moPQ9iTwlh/QsmJlol5F8fSKMPDqXDrAUByaypG0gKd+7PfM2
         TQpH3M9lXkM5+cGc2ueQEwAMwhXeQOfi82LIKznBVxtKudZRy6GFIHchfASr4sPp1BO+
         felw==
X-Gm-Message-State: AOAM533rcuhKm0qiqJdCh//xqb5emRzY+w+qiNfwLDnBaEZo66zud8IP
        N0mIamjsjt/lJ7d3fmVoWYlzHxmQKRKGWw==
X-Google-Smtp-Source: ABdhPJyiCg27T2Hnf2F82M6i/0OxAosUdvIfKMrNv3QezEcsHe9mQMIxFsDch+H/ztUxKxmR9/+pyQ==
X-Received: by 2002:a67:b917:: with SMTP id q23mr35070667vsn.80.1638776894431;
        Sun, 05 Dec 2021 23:48:14 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id b10sm4002231uad.8.2021.12.05.23.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Dec 2021 23:48:14 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id r15so17858895uao.3;
        Sun, 05 Dec 2021 23:48:14 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr34734189vsj.77.1638776893907;
 Sun, 05 Dec 2021 23:48:13 -0800 (PST)
MIME-Version: 1.0
References: <163866408173.12449.1612367816588218523.sendpatchset@octo>
In-Reply-To: <163866408173.12449.1612367816588218523.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Dec 2021 08:48:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwR+npNSHnetet3V6dj6y1yZjsASCTdvtgs_kdYi_qhA@mail.gmail.com>
Message-ID: <CAMuHMdVwR+npNSHnetet3V6dj6y1yZjsASCTdvtgs_kdYi_qhA@mail.gmail.com>
Subject: Re: [PATCH/RFC] serdev: BREAK/FRAME/PARITY/OVERRUN notification prototype
To:     Magnus Damm <damm@opensource.se>
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

Hi Magnus,

On Sun, Dec 5, 2021 at 2:19 AM Magnus Damm <damm@opensource.se> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> A prototype patch to let serdev device drivers get notified by hardware
> errors such as BREAK, FRAME, PARITY and OVERRUN.
>
> With this patch, in the event of an error detected in the UART device driver
> the serdev_device_driver will get the newly introduced ->error() callback
> invoked if serdev_device_set_error_mask() has previously been used to enable
> the type of error. The errors are taken straight from the TTY layer and fed
> into the serdev_device_driver after filtering out only enabled errors.
>
> Without this patch the hardware errors never reach the serdev_device_driver.
>
> Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Thanks for your patch!

> --- 0001/drivers/tty/serdev/core.c
> +++ work/drivers/tty/serdev/core.c      2021-12-04 15:04:48.108809440 +0900
> @@ -349,6 +349,17 @@ unsigned int serdev_device_set_baudrate(
>  }
>  EXPORT_SYMBOL_GPL(serdev_device_set_baudrate);
>
> +void serdev_device_set_error_mask(struct serdev_device *serdev, unsigned long mask)
> +{
> +       struct serdev_controller *ctrl = serdev->ctrl;
> +
> +       if (!ctrl || !ctrl->ops->set_error_mask)

Can this happen?
There's only a single serdev_controller_ops structure, and it provides
.set_error_mask().

> +               return;
> +
> +       ctrl->ops->set_error_mask(ctrl, mask);
> +}
> +EXPORT_SYMBOL_GPL(serdev_device_set_error_mask);
> +
>  void serdev_device_set_flow_control(struct serdev_device *serdev, bool enable)
>  {
>         struct serdev_controller *ctrl = serdev->ctrl;

> @@ -27,11 +32,38 @@ static int ttyport_receive_buf(struct tt
>  {
>         struct serdev_controller *ctrl = port->client_data;
>         struct serport *serport = serdev_controller_get_drvdata(ctrl);
> -       int ret;
> +       unsigned long errors = 0;
> +       int i, ret;

unsigned int i;

>
>         if (!test_bit(SERPORT_ACTIVE, &serport->flags))
>                 return 0;
>
> +       for (i = 0; fp && i < count; i++) {
> +               switch (fp[i]) {
> +               case TTY_BREAK:
> +                       if (test_bit(SERPORT_NOTIFY_BREAK, &serport->flags))
> +                               set_bit(SERDEV_ERROR_BREAK, &errors);

No need to use atomic ops for setting bits in errors.

> +                       break;
> +
> +               case TTY_FRAME:
> +                       if (test_bit(SERPORT_NOTIFY_FRAME, &serport->flags))
> +                               set_bit(SERDEV_ERROR_FRAME, &errors);
> +                       break;
> +
> +               case TTY_PARITY:
> +                       if (test_bit(SERPORT_NOTIFY_PARITY, &serport->flags))
> +                               set_bit(SERDEV_ERROR_PARITY, &errors);
> +                       break;
> +
> +               case TTY_OVERRUN:
> +                       if (test_bit(SERPORT_NOTIFY_OVERRUN, &serport->flags))
> +                               set_bit(SERDEV_ERROR_OVERRUN, &errors);
> +                       break;
> +               }
> +       }
> +       if (errors)
> +               serdev_controller_error(ctrl, errors);
> +
>         ret = serdev_controller_receive_buf(ctrl, cp, count);
>
>         dev_WARN_ONCE(&ctrl->dev, ret < 0 || ret > count,
> @@ -180,6 +212,26 @@ static unsigned int ttyport_set_baudrate
>         return ktermios.c_ospeed;
>  }
>
> +static void ttyport_set_flags(struct serport *serport, unsigned long nflag,
> +                             unsigned long mask, unsigned long eflag)
> +{
> +       if (test_bit(eflag, &mask))

No need to use atomic ops for testing bits in mask.

> +               set_bit(nflag, &serport->flags);
> +       else
> +               clear_bit(nflag, &serport->flags);
> +}
> +
> +static void ttyport_set_error_mask(struct serdev_controller *ctrl,
> +                                  unsigned long m)
> +{
> +       struct serport *sp = serdev_controller_get_drvdata(ctrl);
> +
> +       ttyport_set_flags(sp, SERPORT_NOTIFY_BREAK, m, SERDEV_ERROR_BREAK);
> +       ttyport_set_flags(sp, SERPORT_NOTIFY_FRAME, m, SERDEV_ERROR_FRAME);
> +       ttyport_set_flags(sp, SERPORT_NOTIFY_PARITY, m, SERDEV_ERROR_PARITY);
> +       ttyport_set_flags(sp, SERPORT_NOTIFY_OVERRUN, m, SERDEV_ERROR_OVERRUN);
> +}
> +
>  static void ttyport_set_flow_control(struct serdev_controller *ctrl, bool enable)
>  {
>         struct serport *serport = serdev_controller_get_drvdata(ctrl);
> @@ -253,6 +305,7 @@ static const struct serdev_controller_op
>         .write_room = ttyport_write_room,
>         .open = ttyport_open,
>         .close = ttyport_close,
> +       .set_error_mask = ttyport_set_error_mask,
>         .set_flow_control = ttyport_set_flow_control,
>         .set_parity = ttyport_set_parity,
>         .set_baudrate = ttyport_set_baudrate,
> --- 0001/include/linux/serdev.h
> +++ work/include/linux/serdev.h 2021-12-04 15:06:26.852815658 +0900
> @@ -19,12 +19,15 @@ struct serdev_device;
>
>  /**
>   * struct serdev_device_ops - Callback operations for a serdev device
> + * @error:             Function called with errors received from device;
> + *                     may sleep.
>   * @receive_buf:       Function called with data received from device;
>   *                     returns number of bytes accepted; may sleep.
>   * @write_wakeup:      Function called when ready to transmit more data; must
>   *                     not sleep.
>   */
>  struct serdev_device_ops {
> +       void (*error)(struct serdev_device *, unsigned long);
>         int (*receive_buf)(struct serdev_device *, const unsigned char *, size_t);
>         void (*write_wakeup)(struct serdev_device *);
>  };
> @@ -76,6 +79,11 @@ enum serdev_parity {
>         SERDEV_PARITY_ODD,
>  };
>
> +#define SERDEV_ERROR_BREAK 0
> +#define SERDEV_ERROR_FRAME 1
> +#define SERDEV_ERROR_PARITY 2
> +#define SERDEV_ERROR_OVERRUN 3
> +
>  /*
>   * serdev controller structures
>   */
> @@ -85,6 +93,7 @@ struct serdev_controller_ops {
>         int (*write_room)(struct serdev_controller *);
>         int (*open)(struct serdev_controller *);
>         void (*close)(struct serdev_controller *);
> +       void (*set_error_mask)(struct serdev_controller *, unsigned long);
>         void (*set_flow_control)(struct serdev_controller *, bool);
>         int (*set_parity)(struct serdev_controller *, enum serdev_parity);
>         unsigned int (*set_baudrate)(struct serdev_controller *, unsigned int);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
