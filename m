Return-Path: <linux-renesas-soc+bounces-25000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D8DC7AE41
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 17:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 192CD4E8776
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2A12E8DE1;
	Fri, 21 Nov 2025 16:39:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3DA2DE71A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 16:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763743181; cv=none; b=OJ89ZCeHdDzqNQWkabfR7GtQXJwesMQ0e8BB7W3HWWlFp5iCDPmPMah8wXqlfhrHIr7XOsT/wuEW9T/8pIuQJYWmXG9IF99QzhGKjPLgiyukopU3bk15V/ZWSmFmjruFL0S2k7sPDXYwx8IZzynjXjrwBzmulRWiB69s9G1KnVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763743181; c=relaxed/simple;
	bh=Bmgoopsu+0H9XAtez17h1igzsNM8F/VgudfpujlL6Rg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aYwncDMBsLRfcfdeyQ29IiDZfsSVnv3ICzTzOxIk9iJm/vRlxvrdx9GJgBsSLuqlkAnQhR2pRoxtEDCGzw1B0YfyfUejuuubyU61H9PyuSJFIGwuNYaj4fKTBLzFdyoxa55978+cmOm11wRkOTqcNgSH1H5vpRbG7WckrjuRXLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5dbe6be1ac5so866493137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:39:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763743178; x=1764347978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZ30K5c1Yy25S+FIha2zG0Xwf4NQrvz4vEnETFtA7gE=;
        b=so1JKkGd7i78ZedgKRvKBeDSv3lkEFZSxiwSKvN4XREh6B92Ad3vc8qkosOIsZKMRO
         2bBwb0CpaBjlTxWbxnus+2wLOOremiy1xQSZ4UNXxuAskOjftX3njVeFpsVNdadSnnmz
         VqNdG/4tcZI4A4urbVR7vY29By9KRjqh8r7UQq/Ec3rhkypi+lXSQiuCT3mIErb3Wjni
         eIwjJ1ay4Z0IuqsYg7pnEs1l9UPc35/7lFKR4Q+nFK3cWccrJiuk2nYrPf8RxvnFsMjh
         1lDsaIEgLKcfpzdOE62D5xFhVV17bVZS2JUlnJUCGeWm7GsKi096VPOMbVOHO//cg3G1
         +r6g==
X-Forwarded-Encrypted: i=1; AJvYcCXkpu7F66+Er8EfTojF6FlCMBE1HqbAGQgtXJ8JHvgeu6Q2Tb2WDntPB8RQZQ70OiPruFb87VXPbMnhfjkDL/wJMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm7PfeiE0/7PHEa4qeblPfx2FWh3iLj2GiBtuYrqHSfG6YwmUx
	sd2ubgpyWDMb62IlCOJ+QPFunE+4EraIsTsv3teANiuhpvi8sOavF42eIzaZ5mCx
X-Gm-Gg: ASbGnct0Xrt//iIFyssGuWW8//QzuAkUcZZn8unvjJMm+zaDBKvbadjPejHTwLuaA2B
	hLTxiaxNiIAwbKQfQ7qoJER8I6CnM0Uqof6tL2YsEhbYydmwLqupPClMz8be9shYmIHrO1X8mPU
	LbW0dwaXKfsHy6ssb0tniAgxF2ZFHRWvcA5QneZrVahA45VS23cHaIAcpAHWDLM+PtgWYIDRngZ
	fsyCLWXFZUeQJdUFJTnR/PawsrWAaxQ2RiVuW2CXIHgZHWBmuVdIiPQCwUZRDe+sJJ4On/fy7ez
	0hx8GWaZPJGO9ZebRraqvBcrIG1rtPRuIPkkj9PVCDQklCNvyGTOG3CF+UhR4Ex1tn6GWSAMTcT
	8jX4HQHZ5U1cDBmMNm4mcC/rqIhhsCDVjQwpfEWBkx0X4sKFmjPnRjf/e0g5Zixk/+5Dd1KPSj5
	DDUxiKV3fxgHN7ah59NozvfWQdGlurgeerMD4ER51PwP/AKf+o
