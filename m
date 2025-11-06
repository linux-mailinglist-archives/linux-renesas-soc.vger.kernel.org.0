Return-Path: <linux-renesas-soc+bounces-24261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD60C3BE35
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 15:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D8E764FE4BE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 14:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D33A19D07E;
	Thu,  6 Nov 2025 14:49:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCE32DAFD7
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Nov 2025 14:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762440568; cv=none; b=UNlSiJ4bIxh/wlaoE4lEEhYkDj9Y0qoAXPDbpwIG360ngLFy6VRiRuQA9J5rrtxBUXguAYO+XcFjgeuOqPJHu3iXDHlziXUvE+OeXxN27520zbsdaLvMf5zDhl8yDKKVclNj3a3VnX5O0XElMb1/B1i7Ni3emyUd9XvXdwQyCuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762440568; c=relaxed/simple;
	bh=HaefBq/9gx/xpe6H9SR+jXE6I2U49/Bi4dkyZMOckp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZIj6qraxKwyCaXDpIJrRZbvdNdXXnOFkzl0kpAE4+NNU6Il+xNYOd1Pr7ebfQujVc0Y6svQ8v38TH1SXmRtiwfBzUVlF/bEyZQw/6OPwLgI7h2LcJ4yFkHcXyNXS6v9IQE1DE307lApMbqoXaZVx4Cz58We/7Q7USKXbf0tnvfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so1566793a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 06:49:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762440563; x=1763045363;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxZVtMOHoNocoyXPFvfejRTHivuCeFc8a9lYqiVNw1Y=;
        b=k748yHwXKcJONNDhigU5ISeFKHYOBWnERuKO1rHG4Efu27+EhsbJOTv28QCE3hDEfX
         MNF7QAviPA6h2RBU2hHaoz6H3HBVqY47QaD8XRDf5qa13W8ywnw6RRAzdYOiob/Ns6g7
         JsJsVv72V7USn4IIz0A0IiTbQW/jdu/2pg57Hxg9Hc0H9z8o4EgfM7mXXuvQC3HQrnYU
         9P8gFh2TiNb8crKlt9opwGEPL5S5ebK9hhDdcWztF4I+BybCNy0hDexEXjKx+jhlI7rh
         2t4i8Amo+xgThR3lVZTKejxnbhajM5OorBZ7HIASTu3NI0aiUvKUB3TBWLlf1DDXCPYW
         Ylyw==
X-Forwarded-Encrypted: i=1; AJvYcCX+D5+eKNPKsaPmsHaKz0HwvH7e/B9duV0wZQ0O674QO110HnIZhdB8oVrbzDk7mDaC84Bpqw/hnynyhYw20J2+hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlpZOJowNrAh38yQBxJi7SU1FyGthpQ9LldoBuh3bHqZX/VT96
	9suYCK7X3zvfKxAEkjwIidxIp+ibDChd4zf9O9muMF2EcP1KBWTGtHaRjJuzxll3kho=
X-Gm-Gg: ASbGncuFZVhV0j+ZYCHh0926QUXMtzj4nRcQMw400ENazIwCravjWxMQ7L3l5fq6HPj
	PVHu6uXjex9uJ/uSAHyP0aWFKl4jE79vtk2MB+I03Ot3ma9uTnFh8KBSlZCWqih+XvPysQ2kT6w
	11sa6znbdKgJYZ8Sx8EJkRC6QXMk0SSqECGGZFZwlsfuXHsZKTj5GgZBPJViS+fCbiuqzWuiVt2
	m4AjXHh+1rlSHccL4NQiyCpsK8soNxwt94nHUxkYHuGHo71emoxvutm2PVPduG/kdUotrsOhqyX
	oe831pE/RkHzBucWgmqFC88KCdUh8uAcxaeaVGXriep89iCDyMWYD2kn0kBN1XJ1H+rEbyIyVc2
	z6r+Qqcm2+jHaOOe0Yt9EN/8Ynyj7I1xHc/JTvuC8/WwOuIWKlcynMgXdRIPVoYfNJmwJbPpnfY
	FFM2LrTETFOsK1MQCKXpbTotn65R+yGudlzti9EA==
