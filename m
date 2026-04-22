Return-Path: <linux-renesas-soc+bounces-31485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOmbJqBz6GlCKgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 09:07:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CF4442C07
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 09:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EBA030104B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 07:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CEE361DB8;
	Wed, 22 Apr 2026 07:05:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFAF35F614
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 07:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776841500; cv=none; b=D3Dr66e84ncl5ifIR7Knt70t1tmZul1iY35FFWFKxs4XHykOlDESpLn4FMkfYSAvcjj2rpZiOL0IoxbhVYabwGvX7Rg3Z0ac/hHeAeI2Jq65td294Y3BuqPA5AwmBHaSOdvNPStmxW8p2VPphIfVGDK1np2OwAkOCJRakVN6sjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776841500; c=relaxed/simple;
	bh=caBlDfLl+UaWCXVT/wSjHkxNWroEBNiNYGlokbHXKFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aFNQpReD6SqwsH8BQLo/l6oBCqBChnoKLcCaPQZhC0pMyRaL0EhKvKF5UUfRb4oUBujjoLcOfowWmT8u7livkGoXx43g8Csx1oVyPU2RyJ7fTWFyq/6jo/wBq73dCHCL0sQWThqXZh07D/kNUJidZ4/eJVRQAseQTvlfyBRBAzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-953c5738c03so2826924241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 00:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776841498; x=1777446298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liaRyWhpT9OCcw5airrCkAgKo3GVhO89vTayZKrLNrI=;
        b=hNJAJnjetzrUzc/MLbx5csg0j/F6GE6SIW6Hdi5qwATSnApyUQ5J1Rgs1ULIbILAum
         2DMnT+vm/sPZ18pQSHb1WTe3dMoOH9hNjMZ3TawcG5gKy3B/qLjUXvQREr9GFag8i6eS
         ACQfwxX689P/VmKzluBB+BIj6j765zDH26vuC9NmoGnF1YNOtBty9saO2i7Zx5hSRAs4
         s8EKsChdMtfdiomuYKIxPpBQ+j+io+MH4Zuq4ym0BFGurs8x+0j8WT8jnG5ogaaINfSs
         8zS8DgqgcgL4bYOBfFskIZthxU4YQ9Qj8TDHwkYDmSBLwa4epOdM623qGOmbMrN6tHqF
         SqmQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ewdEStXcDLQqq2iYlQV8NGyZyQ1Hh97ARR+voZImsYTE1L+CuQ4sdde5yFINmmbGAlk4vAnpAoxEArj/+HJFOvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqHzoyU6Ml+nuEW7QbjBaO/fAX1WnCNJG9J+M+8+tpA7ZLtrYo
	vWRM/CQ8RBcJ9QvMMgWb+aLzyxqdq2wNNvwSzyGlaRxdQT4sPKp3UtbBgYzEqLbC1TE=
X-Gm-Gg: AeBDievSrCxF7DIRqUEOzAW4q9+bazUqQSwYfissacEcvRrbJ5S3kfIWqu2fqKWG3oI
	o3mD0g333v50k25NDGxCdhy8XYTU76TMrp7RhTpO6/nHKu4lSZ4mqwQRg9gBqErYgA4Gz724lmU
	hkzz4gNQkTQ1iFM31L4VhlQ3IiZOJ/7kgmTpwX+E72MuNAuvnTCa1GBc699YYv4C70yCtihgQVF
	XvROovvKOvDHvGyfnRZEaKIzKWYZOdElm6IYIk5erKmz5tMk7LEXzo/x0oTd18YCL/k5mCZWeu6
	x0qe/AFfJRfajokN24HeVYw1eFjVSu6A0Fi2Vw+6hkm5Lpss9IGNQL9B+6wM2cQsYSRiB9LcNyr
	xoJJVxF3bTZz5hV1MZFT1c8IdDybmCe6LVgNgP7bOOrzc/6hw2KzK/il3Q1R+kbBgeQJTyAGY/A
	zWJwgo9s2c0vhYG8fHkrCVu4jGQmorMrYO4No4U2plCp+G7W8IlBrdfvaaObP8dzoqmwSMXH3B2
	w4=
X-Received: by 2002:a05:6102:5e86:b0:607:95f4:53b5 with SMTP id ada2fe7eead31-616f4535092mr9993883137.4.1776841498245;
        Wed, 22 Apr 2026 00:04:58 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-617455b52bcsm7609024137.3.2026.04.22.00.04.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 00:04:57 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56739adfa1aso3647331e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 00:04:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ94ux0R3wdc/m44PHWQ1SI8/Gc6mqz6jkX1iCPwpdUO7ZJSBTY9C9MS7vhNzeP9l3dKnfvHOhyy0hM9ShUq20/DyQ==@vger.kernel.org
X-Received: by 2002:a05:6122:1347:b0:56b:815c:961d with SMTP id
 71dfb90a1353d-56fa5861c00mr10444199e0c.5.1776841497439; Wed, 22 Apr 2026
 00:04:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420140426.237865-1-biju.das.jz@bp.renesas.com> <20260420140426.237865-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260420140426.237865-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 09:04:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQi7eSZg71=01dYjpmgHRXS+L9hXZMN_dR-mtM6sLKNw@mail.gmail.com>
X-Gm-Features: AQROBzAmyxu2D2vKJPRl9CBrNtAxIhNRVSUNiYJ69sDUbK7osTPZ_P5v2qP_TKg
Message-ID: <CAMuHMdXQi7eSZg71=01dYjpmgHRXS+L9hXZMN_dR-mtM6sLKNw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] serial: sh-sci: Drop check for zero baud rate from uart_get_baud_rate()
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31485-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 12CF4442C07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Mon, 20 Apr 2026 at 16:04, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> On DT systems, a zero baud rate from uart_get_baud_rate() is not possible
> even earlycon derives its bit rate from chosen/stdout-path. The zero baud
> guard and its associated done label are therefore dead code. So remove it.
>
> Also drop the unused done label from rsci_set_termios().
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -2719,8 +2719,6 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
>                 max_freq = max(max_freq, s->clk_rates[i]);
>
>         baud = uart_get_baud_rate(port, termios, old, 0, max_freq / min_sr(s));
> -       if (!baud)
> -               goto done;
>
>         /*
>          * There can be multiple sources for the sampling clock.  Find the one

I am afraid you are missing that sh-sci is also used on SH, without DT?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

