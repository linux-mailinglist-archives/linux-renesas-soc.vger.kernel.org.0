Return-Path: <linux-renesas-soc+bounces-28799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGB0D8RpqGnYuQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 18:20:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BB6205110
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 18:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF81B30B8E01
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 17:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAF7371D15;
	Wed,  4 Mar 2026 17:13:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B439C378D9E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 17:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772644400; cv=none; b=qKNQH5SNn/vZrt+P7aOvHtudO4okAx9hDSILXrKKWZKBicpr2qP7YCUFiaygpjctw6BeYt66JCVRN/hlZFVtsUEr/3goSAEr2qh5j+iUKWcq+vxzfqnIg59pZJdInHwVYidaeVZ5HZnEFwHOs+zhzb1ARFzXBu7qHcaoh8IObXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772644400; c=relaxed/simple;
	bh=lF3iBjuHgKRvZeTOEwkNNAPLnI7XHHUrvS30lr5/dGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L/CZYM16hyNCc+zgDPoU1a3JKq+YmhV1ZFtkd0SE7S+UX61RwZ7n3q7yofrPcT60BtP3I0xexD5yt+sEEZejQ5cfgwd+xZsfFOGIJ73ur47BwZ0oidQeLOVhqnw5LQkeR+fiy0dfLxA4D7JUMlUYp7NOGYoR+ud3CT4ubTAn+bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5ff0f61abd7so1779065137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 09:13:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772644398; x=1773249198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/prTTpQhW620yX2PYVk5yWIkWxklh3YEhELl29vkzfw=;
        b=idHOps3ThwRwBXiqmOd9W1fMtjvC0w/Ve6kukzexRetf9yqUb1LRCl2RUTxbX3RsXQ
         M+Y5zZK7bsecdpiaDpMq5RRB27rDgo0/M+ZbSCEZHb+hA1Kc8KbrE4sWd6GKA7QkcHyh
         1DTbixT5yUa5USH7bTvnnLbaZXWaDUgB1nvrAAhW9MkZB3rWuiOiqqP20ofa/ntpyhK9
         ZctwLOLaqL0LpxDqBCdl1Pt3TTe0Ddo1t1IE8jFQ0jFXZdPSUo/hsUcMlBsR9oethkIF
         LdoKOyp2IS/TTvzPkKFBR9Hbqk/lA/V0tHIgl+n1hwpz35Zr1xVfJjHtBxp3mgfZoGSr
         gM3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVl/Wo6CMwTCyW/xxs1pCxYgm+JohNBiPgXJin/rBuNJgt4sTD0Wrpvo8vnbd770L5LVOtqGmyt0pya9EP+iZE5Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVan7Y8VJqVWp11HQUPiXNZAYLSFkueHOlyXHq0dCxr4he1u7h
	FRGoXMKGPiPxnSIAc1ZUU+mRPWU05piGJZqi+6EShyy1v259Sv41XSbPD1h7jJsL
X-Gm-Gg: ATEYQzxnwpEoNjN68s+Nk9w20TAZPMdRQqXlLNKH6WgnZYvsfQBslnOFtsYe1N5JAoV
	WrUVoys4I4pwZJ6RJfA+OxDog2sZ0qSkzVDCu+w+oxsHU9NKuGfv0G/5DiSVgfqIPN4s51d2b25
	ZJoZXPfSYoW8Ik39owci1MN4y2gEMJ6zVarSXwLZWK+45yFc63iPAGtBxjHiQSQNBT4kylhmWha
	uDAbNCG6IQWw2JO6TwV9LlE6xGVzY6pXC7wrcEKEvgBeGorKCvS9CzVGPTCmpbx5JaMCuNzRIdq
	+1sPZTxrK+5LpIphVwSCNzJund4K8AtBZjSnp6u7I96647mKu9aJ+Xj9YXjD5JC1a+dn+foOMiy
	iw6QBmwRW20E5UbVQwHADuc831IweKzWpzx40eQ9cIa5VWxLfg1Wf+1dRwPQS0brDeFLCK1XySw
	36Tqj2YnV1SRRXbaWjAJ7xeyjxYFhutO0FtzAP+LRfcHqTcLImbAfkc3j/LKdm
