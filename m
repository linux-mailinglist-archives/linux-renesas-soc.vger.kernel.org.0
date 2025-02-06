Return-Path: <linux-renesas-soc+bounces-12904-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6728DA2A8BF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 13:47:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A18223A1C65
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 12:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF910225783;
	Thu,  6 Feb 2025 12:47:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7284E13D897;
	Thu,  6 Feb 2025 12:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738846053; cv=none; b=c71bC8ZSjSl6iODv3tlQ2ASALFFxgmIDiEReUpyNtxQjD6TT2+EIidWf2CLjZukdB0fRbw3zkM72p8zGxfYs6+ecWe75Va0NQeFzTFHwpiPyMPxD/EnKCKaulWpC5jXMczy8zHnhYexFnht2UDUNK9rvPHeyEmr5gDxHgYQKulw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738846053; c=relaxed/simple;
	bh=hlPLCYaZIhAZc34hNxKd9PksJrrQZyULhCIlDD9ay/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jaqUlEw362EzbqigiX3eP25s68jNLmYT/6061ZGnfrK8NadEyMfgYfCBW+TWgCUeHVKUZ3RTpmb8D81BjBjaGk8YitDnZvBSM1jsfASq1k6OSoqR/B5izmQ0Z3VBgF1d5awDZsy/kDLd4KkpVMMbv6A6pcqDfIIRnbaOiQlyddM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-866e49506a5so242851241.3;
        Thu, 06 Feb 2025 04:47:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738846049; x=1739450849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+G5tJ1SBCwqyhbBN/5U55ihfT4hs7XGR0NON5bWUjWY=;
        b=cFnqwqyk+SQGxYOZ55+im8J7qCaUY+6JLcMGtdcElEwxINDOp3Ev/Rzb1PZ/VP6u2y
         Y11elwEXtZXW8KLDhHK75XVMAQGzGQl6TkFTy2hhkc9iu6lJCeJFEixUvOT4ybtiDyZT
         r0FhPPmpGQ3wZCW7+kl6/+bb6apU8chhNTKatpaOB1C94361GyJs82fpljGVZMTfGX9w
         pOxvdGj3FeKzCawKBTUtoA3DH1rg6Ho37118vqghFhumgYnuolpm2efyrgxolF3zrWla
         8ywWNxDKMFaVHcFQlhs1hfgEAjOio+UAVojtZKEhSvKAzKQ9QkWeu1dEoMtxmgoOJYkb
         NmjA==
X-Forwarded-Encrypted: i=1; AJvYcCU8gMsb0FSrOw19VF0tburpnlIF3bhRfe68AajHpkEHm5a89bwhrcS1pIM48pZsTHRK6w/suy2udARh0FM=@vger.kernel.org, AJvYcCUoTq8IbM8TkCxnZlmWlTe57YrRAO+jHVnJ+l6a//Ty2dbfEzKcqqHIarxZmBnRWlpmYbPJJOSZG9MciihOxK++vpw=@vger.kernel.org, AJvYcCUwVOngqJoIjEuH35HJZoVWEhXI8MxfZUqBmhcoxI5ya2NyRuF6cdawX5ig20SdKcn2IZTQijwID+Knxfu3@vger.kernel.org
X-Gm-Message-State: AOJu0YzMX79esiS2Mw/JovNVzQe6M3Wk+GN5KANOUM/7NRo18/VKNsJg
	cvXAO6KWuE9Dc5MmYadeAAwQfsEGvGBdVCfU6My0UVv0Brt1UqBFtsvnAY8a
X-Gm-Gg: ASbGncu0DjlCzjEyrno0QLr+MykrTrihUUBx7SowUz8Ht2RVhAqjtJySg6Ru/uMBj8v
	w9a5NQKjQU+DyjOY5on+bvYyCGFvSIC/ZYNEHrwpNu8Hrsz+1TgQq+MSG6P3rBNzs/PTYd6GP9+
	vtr8MHc4+fVX3FYSUsl+1fOL8fj2m+Fv57i11TFGkoZgFoj+uq8IVT+R98Faz/IJYJfzrF4dQlJ
	bJHGjXLFIktxhBjdrEsZnIZz+4KTXsAHaarNsUtI28Ei2gjMGfIg9gkBC6SA3SfoyP4icT3yref
	AGY/+gzbzmLQKpfEWJittlHF0SR8mdfxCp3yx1SHnBc6GYd/ZDca3A==
