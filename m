Return-Path: <linux-renesas-soc+bounces-24375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF3AC45AF3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 10:40:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6F583AD984
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 09:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08AD72FD684;
	Mon, 10 Nov 2025 09:39:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C481E47C5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 09:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762767564; cv=none; b=CKl0kg+koeuN9wC1Qy9U2qtN/rus649ZMDSVXr4vYuECpsQloUz4d7hQDR8tqGhfE40lk0A50SEgW7kKhPZBVy1vXPO4xmRToPQkOrTkV9AlBGypkqpJgc69bX/YVSj6kO36QdE/OBrukAME4YOqRhaiS8pu8rPJIiZw49T9TEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762767564; c=relaxed/simple;
	bh=SmCYeZZA+MZ4YAMzw1eRf/lethvMOqxmL8UnzEdKQB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jqR4rThpJWe3M3qFzp9q4XFroVicoCWTpkwjkXMYqUgD9bG+5j2hRmeYaVY0dWKoDdmkA92Eh8QRGesoMMtEpg0iZijI3kGKE+LkxZwQ+XKX0OY1A522z/b6NyupO7yGrJjXys1DP6vIuCZ6oDIpLFs2HLuB1dET2oYVPmwy5SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-54bc08ef45dso1655293e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 01:39:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762767561; x=1763372361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lsrcVDrEohRhH3DeIYD/Jz8ulaHSwnUzTLywFA/cyng=;
        b=M+FTEol1zI+cCNBsOoK9LchAMHh5FBP7MtElT+AxVjq/UrwBKK3ZmrlezRTU1OWe3Q
         LXZkAOW+qr1KnVO8o5uweBPMVaOhZIKmWMXoMjYSUgWEd1sRjJqVVbil4GbVNbHx4eTA
         GUTxXBvKuQMrg2h5UPVqLwzQaBf7fPsXemlR0z5XCTz8jj6MOV1OSwJgeZYnPH7eHNyV
         mi440eAb84WrYa07Q8jSKjNLr69srawGsLca8N7nhmWIL08RhjGSMbUzEbJ6n4/KAxMg
         lZcWasPfqYkSeqvEgEpw0zimX19kEONBU+2MgS9xDaYBK9pU1q1tLgEeshwWR9slWN6p
         dN9g==
X-Forwarded-Encrypted: i=1; AJvYcCWvz0N7NpRuG2SWSLawpcJCB+XJM/aVLa70+C+nbPLwKihCAnTudkS256e+0VAHR55WlM009wZpGbytb+wStmJVBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXrKOv3+jTGhQLrs3l8NE9KRaeAN+Ihh4ZtzThhp5A1MmgjJ17
	bvWlvQcxbwMgXqT7gZq7YS9ggnWBkv6E1tI1p8J1Ul3Zp4vC4mdK6qrQPchN+3M6
X-Gm-Gg: ASbGnctQI9r/i3mcMNIalfi3BawKH0W5RWFE7+nJdh4zcg3B+L7lPn5VrdM07UDzzBN
	K/xxQ/Rt8P6GkZoZxlB5Fbdj2o4NEQRi1TLgwg9AZ0vRyZHGTKqC9fmBxEsCYcrG5gdCogOk7Ns
	i02Ibi1tgAUvg+SUDWittp0HhsdRrAYaKvAm67EXfU+yxV94kIrfp/f08ibc5bDcuOzsA0PeznI
	YZhind1ySAhdj6RHEeG6Fe71ElLMGXpICMAcNLOteI+3S/xrjkgcNUVbJjquIPaBL21drRN60J9
	b9SRhs1iT+1y/eOq9z/ucExP/GIKrT+JBoWY0sYcHiPZcj4OCkQoWx3gyJDSYqLHIAmGyAzxYSJ
	/uxdI564Ow5xXmBKPNVLvUndVvNtOWlNIHBaEzkhb4l0stfhOrzDbAT2AKIGZuVbeDXJORLe3o1
	a+yABOcede6Dj70Ygl++jvj2IZmaJwwM+SAiDBcp0ZkPVOwg==
X-Google-Smtp-Source: AGHT+IF6SuW8PZZrpmnTm7hOThrEG013w2ezl1K9q41qtp21nNNYYucJqMEcwOqL0AyWvvcJe/Otug==
X-Received: by 2002:a05:6122:220f:b0:557:e2c4:48aa with SMTP id 71dfb90a1353d-559b32ad1e0mr2823095e0c.10.1762767561213;
        Mon, 10 Nov 2025 01:39:21 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-559957fb3c1sm7039555e0c.12.2025.11.10.01.39.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 01:39:21 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5598b58d816so1887978e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 01:39:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWPa2+raAVYkYiMmoFJqTAYBvkAMb94M6nfqAu/sx8ZP7FEiZNsxn/omx/A4pdU64D9f3WIQJNzvKQWIvxwWKDGRg==@vger.kernel.org
X-Received: by 2002:a05:6102:162a:b0:5dd:8a20:d6eb with SMTP id
 ada2fe7eead31-5ddc47517c6mr2576190137.25.1762767247552; Mon, 10 Nov 2025
 01:34:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1762435376.git.geert+renesas@glider.be> <cfc32f8530d5c0d4a7fb33c482a4bf549f26ec24.1762435376.git.geert+renesas@glider.be>
 <aQy0T2vUINze_6_q@smile.fi.intel.com> <CAMuHMdXVUJq36GvNUQE8FnHsX+=1jG4GOJ_034r=fgr_Rw4Djg@mail.gmail.com>
 <aQzIIqNnTY41giH_@smile.fi.intel.com> <CAMuHMdW8ndAdGnSHopYFMWvw7wk7wKz_7+N91M1jRHoqK1KBrg@mail.gmail.com>
 <c62eb5a727f149fb9d8b4a4c8d77418a@realtek.com> <CAHp75VeMqvywS20603yDSo-C3KCu+i+8vvDNuz3h9e8Ma9BOCw@mail.gmail.com>
