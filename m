Return-Path: <linux-renesas-soc+bounces-26456-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C7DD051C6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 18:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9132330D4102
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 17:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05BAB299948;
	Thu,  8 Jan 2026 17:31:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDB71EBFE0
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 17:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767893475; cv=none; b=ZroJNoCxKFlEFqLDmQHu4XvZrn4N4Q24kMcnVLkkCCaSyFZ3Z9//bLF8kjACpTeSGqpAA/GQt+deqpF8HHUNbezFyw86Tsrgi6V5eGHkluEtb/DBI/fLqgPjPNg81NkdsuCe7I4wCCn+LD9gKyZcGArdAeynlwAbl6BjRLCvcIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767893475; c=relaxed/simple;
	bh=6Y/PEiuX8F2nfVedwNRlHLJB8LCK+B2XWyMnAPnOdcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dsifpVVVt360s/5NWYbnm+Jem4p/MdMhF5zf01b3rS5wwmzOcn+mNS5Pi9t0f1s3SctyrUiZTSAsA45FA+ZJJC+O8HKFkI4nnNiCFA7c9lomr6/RccS/qBdxbbblRqPE/AnSY+vMvlp3zXH1iv0z/Wce8V2bFQOLZJvIBOFwfVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5636470c344so5895e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 09:31:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767893473; x=1768498273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ue0J1j0aj6DWC6mYUAkG3yhlZfjuLnCsNmeQNbfJJJs=;
        b=p+VfEgSL/i40twPxAPggsgFEOy0Ut/DW/8ydHPSz0VoEDVSIDy8QBcz9sTaspDlW9C
         twLxaF3bKGWxQuO/+1M5otMLhomWNMPpvGPg1DJvdfcbbCslRq+nss2yH3OVQH3Rjk+m
         2G7N/Tt7vgYftbP7glxemzuTaIOyXYN1bNNdkURy+nWQ0sZYubzqw7rUaxyie77UlPIb
         FyRLRcptuHMaDgC44wQS1fPSSCCcFaqCv98FqqX6afKXVfS+gNJs3X1JqDsOU90UbvK6
         a4OeTPLR/jbWxIAH49PdNYDc4v3CynfrnwbW5BdYHBGQJxJdudxxrcZn9qdDKf1ajmsL
         BgEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhh/cZc++Y5aEDCCNHkNV4rqFYSSsz5BUgVBpxVmSfqOXAvBWmqjLKHDAsTMSJNfB/CEtMxPaxYSaWvz+1PiZgKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6CGVJMSRfVDae8KYBZ9oNsh6XyJSDNM30YdKKFKnxTe75SUmN
	253zbfM8L9InXmZKWt4KM013NSN1VzO/Rk1aI2n37DT3/F5oHE6vmhPhF4+9f+AM
X-Gm-Gg: AY/fxX4K4gz5HQOS57kKGi8c4ybWwgS5iKMPpDh1x6bC4J3ko+JBapa+LbeNJaZX7Uf
	N0pAPpRuUuHh611wkd45owRviBwMPxEioFOQYxyrh1a0vRa40d1EAgDMG/1AgWnvRcr5v58Vy8o
	HyUa3u2yPtlS26XKskxiWMVmpself+XwHJ0/HUIFOPA6PvZa1k6xuaFXKZ4eWWd4q6BosFYAoH2
	7Tf+IZIgQJ2YPYEJYOe+UvGZ0K/fFGOOOlsSrYhAJLP9/ADUSzoZElZZTHuVNPY8QyvmZttlkM7
	MWBKY4HZFPanqdSMHgdgl9/zrILC0nsa/JVqfcwqc6y5BPQsW/sQ+206Abode1pYXFzLSMkInRK
	4ddH8ouGLiLkUurro9tEDByvZLA4Q6JXU0EJ6HSxYIFGQYF2Lk49f14fipAPIfitvR8BpiPxlRA
	rRINIzqa1RWD97WyVFxM12oJxwjr+WdAePD7ls48+ruF9b6EyX1DCR
