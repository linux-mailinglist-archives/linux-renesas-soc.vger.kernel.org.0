Return-Path: <linux-renesas-soc+bounces-24631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5DAC5C6DB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 11:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A23D94E7BA9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 09:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F342FB99C;
	Fri, 14 Nov 2025 09:41:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C74235358
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 09:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763113310; cv=none; b=M/z92ayj0drhnr+Lvy892C/vFxzJTpzDE2Kbodl7MqVPQ42/q2WpDv+rTsfVZ16/wTGQc1dSvpaza3W+KMm0Oi4itEmy0zFEIoXrHxbmvB78nXDzJ4wuG5HDIv2IxiD1FWYudGAvlvTsvwaqn/Vdez6/OIEFza5KY1HaB8n6Hik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763113310; c=relaxed/simple;
	bh=NpM95N9DN3UFQ7COCkLjeUezCaohFHKQ5vC1GQJ5VCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X9N+17uJ39Wa8fqk/neVfao81wNf1WD3wNwJ1EnyPK8bi3ArEweCqmMgfsZrcAeZKHDQI/PnYpQa0d84ZgDU1kcnuJPbVwCXVJbmo0Ao8zW1LYpqfqeFQA3+eMQKJDQnN0m6bG+/FSfjT+KAbRmScigAw0KeS3qXuJLOieHybVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-93725308c15so1010339241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 01:41:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763113304; x=1763718104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kfkPNlB0ztwDghu8aUOEh8JnL7NlmqdeOqG584soohM=;
        b=KhABNn5Fw58VwDImqX4v+M0YsSpW77iR/9//YEBKKKTwi6YS3jMDiexgH7kNQ+hx+J
         2bt27x2H7S25/Bh6fNpxPQoVvOPRqQgcFbCSYrBtbbL3ZMq2G1h+UpuoDGuOirAlpM+q
         0GqhzGsOTwbcWNbOhTkP1ZBQux7Z+/qcnntShXE5Sj+p9UUvwUIJU3tQOvCoPKSWuDip
         CX1G2DqR1pZBQMjPWDBlEVoxspCw+x1G5uNEV/AYWIlma9gJi/SHRqnAO9yAfA1brEet
         8mQkIK577RBJH5so3wZ10D9rLkY2TWK2EiKovjZ5dXnpCYHpuS4tYzjd8jiHMksO6CEQ
         DBHg==
X-Forwarded-Encrypted: i=1; AJvYcCUHwkRbtrx8ho3ieNU+d6jzcmxu+Tt1Z+5ywDETleNjIyIhSyUO5u2yqDQSWWGmGBB06apV1s9H1Ezjlgu45gIPgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYviEGRM2+zM6Ico8NsfZdOquoxow15wOkjljKC4x+VQoqJdz4
	R+//IJ1O2G/04ipg6eLBprAJQ7/RkXpzcVRR65jCaXmVk2J4iGlaknA2ReZdKWeu
X-Gm-Gg: ASbGncsxhE/57AR4t/TcJ1fbyaMz04xBweoYSAumIBJkRw0VEPcAynt0NtrO9khG5x/
	jVl53j3arJCHei1N+X1LuLw/Y+ocwdczrmPpx/KsZ9ZoVJIzBGKUWT6qbd1edbLLo5rvQNZsCxU
	HkzOdl90cM8reQJ8np9luq3w1J03KTfGbJfJNd3JVM1wn7pPaw58+3s+wW8I8Eh7degtvxH9z3B
	2q+KaFnKLijZBTO/Mhfi7e8EgLSNvGsQvYx1cnX/wl2X7k9dlOLSQMVPuF8dk7c/27+saO9sSEB
	NnWe4QAAY0sJMFLC4o37kKR10Yzha5zdQirplyw2FIGJGy5+N5r6dxbn9AZ1PaWOBfozbpn6br3
	G2bF+GDe9+i5snz8mL/OKIy5hrpwhdzizxZ5IeKikhpxjFAtnxXq8drWnPCabO1qUHswgdrzNo4
	uO8JNl6rGRQvEc5XfJeOvDRVgrWVhrs2UXUNhlZ80kKi+IeRCS
X-Google-Smtp-Source: AGHT+IFVdb2SvxLeaE6ml4xOAB8Lc88CkvNwmYrcEFbPEd3/Lbdgy0CwOlOELcN+piq3p/9bXRQHiw==
X-Received: by 2002:a05:6102:50a7:b0:5db:ecac:5800 with SMTP id ada2fe7eead31-5dfc5b9e6a2mr1027967137.19.1763113304327;
        Fri, 14 Nov 2025 01:41:44 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb707521fsm1462128137.2.2025.11.14.01.41.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 01:41:42 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5dbde7f4341so2195276137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 01:41:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXWI+yiX2KoGiarFWXjp8xnuI8KF9uOWQERxHTQoFTGiJ3PbwLym/ZUi13IW9sUJOYH3uggV8nZtbvrPgHvH35rFA==@vger.kernel.org
