Return-Path: <linux-renesas-soc+bounces-16117-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F57A91D09
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 14:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CD3919E67EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 12:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E86242916;
	Thu, 17 Apr 2025 12:53:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6640F242909;
	Thu, 17 Apr 2025 12:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744894424; cv=none; b=P8A4wXwXrqdwtdXjBulPXFPXIqi5WStQxnpcMk24luZiHLcT+bfvp3OtDOEtJmxCqQ9r6I4TyIiTj6ofjGFZn3CfzYi3kK7XdCbBr3qQaq/3NifZCoAhji8Ui+WOIUkG+p9SgbgEWJcmaMLryVWf8Q/s/yThhE+xou1SrBxSbAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744894424; c=relaxed/simple;
	bh=7Ghv2Relpj6xANbnDq/uykm+0aM5uRnidbKep0j/t4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kpE6cdxeNqt9htGOlkTbAK9cJi2pG2eEdYc0y+cXDnN1i0tK3FSzJRiXVpUrnGjPBvqL5y7owv2bDiPIsEqdCu36gb1PWlTgcjrrXdJlcqTcbuXnNZ19cRNqX0SiGol+kRnjj9/rUoXsApKsYHGYMq4F+H4w9Cn6ZDi2bieGkuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-523f670ca99so300326e0c.1;
        Thu, 17 Apr 2025 05:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744894421; x=1745499221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zvjcsb6AOpM3K3pVY6lsnpTQFXcAQ1Kjw9zu0dMXyec=;
        b=OQa7V/0mrz183UtZ1be+D1rxPAUuTlNLHDA59IFYVG9Oq1gkXM2SnklWyjEbCDl3zP
         ZfhU52WzKm9PzxqPWpdjjyi8KHPhCzKGGky3F/1COTp6DAqa2rq+0fUA+SLIYYjLM+Jl
         YJmwpEWvT3UrERVs3wGO33I87T7VirG1z/km/lXxCvprSzO92+x5iYZGC5Ta+rV73FTj
         Y9NLUG8UJlcTPnSYrjcw/BlXneRBmEdfLQNn3Pe9kuLYVgZICOGLxFZ1g8ZfoZEEiLbl
         +cbk4LHWYVAoUxJB6BIR1s4ULBlnBNBGUUXYsjwc7CYkY49LbMrkDzr6WzSSpmz2qLM0
         GCsA==
X-Forwarded-Encrypted: i=1; AJvYcCVPSzoxzR1MdNueyLtaWh6Jbd62Cd3O3SbMEkzH3w340imjnO3k68860VVz0Qtlm5u1Jys+39U4+EbzO2FO@vger.kernel.org, AJvYcCWl4MNxoeF+++Zkmm68P1BTtKxWxy1oVvuDCcF2zGcYlSl1HIi05Q/VMbjFVWIjy8Dwr33NsLXsKbQrHSg=@vger.kernel.org, AJvYcCXRREurooyXyhIMd/oPWUEAx960viCW3tv7QoDdF5ILMuFvg8S2qD6ZNGw8lbLJJU8QdhYDJ03E7pyAw0U74OKNIkg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3kpWC1w/tjVUZsjegEMiVGw6BieCQjfk0x+0Lj6KHwV0LIY+u
	vGfPyKN+whBmdoQMRe+hbSIMB0mdLPQvjxvRdJrxp0hwqsYwYptA7dR0JRdb
X-Gm-Gg: ASbGncvaSmpjHM/QsBVRzaVZj9QS08nP88pYBNVXBXiwiktnWSCdf6fauDWzrApex77
	OofhV7j36AB8dvExzsxw8hH6jGX+7g3GWISI4Lf4GNBV0X8P2ZD0hgyOTTnLSQmAPhOgcxiKSUY
	71g53EW8UcRLlJ8nSOjGeDcJfdcyHywRyTDuWbIy1IyExgO9eZanrx/c4kX2DbOMLu5dXnOneWZ
	KM6xeKaPHHK9P7ISh61iEgY5/cAtSDU8cV7JLQ/UsXiN829rFCd9U+XwBfw5uwM2nbQmPKGErAQ
	YMGDqwzGCwD2aVR5pB8pJij6scwesON5X4cD5o3mNoAv3wofKNq4ckqElYVgHbSDLF4iPX9wty3
	3DXxE940=
X-Google-Smtp-Source: AGHT+IFulP1HXVSEkuZX/SMsL784To439HCOj1IhURB5pK20fbcGGWJEKHup48O9eC9X6w224gD9NA==
X-Received: by 2002:a05:6122:3193:b0:529:c87:e4a5 with SMTP id 71dfb90a1353d-5290de97dbamr5102004e0c.4.1744894420964;
        Thu, 17 Apr 2025 05:53:40 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87557280076sm3562130241.21.2025.04.17.05.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 05:53:40 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-51eb18130f9so356762e0c.3;
        Thu, 17 Apr 2025 05:53:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQw0QAN/2tTPlw3806bIwvt6Md3KnPJ72OBIKqk4bNJZpYDKiOZGw3URO8LJ8XNmNdlvU7zD1fBg8fZQFPkZaXps4=@vger.kernel.org, AJvYcCWZjYqRhQ3sGFpnHMWZDOgoFMcu5YHYsBQMmkR4ywtIHWm2qUQa/pTyTeNlsSYWgEsX5N/bZenBQkkgY1Ew@vger.kernel.org, AJvYcCXkEqmRN35g4s+Y7BDLp3REwl7dgA5sxcBlFgN+7XQmBLfJTUHW8tPqlYahhTmoKuL0ohaxJ5DZSy1VpZA=@vger.kernel.org
