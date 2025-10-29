Return-Path: <linux-renesas-soc+bounces-23874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F198C1B774
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 15:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 00B9634A83D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 14:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05C02E3AEA;
	Wed, 29 Oct 2025 14:53:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999FD33DEFF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761749602; cv=none; b=nLSTI6NW3RbXRWxif8wY3GV2nntO/vmH+S0oSXiLaPJj3fH1SgDVFhkJpZrNPvRcKNcy6yDM/89bOiwhBom1dbskBcUcJYsW0o0Sj0ccJYzxSlkS6V79jc0st0kw8XFy+tyNdA0YORpBaKC10NkzL8PW916TyykiWBpCOYaMJVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761749602; c=relaxed/simple;
	bh=RiCdWEkCDNsJiKATmU0RbHd3Kb5B/0yb//UgjVnVdPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D1oY3+F1nttbbt7HXiylQsc0P7i1Bh6NC1qwxq1uoPXDtP8f8x+BGuhGkfJMC0gLT2FDE5t7ss9GiqaUC0Oh7l6Lt9I3l7/gGigePI1crKfxVSBneEh73s87ps7Fy7taIc7P9ndjACeZblP6sTwhVQFhkOECOFcH4lvfdjNaXrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-89f4779fe03so502656585a.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749599; x=1762354399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmTxX9Lp/E6iQMSfd9sSFodFiE1yd68ZDUJdx86zE5s=;
        b=YzW8KZWPjYr+/c4SVmD3CD1XKO7Ad6YqoL9guAeUFYPMCBR33cF7b/8cVkHVNnf09u
         Grl5R8z5QKuyZ+8uixz/oqoVGIWEe6aMDemgDQsP7FsR+i51BqplEfaezvx2WzYu4aDl
         rPpIkomOFSjCxwYfUOsbEPNIC673YlInU8atu6UpzvFiQcyMP4GUh4XPZ+PuOr69QO9U
         qJxq5OM59gN4wxO7KLRzK6p/uqjaGiR61ouZQ9lZDuIZVa4f5HBjHcOTNnAoiKp7ZFXS
         M0sGjes3xmFsK2Nda9rud7aetLfqNmKoRO4wsOY6JJ/WcJ6JOoFVCkBrmBWtygZJHbid
         VRzg==
X-Forwarded-Encrypted: i=1; AJvYcCU9GElj7c/jaQEm02hymXow2JepnzFIyW/S/JtkmS/BLbW8NJUfipgA3vtBrJbFjKCx+ELO7sWHQMfOsI8QMiTiuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMVIYNQF88ID4PdUOGluv/EgN0G+f4C+7ipxU3ijeIr++Ee6/c
	zTbQWnvvZECvG+mHOuw3OIxNijp0PsNLjQo+vMlP3XeZP5uyu87hCY/mAomVD32P
X-Gm-Gg: ASbGncvRETl/F58/fAaRqN6QFp5T5q1ER39Hzrr4GYv+FI1YZP8zwBX7slHG6A2rCp1
	OCgBdB9JRXUbmCi2Y51h37xOiiFLI8W2Qk359x+8Kga2w5DlWTc6ryH7vyr1HXd0JY7lDQLAiOj
	6GG42E9klZwoVLqLfjN2Sif8MQKbamSr0e4PwP1xMKR1H2iz5F2sfDptCK1N5NUqDd+8EHxifIk
	xPPdUw9Qaw9HFwjhu3wTGqsCiyR3It7ReHVA8mP8Hu6dCpyeP39Xa0aTTcb5FhZT3qrrt8tQ4MS
	2aK0EACcRYZOJFjciQ8KbHsl1/Gu9MBft8rNEDCAKtR6BHyoOcu1FvSfAZE62DergRglG+GIO8f
	bzDfXkGNngAjoRkmfelf2apRsLkTYDOOoOU781OHA8duX+iikYlfVf2F/auaFe8Q+Da0y4Mbzvo
	4SMRgyHdsS9Myo+dE1uUcTQ7h1ZX47baAiSZdlDuQ5VqF6EDOKNMjVhnj4
X-Google-Smtp-Source: AGHT+IFI1QkOWBU124cW5biKS6R6q1LBvEaDx5iYXOGJ2gmDSwPwfQDka5u9w9lBBuqWc+CaJNTJhQ==
X-Received: by 2002:a05:620a:4009:b0:89f:5057:9761 with SMTP id af79cd13be357-8a8e15616cdmr408115685a.0.1761749598821;
        Wed, 29 Oct 2025 07:53:18 -0700 (PDT)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f243142b5sm1080542985a.8.2025.10.29.07.53.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:53:18 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-88f8f346c2cso717297985a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:53:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXbLI/CtI8l2Zkk+1xVw3ZSkO0frEIALgfcMIUB5LFwIP3kzGlO+J2aYhAwSlyfB++DURfnEVLn8LI1M5zpJpwiBA==@vger.kernel.org
X-Received: by 2002:a05:6102:3e95:b0:5db:38a1:213b with SMTP id
 ada2fe7eead31-5db90656011mr932905137.27.1761748238614; Wed, 29 Oct 2025
 07:30:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <03a492c8af84a41e47b33c9a974559805d070d8d.1761588465.git.geert+renesas@glider.be>
 <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com>
In-Reply-To: <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:30:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWriu9eUHMSKcv7ojSqbquP3=z2oaquQZLx5nmN0EcGaA@mail.gmail.com>
X-Gm-Features: AWmQ_blleyKJMjc4oETFxToQhJJ0bdzSdD1fdMmRWAHt71coVgn8wIHcAFgDdM8
Message-ID: <CAMuHMdWriu9eUHMSKcv7ojSqbquP3=z2oaquQZLx5nmN0EcGaA@mail.gmail.com>
Subject: Re: [PATCH v5 07/23] pinctrl: ma35: #undef field_{get,prep}() before
 local definition
To: Linus Walleij <linus.walleij@linaro.org>
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

Hi Linus,

On Wed, 29 Oct 2025 at 15:20, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
> On Mon, Oct 27, 2025 at 7:43=E2=80=AFPM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>
> > Prepare for the advent of globally available common field_get() and
> > field_prep() macros by undefining the symbols before defining local
> > variants.  This prevents redefinition warnings from the C preprocessor
> > when introducing the common macros later.
> >
> > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Do you want me to just merge this patch to the pinctrl tree or do
> you have other plans?

My plan (cfr. cover letter) was to take it myself, as this is a hard
dependency for 11/23.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

