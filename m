Return-Path: <linux-renesas-soc+bounces-23318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 120F7BF1251
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 14:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DAB13B5503
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 12:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B985313539;
	Mon, 20 Oct 2025 12:20:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B813A3126AD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 12:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760962817; cv=none; b=k7vZxNFzP25jlhNT52/sJz/RnsiY/k0cQBw3zKExkZ2fRjoBEC1tyt1hdSANjDVfWfU3Qv3v3dP4DyJNLSXQsV0y+qPvEQfr6YXVJJgMf3BaWlBk7IzzJuQgfA4qC+RfPTszFSDBvPA0gpxJa3FX306uXrfw8ofCkUgElck8a9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760962817; c=relaxed/simple;
	bh=zQJyABbFIFRgraIjRfB4Kv0edNHngRx2HTU3PnrqMSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FDwKr6JsXKf8ACcXRNt8VYb1Q1ESGq9cW0mjZriR7McMuutP2rX5puccqqJdM9aa8j476lO7OebzgiHheQSUJLVfFAUXuSBFOXLurLWnHxFREBXTUZ7Ky0wofjD1DxcNlQNjwupVFyiUb5PD+WcIz3K/ESR8IMmOmrdb/F9bfQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-93ba2eb817aso413639939f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 05:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760962814; x=1761567614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pomt2ITXhIHlFit8dq3w5svz3PMdwi8h98cx9ZzxHC0=;
        b=UaAU92zgKESm9+QLKobKfDBFgAZR0f55p6iaD6Vc5sii5k1xVxuGtxJ4MRpcQhbGU0
         TKK8XdV83u4fvIDyv6TGpD3iRiXelsWztTuTb1jyCCj/p7UiJU9YeKHp70xCBpsKzuQL
         Sc8BjB5mns05VrPjCyDF6xpO2zwGF32C3ID2iywPRQCtOTg3AKV6FAEu6/Sb4iid8mSN
         hEa4ZwaGkaeDVfej68dFXabTXD9W0VyeDiCjmM9bvPYn6yUPHwecu80GHQu9VknfGov/
         0AmIw8i+5LMA3rcCF6sib1EPQGwyHs9IREhUIzha2KD6PYD7kj6cK4l0ukoPHXuXW8NK
         Cvjg==
X-Forwarded-Encrypted: i=1; AJvYcCXhztOfoOXlIFOe1RRDnRPFvgRvUWkrjE+Nz0jgPL276vUi/pZH5ugodfAdNDR8peOSv/5ZqPSjc/NYw9rC8s0ZAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzUO38E9zUbdHsNm4Jy73nsjpe7mge4Bz19bNyrjcyMdKQVFzn
	MF03fdEQW7lUpAncPf/L3HNRCstweAxQn15EB1bJxU2rb7Qai68ebAAWNLRrJs5Z
X-Gm-Gg: ASbGncuQrV4NlxiCSAqPeYnOX8P1tZ0S/nAO+u7eiFEvJBwDreWWrKMG/Ld0zK0o/JN
	vORUBBCgOB/rrKguzkSVB/KJdQquEv+wVHG8vtW7gp8iLD81MqYqfn2HulivHETgYGcUWoRN9oo
	78mGSyfcAE2HB1e1YFe/je1RrBx3D73afFgXeRGymp5KsXDniFtGlPPDXN3WdoxMpF59DQZALo6
	XTEfnvodrEHMjcfjFT8NwzLkQyY5lBITy5fV7T+b3M16zPT07o8sLzI6fPLOUTU4zZtyay6UPdW
	ajWeDI9i5H78qs8wRSU3VJSroQeYZTDOUaSrBtUoeuoYMi75iia4Ju7xf0hwr3bU5EckGYNj+kB
	kKyUUQzOBWQkoHlOJZR+xH7cgHnRRNdToEWg42sNWe1Kzp12fRKdSdQp6cHElo1H/bopIdYcuH2
	psGER2B1Vj9YFOblfkkc6828Hy0m9K3Q85SBi8+Q==
