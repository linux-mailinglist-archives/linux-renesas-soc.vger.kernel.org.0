Return-Path: <linux-renesas-soc+bounces-32959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EQ4SNEoyEGqEUwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:39:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1AB5B24B1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7FCB304C8AF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 10:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567043CAA3E;
	Fri, 22 May 2026 10:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vq9xH96d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2283C98B3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445845; cv=pass; b=R2UZ9Dv7H/NudFFe19PKcfj4tkpmXAg0n6iyFo14k/tS5M5G3sjrBsq/hfl50K25Is6Mmrln8SmT2gyirpnNhbmo/mk7ypWJfLyDI1O8qRL6ZwuI+bT+36IwnFynrMnojoW+yVXuMMAPlBq8j32lotHR/I8fyZ5KMNNjChDCVp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445845; c=relaxed/simple;
	bh=K4tbwSbezRfyYr3N4nDa1RB1cSu0UMrrrTf4zcMz2J0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ww6lGdNpDYElUjocVsUROu6LRMmcLyxStVXuurd1+Hvqp8wuRB2foGLIQNbhTGD3fHPG3MTz1ognSVIQxdWs9kRn5vLeWVXs8fdKWt8BCCRb6xjUK0GQW2+WF5uuGgDhl4c9kIOjUMOG4BQm4/e4Sl5BCQ5tcrKeK2R0Q1oRdi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vq9xH96d; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso6531400f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 03:30:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779445841; cv=none;
        d=google.com; s=arc-20240605;
        b=iUmqq1ztc/r1FKk+oyCsqlj6moyVu/CQe47iTIUhNushlxSVXpclV5mJHT6T3w1XfM
         jQ5Lj372iwNlFJWiVEd6utUuCrb5SDObtaVmqOfJJmEeomefMUyrf+ugYUFpkd/bUadI
         3S7mkioISruEzUSX9zsWYOJC7kCJlpgIHpqCnIzU4BN88IVwm1sZQG9GSDbI/rBnELbG
         fM54M34p0PaYtqAsQVNvNvVmlFPt/shtV+mA1D3x3NJL3w0IidUJIUcHmJ7flmilz8cy
         2s7UQ7Eu1LJ7QcZhPqmjZBTcPxJy5rjvw+7TXUFuWfJv6vDNvZxcX2wvQjXti0bsu61m
         8QOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fuLZLVypG+ddNF7DwTGC3CQ667NPf/CW9RzkmWOYs8E=;
        fh=VNgcgEBrNCyFeSSudXZDRAaMA9xyz65OI80eXoIlCIs=;
        b=NQfj0jXQPChIw2pw4DdbJ2+l/1+3wVYGwrMGugmMBez4tSETu+PgdL/AE71XBWuVVt
         129SLpGjeTR53FxXqnd4DDQi0wJOu2/4+rfHi7aBdPAM8eJzSVw+A8yL4FqTEoyxZKjf
         X4okYpxfKDBwtfM93umwoU/PkvD+NqNfCn0EFk3aGDFPwDylEKIKG8C2iDNKpPCLnKPv
         MO3RD4Z36tS5e0hOYf1QZFMVEfPm0SHW6eCXyFTuRUnVehcGRoVAVODhlYieU4vvvUyg
         k7aFf7/d4Ec1kjGwSO4LdkpGmslUbkIh2A9KrJZqOXFg0I3b35MXPJXv/efa+Y3ZxN7n
         1Tkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779445841; x=1780050641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuLZLVypG+ddNF7DwTGC3CQ667NPf/CW9RzkmWOYs8E=;
        b=Vq9xH96ddkoIW7keT8lSAFlDjLWhXIj6swcqhnDl2XfvdZ/hhC+ZGQHjp1QRSDwLXs
         8kVx6MKnqJlQT8NrnWA4TebGYq8VTKhNljsn881nd6FZ1QZ7Dw8Q+6ckzoRz/8ttz7mz
         30vLGcd41QDZEZFr6jXAqcBKzzMZ/bbYarljJgavZAovep7OhboPt3NU7VKY6UuO3aok
         dSNim6meGannf9U7FdzKYxlN0zVy6FXs9pz6Wo8+2+Dlu1EoLTWr/Kp9O5pp3LySy6ax
         giRZ1Nt7LmGH2tWw6LA9sAgFZ9US0wSkYt6U0My11a+NEQPitsSyOaFaLQ/70pt0eSj4
         9fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779445841; x=1780050641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fuLZLVypG+ddNF7DwTGC3CQ667NPf/CW9RzkmWOYs8E=;
        b=DG5nQ7KgsNjp6tn3hdJR/fyhn9uiyMdM8vZpOLqfS1cyekePrg4E3iJ3BkSE8gW9gt
         9lXuTBIOOJxc1jETcNZw0QO/Mh/BHXX3+El/1CgOxDlMrf6JnrgA4Gk7X1py3yjIHmzS
         safgHNrnYmLWA8Cjpa63CT3Tpx2fWgVJL3m34bl7Hl7C6hHg0UIpKpDXUQhEbYHa7dY8
         z4a2hTZCJI8ujGcP/DN0ZBM9pDU1gQm3SZTWFwQA8FFoZdM6m9Vfi+Ca/lKLTygxa027
         uunW5EtrVlNMHXg3dchz0Pz2vgKlIe5WzG4Qmyzsy/8hNhEZtQG0SX16OIconsKOnq6m
         MtIg==
