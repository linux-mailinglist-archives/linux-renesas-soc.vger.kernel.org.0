Return-Path: <linux-renesas-soc+bounces-22142-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4F4B9160B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 15:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13AA218A36BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 13:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D39030ACF7;
	Mon, 22 Sep 2025 13:21:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076CF3064A7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 13:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758547272; cv=none; b=IK3ZEXYmdvtrcEINjfzF6u1I0jYlLWTwtsFh872ejbQafUKqsiYqUITQU8bzLu2Q7dFGMrW1RYKI/Ii8uC20HAu1gN3He01I5DeKSHqniV8rTevlJTOkkZbIeUfxiWLHdUFN49suOU8Hy1rS1Vq+zzLTC8IogyyEGGY8ecRJo80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758547272; c=relaxed/simple;
	bh=twHi5A9x4cQ/6G+wv9NhTj7Vvql2JLIedMZaL1HDcCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZuBfBLC9TAg2GT01oGNo/UhxwiKJSkjfAEeCUViIRqXPdQqPAKalRXk5xO0XwZQ4r9vtlRI0yBwLSkIM0ni/IuCdl/BJxXpHZYmvKi38IBrIoxr/cyxFophMtAdgOAbuOa6/7LPdSH0Er0G2cc9mWSWFcQTekKcd0TltgKe2h8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-54a8d35ebccso1754538e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 06:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758547268; x=1759152068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7oT2yfLN/4pYPbEtz7ZQcc5Ja0yXs/qEChj5LREg+X4=;
        b=YnbZBn9VazZRaVLeVWKCSogboyaXfHxiK8c2RdGcqnyPmLcREYbal8W0EI17dbqKpJ
         ln039LTEm+VVb7xp/V6M452P5TLcBxsJKn4iF9hOVzS+XeK5uik0daw6wk/17MCgJgOm
         Havcyvx5aPC9e25LK2tCvtRt1OMzq31Nq3TI1PzjfJUboOUsCk05EjqM8yWKPsA5AhD4
         AfULX1L49kH1ZApWJNX0kL4RXz+aYGAenVAzBhS92TAi0cck5lEitmx4Xn+GCUKMvC4d
         1yD/3UCnxBDEj+6/qkeUI6F2sIFLRFg+ASkeskYk5lwzKuipgytBgl4NcFda+N6k5z47
         fhbA==
X-Forwarded-Encrypted: i=1; AJvYcCWDp5iRwCDEuwumXTGYjjvftKG+d4MWMV7HLgE4ce0o750Ql3d1Zq9AF8LaxVVtU++ELb/mUnuZApUHJ/ecRf4iHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws8Gnylsh3QAwXUIq+jHAH8fAYztJBL88WrCIZxMEIo85Mnnkh
	W58NJIaVmlnRFWtQ3lwZv3Z2BFbhVEq8PHo7eZUCsswtLR7QvnZIjGKQsDCcEXBc
X-Gm-Gg: ASbGncu0TKYISk0TtLeT+tIjFYfLruGpsqtLbiPVHfhhY1aVbbaqr2kQq428u9MKd4O
	T7CKAbPr8ibbAgg6ed8fWEcl/3XdlEI0Vb96aq8yGKPyKQtpqecdU89RctQZ9n+cFahDh+AhDJ7
	+pvJJIilRuVXqhanOMWkhszX9JQUEj5m+fKk2oq+FLfeQ4CrwksnzMsrxMUu+w/JoLTqxd3lA0X
	073GTN4eyfaDf73g+AHvdHKjTVmfUu4ZS4wA12xJ6JQ0x4VmDKEmheCQGYcTt5Qd8Y235z7xzTf
	Ls3+qdVox3SxCYFnqST9rR/LFWwtuS7AQgAJQXL+n1Tzo25QXAstIupjqzDHFUw0WYWlbqOh23s
	iyC+nyhVFGCn9w+J4RuThn+YjyazBufzfz5pZXXvtPFd9sA9VpaUK4Wr5Tapja+AvAFFRMDU=
X-Google-Smtp-Source: AGHT+IHjsuuVf2uBvyJ92YRe7m56mOYN4Hxd/MVVzwm4tIOztbeReGQ9BLcFgCGitr66Wg4lhjTe+w==
X-Received: by 2002:a05:6122:1348:b0:535:e35d:49f4 with SMTP id 71dfb90a1353d-54a83894c5cmr4010031e0c.11.1758547268262;
        Mon, 22 Sep 2025 06:21:08 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a9b7918adsm1048648e0c.30.2025.09.22.06.21.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 06:21:07 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-890190d9f89so2076734241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 06:21:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXpu3ARb6hm07v7M18GUBYGj3OCNxTRVlbk6relmq1lJx3Mtv+a/MqtfMvoGqieK5IZLo++h36D9tjVIyimYwuT0Q==@vger.kernel.org
X-Received: by 2002:a05:6102:d8c:b0:521:ed06:1fc7 with SMTP id
 ada2fe7eead31-588bb9bf4c8mr3821613137.0.1758547267049; Mon, 22 Sep 2025
 06:21:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250921111557.103069-1-biju.das.jz@bp.renesas.com> <20250921111557.103069-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250921111557.103069-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 15:20:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWtpv325awR06pFA+_EHh5GZ90K6OEf5S6Wkg+_89uRBQ@mail.gmail.com>
X-Gm-Features: AS18NWDdF71ys-sJ9xzdE3pXCvKO4zAavWIwsnrvZsEZ2kjh3SpCcOFmdVkNVPA
Message-ID: <CAMuHMdWtpv325awR06pFA+_EHh5GZ90K6OEf5S6Wkg+_89uRBQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pinctrl: renesas: rzg2l: Drop the unnecessary pin configurations
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Sun, 21 Sept 2025 at 13:16, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> There is no need to reconfigure the pin if the pin's configuration values
> are same as the reset values. E.g.: PS0 pin configuration for NMI function
> is PMC = 1 and PFC = 0 and is same as that of reset values. Currently the
> code is first setting it to GPIO HI-Z state and then again reconfiguring
> to NMI function leading to spurious IRQ. Drop the unnecessary pin
> configurations from the driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * No change.
> v2->v3:
>  * Dropped extra space before the == operator.
>  * Moved spinlock acquire before reading pfc value.
>  * Make sure it is configured for function in PMC register for
>    skipping GPIO switch.

Thanks for the update!


> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -541,7 +541,11 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
>                                        u8 pin, u8 off, u8 func)
>  {
>         unsigned long flags;
> -       u32 reg;
> +       u32 reg, pfc;
> +
> +       pfc = readl(pctrl->base + PFC(off));
> +       if (((pfc >> (pin * 4)) & PFC_MASK)  == func)
> +               return;
>
>         spin_lock_irqsave(&pctrl->lock, flags);
>

Looks like you accidentally switched back to the code from v2?
Shall I take v3 instead?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

