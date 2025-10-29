Return-Path: <linux-renesas-soc+bounces-23855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B08C1B548
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 15:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7FD404F31CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 14:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECBB265CC2;
	Wed, 29 Oct 2025 14:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="STdMHBQT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8380D263F5E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761747601; cv=none; b=R+S38srF4ydEkgEGYo6p6rdPadmtxE/k/yc/SIXnFUQ2Ibh3eTqBijf9l9l1M3yiIEIl79GhNMYp1fiBPGxhttcfoNsV9GmMKsv4laeUnGW8UblbroQ0ue6cRo2ttxlMMteM2V3Z15Hr2iI0V3l1eelV7KWTCGqMVQ0fZNleGfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761747601; c=relaxed/simple;
	bh=1CX+8+kOSf10qsVFbiIqXKLPwxKNZKPK3M5tdY2U3zQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WzEVhWx9ocJyvok37aOqojmrF+dFzlelBdHQStltXNPCD2xw0Ztc/YhpVyOplcehcnioW9xVitImG7uMcx1Ktt/rhUDLTkghCDm/RGd+PxWgrRQdbtkPbK5R+4zJMiAsY7xiFLNr+jVV3djqWudtDsa1L7metkUg5x2CEUTYVpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=STdMHBQT; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59303607a3aso5631256e87.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761747598; x=1762352398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOeCj7atBm+jp74qXquxytnJSCplsW/eyoN4u7SHchg=;
        b=STdMHBQT12yVVhenBH9kjtzktzfxhBOPKOo9apSlTLueZcsupwgg31te2NoZ1MYB8V
         MSCDsKHm3FOvPOU5eIBCDfHMdlRjXQ/WaIfGw7guwrNmTT3BzH6WS72IQ0rngTeIuIKG
         geIpbGtk9/KkbvqJ4ys0/EumZ1gCsCKUv+qxxEKzmywlju+PTnHhCdTYr2IGsTbcyPmT
         1dv7mnHne5W/9nCZuPRS5MOiokEytiREtrQcf4/hBmfAUMtMcLusUKfTMKcUvAn01g/8
         YYl2+QIB5DhWKuvrDaYdcUxOB+ZWEQK/1a4i5MEDu6ruYYw7g+OmbE5blhnTFS7GFVRk
         77Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747598; x=1762352398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOeCj7atBm+jp74qXquxytnJSCplsW/eyoN4u7SHchg=;
        b=k9Wqc/dsuZQM8TQreDdBjphEWrBLZz/i4NkOZDzBPsjKPxJrCUUWwqyXruI2A9oyD7
         LlHYeSZnm9FNh5k0fz7ZoouEa4fDBv+D29mw1hdLcyWsBcgwg7jVJr4VkNXJFjFsPDN5
         n5QWZ9a9Wi4IS9Pxw8zR6/sCETY0v6eTEaTfkcn4fHg5bQCRfmKUwvlAc7lSXBkGtDHt
         Q+AzK8HX5QVtD6ffRrsFpgE5MBsB/2Mx2xTG2qYRdv4zAUAWjQo6XHQZTWMuQ/A1viw2
         biQgnVMp0b8Kn6JJdHi7BJ/b7Rq8XS0tatG6y5NnFHcrRwedIgmiL3fncPNuw2txe+/z
         hJLg==
X-Forwarded-Encrypted: i=1; AJvYcCXc09i2nbKwWPrW7zLF3obPpsIh3MKc81/0uwJVnFy4KQGngJhccxFh0I0iAyEeNwK/RCsiMCydicgadU5ahRlRgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmJ2LoGg9V8trvJcecW+CGG0RTZJY009yRrrKO2+n6aKkrfJBf
	ftu0TYHQEUrb/mNiEdmx/R1A1Oz3Z+jT8Y8mqzoEKA5LnK0EOsF5oJtgkimg2SDH3cLQPdK4cy6
	WLSUwiZZo8ctDV2Ogl7yUZXpV02D8hPEuEsuMvN4Tbg==
X-Gm-Gg: ASbGncvwYS8QB7Yrr6+2gce3SGbSs2o419r4PTA1+9ZTDSFcRPDLkMPr6W1q0i/gdwD
	cUMjwdXhMdQ2uQlV0dQAmXgW6TANRPidTAX5rybvjcGuZ2N7sz2+27YMvbuB0n6V6lJ4YryP4H5
	wmsecwvbD5SOl08e3oCbr2BD79JKKC6FPrEff6MALCBUAIS/wObuzKhSH3AkNhLRAswww9wmiyo
	0QWUjcQzrAsiM2/Og/YSk1wPmZvIDuNDbPMqwrGs9RjGOkZEKEy8FuRdhTQXqgJGS3l77bFMW5T
	Xwi2dA==
X-Google-Smtp-Source: AGHT+IG59+bQUerf6uihfCFWCYSjQICr8Xo4ZbiwSS1E65/x2rl3ls+2t5ioYCJKzMBcQXa5Sk43LYjN69G8TJb8SWg=
X-Received: by 2002:a05:6512:3055:b0:592:fc68:5b9d with SMTP id
 2adb3069b0e04-594128623cfmr1174582e87.10.1761747597543; Wed, 29 Oct 2025
 07:19:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <03a492c8af84a41e47b33c9a974559805d070d8d.1761588465.git.geert+renesas@glider.be>
In-Reply-To: <03a492c8af84a41e47b33c9a974559805d070d8d.1761588465.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 15:19:45 +0100
X-Gm-Features: AWmQ_bk2MMp0FQz04qrj-8hmhOAMRkHeQZjiqCVvFpO75M_-67m5zTnOfqmkGUQ
Message-ID: <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com>
Subject: Re: [PATCH v5 07/23] pinctrl: ma35: #undef field_{get,prep}() before
 local definition
To: Geert Uytterhoeven <geert+renesas@glider.be>
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

Hi Geert,

thanks for your patch!

On Mon, Oct 27, 2025 at 7:43=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Prepare for the advent of globally available common field_get() and
> field_prep() macros by undefining the symbols before defining local
> variants.  This prevents redefinition warnings from the C preprocessor
> when introducing the common macros later.
>
> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Do you want me to just merge this patch to the pinctrl tree or do
you have other plans?

Yours,
Linus Walleij

