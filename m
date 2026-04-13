Return-Path: <linux-renesas-soc+bounces-31240-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMq7BHjh3GmKXwkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31240-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 14:28:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4323EBFB6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 14:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0BC39300C547
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C513C4559;
	Mon, 13 Apr 2026 12:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVVAM0rh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8683264D6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 12:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776083303; cv=pass; b=l60BdHNosRbZ3iYo4azJkjogyk+KgGBE6QPFIgIQwa85RuXjz7bVwXbzL6n+KMnN26AQD5HUEIsBlrP8JiaKkOVYEDfshIwgyQ9k5jUcIRwCHITlc+xwMAZTDVUYUROKjlt0/95YPYnWTvxAp3SvFJC42m/02fppWV7bZdSGxCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776083303; c=relaxed/simple;
	bh=xsHSmBrP8uAAlVjNBz77G4uhcSS+CwO8tygFMXbTWBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wy5+qDlZBgXFP2Z4v6o81eaoJ51uD51cPHj5mnhhRmdefQkKCKNrPxttjXC06hLTJzA9WeEf7cngLi/t0dApzX2bdO40ra0P3x2a766eJQjGWP1ZVdDw+RMEVfnspcnlB65szg+zp86lfRM4Rb2fDabPfL0E7Cxwb1Cb+pq9O5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVVAM0rh; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d7a5e77b1so481850f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 05:28:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776083299; cv=none;
        d=google.com; s=arc-20240605;
        b=Ilh1htpmqIqQrNQqpn7z8WwtL5M9wSndZ6Rd1rebbN3BtWBhP9JP9fChGRlXAmGOAC
         q40CaID/bcdHYZKaBjRrKXy5FZ0wX6G6tq8nvdEY9zFQ/hMzTjaaFpz7dqyhVUabkSJN
         wsHXV0kn4jvOwYyGhzIyV6WkDT4DAw8SyrnRNWv6gKlxQ8OYToZU3/afN1r9HuKx6fR8
         NvYNsZlC10KuVSKHGr8jPnh4YvSoogGiUpHISJuBbGurgQjP90lv1p0HZLbwAlCrf0KG
         VMwsLsyM/AeOjB/zy0da+4FagCLUdQX/6XdR9vgFO4gxSELHPxcXQYGaprcaU5LWjTTG
         7uHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AfR7ekTVJM91N24iXqkZ230dnYTXWreR7I5vB/E9sQk=;
        fh=V3HR59hPThndgMgQALEr2XAjlzNHguyYZSZEhon1Tgg=;
        b=dnqQ8VVMw9y9ZWeeFG4r14x6aXlMjeMWix/NtTt4kCqtYD1mT984tIyZhs7GLCUV0q
         fdrXxtXsvCibani4l2SzgPzWaV/WoDmhRj0gVv9z5byv7MS8fFMJ4uVszr3W8SRxZZHU
         6Hws19fHYDxLODyJAztofGtGJ+oWtKvCUhXXEpfoc/DOYEJEd9zPpuHZJ3LXFOOMJ4Mf
         4Yh28VYb+SvIXvOt6gDu+eUHWq4zPl2G65iY3a5DyR3xawkzyAbPxwdi9/BvZLn6X3LS
         ILK2FqNPgPVdadt0sTkpLl4cGUltIfL/SXlWcTM2JPc226vCqCpJ2BDaxxSS+4EqWFVg
         vjrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776083299; x=1776688099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfR7ekTVJM91N24iXqkZ230dnYTXWreR7I5vB/E9sQk=;
        b=RVVAM0rhSCeho9yGJRfOHkjS/hBIsLDhfeYwf5o1Q0Rey2HBPTPa9spdbHbcBzQ2aD
         4kS9ZyAFgP4bMkqRfVqUWulikOvJg8rYXfNU628zan6joGikarhwjI+lRBuGXtfM2UaN
         VqH65C7oRApZvPpOyhOLs5lEbwHYp7EMKK5DK5ACg+oZ9rMf3DkTadvOHtFRgFgSj4wC
         a52BQu9saKqnlQy3SMqxA3Xy4cC8uUgLoetvKEzZJW5BeIiqUHWpN46oBf5aI2Pd1baF
         GF7zo1PjT04O53j2F9g0EnflLi4XNcaHtRthGngXV3kLrJAahpHD1fes60gQUHsSK7LS
         9nvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776083299; x=1776688099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AfR7ekTVJM91N24iXqkZ230dnYTXWreR7I5vB/E9sQk=;
        b=R0AsQfaNf3490HFGgsd5I19HYFcDeoPfiRwH6TfT3q9VEcdejwOClQ5p7urXOhC/h7
         Y1NX8zpIi2dgV1OFS5RAXXf2V49zCD90EXgXdR5IjYJlIXNwuvT8c6RnBdLUX7UHh3zX
         VBiTcbMTEdbrV0ezeRRzqAkXPRFNcPtyFpmPTBztWQLCTIAZlmDy5TASiw0gFSK+anFO
         BRGp1zNCJgnCqPMNtMH+UFQ6mjyrvfr7TC3c6CInRL92L63G7Pda9r5m7LoRETjJJETA
         dZrH2kHYQrNHh7mlm3+qgewXv2+wAuMpW0TfzxSjzozd80ajXiV6lSruYzlTO7sU9nuZ
         R/DQ==
X-Forwarded-Encrypted: i=1; AFNElJ/8AzmyvaoK51IJ7lcldNdieCRQLalibTXoYFXo1q8jOyIYyHEphPAMDe5DRX0U3A8hT9cCAdZa5jUCMkBJTjTCkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1jWqSHOoFjZh3wHmQ65kMTynO9hYOowbPrV914Xx6e//adhkx
	25FksNgU5ECExqrmqWgxB8hWtkpS0vxLdbmJmuHb1+xVXGJT3BSkAihP4BvDzfTMncCOOQ6jz2a
	9S2Yi5j3a0EdhgwW5KwpE9Aqgom09A/Q=
