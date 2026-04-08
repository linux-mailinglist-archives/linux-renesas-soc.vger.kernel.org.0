Return-Path: <linux-renesas-soc+bounces-30965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMJKKIcQ1mmxAwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 10:23:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 218923B8F35
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 10:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA75D3023E0C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 08:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A443A1D05;
	Wed,  8 Apr 2026 08:22:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2658139FCC5
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 08:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775636548; cv=none; b=dXtbEDihnNjk3j/9jHOOWckaearjSu2+Mpmq6LO56Uvkij0DN6d4rKVvwEwWhojmXWpjbbtdvIz3DtKG6K6tDWRO7oFhjIp3rmLgSeUo09EN35keV87RR1Ls/B1zgF15Rv6X6/MOwZkk+SpVMuYzWLbGVwdzZcLO1clzlrXnMsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775636548; c=relaxed/simple;
	bh=b5sFFFnz7kI/kQaZbsJwv3/XfCSCJbUJYwCMYtZSKa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jyM3FTJcnc/RyywDLGlttDKGlccV3vesOPThU/Kb6AElj1xhkkwQoB9veBVJqfJJid9HmY9diICa+AQSTLAnLpgG7zonlXnjzrYFyggbBoFL9VEkGsylCxTRS76o2BAX0kwW3VlKMD7DjWRnvM/68OUE3cM90xLGupL+1lC6/6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-95464866f51so384080241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 01:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775636546; x=1776241346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/OdsvJnqKLpxIUdQmatNy3GAgeQFuXxN4Hc4a44FzU=;
        b=VlC4VJ8JcW/VYQcN08Ut2USzutwRE8tZMdgPm9uNrZEAquTkOfVvIswfHdZZBB+sUS
         hYGhuDijgKxwPixbEgLy/Q96YNsykxcQqQ87T57g4v38EqfZXfbhnwepw9ODcB8uaz5Y
         YNOXWenI5Am1Ioz15qg/nqWn11B+m0p1EbB3LXkWfB8MRuOJexOUILX5MvBnWyKet+3H
         RwVDdtY3LwNCk79ngrEUQUi6WYpkxtsyQdI1YL2mx3d2IluIaEUu4s+U/+kPcKLCmCyr
         AKWxKP9/GcbeiudBdCpsfNiWShH18I34wTIvIPg95USt4b5TyHz1+ZDXEu8qFs/GSZKr
         yQww==
X-Forwarded-Encrypted: i=1; AJvYcCVssjrFdIVs2ooacP/wIY8gKRuJB89oB/B4NE9eciVgxW5dT8Mxo7D3M08ucA/G1izU2dZhC8awxxSgEFdcTVuHZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEBgK+5/l4WB5zxcUMaTw4z+4LgJ8Cj8xGd5HR7eS6aEQ4+kki
	h52pK6NfvqV0Z/0W9I1cF/KjqbKXBXfkZWcTgfSFv3XIHyfQq9Qp/PsND/q7+nmr
X-Gm-Gg: AeBDiesU7+uWiZCp51QgTRzpWH3PhqMz4JOaNJXUzV2fKNO4qLu6FJ/7woQwdlkrszU
	HCReNSvCJJbtth3HQ20zsMa++gzO7GwHssoMRrKyT23VAcXXadbcYRnoVxHpJJVooZVhr/KxSCl
	6/n9ZqgyIKy3L+cSHTnLUvc5XHP1xrJWNMgV8oV2EqqxRGrQ3wOimhwpuyJhDhr0+9Xp0IVWgtt
	l22qdWvCU4ejYIgcQLHm4MJUw2r7TG1idy5exYQB5MfP3QZe8lXdEtRy5Kdblh6ULCdG1zrWN6O
	+cNZRPQwYSVJTbRxSveI0+NTBl5rIFfDXyWINhTJkUgMT1xO2fU2/zloIPXkwyi4Mx1a06EoLPr
	FkxsfHJcmkduM34zMw9Jx+EB4KPMZ60L3JiJvV4wy3RszR9ms8o//xAH77VQPMdZJUEd+EBVqh/
	eZbQVwmGKGBO3l6H7K3wJ3gy3jxneueTSTjXC/qsWDjfGa7PeAh93TqWWow9lb
