Return-Path: <linux-renesas-soc+bounces-24297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A1EC3EDA1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 09:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D558B188DA93
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 08:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C9530FC27;
	Fri,  7 Nov 2025 08:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmyoA+YH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B38A30F92A
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Nov 2025 08:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762502437; cv=none; b=NY5mUTWwidXWu+ZBKab/puYZjGP9WqL+nvyPNcwKqLlAnw24H4YRcgjjKdLs4zrwoMYx208r7Q7umpUpKRlO8xCUvJ1C5JLejwMyOnUWg3PYzHxv0jrS5YkAcCP8ajeHphkSb9gyaom/TseYZ/UZPIKay9GL2zOBD0z3ZXr9BLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762502437; c=relaxed/simple;
	bh=gTrtMTVdIq8o2Lv2gAG8UVNbAa67NI0LZcaPzCP9uxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g8OmJGqF922PXGdRrxWpdQmzURDWfYS3364TQpiYN5VK5SOWkWKHuSiIkJQtRMA+AjTLKs6rnhm6YWTEnkean98O2vQksOdeHTfulKyzwcLmY9TdGu5YnmFb0B7jFD7/GaJ+Q8Hd3u3Is/rL4TCrTp+C7GuySGa1rUakVF4khGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmyoA+YH; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-63b9da57cecso786598a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Nov 2025 00:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762502433; x=1763107233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4L8nwY5tA46qS9RhjMiBvwIJ3m3PvlUWeeZDUBNYNE=;
        b=AmyoA+YHQZgstGRmD8U6Uc5Qp3lHeC8gVhIBg5c7IDTiz9uxO1MKh5pvTLMYZ1uWXu
         ZOiCh/0sWFaopk+f5KfR3BcFOL9zYZNgwM+yWnrs/cvXnteu3aoXVLpBmW9Pfhsbf51W
         laGx54OYB+zhf/9On7oJS1XjUSQyqr2R4q7FPf5IKZPIZLj6jE2u+xaaRonDpdo8cYNo
         sT26cX0LyiU9BpU1+93/AVTPh27969l83AWVEOF9a/s1OW3QFogNfFxrcAkv9htYErpE
         eVO+m5sjBQ7LePaEsHPnv1juoEuTT3WWZG2NexOODGf77B/buQoApHYTaAQa3EaoqGXO
         dy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762502433; x=1763107233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L4L8nwY5tA46qS9RhjMiBvwIJ3m3PvlUWeeZDUBNYNE=;
        b=ro/adcqvUok8GhPXJe4ttG2ybmOyhXo0jbO3f8gBipss044r+PCRI1Fgw7XWncJgah
         AJQFXQlPNL1o7qbgfJtzCYbJJIWmVPmT2l8xERBbwoMogWSVxzV/nbWjv/hSPVSzr0NI
         rQA/Pu8z+pWVjq1MrW9EzbmJNEcF7Sc2+Z2SPYE+FaS2V2AM/ZxgucW2/op4cBEavEYs
         bt7vWIvqROFGXijd4ccsH/FeYEoOMW4pOynQ1M6FZi/yvoePpFhtXOw65hnP2smsvBnc
         jhmHdquXC2SQKvy/Xf7PC5v0bXWNQylaDJQ8Mxszeay+7inA2rmJtQow9VBHHImcSW3t
         Xb6g==
X-Forwarded-Encrypted: i=1; AJvYcCWrGcwz9eR1tmM0RQlWITkUbvHquatCIo/rVP045/d/w4F2/lcWA9KpE5ic/kvkNIouVIhN09SbDTX5qiVn8RgYdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9LZNXa10vlGAT6k2OAKuipy2KJBPYqPkA5lO35E9zgu0vmzJ4
	oKMK7dl8TznQ3COdkAUhTfyzUeg8MIIDMG8UEQ6nmoTBuZK+dBs1Idnu3S+cON4tkRUtBeCSz2e
	YVyZGU/5fk2jGlQlb8p3oZsHBq5rrP6Q=
X-Gm-Gg: ASbGnct/Qulislxlqo6YHIFFxt5q3OXi9pfUHyjDct+ohzLYNS7qCLl7VWjnsa9XMm1
	cFhRGRJCKfaoCIV9wr5NGhR6WQpk/MXnIjlMhrsWCqeGxphgwL2J6eC5bNsC/4Zh9mDBbdlZ+do
	3x+XNq/WZuStMmRjJfCxR/ktv28ykfKb7y7TMm3hEokTHdbfwU+7eGz8piCm4hVtdwo+TwWO6Qm
	tQVPViO4SWavgljeAdPvtjg4nUaecFBFccWNMC0V6FQ1EDlxIAG676D0jTJabAQIYyzYFOz