X-Gm-Gg: AeBDiesSuz9Wp9026qPhJUuCtjZ5MJO9PMSpTGxQRm2yK7bqakXyqkv4JULg2D0zRok
	jBh3eskYeJPxHQUDSUhD07/61UdE9+Up5KdgvPfAn1rll+5oIBHK+Y1Woj25M46UkkUscKdcczq
	4aTPOfCdE/h9j64eKlbwYhqCTHbpIpc5/nTbxVFi5TlWCpmI8Ude6Bu4zg+6IYSXOf+cnqB0sKk
	BiolCnhPA42VSC9EfENIECWrmxDSaS7plbYMh4dvnTVe9LNBK1dfkLs66K3uMLAlGwB1FMnFmtF
	pcyIFNyqMxyGuVOOqpvDdtp9P2j4Fgjm/j9tBQtjk9fNz30gkAna4QxkJjGWiAi6p6BD9xP8ESP
	f2cXZfg==
X-Received: by 2002:a05:6000:24c2:b0:43d:1598:2d6e with SMTP id
 ffacd0b85a97d-43d6497b76amr19100204f8f.20.1776083298413; Mon, 13 Apr 2026
 05:28:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408094814.321072-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <177595505293.5403.10549666544609254028@lazor>
In-Reply-To: <177595505293.5403.10549666544609254028@lazor>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 13 Apr 2026 13:27:51 +0100
X-Gm-Features: AQROBzC0PYE3EO5g6wnqK62bLxgGOY1Qxb098X6a24DD3mFd7tUNfPeu0EnDhKE
Message-ID: <CA+V-a8vO-sq2CBiJFC_UuU5=Mm730qz3Ga_Ze=3sboV3gzQHuQ@mail.gmail.com>
Subject: Re: [PATCH] clk: divider: Fix overflow in clk_divider_bestdiv() for
 large rate requests
To: Stephen Boyd <sboyd@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31240-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 0F4323EBFB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Stephen,

Thank you for the review.

On Sun, Apr 12, 2026 at 1:50=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wro=
te:
>
> Quoting Prabhakar (2026-04-08 02:48:14)
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > clk_divider_bestdiv() clamps maxdiv using:
> >
> >     maxdiv =3D min(ULONG_MAX / rate, maxdiv);
> >
> > to avoid overflow in rate * i. However requests like
> > clk_round_rate(clk, ULONG_MAX), which are used to determine the maximum
> > supported rate of a clock, result in maxdiv being clamped to 1. If no
> > valid divider of 1 exists in the table the loop is never entered and
> > bestdiv falls back to the maximum divider with the minimum parent rate,
> > causing clk_round_rate(clk, ULONG_MAX) to incorrectly return the minimu=
m
> > supported rate instead of the maximum.
> >
> > Fix this by replacing the maxdiv clamping and the unprotected rate * i
> > multiplications with check_mul_overflow(), clamping target_parent_rate
> > to ULONG_MAX on overflow. This allows the loop to iterate all valid
> > dividers regardless of the requested rate, and clk_hw_round_rate() with
> > ULONG_MAX will correctly return the maximum supported parent rate.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/clk/clk-divider.c | 14 ++++++--------
> >  1 file changed, 6 insertions(+), 8 deletions(-)
>
> Please add kunit tests to show the broken behavior that you're fixing.
> Make a clk-divider_test.c file for this instead of adding it to the
> clk_test.c file.
>
OK.

> >
> > diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> > index 45e7ebde4a8b..dc486c2aa946 100644
> > --- a/drivers/clk/clk-divider.c
> > +++ b/drivers/clk/clk-divider.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/err.h>
> >  #include <linux/string.h>
> >  #include <linux/log2.h>
> > +#include <linux/overflow.h>
> >
> >  /*
> >   * DOC: basic adjustable divider clock that cannot gate
> > @@ -301,6 +302,7 @@ static int clk_divider_bestdiv(struct clk_hw *hw, s=
truct clk_hw *parent,
> >         int i, bestdiv =3D 0;
> >         unsigned long parent_rate, best =3D 0, now, maxdiv;
> >         unsigned long parent_rate_saved =3D *best_parent_rate;
> > +       unsigned long target_parent_rate;
> >
> >         if (!rate)
> >                 rate =3D 1;
> > @@ -315,15 +317,11 @@ static int clk_divider_bestdiv(struct clk_hw *hw,=
 struct clk_hw *parent,
> >                 return bestdiv;
> >         }
> >
> > -       /*
> > -        * The maximum divider we can use without overflowing
> > -        * unsigned long in rate * i below
> > -        */
> > -       maxdiv =3D min(ULONG_MAX / rate, maxdiv);
> > -
> >         for (i =3D _next_div(table, 0, flags); i <=3D maxdiv;
> >                                              i =3D _next_div(table, i, =
flags)) {
> > -               if (rate * i =3D=3D parent_rate_saved) {
> > +               if (check_mul_overflow(rate, (unsigned long)i, &target_=
parent_rate))
>
> Please add some sort of comment above this if condition to tell us what
> a target_parent_rate of ULONG_MAX means and why overflowing we set the
> rate to that.
>
Ok, I will add a comment for and send a v2.

Cheers,
Prabhakar

> > +                       target_parent_rate =3D ULONG_MAX;
> > +               if (target_parent_rate =3D=3D parent_rate_saved) {
> >                         /*
> >                          * It's the most ideal case if the requested ra=
te can be
> >                          * divided from parent clock without needing to=
 change