X-Google-Smtp-Source: AGHT+IGJbMkYAdNz5gOLqOOmM16qn9l0CeECuPo/zFP/ywSoYXlcpfI32DWcpXL6Hv5Izqp5JrJzlg==
X-Received: by 2002:a17:907:2d86:b0:b6b:a82a:bbbc with SMTP id a640c23a62f3a-b72654f6713mr733437966b.33.1762440562495;
        Thu, 06 Nov 2025 06:49:22 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b728937fb6bsm238216166b.23.2025.11.06.06.49.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 06:49:16 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-640a3317b89so1566392a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 06:49:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXYay/i+RDDOZB/S9/7WKCL8GQhBSSJQtdAQwx9X17yVmhdV818MM5GGSFQ+x6BaYBrZXTuEnTwMN55bxakfaUZ2w==@vger.kernel.org
X-Received: by 2002:a05:6402:1ed5:b0:640:b643:f3c5 with SMTP id
 4fb4d7f45d1cf-641058cf323mr7301623a12.16.1762440555932; Thu, 06 Nov 2025
 06:49:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1762435376.git.geert+renesas@glider.be> <cfc32f8530d5c0d4a7fb33c482a4bf549f26ec24.1762435376.git.geert+renesas@glider.be>
 <aQy0T2vUINze_6_q@smile.fi.intel.com>
In-Reply-To: <aQy0T2vUINze_6_q@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 15:49:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXVUJq36GvNUQE8FnHsX+=1jG4GOJ_034r=fgr_Rw4Djg@mail.gmail.com>
X-Gm-Features: AWmQ_bnZOzLGAFcWzxKh1EIKjH4MNs7moeVCtN8xGb6mN65nYBliBYrABdUBf0M
Message-ID: <CAMuHMdXVUJq36GvNUQE8FnHsX+=1jG4GOJ_034r=fgr_Rw4Djg@mail.gmail.com>
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
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

On Thu, 6 Nov 2025 at 15:44, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Thu, Nov 06, 2025 at 02:34:00PM +0100, Geert Uytterhoeven wrote:
> > The BUILD_BUG_ON_MSG() check against "~0ull" works only with "unsigned
> > (long) long" _mask types.  For constant masks, that condition is usually
> > met, as GENMASK() yields an UL value.  The few places where the
> > constant mask is stored in an intermediate variable were fixed by
> > changing the variable type to u64 (see e.g. [1] and [2]).
> >
> > However, for non-constant masks, smaller unsigned types should be valid,
> > too, but currently lead to "result of comparison of constant
> > 18446744073709551615 with expression of type ... is always
> > false"-warnings with clang and W=1.
> >
> > Hence refactor the __BF_FIELD_CHECK() helper, and factor out
> > __FIELD_{GET,PREP}().  The later lack the single problematic check, but
> > are otherwise identical to FIELD_{GET,PREP}(), and are intended to be
> > used in the fully non-const variants later.
> >
> > [1] commit 5c667d5a5a3ec166 ("clk: sp7021: Adjust width of _m in
> >     HWM_FIELD_PREP()")
> > [2] commit cfd6fb45cfaf46fa ("crypto: ccree - avoid out-of-range
> >     warnings from clang")
>
> Also can be made as
>
> Link: https://git.kernel.org/torvalds/c/5c667d5a5a3ec166 [1]

Nooooh... torvalds might click on it, and complain ;-)

> > +     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
> > +                      __bf_cast_unsigned(reg, ~0ull),                \
> > +                      pfx "type of reg too small for mask")
>
> Perhaps we may convert this (and others?) to static_assert():s at some point?

Nick tried that before, without success:
https://lore.kernel.org/all/CAKwvOdm_prtk1UQNJQGidZm44Lk582S3p=of0y46+rVjnSgXJg@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

