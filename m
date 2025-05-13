Return-Path: <linux-renesas-soc+bounces-17047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA1AAB560F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 15:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65E353A24CB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 13:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3062C28F505;
	Tue, 13 May 2025 13:30:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D317482;
	Tue, 13 May 2025 13:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747143007; cv=none; b=MDRMtANxfA0llNQNWuexx57LQfd5TjGorWDZ1u/XEunVPSLRh9asR/Jw4XNKN5yQ7qmF+HgeSCzbqYP6bxqAvcy8Se4sCkAsMIs/UneFeqyAcoSt2SSoyLg8SXO3pqss1lYPZC96aK3qxUz/CZh8tGjGgv9GpIWPL/3FQAA10SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747143007; c=relaxed/simple;
	bh=1/jT1irQV0hD0/JfAceUMneUWj/CaNn1xhCEvSmqDyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XI7vwHTwtApnM+LNRhRjobSi1lD+D+rVplDhEgV17jfoucZIJmUvm3qIzl6fWPOgYsPzMgyUF9+FL6CE0Jz8qwzOPTepZlveKvqNf/xNmzG0a708+LngMMqu4ZpFYDCNE5pfF7WRHIXa+90BATxntw7ytmBXC7xNiOQlMbaxPME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86d587dbc15so4023816241.1;
        Tue, 13 May 2025 06:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747143003; x=1747747803;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h5p2EOZr1+EqtWMypguUKgD4pFT1Q96G1mqgN1MElIE=;
        b=XD2Xc/36V6m0nH2t9zAQpSxKtFdMOgP9EE4UrIT0zLlKnkDrzcOdxc9Lnmy5anS8Ba
         pv2GlPv4ZEYckedco33logj6Ab1f4G2zbJGNyaEI0ISAEi5p5Nfl0/bkLnsGg+pm/3t5
         UE575qKYvAd0Wt2gOtxKL/If5t7pXNeirzvJbj9zvV5o3C1cRBi7g4MGCTKz6pAE3rcN
         LyUEvMB9vgw0VQ/m4dLYxzIDHM/ynM+3nFHyAlOp8x6LeojX7qAT7pPnu5md7Xts+5Mb
         t+/KOTXWErQ+DE0BX8TrgiPI6YGmQlXkk5K43A2DX19qaiGI2Hv83E4STJpdofq+B07X
         qkwA==
X-Forwarded-Encrypted: i=1; AJvYcCUXzZSMsjXFsCGmi4pWckJ6mOrRpWqpk16SMgDMEjlbkBZa5EMLk9r6dKR/K/oALX++bQ25lgDoANWB7XR6@vger.kernel.org, AJvYcCWbsXJES9MnCcCsUitjIY6Gfzfm5oNP6nmWP1EtJnRbXCccMk8hC9MorumFrlUU9BFR0L5Hlsjo0zTO4H0=@vger.kernel.org, AJvYcCXk4AEWyMFqn5Cr8rfwRmsxcZ+Fqr7tqAVPrTCORPs7++MeuwWVsdT7I5RkukfbrxJc8JP1/KD4Lnh7u+jBKxD1Rj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUuUbNf0uGUhxm2R7y4imzv7K1jFrz/W4B9XiSC36QFFcacguE
	DcveIjv/nqvPie3KX1IaaBG2KHOBUpWQ3U4sDNErNr1YGJ+IpX5uOcJR68ru
X-Gm-Gg: ASbGnctGmEPk1xp0e5oMrWsL4z4IUQlypNa9fGZDff5g9Mr2+WyIlGrpUka7nrfvhhg
	z1mWIe5ahimva2APDgHE2xlZYE0mLK83c50ZnAXNoaJ0HiMrCMLGn4Y7z6INiw5a4GsnB21wkQH
	5cvxGEb6KQ7vQf7e3Wnr0itEtKlIAEBC44KOk06xBGbtp4d21OJbHq1pO3r5D/z7FnDLwo9gDfL
	Mt6j0kFy1ig+crXzgNretjKaeSbnT1ZFi6vjsgGglvxzN1MmZh4BTacUp6Pl200d9IqrSvpdy1g
	0yqx15esBEqYH0/LR+Px6Lwkq6HcKasiQc/gB7o6zh6wEk20/EEHd7P9oP40Vf5ulpvX5cnexXL
	6vDmaH4uP1TyF7w==
