Return-Path: <linux-renesas-soc+bounces-24009-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BF4C299D9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 03 Nov 2025 00:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50972188DD2C
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Nov 2025 23:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74CB2255240;
	Sun,  2 Nov 2025 23:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="veGqDOkc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E289253F3D
	for <linux-renesas-soc@vger.kernel.org>; Sun,  2 Nov 2025 23:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762125305; cv=none; b=p/4Qz26Q/S4hHHL7rnnSq0ENUieJGvbLla0ZS5g2nSSJ15nO2k/gm61Zn0cLXZ7bVFKSx3iUMR6gmBYfG5sQyapQN93/DmVQYYTVrOTJTojdrFR7dUYVYVBpw1KQrjwv31NzxGMC4+MAkg+JHa8QeMEziSvcgECmmnsU3SVvkXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762125305; c=relaxed/simple;
	bh=gJ+z+fSwzGRoLTASac48Xt/red+jojCgmvvYT9GdSRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aMj4yVYc/aNJaJFt+YDRHDDkNAGQ5JVlHfb+0L1GstD+4Lt6NA1EF8+3cufyi0XXKfHxuXYaLlTjaS9iuMxhUwCwnWWLBbXqux5vFfQoiPC5heLfjKgj5KexFxriBUt+FMyL6A3a+xqTFtGFYYIwE/GPwsE36Jvk/M/9I9hMbZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=veGqDOkc; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-378e8d10494so38646011fa.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 02 Nov 2025 15:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762125301; x=1762730101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhefXJf25nlZX433BsR2ypBCZ8ChrLrkfTMoigu+ucU=;
        b=veGqDOkc2KbhhYjsZ6lnbXmmedGeZoZMglsu3m9z2Ag0Z0bdrOYId3GZuEWhYWx0wI
         QEl0Q9LXRGXaHhR55y8x6ETnqRedFkOF1K1RR49+BaYHgSdEqcTfNCnEhQt7o6Je59Cf
         KVvfDY/Kk/QDbmSmB9l2fTmu3WGrWtGh5AOzwj9esPRfhpfNIkiz3MlTjJg+M+N/ndpa
         geV2axmVI2rxVLB6HmhRYF8WTJ7KIFl1p7BcApKDg8NPbtSvw53jfFdBap4gPtbQ0+Hb
         QYdytI+Gj6ya4I1KUy/71GBHTtwcAGNq9roNc6o/vDW32qf0M8U5G9RKh2EfePP2Cxni
         qfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762125301; x=1762730101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhefXJf25nlZX433BsR2ypBCZ8ChrLrkfTMoigu+ucU=;
        b=YRIJc+O8qYtYz3QHBxNnL6e50sskCVrP8cdYw2RMlN/BKxUIx81t2GvBlhoJQNkwsK
         xFU1k2VbmijTaUFTdT+OFQuNEphoiQr7vBDPSyePvOdYzxRk7DH1JxIL6MX2gzFu475w
         OtWBjhNRsEByG7M+/S4Xn81ohigexe9k1Jo96AviL9UmXnki2av8uDSMH95cw8V5W4Um
         RZVd8GwucYHyeuf143Lp5LT9jt4u+eWHiU1KDM5GPGqEptIqCLy4kpqlxXwqYUndl7Wh
         qUJxHP/kF/+n1yN5dn2bxVsD/tVS08OqiXuXO3GtKrlJTp0AYpFh8fsknJbpdgJA3ZNq
         pT2w==
X-Forwarded-Encrypted: i=1; AJvYcCX3wbTUWww4Opmz2Jo75OTESmKfrbYr0XlxJvFA7ZwKpwtuJnnL9nHYOTHDQWHeBWOvjCOVrhrAM9cqYVkYTRduHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLAyMFZUrKNevmK+1v4oOTD/skxgxPLNRh8SC8MPlrA+KJxtpf
	tLY4HfpW9OEbbs+ZQJJN5ObzZZvZlrAXO4PfmgJ6oidGgHqNYbf7DTCQ2gmXJfJ0LYTS08RrUbp
	aqRmZWlwJo3Hkjlikf6Y9c5VHK37TNRD63ImYZlcFzQ==
X-Gm-Gg: ASbGncuK2oyGFGQC9+AN/oYG2z+Wxb6H2qHMuMcEd0Td6VCWXLoKVrJ71YmwLHXsaxI
	78hK+2KAPwNQxxBBET+FZk8xwe3YmEzbOR/2tRMLDuHu0NdcmJHNW7TatnNuZW9mvtiusox5qVR
	INnyyPPUisg/nrAL12ddPy/wXmocUJDoT9fRsjX/Gr2fuaibdpZO9JzqFjjep+MQgR3GyjTNXp2
	XveLn6tONlA95OIfpvYEExMCjPjjgZzZ0gwZEjnSA6tkPLaqS74wpAh9CIAPZDx61se4h3cS3hm
	iVviww==
X-Google-Smtp-Source: AGHT+IHNOSftU4LA4kaZ2zit5fbsUjeer+Cqtnxd6HV9vMAwCSf0ZxvdazFj8kc8iFBA+Oyhy9hRt9pMH+krWfgjY8s=
X-Received: by 2002:a05:6512:1453:20b0:594:2646:2350 with SMTP id
 2adb3069b0e04-594264628f8mr1107502e87.21.1762125301355; Sun, 02 Nov 2025
 15:15:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <03a492c8af84a41e47b33c9a974559805d070d8d.1761588465.git.geert+renesas@glider.be>
 <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com> <CAMuHMdWriu9eUHMSKcv7ojSqbquP3=z2oaquQZLx5nmN0EcGaA@mail.gmail.com>
In-Reply-To: <CAMuHMdWriu9eUHMSKcv7ojSqbquP3=z2oaquQZLx5nmN0EcGaA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 3 Nov 2025 00:14:50 +0100
X-Gm-Features: AWmQ_bkG07aYa3yfLgn8mo--U0KGtThYfcOHYFtKUjSupbZy0y5m0bQWTypUrbs
Message-ID: <CACRpkdbR+5jh+OqYAU4vyUP-aQSjgMG3RRBkUTWnWz=VEy2Oew@mail.gmail.com>
Subject: Re: [PATCH v5 07/23] pinctrl: ma35: #undef field_{get,prep}() before
 local definition
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
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
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 3:59=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Wed, 29 Oct 2025 at 15:20, Linus Walleij <linus.walleij@linaro.org> wr=
ote:
> > On Mon, Oct 27, 2025 at 7:43=E2=80=AFPM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> >
> > > Prepare for the advent of globally available common field_get() and
> > > field_prep() macros by undefining the symbols before defining local
> > > variants.  This prevents redefinition warnings from the C preprocesso=
r
> > > when introducing the common macros later.
> > >
> > > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Do you want me to just merge this patch to the pinctrl tree or do
> > you have other plans?
>
> My plan (cfr. cover letter) was to take it myself, as this is a hard
> dependency for 11/23.

OK go ahead:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I see there are other review comments, I trust you will fix them up
and merge the result nicely.

Yours,
Linus Walleij