X-Google-Smtp-Source: AGHT+IE64qwN8cNgdLiterpwrqL+lOFg9aK+LGXukOF+p2IalaKvuD7FxtsMmkT8vSZjWALZY4PPfQ==
X-Received: by 2002:a05:6102:6043:b0:5db:dbd1:5540 with SMTP id ada2fe7eead31-5e1de0bc174mr862274137.9.1763743178447;
        Fri, 21 Nov 2025 08:39:38 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93c56519706sm2464213241.13.2025.11.21.08.39.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 08:39:36 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5dbd9c7e468so928451137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:39:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXit1EbxFciRZFvLffUKhk+wpGS07GfWhodmSDYllJ45o9eGV1+wspDAM3FN4ZWHdqvuzYDtoN2jzj1vKcY0xxbkg==@vger.kernel.org
X-Received: by 2002:a05:6102:5805:b0:5db:ca9e:b57e with SMTP id
 ada2fe7eead31-5e1de3d432amr902123137.43.1763743175773; Fri, 21 Nov 2025
 08:39:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com> <20251114105201.107406-10-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251114105201.107406-10-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 17:39:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU_fUhM2-gxhYN3jpzj8F5FOHFYjYT+ahrVs=bsLVBZGw@mail.gmail.com>
X-Gm-Features: AWmQ_bme-X7bQANEGBcax-aNmIv7U30_kjwDivwBpQq02aokr8NTPYQMva5IKq4
Message-ID: <CAMuHMdU_fUhM2-gxhYN3jpzj8F5FOHFYjYT+ahrVs=bsLVBZGw@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] serial: sh-sci: Add support for RZ/G3E RSCI clks
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 14 Nov 2025 at 11:52, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> RZ/G3E RSCI has 6 clocks (5 module clocks + 1 external clock). Add
> support for the module clocks.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/sh-sci-common.h
> +++ b/drivers/tty/serial/sh-sci-common.h
> @@ -17,6 +17,9 @@ enum SCI_CLKS {
>         SCI_SCK,                /* Optional External Clock */
>         SCI_BRG_INT,            /* Optional BRG Internal Clock Source */
>         SCI_SCIF_CLK,           /* Optional BRG External Clock Source */
> +       SCI_FCK_DIV64,          /* Optional Functional Clock frequency-divided by 64 */
> +       SCI_FCK_DIV16,          /* Optional Functional Clock frequency-divided by 16 */
> +       SCI_FCK_DIV4,           /* Optional Functional Clock frequency-divided by 4 */

Perhaps reverse the order?

>         SCI_NUM_CLKS
>  };
>
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 2da36e8ce555..3b03d3d3f2c7 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -3172,6 +3172,9 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
>                 [SCI_SCK] = "sck",
>                 [SCI_BRG_INT] = "brg_int",
>                 [SCI_SCIF_CLK] = "scif_clk",
> +               [SCI_FCK_DIV64] = "tclk_div64",
> +               [SCI_FCK_DIV16] = "tclk_div16",
> +               [SCI_FCK_DIV4] = "tclk_div4",

Likewise

>         };
>         struct clk *clk;
>         unsigned int i;
> @@ -3181,6 +3184,9 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
>         } else if (sci_port->type == SCI_PORT_RSCI) {
>                 clk_names[SCI_FCK] = "operation";
>                 clk_names[SCI_BRG_INT] = "bus";
> +       } else if (sci_port->type == RSCI_PORT_SCI || sci_port->type == RSCI_PORT_SCIF) {
> +               clk_names[SCI_FCK] = "tclk";
> +               clk_names[SCI_BRG_INT] = "bus";

pclk?

>         }
>
>         for (i = 0; i < SCI_NUM_CLKS; i++) {
> @@ -3194,6 +3200,12 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
>                     (i == SCI_FCK || i == SCI_BRG_INT))
>                         return dev_err_probe(dev, -ENODEV, "failed to get %s\n", name);
>
> +               if (!clk && (sci_port->type == RSCI_PORT_SCI ||
> +                            sci_port->type == RSCI_PORT_SCIF) &&
> +                   (i == SCI_FCK || i == SCI_BRG_INT || i == SCI_FCK_DIV64 ||
> +                    i == SCI_FCK_DIV16 || i == SCI_FCK_DIV4))
> +                       return dev_err_probe(dev, -ENODEV, "failed to get %s\n", name);
> +
>                 if (!clk && i == SCI_FCK) {
>                         /*
>                          * Not all SH platforms declare a clock lookup entry

This function is becoming a bit cumbersome.
Can it be simplified?
Can we avoid looking up clocks that are not relevant for the port?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