X-Google-Smtp-Source: AGHT+IH97OBudEFVi67EJYdOq4olbIc6UPdocpSzR2esCNaCdDdzY3+bejv//rCh/sbYCHYsMURfcQ==
X-Received: by 2002:a05:6102:2b9a:b0:4cb:644f:fc51 with SMTP id ada2fe7eead31-4df6e3958f4mr2491512137.9.1747143002529;
        Tue, 13 May 2025 06:30:02 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4deb20173d5sm6517847137.23.2025.05.13.06.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 06:30:02 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86d587dbc15so4023788241.1;
        Tue, 13 May 2025 06:30:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmRdhqcLlpy84Izx50RID8eSVHz13kUqg62Db/FrZOD14h04/E8/A1ioPxdGGY2u9fE6fb6h2N9WKgxhQ=@vger.kernel.org, AJvYcCXMFKiRLMPyi71ZIlkoNf4R+wvN0Wskcz6e8ypkZKkdcNAZQ7dLZYssTra0lSAprrS2PMEddo/cuJFqyGWm@vger.kernel.org, AJvYcCXlKQWaOWu5NYWZJQDpH5TNmfC+DKeCwSKXd5QE5LngA/PbRxM7bnayAVoNcOiuJXnip4YZ5mIxr0FwxJfVqJkklYA=@vger.kernel.org
X-Received: by 2002:a67:e408:0:b0:4db:10bf:6f2c with SMTP id
 ada2fe7eead31-4df6e4da24emr2536824137.11.1747143001753; Tue, 13 May 2025
 06:30:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com> <20250429081956.3804621-9-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250429081956.3804621-9-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 May 2025 15:29:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVdr0R4a1WpsQ7-2fO3G_dXdwDfW367m=7VKmbEP_Xxg@mail.gmail.com>
X-Gm-Features: AX0GCFu8VBeDSuejzlHlLhABhkfYHWHqiFlAAnr60hE8ObYp29deqasE78gcWao
Message-ID: <CAMuHMdVVdr0R4a1WpsQ7-2fO3G_dXdwDfW367m=7VKmbEP_Xxg@mail.gmail.com>
Subject: Re: [PATCH v8 08/11] serial: sh-sci: Add support for RZ/T2H SCI
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

Thanks for the update!

You forgot to CC the serial maintainers.

On Tue, 29 Apr 2025 at 10:20, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
>
> Define a new RSCI port type, and the RSCI 32 bits registers set.
> The RZ/T2H SCI has a a fifo, and a quite different set of registers
> from the orginal SH SCI ones.

original

> DMA is not supported yet.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v7->v8:
>   - s/rzsci/rsci/g
>   - declared SCI_PORT_RSCI as private port ID
>   - look for secondary clock
>   - report error when rsci clocks are not found

> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -675,6 +675,13 @@ config SERIAL_SH_SCI_DMA
>         depends on SERIAL_SH_SCI && DMA_ENGINE
>         default ARCH_RENESAS
>
> +config SERIAL_RSCI
> +       tristate "Support for Renesas RZ/T2H SCI variant"
> +       depends on SERIAL_SH_SCI

As this subdriver can be a module, the relevant symbols in the sh-sci
driver need to be exported, as reported by the kernel robot.

> +       help
> +         Support for the RZ/T2H SCI variant with fifo.
> +         Say Y if you want to be able to use the RZ/T2H SCI serial port.
> +
>  config SERIAL_HS_LPC32XX
>         tristate "LPC32XX high speed serial port support"
>         depends on ARCH_LPC32XX || COMPILE_TEST

> --- /dev/null
> +++ b/drivers/tty/serial/rsci.c

> +static void rsci_prepare_console_write(struct uart_port *port, u32 ctrl)
> +{
> +       struct sci_port *s = to_sci_port(port);
> +       u32 ctrl_temp =
> +               s->params->param_bits->rxtx_enable |
> +               CCR0_TIE |
> +               s->hscif_tot;

This fits on two lines:

        u32 ctrl_temp = s->params->param_bits->rxtx_enable | CCR0_TIE |
                        s->hscif_tot;

> +       rsci_serial_out(port, CCR0, ctrl_temp);
> +}

