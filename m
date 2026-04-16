Return-Path: <linux-renesas-soc+bounces-31328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKSND0Da4GkdmwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 14:46:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C269E40E5BA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 14:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D2A6530117DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 12:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034F71C6FF5;
	Thu, 16 Apr 2026 12:46:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA101ADFE4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 12:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776343613; cv=none; b=rMGBTINDNicOQemVuD7cg5XTJlDr96LjYnox0j1yT6xAcxbySZyFJQDiACb49rny7v381FGRLciGmDvdGtbrh6qhbcQ2N1+mEdyyh+3QFS4O1E6NErWxr+khFE253xave0SFyWvUL2PhfjzJr7Zdy61IKgG4XFbM8zRba1pjQz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776343613; c=relaxed/simple;
	bh=K1qoGridRUdb57GK/fUtqbGkayiqOOaOiGi92ng88Xs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZjRIEDHaJCStsdlo4WlBBPSell88qzr7uZ8GeWqzVYnSclqieaTGQDe0j0qdEa4l9qFXKvjddkq7DPsSi0ed9p3q9PwIR8nZQlFrnqtN+o8Xky1bpjUtnRzIrX9vLTmXU8S5/s+EHVTADxi5MzKj0s2cZ3RWBhPVUgYF30G+EwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-606045ef716so4291779137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 05:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776343611; x=1776948411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDnRokbsI3Bvvk0a6xHNv5nJkvsz3MC7Lfk14AkmIJ8=;
        b=L1+it88OhQ40Q4ztIIjVvQGRCpPYfKj8sCivmUw7SunIawzFovzru5xCQZrtebk+4V
         b2HKlel1r3Qm4yY4vyUbGo/WFkctxvJTslFKpY7DyHXJxaoBLmWvlHoNkQhUkNlI3WeS
         cK8gWJIM/tp3ADBAaLzsjUqr0VZc2+A+/yrLY6VZt8C4jl5eh4aO0cMnL/36Cvvxk3aQ
         LCcGqv8Uo2XipHIMiVfjB2Ka8MkFm1UwP6SXN2jzd7yblYErbD//awa5iKOgJtyJWCyy
         UZ12A6UoGnBHb0Y/EJGoUDzsz5Ek5D0PwG+GrXZqRv40li+g/9zWYjk1mfNVCDvXmwM8
         3kvA==
X-Forwarded-Encrypted: i=1; AFNElJ8X5Z4UZ9Ug4tTDybdpMP/cZRFddkbvpX8UDywAukDhaUWt41Ck16lTwH/fNZqtWjlEDcrokEfSkjV5eqKBdW1H2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Z2je0pnwHHdNzIgcyf0qA8LdkxaMH9ofWaBuuJoaVHMm4E0Y
	JcdKa1Anpc3VrqZGqImKT8tW1wkyaASBVmZVGgdkjdPbR6dmofD6N/SeiAkP28dE
X-Gm-Gg: AeBDieuFbffiuZF1my6jeOmUjellvXGzsdoWHDejh5eZYsnmJcj+OQ9hI4CiTBvasut
	HsE+hLDmDHygbBXn+NiEf1DKX0IuoF854/8ytZlX7qTH8vzKMtFinaBWKip+TElC5YxslWKknZo
	o+vxOvoL046a1GaPqEKq+izzhawxWIvh8YnOcmRvsg11jjdj0OD4pdA9QBPexAkukX14ug/wwyv
	wcahi1h1V/pbPUpGUF4GZRQoZ1EBkFs+3lUS7uzLhaCCn/OP+sXx/tlSpPOoL0tpQeBlrKFlgDd
	SwZnX4IblG+8R2ll/6SvdS0zEo0mwuO1PXbB3kkGNYKuZaTbajaa8ccY/xKOofn6uarAY/guLnD
	xrr6TYQB9HEqJR9UfwuYl03H10/bK1dsemIrpoAWNDwtOa21TQp/6lAT+ggQ5FM8jRtWUDMRl+R
	EBLFonzF9FO9ZO7OJFyOcvKAUGMZm8V9hzjKZAiwuE3PiMtvI/Ajfq19Wb9Uw4Zn61gGzd+no=