X-Received: by 2002:a05:6102:3749:b0:602:7a74:fbbe with SMTP id ada2fe7eead31-605a4e92be0mr3973747137.9.1775636546093;
        Wed, 08 Apr 2026 01:22:26 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-954206339b0sm10521368241.1.2026.04.08.01.22.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 01:22:25 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6058a7dc4ebso1895828137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 01:22:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXpMN8oNxHmq6iw3Cwl5AX9oU7PLQ3qqIWwDb7mVT6N4ZlmBg2oBNr2zFLQ9Lq9H/uDU7ZswP1RKy6GdG9OwlCTyQ==@vger.kernel.org
X-Received: by 2002:a67:e113:0:b0:5ff:ea89:44c8 with SMTP id
 ada2fe7eead31-605a4e20b35mr6740856137.2.1775636544455; Wed, 08 Apr 2026
 01:22:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407151210.102693-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260407151210.102693-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 10:22:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXRKHuV0F4gSu+SsyWAS6RYxhd-XBCjXD1jbYznXup1w@mail.gmail.com>
X-Gm-Features: AQROBzARKqorIdZHutGTZwD8x9EqzhXv0LaXrwdoOHx-u8Qf3SkhcMvk_8MboGA
Message-ID: <CAMuHMdVXRKHuV0F4gSu+SsyWAS6RYxhd-XBCjXD1jbYznXup1w@mail.gmail.com>
Subject: Re: [PATCH] serial: rsci: Remove goto and refactor baud rate clock selection
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Pavel Machek <pavel@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30965-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.786];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,nabladev.com:email,renesas.com:email]
X-Rspamd-Queue-Id: 218923B8F35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Tue, 7 Apr 2026 at 17:12, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Replace the early-exit goto pattern in rsci_set_termios() with a
> positive conditional block. When baud rate is zero, the clock
> selection logic is now simply skipped rather than jumping to a
> 'done' label, eliminating the goto entirely.
>
> No functional change intended.
>
> Reported-by: Pavel Machek <pavel@nabladev.com>
> Closes: https://lore.kernel.org/all/abPpZULsXhRmXTX9@duo.ucw.cz/
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/rsci.c
> +++ b/drivers/tty/serial/rsci.c
> @@ -265,20 +265,18 @@ static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
>         }
>
>         baud = uart_get_baud_rate(port, termios, old, 0, max_freq);
> -       if (!baud)
> -               goto done;

As RSCI has only a single possible input clock for bit rate selection,
there is indeed no need for the "done" label.

> -
> -       /* Divided Functional Clock using standard Bit Rate Register */
> -       err = sci_scbrr_calc(s, baud, &brr1, &srr1, &cks1);
> -       if (abs(err) < abs(min_err)) {
> -               best_clk = SCI_FCK;
> -               ccr0_val = 0;
> -               min_err = err;
> -               brr = brr1;
> -               cks = cks1;
> +       if (baud) {
> +               /* Divided Functional Clock using standard Bit Rate Register */
> +               err = sci_scbrr_calc(s, baud, &brr1, &srr1, &cks1);
> +               if (abs(err) < abs(min_err)) {

This check is always true.

> +                       best_clk = SCI_FCK;

best_clk can be removed...

> +                       ccr0_val = 0;
> +                       min_err = err;

... just like min_err...

> +                       brr = brr1;
> +                       cks = cks1;

and the brr1, srr1, and cks1 intermediaries.

> +               }
>         }
>
> -done:
>         if (best_clk >= 0)
>                 dev_dbg(port->dev, "Using clk %pC for %u%+d bps\n",
>                         s->clks[best_clk], baud, min_err);

This dev_dbg() can be moved inside the "if (baud)" check.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

