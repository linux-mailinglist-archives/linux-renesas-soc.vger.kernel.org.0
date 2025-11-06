Return-Path: <linux-renesas-soc+bounces-24269-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EE4C3C815
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 17:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D688E507FCB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 16:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFED0299954;
	Thu,  6 Nov 2025 16:27:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE082EB861
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Nov 2025 16:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762446475; cv=none; b=Aat2otYf8SSqRmyXJi+dDykJY65TeYsbmYnz3QZ2dZNYgEjGZ6j0b1TT8HvEfEWFs0xeRYeAyvgO8hULmOYDTr6K+sbXzo94oy9PblnSts6X6w1Ox7kBpHEx3XH1QcstYrLU5ccyC1cfj7Y3K+ECoGSJ7qVhiz7Jymn46XpnB2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762446475; c=relaxed/simple;
	bh=3N1qJZ6LWFBTfpoRaZzcBCl8k2fr4s1S594WsHSwxm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qFs3/p4dVugSwLxFjr6MXANDpihUphWlaSVEG19h8BwMgGrKLWp3Ssx6D9YdgTECvsJY/+WNy80E/nHYWnfTw2T1tNWWkmPicSQgDFXRjXWfYiVwTgjmFmQdpZIR0Zlgdp/1M1SfCwrtJKvesyz1TpP6D+MoeXjHh4RyHU5xQb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5943b62c47dso1170125e87.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 08:27:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446471; x=1763051271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=plp2F71zo3wke225yJ4Ea1I1OPDOMxgAH1RlngZdvGo=;
        b=XTxaKvcfowvEuF1sIsE1MWwiTWmAkMqCpGDD4wo8tW85chHFuJ5fKCC5pGrIWu8mk8
         5Yl5/oMPGQxv2YX/qeeGZ/bpik068Y7iZs2CWvnJCzEhCiL/sHWJVWgj+RYXje6oQNK1
         r5NOHVIt51woBoM7uyKdoz92cWT1s9fA4vhgb7pqSITgGVvwDBBbCQxSwMGsjLnQDqcn
         6bte7dJNnFCea+H1hx6L9k5ZORSKqJXUupKonOwVJHmsxCoNoGRKrPdPDhebJt268jfk
         rohGQ83HtBoIMpeqDPrZfADK/D+Xx868DWuaA+h2FOjZtrT3HFrCAHl642enLyp5bIpi
         mFXg==
X-Forwarded-Encrypted: i=1; AJvYcCUcz8Sy0lkC3FqsObdd4G1LzuwU35k81zxfjJUj32Z/QJ6D9k7zyIU4tsSR3dw6VsvrKjPWRjY0bNGgXoxYWlIXNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOtr/C+pZ5k7/L9yrdlMXbliElvDAUJJVAZBa0HvnbWnWlLNuF
	wLyJICxRJ1n0nZFxwG7n+4fGa44oZ6bMA+naxTAl/sshA3WI4J4N3wicC7OhDpZbX+o=
X-Gm-Gg: ASbGncsssg0iDxN4GvATdVj5+xWxm78gqKbtEKy6jJCIYTKRXGzlOnfu+rptBmVu5ib
	rH9HzfkpgqlIv+BCjG65hMkC/rkgVishCE1SuC30Y340WPmyGjT3DkSjdaYUOKDa66qA56Q8GL0
	Gb1ry5vSyZjOBP427wSpUWLeoF74U18rFnhvVAjbXeSOV03R1Glzgx2aIYX2osy68RkFnmhgfjW
	Ku22+USyaRwMAKLTFEhwA1IB/aNAu0Z7nuGy0liRQuBdI3nZAFdNEXlrOAuURc7gO8YHGYmy/9K
	STiLgWuBuxy98XT95tM6ScNkQLmZWgZZqTizxhk0cyi4jMzH2Mb+nrG9UYWMvgtPsF3F82QobDI
	blOQZi8pC7kKEpJ/5CsCxRBkljr/NlP2pPzpx2oagOkiiCpdgoln+xiPFnbkvvdyUMVoRPR8Np4
	FXjIrAYvntp49jS0eceLU7XBBoVVvPEweFiygSUILnw87Eow8aMjsm
X-Google-Smtp-Source: AGHT+IH8S9QUYaHCFpSlSQW1Jn2PRKGSXXYeMgFZrgtQXyV8xErUkgPQUpRqRckHwU4QJU6wx0ys3w==
X-Received: by 2002:a05:6512:a94:b0:594:2dde:5f75 with SMTP id 2adb3069b0e04-5943d7da0f6mr2336560e87.39.1762446471291;
        Thu, 06 Nov 2025 08:27:51 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a840e20sm799543e87.60.2025.11.06.08.27.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 08:27:51 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3737d0920e6so13780711fa.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 08:27:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWCPcNwT+9sgxhda7drWLPcq3m8QA/7dvvQj58OJLIbwOUIUBU6+M3pg4lWAt0FugfZVwzHY4jFuPHnMEe1rA9ZLw==@vger.kernel.org
