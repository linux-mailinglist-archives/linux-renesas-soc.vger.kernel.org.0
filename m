Return-Path: <linux-renesas-soc+bounces-22868-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE57BCBF41
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 09:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2047E1A638B5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 07:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7332D275B15;
	Fri, 10 Oct 2025 07:39:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F778273D8D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 07:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760081997; cv=none; b=ngK4CQ4Y4JX4+gwL2WfEWXCGQalqiwAsNeNiV/CfitG4UcBI92PsHWzp2xile3dngpmdZIJpqsf9PjN0Yn8CDZ0YVBjZp1bmZP/vQ/74DYuKKE0FXL/bn/HmFFWqcM/4sqbLQgpQHGO002h6iX+Qm/ltJUIKj9ZIAPZaxgtdSXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760081997; c=relaxed/simple;
	bh=UPchuvReFLKZUodDfs2E9bb42rO6Ub7zgDbedskMYJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5309gyZ5hcGAAQki6qXD0t+NJBE7KgjbkScIFr9aOcQIDJ9As7fNvQ3P8HPu0MhHddGP17ejfUgFITlfHSSM4ZxV40h7Bgdu3ZgbCouE6NkGEyBAIMR+oBk8GKwtVxKDuPxHw44k4L/Aep0XKJao/n1B7GUZteTw+CunDlF9gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-930a1bacf0bso1100335241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 00:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760081994; x=1760686794;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+ttZbolmltC88YmqqxciPmwAZI8Qy5cQcJ0WlW2Ejk=;
        b=QyzDP3X+bPAR6onNrH0Wgp4Eo97MhdsunDpELXYg+WEB1biTV2nB50ZOpJhm1UdbPK
         DbMZqUTXrF9mhwqjRKyiM/x3MmtOv+svO/3PtS2Q+ONQn1DdfJxSLUSSUdvquOS9/gLk
         e1GDlXuA9eicsrOnBiIP5GK7mCmxF0RnKLnT1bO6HI4ivrGlfJKClrkeGUzUwjw6y2e2
         92HGGXjhI96ESAmP30oS4gef7OkUwBnfVE46YLzWPhvUWsxwvvZLZSsO8NbSDAqtP1WV
         E36oKnR5eEsrvcnkLHziPzZYiJs2ptcQeTJXesl+/45NDWqqfWa2Cd9eAWqsuhLcJhqN
         XWIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNhUj5SSG8o14Zec5dqAM9UM8WGHV/imM/Ny7MO2UUbSrZyy6VhByiOMOpV9u638tkFjtmw576nfsbvMPSCul5rA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz64yVxWws2lXJyJo36NHxUcPyVMjaV5WCPY7YsuGtgLdIYxwDk
	bHISZwujR2Z+UU3fr1V9PwqluHGqqKkyd0ZUJe8vIzfZS7ARWqgMyqu6bf2xm8qq
X-Gm-Gg: ASbGncsWU7XYrevL0qmA8P81Byh+aLgqtulY8+EoSvjCVuN5jqVuwbMpOWaLb4oQLfT
	BxayBSbCrtvC2sbMm5FHXmzcAwR1HE+ETerD8upskkAmBmeK6gDIJCj39d+hjuuh6jT9TXJZaRo
	qKrAD7IP55mntWA3FJ+W7wexw+IlwdnTq0CwIt2m0GhkH8H0m+8YqPKnwJAuRKdGAmud7b+hKzM
	wMyJPKKXU/5K5PtGn0Kh0/JJQj1/x6SRiu49FnY1zRHx7sO1RtwsWddaftWtdZVv3Nh4w5umeBc
	PBzJyCe6waLA0lWG8sLyMm6/lMiD1cXhGd57xWOp9mc0ArP6GvhRiougW1zDPPN6jaT4rAN5C0I
	pfmGLo877lG95FhyUrexU7KRXdfYMg/zjjFaTNtN71oUSkcTvMfdHkcA/hCMmcEpfErRI7LIN5g
	p0kZo=
X-Google-Smtp-Source: AGHT+IHpzQbygTrA4DiQdMDtmKXdlkVhd5va6KwzID0Dbi/jUEW11oeLrFdCpD5ytJTbMN92Fctclw==
X-Received: by 2002:a05:6102:80a9:b0:56c:eed1:276d with SMTP id ada2fe7eead31-5d5e2323cfbmr4443676137.18.1760081994006;
        Fri, 10 Oct 2025 00:39:54 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5fc761bbesm688724137.7.2025.10.10.00.39.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 00:39:53 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5a0d17db499so1627781137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 00:39:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5+Auw9CLBPPHV22F3Za/V1DO2lAaIXkx7X7DMXu2EppFaRMw/wnLF5bAL/hDjwVy4ALEosXdderW6N3djfHziqw==@vger.kernel.org