X-Received: by 2002:a05:6102:2922:b0:5fc:2b19:f7de with SMTP id ada2fe7eead31-5ffaae9984fmr1108210137.25.1772644397658;
        Wed, 04 Mar 2026 09:13:17 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ffaa208aeesm2731625137.12.2026.03.04.09.13.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 09:13:17 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94dda16ff9fso2137484241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 09:13:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNPBSlK6+eD6coRYMRv+vjJjgm0zZ6IyFGuXsczhrHTQmgY4P2x5VD4CZb8e8slI4ckzRx2MvfLlM6AXxIzlszVw==@vger.kernel.org
X-Received: by 2002:a05:6102:3e86:b0:5f1:b7b2:8929 with SMTP id
 ada2fe7eead31-5ffaac72c15mr1143974137.15.1772644396647; Wed, 04 Mar 2026
 09:13:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <62b849967d71d73e028fb65efee717986ef847e6.1772641758.git.geert+renesas@glider.be>
 <535cfe49-4f70-4ed9-ae4f-92215140e6f6@gmail.com>
In-Reply-To: <535cfe49-4f70-4ed9-ae4f-92215140e6f6@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Mar 2026 18:13:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVhznozaH8=jPGBf_aKEged+pjtAeDTBmukd2B4KMJkwg@mail.gmail.com>
X-Gm-Features: AaiRm53SGuxzi6WBseORNxFfXVIwmT8pmyVVW-tzwjBIYdQXKlr-Hu8waR2QV74
Message-ID: <CAMuHMdVhznozaH8=jPGBf_aKEged+pjtAeDTBmukd2B4KMJkwg@mail.gmail.com>
Subject: Re: [PATCH] irqchip/gic-v3: Print a warning for out-of-range
 interrupt numbers
To: Sergey Shtylyov <sergei.shtylyov@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: A4BB6205110
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-28799-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_SPAM(0.00)[0.073];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,glider.be:email,linux-m68k.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Sergey,

On Wed, 4 Mar 2026 at 18:05, Sergey Shtylyov <sergei.shtylyov@gmail.com> wrote:
> On 3/4/26 7:31 PM, Geert Uytterhoeven wrote:
> > gic_irq_domain_translate() does not check if an interrupt number lies
> > within the valid range of the specified interrupt type.  Add these
> > checks, and print a warning if the interrupt number is out of range.
> >
> > This can help flagging incorrectly described Extended SPI and PPI
> > interrupts in DT.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This would have prevented the issue fixed by "[PATCH] arm64: dts:
> > renesas: r8a78000: Fix out-of-range SPI interrupt numbers"[1].
> >
> > [1] https://lore.kernel.org/1f9dd274720ea1b66617a5dd84f76c3efc829dc8.1772641415.git.geert+renesas@glider.be
> > ---
> >  drivers/irqchip/irq-gic-v3.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> > index 20f13b686ab22faf..d75163e71bf22473 100644
> > --- a/drivers/irqchip/irq-gic-v3.c
> > +++ b/drivers/irqchip/irq-gic-v3.c
> > @@ -1603,15 +1603,27 @@ static int gic_irq_domain_translate(struct irq_domain *d,
> >
> >               switch (fwspec->param[0]) {
> >               case 0:                 /* SPI */
> > +                     if (fwspec->param[1] > 987)
> > +                             pr_warn_once("SPI %u out of range (use ESPI?)\n",
> > +                                          fwspec->param[1]);
> >                       *hwirq = fwspec->param[1] + 32;
> >                       break;
> >               case 1:                 /* PPI */
> > +                     if (fwspec->param[1] > 16)
>
>    Not 15? Don't PPIs use INTIDs 16-31?

Thank you, that is indeed an off-by-one bug.
Will fix.

>
> > +                             pr_warn_once("PPI %u out of range (use EPPI?)\n",
> > +                                          fwspec->param[1]);
> >                       *hwirq = fwspec->param[1] + 16;
> >                       break;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

