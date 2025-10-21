Return-Path: <linux-renesas-soc+bounces-23381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8665DBF6B03
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 15:12:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E50C250350B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 13:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA2A334C0F;
	Tue, 21 Oct 2025 13:12:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76626334C0E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 13:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761052350; cv=none; b=ElYDv6HhxHMaZwix5qysBqudg4Mgvs9bTmxZmcDc8hHpBx7OzcRfSZP//pNWlmwXpt2jJyydmyTKho18ZYnI9snAMBHlzmOFj4j+NElIOv8EiTi/ebqK9GpPB7AiBOArxWpURsc9YjbjWmcQA+KgDTQjaFR5SVlMEJDkDLOFVOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761052350; c=relaxed/simple;
	bh=Q1RZe4eaNh7MwrmMBQ7FwMrDLkohnjS8UmB/443+xYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IeYKIlLy8khLQ9sjaIU2cxoCvcfwi5nlncxCc3NzNBTAIkv5ijdkYpWY4nKYB3a5eJTz3N+SdAK0JB694Z42jaDjABWbDtV49juAUxylBoxoughBv5eft+IIKcEpuCAhHeTjZHLyP+SLklh+NoZoOAEn10F49kcq1lTMvAgzJFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-940d2b701a3so280551839f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 06:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761052347; x=1761657147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eonbC2VlgxUdqhXCyRQKUYPV5tl9WpWc7iwEwuNOPtM=;
        b=IoF1/PWArii3neY6pGrwraNYlB942xbmPEkMZGkP3Iet6vnDBTd5Tt+HSB//yBY8NG
         OvhO6Vi7oh1yjWl7X549SZWU1bahM3H9/Uy7Xct6CL8PFFyO23syjTjVDmGUp5MgHiDS
         ZNTwQBwCST5AhxEypfyLdT+E0zuQvr6w4RqD6mkqsLAiesLFJ7tDmACbFREkjof7Fcfo
         iLCM8Ru0AQUdrXwdmBr5Xzj6XOcHL+sURv5sHWVJM6qod5cZnB6Q7RQcClin8hBY+qf2
         qAwfIOsxcCvRie0JgLfMW4HMdy9SVIv25lrQV5kOIAXF1U+c55Hy8269cxXcIj6R2mED
         juQw==
X-Forwarded-Encrypted: i=1; AJvYcCWPnrcwLBh8OUqXyNdt+RwHsnK/wrFQ7Yu0r1FwhWW/Lpe7NlLTI+AMme3Ui2X7GaiyPFkfTnAsnqxS3/vkiBj6Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm8Sc4Xj5ER/ISwIV88ZOA54YBLPOYJOdFOUs2rdfdRSxIDo5R
	jy+m3jyPcVBcYwcQU5qSkouL6NeDudYlQGIMYv/8ZTCZNwZu/Aojq1GEcDfu2+yh
X-Gm-Gg: ASbGnctBkiv4QJrlSarToxzrVcSeNY8YmG6X8nLgVEbSarOmK7psrXb4hTPnuXDNW9b
	SonlVCIzNPDgAU1ZCrhnkg1iaxB7Tfg4wWD5Dzf0KYEcn1lMaRH04Qf56Y2t9Zc1sU2mGA3ud0S
	J1vrRrkVLsrwq/4rjwdGSlTp1O3WEXn5JEI8SzSXeG8S2GbCd/OEP8wbJ61TvyQ+cwaoX04zFty
	Fq8mhKf7bf9Zlb2hm+r55Cx1yFfw0UOeeWgRfVvO01JpleO1O7iKhcunjGbs8Lg8yzU+Vizy88q
	joU97zU6WWg1rtD84VXwx6bd0Lz+f5ee4Z7JbZNKjFKGn0dPVFNDWMlU7JU2lK7ywCc/0s6cjzh
	eUNNS+HuVJOtq1Nl6HE0K9nAa9p3yvs8WQvsHrlwqkLCa8bo/06BaCmKvvArk35p5P+Rh9RklFL
	aNlEF2Mr7RSy7wrlsIxDEy8hVcVuU85FC4+0crluIpng==
