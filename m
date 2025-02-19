Return-Path: <linux-renesas-soc+bounces-13348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 176B9A3C0F4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 15:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C822173A8F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 13:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0368A1F5845;
	Wed, 19 Feb 2025 13:54:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1951F5826;
	Wed, 19 Feb 2025 13:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739973241; cv=none; b=REM5AfyRL0p3cFES0LXmyj0lDvjLbwR8O0zghx36Vs1mmHVtdWGfaiHUhIB6gG+gmlg9v3vw/g7S2LPJO9xoV/TnfXgTJbhaXeISwE5WprHrieLQlIAiq6pn1unTyXa0V+CchCFwMYk36BJDXw9E56f4igwLiX20t2OtcPLAqP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739973241; c=relaxed/simple;
	bh=DeOM5Df75GHcS0Y0GEoM4mWgDbiEGb7EsgOY7riDYLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tLbN1WkFSuXxtFAGFhW0qfUgTUrfT1g9K85Mj0vKZ5G9CCnt98yPG3th0ormhxW51qfzoHKPOq8lE7QE4wgOZmbUittM1/bKVFZ9+MRnFGMNS+V+2jNfYhvbi5XgtUsyVL012W28UkVXLvezqnqadwaaHucCTNMp1CySYqgbtKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-51eb181331bso2150801e0c.0;
        Wed, 19 Feb 2025 05:53:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739973238; x=1740578038;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUq3A1UUbsdcNtzCPSmxTLUPZ2kU+mhmD/anFDh6E6M=;
        b=PobW5Wnn3C7iL5wbMALxXEKC/eBsaSSch4YOjQY5GqqYXjvdDURMSODAV/SJvuuuyc
         VyGx01poetlcroStHytwQpqdph+jOLoe7JSNgyHDwdFArjj18tTnVRjA9FOvnv84Vk8H
         xX0vYBnYxTXt7ZWB0TvSMfXtxKIJ9xc18i+VLH+sC7Jxn5p5NAtLU3ctPp29I2MH4AWD
         LzggXDGmTmpCtzbCA9Yh/3b1VQ/aI7+Yn4xktMXMWJTa7pd5Ni2n9dHLQZ6mwdyE6q1U
         a1n8R8rSiVx7/46WoV7Emd6YJ1pczEmU321WGPMgBI1vMCClGHqyMa+vKxBygDQTyxbS
         v3fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcow0zkL3utM+/0WzfCdOKy1Mese+weCoUObJzDBCwPK+Iw8kL2BGieP4dbBe7l2pzmzsmjpJm3DWV3XE=@vger.kernel.org, AJvYcCWBlOoFUz2enkF+MO7IRpuB37kMn/WJo73tpeUlsi0URxEebDDjhBmyJEteuJCyGQsuiSTDPcgy51GfvkWMItp11LU=@vger.kernel.org, AJvYcCWzEcSwefVU6SqyFR1rlrSjsCj9PikVfIawjRSj9fI9Jt/UB+dBNqCgV2UKXUHKQTG8PEbdLKEzZ829fo9j@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Q6wM6wD2zXW/BFr21cvlpUvx1iooR84/90yBj32ShgT1lBgX
	ocoF2NgBe8pgdb+jU8idakROPmifDBeTpUdKU0z85OeUlDpiEZ2b/oDgDV47
X-Gm-Gg: ASbGnct/IiseQ1faLHhEVNiTWy4SrJPFuQin0JvoPAe197yYSNA4ycWfGAHmNjcCrY4
	BqeHd5i4WQM7BhkC3dPDF0or3J5rRcq0gAhdPPVljuyCgESd94MOtk/uKlKvjxS9jPxG9Fw6xJQ
	FrSpf4IypdOrI/WT8OiJr6BHaXHX9i5qOreMazbUmPvZRz+ehoIFizdrNrqeMU1v0CYO3ArdF26
	tx8lL8neUCwW5/yM6kHd3nNIIgvEOkwljnLOWr9EMTe2OovaWEp53Df6cwQqlgt97GNe5KlGPtV
	aXV+IR1cma9VFXWHIjQznBP6DbYHmOwMZzwQZGMtRRX4fHe70O6YKQ==
