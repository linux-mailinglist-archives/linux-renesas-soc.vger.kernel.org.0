Return-Path: <linux-renesas-soc+bounces-24013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7D1C2AF72
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 03 Nov 2025 11:16:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 92A074E95C8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Nov 2025 10:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD4C1D5ADE;
	Mon,  3 Nov 2025 10:15:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6000F1C8606
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Nov 2025 10:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762164946; cv=none; b=sW+k26Dx6R/2GfuKXMkVGcp0S+e4J5BeDtbzK+NwsyUKfAIr7GQ/0v1DZ9YpUMgQcdVG8jDSZN5WC9LU8ag/06v5c+GSznOSRAmm2RMEomoqafWhJcGDxIJeVGqWqs2EbWX7iNxE5IfUwpve70Ued6OcGS4L7KJv6nVDeaCl0Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762164946; c=relaxed/simple;
	bh=mTHQRbPtXcLW9RC24UimP00dT4bpQ240D8TduWco7Ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=adQ25sqoJ9HPZqPqlvJ6xSIEevr5JvCiNd862Pf/nS9JjAxXkFctH2VEJRth8imwbPsxXhkJkov7xLc7og4YxENxI5qGRlaBMqFBhrglIOGamsa0HhUHbk3n8y4JE2Kl0DEBt/84rN7kPBy0ZPowOW085pMsP4DLz6zhMRbyDKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7aab7623f42so1056652b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Nov 2025 02:15:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762164944; x=1762769744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WN9rH9/69UaI2zM1r1sL3pcOf4U1LH9TZ13cniByZO0=;
        b=LDt/1wkCmlaOkkVRStLGtb1m+rNQnHLcU4fq3OddBZlXsvmfjiYfwTLpsJsRfVLfRv
         jrLS8f+4TOSySbYqKbY0k+uXfjLT0OhtQadfE+YvR7G++BaFWjoKzfu1lwxPBxSC5R16
         PtjcFBY+oG+n67If6jWZOyj2qs+mP3Bw8ugQqUKOKzVxLwBn6WVU6pmNLd0L6Zo1LLfK
         uKPuCyKu8zpw9vJnU9rORfA99Kq+IelO50g3wr1eB2qgghQUQhAPFp8tamus6/GmRmRG
         SgvUvHZPcYqrK8e4x+MMjE/aawC5+hWfm2GiNBK2yujfP+h8F54VOH/9OBeZi5Ll0YE2
         rJkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUahsMUyqX0aYvEbAis5I6v/nToVBqY4hgzWFo/rrBuslIEGFXXk3Oh8/xdoL0CA/Oqu2WxpI36Pvmt+FHa52FPbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDZn71Adp6pJ5kqaMkf4EHbkOKSlj6l2sR599M7eLeGWuvDt+U
	Y7JowjmzEZr5789f46+VxjmgYSximVxF43+UlW6wBj0zgAqBbDZI4aR6k5NDtK9H
X-Gm-Gg: ASbGncvUf2SkwByT9Ya/erQhbdDLTl1bAnVvbQ+dGRrYRhbOPlhfHkjs7xM6F/ukNpq
	qVH8qO05dt2K6NmVRnN65HxXB6A3pUTpsCKUTMO8ff8GXAvSlal+75KesFW2+DhFbIWfqAx3Zps
	ZSrGL/Ktbc/XogM4J3VYkqPc0eiffXYLeKrNrvqG4mZvtc92YeuZWQYbbNKn1mtY4nctSpKHS1t
	5NXyWGXR0ldiemOqZ2JItMnNjBoeihuGP9eaHfVTDPIrlZg0jMTwHoR2LaZvAYyLzA+eGXhH38B
	aOMigRZGKAICEI88I2Fe12WeAkbeeeDQ4XKVoea7ciYTkGOfyQ5u5JyxxPCo9JlNzLXRvgP9MN3
	1VdyoAMKD0h8wsVGiV63HPqW69GPIb6tXCVnIHAXa4l7PFFwQS/rxTpv4oFyC/XNy8hk4Rj7EZ8
	ss7Aaa5J6MC1aI8jowcP0dj94KFtJRCUpsI0XqCJWZBtw7Tg==
X-Google-Smtp-Source: AGHT+IHxXAYUJPX2P2Rw28UadZbTYKgRvsk1HEajrI5ZtTU9amX9/yB5/wf7PgzUNmMXNOSqY/7/5w==
X-Received: by 2002:a05:6a20:958e:b0:33e:4b14:7e9 with SMTP id adf61e73a8af0-348cab83a05mr15444406637.22.1762164944390;
        Mon, 03 Nov 2025 02:15:44 -0800 (PST)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com. [209.85.214.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93be4f8cccsm9833507a12.30.2025.11.03.02.15.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 02:15:44 -0800 (PST)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-28e7cd6dbc0so52381645ad.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Nov 2025 02:15:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX3DY81M/I2g+DZiNg/HiT3aMhW3BiM+9AHW3qCamoqyezYK8AP90em6gqs/seI+k8pgsaSt718RKKrKRkRXL1gmg==@vger.kernel.org
X-Received: by 2002:a05:6102:418d:b0:5db:f031:84ce with SMTP id
 ada2fe7eead31-5dbf031902dmr85155137.29.1762164587067; Mon, 03 Nov 2025
 02:09:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <97549838f28a1bb7861cfb42ee687f832942b13a.1761588465.git.geert+renesas@glider.be>
 <20251102104326.0f1db96a@jic23-huawei>
In-Reply-To: <20251102104326.0f1db96a@jic23-huawei>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Nov 2025 11:09:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkm2hxSW1yeKn8kZkSrosr8V-QTrHKSMkY2CPJ8UH_BQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmxzzzgoIljXMDy5wJmHF15bg4ZKICGjY8c2_gWom3ME9XAPzMw0ghLXn4
Message-ID: <CAMuHMdUkm2hxSW1yeKn8kZkSrosr8V-QTrHKSMkY2CPJ8UH_BQ@mail.gmail.com>
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

On Sun, 2 Nov 2025 at 11:43, Jonathan Cameron <jic23@kernel.org> wrote:
> On Mon, 27 Oct 2025 19:41:44 +0100
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> > Prepare for the advent of globally available common field_get() and
> > field_prep() macros by undefining the symbols before defining local
> > variants.  This prevents redefinition warnings from the C preprocessor
> > when introducing the common macros later.
> >
> > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> So this is going to make a mess of merging your series given this is
> queued up for next merge window.
>
> I can pick this one up perhaps and we loop back to the replacement of
> these in a future patch?  Or perhaps go instead with a rename
> of these two which is probably nicer in the intermediate state than
> undefs.

Renaming would mean a lot of churn.
Just picking up the #undef patch should be simple and safe? The
removal of the underf and redef can be done in the next cycle.
Thanks!

> > --- a/drivers/iio/imu/smi330/smi330_core.c
> > +++ b/drivers/iio/imu/smi330/smi330_core.c
> > @@ -68,7 +68,9 @@
> >  #define SMI330_SOFT_RESET_DELAY 2000
> >
> >  /* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> > +#undef field_get
> >  #define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> > +#undef field_prep
> >  #define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
> >
> >  #define SMI330_ACCEL_CHANNEL(_axis) {                                        \

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