X-Received: by 2002:a05:6122:1d51:b0:518:965c:34a with SMTP id
 71dfb90a1353d-5290dd66f87mr4647385e0c.2.1744894420505; Thu, 17 Apr 2025
 05:53:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com> <20250403212919.1137670-11-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250403212919.1137670-11-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Apr 2025 14:53:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXTKXkROsPWfUWtJuOEDwgR=bFiN8+y7BEokBXLsVunrg@mail.gmail.com>
X-Gm-Features: ATxdqUHPi3SELs0o3s_1xW5YtJuZraG9vDa5YI6FnA8mpnb3ru4ddmh1iW0rkoQ
Message-ID: <CAMuHMdXTKXkROsPWfUWtJuOEDwgR=bFiN8+y7BEokBXLsVunrg@mail.gmail.com>
Subject: Re: [PATCH v7 10/13] serial: sh-sci: Add support for RZ/T2H SCI
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Thu, 3 Apr 2025 at 23:30, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Define a new RSCI port type, and the RSCI 32 bits registers set.
> The RZ/T2H SCI has a a fifo, and a quite different set of registers
> from the orginal SH SCI ones.
> DMA is not supported yet.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v6->v7:
>   - Renamed compatible string to r9a09g077-rsci

Thanks for the update!

Just some cosmetic comments...

> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -675,6 +675,13 @@ config SERIAL_SH_SCI_DMA
>         depends on SERIAL_SH_SCI && DMA_ENGINE
>         default ARCH_RENESAS
>
> +config SERIAL_RSCI
> +       tristate "Support for Renesas RZ/T2H SCI variant"
> +       depends on SERIAL_SH_SCI
> +       help
> +         Support for the RZ/T2H SCI variant with fifo.

FIFO

> +         Say Y if you want to be able to use the RZ/T2H SCI serial port.
> +
>  config SERIAL_HS_LPC32XX
>         tristate "LPC32XX high speed serial port support"
>         depends on ARCH_LPC32XX || COMPILE_TEST

> --- /dev/null
> +++ b/drivers/tty/serial/rsci.c

> +static u32 rzsci_serial_in(struct uart_port *p, int offset)

rsci_* (everywhere)

> +{
> +       return readl(p->membase + offset);
> +}

> +static void rzsci_prepare_console_write(struct uart_port *port, u32 ctrl)
> +{
> +       struct sci_port *s = to_sci_port(port);
> +       u32 ctrl_temp =
> +               s->params->param_bits->rxtx_enable |
> +               CCR0_TIE |
> +               s->hscif_tot;

        u32 ctrl_temp = s->params->param_bits->rxtx_enable | CCR0_TIE |
                        s->hscif_tot;

> +       rzsci_serial_out(port, CCR0, ctrl_temp);
> +}

> +static const struct uart_ops rzt2_sci_uart_ops = {

rsci_uart_ops

> +       .tx_empty       = rzsci_tx_empty,
> +       .set_mctrl      = rzsci_set_mctrl,
> +       .get_mctrl      = rzsci_get_mctrl,
> +       .start_tx       = rzsci_start_tx,
> +       .stop_tx        = rzsci_stop_tx,
> +       .stop_rx        = rzsci_stop_rx,
> +       .startup        = sci_startup,
> +       .shutdown       = sci_shutdown,
> +       .set_termios    = rzsci_set_termios,
> +       .pm             = sci_pm,
> +       .type           = rzsci_type,
> +       .release_port   = sci_release_port,
> +       .request_port   = sci_request_port,
> +       .config_port    = sci_config_port,
> +       .verify_port    = sci_verify_port,
> +};
> +
> +static const struct sci_port_ops rzsci_port_ops = {

rsci_port_ops

> +       .read_reg               = rzsci_serial_in,
> +       .write_reg              = rzsci_serial_out,
> +       .clear_SCxSR            = rzsci_clear_SCxSR,
> +       .transmit_chars         = rzsci_transmit_chars,
> +       .receive_chars          = rzsci_receive_chars,
> +       .poll_put_char          = rzsci_poll_put_char,
> +       .prepare_console_write  = rzsci_prepare_console_write,
> +       .suspend_regs_size      = rzsci_suspend_regs_size,
> +};
> +
> +struct sci_of_data of_sci_r9a09g077_data = {

of_sci_rsci_data

> +       .type = PORT_RSCI,
> +       .regtype = SCIx_RZT2H_SCI_REGTYPE,
> +       .ops = &rzsci_port_ops,
> +       .uart_ops = &rzt2_sci_uart_ops,
> +       .params = &rzsci_port_params,
> +};
> +
> +#ifdef CONFIG_SERIAL_SH_SCI_EARLYCON
> +
> +static int __init rzt2hsci_early_console_setup(struct earlycon_device *device,
> +                                              const char *opt)

rsci_early_console_setup

> +{
> +       return scix_early_console_setup(device, &of_sci_r9a09g077_data);
> +}
> +
> +OF_EARLYCON_DECLARE(rzsci, "renesas,r9a09g077-rsci", rzt2hsci_early_console_setup);
> +
> +#endif /* CONFIG_SERIAL_SH_SCI_EARLYCON */

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> --- a/include/linux/serial_sci.h
> +++ b/include/linux/serial_sci.h
> @@ -38,6 +38,7 @@ enum {
>         SCIx_HSCIF_REGTYPE,
>         SCIx_RZ_SCIFA_REGTYPE,
>         SCIx_RZV2H_SCIF_REGTYPE,
> +       SCIx_RZT2H_SCI_REGTYPE,

SCIx_RSCI_REGTYPE?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

