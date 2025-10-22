Return-Path: <linux-renesas-soc+bounces-23418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7E3BFB474
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 12:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81A463A2D2A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 10:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBDED350A35;
	Wed, 22 Oct 2025 10:01:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB872882A1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 10:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761127314; cv=none; b=hiGfZXfP6HAl3sbGdQAgT9KoZ94eIv8xWANLQVuaauUa/pY5geVnEf+kLnLJutRt5sVqJEYKnKHDnUZQknzPc1jvrd05ztNhbeayVzzFqXcrGB2IOKyQblTPj9NAVWdRC4siu8JYqMOUQw+C+ZwC7O1qbnUqjTeeCl7HLaV11pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761127314; c=relaxed/simple;
	bh=n8auG5eKlZyr31ot6Kp1D+Gj8aLD/n7p+Qqeh5TWnJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VMyBuH3IRlXghtKDjqmbhf08JNSylZ6pd+kglIKetcuxCaQXiM8s9KBgC6n5U/BgRbHKAhHq+i6Wq/LUie3DkAbB6BQ4/tKD5crTz+XAxC/5JyLlKetzheuWcUAeb751cX4pl9OK9J3913Am0sjnMtEdVEN4H0JwDTlzDNp92DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-551b9d94603so2136378e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 03:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761127312; x=1761732112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEJ/AcXuMMrQoXRwb6HmCfF3LFX3cn+TJWCKJF/dV3w=;
        b=IrPNlCR0DPI/ac2H6stpWAI45ZWsYDWALrSeoS7ZYO98CkeqtyDWqbKn4hKO7Z4uK9
         4yO5vXqIokwpVjrdYDA1NSeAlE4fVMI6uPpoyU6x4rwvYp0CRK5z7R+Cm66t29cXR6qk
         Oa8++XD80zy92nFXzjl0aaJq5nRKuH75pM/JksVLF0VCh15wb/YW4YfgFZ8CPLpMwFNL
         HXajegn0xAccxTXe+VG/fHqbVc+zm6G+dUbH4n1Z8PpisB6ZmIhPicS2dR4bgomXasTw
         YB1YG86e/jfC4IrgH7JZN8kYMGorn0zWn8jVkQmZzLPAOruzq8sfaM88LApDI+fcqKKQ
         A4DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP/7OzQXlox5u9FrogXbXUTeAolTKE8xP6kF1uEUHhUbA8BTg79zf397vSLnN+WYiQFuOZjAPyWlBIiyoVMlDgPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDhkBFcRXaXIUKG9mKi/o54ywaufx+5e0Xdw31vnjkUToB6rJ/
	DQOYet2LFYTgJ+pVaps3Z4Wr4AcTAMj9R9PhQIm+Z4T2GQMqDPTMo8zcjI9u/10E
X-Gm-Gg: ASbGncs4aS+Y86BOs5PVrQOSGElcIFUyEot8EuoNs+xWyZu6zIpkBvaZdG4URk4POPU
	PgY48+juA9Smlx+19aNrW1Uer8nBhgHE1x1gl1mBpMpozqclg98FqyiPS0eD5I8Sj8+1Uw7mILC
	4ZKMeOniGYsv14VZ2Jabhn7wEeqgVacDj0zFsnx9FgC1IMt1itNEVh74ErREFKWRb/t5c7aH2Pt
	LhLLNB9hT2kSan98L0muWx6et7RHDNn4+6QuYAMy1HIWZAkNul5IyqWXV5yLHPnj9JDsjcdW4n2
	TO+8n2dHNjp1V1sZXFmttHqduZ9q4QnhR2cG3Wi3Gx0HlguK9TNgLuFHTt1vEGVe5ZEEPdEHTZs
	cEm9YKi5WO229/o7dmD+PamRgZMZp6ycmqE4+o8oAokwFwv7gLmdZ48t+CuL4jCIVKpxRTd0xe3
	SpgBEWvJ0FJzjsqZz7hOotH8jNOmoUCW6wcwr9vQ==
X-Google-Smtp-Source: AGHT+IF3olDzOK5BLrvMxfxpWpqyIyiMwWwaCjWt7BbQb42cB7AwFlmM2gWp5NPeVvbZHMHKG4T35A==
X-Received: by 2002:a05:6102:38c6:b0:5a3:acb7:55c5 with SMTP id ada2fe7eead31-5d7dd6a694amr5485768137.26.1761127311483;
        Wed, 22 Oct 2025 03:01:51 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-932c3e32dd3sm4316664241.11.2025.10.22.03.01.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 03:01:49 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-89018e97232so1573436241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 03:01:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVyH18SxhF55hB0Rnwvuxkd/zvBV8/el48cWsS7u+MZM71U+JRAXWZEQhgcUR2xK1yTGbCghFBdr79Rw2dCk5yrRw==@vger.kernel.org