X-Received: by 2002:a05:6102:1483:b0:552:aa04:c61 with SMTP id
 ada2fe7eead31-5d5e23571dcmr5106366137.23.1760081993484; Fri, 10 Oct 2025
 00:39:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251005131524.16745-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdV-6A+vV4bZLoT2NtXiqMQLTRRbNJXC1z2ttXX=aXFEGw@mail.gmail.com>
 <9864e81d-3b62-4513-9deb-1ce154cdc571@mailbox.org> <CAMuHMdVEK5MaJNWwpT_7yo0=tk+Pm+99QRD3SStkWsHHDDVJ7A@mail.gmail.com>
 <8220c385d69bd46adf65f58d8e95b247dff6ae1e.camel@pengutronix.de>
In-Reply-To: <8220c385d69bd46adf65f58d8e95b247dff6ae1e.camel@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Oct 2025 09:39:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXf5-tajON6bu8E8riuKTYev+wr=F08oSsmR0rJgCF3YA@mail.gmail.com>
X-Gm-Features: AS18NWD8vsVGbk4pjXdOCbjlrmtFfZ_mqBe9nTk9CWR-xxNlIBE48LR0lCcl3Sc
Message-ID: <CAMuHMdXf5-tajON6bu8E8riuKTYev+wr=F08oSsmR0rJgCF3YA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: Add missing 1ms delay into
 reset toggle callback
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marek Vasut <marek.vasut@mailbox.org>, linux-clk@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Philipp,

On Mon, 6 Oct 2025 at 16:10, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On Mo, 2025-10-06 at 16:03 +0200, Geert Uytterhoeven wrote:
> > On Mon, 6 Oct 2025 at 15:56, Marek Vasut <marek.vasut@mailbox.org> wrote:
> > > On 10/6/25 3:43 PM, Geert Uytterhoeven wrote:
> > > > > R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page 583
> > > > > Figure 9.3.1(a) Software Reset flow (A) as well as flow (B) / (C) indicate
> > > > > after reset has been asserted by writing a matching reset bit into register
> > > > > SRCR, it is mandatory to wait 1ms.
> > >
> > > [...]
> > >
> > > > > +        * On R-Car Gen4, delay after SRCR has been written is 1ms.
> > > > > +        * On older SoCs, delay after SRCR has been written is 35us
> > > > > +        * (one cycle of the RCLK clock @ ca. 32 kHz).
> > > > > +        */
> > > > > +       if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
> > > > > +               udelay(1000);
> > > >
> > > > 1ms is a bit long for busy waiting, so I'd really like to avoid this.
> > > >
> > > > While the documentation does state this 1ms, I understand the
> > > > issue we saw in the field was fixed by
> > > > https://patch.msgid.link/20250922162113.113223-1-marek.vasut+renesas@mailbox.org
> > >
> > > This synchronizes the asynchronized resets, this is a separate topic
> > > from the 1ms delay.
> > >
> > > > so perhaps we can do without this longer delay?
> > >
> > > This aligns the driver with hardware operation charts in the V4H RM,
> > > which mandate the 1ms. If we want to follow the RM accurately, then we
> > > do need the 1ms delay, otherwise who knows what kind of fringe failures
> > > we could run into.
> >
> > All true...
> >
> > > > FTR, it looks like the reset controller documentation doesn't say
> > > > anything about the context from which it is safe to make reset calls?
> > >
> > > What does this mean ? Please clarify .
> >
> > Are you allowed to call reset_control_reset() from atomic context,
> > like the ISP driver does?
> > For the clock subsystem, this is clearly documented: e.g. clk_enable()
> > can be called from atomic context, clk_prepare() cannot.
>
> The reset_control_assert()/deassert() APIs are de-facto only safe to
> call from contexts that can sleep, because some reset drivers sleep or
> call gpio_set_value_cansleep().
> This is not properly documented and the reset functions don't enforce
> it with might_sleep() either, which is an oversight.

Thanks for confirming!
So I keep v1 in renesas-clk-for-v6.19, using usleep_range().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