X-Google-Smtp-Source: AGHT+IHY0F8g5OCmzSjdN9cIOAXq+RkNzec0l2JcvOfaul8o10wqmd+GyzAC5ZTm4rb+1Jd1CKRchg==
X-Received: by 2002:a05:6602:2dcc:b0:93e:8bab:e17f with SMTP id ca18e2360f4ac-93e8babe2ccmr1878775439f.14.1761052347130;
        Tue, 21 Oct 2025 06:12:27 -0700 (PDT)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com. [209.85.166.171])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a973e796sm4024441173.32.2025.10.21.06.12.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:12:26 -0700 (PDT)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-430b621ec08so46708385ab.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 06:12:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWz7Ude/K5Rosmb3Ux7bfzV0y3/XPyaAt8uvm5asYIUyFv4QyPcJZDdSNluy8HilKQ7q0l1kp40/LOzNa5EC+BFUA==@vger.kernel.org
X-Received: by 2002:a05:6102:32d3:b0:5d5:f912:f891 with SMTP id
 ada2fe7eead31-5d7dd5698efmr4572794137.19.1761051947101; Tue, 21 Oct 2025
 06:05:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020080648.13452-1-herve.codina@bootlin.com> <20251020080648.13452-8-herve.codina@bootlin.com>
In-Reply-To: <20251020080648.13452-8-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Oct 2025 15:05:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV03D_3b_JA2vzW4tE_QbkkT1bN1dm+zLLLX24oDHMj0Q@mail.gmail.com>
X-Gm-Features: AS18NWDjAG4aijeipPHaID1cVN2ka14-uHYH7CPeT_DzHMmVdCqMU2sk8q9lr4k
Message-ID: <CAMuHMdV03D_3b_JA2vzW4tE_QbkkT1bN1dm+zLLLX24oDHMj0Q@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@google.com>, 
	Serge Semin <fancer.lancer@gmail.com>, Phil Edworthy <phil.edworthy@renesas.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Pascal Eberhard <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Mon, 20 Oct 2025 at 10:08, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
> interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
> order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.
>
> The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
> IRQ lines out of the 96 available to wire them to the GIC input lines.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>

Thanks for your patch!

> --- a/drivers/soc/renesas/Makefile
> +++ b/drivers/soc/renesas/Makefile
> @@ -14,4 +14,5 @@ obj-$(CONFIG_SYS_R9A09G057)   +=3D r9a09g057-sys.o
>  # Family
>  obj-$(CONFIG_PWC_RZV2M)                +=3D pwc-rzv2m.o
>  obj-$(CONFIG_RST_RCAR)         +=3D rcar-rst.o
> +obj-$(CONFIG_RZN1_IRQMUX)              +=3D rzn1_irqmux.o

One TAB too much.

> --- /dev/null
> +++ b/drivers/soc/renesas/rzn1_irqmux.c
> @@ -0,0 +1,150 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * RZ/N1 GPIO Interrupt Multiplexer
> + *
> + * Copyright 2025 Schneider Electric
> + * Author: Herve Codina <herve.codina@bootlin.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/build_bug.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/*
> + * The array index is the output line index, the value at the index is t=
he
> + * GIC SPI interrupt number the output line is connected to.
> + */
> +static const u32 rzn1_irqmux_output_lines[] =3D {
> +       103, 104, 105, 106, 107, 108, 109, 110
> +};

I did read the discussion with Wolfram, but the flexibility (and
overhead) provided by this array sounds a bit overkill to me.

What about just defining:

    #define RZN1_IRQMUX_SPI_BASE    103
    #define RZN1_IRQMUX_NUM_IRQS    8

?

If/when a new SoC with a similar setup ever arrives, you can probably
just replace the constants above by variables inside SoC-specific
match data.  And if the new mapping would be non-contiguous, you can
still revive this array ;-)