X-Google-Smtp-Source: AGHT+IHPN9BfZ6N1bKaxtRkK4su/Ncv7QM8tPGNinNypqeKEcSTiNcRaokiBBRCuO5UbbehlYeFKBw==
X-Received: by 2002:a05:6122:31a6:b0:55b:6b20:a17a with SMTP id 71dfb90a1353d-56347e96ac2mr2615292e0c.9.1767893473165;
        Thu, 08 Jan 2026 09:31:13 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a20a183sm6687615e0c.9.2026.01.08.09.31.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 09:31:12 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-563497c549cso1397509e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 09:31:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfM0ddPkE2DtHC84ksJUrRrVhPWeUjEx3DBIFlSzHUS9ULF78uu3AqWK2h6O5yLRv0+nSkfbMcuEpHUsVSDpDjsw==@vger.kernel.org
X-Received: by 2002:a05:6102:2acd:b0:5df:a98f:ca85 with SMTP id
 ada2fe7eead31-5ecb68d3054mr2835192137.21.1767893472628; Thu, 08 Jan 2026
 09:31:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251205150234.2958140-5-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251205150234.2958140-5-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 18:31:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX_ezZMYc3BRJRLFVwir6NPnxNUPw1Z0+oQDZjx_unJjA@mail.gmail.com>
X-Gm-Features: AQt7F2qqDC6QTfmP9u1liaa7gLEyyN7-59wLYd5yvmPeQ7bjaUsCdlwPUmuKCIA
Message-ID: <CAMuHMdX_ezZMYc3BRJRLFVwir6NPnxNUPw1Z0+oQDZjx_unJjA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] pinctrl: renesas: rzt2h: add GPIO IRQ chip to
 handle interrupts
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Fri, 5 Dec 2025 at 16:03, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and Renesas RZ/N2H (R9A09G087) SoCs have
> IRQ-capable pins handled by the ICU, which forwards them to the GIC.
>
> The ICU supports 16 IRQ lines, the pins map to these lines arbitrarily,
> and the mapping is not configurable.
>
> Add a GPIO IRQ chip to the pin controller that can be used to configure
> these pins as IRQ lines.
>
> The pin controller places the requested pins into IRQ function,
> disabling GPIO mode. A hierarchical IRQ domain is used to forward other
> functionality to the parent IRQ domain, the ICU. The ICU does level
> translation and then forwards other functionality to the GIC.
>
> Wakeup capability is implemented by placing the entire pin controller on
> the wakeup path if any pins are requested to be wakeup-capable.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c

> @@ -644,14 +650,194 @@ static const char * const rzt2h_gpio_names[] = {
>         "P35_0", "P35_1", "P35_2", "P35_3", "P35_4", "P35_5", "P35_6", "P35_7",
>  };
>
> +/*
> + * Interrupts 0-15 are for INTCPUn, which are not exposed externally.
> + * Interrupts 16-31 are for IRQn. SEI is 32.

Isn't SEI 406, and DMAC0_INT0 32?

> + * This table matches the information found in User Manual's Table 17.2,
> + * List of multiplexed pin configurations (5 of 51).

3-6 of 51

However, the mapping is much easier to derive from the "Interrupt" rows
in the various tables in Section 17.5 ("Multiplexed Pin Configurations"),
as these match the order in rzt2h_gpio_irq_map[].

> + * RZ/N2H has the same GPIO to IRQ mapping, except for the pins which
> + * are not present.
> + */
> +static const u8 rzt2h_gpio_irq_map[] = {
> +       32, 16, 17, 18, 19,  0, 20, 21,

s/32/406/, but that doesn't fit in u8, and would overflow .used_irqs[],
so you probably should translate it in the code instead.

> +       22,  0,  0,  0,  0,  0,  0,  0,
> +       23, 24, 25, 26, 27,  0,  0,  0,
> +        0,  0, 28, 29, 30, 31,  0,  0,
> +        0,  0,  0,  0,  0, 32, 16, 17,
> +       18, 19, 20, 21, 22,  0,  0,  0,
> +        0,  0, 24, 25, 26, 27,  0, 28,
> +       29, 30, 31,  0,  0,  0,  0,  0,
> +        0,  0,  0,  0,  0, 24, 32, 16,
> +        0,  0,  0,  0,  0,  0,  0,  0,
> +       20, 23, 17, 18, 19,  0, 16, 25,
> +       29, 20, 21, 22, 23,  0,  0,  0,
> +        0,  0,  0,  0, 17,  0,  0, 18,
> +        0,  0, 19,  0,  0, 20,  0, 30,
> +       21,  0,  0, 22,  0,  0, 24, 25,
> +        0,  0,  0,  0,  0, 16, 17,  0,
> +       18,  0,  0, 26, 27,  0,  0,  0,
> +       28, 29, 30, 31,  0,  0,  0,  0,
> +       23, 31, 32, 16, 17, 18, 19, 20,
> +        0,  0,  0,  0,  0,  0,  0,  0,
> +        0,  0,  0,  0,  0,  0,  0,  0,
> +        0,  0,  0,  0,  0,  0,  0,  0,
> +       27,  0,  0, 21, 22, 23, 24, 25,
> +       26,  0,  0,  0,  0,  0,  0,  0,
> +       27, 28, 29, 30, 31,  0,  0,  0,
> +        0,  0,  0,  0,  0,  0,  0,  0,
> +        0,  0,  0,  0,  0, 28, 32, 16,
> +       17, 18, 19,  0,  0,  0,  0, 20,
> +       21, 22, 23,  0,  0,  0,  0,  0,
> +        0,  0,  0,  0, 24, 25,  0,  0,
> +        0,  0, 26, 27,  0,  0,  0, 30,
> +        0, 29,  0,  0,  0,  0,  0,  0,
> +        0,  0,  0,  0,  0,  0,  0,  0,
> +        0,  0,  0, 28, 29, 30, 31,  0,
> +        0,  0,  0,  0,  0,  0,  0, 30,
> +        0,  0,  0,  0,  0,  0,  0,  0,
> +};