X-Google-Smtp-Source: AGHT+IH2/DOziPeSOrx9DFGbCIRJIP1XV7UIX47ILp59xz26B+risO2EnZs5ORpYVN1OKZ+4WdKa5w==
X-Received: by 2002:a05:6122:2807:b0:520:3465:7302 with SMTP id 71dfb90a1353d-5209dae23b9mr9340216e0c.5.1739973237634;
        Wed, 19 Feb 2025 05:53:57 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52099016353sm2566809e0c.31.2025.02.19.05.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 05:53:57 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-867120d67baso2251169241.0;
        Wed, 19 Feb 2025 05:53:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVGDR2oWM4XOcQUP1YKwwzhQ+7OU2Iy/g6qMHO76wr/QRyd0GOPgPt7PdD3ScMxe7I6uqomf64Qq8Ix82HknyPi7cs=@vger.kernel.org, AJvYcCWHHrwxJH/JJm4kOohAXqgLxXiBdzJ/6GwFa06IIEzgItNgBCIyrT8uuhs+KeiGiOmGnZiWw947MueyqTY=@vger.kernel.org, AJvYcCXs5xZ6EDpY70WpPTFYNu5JmsaFKqsBba4ChlyJfIylWmMYBmR/+6LjfQP+JHwFPHcF8n8tWTI2z71Hy43g@vger.kernel.org
X-Received: by 2002:a05:6102:1486:b0:4af:ba51:a25f with SMTP id
 ada2fe7eead31-4bd3fe03a8emr10763151137.20.1739973237124; Wed, 19 Feb 2025
 05:53:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com> <20250217105354.551788-10-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250217105354.551788-10-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Feb 2025 14:53:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVptwisoHJq9683r92XS-sgO8Uk52zxnEQUn6DTd3DeEw@mail.gmail.com>
X-Gm-Features: AWEUYZlPWgTUBbSUFTlt0CkgO_l4QftcwNhYeYkw57XRyKWMyk7h1RhnU_p-Cnk
Message-ID: <CAMuHMdVptwisoHJq9683r92XS-sgO8Uk52zxnEQUn6DTd3DeEw@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] serial: sh-sci: Introduced sci_of_data
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Mon, 17 Feb 2025 at 12:04, Thierry Bultel
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

Thanks for your patch!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -3009,7 +3010,6 @@ static int sci_init_single(struct platform_device *dev,
>                 for (i = 1; i < ARRAY_SIZE(sci_port->irqs); i++)
>                         sci_port->irqs[i] = sci_port->irqs[0];
>
> -       sci_port->params = sci_probe_regmap(p);
>         if (unlikely(sci_port->params == NULL))
>                 return -EINVAL;

Ideally, this check can be removed here... (see below)

>
> @@ -3264,9 +3264,14 @@ static void sci_remove(struct platform_device *dev)
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

Doing it this way means each and every entry in of_sci_match[] has its
own copy of struct sci_of_data, even if it is identical to one of the
others. Unfortunately s/struct sci_of_data/const struct sci_of_data/
doesn't help, so I'm afraid you have to deduplicate them explicitly.

>
>  static const struct of_device_id of_sci_match[] __maybe_unused = {
>         /* SoC-specific types */
> @@ -3334,7 +3339,7 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
>         struct reset_control *rstc;
>         struct plat_sci_port *p;
>         struct sci_port *sp;
> -       const void *data;
> +       const struct sci_of_data *data;
>         int id, ret;
>
>         if (!IS_ENABLED(CONFIG_OF) || !np)
> @@ -3380,8 +3385,12 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
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
> @@ -3471,6 +3480,7 @@ static int sci_probe(struct platform_device *dev)
>                 }
>
>                 dev_id = dev->id;
> +               sp->params = sci_probe_regmap(p, &sci_ports[dev_id]);

sp is still uninitialized here, so it crashes on SuperH.

In adition

if (!sp->params)
        return -ENODEV;

>         }
>
>         sp = &sci_ports[dev_id];
> @@ -3560,19 +3570,23 @@ sh_early_platform_init_buffer("earlyprintk", &sci_driver,
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

I think you have to do some extra setup in sci_probe_earlyprintk(), too.
That function contains the second caller of sci_init_single(), and
thus relied on sci_init_single() calling sci_probe_regmap() before.
I haven't tested that case on actual hardware yet.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