X-Received: by 2002:a05:6102:3f49:b0:5d6:615:a687 with SMTP id
 ada2fe7eead31-5d7dd5544d6mr5930459137.7.1761127308820; Wed, 22 Oct 2025
 03:01:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1760696560.git.geert+renesas@glider.be> <67c1998f144b3a21399672c8e4d58d3884ae2b3c.1760696560.git.geert+renesas@glider.be>
 <aPKQMdyMO-vrb30X@yury> <CAMuHMdXq7xubX4a6SZWcC1HX+_TsKeQigDVQrWvA=js5bhaUiQ@mail.gmail.com>
 <aPhbhQEWAel4aD9t@yury>
In-Reply-To: <aPhbhQEWAel4aD9t@yury>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Oct 2025 12:01:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOX=ToDU_44fHrqKWUtee1LKpgisfTKOe4R33er9g+DA@mail.gmail.com>
X-Gm-Features: AS18NWAJp5tYw_pRqlFhPyJqRT3wi5ZG4jspqrcr0Xp9hgyi6lbaoTACOgNkevQ
Message-ID: <CAMuHMdUOX=ToDU_44fHrqKWUtee1LKpgisfTKOe4R33er9g+DA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] bitfield: Add non-constant field_{prep,get}() helpers
To: Yury Norov <yury.norov@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
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
	Jianping Shen <Jianping.Shen@de.bosch.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org, qat-linux@intel.com, 
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"

Hi Yury,