X-Google-Smtp-Source: AGHT+IE7YHEC5xnS+73SJsemZ/ZoV1OgeBONqblLjdk3MCt98Scmb3nndzTLEX+4fpxhHukFbfDYWw==
X-Received: by 2002:a05:6602:2b02:b0:93e:7e37:26a3 with SMTP id ca18e2360f4ac-93e7e372b4cmr1761715139f.19.1760962814366;
        Mon, 20 Oct 2025 05:20:14 -0700 (PDT)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com. [209.85.166.51])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-93e86645264sm264385039f.10.2025.10.20.05.20.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 05:20:13 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-93ba2eb817aso413638239f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 05:20:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXHhAb2IhH/WsDMB+j+GOvm5JpmhRApu8gUVHKItHdD2mER9rsEDn/GWawYAZ4dL6nhANJkhKxpOS2H3C/ZwAuaog==@vger.kernel.org
X-Received: by 2002:a05:6102:50a2:b0:5d5:f6ae:38ca with SMTP id
 ada2fe7eead31-5d7dd6f4c27mr3609494137.41.1760962417639; Mon, 20 Oct 2025
 05:13:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1760696560.git.geert+renesas@glider.be> <792d176149bc4ffde2a7b78062388dc2466c23ca.1760696560.git.geert+renesas@glider.be>
 <aPJwtZSMgZLDzxH8@yury>
In-Reply-To: <aPJwtZSMgZLDzxH8@yury>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Oct 2025 14:13:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCoqZmSqRAfujib=2fk0Ob1FiPYWBj8vMXfuXNoKhfVg@mail.gmail.com>
X-Gm-Features: AS18NWDS1vbUG4-z_--VlQ3gjSspwjijy0fs8EPqX7O88cWCZQUNQKHTmAYei1k
Message-ID: <CAMuHMdXCoqZmSqRAfujib=2fk0Ob1FiPYWBj8vMXfuXNoKhfVg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] bitfield: Drop underscores from macro parameters
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
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Yury,

On Fri, 17 Oct 2025 at 18:37, Yury Norov <yury.norov@gmail.com> wrote:
> On Fri, Oct 17, 2025 at 12:54:09PM +0200, Geert Uytterhoeven wrote:
> > There is no need to prefix macro parameters with underscores.
> > Remove the underscores.
> >
> > Suggested-by: David Laight <david.laight.linux@gmail.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v4:
> >   - Update recently introduced FIELD_MODIFY() macro,

> > --- a/include/linux/bitfield.h
> > +++ b/include/linux/bitfield.h
> > @@ -60,68 +60,68 @@
> >
> >  #define __bf_cast_unsigned(type, x)  ((__unsigned_scalar_typeof(type))(x))
> >
> > -#define __BF_FIELD_CHECK(_mask, _reg, _val, _pfx)                    \
> > +#define __BF_FIELD_CHECK(mask, reg, val, pfx)                                \
> >       ({                                                              \
> > -             BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
> > -                              _pfx "mask is not constant");          \
> > -             BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
> > -             BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
> > -                              ~((_mask) >> __bf_shf(_mask)) &        \
> > -                                     (0 + (_val)) : 0,               \
> > -                              _pfx "value too large for the field"); \
> > -             BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
> > -                              __bf_cast_unsigned(_reg, ~0ull),       \
> > -                              _pfx "type of reg too small for mask"); \
> > -             __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
> > -                                           (1ULL << __bf_shf(_mask))); \
> > +             BUILD_BUG_ON_MSG(!__builtin_constant_p(mask),           \
> > +                              pfx "mask is not constant");           \
> > +             BUILD_BUG_ON_MSG((mask) == 0, pfx "mask is zero");      \
> > +             BUILD_BUG_ON_MSG(__builtin_constant_p(val) ?            \
> > +                              ~((mask) >> __bf_shf(mask)) &  \
> > +                                     (0 + (val)) : 0,                \
> > +                              pfx "value too large for the field"); \
> > +             BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >       \
> > +                              __bf_cast_unsigned(reg, ~0ull),        \
> > +                              pfx "type of reg too small for mask"); \
> > +             __BUILD_BUG_ON_NOT_POWER_OF_2((mask) +                  \
> > +                                           (1ULL << __bf_shf(mask))); \
> >       })
>
> I agree that underscored parameters are excessive. But fixing them has
> a side effect of wiping the history, which is a bad thing.
>
> I would prefer to save a history over following a rule that seemingly
> is not written down. Let's keep this untouched for now, and if there
> will be a need to move the code, we can drop underscores as well.

Fair enough.
So I assume you are fine with not having underscored parameters in
new code, like in [PATCH v4 2/4]?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