> +static const struct uart_ops rzt2_sci_uart_ops = {

rsci_uart_ops

> +       .tx_empty       = rsci_tx_empty,
> +       .set_mctrl      = rsci_set_mctrl,
> +       .get_mctrl      = rsci_get_mctrl,
> +       .start_tx       = rsci_start_tx,
> +       .stop_tx        = rsci_stop_tx,
> +       .stop_rx        = rsci_stop_rx,
> +       .startup        = sci_startup,
> +       .shutdown       = sci_shutdown,
> +       .set_termios    = rsci_set_termios,
> +       .pm             = sci_pm,
> +       .type           = rsci_type,
> +       .release_port   = sci_release_port,
> +       .request_port   = sci_request_port,
> +       .config_port    = sci_config_port,
> +       .verify_port    = sci_verify_port,
> +};

> +struct sci_of_data of_sci_r9a09g077_data = {

of_sci_rsci_data

> +       .type = SCI_PORT_RSCI,
> +       .ops = &rsci_port_ops,
> +       .uart_ops = &rzt2_sci_uart_ops,
> +       .params = &rsci_port_params,
> +};
> +
> +#ifdef CONFIG_SERIAL_SH_SCI_EARLYCON
> +
> +static int __init rzt2hsci_early_console_setup(struct earlycon_device *device,

rsci_early_console_setup

> +                                              const char *opt)
> +{
> +       return scix_early_console_setup(device, &of_sci_r9a09g077_data);
> +}
> +
> +OF_EARLYCON_DECLARE(rsci, "renesas,r9a09g077-rsci", rzt2hsci_early_console_setup);
> +
> +#endif /* CONFIG_SERIAL_SH_SCI_EARLYCON */

> --- a/drivers/tty/serial/sh-sci-common.h
> +++ b/drivers/tty/serial/sh-sci-common.h
> @@ -5,6 +5,11 @@
>
>  #include <linux/serial_core.h>
>
> +/* Private port IDs */
> +enum SCI_PORT_TYPE {
> +       SCI_PORT_RSCI = BIT(15)|0,

Please add spaces around "|".

> +};
> +
>  enum SCI_CLKS {
>         SCI_FCK,                /* Functional Clock */
>         SCI_SCK,                /* Optional External Clock */
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 2abf80230a77..44066cd53e5e 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c

> @@ -2977,14 +2978,26 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
>         struct clk *clk;
>         unsigned int i;
>
> -       if (sci_port->type == PORT_HSCIF)
> +       if (sci_port->type == PORT_HSCIF) {
>                 clk_names[SCI_SCK] = "hsck";
> +       } else if (sci_port->type == SCI_PORT_RSCI) {
> +               clk_names[SCI_FCK] = "async";

As per my comment on the bindings, I think you should use a different
name.  But the actual behavior (overriding [SCI_SCK]) is fine.

> +               clk_names[SCI_SCK] = "bus";

This is not OK, as on RSCI the SCK pin can serve as a clock input.
I see two options here:
  - Add a fifth entry for the RSCI bus clock,
  - Override the [SCI_BRG_INT] entry (which is the closest to a
    bus clock); RSCI will have its own set_termios implementation anyway.

> +       }

> @@ -3085,10 +3098,10 @@ static int sci_init_single(struct platform_device *dev,
>         }
>
>         /*
> -        * The fourth interrupt on SCI port is transmit end interrupt, so
> +        * The fourth interrupt on SCI and RSCI port is transmit end interrupt, so

(R)SCI?

>          * shuffle the interrupts.
>          */
> -       if (p->type == PORT_SCI)
> +       if (p->type == PORT_SCI || p->type == SCI_PORT_RSCI)
>                 swap(sci_port->irqs[SCIx_BRI_IRQ], sci_port->irqs[SCIx_TEI_IRQ]);
>
>         /* The SCI generates several interrupts. They can be muxed together or

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