On Wed, 22 Oct 2025 at 06:20, Yury Norov <yury.norov@gmail.com> wrote:
> On Mon, Oct 20, 2025 at 03:00:24PM +0200, Geert Uytterhoeven wrote:
> > On Fri, 17 Oct 2025 at 20:51, Yury Norov <yury.norov@gmail.com> wrote:
> > > On Fri, Oct 17, 2025 at 12:54:10PM +0200, Geert Uytterhoeven wrote:
> > > > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > > > constants.  However, it is very common to prepare or extract bitfield
> > > > elements where the bitfield mask is not a compile-time constant.
> > > >
> > > > To avoid this limitation, the AT91 clock driver and several other
> > > > drivers already have their own non-const field_{prep,get}() macros.
> > > > Make them available for general use by consolidating them in
> > > > <linux/bitfield.h>, and improve them slightly:
> > > >   1. Avoid evaluating macro parameters more than once,
> > > >   2. Replace "ffs() - 1" by "__ffs()",
> > > >   3. Support 64-bit use on 32-bit architectures.
> > > >
> > > > This is deliberately not merged into the existing FIELD_{GET,PREP}()
> > > > macros, as people expressed the desire to keep stricter variants for
> > > > increased safety, or for performance critical paths.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > > Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > > Acked-by: Crt Mori <cmo@melexis.com>
> > > > ---
> > > > v4:
> > > >   - Add Acked-by,
> > > >   - Rebase on top of commit 7c68005a46108ffa ("crypto: qat - relocate
> > > >     power management debugfs helper APIs") in v6.17-rc1,
> > > >   - Convert more recently introduced upstream copies:
> > > >       - drivers/edac/ie31200_edac.c
> > > >       - drivers/iio/dac/ad3530r.c
> > >
> > > Can you split out the part that actually introduces the new API?
> >
> > Unfortunately not, as that would cause build warnings/failures due
> > to conflicting redefinitions.
> > That is a reason why I want to apply this patch ASAP: new copies show
> > up all the time.
>
> In a preparation patch, for each driver:
>
>  +#ifndef field_prep
>  #define field_prep() ...
>  +#endif
>
> Or simply
>
>  +#undef field_prep
>  #define field_prep() ...
>
> Then add the generic field_prep() in a separate patch. Then you can drop
> ifdefery in the drivers.
>
> Yeah, more patches, but the result is cleaner.

And we need 3 kernel releases, as the addition of the macros to
the header file now has a hard dependency on adding the #undefs?
Unless I still apply all of them to an immutable branch, but then what
is the point?

> > > > --- a/include/linux/bitfield.h
> > > > +++ b/include/linux/bitfield.h
> > > > @@ -220,4 +220,40 @@ __MAKE_OP(64)
> > > >  #undef __MAKE_OP
> > > >  #undef ____MAKE_OP
> > > >
> > > > +/**
> > > > + * field_prep() - prepare a bitfield element
> > > > + * @mask: shifted mask defining the field's length and position
> > > > + * @val:  value to put in the field
> > > > + *
> > > > + * field_prep() masks and shifts up the value.  The result should be
> > > > + * combined with other fields of the bitfield using logical OR.
> > > > + * Unlike FIELD_PREP(), @mask is not limited to a compile-time constant.
> > > > + */
> > > > +#define field_prep(mask, val)                                                \
> > > > +     ({                                                              \
> > > > +             __auto_type __mask = (mask);                            \
> > > > +             typeof(mask) __val = (val);                             \
> > > > +             unsigned int __shift = sizeof(mask) <= 4 ?              \
> > > > +                                    __ffs(__mask) : __ffs64(__mask); \
> > > > +             (__val << __shift) & __mask;    \
> > >
> > > __ffs(0) is undef. The corresponding comment in
> > > include/asm-generic/bitops/__ffs.h explicitly says: "code should check
> > > against 0 first".
> >
> > An all zeroes mask is a bug in the code that calls field_{get,prep}().
>
> It's a bug in FIELD_GET() - for sure. Because it's enforced in
> __BF_FIELD_CHECK(). field_get() doesn't enforce it, doesn't even
> mention that in the comment.
>
> I'm not fully convinced that empty runtime mask should be a bug.

Getting (and using) data from nowhere is a bug.
Storing data where there is no space to store is also a bug.

I will add a comment.

> Consider memcpy(dst, src, 0). This is a no-op, but not a bug as
> soon as the pointers are valid. If you _think_ it's a bug - please
> enforce it.

memcpy() with a fixed size of zero is probably a bug.
memcpy() with a variable size is usually used to copy "as much as is
needed", so zero is usually not a bug.

> > > I think mask = 0 is a sign of error here. Can you add a code catching
> > > it at compile time, and maybe at runtime too? Something like:
> > >
> > >  #define __field_prep(mask, val)
> > >  ({
> > >         unsigned __shift = sizeof(mask) <= 4 ? __ffs(mask) : __ffs64(mask);
> > >         (val << __shift) & mask;
> > >  })
> > >
> > >  #define field_prep(mask, val)
> > >  ({
> > >         unsigned int __shift;
> > >         __auto_type __mask = (mask), __ret = 0;
> > >         typeof(mask) __val = (val);
> > >
> > >         BUILD_BUG_ON_ZERO(const_true(mask == 0));
> >
> > Futile, as code with a constant mask should use FIELD_PREP() instead.
>
> It's a weak argument. Sometimes compiler is smart enough to realize
> that something is a constant, while people won't. Sometimes code gets
> refactored. Sometimes people build complex expressions that should
> work both in run-time and compile time cases. Sometimes variables are
> compile- or run-time depending on config (nr_cpu_ids is an example).
>
> The field_prep() must handle const case just as good as capitalized
> version does.

OK, I will add the (build-time) check.

> > >         if (WARN_ON_ONCE(mask == 0))
> > >                 goto out;
> > >
> > >         __ret = __field_prep(__mask, __val);
> > >  out:
> > >         ret;
> > >  })
> >
> > Should we penalize all users (this is a macro, thus inlined everywhere)
> > to protect against something that is clearly a bug in the caller?
>
> No. But we can wrap it with a config:
>
>  #ifdef CONFIG_BITFIELD_HARDENING
>          if (WARN_ON_ONCE(mask == 0))
>                  goto out;
>  #endif

That can be done later, when hardening other bitfield functions
and macros.

> > These new macros are intended for the case where mask is not a constant.
> > So typically it is a variable of type u32 or u64.
>
> You never mentioned that. Anyways, it's again a weak argument.

I'll add more comments ;-)

> > > > +             unsigned int __shift = sizeof(mask) <= 4 ?              \
> > > > +                                    __ffs(__mask) : __ffs64(__mask); \
> > >
> > > Can you use BITS_PER_TYPE() here?
> >
> > Yes, I could use BITS_PER_TYPE(unsigned long) here, to match the
> > parameter type of __ffs() (on 64-bit platforms, __ffs() can be used
> > unconditionally anyway), at the expense of making the line much longer
> > so it has to be split.  Is that worthwhile?
>
> Not sure I understand... The
>
>         "unsigned int __shift = BITS_PER_TYPE(mask) < 64 ?"
>
> is 49 chars long vs 42 in your version. Even if you add two tabs, it's
> still way below limits. And yes,

Oh, you meant instead of the size check.
I thought you objected to the hardcoded number 4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

