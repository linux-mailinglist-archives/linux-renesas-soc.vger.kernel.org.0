Return-Path: <linux-renesas-soc+bounces-23857-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FDAC1B355
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 15:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 954741A2531B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 14:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFE42641FB;
	Wed, 29 Oct 2025 14:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iPmuKBsz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73F31DF994
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761747708; cv=none; b=Ei4Wq0j7vTbjx1HZIJ+I+uD2+0yWMu1t3ew7g2Hu4POS/RyFjYMynVACUX1M3vBXunT2FhZzgGHikzFYeMKcqAtkJcy95zDrh/rMGbtASKUKixqYbObrbCkcO+tCrHTxXqhC8YEyhRmarhl3uQPbu5cDvjS0EZbZpx9PCXXRGf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761747708; c=relaxed/simple;
	bh=W2MmcX2vCweI9Q0W0BLZEPy3CkT01KpRkvvdhb0j4RU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OfgSwpSlkEuvf7RrZXKHFC/kBtpFgF+iS/SdX8SPnv7xXO3EUiPprmISUQE9RHiKF6nmvQaXvd11hRQnMiwnYsBTa3IIlvRlchrUXWnMr7IspbywsdFt9g8Q4VFLcX7B3chTk9bCrnQMiKRz7QnjJb3nmsMBQUlkZKbjIAp0adk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iPmuKBsz; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-58b025fce96so6254139e87.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761747705; x=1762352505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVuX2dWoAgb7QHLLOTB16BwhmwEzZ8jO6zQdan0Y+2I=;
        b=iPmuKBszqzRuJQbXmV7ZqrHkGQ7zzFPI5fCiy2pzoDtPjlRPUxn/iBGENRd/ptR9K7
         3VBKIZJP1O0yUFj7/fCcbOwJ6Jrfg+aPV8Qe6xEI+yJbt3zW5MFm2vbkHPWUEusZbsG9
         9pDt6yHUt7It5usEE7V6f8zm2g/wPOsuVhT8wJtzZZCpNR5pe56ZlKHI8y6UiF8K+aW0
         6QnQ2mRi0kkStXvJzZuY7GofiTxN0n9PLm4/uCs5Swf6Aq4grVIHoojnEHTsOwvkPK9h
         byUFAKzmTHWTLC+KE+CJwCtlAzXP6ZbY547Jy05lqxEPqw1USDxJedUjrktORkWq++Nc
         KPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747705; x=1762352505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVuX2dWoAgb7QHLLOTB16BwhmwEzZ8jO6zQdan0Y+2I=;
        b=H6NOuEp4NFl+pj+9gtSv/NkBAPeCWQO/2ECzoT9SKsh4uR7eoUUn3Iddm/01e8v2+k
         c1+RKyw7xNp5rGCdXM+nwqsPEhHbIwpMGamYEVY6FCXuL9d/uBZLQaa0PtF3yIVeZSdg
         zmAzyTeJ2E/K1+dQTadngpb4MbzKqY1HvDuDFvd9i6+PCpXriwtnqYcvkgX4aARS44GQ
         I9R+lIexG+FZfkzNwiQoe1aB2PH8KhBJAfBq1d3Qh/iD1GP+5LsESli7qkpzRXxzzpTY
         VGKWLG2ZpUc2vonipkhrvYVoZYdlJsnC9W+b7d4yKndkTtxnV+gh4RmW41to3RlSUme6
         WDXw==
X-Forwarded-Encrypted: i=1; AJvYcCXN4C3rVdri19A5vKfqEikIsdFDu+qQp3f2HgpZZNOSKt0ihdsBipI+ZRx59xDsvYcDZrMa+3b4ogzBp3g5MXqZgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw2xpczKPf+DucVyn4fV9iWTpmGbWkfTSjZTq0+G0Cj2rug4H1
	ALfEbhPs1vca1kiQ8xQxqOvCew4ic9g7TlfyWSGdgksMNRmk05uxl32QKRCqaBcenN0UlXdu4GN
	vzSKnzGTx5yptNWbCNXZWubJfZxzvxJGfXdKJHE5whg==
X-Gm-Gg: ASbGncv7sYfDm4ExTcuwMva2XxSYaUrJ0ORcvD75h4rvkTR2LW7T1xfZJ9MoHpKFM3R
	j9k8ncOGpoNr51JsXR1PP+OmiWd9lHi5K8xethh2odsmfOuFCTB+MSrfisaEGlBUAerSEBr43cp
	p6rNflzpfJ3HTb78CnCYRRtFzeUf3inVzyv1/hX9XzEcm5fcXHi+swEaw4qXl2Sk39AeKCBL71t
	QI6W2+biOgJzPZYa8OlkQxFHC0U1xeVyKaJ7czRG+8iK7b+veCJ0/mPbLxd
X-Google-Smtp-Source: AGHT+IH/WV9TTRDue/YlQPKqZJ/rOmSLCumqELYgQ//HXfU7luOPdKKEVQrj3vn51BUY/zZkRojEs9B5VMPxZwJpOnE=
X-Received: by 2002:a05:6512:238f:b0:592:f814:3852 with SMTP id
 2adb3069b0e04-594128b7bd8mr1157709e87.20.1761747703432; Wed, 29 Oct 2025
 07:21:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <ac3e718c5de6a23375055dd3c2e4ed6daf7542d5.1761588465.git.geert+renesas@glider.be>
In-Reply-To: <ac3e718c5de6a23375055dd3c2e4ed6daf7542d5.1761588465.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 15:21:32 +0100
X-Gm-Features: AWmQ_bn0qj1HdhGI-E5owVSGvqmNxBgXc48MF5-9CHRtkVWKXcvNelNuCdps5kE
Message-ID: <CACRpkdYMv+R-NJ5R4+UyhK1+DJia0z72kZgt45+0eubXMuGpEw@mail.gmail.com>
Subject: Re: [PATCH v5 18/23] pinctrl: ma35: Convert to common
 field_{get,prep}() helpers
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

On Mon, Oct 27, 2025 at 7:44=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Drop the driver-specific field_get() and field_prep() macros, in favor
> of the globally available variants from <linux/bitfield.h>.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v5:
>   - Extracted from "bitfield: Add non-constant field_{prep,get}()
>     helpers".

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I guess this needs to go with the rest of the patches?

Yours,
Linus Walleij