X-Forwarded-Encrypted: i=1; AFNElJ+Uq7oAnqBhNsK4V+1RRsfKOb/eCPdB5IwQgaCdNvzAYAaz4ACcSXx2IJbT8Wympa1UXEWcnFhJyBx2zBt+ynWlgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxei50ksOCjeFFW7h2rCYpwp/cLKpYcTB/y0e18T2NdVBkPGAR
	8rXEkodSYmHde6HmUOEcvRqw+2qgZb/y8sWTkyH2B+RW4OCnpUh80EDQ/dQKebsurGsF5PmWQNV
	NmoC5tzPB82hLauQsLxp5mszHML51ofYIBqWRXT4=
X-Gm-Gg: Acq92OHOeQjQHd6UUIoP9yiZu0shYseLvOU9C7GBZci3SJC3YLJH9HO5wFKGg/QL2XV
	MgssjpJyYcIuC5XjmVNzymY9txJeVP0g06fpf30rM7mzJFGwUmvNvc2lp9dd+NP2e3VoUV8P1MD
	uBinI7V3ndJ+txyjqoytLpNIMkVSbSbIgub9+bZ+4ncA41arjoEOjfC/q0CbpX3hpkM2fydC1bq
	OOLn522LGPlnqPo84wg3L/+d435rkSe8lBe0mBH7WarXcCVdAa9ljXbeeTGFC34dam++yk8DqCY
	dmDL49nGT9V+zb5Y0lOaYtrTYpyZhyu/0AAHUQb7rr3BbpxAzATrzpp4I5YCLbJn9eMoMg==
X-Received: by 2002:adf:e00b:0:10b0:43e:a70d:7622 with SMTP id
 ffacd0b85a97d-45eb38bafddmr3082407f8f.22.1779445841321; Fri, 22 May 2026
 03:30:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513115312.1574367-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260513115312.1574367-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVcgJ=aG2p-9gx+gtUwM0xcFo+D0NEqBJnqOqSmBEM7ZA@mail.gmail.com>
In-Reply-To: <CAMuHMdVcgJ=aG2p-9gx+gtUwM0xcFo+D0NEqBJnqOqSmBEM7ZA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 22 May 2026 11:30:15 +0100
X-Gm-Features: AVHnY4LS5ywoMrlxo4hvZxmQoPwrCMDqlROtU2eHtPokP68EWcdOGsLnytqTqcc
Message-ID: <CA+V-a8sHUF6-sdnj310E7Ta=4kJO7oyTP-zoOTZ6ZZOybFhT6g@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: renesas: rzt2h: Skip PFC mode configuration
 if already set
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32959-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 1F1AB5B24B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

Thank you for the review.

On Fri, May 22, 2026 at 11:04=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 13 May 2026 at 13:53, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > In rzt2h_pinctrl_set_pfc_mode(), read the PMC and PFC registers upfront
> > and skip the pin function configuration if the pin is already in
> > peripheral mode with the desired function.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> > @@ -188,8 +188,18 @@ static void rzt2h_pinctrl_set_pfc_mode(struct rzt2=
h_pinctrl *pctrl,
> >  {
> >         u64 reg64;
> >         u16 reg16;
> > +       u8 pmc;
> >
> >         guard(raw_spinlock_irqsave)(&pctrl->lock);
>
> Missing blank line.
Oops.

>
> > +       reg64 =3D rzt2h_pinctrl_readq(pctrl, port, PFC(port));
> > +       pmc =3D (pctrl, port, PMC(port));
pmc =3D rzt2h_pinctrl_readb(pctrl, port, PMC(port));

> > +       /* Check if pin is already configured to the desired function *=
/
> > +       if (pmc & BIT(pin)) {
> > +               u8 current_func =3D field_get(PFC_PIN_MASK(pin), reg64)=
;
> > +
> > +               if (current_func =3D=3D func)
> > +                       return;
> > +       }
>
> I will shrink that to
>
>     if ((rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(pin)) &&
>         field_get(PFC_PIN_MASK(pin), reg64) =3D=3D func)
>             return;
>
> while applying.
>
Thanks for taking care of it.

Cheers,
Prabhakar

> >
> >         /* Set pin to 'Non-use (Hi-Z input protection)'  */
> >         reg16 =3D rzt2h_pinctrl_readw(pctrl, port, PM(port));
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-pinctrl for v7.2.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