> +static int rzt2h_pinctrl_suspend_noirq(struct device *dev)
> +{
> +       struct rzt2h_pinctrl *pctrl = dev_get_drvdata(dev);
> +
> +       if (atomic_read(&pctrl->wakeup_path))
> +               device_set_wakeup_path(dev);
> +
> +       return 0;
> +}

Please move this function closer to the location where it is used,
i.e. just above rzt2h_pinctrl_pm_ops.

>+ static int rzt2h_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
>+                                            unsigned int child,
>+                                            unsigned int child_type,
>+                                            unsigned int *parent,
>+                                            unsigned int *parent_type)
>+ {
>+        struct rzt2h_pinctrl *pctrl = gpiochip_get_data(gc);
>+        u8 port = RZT2H_PIN_ID_TO_PORT(child);
>+        u8 pin = RZT2H_PIN_ID_TO_PIN(child);
>+        u8 parent_irq;
>+
>+        parent_irq = rzt2h_gpio_irq_map[child];
>+        if (parent_irq < RZT2H_INTERRUPTS_START)

Or !parent_irq, cfr. the check in rzt2h_gpio_init_irq_valid_mask()?

>+                return -EINVAL;
>+
>+        if (test_and_set_bit(parent_irq - RZT2H_INTERRUPTS_START,
>+                             pctrl->used_irqs))
>+                return -EBUSY;
>+
>+        rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin, PFC_FUNC_INTERRUPT);
>+
>+        *parent = parent_irq;
>+        *parent_type = child_type;
>+
>+        return 0;
>+ }

> +
>  static int rzt2h_gpio_register(struct rzt2h_pinctrl *pctrl)
>  {
>         struct pinctrl_gpio_range *range = &pctrl->gpio_range;
>         struct gpio_chip *chip = &pctrl->gpio_chip;
> +       struct device_node *np = pctrl->dev->of_node;
> +       struct irq_domain *parent_domain;
>         struct device *dev = pctrl->dev;
>         struct of_phandle_args of_args;
> +       struct device_node *parent_np;
> +       struct gpio_irq_chip *girq;
>         int ret;
>
> +       parent_np = of_irq_find_parent(np);
> +       if (!parent_np)
> +               return -ENXIO;

Despite your claim that the interrupts properties are optional,
I think  this will abort probing when they are actually missing?

> +
> +       parent_domain = irq_find_host(parent_np);
> +       of_node_put(parent_np);
> +       if (!parent_domain)
> +               return -EPROBE_DEFER;
> +
>         ret = of_parse_phandle_with_fixed_args(dev->of_node, "gpio-ranges", 3, 0, &of_args);
>         if (ret)
>                 return dev_err_probe(dev, ret, "Unable to parse gpio-ranges\n");

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