X-Google-Smtp-Source: AGHT+IGwmfEtD+UxdUUBtaackkQ8ZYKteUeGf/3id88TCtAx0KF58l+FbDTyleFik7sgr51EcCQQIA==
X-Received: by 2002:a05:6122:daa:b0:518:80fb:df24 with SMTP id 71dfb90a1353d-51f0c3ba2b1mr3979136e0c.3.1738846049163;
        Thu, 06 Feb 2025 04:47:29 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51f228ddaf3sm157815e0c.38.2025.02.06.04.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 04:47:28 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4aff5b3845eso281050137.2;
        Thu, 06 Feb 2025 04:47:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUcwXvCMqQ3hgKn6eEut4gcOexY5W9mshzV3BSyGKP1ZNYV4Ok2lVBdNveN10cVNKeRUeaLOYE+y/sUANg=@vger.kernel.org, AJvYcCVuPb4o68eVNvuYD97DVTnRMnjLghkbes+tZlib9RKDck23faSaO9JjjfBpti3dboMoDRm9Z6d9SSIaGS4OVdNqVPw=@vger.kernel.org, AJvYcCWzB9CZJuuHb40OsOm6SemB3+xkVe1jT7DCuVGAATmA+kwgR0aMrxDyBKpW65Zdo8qFcRCdXMbyHCVfc34w@vger.kernel.org
X-Received: by 2002:a05:6102:3f4c:b0:4b2:5d10:29db with SMTP id
 ada2fe7eead31-4ba4788dc4bmr4048348137.7.1738846048176; Thu, 06 Feb 2025
 04:47:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205093108.2027894-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250205093108.2027894-1-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Feb 2025 13:47:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVD-=n5LdRk42SicdH6MoffTfNGtAz_1AMQ1c7Mui7dFg@mail.gmail.com>
X-Gm-Features: AWEUYZne_WBzKasHYk-6bHwEfEptlcy-SFLtTSYTxOaPCQ-1NvT_d103f7w8GZ8
Message-ID: <CAMuHMdVD-=n5LdRk42SicdH6MoffTfNGtAz_1AMQ1c7Mui7dFg@mail.gmail.com>
Subject: Re: [PATCH v5] serial: sh-sci: Update the suspend/resume support
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, p.zabel@pengutronix.de, 
	wsa+renesas@sang-engineering.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Wed, 5 Feb 2025 at 10:31, Claudiu <claudiu.beznea@tuxon.dev> wrote:
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
> sci_console_save_restore() function was added. There is no need to
> cache/restore the status or FIFO registers. Only the control registers.
> The registers that will be saved/restored on suspend/resume are
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
> Changes in v5:
> - fixed typo in patch description
> - adjusted the patch description to reflect the new patch content
> - added struct sci_suspend_regs and dropped the suspend_cacheable
>   flag introduced previously in struct plat_sci_reg; along with it
>   the updates in sci_port_params[] were also dropped;
>   also, the function (now sci_console_save_restore()) that saves
>   and restores the registers content was adjusted accordingly
> - s/sci_console_setup/sci_console_save_restore/g

Thanks for the update!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -3546,13 +3559,41 @@ static int sci_probe(struct platform_device *dev)
>         return 0;
>  }
>
> +static void sci_console_save_restore(struct sci_port *s, bool save)
> +{
> +       struct sci_suspend_regs *regs = &s->suspend_regs;
> +       struct uart_port *port = &s->port;
> +
> +       if (save) {
> +               regs->scsmr = sci_serial_in(port, SCSMR);
> +               regs->scscr = sci_serial_in(port, SCSCR);
> +               regs->scfcr = sci_serial_in(port, SCFCR);
> +               regs->scsptr = sci_serial_in(port, SCSPTR);
> +               regs->scbrr = sci_serial_in(port, SCBRR);
> +               regs->semr = sci_serial_in(port, SEMR);

The SCFCR, SCSPTR, and SEMR registers do not exist on all
variants.  Hence you should call sci_getreg() and check if
plat_sci_reg.size is non-zero first, else you will trigger the WARN()
in sci_serial_in().

> +       } else {
> +               sci_serial_out(port, SCSMR, regs->scsmr);
> +               sci_serial_out(port, SCSCR, regs->scscr);
> +               sci_serial_out(port, SCFCR, regs->scfcr);
> +               sci_serial_out(port, SCSPTR, regs->scsptr);
> +               sci_serial_out(port, SCBRR, regs->scbrr);
> +               sci_serial_out(port, SEMR, regs->semr);

Likewise for sci_serial_out().

> +       }
> +}

Given there's nothing really shared anymore, I would split this in
separate sci_console_save() and sci_console_restore() functions.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