More about this below...

> +
> +static int rzn1_irqmux_parent_args_to_line_index(struct device *dev,
> +                                                const struct of_phandle_=
args *parent_args,
> +                                                const u32 output_lines[]=
,
> +                                                unsigned int output_line=
s_count)
> +{
> +       unsigned int i;
> +
> +       /*
> +        * The parent interrupt should be one of the GIC controller.
> +        * Three arguments must be provided.
> +        *  - args[0]: GIC_SPI
> +        *  - args[1]: The GIC interrupt number
> +        *  - args[2]: The interrupt flags
> +        *
> +        * We retrieve the line index based on the GIC interrupt number
> +        * provided and rzn1_irqmux_output_line[] mapping array.
> +        */
> +
> +       if (parent_args->args_count !=3D 3 ||
> +           parent_args->args[0] !=3D GIC_SPI) {
> +               dev_err(dev, "Invalid interrupt-map item\n");
> +               return -EINVAL;
> +       }
> +
> +       for (i =3D 0; i < output_lines_count; i++) {
> +               if (parent_args->args[1] =3D=3D output_lines[i])
> +                       return i;
> +       }

... then this loop can be replaced by two simple comparisons.

> +
> +       dev_err(dev, "Invalid GIC interrupt %u\n", parent_args->args[1]);
> +       return -EINVAL;
> +}
> +
> +static int rzn1_irqmux_setup(struct device *dev, struct device_node *np,=
 u32 __iomem *regs)
> +{
> +       struct of_imap_parser imap_parser;
> +       struct of_imap_item imap_item;
> +       unsigned long index_done =3D 0;

Perhaps "DECLARE_BITMAP(index_done, RZN1_IRQMUX_NUM_IRQS)",
so the BITS_PER_LONG limit can be lifted, without any cost?

> +       int index;
> +       int ret;
> +       u32 tmp;
> +
> +       /* We support only #interrupt-cells =3D <1> and #address-cells =
=3D <0> */
> +       ret =3D of_property_read_u32(np, "#interrupt-cells", &tmp);
> +       if (ret)
> +               return ret;
> +       if (tmp !=3D 1)
> +               return -EINVAL;
> +
> +       ret =3D of_property_read_u32(np, "#address-cells", &tmp);
> +       if (ret)
> +               return ret;
> +       if (tmp !=3D 0)
> +               return -EINVAL;
> +
> +       ret =3D of_imap_parser_init(&imap_parser, np, &imap_item);
> +       if (ret)
> +               return ret;
> +
> +       /* 8 output lines are available */
> +       BUILD_BUG_ON(ARRAY_SIZE(rzn1_irqmux_output_lines) !=3D 8);

... then this check can be removed, too.

> +
> +       /*
> +        * index_done is an unsigned long integer. Be sure that no buffer
> +        * overflow can occur.
> +        */
> +       BUILD_BUG_ON(ARRAY_SIZE(rzn1_irqmux_output_lines) > BITS_PER_LONG=
);

Currently this is less strict than the check above, so a bit useless?

> +
> +       for_each_of_imap_item(&imap_parser, &imap_item) {
> +               index =3D rzn1_irqmux_parent_args_to_line_index(dev,
> +                                                             &imap_item.=
parent_args,
> +                                                             rzn1_irqmux=
_output_lines,
> +                                                             ARRAY_SIZE(=
rzn1_irqmux_output_lines));
> +               if (index < 0) {
> +                       of_node_put(imap_item.parent_args.np);
> +                       return index;
> +               }
> +
> +               if (test_and_set_bit(index, &index_done)) {
> +                       of_node_put(imap_item.parent_args.np);
> +                       dev_err(dev, "Mux output line already defined\n")=
;
> +                       return -EINVAL;
> +               }
> +
> +               /*
> +                * The child #address-cells is 0 (already checked). The f=
irst
> +                * value in imap item is the src hwirq.
> +                */
> +               writel(imap_item.child_imap[0], regs + index);
> +       }
> +
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