In-Reply-To: <CAHp75VeMqvywS20603yDSo-C3KCu+i+8vvDNuz3h9e8Ma9BOCw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 10:33:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVUdey27RTX8mLsB5wsTfuW_mP_hF503AaF2QyS4awDcw@mail.gmail.com>
X-Gm-Features: AWmQ_bkW2UuenDn6w7Wole8ay3msAtk8Ugj-awLiClF7uVATEqk1c30upT0lUKU
Message-ID: <CAMuHMdVUdey27RTX8mLsB5wsTfuW_mP_hF503AaF2QyS4awDcw@mail.gmail.com>
Subject: Re: [PATCH v6 12/26] bitfield: Add less-checking __FIELD_{GET,PREP}()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
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

Hi Ady,

On Fri, 7 Nov 2025 at 09:00, Andy Shevchenko <andy.shevchenko@gmail.com> wr=
ote:
> On Fri, Nov 7, 2025 at 3:16=E2=80=AFAM Ping-Ke Shih <pkshih@realtek.com> =
wrote:
> > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Thu, 6 Nov 2025 at 17:09, Andy Shevchenko
> > > <andriy.shevchenko@intel.com> wrote:
> > > > On Thu, Nov 06, 2025 at 03:49:03PM +0100, Geert Uytterhoeven wrote:
> > > > > On Thu, 6 Nov 2025 at 15:44, Andy Shevchenko
> > > > > <andriy.shevchenko@intel.com> wrote:
> > > > > > On Thu, Nov 06, 2025 at 02:34:00PM +0100, Geert Uytterhoeven wr=
ote:
> > > > > > > The BUILD_BUG_ON_MSG() check against "~0ull" works only with =
"unsigned
> > > > > > > (long) long" _mask types.  For constant masks, that condition=
 is usually
> > > > > > > met, as GENMASK() yields an UL value.  The few places where t=
he
> > > > > > > constant mask is stored in an intermediate variable were fixe=
d by
> > > > > > > changing the variable type to u64 (see e.g. [1] and [2]).
> > > > > > >
> > > > > > > However, for non-constant masks, smaller unsigned types shoul=
d be valid,
> > > > > > > too, but currently lead to "result of comparison of constant
> > > > > > > 18446744073709551615 with expression of type ... is always
> > > > > > > false"-warnings with clang and W=3D1.
> > > > > > >
> > > > > > > Hence refactor the __BF_FIELD_CHECK() helper, and factor out
> > > > > > > __FIELD_{GET,PREP}().  The later lack the single problematic =
check, but
> > > > > > > are otherwise identical to FIELD_{GET,PREP}(), and are intend=
ed to be
> > > > > > > used in the fully non-const variants later.
> > >
> > > > > > > +     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >      =
         \
> > > > > > > +                      __bf_cast_unsigned(reg, ~0ull),       =
         \
> > > > > > > +                      pfx "type of reg too small for mask")
> > > > > >
> > > > > > Perhaps we may convert this (and others?) to static_assert():s =
at some point?
> > > > >
> > > > > Nick tried that before, without success:
> > > > > https://lore.kernel.org/all/CAKwvOdm_prtk1UQNJQGidZm44Lk582S3p=3D=
of0y46+rVjnSgXJg@mail.gmail.com
> > > >
> > > > Ah, this is unfortunate.
> > >
> > > Of course, it might be an actual bug in the i915 driver...
> > >
> > > The extra checking in field_prep() in case the compiler can
> > > determine that the mask is a constant already found a possible bug
> > > in drivers/net/wireless/realtek/rtw89/core.c:rtw89_roc_end():
> > >
> > >     rtw89_write32_mask(rtwdev, reg, B_AX_RX_FLTR_CFG_MASK, rtwdev->ha=
l.rx_fltr);
> > >
> > > drivers/net/wireless/realtek/rtw89/reg.h:
> > >
> > >     #define B_AX_RX_MPDU_MAX_LEN_MASK GENMASK(21, 16)
> > >     #define B_AX_RX_FLTR_CFG_MASK ((u32)~B_AX_RX_MPDU_MAX_LEN_MASK)
> > >
> > > so it looks like B_AX_RX_FLTR_CFG_MASK is not the proper mask for
> > > this operation...
> >
> > The purpose of the statements is to update values excluding bits of
> > B_AX_RX_MPDU_MAX_LEN_MASK. The use of B_AX_RX_FLTR_CFG_MASK is tricky, =
but
> > the operation is correct because bit 0 is set, so __ffs(mask) returns 0=
 in
> > rtw89_write32_mask(). Then, operation looks like
> >
> >    orig =3D read(reg);
> >    new =3D (orig & ~mask) | (data & mask);
> >    write(new);
> >
> > Since we don't use FIELD_{GET,PREP} macros with B_AX_RX_FLTR_CFG_MASK, =
how
> > can you find the problem? Please guide us. Thanks.
>
> Isn't FIELD_MODIFY() what you want to use?

FIELD_MODIFY() is a rather recent addition.
That is also the reason why I didn't add a non-const field_modify() yet
(I didn't want to risk delaying this series even more ;-)

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

