Return-Path: <linux-renesas-soc+bounces-23252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 211B2BEAD70
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 18:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F37266E5236
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 16:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3751A0728;
	Fri, 17 Oct 2025 16:06:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F072F189F20
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 16:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760717165; cv=none; b=FDlp3JYiDZkgu9R6+s48oCOvf2Jwqj/NFGdTFHO8xEZsWfkWRdr85M3Hi/4oe6/zPOn4fi3Ph0DzQWNwIevtypr9/zDmQVeW94mB+KHUKmF1oSg/uWHr9WaIPUgwpVcUpCEVGSafCGgANQmzXjl2OdY2Wa1nLW3BmVSDR0DcGLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760717165; c=relaxed/simple;
	bh=5UuF/HjwkQMRQp3toEpBUcYrHBj825aq+Tc6Itk11zY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kvBie0LcBzwPzBsfy1znLP20OxKQTP8WtVZhLt1qDLoEH5sTZ/P2n0vAFJDKXVCozvZ1IMW5ZGgRlvQeRceB3+G1tQ916QMvztzUuw2xXP1T21VRqtJDv6+STO8bQv2OJoIxb6BR7H2Zxx394DRW4yZNAo8Fj+0rBJ4SFnoBXzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7c2730d8fb0so1195215a34.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 09:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717163; x=1761321963;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4mf9FdrvOGmLornKgNki0gXD9BcM6SCmzEl3gfV4Zs=;
        b=KZ34iIX+l7dV57o/OFm1U4gqWLbpxzpXI91F0yNRI0yqlYO3ITIXhueHH4Dc13aOzq
         nujBIW6EhW8iBFDxKbzXUlRJq+7aI9zEbVEQjo1VTi9wWHAmJIiqShm1EOkHEgKbdoC6
         cEByMOxr+5uDTKoHl6AfKxK8PcIDPW8keS4ZcS3jeIOdfIIRctcRnlrWmuCnwcr+NriS
         PTd98nrM0TfOTpIQz2/To8azZrBhaVjOhm3NBC8C7prIgDnOsHgM6LOfjNKBHI09jDv8
         pdNNv5gA9t0ruaiz8ZFORrnzBbzUQRXy6/7q9JwTpa1Lk78G4fzLcReU8+j2Ltq++Mxi
         Q73A==
X-Forwarded-Encrypted: i=1; AJvYcCWv4FK2jy6GL3sIGW5AfpkC1v/YYGAxOPJVLDOjSFh8ak1ICUeExNm7Ipj8x3FjsJdWjsBMDcUW+QYYBNcCzWJqzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSyRhSXbJCtoS27XsICIUTg6dq7FLmBp1uM1FJCX7Q9T/2r6kO
	yys+zFZ3VyNT2GdSomnXG9cfIda1LCTbhNL7ILOz4yWHk3jPxPG860KmRj3UUOio
X-Gm-Gg: ASbGncvNJjie+dq2rCKFWU+PSytUqp0rILXc/t6jXyV/+qCSYQ+cqmyqk8UhsSVi5QD
	1PZdFZNvSu3bqLZy+r8QIFVhzSu5Opa6w13HjBxlstSbMzF0RpIOdPyFPLV1yyXONijDgzQbinq
	kUbWK7bZPv8A45gqLXM620ijSTyfd2RB+tBG6g4trEH/yHJLi+dXLt7UK5GFc+jtsDwP+Dvh9Ea
	vcXHqDavc8BD42hyZiAhn6r2QAqtxmxtgWmGHSQFkbQDVrd5vfDzRcJhB7zN0ZyLTYIXJTw6ibO
	QH2X9ADJTCkliRWXrabjMhInlt8L3w7oHeQmCPWgzIY0pS/yixhJrQW4fatXyz8AFlZvXUUoKtY
	cuLAHThKWG4SspfmeOjr4vWeL0rQe8uH+IT8wH/EAcfXXWutDN+5rnWI06QtG/+mCL5VBGNgvAS
	7DslE8vxA5Z11ChPXpmO7I8aXdMDYGeynD4fxS3g==
X-Google-Smtp-Source: AGHT+IFxPj5p7VgYVLcr6gO2ryC5/2/QsvrVMWVrGWT5DicrAadUZdJQqPMMMqpApp88L7qROtp53A==
X-Received: by 2002:a05:6808:1a23:b0:43f:7287:a5ca with SMTP id 5614622812f47-443a30d31c9mr1738528b6e.43.1760717162585;
        Fri, 17 Oct 2025 09:06:02 -0700 (PDT)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com. [209.85.160.41])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4430f370405sm901206b6e.5.2025.10.17.09.06.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 09:06:02 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-3c978f55367so1021260fac.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 09:06:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXytcjsSd6wzEWMWOLTtO+z4jhuGoqKC7I/ZufwQ3H8i4RR4EteEMz/ABocAuYnZaQ6fweD/6D6xzS2xgd1/SJqCw==@vger.kernel.org
