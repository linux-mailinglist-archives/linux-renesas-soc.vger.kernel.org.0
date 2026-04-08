Return-Path: <linux-renesas-soc+bounces-31036-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMooHwh61mnxFggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31036-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 17:53:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC903BE8AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 17:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A361F3012279
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 15:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 728522DA775;
	Wed,  8 Apr 2026 15:53:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0592DA749
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 15:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775663607; cv=none; b=ohlHvwqs5uMJk0WK22ceImmL1r/p40gxbFVQo5WLJ5wLToLmKft34baXCmwQjI8C+JP0V340UKT+H6N7TA6cGD+y8rA8San9L40tUIXUuxd50GPFiCcrzRgRPHWNgXlEFeesjZOcW9EOw6M/+tr/ZGpwURoOglRDVDx3JsEzIHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775663607; c=relaxed/simple;
	bh=c10W5ALCADJM1BWfUr7/O+YUC+18d/aUdsA2Gn//Un8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MFueerAp2yAZfTfN+vNQ0+1Q7R8WhwL30MqpKQWFT+uDu11duKd5/TwXnQ2l41ZMfm0NJi6vQ+WqAAOm3Lfg0GygD1obHwrx9sAoXtcHK+UoDWWCJ2TFL2QqNGmp+hOazjW//ymgKW0FLZna6b4XyGiSbXde8mrPg+gMiYtgv6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso4700e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 08:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775663605; x=1776268405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/744x+XjzJ75+fqhcq25ueyNm8LBC4TfdouHQzrR540=;
        b=IGH+R1u0FEReefjvLqdqxXvpOB7+d9rkxE1wIXrp5YUmoLvfzd8SjZPWv5vT+weAoP
         e0Gc4wqaGEMs09wM5rUdBCagKzCkWihaNuoerIJwwe+xnNiqlx7edoNzEMnAZdz80H/g
         /6tSe9UuRPwmxchpfP0UHhX+OdLEWALRvggnv42VF1TVl+YVyT7jZz00HUdSgV/YmplK
         WipaXq5OYkMbYd2CMdoJMiEpWp+QvKtPzx0IduHRSFxAsT6obuY0G7o/N8orGM+6cDme
         QIqdwqKLapdL+zS6NyU9r15oTn+xW1ujPe75I7XK304p+4LUyJL/HR14XZcgjRVauHQx
         nkWw==
X-Forwarded-Encrypted: i=1; AJvYcCWqO5My4XsPJPGjNbOeCjcZV3Jg0yZ4WWUrsJZ+772bD+iLNw18YUyVkf7+g+W5PmUWVIAB8SjvF5SZ5g8His058A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqF3HI+9uRPrG1aINMMtftiIFHhCzgBlZ23RXMvUSvdon8JtYK
	2KIALQ/7j1JYc9Y13ykLNRXAvakKHp6xwAaj2xo/gq9qO4dOujG5PTGkHr9yR8hV
X-Gm-Gg: AeBDieuDgPAHAwn4dIjlpz/YABi0uTVp1kZM0yn3t7Z08dOBYajZFr+BJu/PzxQ0kDs
	4bFNoYB7gHAcDR4qRCpf5RH/iNXqXSSJCNGl5guv/BSZIwJIf9aIPTFGxE6XNHzME/XpQXi8KEn
	nH1xBbegnlAP9Hu+SFd7FvPLdM7d3R+WwHSle9O4BiKoF6PdN7IWfEF2IZCcrRAGJxvFCuldqPd
	i6Cj0oZaIYq+K2aq9MggGAa22CLM1TmQW/XcfZrHfiKJJ5bRPTAWYvdiTrFEt95KSFMBrgWe4op
	gyh59k0M8Dyhh0kOU7qdnPMfn8lq5fUd5PHA9Sy0njcCdB500EVZTrJ1gHQPf0Yrg6/zOCh7H/8
	U8+2DuBOQxIeVou4q1EU76PxDQHSfWbI84IIvM7mfZ9xWDl5Tad5U2vo7VVZtDlawo/JVYEuvFB
	Efk2kvimJT6Cl446TV/Kd4b5nslxi6PufOED5YEIPid+UhQyvjB8vZSl8OIpvECa7gyIbNz+4=
