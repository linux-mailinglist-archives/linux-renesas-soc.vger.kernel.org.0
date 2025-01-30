Return-Path: <linux-renesas-soc+bounces-12734-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85574A229B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 09:39:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D61EA1887C20
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 08:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A301B0F0A;
	Thu, 30 Jan 2025 08:39:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DD61B0415;
	Thu, 30 Jan 2025 08:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738226388; cv=none; b=Lmd9BrC0GOsXTPPKcm4PSUsRpTGrqraiJmrNAj+zJr8yoctCoMBiEexhH9oYDj1oS0IMzgoGdyMcS1sjtSNh/FZWzF776PWMrWEfmnZT/XtJNTHmdn1xc3xpASX0Q6YCuyN8twiy0mIW5oAgkCv1qoek4gDLhLo8iUxsTUSaCAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738226388; c=relaxed/simple;
	bh=hEU3o0VHdE4gvNTVBSXXNoknR0x/IOoLOJaNOWiJVG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cFi4gerkKupk9aJM3JpJNhYV7RZgCNZbR6VMk2OUQL+8hdFa8S4GlE4bMHlqd+wmSoLtQMp3c6nXsF29f/+XNdUZTG9py6VaUmg8R1ZjissKEy0KG3+7Ao3683yNvqPeeT2/1LyBXIWsy1QHdXP0wrK9doNjYEdC764XfETXqDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-51878cf85a7so168436e0c.0;
        Thu, 30 Jan 2025 00:39:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738226384; x=1738831184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbxArew7idoCnWrfmn0lEUjbJUOklyP0/MoH1REd+Rk=;
        b=olakqq//VPv6hypAE0UxXz0f4RGOACls0NZfJ1v8jQPiI4X3p14IqNeFs//jFPONRK
         IE0M9m9JTPsdLrmSe/UhVnXrLYvmpz0jvLaq0GROO7sk1wcegLd0momkpULl1NVVK9q/
         AiIgSYupBGleQK3FIfFkypzzPl7bgCKU1mX8mHyrA5jNZNMs36VIaD298UvnbDGyxbuq
         JeQN0MjICkAl6Ir895hSw0L0fe/48xrNO4fUwKXLiBiLZZTprpnR5JAfc0Wu+9PyLMxi
         /O2xs7xm9Ld9atL132+x5n31l+KDZy9QqduSCPYjHMg+8F+I6+N5VPfQQ4AymagNGNFS
         bDjw==
X-Forwarded-Encrypted: i=1; AJvYcCW2tdOGX8R7ZYtdRJDLhUPT3R6bqSCDlPWUc4toEKwNrql8YNZPLHzt7opWgdJqIUZfOImNhjROUnpkIUA=@vger.kernel.org, AJvYcCX6ayFRhaK6wWJi8oaV7THhYpo/TBWbgs6kOBqntacFVxAV7NddatMJiI1XAPAjFfn36zxZWxzy0eLgkGrf@vger.kernel.org, AJvYcCXPc1Auwme5Cg3/QO78cbk6NYKRdqFCHGJe6e98GoBwoATVMvpeOazLEROaBBmcZM3GLWdQS9oDA2vBHiV6pmNrrH8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx63EMR2kYHzqfFWrdSXEEbmgBebJ+L5cbKiJ7okWTHtlN2G9N+
	HigmXgrD4S5+K4kCPwGjr4fao2EMjVhZEEf1l3gHDcUfY97vYfTol6tvrT1o
X-Gm-Gg: ASbGncvA4QvA9CyBiFMHqdKyjhuklY2TBQkg54tDiCxHlod+WdG90LIlVex4RiLdOcK
	SLBrgOO+de6mQZpG6EuliPIGHiC/UdD7rj00nY4J6cbuzACRZ1XclAMkkaCSLTj4pDmHaXy7B2W
	7/WxtUkYix2TvhcuesmNbPlbZcLkJAG978114lNvehfbKNwxzD5oMTPKENA/kcmh1sJ59MbfxWH
	IVARxnSTUZXdeobEJQcJpe/rqNC2swMjl2SaJCuLn3eCMw/Qr0eosbodsaE5MElH5TgYh80MYDf
	hlFJWvhTq9KLQsjp3KLfuRyHiwEpZn6yDDNwb0hBNttUlVHridP/6g==
X-Google-Smtp-Source: AGHT+IGc0f4OaZnrvelbXW0SlzpQrKsIwxl2NOnb/we+cxxCAd5n2uPhgZ9LG0duZZ2UUNRf28gKDQ==
X-Received: by 2002:a05:6122:240c:b0:518:859e:87c3 with SMTP id 71dfb90a1353d-51e9e3edb13mr6880767e0c.7.1738226384042;
        Thu, 30 Jan 2025 00:39:44 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1c3d224sm143308e0c.26.2025.01.30.00.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 00:39:43 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-85b83479f45so130782241.0;
        Thu, 30 Jan 2025 00:39:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUM9k8foFpzGANxSZsFjMhtobMTK1ZYUybeRlXSnNEPYn0RXHnZUgwpaHMzHMGcBf5XhF822k55If5gbqPA@vger.kernel.org, AJvYcCUTeWYnE8256aS0eq3H1QTrRzYmeo2KAYKm8NinBgfdrrhPyHcZXS9AxtcnozZ8FiwXta5Fv9FYJ1CaRQDF13BEUJA=@vger.kernel.org, AJvYcCXKFnUq86RtAXjHS/cf7KkI/pcIWCbxZg3G3Cys2d5wz6FI0utMbHqhDabCuMDkWMa3k5xIr5gyvmNVqdo=@vger.kernel.org