X-Received: by 2002:a05:6102:26c4:b0:610:eb3d:bb2c with SMTP id ada2fe7eead31-610eb3dc179mr6695718137.31.1776343611532;
        Thu, 16 Apr 2026 05:46:51 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-612cd134310sm2324793137.6.2026.04.16.05.46.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 05:46:51 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9540bb77b1aso4195308241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 05:46:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+eFT9MNIeThG8kG58K7NOUVnCf141VFX9lygw+MN8Ovn7/aXlVgb0CMaf9Vlg6jYDWjAIGyOv1kStbYsXNpbxy3A==@vger.kernel.org
X-Received: by 2002:a05:6102:291e:b0:602:b037:4de8 with SMTP id
 ada2fe7eead31-609fe8a45fbmr12788505137.4.1776343610944; Thu, 16 Apr 2026
 05:46:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402112709.13002-1-wsa+renesas@sang-engineering.com>
 <20260402112709.13002-3-wsa+renesas@sang-engineering.com> <ac6GcLutDew1wMkS@shikoro>
 <CABb+yY0bpu8rTiQKQu17ZNKkEK=y1_jNYk8fPbnpSxpcivfgog@mail.gmail.com> <adySXGzjq7VFvIxX@shikoro>
In-Reply-To: <adySXGzjq7VFvIxX@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 14:46:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWFemFWWqg+mfmJYOjCvptaXeonpW_ePoQqsD_ruDA=ZA@mail.gmail.com>
X-Gm-Features: AQROBzC1uzpogqh94wppGMc-0_JgUQ6BJbDVlyqf3dCbwnhwInO-iOIS-lCJOck
Message-ID: <CAMuHMdWFemFWWqg+mfmJYOjCvptaXeonpW_ePoQqsD_ruDA=ZA@mail.gmail.com>
Subject: Re: Sashiko review (Re: [PATCH v4 2/3] soc: renesas: Add Renesas
 R-Car MFIS driver)
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	roman.gushchin@linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Marek Vasut <marek.vasut@mailbox.org>, linux-kernel@vger.kernel.org, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linux.dev,kernel.org,mailbox.org,renesas.com,glider.be];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-31328-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C269E40E5BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 13 Apr 2026 at 08:51, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > > What happens if request_irq() fails in mfis_mb_startup()?
> > > > If request_irq() returns an error, the mailbox framework handles the startup
> > > > failure by calling the shutdown() callback.
> > > > Since chan_priv->irq is populated earlier during of_xlate(), it will be
> > > > non-zero here. Will this cause free_irq() to be called on an IRQ that was
> > > > never successfully allocated, triggering a warning?
> > >
> > > Uuuhh, yes! But this is not a problem of this driver but more of the
> > > subsystem. It is definitely not intuitive that shutdown() is called when
> > > startup() failed. There are more mailbox drivers which fell into this
> > > trap, mostly by freeing an irq they never got. I will have a look at
> > > this, but as said, I think it should be solved on subsystem level.
> > >
> > Honestly, I'd treat this as a cosmetic issue. If we fail to get the
> > IRQ, the channel is already dead in the water. Seeing a warning during
> > the subsequent cleanup is just a symptom of missing that critical
> > resource.
> > How often does your client acquire/release the channel and how
> > probable is request_irq() to fail in your platform?
>
> I agree that this is unlikely to happen in practice. I still think this
> is more than just a cosmetic issue, however. Because the above code path
> breaks an expectation a programmer likely has. If probe() fails,
> remove() is not called. If request_irq() fails, free_irq() is not
> called. So, the expectation is that if startup() fails, shutdown() is
> not called. I surely was surprised about this behaviour. And surprise is
> not good, boring is good, I'd say. The free_irq() splat which this
> currently causes is just one appearance of the problem. It can be seen
> as "not so bad" because it is the follow-up of a previous problem. I am
> afraid, though, that more subtle issues might show up in the future
> because of this broken expectation. It is easy to fix, so I'd still vote
> to go for some fix.

+1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