X-Received: by 2002:a05:6102:1621:b0:5dd:37a3:c389 with SMTP id
 ada2fe7eead31-5dfb406b273mr2848749137.2.1763112818859; Fri, 14 Nov 2025
 01:33:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027123601.77216-1-herve.codina@bootlin.com> <20251027123601.77216-8-herve.codina@bootlin.com>
In-Reply-To: <20251027123601.77216-8-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Nov 2025 10:33:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUKO_=OeepHwOdFE7wWjxVQTCnq_9g0qJUB3UXE6Vb8GA@mail.gmail.com>
X-Gm-Features: AWmQ_bkS97Bhw3nuMQeFYkA968hCya9xwSjNdd3dxLkusXF7TWSJCaeM8rc-7KQ
Message-ID: <CAMuHMdUKO_=OeepHwOdFE7wWjxVQTCnq_9g0qJUB3UXE6Vb8GA@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
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

On Mon, 27 Oct 2025 at 13:36, Herve Codina (Schneider Electric)
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

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -62,6 +62,7 @@ config ARCH_RZN1
>         select PM
>         select PM_GENERIC_DOMAINS
>         select ARM_AMBA
> +       select RZN1_IRQMUX

I guess it makes some sense to enable this unconditionally...
But as the GPIO driver it relies on is not enabled automatically,
perhaps

    select RZN1_IRQMUX if GPIO_DWAPB

?

>
>  if ARM && ARCH_RENESAS
>
> @@ -459,6 +460,9 @@ config PWC_RZV2M
>  config RST_RCAR
>         bool "Reset Controller support for R-Car" if COMPILE_TEST
>
> +config RZN1_IRQMUX
> +       bool "Renesas RZ/N1 GPIO IRQ multiplexer support" if COMPILE_TEST
> +
>  config SYSC_RZ
>         bool "System controller for RZ SoCs" if COMPILE_TEST
>         select MFD_SYSCON

> --- /dev/null
> +++ b/drivers/soc/renesas/rzn1_irqmux.c

> +static int rzn1_irqmux_parent_args_to_line_index(struct device *dev,
> +                                                const struct of_phandle_=
args *parent_args)
> +{
> +       /*
> +        * The parent interrupt should be one of the GIC controller.
> +        * Three arguments must be provided.
> +        *  - args[0]: GIC_SPI
> +        *  - args[1]: The GIC interrupt number
> +        *  - args[2]: The interrupt flags
> +        *
> +        * We retrieve the line index based on the GIC interrupt number
> +        * provided.
> +        */
> +
> +       if (parent_args->args_count !=3D 3 ||
> +           parent_args->args[0] !=3D GIC_SPI) {

Fits on a single line.

> +               dev_err(dev, "Invalid interrupt-map item\n");
> +               return -EINVAL;
> +       }
> +
> +       if (parent_args->args[1] < RZN1_IRQMUX_GIC_SPI_BASE ||
> +           parent_args->args[1] >=3D RZN1_IRQMUX_GIC_SPI_BASE + RZN1_IRQ=
MUX_NUM_OUTPUTS) {
> +               dev_err(dev, "Invalid GIC interrupt %u\n", parent_args->a=
rgs[1]);
> +               return -EINVAL;
> +       }
> +
> +       return parent_args->args[1] - RZN1_IRQMUX_GIC_SPI_BASE;
> +}
> +
> +static int rzn1_irqmux_setup(struct device *dev, struct device_node *np,=
 u32 __iomem *regs)
> +{
> +       DECLARE_BITMAP(index_done, RZN1_IRQMUX_NUM_OUTPUTS) =3D {};
> +       struct of_imap_parser imap_parser;
> +       struct of_imap_item imap_item;
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
> +       for_each_of_imap_item(&imap_parser, &imap_item) {
> +               index =3D rzn1_irqmux_parent_args_to_line_index(dev, &ima=
p_item.parent_args);
> +               if (index < 0) {
> +                       of_node_put(imap_item.parent_args.np);
> +                       return index;
> +               }
> +
> +               if (test_and_set_bit(index, index_done)) {
> +                       of_node_put(imap_item.parent_args.np);
> +                       dev_err(dev, "Mux output line already defined\n")=
;

Perhaps print the actual index? E.g.

    dev_err(dev, "Duplicate GIC_SPI interrupt %u in interrupt-map\n",
            RZN1_IRQMUX_GIC_SPI_BASE + index);

Hmm, having to add the base again would be a reason to let
rzn1_irqmux_parent_args_to_line_index() return the actual GIC interrupt
number instead...

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
> +
> +static int rzn1_irqmux_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *np =3D dev->of_node;
> +       u32 __iomem *regs;
> +
> +       regs =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(regs))
> +               return PTR_ERR(regs);
> +
> +       return rzn1_irqmux_setup(dev, np, regs);

As Wolfram already pointed out, this function looks a bit shallow.

> +}

Nothing critical, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

