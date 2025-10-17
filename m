Return-Path: <linux-renesas-soc+bounces-23230-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A5FBE83FC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 13:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F7EC741E5C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 11:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2918832F747;
	Fri, 17 Oct 2025 11:02:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ED932F75B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 11:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760698941; cv=none; b=WMQzY+Nsh0+p9Gq/+DsfrN+TU5VFFaX8is23XGOLbIZ3uWCxYTFIHhIkrDw0NeDo7trG2JFzhfekCCyRbhMrnCjhlOWhhCV4X158D0efDg5OkUzbevrNSpJCNY/dxVi+BQZWFcTlZpL5XMQbK5G56CY2Y24Z870w8gQXdqCgOaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760698941; c=relaxed/simple;
	bh=LrniXy6ZCFM530ZMtcnDRQn9pcEmCEynLCDVJ3AMIhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a6vIY23pTuDzVCQoPlrliGLW0aBir6TVAfbfWlVtjQ6o2y/4h19sCZIabnxDOHOltRs2ZOgxiXHkPo36NQJn5hX6WGbeyl+QVRqgix1zG9JWcKMbAonTdRqjXDx0cI4gPAT/vf+w9jub/QQn5Zr2BoqG+xXau9RdYtEYJL6sP/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-88e1a22125bso249937285a.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 04:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760698937; x=1761303737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XCpfZFAx3hiLnczCJXcXTR7Dek411X8RRc+fD4xQf5M=;
        b=K5UphYu7RML1GSXOYLoDt8QGtxkzbqKa7F83iPXWdEkA5ApkBKnjX6VxJukS1mK0Hw
         xHZTet3B1lCjytG8ZmGR4aTBolOaCZJBCQGEiSSlo1QQro6QWJgTio3ER/xSQRozM2+w
         mF0i5bkVnbHlwIkitA3qMh9oanb16yWRiCSXM/WYC3Ee8l6VWhnzLAsa4PJJx9azaLgK
         44nkeMmJOK/SeOs5JpZf6CYfqXjf28jlMHEfBP1wgZvsRkKyekYbv4KwopCD9vXb/gzv
         bOSFsrEHyzBdRCRG6pXqi6FDgAE15cqybOJyEOSOwen06UPvfb4BVW4fRdi3prwOOzSz
         P7WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkVXXACJPiYn6g8qzgdnZr5S4KX8C0CYWBgOi9HyS7jpchSKnOvTGwsuAQeiyW+NYbwyzOEzvzHFxs4VbIPrIUTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBzrc8WCjTv+u5W8JytZLP5TKJ2vycNvtqtaKWJiTRsy0cgZ9b
	RUeCeU9/2+zB0vt0Y7buVwWzwxPnoGkg/weMcYMwo+dPgOva8gdQBgSLhoILBJ7L
X-Gm-Gg: ASbGnct196wtzVMprzMjAYsDnSaiqeKmLVZAGLAv7L4NxKTdQkZoW6oK6FklFhmOamZ
	8lqvugqRsiFQaZdhdWe0GybD5SDykGLyuER/glw5sDc4yZNTQBsmdzubCKLgdAh0MWdFM77CCD4
	92toU0dm+P92p5p6fyUDYcDuDogmGjcgJB0obIcZF4lTgPz+V5PPiCUcviOQwAnw9Immbqy+nEy
	3Ffci7PBq4C7iEWk+sFsGjOv9Nshd21jSnTmsar3PMzJhVuMxR9rdGPznwAvUPo/DSWV0gOvm3K
	7qe3hNBknKqX7OwF8hXL66Lnom9AYETlNRyfnL8VJn3W/qaHC2h1ZnWSooqFAz2dxMLmvyk3Wwk
	LOLeFKQbHjq8y57LqaKE2YBS1Ms6sRR5yzNWMJ6flBAFumXJ+yE0TOgosPccbzxKst8KSTT/3VA
	ZFUoBVXUuinTZyAgtLNGrDxIaRguPw0CaEBzbcc36bbQ==
X-Google-Smtp-Source: AGHT+IHTD15AUq3+ceuPzuLdW6DLa11VWyIEILNUHsem0F4yN3luiFnfMtzy5/fk/5VU/+6z5y0gtw==
X-Received: by 2002:a05:620a:a002:b0:890:bbeb:133c with SMTP id af79cd13be357-890bbeb15c5mr199529485a.5.1760698936753;
        Fri, 17 Oct 2025 04:02:16 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-88f35c64effsm404348885a.21.2025.10.17.04.02.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 04:02:16 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-88f86727622so274405785a.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 04:02:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXFOWs2ZIGTQkUn+XkQrSOUo0T0+wG7VFPA02L/PYW0QVHIneGdtdkIaM+miUwsqgqK9056ekQ1wgZ3//7xYJ8m/g==@vger.kernel.org
X-Received: by 2002:a05:6102:c49:b0:5a1:f09f:524e with SMTP id
 ada2fe7eead31-5d7dd59bcd6mr1313646137.16.1760698511065; Fri, 17 Oct 2025
 03:55:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1739540679.git.geert+renesas@glider.be> <2d30e5ffe70ce35f952b7d497d2959391fbf0580.1739540679.git.geert+renesas@glider.be>
 <20250214073402.0129e259@kernel.org>
In-Reply-To: <20250214073402.0129e259@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Oct 2025 12:55:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+0HGG22FbO3wNmXtbUm9RhTopYrGghF6UrkFu-iww2A@mail.gmail.com>
X-Gm-Features: AS18NWCjFk9wo7Q1aPnnkBYJzaq6xcQVQAXawyeid30N8a2RlJlAbXrKkziomTs
Message-ID: <CAMuHMdU+0HGG22FbO3wNmXtbUm9RhTopYrGghF6UrkFu-iww2A@mail.gmail.com>
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

On Fri, 14 Feb 2025 at 16:34, Jakub Kicinski <kuba@kernel.org> wrote:
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
> I really really think that people should just use the static inline
> helpers if the field is not constant. And we should do something like
> below so that people can actually find them.
>
> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> index 63928f173223..e02afcd7aeee 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -156,6 +156,80 @@
>                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
>         })
>
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
> +}

Unfortunately gcc emits actual divisions or __*div*() calls, and
multiplications in the non-constant case.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

