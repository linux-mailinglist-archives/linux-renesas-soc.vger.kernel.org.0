Return-Path: <linux-renesas-soc+bounces-13036-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3892A30588
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 09:17:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B347A3A7AC9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 08:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870B21EE002;
	Tue, 11 Feb 2025 08:16:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20041EB9E2;
	Tue, 11 Feb 2025 08:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739261815; cv=none; b=VjBCyg7P0YwDhBJJldqronYKMAImImqp05vD2oNaC35BiIJu5g+J4ne72VJsX/0EJea/l/PR5KPng0mmPRSRePvf4UbffdPHFYyk0vanVsMoVBXVUxepGlCfCgQkbiPu5oK6VXHw1sU/b925I6rtHWiv+ta2ybqXP/scqW26Qyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739261815; c=relaxed/simple;
	bh=sSjkIsu2P/E8K7ljO2VBLCGINN3X8Nw19FfRU0CNbHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWu9JiLtKv8laif1PNF5MNN7Xzh75wOJyEejqqd9r8lUCYWAs1gUJqTUCr6rRGnDN8pIgLZFjuXFn4lycbVIrf3zoXpmzgPovWZstNoGCLY1Yre6hUZvDU9BbimBoUSoVj4V75WFUd4cq83XOpr+Z9p7YqqG1BooflOtIrrGA+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4bbcbbd0bb9so1092549137.0;
        Tue, 11 Feb 2025 00:16:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739261811; x=1739866611;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zroScoUSX3Hs24rbWJ4BHMOpVrNqfCL5OL5GfagmJWg=;
        b=k7JsHrrH09qY82Qqo+FY2d4O0xrPdBwDHDLuaJ7yKaRe621qsGSAbwrY0SoClP+BSm
         Lrq5wN/F8xtYRgtxLlQJjyBFi9gUo7cRiDT0k1CDh99OHef0M25e9qs2y2to3AEY5KZN
         cl+cqX1Z2tsXr2TnI9ZLRTC10DoNGp8M1InOth7xonjjC/JiNZwXZsJsH5TIKFZO8Aul
         PTUTgr0ilGof9lTNEObjyB53JzmjlxMrtpyOqTks2J1IFosSBIQHoHdt0oRMaWDwE1Th
         ff17JRZPWhRD3bBm8gnuH/WyEMfm2OwttaJKHTeLwMnA1YE7gfQ8TWqTPn/WTfcCvAPW
         qr7g==
X-Forwarded-Encrypted: i=1; AJvYcCUqA7vcOU6LqiBDpF3d5AJwTPTv2Q21G6L3C4TBdB/e12gywwOG2LoLqjzF2aEFCzmSTwUFpswHwWNMOSQ=@vger.kernel.org, AJvYcCV0FPn08rfs5eVouwkpdH10CF91FqFd44P08ZiMiFWK8PLngEOTU9ZOHaZ53iDCkGcQMQ+yWPYpBByiOPMYgQf/Y74=@vger.kernel.org, AJvYcCXXXFUiViyiV8ivDgBP1jx7xtX/fP7ws/0LjQZAxb0BoUKPc933RZhhIp3RqjUnEA+PuZc3owqiBKtAiiuU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1AWa3sLDE/imLfeC+37HU3E6qYQ/F7lsVGOvPZ8AcBfvcspCd
	lG5SKB0BbA/q9g4fA1vqM2aexY2Q5/+E/u5iC6JM9736bkqajE7EPe0Vd/lgu5U=
X-Gm-Gg: ASbGncvtdeCOk1HECZEhP3GgnpDzoSnu7UGj/LGohcG7JJ/H9n3TTnr0RiAeTJ4NrFB
	VCu4cDivcw9ZQNFLeRnas1jAJqHsS/sBFxywIPTLey//RtB1a6S78gPRq8rvrnXLXhtvwVJUKDK
	mcrWiHLdR0Qh1kc9nS7uIcwWc6c/YYBjfzd5msttrPgQDCMyyIm2PON7u3JxgqLaSKKCR59/Rfl
	/yMm0QTez/klLap2Z51zh3nyNpaR3yX+Fg3XV088IsqzYIEIujcP8DBeBhAFIzvwtqouxYXya41
	5wWf3TKXHCdUCMI+4KQJ3AYX0FOvoAgKzV+gvxEd33908goxeYzOVQ==