X-Received: by 2002:a05:6102:d94:b0:4b6:18b3:a4db with SMTP id
 ada2fe7eead31-4b9a4f10949mr5799048137.8.1738226383366; Thu, 30 Jan 2025
 00:39:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com> <20250129165122.2980-11-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250129165122.2980-11-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 09:39:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVa2Msd=h15vQyJ_OmT18w_qpYacVQjNwRBbLYtc+j41g@mail.gmail.com>
X-Gm-Features: AWEUYZnhP0Uy0tLjT6-o6e8xKWfli_TtvP2yCgnPu03_XShJ62odRQ9EYMMgy1E
Message-ID: <CAMuHMdVa2Msd=h15vQyJ_OmT18w_qpYacVQjNwRBbLYtc+j41g@mail.gmail.com>
Subject: Re: [PATCH 10/14] serial: sh-sci: Introduced sci_of_data
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

CC linux-renesas-soc

On Wed, 29 Jan 2025 at 17:56, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> The aim here is to provide an easier support to more different SCI
> controllers, like the RZ/T2H one.
>
> The existing .data field of_sci_match is changed to a structure containing
> all what that can be statically initialized, and avoid a call to
> 'sci_probe_regmap', in both 'sci_init_single', and 'early_console_setup'.
>
> 'sci_probe_regmap' is now assumed to be called in the only case where the
> device description is from a board file instead of a dts.
>
> In this way, there is no need to patch 'sci_probe_regmap' for adding new
> SCI type, and also, the specific sci_port_params for a new SCI type can be
> provided by an external file.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
>  drivers/tty/serial/sh-sci.c        | 64 +++++++++++++++++++-----------
>  drivers/tty/serial/sh-sci_common.h |  3 +-
>  2 files changed, 43 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 1b83a246c7ed..c58c0793c521 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -2968,9 +2968,7 @@ static int sci_init_single(struct platform_device *dev,
>         int ret;
>
>         sci_port->cfg   = p;
> -       sci_port->ops   = &sci_port_ops;
>
> -       port->ops       = &sci_uart_ops;
>         port->iotype    = UPIO_MEM;
>         port->line      = index;
>         port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_SH_SCI_CONSOLE);
> @@ -3010,7 +3008,16 @@ static int sci_init_single(struct platform_device *dev,
>                 for (i = 1; i < ARRAY_SIZE(sci_port->irqs); i++)
>                         sci_port->irqs[i] = sci_port->irqs[0];
>
> -       sci_port->params = sci_probe_regmap(p);
> +       /*
> +        * sci_port->params params can be NULL when using a board file instead
> +        * of a dts.
> +        */
> +       if (sci_port->params == NULL) {
> +               sci_port->params = sci_probe_regmap(p);
> +               if (unlikely(sci_port->params == NULL))
> +                       return -EINVAL;
> +       }
> +
>         if (unlikely(sci_port->params == NULL))
>                 return -EINVAL;
>
> @@ -3266,9 +3273,14 @@ static void sci_remove(struct platform_device *dev)
>                 device_remove_file(&dev->dev, &dev_attr_rx_fifo_timeout);
>  }
>
> -#define SCI_OF_DATA(type, regtype)     (void *)((type) << 16 | (regtype))
> -#define SCI_OF_TYPE(data)              ((unsigned long)(data) >> 16)
> -#define SCI_OF_REGTYPE(data)           ((unsigned long)(data) & 0xffff)
> +#define SCI_OF_DATA(_type, _regtype) (\
> +&(struct sci_of_data) {\
> +       .type = (_type), \
> +       .regtype = (_regtype),\
> +       .ops = &sci_port_ops,\
> +       .uart_ops = &sci_uart_ops,\
> +       .params = &sci_port_params[_regtype],\
> +})
>
>  static const struct of_device_id of_sci_match[] __maybe_unused = {
>         /* SoC-specific types */
> @@ -3336,7 +3348,7 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
>         struct reset_control *rstc;
>         struct plat_sci_port *p;
>         struct sci_port *sp;
> -       const void *data;
> +       const struct sci_of_data *data;
>         int id, ret;
>
>         if (!IS_ENABLED(CONFIG_OF) || !np)
> @@ -3382,8 +3394,12 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
>         sp = &sci_ports[id];
>         *dev_id = id;
>
> -       p->type = SCI_OF_TYPE(data);
> -       p->regtype = SCI_OF_REGTYPE(data);
> +       p->type = data->type;
> +       p->regtype = data->regtype;
> +
> +       sp->ops = data->ops;
> +       sp->port.ops = data->uart_ops;
> +       sp->params = data->params;
>
>         sp->has_rtscts = of_property_read_bool(np, "uart-has-rtscts");
>
> @@ -3562,19 +3578,23 @@ sh_early_platform_init_buffer("earlyprintk", &sci_driver,
>  static struct plat_sci_port port_cfg __initdata;
>
>  int __init early_console_setup(struct earlycon_device *device,
> -                                     int type)
> +                              const struct sci_of_data *data)
>  {
>         const struct sci_common_regs *regs;
>
>         if (!device->port.membase)
>                 return -ENODEV;
>
> -       device->port.type = type;
> +       device->port.type = data->type;
>         memcpy(&sci_ports[0].port, &device->port, sizeof(struct uart_port));
> -       port_cfg.type = type;
> +
> +       port_cfg.type = data->type;
> +       port_cfg.regtype = data->regtype;
> +
>         sci_ports[0].cfg = &port_cfg;
> -       sci_ports[0].ops = &sci_port_ops;
> -       sci_ports[0].params = sci_probe_regmap(&port_cfg);
> +       sci_ports[0].params = data->params;
> +       sci_ports[0].ops = data->ops;
> +       sci_ports[0].port.ops = data->uart_ops;
>         regs = sci_ports[0].params->common_regs;
>
>         port_cfg.scscr = sci_ports[0].ops->read_reg(&sci_ports[0].port, regs->control);
> @@ -3588,41 +3608,39 @@ int __init early_console_setup(struct earlycon_device *device,
>  static int __init sci_early_console_setup(struct earlycon_device *device,
>                                           const char *opt)
>  {
> -       return early_console_setup(device, PORT_SCI);
> +       return early_console_setup(device, SCI_OF_DATA(PORT_SCI, SCIx_SCI_REGTYPE));
>  }
>  static int __init scif_early_console_setup(struct earlycon_device *device,
>                                           const char *opt)
>  {
> -       return early_console_setup(device, PORT_SCIF);
> +       return early_console_setup(device, SCI_OF_DATA(PORT_SCIF, SCIx_SH4_SCIF_REGTYPE));
>  }
>  static int __init rzscifa_early_console_setup(struct earlycon_device *device,
>                                           const char *opt)
>  {
> -       port_cfg.regtype = SCIx_RZ_SCIFA_REGTYPE;
> -       return early_console_setup(device, PORT_SCIF);
> +       return early_console_setup(device, SCI_OF_DATA(PORT_SCIF, SCIx_RZ_SCIFA_REGTYPE));
>  }
>
>  static int __init rzv2hscif_early_console_setup(struct earlycon_device *device,
>                                                 const char *opt)
>  {
> -       port_cfg.regtype = SCIx_RZV2H_SCIF_REGTYPE;
> -       return early_console_setup(device, PORT_SCIF);
> +       return early_console_setup(device, SCI_OF_DATA(PORT_SCIF, SCIx_RZV2H_SCIF_REGTYPE));
>  }
>
>  static int __init scifa_early_console_setup(struct earlycon_device *device,
>                                           const char *opt)
>  {
> -       return early_console_setup(device, PORT_SCIFA);
> +       return early_console_setup(device, SCI_OF_DATA(PORT_SCIFA, SCIx_SCIFA_REGTYPE));
>  }
>  static int __init scifb_early_console_setup(struct earlycon_device *device,
>                                           const char *opt)
>  {
> -       return early_console_setup(device, PORT_SCIFB);
> +       return early_console_setup(device, SCI_OF_DATA(PORT_SCIFB, SCIx_SCIFB_REGTYPE));
>  }
>  static int __init hscif_early_console_setup(struct earlycon_device *device,
>                                           const char *opt)
>  {
> -       return early_console_setup(device, PORT_HSCIF);
> +       return early_console_setup(device, SCI_OF_DATA(PORT_HSCIF, SCIx_HSCIF_REGTYPE));
>  }
>
>  OF_EARLYCON_DECLARE(sci, "renesas,sci", sci_early_console_setup);
> diff --git a/drivers/tty/serial/sh-sci_common.h b/drivers/tty/serial/sh-sci_common.h
> index cbfacdc1a836..f75c185079dd 100644
> --- a/drivers/tty/serial/sh-sci_common.h
> +++ b/drivers/tty/serial/sh-sci_common.h
> @@ -172,7 +172,8 @@ extern void sci_flush_buffer(struct uart_port *port);
>  #define max_sr(_port)          fls((_port)->sampling_rate_mask)
>
>  #ifdef CONFIG_SERIAL_SH_SCI_EARLYCON
> -extern int __init early_console_setup(struct earlycon_device *device, int);
> +extern int __init early_console_setup(struct earlycon_device *device,
> +                                     const struct sci_of_data *data);
>  #endif
>
>  #endif /* __SH_SCI_COMMON_H__ */
> --
> 2.43.0
\