X-Google-Smtp-Source: AGHT+IF1uok4S2/ZJxGVMG6j0RZBxmZiPcUtNqCXKtotlWPr6F8OAXOZaMRmuRE8uDgHau7bT5W5RrHY3dcLjEjQckY=
X-Received: by 2002:a17:907:3cd6:b0:b70:6f46:d401 with SMTP id
 a640c23a62f3a-b72c093317amr195124066b.11.1762502433125; Fri, 07 Nov 2025
 00:00:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1762435376.git.geert+renesas@glider.be> <cfc32f8530d5c0d4a7fb33c482a4bf549f26ec24.1762435376.git.geert+renesas@glider.be>
 <aQy0T2vUINze_6_q@smile.fi.intel.com> <CAMuHMdXVUJq36GvNUQE8FnHsX+=1jG4GOJ_034r=fgr_Rw4Djg@mail.gmail.com>
 <aQzIIqNnTY41giH_@smile.fi.intel.com> <CAMuHMdW8ndAdGnSHopYFMWvw7wk7wKz_7+N91M1jRHoqK1KBrg@mail.gmail.com>
 <c62eb5a727f149fb9d8b4a4c8d77418a@realtek.com>
In-Reply-To: <c62eb5a727f149fb9d8b4a4c8d77418a@realtek.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 7 Nov 2025 09:59:56 +0200
X-Gm-Features: AWmQ_bndsm6ikZxAsR6MbqZ_7CJczSuokLGcsZHpDoyZxbjksOeSkgDr0jWR8fA
Message-ID: <CAHp75VeMqvywS20603yDSo-C3KCu+i+8vvDNuz3h9e8Ma9BOCw@mail.gmail.com>
Subject: Re: [PATCH v6 12/26] bitfield: Add less-checking __FIELD_{GET,PREP}()
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Yury Norov <yury.norov@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
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
	Jianping Shen <Jianping.Shen@de.bosch.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, 
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "qat-linux@intel.com" <qat-linux@intel.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	linux-wireless <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 3:16=E2=80=AFAM Ping-Ke Shih <pkshih@realtek.com> wr=
ote:
>
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, 6 Nov 2025 at 17:09, Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Thu, Nov 06, 2025 at 03:49:03PM +0100, Geert Uytterhoeven wrote:
> > > > On Thu, 6 Nov 2025 at 15:44, Andy Shevchenko
> > > > <andriy.shevchenko@intel.com> wrote:
> > > > > On Thu, Nov 06, 2025 at 02:34:00PM +0100, Geert Uytterhoeven wrot=
e:
> > > > > > The BUILD_BUG_ON_MSG() check against "~0ull" works only with "u=
nsigned
> > > > > > (long) long" _mask types.  For constant masks, that condition i=
s usually
> > > > > > met, as GENMASK() yields an UL value.  The few places where the
> > > > > > constant mask is stored in an intermediate variable were fixed =
by
> > > > > > changing the variable type to u64 (see e.g. [1] and [2]).
> > > > > >
> > > > > > However, for non-constant masks, smaller unsigned types should =
be valid,
> > > > > > too, but currently lead to "result of comparison of constant
> > > > > > 18446744073709551615 with expression of type ... is always
> > > > > > false"-warnings with clang and W=3D1.
> > > > > >
> > > > > > Hence refactor the __BF_FIELD_CHECK() helper, and factor out
> > > > > > __FIELD_{GET,PREP}().  The later lack the single problematic ch=
eck, but
> > > > > > are otherwise identical to FIELD_{GET,PREP}(), and are intended=
 to be
> > > > > > used in the fully non-const variants later.
> >
> > > > > > +     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >        =
       \
> > > > > > +                      __bf_cast_unsigned(reg, ~0ull),         =
       \
> > > > > > +                      pfx "type of reg too small for mask")
> > > > >
> > > > > Perhaps we may convert this (and others?) to static_assert():s at=
 some point?
> > > >
> > > > Nick tried that before, without success:
> > > > https://lore.kernel.org/all/CAKwvOdm_prtk1UQNJQGidZm44Lk582S3p=3Dof=
0y46+rVjnSgXJg@mail.gmail.com
> > >
> > > Ah, this is unfortunate.
> >
> > Of course, it might be an actual bug in the i915 driver...
> >
> > The extra checking in field_prep() in case the compiler can
> > determine that the mask is a constant already found a possible bug
> > in drivers/net/wireless/realtek/rtw89/core.c:rtw89_roc_end():
> >
> >     rtw89_write32_mask(rtwdev, reg, B_AX_RX_FLTR_CFG_MASK, rtwdev->hal.=
rx_fltr);
> >
> > drivers/net/wireless/realtek/rtw89/reg.h:
> >
> >     #define B_AX_RX_MPDU_MAX_LEN_MASK GENMASK(21, 16)
> >     #define B_AX_RX_FLTR_CFG_MASK ((u32)~B_AX_RX_MPDU_MAX_LEN_MASK)
> >
> > so it looks like B_AX_RX_FLTR_CFG_MASK is not the proper mask for
> > this operation...
>
> The purpose of the statements is to update values excluding bits of
> B_AX_RX_MPDU_MAX_LEN_MASK. The use of B_AX_RX_FLTR_CFG_MASK is tricky, bu=
t
> the operation is correct because bit 0 is set, so __ffs(mask) returns 0 i=
n
> rtw89_write32_mask(). Then, operation looks like
>
>    orig =3D read(reg);
>    new =3D (orig & ~mask) | (data & mask);
>    write(new);
>
> Since we don't use FIELD_{GET,PREP} macros with B_AX_RX_FLTR_CFG_MASK, ho=
w
> can you find the problem? Please guide us. Thanks.

Isn't FIELD_MODIFY() what you want to use?

--=20
With Best Regards,
Andy Shevchenko

