Return-Path: <linux-renesas-soc+bounces-24374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B07C457B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 09:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 886033B2741
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 08:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817D42FCC17;
	Mon, 10 Nov 2025 08:59:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76AF823DD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 08:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762765189; cv=none; b=Sef1a7dR6tuNBg4+xEJbVVeqfgpQHTqbetWqG97fTLihv8hl/qIQhj3cRWtU6Zg7yE7pXmys6oBlgGzlfRmmtoQ+yzElVu7RJu9em1xv9oZUz1zfSaQrL7g656ifLQXT5vA91rSwAqgHgcexK3DARd5fPjT9Hg/X1vBOblK98dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762765189; c=relaxed/simple;
	bh=JRmjklDdMnXYPa/YzcCMj4xR0iBgS1Ed7pmHd076aaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iT/zYiKhi/9P6aWdCbDabUUEo+b7J5GTkuX/frszYfYPpb5OK8EN9aMkgvDLshjl7G8v3LBu2Qmt0Hyjq8K/Zn5pFQWz/qu32gCU6IjZXm1MkMH2l5hagzmDywzrRbYdXr+OIhMegCFE7ecC0O7obhSaFASXhdJlKw8doakD1dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5db2d2030bbso715172137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 00:59:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762765187; x=1763369987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuaR1c68u39/qbD5w07qCJ9IxeheIz5/8CL8hB/l6OE=;
        b=X+hChI4wGDy1yaSo8o9wjZD48inuM4NKVFtExd49BjCXJXVyl587fnAa29J0hQBsIX
         OUdvbsC05/VVrfcjYxxcfL4JKafVcwTu33oaaNTnUNhbDx5/JnTMjy0QSIX/aG7qHQf/
         msHICpsuyt6PsLRqiCrCp7zOb7uwuJUAXRZgTDtYe5rixwVAx93eRBKv7gL7AL//c1Dm
         7yfltZHVAyKHwiwNr+nozK4s/6hULrc1HSWaPQ35MfTgdvKRhpJHdt5nga+2yOlb6OQR
         9tO3fWOwHA4/7dp2efsRvfJbso/BxluJNNQ3UHd8ijOK8EUpNbslSrT2ddDEYtY7hQkH
         pJrA==
X-Forwarded-Encrypted: i=1; AJvYcCVBrynBMfo+9jBJXMPCjQ64hutlwcT38NakKiD6qPVDajawa5+sjNhGcwfijpe0WNG+FNaqs0Jeaf59Z6TfzzOS2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnSVKy3Uap/iJLM04kjJnBD90fMe5+2MAaIrgDTN1q2+6ZrU29
	dWXHV8zcxgqOEYsfcaxegHgov8os1sPunVCKvBpoQopgREbVB8QmbcxkmpwdR1an
X-Gm-Gg: ASbGncuJVrLkUR286ox11FIkSYd9QNO6gxZTF4O0lGtAmQI2saO/m4JJcpKTVT6FR+Y
	RMP2hzgxcs0PV2Isq1uPFEk7aFlgX2rgAr0jICMCSxTQnTyBYGDWvIaq+Cd+M/GY4MjjCe2zVBp
	+7+e6i58MbBbimgARIVyUp4HzlPbyJaVwVSSFDZytAWVFKk1h1M3dolHDeRe1V+fySYTXEWyOD9
	WnI2FbL8EF5/OOaI+/crSyIDc5Jr5g9M7B6mVGhFb51/fyWOj8AM89wHolAO/KKTbUsIXi0N8yJ
	IO8qcD5RSNMeaz9wXya689+aCJbI9uBokWQu+b8Q4WmybtaflhPSMCxCMErtk1lA59KN6KbXoYV
	ZY9FYxIq54zu0ExvCNBJFqT5ndddE8xVMBS+JBmOHS7FVWMD/WteKOpT6mOtctrvaRencQCQqf+
	W5Z/2GtoBsNn62qJ1sVrvb2j1SWLuLRwajVzCnKvWq4w==
X-Google-Smtp-Source: AGHT+IFqcwALCpDCmtgyIl7pRQ1Es126WREbQ7roIWcLGtJ/37FtKNuyFqKBkP0hewJWgkzJMVu+EA==
X-Received: by 2002:a05:6102:c8a:b0:5d6:6b7:844f with SMTP id ada2fe7eead31-5ddc48164ccmr2214483137.31.1762765186547;
        Mon, 10 Nov 2025 00:59:46 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dda200bbb3sm5449431137.11.2025.11.10.00.59.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 00:59:45 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-937262a397eso502347241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 00:59:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1lyffpRJS73D1t9lUjUrMxRu3US0I6rTT/OO2VQ5rUlfg+a3DBUJEVdKIMucOOWpVyPKXWQ/9uCGUxh9WPGWfpA==@vger.kernel.org
X-Received: by 2002:a05:6102:950:b0:5db:fb4c:3a89 with SMTP id
 ada2fe7eead31-5ddc471358fmr2304047137.19.1762765185596; Mon, 10 Nov 2025
 00:59:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <97549838f28a1bb7861cfb42ee687f832942b13a.1761588465.git.geert+renesas@glider.be>
 <20251102104326.0f1db96a@jic23-huawei> <CAMuHMdUkm2hxSW1yeKn8kZkSrosr8V-QTrHKSMkY2CPJ8UH_BQ@mail.gmail.com>
 <20251109125956.106c9a1a@jic23-huawei>
In-Reply-To: <20251109125956.106c9a1a@jic23-huawei>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 09:59:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX8c1VkBuPDpJ5mpCcRH+zEX4F1bQKFf_V8N9ZZtCYqxA@mail.gmail.com>
X-Gm-Features: AWmQ_bmD7LCstBufqr7pTwqKUhf3WnheTdaFZy-l1C13xKAmQ3xomq2Nqy5MxZo
Message-ID: <CAMuHMdX8c1VkBuPDpJ5mpCcRH+zEX4F1bQKFf_V8N9ZZtCYqxA@mail.gmail.com>
Subject: Re: [PATCH -next v5 10/23] iio: imu: smi330: #undef
 field_{get,prep}() before definition
To: Jonathan Cameron <jic23@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
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

Hi Jonathan,

On Sun, 9 Nov 2025 at 14:01, Jonathan Cameron <jic23@kernel.org> wrote:
> On Mon, 3 Nov 2025 11:09:36 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sun, 2 Nov 2025 at 11:43, Jonathan Cameron <jic23@kernel.org> wrote:
> > > On Mon, 27 Oct 2025 19:41:44 +0100
> > > Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > >
> > > > Prepare for the advent of globally available common field_get() and
> > > > field_prep() macros by undefining the symbols before defining local
> > > > variants.  This prevents redefinition warnings from the C preprocessor
> > > > when introducing the common macros later.
> > > >
> > > > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > So this is going to make a mess of merging your series given this is
> > > queued up for next merge window.
> > >
> > > I can pick this one up perhaps and we loop back to the replacement of
> > > these in a future patch?  Or perhaps go instead with a rename
> > > of these two which is probably nicer in the intermediate state than
> > > undefs.
> >
> > Renaming would mean a lot of churn.
> > Just picking up the #undef patch should be simple and safe? The
> > removal of the underf and redef can be done in the next cycle.
> > Thanks!
>
> Only 1 call of each of these in the driver, so churn is small either way.
>
> To avoid a bisection problem if your tree merges first I need to modify
> this stuff in the original patch or leave it for Linus to deal with as
> a merge conflict resolution which is mess I'd rather do without.

If you add the #undef, there won't be any bisection problem?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