X-Received: by 2002:a05:6102:40c6:10b0:5d7:dec6:389a with SMTP id
 ada2fe7eead31-5d7dec64177mr1309355137.9.1760716852567; Fri, 17 Oct 2025
 09:00:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1739540679.git.geert+renesas@glider.be> <2d30e5ffe70ce35f952b7d497d2959391fbf0580.1739540679.git.geert+renesas@glider.be>
 <20251017081912.2ad26705@kernel.org>
In-Reply-To: <20251017081912.2ad26705@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Oct 2025 18:00:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVS5KmVkv_pmc+R-EXik-Z1_7nuiHM=vm1Cu8v91wmLBQ@mail.gmail.com>
X-Gm-Features: AS18NWD4CQztq7yi6j63q-9XtnW0otWo2wOw8z0_Fp7R-6z_qrlZWB5IqFYEbBg
Message-ID: <CAMuHMdVS5KmVkv_pmc+R-EXik-Z1_7nuiHM=vm1Cu8v91wmLBQ@mail.gmail.com>
Subject: Re: [PATCH treewide v3 2/4] bitfield: Add non-constant
 field_{prep,get}() helpers
To: Jakub Kicinski <kuba@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Alex Elder <elder@ieee.org>, 
	David Laight <david.laight.linux@gmail.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, 
	qat-linux@intel.com, linux-gpio@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jakub,

On Fri, 17 Oct 2025 at 17:19, Jakub Kicinski <kuba@kernel.org> wrote:
> On Fri, 14 Feb 2025 14:55:51 +0100 Geert Uytterhoeven wrote:
> > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > constants.  However, it is very common to prepare or extract bitfield
> > elements where the bitfield mask is not a compile-time constant.
> >
> > To avoid this limitation, the AT91 clock driver and several other
> > drivers already have their own non-const field_{prep,get}() macros.
> > Make them available for general use by consolidating them in
> > <linux/bitfield.h>, and improve them slightly:
> >   1. Avoid evaluating macro parameters more than once,
> >   2. Replace "ffs() - 1" by "__ffs()",
> >   3. Support 64-bit use on 32-bit architectures.
> >
> > This is deliberately not merged into the existing FIELD_{GET,PREP}()
> > macros, as people expressed the desire to keep stricter variants for
> > increased safety, or for performance critical paths.
>
> We already have helpers for this, please just don't know they exist :/
>
> The "const" version of the helpers are specifically defined to work
> on masks generated with BIT() and GENMASK(). If the mask is not
> constant we should expect it to have a well defined width.
>
> I strongly prefer that we do this instead and convert the users to
> the fixed-width version:
>
> ---->8----------------
>
> Subject: bitfield: open code the fixed-width non-const helpers so that people see them
>
> There is a number of useful helpers defined in bitfield.h but
> they are mostly invisible to the reader because they are all
> generated by macros. Open code the 32b versions (which are
> most commonly used) to give developers a chance to discover them.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Thanks, but this is more or less the same code which you suggested
before [1], and to which I just replied[2] after looking at the
generated assembler output on various architectures.

> @@ -188,6 +193,81 @@ static __always_inline u64 field_mask(u64 field)
>         return field / field_multiplier(field);
>  }
>  #define field_max(field)       ((typeof(field))field_mask(field))
> +
> +/**
> + * u32_encode_bits() - prepare a u32 bitfield element (non-const)
> + * @v: value to put in the field
> + * @field: shifted mask defining the field's length and position
> + *
> + * Equivalent of FIELD_PREP() for u32, field does not have to be constant.
> + *
> + * Note that the helper is available for other field widths (generated below).
> + */
> +static __always_inline __u32 u32_encode_bits(u32 v, u32 field)
> +{
> +       if (__builtin_constant_p(v) && (v & ~field_mask(field)))
> +               __field_overflow();
> +       return ((v & field_mask(field)) * field_multiplier(field));

Unfortunately gcc emits actual divisions or __*div*() calls, and
multiplications in the non-constant case.

So I don't think this is suitable as-is.

> +}

[1] https://lore.kernel.org/all/20250214073402.0129e259@kernel.org
[2] https://lore.kernel.org/all/CAMuHMdU+0HGG22FbO3wNmXtbUm9RhTopYrGghF6UrkFu-iww2A@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