X-Google-Smtp-Source: AGHT+IGKL6bH+OKzeVJ6KvC3Gpke553e+DI1GEySsvm4pSxh6oSX+uykCzx6ZDc6vJ5QT6SaUub2Ug==
X-Received: by 2002:a05:6102:38cc:b0:4bb:cdc0:5dd9 with SMTP id ada2fe7eead31-4bbcdc060b0mr4540723137.12.1739261811171;
        Tue, 11 Feb 2025 00:16:51 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f965e674sm1914919241.9.2025.02.11.00.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:16:50 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4bbdf3081acso630935137.2;
        Tue, 11 Feb 2025 00:16:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUzTjN5Wo5kQ+OGN8omV51OeDQ2t6CD42xx1VcOGWwwaoEtZMRUoOz395PpnVJzCb75vWzlQ7dDQ01s9M0=@vger.kernel.org, AJvYcCVw75m7Ie2glJl48bvR+mLHPtU0yqCDiJRg3XgWaDbraCpdZvjblUrW5Nho0i98g3Sjc9YJGAr/EAKdo6m3q3Z/7tA=@vger.kernel.org, AJvYcCXsQsJokR1mEXm32PtIXOp0cWagDeMmHI9oxl/1eFjspqNhdP5ktsmX8H7X4LKbLtgEePSHZVGiwxOVw752@vger.kernel.org
X-Received: by 2002:a05:6102:358a:b0:4bb:d062:422 with SMTP id
 ada2fe7eead31-4bbd06213cfmr3994028137.3.1739261810302; Tue, 11 Feb 2025
 00:16:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207113313.545432-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250207113313.545432-1-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 09:16:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXis9-PjpKXP7eDGzdgox_jp8Gop6zgJBrnGrATdFTBTA@mail.gmail.com>
X-Gm-Features: AWEUYZlPrGzmAFB-EsiPvWn8-BrB6aPyCPfT3lbB5wF2IGijdKXlYmNe9Mg2ASs
Message-ID: <CAMuHMdXis9-PjpKXP7eDGzdgox_jp8Gop6zgJBrnGrATdFTBTA@mail.gmail.com>
Subject: Re: [PATCH v6] serial: sh-sci: Update the suspend/resume support
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, p.zabel@pengutronix.de, 
	geert+renesas@glider.be, wsa+renesas@sang-engineering.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Fri, 7 Feb 2025 at 12:33, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S supports a power saving mode where power to most of the
> SoC components is turned off. When returning from this power saving mode,
> SoC components need to be re-configured.
>
> The SCIFs on the Renesas RZ/G3S need to be re-configured as well when
> returning from this power saving mode. The sh-sci code already configures
> the SCIF clocks, power domain and registers by calling uart_resume_port()
> in sci_resume(). On suspend path the SCIF UART ports are suspended
> accordingly (by calling uart_suspend_port() in sci_suspend()). The only
> missing setting is the reset signal. For this assert/de-assert the reset
> signal on driver suspend/resume.
>
> In case the no_console_suspend is specified by the user, the registers need
> to be saved on suspend path and restore on resume path. To do this the
> sci_console_save()/sci_console_restore() functions were added. There is no
> need to cache/restore the status or FIFO registers. Only the control
> registers. The registers that will be saved/restored on suspend/resume are
> specified by the struct sci_suspend_regs data structure.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> The v4 of this patch was part of a series with 4 patches. As the rest of
> the patches were applied I dropped the cover letter. The v4 cover letter
> is located here:
> https://lore.kernel.org/all/20250120130936.1080069-1-claudiu.beznea.uj@bp.renesas.com
>
> Changes in v6:
> - used sci_getreg() before saving/restoring registers to avoid
>   WARN() on sci_serial_in()/sci_serial_out()
> - splitted sci_console_save_restore() in 2 functions:
>   sci_console_save()/sci_console_restore() as requested in the
>   review process
> - adjusted the patch description to reflect these changes

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

One philosophical comment below...

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -3546,13 +3559,57 @@ static int sci_probe(struct platform_device *dev)
>         return 0;
>  }
>
> +static void sci_console_save(struct sci_port *s)
> +{
> +       struct sci_suspend_regs *regs = &s->suspend_regs;
> +       struct uart_port *port = &s->port;
> +
> +       if (sci_getreg(port, SCSMR)->size)
> +               regs->scsmr = sci_serial_in(port, SCSMR);
> +       if (sci_getreg(port, SCSCR)->size)
> +               regs->scscr = sci_serial_in(port, SCSCR);
> +       if (sci_getreg(port, SCFCR)->size)
> +               regs->scfcr = sci_serial_in(port, SCFCR);
> +       if (sci_getreg(port, SCSPTR)->size)
> +               regs->scsptr = sci_serial_in(port, SCSPTR);
> +       if (sci_getreg(port, SCBRR)->size)
> +               regs->scbrr = sci_serial_in(port, SCBRR);
> +       if (sci_getreg(port, SEMR)->size)
> +               regs->semr = sci_serial_in(port, SEMR);

IMHO, it does not make much sense to check for the presence of the
SCSMR, SCSCR, and SCBRR registers, as they exist on all variants,
and are always accessed unconditionally in the rest of the code.

Same for sci_console_restore().

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