X-Received: by 2002:a05:6122:3784:b0:56d:92dd:a0ad with SMTP id 71dfb90a1353d-56daba970e8mr8861061e0c.15.1775663604718;
        Wed, 08 Apr 2026 08:53:24 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9ba826f6sm20292312e0c.2.2026.04.08.08.53.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 08:53:23 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-951c5ac6253so5221241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 08:53:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdHOI2U+zxkdxROsUq3o80VYqHXG+oZ3UiAFkYlmIDlHz+xg1h/0y5lDrnCdl4dQGHiDSbnxJWACdGoSK2MlbPcw==@vger.kernel.org
X-Received: by 2002:a05:6102:6043:b0:5e8:1d93:921a with SMTP id
 ada2fe7eead31-605a4dfad28mr6809315137.15.1775663603186; Wed, 08 Apr 2026
 08:53:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408142105.310210-1-biju.das.jz@bp.renesas.com>
 <20260408142105.310210-3-biju.das.jz@bp.renesas.com> <CAMuHMdXVbWg=nz-E0VTet2YgCP-GvmVY_3MJeZbE0Thp-mMpHQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXVbWg=nz-E0VTet2YgCP-GvmVY_3MJeZbE0Thp-mMpHQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 17:53:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVnD7XxQood1qy7_7gz5nzFz7QDiCXP_Fo5s12zZ_qSCg@mail.gmail.com>
X-Gm-Features: AQROBzA_Av2LUf2OVaQl-DbtKrMDxqlexE1J6D0bFc-L2X_SitOpW85jiR6Spjc
Message-ID: <CAMuHMdVnD7XxQood1qy7_7gz5nzFz7QDiCXP_Fo5s12zZ_qSCg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] serial: rsci: Remove goto and refactor baud rate
 clock selection
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Pavel Machek <pavel@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-31036-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.827];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1BC903BE8AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Wed, 8 Apr 2026 at 17:45, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, 8 Apr 2026 at 16:21, Biju <biju.das.au@gmail.com> wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Replace the goto done pattern in rsci_set_termios() with a positive
> > conditional block. When baud rate is zero, the clock selection logic
> > is now simply skipped rather than jumping to a 'done' label, eliminating
> > the goto entirely.
> >
> > Since RSCI only uses a single clock source (SCI_FCK), the multi-clock
> > tracking variables (best_clk, min_err, brr1, srr1, cks1) are redundant
> > and removed. ccr0_val and ccr4_val are likewise dropped, replaced with
> > hardcoded 0 at their write sites, as they were never modified from their
> > initial zero values.
> >
> > No functional change intended.
> >
> > Reported-by: Pavel Machek <pavel@nabladev.com>
> > Closes: https://lore.kernel.org/all/abPpZULsXhRmXTX9@duo.ucw.cz/
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v1->v2:
> >  * Dropped the check (abs(err) < abs(min_err) as it is always true.
> >  * Dropped the check (abs(err) < abs(min_err) as it is always true.
> >  * Dropped variables best_clk and min_err as they are no longer needed.
> >  * Dropped intermediate variables brr1, cks1 and srr1; results are now
> >    written directly into brr, cks and srr.
> >  * Moved dev_dbg() inside the if (baud) block.
> >  * Dropped ccr0_val and ccr4_val, replaced with hardcoded 0 at their
> >    write sites, as they were never modified from their initial values.
> >  * Scoped variables err and srr locally within the if (baud) block.
> >  * Updated commit description.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I spoke too soon, you need one more change to make it build:

--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -308,8 +308,7 @@ static void rsci_set_termios(struct uart_port
*port, struct ktermios *termios,
        rsci_serial_out(port, CFCLR, CFCLR_CLRFLAG);
        rsci_serial_out(port, FFCLR, FFCLR_DRC);

-       ccr0_val |= CCR0_RE;
-       rsci_serial_out(port, CCR0, ccr0_val);
+       rsci_serial_out(port, CCR0, CCR0_RE);

        if ((termios->c_cflag & CREAD) != 0)
                rsci_start_rx(port);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

