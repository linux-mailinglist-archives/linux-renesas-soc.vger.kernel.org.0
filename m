Return-Path: <linux-renesas-soc+bounces-31490-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOuYBjWO6GmpMQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31490-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 11:00:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD55443B64
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 11:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 129643018C09
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 08:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895003C0630;
	Wed, 22 Apr 2026 08:59:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253AF3246EF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 08:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776848383; cv=none; b=Hengy/1hyXTvm0BuA1ZA2xPSpefyPIduKg9m3Ovb44zffgkv9GkqqqLaGJxhAP3HatB5mmf0Rx5XNEYvBDzXeDbUZ4iQRc7ea1lHgWwhmHpY5+3MqDR+OeznYPUh13C81KKy991vwD/PEwGqbv91o5FdVVFYQ5uFFV9otWQD2jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776848383; c=relaxed/simple;
	bh=cPJJcUlD/nNPMlKn2C5yR8KR/OVhhUUUAuL9RwYBgC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4kGtcJAt3wt8+Tarp77cqhxfnECX0F9rSzlH5k4oStrgkq3YrEBiveIIltgFRI3gEFXazb/4iBazvUOUXJWxjCC45MxJLwKLgojHYPBNL+2Yxnw/BZ/TNjTrSMoFvjjhjBeZvS+0s7cjkwyZl01nWx6i7zrMoBsralp57YN8QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6729c6f0ca7so6178581a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 01:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776848379; x=1777453179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dFcuwDFov74A6VmNy3taBtzKh9fgX5fvgWZ5cbJ/uU=;
        b=mXDOEHWTxb89z3yaASeDzwIK4qNR+4NJUKQU1wLU2069a29nTuaPMLCOhjdLN/Tj3e
         sdyl5784rewr5j6mCT8HieafJxiVUriHbUqCR6boi6cwxiGR4XrvVIArrVgciBiRn2ni
         /FVVV7udXC0fHxmKyc+rlq6V9FyOM+7/OLUHOmEVUMyQuyfZbw5PDJDoztaC++oMnV/T
         CrCc5Shl1kt5zj02RUHH9p0F4hsOXvI5twcQptmZxHqsyfXSjnbZzCql0qlcwSkJgqQs
         9klGFWtUw3wbOHmZWhPFWbLizt3H2N64MfnGuG2Dcko7Vd1KP3mIXS8wRk/ca2g+C3rF
         mzpQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xJ/v6V8sek5sF2JVPrSF2qRNZNc6m+BtJGmQprZk2gO798u35BW/g76cTEdvWOf4RomrN1H7YqKl6bRFeocLHag==@vger.kernel.org
X-Gm-Message-State: AOJu0YymsgPNmAa+u5jJo+lvBhHMaHv2Fxzdba/LfOSw4gYReo6xlvBk
	9z0VkODbWBMs+aZE2gjhLDeSEeoS3ccDJLpk0ZzmM4U7WbgSyOcvaFI+LvAgK+qAld8=
X-Gm-Gg: AeBDieveXNBWw8eO3a27Is9fyi9Juh1iPZ+V4uvq0FGDQ1dzQY7R+6T2C6T2BrGBmkc
	VMRrZF5dp42X1iyc8VgghpvVb50lH5CE/8CZDGrJz6ev4YsXOxVqZ5X5nn6GnipaqcEZRHE8JON
	nhiR8XmNwAoUccvRccPUR25Puh1SeKQ3JOJQoU4jc+yyClvQu4YsTwTzOrCWB8/UZIjqjb2fJcR
	ZHN/27+zxcWgkHYy0h/W+W84nHkG1TSiHtpbFdFMvFyJ/ctBA9tW56wYwvTW11Ax5LGYRl5wRM3
	XT0ZffeoP3u/pZ7HOchz8TSQUQbuBJcYffVIua1Tl2aqk5iT4TvN9W/LzU7zvnOU63TWr6cGM/Z
	eicnrMZTO2YXxP7ACmGfplPV/fgO+oULl8RweQrW0IjyR4yZckID2qYdGZ8R92anWSIYpMqTar5
	7ykMsMEOU+MzxdJSALnde4BsH42ryxFK+jk+NLPjvelxNO57iYqS9V6U7JIslB6dC4JWUQPcE=
X-Received: by 2002:a17:907:d501:b0:ba9:3122:49fd with SMTP id a640c23a62f3a-ba9312257eemr420296166b.34.1776848379124;
        Wed, 22 Apr 2026 01:59:39 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4516f7b11sm517314666b.14.2026.04.22.01.59.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 01:59:38 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ba6838e76f2so436210066b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 01:59:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8+sqg+sK98Bo6GHQvIEMVTD9Y5IJkrGYqym49gAbW0J6Bz+2PEL+OGznIND7d7kR1qLFdqlsI96oaN+gDQh6aQ3w==@vger.kernel.org
X-Received: by 2002:a17:906:fe4c:b0:ba8:c717:7fdf with SMTP id
 a640c23a62f3a-ba8c7178133mr500668466b.30.1776848378649; Wed, 22 Apr 2026
 01:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420140426.237865-1-biju.das.jz@bp.renesas.com>
 <20260420140426.237865-3-biju.das.jz@bp.renesas.com> <CAMuHMdXQi7eSZg71=01dYjpmgHRXS+L9hXZMN_dR-mtM6sLKNw@mail.gmail.com>
 <TY3PR01MB113464AE43A23A0B69BCC5675862D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113464AE43A23A0B69BCC5675862D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 10:59:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfGY6VwW09zQX8T3_JkRHwKGRUyNGRXvQaD4e58OV8qA@mail.gmail.com>
X-Gm-Features: AQROBzC_kTmn8EEDaA2iAwdpFOFCXdz6rO7qv7ivZoZvbZjpD2O1Ich5hX2xBW4
Message-ID: <CAMuHMdUfGY6VwW09zQX8T3_JkRHwKGRUyNGRXvQaD4e58OV8qA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] serial: sh-sci: Drop check for zero baud rate from uart_get_baud_rate()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31490-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 7FD55443B64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Wed, 22 Apr 2026 at 09:26, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 20 Apr 2026 at 16:04, Biju <biju.das.au@gmail.com> wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > On DT systems, a zero baud rate from uart_get_baud_rate() is not
> > > possible even earlycon derives its bit rate from chosen/stdout-path.
> > > The zero baud guard and its associated done label are therefore dead code. So remove it.
> > >
> > > Also drop the unused done label from rsci_set_termios().
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > > --- a/drivers/tty/serial/sh-sci.c
> > > +++ b/drivers/tty/serial/sh-sci.c
> > > @@ -2719,8 +2719,6 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
> > >                 max_freq = max(max_freq, s->clk_rates[i]);
> > >
> > >         baud = uart_get_baud_rate(port, termios, old, 0, max_freq / min_sr(s));
> > > -       if (!baud)
> > > -               goto done;
> > >
> > >         /*
> > >          * There can be multiple sources for the sampling clock.  Find
> > > the one
> >
> > I am afraid you are missing that sh-sci is also used on SH, without DT?
>
> Ok, please share your thoughts to handle divide_by_zero fault for
> SH platforms on the code path after done label??

Someone has to check on an SH platform (or qemu rts7751r2d) if
this can happen. It might have been broken along the road, as people
only use earlyprintk when debugging a problem that requires it.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