X-Received: by 2002:a05:6402:3590:b0:640:fa38:7e4a with SMTP id
 4fb4d7f45d1cf-6410588d45bmr7763851a12.8.1762446022573; Thu, 06 Nov 2025
 08:20:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1762435376.git.geert+renesas@glider.be> <cfc32f8530d5c0d4a7fb33c482a4bf549f26ec24.1762435376.git.geert+renesas@glider.be>
 <aQy0T2vUINze_6_q@smile.fi.intel.com> <CAMuHMdXVUJq36GvNUQE8FnHsX+=1jG4GOJ_034r=fgr_Rw4Djg@mail.gmail.com>
 <aQzIIqNnTY41giH_@smile.fi.intel.com>
In-Reply-To: <aQzIIqNnTY41giH_@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 17:20:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW8ndAdGnSHopYFMWvw7wk7wKz_7+N91M1jRHoqK1KBrg@mail.gmail.com>
X-Gm-Features: AWmQ_blD_P8L06tcYy5Zd39ODOkLvksucIxy1SkcdgHAnKwygGve4Lbclr5ZO9k
Message-ID: <CAMuHMdW8ndAdGnSHopYFMWvw7wk7wKz_7+N91M1jRHoqK1KBrg@mail.gmail.com>
Subject: Re: [PATCH v6 12/26] bitfield: Add less-checking __FIELD_{GET,PREP}()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Yury Norov <yury.norov@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>, 
	David Laight <david.laight.linux@gmail.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Kim Seer Paller <kimseer.paller@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Jianping Shen <Jianping.Shen@de.bosch.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org, qat-linux@intel.com, 
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ping-Ke Shih <pkshih@realtek.com>, linux-wireless <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

On Thu, 6 Nov 2025 at 17:09, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Thu, Nov 06, 2025 at 03:49:03PM +0100, Geert Uytterhoeven wrote:
> > On Thu, 6 Nov 2025 at 15:44, Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Thu, Nov 06, 2025 at 02:34:00PM +0100, Geert Uytterhoeven wrote:
> > > > The BUILD_BUG_ON_MSG() check against "~0ull" works only with "unsigned
> > > > (long) long" _mask types.  For constant masks, that condition is usually
> > > > met, as GENMASK() yields an UL value.  The few places where the
> > > > constant mask is stored in an intermediate variable were fixed by
> > > > changing the variable type to u64 (see e.g. [1] and [2]).
> > > >
> > > > However, for non-constant masks, smaller unsigned types should be valid,
> > > > too, but currently lead to "result of comparison of constant
> > > > 18446744073709551615 with expression of type ... is always
> > > > false"-warnings with clang and W=1.
> > > >
> > > > Hence refactor the __BF_FIELD_CHECK() helper, and factor out
> > > > __FIELD_{GET,PREP}().  The later lack the single problematic check, but
> > > > are otherwise identical to FIELD_{GET,PREP}(), and are intended to be
> > > > used in the fully non-const variants later.

> > > > +     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
> > > > +                      __bf_cast_unsigned(reg, ~0ull),                \
> > > > +                      pfx "type of reg too small for mask")
> > >
> > > Perhaps we may convert this (and others?) to static_assert():s at some point?
> >
> > Nick tried that before, without success:
> > https://lore.kernel.org/all/CAKwvOdm_prtk1UQNJQGidZm44Lk582S3p=of0y46+rVjnSgXJg@mail.gmail.com
>
> Ah, this is unfortunate.

Of course, it might be an actual bug in the i915 driver...

The extra checking in field_prep() in case the compiler can
determine that the mask is a constant already found a possible bug
in drivers/net/wireless/realtek/rtw89/core.c:rtw89_roc_end():

    rtw89_write32_mask(rtwdev, reg, B_AX_RX_FLTR_CFG_MASK, rtwdev->hal.rx_fltr);

drivers/net/wireless/realtek/rtw89/reg.h:

    #define B_AX_RX_MPDU_MAX_LEN_MASK GENMASK(21, 16)
    #define B_AX_RX_FLTR_CFG_MASK ((u32)~B_AX_RX_MPDU_MAX_LEN_MASK)

so it looks like B_AX_RX_FLTR_CFG_MASK is not the proper mask for
this operation...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

